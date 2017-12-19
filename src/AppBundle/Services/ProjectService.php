<?php

namespace AppBundle\Services;

use AppBundle\Entity\Project;
use Doctrine\ORM\EntityManager;

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
    public function __construct(EntityManager $em, ManagerService $ms, EmployeeService $es, EmployeeSkillService $ess, ProjectEmployeeService $pes, ProjectTaskService $pts)
    {
        $this->em = $em;
        $this->repository = $this->em->getRepository('AppBundle:Project');
        $this->managerService = $ms;
        $this->employeeSkillService = $ess;
        $this->projectEmployeeService = $pes;
        $this->projectTaskService = $pts;
        $this->employeeService = $es;
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
        $project['tasks'] = $this->projectTaskService->findAllByProject($project['id']);

        return $project;
    }

    /**
     * @param $data
     * @param $team
     * @return int
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function create($data, $team)
    {
        $project = $this->insert($data);

        foreach ($team as $key => $val) {
            $team[$key]['employee'] = $this->employeeService->findOneById($val['id']);
        }

        $this->projectTaskService->insertBacklog($data['backlog'], $team, $project);
        $this->projectEmployeeService->insert($team, $project);

        return $project->getId();
    }

    /**
     * @param $data
     * @return Project
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    private function insert($data)
    {
        $project = new Project();
        $project->setTitle($data['title']);
        $project->setManager($this->managerService->findOneById($data['manager']));
        $project->setDescription($data['description']);
        $project->setDeadline(\DateTime::createFromFormat('d/m/Y', $data['deadline']));
        $project->setStatus(0);

        $this->em->persist($project);
        $this->em->flush();

        return $project;
    }

    /**
     * @param Project $project
     * @throws \Doctrine\ORM\OptimisticLockException
     */
    public function remove(Project $project)
    {
        $this->em->remove($project);
        $this->em->flush();
    }

    /**
     * @param $projectId
     * @param $status
     */
    public function updateStatus($projectId, $status)
    {
        $this->repository->updateStatus($projectId, $status);
    }
}