<?php

namespace AppBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * ProjectEmployee
 *
 * @ORM\Table(name="projects_employees")
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ProjectEmployeeRepository")
 */
class ProjectEmployee
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
     * @var int
     *
     * @ORM\Column(name="level", type="smallint")
     */
    private $level;

    /**
     * @ORM\ManyToOne(targetEntity="Employee")
     * @ORM\JoinColumn(name="id_employees", referencedColumnName="id")
     */
    private $employee;

    /**
     * @ORM\ManyToOne(targetEntity="Project", inversedBy="projectEmployee")
     * @ORM\JoinColumn(name="id_projects", referencedColumnName="id")
     */
    private $project;

    /**
     * @ORM\OneToMany(targetEntity="ProjectEmployeeSkill", mappedBy="projectEmployee", cascade={"remove"})
     */
    private $projectEmployeeSkill;

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
     * Project constructor.
     */
    public function __construct()
    {
        $this->projectEmployeeSkill = new ArrayCollection();
    }

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
     * Set level
     *
     * @param integer $level
     *
     * @return ProjectEmployee
     */
    public function setLevel($level)
    {
        $this->level = $level;

        return $this;
    }

    /**
     * Get level
     *
     * @return int
     */
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * Get employee
     *
     * @return Employee
     */
    public function getEmployee()
    {
        return $this->employee;
    }

    /**
     * Set employee
     *
     * @param Employee $employee
     *
     * @return $this
     */
    public function setEmployee(Employee $employee)
    {
        $this->employee = $employee;

        return $this;
    }

    /**
     * Get project
     *
     * @return Project
     */
    public function getProject()
    {
        return $this->project;
    }

    /**
     * Set project
     *
     * @param Project $project
     *
     * @return $this
     */
    public function setProject(Project $project)
    {
        $this->project = $project;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getProjectEmployeeSkill()
    {
        return $this->projectEmployeeSkill;
    }

    /**
     * @param mixed $projectEmployeeSkill
     */
    public function setProjectEmployeeSkill($projectEmployeeSkill)
    {
        $this->projectEmployeeSkill = $projectEmployeeSkill;
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

