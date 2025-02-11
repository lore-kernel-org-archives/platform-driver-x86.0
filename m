Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF6422D4C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285573; cv=none; b=de+UKHYcUY8ZP6W+7vA1Y2pElPC7yENt3QbX1jmrxyWvO6od7BaNNjXkuWGGinRVvHSAY8j7NuThe+i1gX+xrGXYOJPFn94d4HaiJGI4poW+zx0OkWJnUQZGxLVmiNOxU2XT98Owgu6Hr5U3PiIhnrm/EtBbqiYY5FrMG6nIBXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285573; c=relaxed/simple;
	bh=pClRSUDqQbd81cOYbNFPBF0ZXdhuiF70wTFkESAdeMQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a2XvPO5DOhhn8fNmXeo7yd7qOAVU0iRwpq4BMSJC6QMmJQslbJ/jJWBlsalHaUNHlHzxtL1nmxjFQRAWxtSc0ZFlFGo8qDfzK9BsvceSyOy8KP/E2hDiCs+B9XoKSDrbPS/hqNpa88Eo/0fu7LFQRFywT8fO1gYFQAkWczS5jTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzWyOO6e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzWyOO6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285572; x=1770821572;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pClRSUDqQbd81cOYbNFPBF0ZXdhuiF70wTFkESAdeMQ=;
  b=fzWyOO6eoZnBPnb67A/lIz25V7LS+cwvbmg2kdJGJs3ykoMyIb0gY3Yx
   tXr/gO2qyNRMYiJ4+tF/HnQRe0otGybnaJwg+Sh3i+XBuHT2b1h/CydKp
   9a49DBblub/9z7hBVeOhXjIzJzDS/0+jX4KnZxotxk8xIitCRJo6XCRDk
   D/28/eGD0aMYovSQHm0FBLjVsTMrAmmgpNrZBoOaa5jk/kRopJFZFtANv
   QqAwFf6e0DbcEdzagphxbTWzk4yMLLUp6k6Fubjv7ZS7LOG3dpUsm3y9j
   +FKNNXeLMeRzFkIqgVTJJ9kAg6dlBBegsK+BK8BZNxij1K7AdDN+KV7si
   A==;
X-CSE-ConnectionGUID: AhqvLsD8QZCv/gycmsuvNQ==
X-CSE-MsgGUID: Dvmd2vLjRa2YbvANWdHMzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43835286"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43835286"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:52:51 -0800
X-CSE-ConnectionGUID: lBeBSDc5TFSkfUTb7iOMtg==
X-CSE-MsgGUID: 0a/e2Mn7QeC4RZJCMeyqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117612613"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:52:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 16:52:45 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 5/9] platform: mellanox: Introduce support of Nvidia
 smart switch
In-Reply-To: <20250211091912.36787-6-vadimp@nvidia.com>
Message-ID: <9966de14-ffbb-b134-6f5f-d5e181874fef@linux.intel.com>
References: <20250211091912.36787-1-vadimp@nvidia.com> <20250211091912.36787-6-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-173801367-1739285565=:4237"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-173801367-1739285565=:4237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Feb 2025, Vadim Pasternak wrote:

> Provide platform support for Nvidia Smart Switch SN4280.
>=20
> The Smart Switch equipped with:
> - Nvidia COME module based on AMD EPYC=E2=84=A2 Embedded 3451 CPU.
> - Nvidia Spectrum-3 ASIC.
> - Four DPUs, each equipped with Nvidia BF3 ARM based processor and
>   with Lattice LFD2NX-40 FPGA device.
> - 28xQSFP-DD external ports.
> - Two power supplies.
> - Four cooling drawers.
>=20
> Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v5->v6
> Comments pointed out by Ilpo:
> - Add missing coma in structure 'mlxplat_mlxcpld_xdr_led_data'.
> - Merge lines in structure 'mlxplat_mlxcpld_regmap_smart_switch'.
> - s/int/unsigned int/ in 'mlxplat_dmi_smart_switch_matched'.
>=20
> v4->v5
> Comments pointed out by Ilpo:
> - Add blank lines in mlxplat_dmi_smart_switch_matched().
> - Style fixes: remove empty space after the condition fix while() loop.
> ---
>  drivers/platform/mellanox/mlx-platform.c | 1966 +++++++++++++++++++---
>  1 file changed, 1712 insertions(+), 254 deletions(-)
>=20

> @@ -6390,8 +7829,25 @@
>  =09=09}
>  =09}
> =20
> +=09/* Add DPU drivers. */
> +=09for (i =3D 0; i < MLXPLAT_CPLD_DPU_MAX_DEVS; i++) {
> +=09=09if (mlxplat_dpu_data[i]) {

You can reverse the logic and use continue to lower the indentation level.

> +=09=09=09priv->pdev_dpu[i] =3D
> +=09=09=09=09platform_device_register_resndata(&mlxplat_dev->dev, "mlxreg=
-dpu",
> +=09=09=09=09=09=09=09=09  i, NULL, 0, mlxplat_dpu_data[i],
> +=09=09=09=09=09=09=09=09  sizeof(*mlxplat_dpu_data[i]));
> +=09=09=09if (IS_ERR(priv->pdev_dpu[i])) {
> +=09=09=09=09err =3D PTR_ERR(priv->pdev_dpu[i]);
> +=09=09=09=09goto fail_platform_dpu_register;
> +=09=09=09}
> +=09=09}
> +=09}
> +
>  =09return 0;

--=20
 i.

--8323328-173801367-1739285565=:4237--
