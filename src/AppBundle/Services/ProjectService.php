<?php

namespace AppBundle\Services;

use AppBundle\Entity\Project;
use Doctrine\ORM\EntityManager;
use Symfony\Component\Config\Definition\Exception\Exception;

class ProjectService
{
    private $em;
    private $repository;
    private $managerService;
    private $employeeSkillService;
    private $projectEmployeeService;
    private $projectTaskService;

    /**
     * @param EntityManager $em
     * @param ManagerService $ms
     * @param EmployeeSkillService $ess
     * @param ProjectEmployeeService $pes
     * @param ProjectTaskService $pts
     */
    public function __construct(EntityManager $em, ManagerService $ms, EmployeeSkillService $ess, ProjectEmployeeService $pes, ProjectTaskService $pts)
    {
        $this->em = $em;
        $this->repository = $this->em->getRepository('AppBundle:Project');
        $this->managerService = $ms;
        $this->employeeSkillService = $ess;
        $this->projectEmployeeService = $pes;
        $this->projectTaskService = $pts;
    }

    /**
     * @param $id
     * @return null|object
     */
    public function findOneById($id)
    {
        return $this->repository->findOneBy(['id' => $id]);
    }

    /**
     * @return array
     */
    public function findAll()
    {
        return $this->repository->findAll();
    }

    /**
     * @param $id
     * @return mixed
     */
    public function findOneDataById($id)
    {
        $project = $this->repository->findOneArrayById($id);
        $project['team'] = $this->projectEmployeeService->findAllByProject($project['id']);

        return $project;
    }

    /**
     * @param $data
     * @return int
     */
    public function create($data)
    {
        try {
            $project = $this->insert($data);

            $requirements = $this->projectTaskService->getRequirementsByBacklog($project, $data['backlog']);

            $team = $this->employeeSkillService->getTeamByRequirements($requirements, $data['quantity']);
        } catch (Exception $e) {
            return $e;
        }

        $this->projectEmployeeService->insert($team, $project);

        return $project->getId();
    }

    /**
     * @param $data
     * @return Project
     */
    private function insert($data)
    {
        $project = new Project();
        $project->setTitle($data['title']);
        $project->setManager($this->managerService->findOneById($data['manager']));
        $project->setDescription($data['description']);
        $project->setDeadline(new \DateTime($data['deadline']));

        $this->em->persist($project);
        $this->em->flush();

        return $project;
    }
}