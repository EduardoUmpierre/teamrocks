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
     * @param $quantity
     * @return array
     */
    private function getTeamByLimit($employeesSkills, $requirements, $quantity)
    {
        $team = [];

        $employees = $this->normalizeEmployeesData($employeesSkills);

        foreach ($employees as $key => $val) {
            foreach ($val['skills'] as $_key => $_val) {
                if (isset($requirements[$_val])) {
                    if ($this->verifyIfItsUnique($team, $val['id'])) {
                        $team[$val['id']] = [
                            'id' => $val['id'],
                            'name' => $val['name'],
                            'skills' => []
                        ];
                    }

                    $team[$val['id']]['skills'][$_val] = $requirements[$_val];

                    unset($requirements[$_val]);
                }
            }

            if (empty($requirements) && count($team) <= $quantity) {
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
     * @param $employeeId
     * @return bool
     */
    private function verifyIfItsUnique($team, $employeeId)
    {
        return !isset($team[$employeeId]);
    }

    /**
     * @param $requirements
     * @param $quantity
     * @return array
     */
    public function getTeamByRequirements($requirements, $quantity)
    {
        $employeesSkills = $this->getAllBySkill($requirements);

        return $this->getTeamByLimit($employeesSkills, $requirements, $quantity);
    }
}