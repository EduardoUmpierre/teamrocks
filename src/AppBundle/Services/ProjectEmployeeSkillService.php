<?php

namespace AppBundle\Services;

use AppBundle\Entity\ProjectEmployee;
use AppBundle\Entity\ProjectEmployeeSkill;
use Doctrine\ORM\EntityManager;

class ProjectEmployeeSkillService
{
    private $em;
    private $skillService;

    /**
     * ProjectEmployeeSkillService constructor.
     */
    public function __construct(EntityManager $em, SkillService $ss)
    {
        $this->em = $em;
        $this->skillService = $ss;
    }

    /**
     * @param ProjectEmployee $projectEmployee
     * @param $skill
     */
    public function insert(ProjectEmployee $projectEmployee, $skill)
    {
        $projectEmployeeSkill = new ProjectEmployeeSkill();
        $projectEmployeeSkill->setProjectEmployee($projectEmployee);
        $projectEmployeeSkill->setSkill($this->skillService->findOneByName($skill));

        $this->em->persist($projectEmployeeSkill);
        $this->em->flush();
    }
}