<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * EmployeeSkill
 *
 * @ORM\Table(name="employees_skills")
 * @ORM\HasLifecycleCallbacks()
 * @ORM\Entity(repositoryClass="AppBundle\Repository\EmployeeSkillRepository")
 */
class EmployeeSkill
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
     * @ORM\ManyToOne(targetEntity="Employee")
     * @ORM\JoinColumn(name="id_employees", referencedColumnName="id")
     */
    private $employee;

    /**
     * @ORM\ManyToOne(targetEntity="Skill")
     * @ORM\JoinColumn(name="id_skills", referencedColumnName="id")
     */
    private $skill;

    /**
     * @var int
     *
     * @ORM\Column(name="level", type="smallint")
     */
    private $level;

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
     * Set skill
     *
     * @return Skill
     */
    public function getSkill()
    {
        return $this->skill;
    }

    /**
     * Set skill
     *
     * @param Skill $skill
     *
     * @return $this
     */
    public function setSkill(Skill $skill)
    {
        $this->skill = $skill;

        return $this;
    }

    /**
     * @return int
     */
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * @param int $level
     */
    public function setLevel($level)
    {
        $this->level = $level;
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

