<?php

namespace AppBundle\Controller;

use AppBundle\Services\SkillService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * Class SkillController
 * @package AppBundle\Controller
 * @Route("/api/v1")
 */
class SkillController extends Controller
{
    /**
     * @Route("/skills")
     * @Method("GET")
     */
    public function indexAction(SkillService $skillService)
    {
        return new JsonResponse($skillService->findAll());
    }
}
