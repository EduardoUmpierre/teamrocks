<?php

namespace AppBundle\Services;

use AppBundle\Entity\ProjectTask;
use Doctrine\ORM\EntityManager;

class ProjectTaskService
{
    private $em;
    private $repository;

    /**
     * @param EntityManager $em
     * @param ManagerService $ms
     * @param SkillService $ss
     */
    public function __construct(EntityManager $em, ManagerService $ms, SkillService $ss)
    {
        $this->em = $em;
        $this->repository = $this->em->getRepository('AppBundle:ProjectTask');
        $this->skillService = $ss;
    }

    /**
     * @param $project
     * @param $backlog
     * @return array
     */
    public function getRequirementsByBacklog($project, $backlog)
    {
        $requirements = [];

        foreach ($backlog as $key => $val) {
            $this->insert($project, $val);

            if (
                (isset($requirements[$val['skill']]) && $requirements[$val['skill']] < $val['level']) ||
                !isset($requirements[$val['skill']])
            ) {
                $requirements[$val['skill']] = $val['level'];
            }
        }

        return $requirements;
    }

    /**
     * @param $project
     * @param $data
     */
    private function insert($project, $data)
    {
        $task = new ProjectTask();
        $task->setTitle($data['title']);
        $task->setDescription($data['description']);
        $task->setLevel($data['level']);
        $task->setSkill($this->skillService->findOneById($data['skill']));
        $task->setProject($project);

        $this->em->persist($task);
        $this->em->flush();
    }
}