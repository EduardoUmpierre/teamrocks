<?php

namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;
use Symfony\Component\Config\Definition\Exception\Exception;

class EmployeeSkillService
{
    private $repository;
    private $projectTaskService;
    private $projectEmployeeService;

    /**
     * @param EntityManager $em
     */
    public function __construct(EntityManager $em, ProjectTaskService $pts, ProjectEmployeeService $pes)
    {
        $this->repository = $em->getRepository('AppBundle:EmployeeSkill');
        $this->projectTaskService = $pts;
        $this->projectEmployeeService = $pes;
    }

    /**
     * @param $skills
     * @return array
     */
    private function getAllBySkill($skills)
    {
        $employeesSkills = [];

        foreach ($skills as $key => $val) {
            $employeesSkills[$key] = $this->projectEmployeeService->removeNonAvailableEmployees($this->repository->getAllBySkill($key, $val));

            if (empty($employeesSkills[$key])) {
                throw new Exception('Impossível montar um time com os requisitos necessários');
            }
        }

        return $employeesSkills;
    }

    /**
     * @param $requirements
     * @param $quantity
     * @return array
     */
    private function getTeamByLimit($requirements, $quantity)
    {
        $team = [];

        $employees = $this->normalizeEmployeesData($this->getAllBySkill($requirements));

        foreach ($employees as $key => $val) {
            foreach ($val['skills'] as $_key => $_val) {
                if (isset($requirements[$_val['id']])) {
                    if ($this->verifyIfItsUnique($team, $val['id'])) {
                        $team[$val['id']] = [
                            'id' => $val['id'],
                            'name' => $val['name'],
                            'skills' => []
                        ];
                    }

                    $team[$val['id']]['skills'][$_val['id']] = [
                        'level' => $requirements[$_val['id']],
                        'name' => $_val['name']
                    ];

                    unset($requirements[$_val['id']]);
                }
            }

            if (empty($requirements) && count($team) <= $quantity) {
                return $team;
            }
        }

        /**
         * @todo Retornar as habilidades que impossibilitaram a criação do time
         */
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

                array_push($employees[$_val['id']]['skills'], [
                    'id' => $key,
                    'name' => $_val['skill']
                ]);
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
     * @param $backlog
     * @param $quantity
     * @return array
     */
    public function getTeamByBacklog($backlog, $quantity)
    {
        $requirements = $this->projectTaskService->getRequirementsByBacklog($backlog);

        return $this->getTeamByLimit($requirements, $quantity);
    }
}