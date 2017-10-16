<?php

namespace AppBundle\Controller;

use AppBundle\Services\ManagerService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Class ManagerController
 * @package AppBundle\Controller
 * @Route("/api/v1/managers")
 */
class ManagerController extends Controller
{
    /**
     * @Route("")
     * @Method("GET")
     *
     * @param ManagerService $managerService
     * @return JsonResponse
     */
    public function indexAction(ManagerService $managerService)
    {
        return new JsonResponse($managerService->findAll());
    }
}
