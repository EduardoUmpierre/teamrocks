<?php

namespace AppBundle\Services;

use AppBundle\Entity\Project;
use AppBundle\Entity\ProjectEmployee;
use Doctrine\ORM\EntityManager;

class ProjectEmployeeService
{
    private $em;
    private $repository;
    private $employeeService;
    private $projectEmployeeSkillService;

    /**
     * ProjectEmployeeService constructor.
     */
    public function __construct(EntityManager $em, EmployeeService $es, ProjectEmployeeSkillService $pess)
    {
        $this->em = $em;
        $this->repository = $this->em->getRepository('AppBundle:ProjectEmployee');
        $this->employeeService = $es;
        $this->projectEmployeeSkillService = $pess;
    }

    /**
     * @param $team
     * @param Project $project
     */
    public function insert($team, Project $project)
    {
        foreach ($team as $key => $val) {
            $projectEmployee = new ProjectEmployee();
            $projectEmployee->setEmployee($this->employeeService->findOneById($val['id']));
            $projectEmployee->setProject($project);
            $projectEmployee->setLevel(0);

            $this->em->persist($projectEmployee);
            $this->em->flush();

            foreach ($val['skills'] as $_key => $_val) {
                $this->projectEmployeeSkillService->insert($projectEmployee, $_val);
            }
        }
    }

    /**
     * @param $projectId
     * @return mixed
     */
    public function findAllByProject($projectId)
    {
        $team = $this->repository->findAllByProject($projectId);

        foreach ($team as $key => $val) {
            $team[$key]['skills'] = $this->projectEmployeeSkillService->findAllByProjectEmployee($val['pe_id']);
        }

        return $team;
    }
}