<?php

namespace AppBundle\Controller;

use AppBundle\Services\ProjectService;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\Request;

class ProjectController extends Controller
{
    /**
     * @Route("/projeto/novo", name="new_project")
     */
    public function newAction(Request $request, ProjectService $projectService)
    {
        $requirements = [
            'skills' => [
                'php' => mt_rand(1, 3),
                'css' => mt_rand(1, 3),
                'html' => mt_rand(1, 3)
            ],
            'quantity' => mt_rand(2, 3)
        ];

        $project = [
            'title' => 'Projeto 1',
            'description' => 'Temos esse projeto pra fazer',
            'deadline' => new \DateTime('tomorrow'),
            'manager' => 1,
            'requirements' => $requirements
        ];

        $project = $projectService->create($project);

        if ($project instanceof Exception) {
            return $this->redirectToRoute('homepage', ['message' => $project->getMessage()]);
        }

        return $this->redirectToRoute('detail_project', ['id' => $project]);
    }

    /**
     * @Route("/projeto/{id}", name="detail_project")
     */
    public function detailAction(Request $request, $id, ProjectService $projectService)
    {
        $project = $projectService->findOneById($id);

        return $this->render('project/detail.html.twig', [
            'project' => $project
        ]);
    }
}
