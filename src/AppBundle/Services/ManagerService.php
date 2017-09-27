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
     * @param $id
     * @return null|object
     */
    public function findOneById($id)
    {
        return $this->repository->findOneBy(['id' => $id]);
    }
}