<?php

namespace AppBundle\Controller;

use AppBundle\Services\EmployeeSkillService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * Class TeamController
 * @package AppBundle\Controller
 * @Route("/api/v1/teams")
 */
class TeamController extends Controller
{
    /**
     * @param Request $request
     * @param EmployeeSkillService $employeeSkillService
     * @return JsonResponse
     *
     * @Route("")
     * @Method("POST")
     */
    public function create(Request $request, EmployeeSkillService $employeeSkillService)
    {
        $data = json_decode($request->getContent(), true);

        try {
            $team = $employeeSkillService->getTeamByBacklog($data['backlog'], $data['quantity']);

            return new JsonResponse(['team' => $team]);
        } catch (\Exception $e) {
            return new JsonResponse(['message' => $e]);
        }
    }
}
