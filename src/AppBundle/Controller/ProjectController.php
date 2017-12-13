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
 * @Route("/api/v1/projects")
 */
class ProjectController extends Controller
{
    /**
     * @Route("")
     * @Method("GET")
     */
    public function indexAction(ProjectService $projectService)
    {
        return new JsonResponse($projectService->findAll());
    }

    /**
     * @Route("/{id}")
     * @Method("GET")
     */
    public function showAction(ProjectService $projectService, $id)
    {
        return new JsonResponse($projectService->findOneDataById($id));
    }

    /**
     * @Route("")
     * @Method("POST")
     */
    public function newAction(Request $request, ProjectService $projectService)
    {
        $project = json_decode($request->getContent(), true);

        $result = $projectService->create($project['project'], $project['team']);

        if ($result instanceof Exception) {
            return new JsonResponse(['message' => $result->getMessage()], 400);
        }

        return new JsonResponse(['id' => $result], 201);
    }

    /**
     * @Route("/status")
     * @Method("PUT")
     */
    public function updateStatusAction(Request $request, ProjectService $projectService)
    {
        $data = json_decode($request->getContent(), true);

        try {
            $projectService->updateStatus($data['id'], $data['status']);
        } catch (Exception $e) {
            return new JsonResponse(['message' => $e->getMessage()]);
        }

        return new Response(null, 200);
    }
}
