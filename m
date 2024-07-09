Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA912D210
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jul 2024 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520676; cv=none; b=gcc72mPspichKTOvVu+eF2L9hUXqWgnXEbyPGwiP7Z7GvvJIr4Dt5ByXST2j0H1U6g2Sq5Wkov502DzMARnOKIdkOOtTIZzO9HwPelJNsPNE7jXBlpV+9mveVkyGm0cMetoJ7POzjtctkMGVZqXCFfAIlTgkFsGAVAk8DV87rmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520676; c=relaxed/simple;
	bh=K8kcIbVcdD9sLpb0NTFfz8LkWgrzomg3EFv2pemfF4o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XvWm3yZbkJMErDKPzY9pTz5SWFFT17xE5WY4fVs9qWcMO/lMFjxQo7Sqp8pJPUmGjrJXNbyd2/a+8PrMvrRU7tqi1ZMehRJByc5Qx1KClTB4iAZeFmFskyWEIv05Jx7D3LM5Xa2cuoGCmdP9eLg5fEfczdyEaLoS9p/KDVUo2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AawzsaVr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AawzsaVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720520675; x=1752056675;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K8kcIbVcdD9sLpb0NTFfz8LkWgrzomg3EFv2pemfF4o=;
  b=AawzsaVrZ2PHobzvemgSlyUCEyZ3vU6EmhUskfjHQmBhC4nH2b/d73Hx
   8XtNWipASale/EIzDNMN2RXBTCNGYxFVbTYVQ2vq1fqqnjVIwnMcPPKKN
   jRmh5OpSO/VybHlmNd6+7biIwCUEj86mXEFZXzlOyHhNN8ku0NV8eiQSD
   ktxyubuQWsUFGdlnuI0bMwB/X5xmylA6biIofuh++E7bOqoQKCehXdbUM
   1vwajtzu7rhISrY7R9LR0HO7brqydbJ6YoTijzT2CgDJ0QCjPqdLF1+e5
   6NgGpTFnGt8VNIdFOnOjTs+LGSAb4uzUg+U0cORXYAkpdsVsYpaZOmseM
   Q==;
X-CSE-ConnectionGUID: NBGVT+r+SmWC1JV0CxCNIw==
X-CSE-MsgGUID: jPXYQxESTVOtv29rzI0Wmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21581123"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="21581123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:24:34 -0700
X-CSE-ConnectionGUID: /GdX7cONScOLa1PDkArY7A==
X-CSE-MsgGUID: kSU7SRb4TNWbYyIlsMwIAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="52752059"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.123])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:24:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jul 2024 13:24:25 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 02/10] platform/x86/amd/hsmp: Create wrapper function
 init_acpi()
In-Reply-To: <20240627053958.2533860-3-suma.hegde@amd.com>
Message-ID: <a9a9b967-b656-fd75-479d-1558f1e4e567@linux.intel.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com> <20240627053958.2533860-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-642881213-1720520665=:1103"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-642881213-1720520665=:1103
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 27 Jun 2024, Suma Hegde wrote:

> This is in preparation to splitting ACPI and platform device drivers.
> Having init_acpi() helps in smooth code movement.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 91 ++++++++++++++++++----------
>  1 file changed, 59 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 8fcf38eed7f0..10ab9b2437f1 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -778,6 +778,11 @@ static int init_platform_device(struct device *dev)
>  =09=09=09dev_err(dev, "Is HSMP disabled in BIOS ?\n");
>  =09=09=09return ret;
>  =09=09}
> +=09=09ret =3D hsmp_cache_proto_ver(i);
> +=09=09if (ret) {
> +=09=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
> +=09=09=09return ret;
> +=09=09}
>  =09}
> =20
>  =09return 0;
> @@ -789,10 +794,53 @@ static const struct acpi_device_id amd_hsmp_acpi_id=
s[] =3D {
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> =20
> +static bool check_acpi_support(struct device *dev)
> +{
> +=09struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +
> +=09if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> +=09=09return true;
> +
> +=09return false;
> +}
> +
> +static int init_acpi(struct device *dev)
> +{
> +=09u16 sock_ind;
> +=09int ret;
> +
> +=09ret =3D hsmp_get_uid(dev, &sock_ind);
> +=09if (ret)
> +=09=09return ret;
> +=09if (sock_ind >=3D plat_dev.num_sockets)
> +=09=09return -EINVAL;
> +
> +=09ret =3D hsmp_parse_acpi_table(dev, sock_ind);
> +=09if (ret) {
> +=09=09dev_err(dev, "Failed to parse ACPI table\n");
> +=09=09return ret;
> +=09}
> +
> +=09/* Test the hsmp interface */
> +=09ret =3D hsmp_test(sock_ind, 0xDEADBEEF);
> +=09if (ret) {
> +=09=09dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> +=09=09=09boot_cpu_data.x86, boot_cpu_data.x86_model);
> +=09=09dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hsmp_cache_proto_ver(sock_ind);
> +=09if (ret) {
> +=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
> +=09=09return ret;
> +=09}
> +
> +=09return ret;
> +}
> +
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
> -=09struct acpi_device *adev;
> -=09u16 sock_ind =3D 0;
>  =09int ret;
> =20
>  =09/*
> @@ -809,46 +857,25 @@ static int hsmp_pltdrv_probe(struct platform_device=
 *pdev)
>  =09=09if (!plat_dev.sock)
>  =09=09=09return -ENOMEM;
>  =09}
> -=09adev =3D ACPI_COMPANION(&pdev->dev);
> -=09if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
> -=09=09ret =3D hsmp_get_uid(&pdev->dev, &sock_ind);
> -=09=09if (ret)
> -=09=09=09return ret;
> -=09=09if (sock_ind >=3D plat_dev.num_sockets)
> -=09=09=09return -EINVAL;
> -=09=09ret =3D hsmp_parse_acpi_table(&pdev->dev, sock_ind);
> -=09=09if (ret) {
> -=09=09=09dev_err(&pdev->dev, "Failed to parse ACPI table\n");
> -=09=09=09return ret;
> -=09=09}
> -=09=09/* Test the hsmp interface */
> -=09=09ret =3D hsmp_test(sock_ind, 0xDEADBEEF);
> +=09if (check_acpi_support(&pdev->dev)) {
> +=09=09ret =3D init_acpi(&pdev->dev);
>  =09=09if (ret) {
> -=09=09=09dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%=
x\n",
> -=09=09=09=09boot_cpu_data.x86, boot_cpu_data.x86_model);
> -=09=09=09dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
> +=09=09=09dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>  =09=09=09return ret;
>  =09=09}
> +=09=09ret =3D hsmp_create_acpi_sysfs_if(&pdev->dev);
> +=09=09if (ret)
> +=09=09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>  =09} else {
>  =09=09ret =3D init_platform_device(&pdev->dev);
>  =09=09if (ret) {
>  =09=09=09dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>  =09=09=09return ret;
>  =09=09}
> -=09}
> -
> -=09ret =3D hsmp_cache_proto_ver(sock_ind);
> -=09if (ret) {
> -=09=09dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
> -=09=09return ret;
> -=09}
> -
> -=09if (plat_dev.is_acpi_device)
> -=09=09ret =3D hsmp_create_acpi_sysfs_if(&pdev->dev);
> -=09else
>  =09=09ret =3D hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -=09if (ret)
> -=09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +=09=09if (ret)
> +=09=09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +=09}
> =20
>  =09if (!plat_dev.is_probed) {
>  =09=09plat_dev.hsmp_device.name=09=3D HSMP_CDEV_NAME;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-642881213-1720520665=:1103--
