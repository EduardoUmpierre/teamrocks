<?php

namespace AppBundle\Controller;

use AppBundle\Services\ProjectService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class ProjectController
 * @package AppBundle\Controller
 * @Route("/api/v1")
 */
class ProjectController extends Controller
{
    /**
     * @Route("/projects")
     * @Method("GET")
     */
    public function getAllAction(ProjectService $projectService)
    {
        return new JsonResponse($projectService->findAll());
    }

    /**
     * @Route("/projects/{id}")
     * @Method("GET")
     */
    public function getOneAction(ProjectService $projectService, $id)
    {
        return new JsonResponse($projectService->findOneDataById($id));
    }

    /**
     * @Route("/projects")
     * @Method("POST")
     */
    public function newAction(Request $request, ProjectService $projectService)
    {
        $project = json_decode($request->getContent(), true);

        $result = $projectService->create($project);

        if ($result instanceof Exception) {
            return new JsonResponse(['message' => $result->getMessage()], 400);
        }

        return new JsonResponse(['id' => $result], 201);
    }
}
