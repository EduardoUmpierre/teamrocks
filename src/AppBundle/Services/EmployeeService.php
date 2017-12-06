<?php

namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;

class EmployeeService
{
    private $repository;
    private $projectEmployeeService;

    /**
     * EmployeeService constructor.
     */
    public function __construct(EntityManager $em, ProjectEmployeeService $pes)
    {
        $this->repository = $em->getRepository('AppBundle:Employee');
        $this->projectEmployeeService = $pes;
    }

    /**
     * @return null|object
     */
    public function findAll()
    {
        $employees = $this->repository->findAll();

        foreach ($employees as $key => $val) {
            $employees[$key]['available'] = $this->projectEmployeeService->findEmployeeStatus($val['id']);
        }

        return $employees;
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