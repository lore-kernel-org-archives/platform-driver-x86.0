Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007132951C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Apr 2025 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728010; cv=none; b=UTuw9u0O+H4nH6JSIGeuSuk5tp2Duv5Q8MSeW74I+fEScfnbH79ZZ1JMFogzOW8cYjW0SmwM5pho/O3FQ0bF7Qt7tP6+ncr6LEyN9PM+JQu0VXyExNWCtZc4AhtHHHZ8+0uV/dm40o4E6PXNWbfZQ5sa5+Na/hrYrXhL8VfPZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728010; c=relaxed/simple;
	bh=vRXZwYEPAANMHei4igym0jBaotCrnOfizUVtcIMK1YM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NTSVqjJ0zFpUPE/fCyDEWtZehGgwjWmF+4WnbdJnF4rfhKTtz6G5Rgpf+Gn7U7OcXGJ+gktH+17MDMqwXsW8YwBBVgSAZoyffEsGSiLaJbZx87zZxqHGfM2jWbEt2sxdzuRa22sWudT2cnEU1ZgtdGgkmJTQ32Csl+QuyKLjjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfhZu/1I; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfhZu/1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744728009; x=1776264009;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vRXZwYEPAANMHei4igym0jBaotCrnOfizUVtcIMK1YM=;
  b=MfhZu/1IM3fRrM/cjPR4H3Ha0/JqfFqyv6pG1WN5CvM41swjw2tlwL5i
   wZBrdiOW1E3b6Nd8Ih43oCc7xW93fPZrGytqmEC3H8T3l7ZNLHMdk9ZAl
   m3eGWwQos1MxSEqcPC3Xi479aQeJDQEs2VCALrQ+EhsUowQG9CYa66ekK
   a2F9n9cdzEXI9HYM7tx6O/W7ZexGrlwhLQqm2n5LS8U6pASyM/fH/+gT1
   uXyJQM9oQ+srYIGw/LGif1Ztp1ctd9TGn92uBC8/ru/EG9o+Uu2Rs4beU
   QZClFThm2HQsxFyKpOgvZGz0X9XJLVc58pY4nL4nXHH7q/yhYYZj+Y6wS
   g==;
X-CSE-ConnectionGUID: cHHrYXXZQumwbHRvgQeukg==
X-CSE-MsgGUID: ScONUVh4TKaqE/PYPeKHcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48938467"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="48938467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:40:08 -0700
X-CSE-ConnectionGUID: 22gtj+IQQTS2A/87J9HpuA==
X-CSE-MsgGUID: sjXpKMCiSsSu9y9VZnHnkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135207493"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:40:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 17:40:02 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v8 4/7] platform: mellanox: Cosmetic changes
 to improve code style
In-Reply-To: <20250412091843.33943-5-vadimp@nvidia.com>
Message-ID: <fd153f13-e114-411d-2664-550ca73eb22e@linux.intel.com>
References: <20250412091843.33943-1-vadimp@nvidia.com> <20250412091843.33943-5-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1652540700-1744728002=:942"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1652540700-1744728002=:942
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 12 Apr 2025, Vadim Pasternak wrote:

> Replace in 'for' loop - /i >=3D 0 ; i--/i >=3D 0 ;i--/.

Space is in the wrong place in the replace part.

> Replace in 'while' loop - /(--i >=3D 0)/(--i)/.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
> v5->v6
> Comments pointed out by Ilpo:
> - Fix 'while' loop in erro flow.
> ---
>  drivers/platform/mellanox/mlx-platform.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/=
mellanox/mlx-platform.c
> index 29d938265676..4c7ff22117a6 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -7807,7 +7807,7 @@ static int mlxplat_platdevs_init(struct mlxplat_pri=
v *priv)
>  =09while (i--)
>  =09=09platform_device_unregister(priv->pdev_dpu[i]);
>  fail_platform_wd_register:
> -=09while (--i >=3D 0)
> +=09while (i--)
>  =09=09platform_device_unregister(priv->pdev_wd[i]);
>  fail_platform_fan_register:
>  =09if (mlxplat_regs_io)
> @@ -7828,7 +7828,7 @@ static void mlxplat_platdevs_exit(struct mlxplat_pr=
iv *priv)
> =20
>  =09for (i =3D MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >=3D 0; i--)
>  =09=09platform_device_unregister(priv->pdev_dpu[i]);
> -=09for (i =3D MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >=3D 0 ; i--)
> +=09for (i =3D MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >=3D 0; i--)
>  =09=09platform_device_unregister(priv->pdev_wd[i]);
>  =09if (priv->pdev_fan)
>  =09=09platform_device_unregister(priv->pdev_fan);
> @@ -7873,7 +7873,7 @@ static int mlxplat_i2c_mux_topology_init(struct mlx=
plat_priv *priv)
>  =09return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
> =20
>  fail_platform_mux_register:
> -=09while (--i >=3D 0)
> +=09while (i--)
>  =09=09platform_device_unregister(priv->pdev_mux[i]);
>  =09return err;
>  }
> @@ -7882,7 +7882,7 @@ static void mlxplat_i2c_mux_topology_exit(struct ml=
xplat_priv *priv)
>  {
>  =09int i;
> =20
> -=09for (i =3D mlxplat_mux_num - 1; i >=3D 0 ; i--) {
> +=09for (i =3D mlxplat_mux_num - 1; i >=3D 0; i--) {
>  =09=09if (priv->pdev_mux[i])
>  =09=09=09platform_device_unregister(priv->pdev_mux[i]);
>  =09}
>=20
--8323328-1652540700-1744728002=:942--
