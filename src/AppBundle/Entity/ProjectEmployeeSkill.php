<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProjectEmployeeSkill
 *
 * @ORM\Table(name="projects_employees_skills")
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProjectEmployeeSkillRepository")
 */
class ProjectEmployeeSkill
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="ProjectEmployee", inversedBy="projectEmployeeSkill")
     * @ORM\JoinColumn(name="id_projects_employees", referencedColumnName="id")
     */
    private $projectEmployee;

    /**
     * @ORM\ManyToOne(targetEntity="Skill")
     * @ORM\JoinColumn(name="id_skills", referencedColumnName="id")
     */
    private $skill;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=true)
     */
    private $createdAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getProjectEmployee()
    {
        return $this->projectEmployee;
    }

    /**
     * @param mixed $projectEmployee
     */
    public function setProjectEmployee($projectEmployee)
    {
        $this->projectEmployee = $projectEmployee;
    }

    /**
     * @return mixed
     */
    public function getSkill()
    {
        return $this->skill;
    }

    /**
     * @param mixed $skill
     */
    public function setSkill($skill)
    {
        $this->skill = $skill;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * @ORM\PrePersist
     */
    public function setCreated()
    {
        $this->createdAt = new \DateTime('NOW', new \DateTimeZone('America/Sao_Paulo'));
    }

    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setUpdated()
    {
        $this->updatedAt = new \DateTime('NOW', new \DateTimeZone('America/Sao_Paulo'));
    }
}

