Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172746DFF0;
	Tue, 21 Jul 2026 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650793; cv=none; b=dDu1n11WuLWypj7EE8+4E9Qs2isygmKRVJyNiqu7c4JwR57aPofx5FxdQxSeM/VBj49I8jp+N0zks3HfAns3ndXjctqDmlSUTNcdYsMOCwZIisheAfwSKuACd4AAzQhNc2IJLSplrA0jrszFQ4DySu2o/pYehTkfiAnEf7h8L8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650793; c=relaxed/simple;
	bh=+pulZW1Hf3G6hw3FQ9y3FTBjpmSSXi8A55kH7d/YIPk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DSwmDFtj8MYeeTXip7+Wct7kXaM9YNvQLm4DrysiN4t6JOoeZYcTD3SagMC+hYxbTTV+0kF51ZjwIpqPDMkmzRtPBu8PJ0GVrR+XoTZiL+HWbwig54B4hQWxYEbnNHMqBlNh9kStUCizpiIts7QxqS+CLT88Qsp4Xj8rVkrDm1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjoRkJPR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjoRkJPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784650792; x=1816186792;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+pulZW1Hf3G6hw3FQ9y3FTBjpmSSXi8A55kH7d/YIPk=;
  b=fjoRkJPRCE9JZ/E9SJgwFf+lcCErp4T51BQz3a0uMCWlXHdstf9q8dYG
   2BrD7d1VMN4FznUtRJJZkfeV1W1OipPb8SrUQmug4/hSI9z2OXL/cg2OP
   /B6Qa526GhgfwYXrGuRvUymoF1IsscuAZhon7MynuzEucrnIS0N4q82DF
   Ks0rwlLAaNUPrxKX2SgPEfDE3VjkXf3lF7EK6vJYox6Fo7bmCLfVQ5sNL
   mqWkFyckKy9KIetH+oWla+J0ZOj5eEGBa+J13d5OFt1ZArYnF3tO287rj
   jsqWk0EvbozngMWSQjKBy4M+OlWheu+w3SGonCkye7boakZ7VeCC4GnGW
   A==;
X-CSE-ConnectionGUID: na5pKtgLTHym1gKiXpmXPA==
X-CSE-MsgGUID: wTB096DnTGyBxF94KypVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84387801"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="84387801"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:19:51 -0700
X-CSE-ConnectionGUID: fH2Q4k1ZQpGUXQS1Tv4s5A==
X-CSE-MsgGUID: 7SUZkWKETo6ssAtaOEPgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="254397952"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:19:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 19:19:42 +0300 (EEST)
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Matthew Brost <matthew.brost@intel.com>, 
    =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
    Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
    driver-core@lists.linux.dev
Subject: Re: [PATCH v7 1/4] platform/surface: gpe: use
 platform_device_register_full()
In-Reply-To: <20260713-swnode-remove-on-dev-unreg-v7-1-6d6bc448427a@oss.qualcomm.com>
Message-ID: <51d2d692-ba40-3035-fac2-a9e8e98e6d99@linux.intel.com>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com> <20260713-swnode-remove-on-dev-unreg-v7-1-6d6bc448427a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-354480049-1784650782=:1265"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-354480049-1784650782=:1265
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 Jul 2026, Bartosz Golaszewski wrote:

> Creating a software node for a given set of properties and adding it to
> a platform device can be achieved with a single call to
> platform_device_register_full(). There's nothing in this driver that
> suggests using the more fine-grained interfaces was intentional so
> switch to using the high-level helper.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/platform/surface/surface_gpe.c | 39 ++++++++++------------------=
------
>  1 file changed, 11 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/su=
rface/surface_gpe.c
> index 40896a8544b0a4da4261ea881b1eaed62d93b32b..4ca7ad76f3b9d2b6c455a5d5b=
37f23a85eb69c69 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -290,9 +290,9 @@ static struct platform_device *surface_gpe_device;
> =20
>  static int __init surface_gpe_init(void)
>  {
> +=09struct platform_device_info pdevinfo;
>  =09const struct dmi_system_id *match;
>  =09struct platform_device *pdev;
> -=09struct fwnode_handle *fwnode;
>  =09int status;
> =20
>  =09match =3D dmi_first_match(dmi_lid_device_table);
> @@ -305,44 +305,27 @@ static int __init surface_gpe_init(void)
>  =09if (status)
>  =09=09return status;
> =20
> -=09fwnode =3D fwnode_create_software_node(match->driver_data, NULL);
> -=09if (IS_ERR(fwnode)) {
> -=09=09status =3D PTR_ERR(fwnode);
> -=09=09goto err_node;
> -=09}
> -
> -=09pdev =3D platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
> -=09if (!pdev) {
> -=09=09status =3D -ENOMEM;
> -=09=09goto err_alloc;
> +=09pdevinfo =3D (struct platform_device_info){
> +=09=09.name =3D "surface_gpe",
> +=09=09.id =3D PLATFORM_DEVID_NONE,
> +=09=09.properties =3D match->driver_data,
> +=09};
> +
> +=09pdev =3D platform_device_register_full(&pdevinfo);
> +=09if (IS_ERR(pdev)) {

Hi,

Please add an include for this and PTR_ERR().

With the missing include fixed,

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Thanks for doing these.

> +=09=09platform_driver_unregister(&surface_gpe_driver);
> +=09=09return PTR_ERR(pdev);
>  =09}

--=20
 i.


> =20
> -=09platform_device_set_fwnode(pdev, fwnode);
> -
> -=09status =3D platform_device_add(pdev);
> -=09if (status)
> -=09=09goto err_add;
> -
>  =09surface_gpe_device =3D pdev;
>  =09return 0;
> -
> -err_add:
> -=09platform_device_put(pdev);
> -err_alloc:
> -=09fwnode_remove_software_node(fwnode);
> -err_node:
> -=09platform_driver_unregister(&surface_gpe_driver);
> -=09return status;
>  }
>  module_init(surface_gpe_init);
> =20
>  static void __exit surface_gpe_exit(void)
>  {
> -=09struct fwnode_handle *fwnode =3D surface_gpe_device->dev.fwnode;
> -
>  =09platform_device_unregister(surface_gpe_device);
>  =09platform_driver_unregister(&surface_gpe_driver);
> -=09fwnode_remove_software_node(fwnode);
>  }
>  module_exit(surface_gpe_exit);
--8323328-354480049-1784650782=:1265--
