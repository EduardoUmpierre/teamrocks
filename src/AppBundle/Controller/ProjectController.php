<?php

namespace AppBundle\Controller;

use AppBundle\Services\ProjectService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Class ProjectController
 * @package AppBundle\Controller
 * @Route("/api/v1")
 *
 * @todo Inserir prefixo de controller api/v1
 * @todo Migrar todo o funcionamento para API RESTful
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

        $projectService->create($project);

        return new Response(null, 201);
    }
}
