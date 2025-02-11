Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75922D4C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285401; cv=none; b=VbiLT1qtjH5a6Z9gdT2omzb2FF5189hxI8Ll5OreMXPdJ70r2eQ4Xnvb/lSyFNVgXbr0CW5Es/K2NhmWWHoYaqFOyaIMK/05KiiA3h0izcRArnAS/HpysExkJlvhNkgzZQXFMFZVL4P9+83ue1eey/aCzlCtRG5q8+WcTpaKQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285401; c=relaxed/simple;
	bh=n5I6fKdlCVYdNhdNtkIrBUvFaFmqTAuWe2gVxh0hsX4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TR8LCB7SXYaW9Ev6iCjjpFKoGMBrV8q0Qi9Z2HW3ZwoSoGpxrLWA0LiQmp6tE6kA+NEob781VOGAv9UWVKJ5ao0xEvJkIfoR5z25SXmWT+LLCEQCLMfX6xXKddqeKKI0lamb+MP4bR9BgX4azezSk/6L7qTUtGs8pmcw3uRLc4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gs7gj9lJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs7gj9lJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285400; x=1770821400;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=n5I6fKdlCVYdNhdNtkIrBUvFaFmqTAuWe2gVxh0hsX4=;
  b=gs7gj9lJZvi5fMjvxnsLEnMmlWirOy1Nr/tmHxWIvYNV3/8toSFLdyC5
   Zq1FVkOnbdbUufTq0zLBSADQq3AjIVGflakxqQLo2MGSrp09Z9a/p10V3
   OT9b/LeD1J2ddUiPFeFzqa2kZJEloT6jz/q3OUBwTs7MirLz2qg5VHcgW
   k052AXBw222Gu5v23dlMz0naI1ZGJb3KAdGnZVMGXqnqXBj5obtrxozFb
   22onTyaKALb4g+dmbvPzeVYzujJqZygjj0VzVCj5nEAS3Eza89HkHZHhl
   wUnaNQ51Um0+KwY6s1y9R6U30jMSYXLods423YCIFqzIIa/Lo13v/ZTb7
   g==;
X-CSE-ConnectionGUID: 5QpHYaS4Rpi1k6u8wwJKUw==
X-CSE-MsgGUID: kSFlyd0BQxuaCYJVOsTp1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27507820"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="27507820"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:49:59 -0800
X-CSE-ConnectionGUID: sGRDKDB9QJuDOnfOAcg/7g==
X-CSE-MsgGUID: IOYFSnX7QWSNUKQm7fKhFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117550506"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:49:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 16:49:53 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 1/9] platform_data/mlxreg: Add capability mask
 fields
In-Reply-To: <20250211091912.36787-2-vadimp@nvidia.com>
Message-ID: <d138c8e3-73c3-3197-2c46-e37b99dd9d35@linux.intel.com>
References: <20250211091912.36787-1-vadimp@nvidia.com> <20250211091912.36787-2-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1402328225-1739285393=:4237"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1402328225-1739285393=:4237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Feb 2025, Vadim Pasternak wrote:

> Add new field 'capability_mask' to structs 'mlxreg_core_data' and
> 'mlxreg_core_item'.
>=20
> The =E2=80=98capabilty_mask=E2=80=99 is associated with the relevant capa=
bility

capability_mask

> registers, indicating which attributes should be handled and which
> ignored. Register contains bitmask of attributes or number of
> attributtes, which should be handled. While 'capability mask' is

attributes

The sentence starting with "While" feels incomplete.

> superset.
>=20
> Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v5->v6
> Revised after comments pointed out by Ilpo:
> - Drop 'capability_bit' from structure 'mlxreg_core_data', since it is
>   not used.
> ---
>  include/linux/platform_data/mlxreg.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platfor=
m_data/mlxreg.h
> index 0b9f81a6f753..b2a3377a28e5 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -118,6 +118,7 @@ struct mlxreg_hotplug_device {
>   * @mask: attribute access mask;
>   * @bit: attribute effective bit;
>   * @capability: attribute capability register;
> + * @capability_mask: superset mask for capability register;
>   * @reg_prsnt: attribute presence register;
>   * @reg_sync: attribute synch register;
>   * @reg_pwr: attribute power register;
> @@ -138,6 +139,7 @@ struct mlxreg_core_data {
>  =09u32 mask;
>  =09u32 bit;
>  =09u32 capability;
> +=09u32 capability_mask;
>  =09u32 reg_prsnt;
>  =09u32 reg_sync;
>  =09u32 reg_pwr;
> @@ -162,6 +164,7 @@ struct mlxreg_core_data {
>   * @reg: group interrupt status register;
>   * @mask: group interrupt mask;
>   * @capability: group capability register;
> + * @capability_mask: superset mask for capability register;
>   * @cache: last status value for elements fro the same group;
>   * @count: number of available elements in the group;
>   * @ind: element's index inside the group;
> @@ -175,6 +178,7 @@ struct mlxreg_core_item {
>  =09u32 reg;
>  =09u32 mask;
>  =09u32 capability;
> +=09u32 capability_mask;
>  =09u32 cache;
>  =09u8 count;
>  =09u8 ind;
>=20

--=20
 i.

--8323328-1402328225-1739285393=:4237--
