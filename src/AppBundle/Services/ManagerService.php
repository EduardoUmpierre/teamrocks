<?php

namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;

class ManagerService
{
    private $repository;

    /**
     * ManagerService constructor.
     */
    public function __construct(EntityManager $em)
    {
        $this->repository = $em->getRepository('AppBundle:Manager');
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
     * @return \AppBundle\Entity\Manager
     */
    public function findOneById($id)
    {
        return $this->repository->findOneBy(['id' => $id]);
    }
}