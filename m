Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDCF36681D;
	Tue, 24 Feb 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922985; cv=none; b=BfCzI7dOn7k0IRx82q29O/vBZrcmn72hil9/NA4dKw/nl0XT3H6q98UA+UjwuZBiX0nSU/aAVtlV7BzaGXsSwI3vJaeZr8hboGsirrJ5N5hU+UkwzflFZsgHK5/xiAPYcIg109CCdra6Eji0WUeejMo0Z/sFuE4H6IgqoF0FNoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922985; c=relaxed/simple;
	bh=3ily3prtKRT44t13mhSjTNdqEGt1DOdK+cMjgBHU3Iw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VVrhdlTvY4AdB4qzm4KjiS246SRjCQ+KGRz5bR+Ptbzxd7oFEPSsiqswnSHGApMx9dV6byufH/fwkIrhkQioSDZezW3XbjjpVErn8K+VK44C1hssK8ow7DTr+QRYSR7DEm+xGqaonXbubJMpwCC9NYLTuJTwJ4wbL35vOAoMhZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlaL7qLi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlaL7qLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771922983; x=1803458983;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3ily3prtKRT44t13mhSjTNdqEGt1DOdK+cMjgBHU3Iw=;
  b=QlaL7qLi9Y6WrVPlS+d3Q4ThExx1GoS+c1nJEZrLJsclh+MazcqGRakz
   VFguN/8Vk632s6TPmR9rRCPABlwISICSdnLvB7FZ4nlWmGnyHhrOvRdwH
   8/an13atWeoQ8uOKx9K9Q4VlHZH5wWbgHxWLAtx/MZANQiEqxmy4yOIpW
   SZa9AUyIYiTyFgCgUuCBtguuMJPfIWD/MYs1qZsmzbKpGKwrUjuclsV04
   homYpZEVzWve40IitOeKdWrWX9evFJpEKiXSmmC+pbW98If3uR86inDwC
   jDTYuQ3S49JikYQixViyIlspU76seiK+rABMAcSrip54rBge8lyvma/2d
   w==;
X-CSE-ConnectionGUID: hAvvfx5GR5uOjFuDPZoUxw==
X-CSE-MsgGUID: Af+6VVz9SW2EovPWImj0pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83554131"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="83554131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:49:43 -0800
X-CSE-ConnectionGUID: 4AjK3Q/fR62kJqBkEexpzA==
X-CSE-MsgGUID: mmtYBclZTlqvZ6CARM4P4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220357884"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:49:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 10:49:36 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] platform/x86: lenovo-wmi-other: Add GPU tunable
 attributes
In-Reply-To: <20260224043200.2680384-5-derekjohn.clark@gmail.com>
Message-ID: <b8d291d0-8425-91d8-d241-637030b332f5@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-5-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Feb 2026, Derek J. Clark wrote:

> Use an enum for all GPU attribute feature ID's and add GPU attributes.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  11 ++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 105 ++++++++++++++++++
>  3 files changed, 117 insertions(+)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index f4763ed66cc6..f7564b23bb7f 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -70,6 +70,17 @@ Each attribute has the following properties:
>  The following firmware-attributes are implemented:
>   - cpu_oc_stat: CPU Overlocking Status
>   - cpu_temp: CPU Thermal Load Limit
> + - dgpu_boost_clk: Dedicated GPU Boost Clock
> + - dgpu_enable: Dedicated GPU Enabled Status
> + - gpu_didvid: GPU Device Identifier and Vendor Identifier
> + - gpu_mode: GPU Mode by Power Limit
> + - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Offset
> + - gpu_nv_bpl: Nvidia GPU Base Power Limit
> + - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
> + - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
> + - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
> + - gpu_oc_stat: GPU Overclocking Status
> + - gpu_temp: GPU Thermal Load Limit
>   - ppt_cpu_cl: CPU Cross Loading Power Limit
>   - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index aa48f43cbb43..b7f9ee7b301a 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -25,6 +25,7 @@
>  
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU = 0x01,
> +	LWMI_DEVICE_ID_GPU = 0x02,
>  	LWMI_DEVICE_ID_FAN = 0x04,
>  };
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index 87aba244da84..67768f6a50e0 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -65,6 +65,19 @@ enum lwmi_feature_id_cpu {
>  	LWMI_FEATURE_ID_CPU_IPL = 0x09,
>  };
>  
> +enum lwmi_feature_id_gpu {
> +	LWMI_FEATURE_ID_GPU_NV_PPAB = 0x01,
> +	LWMI_FEATURE_ID_GPU_NV_CTGP = 0x02,
> +	LWMI_FEATURE_ID_GPU_TEMP = 0x03,
> +	LWMI_FEATURE_ID_GPU_AC_OFFSET = 0x04,
> +	LWMI_FEATURE_ID_DGPU_BOOST_CLK = 0x06,
> +	LWMI_FEATURE_ID_DGPU_EN = 0x07,
> +	LWMI_FEATURE_ID_GPU_MODE = 0x08,
> +	LWMI_FEATURE_ID_DGPU_DIDVID = 0x09,
> +	LWMI_FEATURE_ID_GPU_NV_BPL = 0x0a,
> +	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST = 0x0b,

Align values.

> +};
> +
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>  
>  #define LWMI_TYPE_ID_NONE 0x00
> @@ -631,6 +644,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl = {
>  	.type_id = LWMI_TYPE_ID_CROSSLOAD,
>  };
>  
> +static struct tunable_attr_01 gpu_nv_ppab = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_NV_PPAB,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_ctgp = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_NV_CTGP,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_temp = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_TEMP,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_ac_offset = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_AC_OFFSET,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_boost_clk = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_DGPU_BOOST_CLK,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_enable = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_DGPU_EN,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_mode = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_MODE,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_didvid = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_DGPU_DIDVID,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_bpl = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_NV_BPL,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_cpu_boost = {
> +	.device_id = LWMI_DEVICE_ID_GPU,
> +	.feature_id = LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
> +	.type_id = LWMI_TYPE_ID_NONE,
> +};
> +
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
>  	struct tunable_attr_01 *tunable_attr;
> @@ -1069,6 +1142,7 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
>  		.name = _fsname, .attrs = _attrname##_attrs               \
>  	}
>  
> +/* CPU tunable attributes */
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
>  			      "Set the CPU thermal load limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> @@ -1094,9 +1168,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
>  			      "Set the CPU cross loading instantaneous power limit");
>  
> +/* GPU tunable attributes */
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",
> +			      "Set the dedicated GPU boost clock");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
> +			      "Get the GPU device identifier and vendor identifier");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
> +			      "Set the dedicated Nvidia GPU enabled status");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
> +			      "Set the GPU mode by power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
> +			      "Set the Nvidia GPU AC total processing power baseline offset");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
> +			      "Set the Nvidia GPU base power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
> +			      "Set the Nvidia GPU to CPU dynamic boost limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
> +			      "Set the GPU configurable total graphics power");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
> +			      "Set the Nvidia GPU power performance aware boost limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
> +			      "Set the GPU thermal load limit");
>  
>  static struct capdata01_attr_group cd01_attr_groups[] = {
>  	{ &cpu_temp_attr_group, &cpu_temp },
> +	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
> +	{ &dgpu_didvid_attr_group, &dgpu_didvid },
> +	{ &dgpu_enable_attr_group, &dgpu_enable },
> +	{ &gpu_mode_attr_group, &gpu_mode },
> +	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
> +	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
> +	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
> +	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
> +	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
> +	{ &gpu_temp_attr_group, &gpu_temp },
>  	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
>  	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
>  	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> 

-- 
 i.

