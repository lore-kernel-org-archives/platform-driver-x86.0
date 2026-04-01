Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70561477E4D;
	Wed,  1 Apr 2026 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068685; cv=pass; b=reogs+yzQRg6Wa1JASqRS0sP+WCyfaU1NFmANCuD+3uFJaxPY8LTLB9M9ZQ3S6P7PDEKMcYJEMzVlwyTid7E6Vek2kL9LBgTex7ZBlOpcYBot2Rtau9RWzHVGQPlHi8HRZHZXDmJwWpTIB5IZOEPiaNVfE5H0iFTDSnOBir5FIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068685; c=relaxed/simple;
	bh=HDnzUJ6qd1tJp9ZQJpPcqCTfua3rxJ0knL2mHskWOFU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UZvVR9+x+cTpLEIWC/RelHBdULXRqn9PPhOJAwone61aL+9NeSjoLb2CJn8uvS+Ab2Pr3zilZIflvxCaJhDn/RaasZm03vwi0Ojx0HymCuoFsKYCqIyvxFAEX40lqGXKWWEy/5ZJ9E6O16+Xxkmca5BnCSupR8sruXyRlnDd11Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jE7G/VGZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jE7G/VGZ"
ARC-Seal: i=1; a=rsa-sha256; t=1775068675; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GxSl4+dsALd8zOGVabPxihFCxTN7c8FHdg5UWDZktmVxN8U3SV+XAHsqRpBwyUH87gI5hvvde6e1OfMaBJcDFHPvGuNQD936sl5Wl1fUIiIjPHxWSsT+HHTFksTzmUozVi2ayMgzxTorW6YUGT5iEJW7RL3GIyufDPCns19lxqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068675; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HGMjN0GGawEStcGXtnFSJ0VvWdJlaM3evL2LjXbvMvw=; 
	b=Tw5w1lB77CBlD08saeCcCw1pfhyIBwEEvurSle9IC+EcN8QwgzTcfqf4s+ofIWvuJNIbOUF1F6fFgh7eDmGf7NjIgb/oNOkBMjYlKDgmuXUVlQHmH3b2YzuutHFm9+i/MSuR0APIcpJ6bW0PmMHmRT/IpfZa/d3GMRqo9nzJ68Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068675;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=HGMjN0GGawEStcGXtnFSJ0VvWdJlaM3evL2LjXbvMvw=;
	b=jE7G/VGZMmpkiyetJ6tEjT0eA7vUJl+5uD7oszpRxFH3k622i/4kZ1e7enVPfqhE
	sK+u8Zr0VY9ShS/FnVFiAhEzHtbznqnLShfwmtf6WNjrkc6j6PhGz85/d2s+EFvlemN
	jUI/grXgS9JfAtL+ODdrAclRnoRMNFl/Pdny6Iv3sW3Nh6DoaHhLI21i1j4n5PcGFT6
	YVIZSQjBjJtAqzu9BwHG6g1Y16FCTybV2c5jBmtaf5ety/jXsdzD9PATqJofC8pkdD+
	jClsF/Q25W+lER3ng7IdryH13CHipk01Y+fM0OYKJb+kpaclCR1NTGpuHpIyIVgLcsI
	K06KG0Jo3g==
Received: by mx.zohomail.com with SMTPS id 1775068674004113.88315651163782;
	Wed, 1 Apr 2026 11:37:54 -0700 (PDT)
