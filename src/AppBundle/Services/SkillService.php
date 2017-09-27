<?php

namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;

class SkillService
{
    private $em;
    private $repository;

    /**
     * SkillService constructor.
     */
    public function __construct(EntityManager $em)
    {
        $this->em = $em;
        $this->repository = $this->em->getRepository('AppBundle:Skill');
    }

    /**
     * @param $name
     * @return null|object
     */
    public function findOneByName($name)
    {
        return $this->repository->findOneBy(['name' => $name]);
    }
}