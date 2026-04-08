Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525F39EF22;
	Wed,  8 Apr 2026 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665811; cv=pass; b=MD2ciAfbmvBSipYz2m0sdibefbBBtHbe6ZzbVrLXUpiAa2do7xBaLBDHmBQ1yY7ILVLmS2M4HdTypmYnnjzEfmgoJVlCrwZCWrXmDyuldpg+pzPq5uT58q/zla9Oglcx3S4MTlutmQ0bgz0PeQqll4kP2CnEWSewdy+kMuYM31Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665811; c=relaxed/simple;
	bh=1DLe5+IiXFLzW//Dg4fSpnvpJdKFveWjxk7RUxPafHs=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HYd3N6++a7IlHS8kngHzu5qX9gFKK1zRpnZKdsb0tgAoBrQp4sHdXSN7dEZftiTTT3vkBzH8XnavkkY51FSHXKo4zh5FkNNQVpzlaqrOhqSFWANT5MesRX+Cv4GeSQaCxIPUuED69aDxtAvXA0c2Pt7jh2GCJ0hTmJaQWOmcsS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UtkuvxQC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UtkuvxQC"
ARC-Seal: i=1; a=rsa-sha256; t=1775665798; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PaLXAyktRhq3J5tmaEezclZTlWleX2k2q4pmPZomh81pL3Zwa9y08lXRs4X4pT6EnVXuWA61FA0UDUzUFwsGeERSdkVYUVJdROGfk6/Aq9IbHIWc+LaTF+hpONPZwQgjPpOHBV42j9EhltsxRVOVXKg5tqd1g6QfmnEBsA8XJHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775665798; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y2IzQd4gikBfh03bjGKNoLbsR9W8Put5kkHXobwIcD8=; 
	b=dC7pOyubZExqlIRcneu8ufAOOcG/naMlUUzGM0Mv3jaN7DDv7vslz0othQp5nKoMe+5ehRsx14oIoAcG6AliNukeiiwZMm/aGdQSyd3syeJGFFJlA6Z7KdTgNqb1xdKNQN3ApSYjMjAiiVuU7ZFPKJyuStUfbi5mpnPKSKs5RG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775665798;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=y2IzQd4gikBfh03bjGKNoLbsR9W8Put5kkHXobwIcD8=;
	b=UtkuvxQCx6AOI3x+5n7/U9ZwLYmBSFVSROnXSkO3+EBY8BEg97rbOV86Q1ORVnOn
	AdsiS7aFTdzQbHlz4+hNwHXZnl8CCkMlkFQjRw5dV1mkpmmi8yKxKk9wpom46cSIzsK
	OjS5pLrp6vME7QHXicGW5IaM0KnRm4TsWS9MQ/9ao+AV/qZ3lPChwOxUoeTgEh8jmlk
	hTZvuS0Ibpj9Lye6ni1lYl6cGWNmoQvPcjiXH2hfTy1KBFgNR3BVPFbAxfIdISkvbn3
	xPoQyGq2ByBG2v0gAKdDe10Kk4srz6qG/0ch0+zs98fAi49r9g5HHkrWjGoBSZSsJjX
	nbqpgOsJUA==
Received: by mx.zohomail.com with SMTPS id 1775665797799307.8044186272622;
	Wed, 8 Apr 2026 09:29:57 -0700 (PDT)
Message-ID: <775af20cc5147fa8d1d7e66973e7325678b97070.camel@rong.moe>
Subject: Re: [PATCH v8 12/16] platform/x86: lenovo-wmi-other: Add GPU
 tunable attributes
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260406201400.438221-13-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
	 <20260406201400.438221-13-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2026 00:24:50 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Mon, 2026-04-06 at 20:13 +0000, Derek J. Clark wrote:
> Use an enum for all GPU attribute feature ID's and add GPU attributes.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v7:
>   - Fix typo in dgpu_boost_clk attribute string.
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
> index 189dd4d31926..988ae04ff724 100644
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
> index 56c8b84f306d..57b6b6f17f33 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -61,6 +61,19 @@ enum lwmi_feature_id_cpu {
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
> @@ -624,6 +637,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
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
> @@ -959,6 +1032,7 @@ static bool lwmi_attr_01_is_supported(struct tunable=
_attr_01 *tunable_attr)
>  		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
>  	}
> =20
> +/* CPU tunable attributes */
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
>  			      "Set the CPU thermal load limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> @@ -984,9 +1058,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4=
_ipl",
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
>  			      "Set the CPU cross loading instantaneous power limit");
> =20
> +/* GPU tunable attributes */
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "dgpu_boost_clk",
> +			      "Set the dedicated GPU boost clock");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
> +			      "Get the GPU device identifier and vendor identifier");

Sorry, I missed it before.

In the documentation, we have `gpu_didvid'. Here the _attrname is
`dgpu_didvid' while the _fsname is `gpu_didvid' (note the `d'). Which is
the correct one?

Thanks,
Rong

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
