<?php

namespace AppBundle\Controller;

use AppBundle\Services\EmployeeService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Class EmployeeController
 * @package AppBundle\Controller
 * @Route("/api/v1/employees")
 */
class EmployeeController extends Controller
{
	/**
     * @Route("")
     * @Method("GET")
     */
    public function indexAction(EmployeeService $employeeService)
    {
        return new JsonResponse($employeeService->findAll());
    }

    /**
     * @Route("/{id}")
     * @Method("GET")
     */
    public function showAction(EmployeeService $employeeService, $id)
    {
        return new JsonResponse($employeeService->findOneDataById($id));
    }
}
