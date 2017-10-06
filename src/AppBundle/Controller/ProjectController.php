<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Project;
use AppBundle\Services\ProjectService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

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

        dump($project);

        exit;

        $project = $projectService->create($project);

        if ($project instanceof Exception) {
            return $this->redirectToRoute('homepage', ['message' => $project->getMessage()]);
        }

        return $this->redirectToRoute('detail_project', ['id' => $project]);
    }
}
