<?php

namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;

class EmployeeService
{
    private $repository;
    private $projectEmployeeService;
    private $employeeSkillService;

    /**
     * EmployeeService constructor.
     */
    public function __construct(EntityManager $em, ProjectEmployeeService $pes, EmployeeSkillService $ess)
    {
        $this->repository = $em->getRepository('AppBundle:Employee');
        $this->projectEmployeeService = $pes;
        $this->employeeSkillService = $ess;
    }

    /**
     * @return array
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

    /**
     * @param $id
     * @return mixed
     */
    public function findOneDataById($id)
    {
        $employee = $this->repository->findOneArrayById($id);
        $employee['skills'] = $this->employeeSkillService->findAllByEmployee($id);
        $employee['projects'] = $this->projectEmployeeService->findAllByEmployee($id);

        return $employee;
    }
}