Message-ID: <92c9a75e3d0f2bc23dfa65c182073783964429ed.camel@rong.moe>
Subject: Re: [PATCH v6 08/13] platform/x86: lenovo-wmi-other: Add GPU
 tunable attributes
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-9-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-9-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:30:34 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:12 +0000, Derek J. Clark wrote:
> Use an enum for all GPU attribute feature ID's and add GPU attributes.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Align CPU feature enum values.
>   - Remove gpu_oc_stat from Documentation.
> v3:
>   - Remove gpu_oc_stat.
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  10 ++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 105 ++++++++++++++++++
>  3 files changed, 116 insertions(+)
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 82c17361e749..bfbea59637bd 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -69,6 +69,16 @@ Each attribute has the following properties:
> =20
>  The following firmware-attributes are implemented:
>   - cpu_temp: CPU Thermal Load Limit
> + - dgpu_boost_clk: Dedicated GPU Boost Clock
> + - dgpu_enable: Dedicated GPU Enabled Status
> + - gpu_didvid: GPU Device Identifier and Vendor Identifier
> + - gpu_mode: GPU Mode by Power Limit
> + - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Offse=
t
> + - gpu_nv_bpl: Nvidia GPU Base Power Limit
> + - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
> + - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
> + - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
> + - gpu_temp: GPU Thermal Load Limit
>   - ppt_cpu_cl: CPU Cross Loading Power Limit
>   - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index f2d45cd7a188..891b12ca1db6 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -20,6 +20,7 @@
> =20
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU =3D 0x01,
> +	LWMI_DEVICE_ID_GPU =3D 0x02,
>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>  };
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 508186c7410d..2792671ac1de 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -65,6 +65,19 @@ enum lwmi_feature_id_cpu {
>  	LWMI_FEATURE_ID_CPU_IPL =3D	0x09,
>  };
> =20
> +enum lwmi_feature_id_gpu {
> +	LWMI_FEATURE_ID_GPU_NV_PPAB =3D		0x01,
> +	LWMI_FEATURE_ID_GPU_NV_CTGP =3D		0x02,
> +	LWMI_FEATURE_ID_GPU_TEMP =3D		0x03,
> +	LWMI_FEATURE_ID_GPU_AC_OFFSET =3D		0x04,
> +	LWMI_FEATURE_ID_DGPU_BOOST_CLK =3D	0x06,
> +	LWMI_FEATURE_ID_DGPU_EN =3D		0x07,
> +	LWMI_FEATURE_ID_GPU_MODE =3D		0x08,
> +	LWMI_FEATURE_ID_DGPU_DIDVID =3D		0x09,
> +	LWMI_FEATURE_ID_GPU_NV_BPL =3D		0x0a,
> +	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
> +};
> +
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> @@ -630,6 +643,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
>  	.type_id =3D LWMI_TYPE_ID_CROSSLOAD,
>  };
> =20
> +static struct tunable_attr_01 gpu_nv_ppab =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_PPAB,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_ctgp =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_CTGP,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_temp =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_TEMP,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_ac_offset =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_AC_OFFSET,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_boost_clk =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_DGPU_BOOST_CLK,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_enable =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_DGPU_EN,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_mode =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_MODE,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_didvid =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_DGPU_DIDVID,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_bpl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_BPL,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_cpu_boost =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
>  	struct tunable_attr_01 *tunable_attr;
> @@ -1061,6 +1134,7 @@ static bool lwmi_attr_01_is_supported(struct tunabl=
e_attr_01 *tunable_attr)
>  		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
>  	}
> =20
> +/* CPU tunable attributes */
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
>  			      "Set the CPU thermal load limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> @@ -1086,9 +1160,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl=
4_ipl",
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
>  			      "Set the CPU cross loading instantaneous power limit");
> =20
> +/* GPU tunable attributes */
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",

Typo here?

s/"gpu_boost_clk"/"dgpu_boost_clk"/

(found by sashiko.dev)

https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gm=
ail.com

Thanks,
Rong

> +			      "Set the dedicated GPU boost clock");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
> +			      "Get the GPU device identifier and vendor identifier");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
> +			      "Set the dedicated Nvidia GPU enabled status");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
> +			      "Set the GPU mode by power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
> +			      "Set the Nvidia GPU AC total processing power baseline offset")=
;
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
> =20
>  static struct capdata01_attr_group cd01_attr_groups[] =3D {
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
