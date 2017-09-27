<?php

namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;
use Symfony\Component\Config\Definition\Exception\Exception;

class EmployeeSkillService
{
    private $repository;

    /**
     * @param EntityManager $em
     */
    public function __construct(EntityManager $em)
    {
        $this->repository = $em->getRepository('AppBundle:EmployeeSkill');
    }

    /**
     * @param $skills
     * @return array
     */
    private function getAllBySkill($skills)
    {
        $employeesSkills = [];

        foreach ($skills as $key => $val) {
            $employeesSkills[$key] = $this->repository->getAllBySkill($key, $val);

            if (empty($employeesSkills[$key])) {
                throw new Exception('Impossível montar um time com os requisitos necessários');
            }
        }

        return $employeesSkills;
    }

    /**
     * @param $employeesSkills
     * @param $requirements
     * @return array
     */
    private function getTeamByLimit($employeesSkills, $requirements)
    {
        $requiredSkills = $requirements['skills'];
        $limit = $requirements['quantity'];
        $team = [];

        $employees = $this->normalizeEmployeesData($employeesSkills);

        foreach ($employees as $key => $val) {
            foreach ($val['skills'] as $_key => $_val) {
                if (isset($requiredSkills[$_val])) {
                    unset($requiredSkills[$_val]);

                    if ($this->verifyIfItsUnique($team, $val)) {
                        array_push($team, $val);
                    }
                }
            }

            if (empty($requiredSkills) && count($team) <= $limit) {
                return $team;
            }
        }

        throw new Exception('Impossível montar um time com os requisitos necessários');
    }

    /**
     * @param $employeesSkills
     * @return array
     */
    private function normalizeEmployeesData($employeesSkills)
    {
        $employees = [];

        foreach ($employeesSkills as $key => $val) {
            foreach ($val as $_key => $_val) {
                if (!isset($employees[$_val['id']])) {
                    $employees[$_val['id']] = [
                        'id' => $_val['id'],
                        'name' => $_val['name'],
                        'skills' => []
                    ];
                }

                array_push($employees[$_val['id']]['skills'], $key);
            }
        }

        usort($employees, function ($a, $b) {
            return count($b['skills']) - count($a['skills']);
        });

        return $employees;
    }

    /**
     * @param $team
     * @param $employee
     * @return bool
     */
    private function verifyIfItsUnique($team, $employee)
    {
        $unique = true;

        foreach ($team as $k => $v) {
            if ($v['id'] == $employee['id']) {
                $unique = false;
            }
        }

        return $unique;
    }

    /**
     * @param $requirements
     * @return array
     */
    public function getTeamByRequirements($requirements)
    {
        $employeesSkills = $this->getAllBySkill($requirements['skills']);

        return $this->getTeamByLimit($employeesSkills, $requirements);
    }
}