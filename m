Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A012C15BB;
	Sat, 11 Apr 2026 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775925979; cv=pass; b=C01InAezIUXti56EqZarHcBLhnuBkbIzoOXWsWSO68ikpM3xUz+QrYA8NauirqqNYrwQEF8ueTMNFdfS19ECbhpdG7tCGjLC2B3ohl4R2QxfOa3vtNeVyp32JkXyIc4W/jeKndIpUhzjQWsLvs1eh9Q4rFXCm98PzMfiqReXjY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775925979; c=relaxed/simple;
	bh=Ty9icSCCRVj9Q2hgvjMyNcxDdZxcbPdB+o/bY54sH9w=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UcIgykpQfGym9FPkP3agk/zuut78JzZt9F4v30y5/u1r5KMIE9kQHlFKY2CDBtMVpq5EtHm9yKDo50vNLYXIR5G+SFL7SFQ+IL5FrGb+bR9RqQe+CpMTNrkxkf1TBURbIJ0dyX6YTsZ2YclVCqKy+kU9BugVe+Yiy45kjyJ/qvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qxYkQ3Ez; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qxYkQ3Ez"
ARC-Seal: i=1; a=rsa-sha256; t=1775925965; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OJEOMjzCd45VauQG0bvNrvW+Yyj8CuSQ+WHNsgxXk7wH55AzVMOxXkuj19tXL9tpHSF42QlWB1VJZV8qrsNTwPjmGqOmFPmlinpM9E8LBxItdM9gvuo9DFguJ3oYIDH4BdSdWujuhhWU3bAISH7Twe3zIoxgwc01cvp2SeapCxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775925965; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k7z/oxgF9Dtphpl07ibPEJJbaFImL5JD9mIq/aNXz1w=; 
	b=DySmmzgk6PxVkaBq/qR8da3rsjl4mET82KcShDZdpk6mtZPljCruaAxFSIzZs9Rv7tNyojgM2/Oqv81mIvsvfq7+tytyWeYHqALK2i4trUaLVxT3wYbs5uVC8p0H5WigNQKPFyg2zXppisSrWkt/JC+8x3wR37t563G+rR1rpy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775925965;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=k7z/oxgF9Dtphpl07ibPEJJbaFImL5JD9mIq/aNXz1w=;
	b=qxYkQ3EzWLZ4tkBKbjRUFysuo+l4shdNKeNK1MZtsK4f3ih2e3qaPAaNVZ5DmDJa
	nnhlLuevvEoAbURpf0/MhF9S5X6nDMaxs9iHyctUvVc744Cq5a9LgRR1iUG6Mvfguok
	NF+s2gbYDR/HXOpsYsaEQ+A4dkd+mh8jdgRrD8eQZDIySbVQliwdWIpHJ128cQJR1qz
	snevQbyu+eQVf17VzPdV9hJ+7AuEmkGktTyYIMO5gNota3vlMnra9llOCkeM4WcFTUT
	JJamEbiJz9nb0oAo9NAxIhYNBkGbvG7Q7OP3PhJJjH0Fv3xX1YcrZpVHoriIn3mG7Ic
	klLqfPocPg==
Received: by mx.zohomail.com with SMTPS id 1775925964234570.5820079509419;
	Sat, 11 Apr 2026 09:46:04 -0700 (PDT)
Message-ID: <8bc493ef82f143191239c43487313904a7082289.camel@rong.moe>
Subject: Re: [PATCH v9 12/16] platform/x86: lenovo-wmi-other: Add GPU
 tunable attributes
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260411162334.25682-13-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
	 <20260411162334.25682-13-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Apr 2026 00:40:58 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Sat, 2026-04-11 at 16:23 +0000, Derek J. Clark wrote:
> Use an enum for all GPU attribute feature ID's and add GPU attributes.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v9:
>   - Rename gpu_didvid -> dgpu_didvid in documentation to match actual
>     attribute name.
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
> index 189dd4d31926..011054d64eac 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -69,6 +69,16 @@ Each attribute has the following properties:
> =20
>  The following firmware-attributes are implemented:
>   - cpu_temp: CPU Thermal Load Limit
> + - dgpu_boost_clk: Dedicated GPU Boost Clock
> + - dgpu_didvid: Dedicated GPU Device Identifier and Vendor Identifier

Thanks for correcting the typo in the documentation. However...

> + - dgpu_enable: Dedicated GPU Enabled Status
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
> index adf4300415f8..8abfea8c308a 100644
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

...here the _fsname is still mismatched.

Thanks,
Rong

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
