Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC92DC35C;
	Tue, 24 Feb 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922955; cv=none; b=i+iTPyrjdLxWW6CezxGqGySI7Iz2lpNeITl9oEUnyS4WH+cyifb8XzaVAI63W47gtk4lEkpqIytF6RWGLfWSZCSQ0ibDOuqKPKOHvgytN1ORz5xa41zTaR5NXoy/LiZGk3nErrparZcXO1S3KRiqlqQL90xNsJ0TulQHwOmw46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922955; c=relaxed/simple;
	bh=YOZzVw54GlxbgVMK5Rn8XbNxGyl4G2/1Ntjn9M5xTyU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ToRvWugWxNYQApWzvTIYKRtIt5EFZn53ibAwoyxGAIJ/NR7JE29VR/W88oaflqYez2/+OBemhfFQoxS0nNGxaTWI2JnCWA1O5LpkBJNYpipFckFXTPJYqC85lWW6XXxxaIpvFGDQSteJ4duNOS8swqJV4rsXQtJdBaN0f+ylvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEKK4lMm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEKK4lMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771922954; x=1803458954;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YOZzVw54GlxbgVMK5Rn8XbNxGyl4G2/1Ntjn9M5xTyU=;
  b=JEKK4lMmB4oQoBWtelfiB8f0uem4dEsd6cZf4tuwk4I0x5Vn9Mc4rep7
   low2FTI0AfJPnvY5fL2f6sdpXh7vSkRE1jxJBxKFvCtZ+46nj885KRla1
   x9LjD3d2URORaO+tJgJJANAUjlW09faXCREyBlM+qeOe4OEAK6tpbyz8P
   k0JhnNWpD5KcbA/Hj1NypNAcdbzTr65gtkSc4o1DieA5xRHxWvaM7bt7D
   tIiiyIL/S8J21sz9pyhV70G+Dh/pS++hoWhafjergzM4YsokxtPSpNFqt
   X5//YlX4lymRT4QuE9OIY/VqIBPYUKUqC5nMdBdZiHI0cz8StSrAr2vY9
   A==;
X-CSE-ConnectionGUID: A6u/LffnR0aOiVyvTsSEcQ==
X-CSE-MsgGUID: jJlz8C4DRFygsO1ZEfaRCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90513840"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="90513840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:49:13 -0800
X-CSE-ConnectionGUID: EZwzgj6oSBiI5hBsxK1aww==
X-CSE-MsgGUID: mtYskB9KRd2KWUhBUOO0Tg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:49:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 10:49:07 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] platform/x86: lenovo-wmi-other: Add missing CPU
 tunable attributes
In-Reply-To: <20260224043200.2680384-4-derekjohn.clark@gmail.com>
Message-ID: <52c0d752-99d0-77a6-04a6-18b193c154ad@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-4-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Feb 2026, Derek J. Clark wrote:

