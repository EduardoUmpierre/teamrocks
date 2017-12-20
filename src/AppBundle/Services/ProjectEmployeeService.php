<?php

namespace AppBundle\Services;

use AppBundle\Entity\Project;
use AppBundle\Entity\ProjectEmployee;
use Doctrine\ORM\EntityManager;

class ProjectEmployeeService
{
    private $em;
    private $repository;
    private $projectEmployeeSkillService;

    /**
     * ProjectEmployeeService constructor.
     */
    public function __construct(EntityManager $em, ProjectEmployeeSkillService $pess)
    {
        $this->em = $em;
        $this->repository = $this->em->getRepository('AppBundle:ProjectEmployee');
        $this->projectEmployeeSkillService = $pess;
    }

    /**
     * @param $team
     * @param Project $project
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function insert($team, Project $project)
    {
        foreach ($team as $key => $val) {
            $projectEmployee = new ProjectEmployee();
            $projectEmployee->setEmployee($val['employee']);
            $projectEmployee->setProject($project);
            $projectEmployee->setLevel(0);

            $this->em->persist($projectEmployee);
            $this->em->flush();

            foreach ($val['skills'] as $_key => $_val) {
                $this->projectEmployeeSkillService->insert($projectEmployee, $_key);
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

    /**
     * @param $employeeId
     * @return array
     */
    public function findEmployeeStatus($employeeId)
    {
        return $this->repository->findEmployeeStatus($employeeId);
    }

    /**
     * @param array $array
     * @return array
     */
    public function removeNonAvailableEmployees(array $array)
    {
        foreach ($array as $key => $val) {
            if (!$this->findEmployeeStatus($val['id'])) {
                unset($array[$key]);
            }
        }

        return $array;
    }

    /**
     * @param $id
     * @return mixed
     */
    public function findAllByEmployee($id)
    {
        return $this->repository->findAllByEmployee($id);
    }
}