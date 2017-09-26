<?php

namespace AppBundle\Model;

use AppBundle\Entity\Company;

interface UserInterface
{
    /**
     * @return mixed
     */
    public function getId();

    /**
     * @param $name
     * @return mixed
     */
    public function setName($name);

    /**
     * @return mixed
     */
    public function getName();

    /**
     * @return mixed
     */
    public function getCompany();

    /**
     * @param Company $company
     * @return mixed
     */
    public function setCompany(Company $company);

    /**
     * @return mixed
     */
    public function getCreatedAt();

    /**
     * @return mixed
     */
    public function setCreated();

    /**
     * @return mixed
     */
    public function getUpdatedAt();

    /**
     * @return mixed
     */
    public function setUpdated();
}