> Use an enum for device ID's and CPU attribute feature ID's, add
> missing CPU attributes.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          | 10 ++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  5 +-
>  drivers/platform/x86/lenovo/wmi-other.c       | 98 ++++++++++++++++++-
>  3 files changed, 107 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 01d471156738..f4763ed66cc6 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -68,9 +68,19 @@ Each attribute has the following properties:
>   - type
>  
>  The following firmware-attributes are implemented:
> + - cpu_oc_stat: CPU Overlocking Status
> + - cpu_temp: CPU Thermal Load Limit
> + - ppt_cpu_cl: CPU Cross Loading Power Limit
> + - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> + - ppt_pl1_spl_cl: Platform Profile Tracking Cross Loading Sustained Power Limit
> + - ppt_pl1_tau: Exceed Duration for Platform Profile Tracking Sustained Power Limit
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> + - ppt_pl2_sppt_cl: Platform Profile Tracking Cross Loading Slow Package Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> + - ppt_pl3_fppt_cl: Platform Profile Tracking Cross Loading Fast Package Power Tracking
> + - ppt_pl4_ipl: Platform Profile Trakcing Instantaneous Power Limit
> + - ppt_pl4_ipl_cl: Platform Profile Tracking Cross Loading Instantaneous Power Limit
>  
>  LENOVO_FAN_TEST_DATA
>  -------------------------
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 27202e2dc8a5..aa48f43cbb43 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -23,7 +23,10 @@
>  	 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) | \
>  	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type))
>  
> -#define LWMI_DEVICE_ID_FAN	0x04
> +enum lwmi_device_id {
> +	LWMI_DEVICE_ID_CPU = 0x01,
> +	LWMI_DEVICE_ID_FAN = 0x04,
> +};
>  
>  struct component_match;
>  struct device;
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index f3f12303e379..87aba244da84 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -54,15 +54,21 @@
>  
>  #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>  
> -#define LWMI_DEVICE_ID_CPU 0x01
> -
> -#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> -#define LWMI_FEATURE_ID_CPU_SPL 0x02
> -#define LWMI_FEATURE_ID_CPU_FPPT 0x03
> +enum lwmi_feature_id_cpu {
> +	LWMI_FEATURE_ID_CPU_SPPT = 0x01,
> +	LWMI_FEATURE_ID_CPU_SPL = 0x02,
> +	LWMI_FEATURE_ID_CPU_FPPT = 0x03,
> +	LWMI_FEATURE_ID_CPU_TEMP = 0x04,
> +	LWMI_FEATURE_ID_CPU_APU = 0x05,
> +	LWMI_FEATURE_ID_CPU_CL = 0x06,
> +	LWMI_FEATURE_ID_CPU_TAU = 0x07,
> +	LWMI_FEATURE_ID_CPU_IPL = 0x09,

Please align a groups of values.

> +};
>  
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>  
>  #define LWMI_TYPE_ID_NONE 0x00
> +#define LWMI_TYPE_ID_CROSSLOAD 0x01
>  
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> @@ -559,18 +565,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
>  	.type_id = LWMI_TYPE_ID_NONE,
>  };
>  
> +static struct tunable_attr_01 ppt_pl1_spl_cl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
> +	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
>  static struct tunable_attr_01 ppt_pl2_sppt = {
>  	.device_id = LWMI_DEVICE_ID_CPU,
>  	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
>  	.type_id = LWMI_TYPE_ID_NONE,
>  };
>  
> +static struct tunable_attr_01 ppt_pl2_sppt_cl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
> +	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
>  static struct tunable_attr_01 ppt_pl3_fppt = {
>  	.device_id = LWMI_DEVICE_ID_CPU,
>  	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
>  	.type_id = LWMI_TYPE_ID_NONE,
>  };
>  
> +static struct tunable_attr_01 ppt_pl3_fppt_cl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
> +	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
> +static struct tunable_attr_01 cpu_temp = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_TEMP,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl1_apu_spl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_APU,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_cpu_cl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_CL,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl1_tau = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_TAU,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl4_ipl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl4_ipl_cl = {
> +	.device_id = LWMI_DEVICE_ID_CPU,
> +	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
> +	.type_id = LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
>  	struct tunable_attr_01 *tunable_attr;
> @@ -1009,17 +1069,45 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
>  		.name = _fsname, .attrs = _attrname##_attrs               \
>  	}
>  
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
> +			      "Set the CPU thermal load limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> +			      "Set the CPU cross loading power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
> +			      "Set the APU sustained power limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
>  			      "Set the CPU sustained power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
> +			      "Set the CPU cross loading sustained power limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
>  			      "Set the CPU slow package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
> +			      "Set the CPU cross loading slow package power tracking limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
>  			      "Set the CPU fast package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
> +			      "Set the CPU cross loading fast package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
> +			      "Set the CPU sustained power limit exceed duration");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
> +			      "Set the CPU instantaneous power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
> +			      "Set the CPU cross loading instantaneous power limit");
> +
>  
>  static struct capdata01_attr_group cd01_attr_groups[] = {
> +	{ &cpu_temp_attr_group, &cpu_temp },
> +	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
> +	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
>  	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> +	{ &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
> +	{ &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
>  	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> +	{ &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
>  	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> +	{ &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
> +	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
> +	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
>  	{},
>  };
>  
> 

-- 
 i.

