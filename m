Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F882DEA64
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775926215; cv=none; b=QfoeA0VsTSFxm4Mau2NY7qJ3F8HwyLMPn6i64QlGpxJtko8UcVuaBWH8JMOv5ZmoDGYUWVYs8cSzwYXFGWEXMeQkFpJXpW+ucwqM4i1bajssBsjLcSjmgk3ExklYC3hLVcRFqIB1hfNqAS9obJFQJ743+7Ov/rhUeOYAHk/v3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775926215; c=relaxed/simple;
	bh=SWwibQsXsCrRWeAL6U1FnXoV5VpHesHz2UbT33D5jYs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qLgnd8Q/78FwufwxfUlehTIYLDcFRRWXH9rcZwZDGl9QHdRHpcZjFgwc9fHrdSDpR+Z1bAZkk7UBXG99pteanJiU2lha0bNWsf7/w2ZrbB4aKJcfr1Gb0wujKXlSVdM56KC6iLICMYZ8d7vcGU27fyFOwGjpiOqGdAlLOiUPhmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbNNoC0l; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbNNoC0l"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2995541eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775926212; x=1776531012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XzgL/QU71Um+y9qS+lS50DlDTn35f/5YxepgXOHJWHs=;
        b=mbNNoC0lVU/VOCR0eL35FTqqxJu2Hw2hm3XUdVlrloQ/TGK0rv/kGRpsLHunem1IFt
         FsgoATEwRsxF5aacgqtaEq3J9vygu9s6EfKlTNAb2hajeGOC271t/PQ+UE+E+f3ry4ry
         P1R+NstufRdyGywlDm4NVff/QQO81p+wXnPnGkUwVHEu3gtMm4QwJ+mMpjFe5dHT+V9r
         vB2e8ek4Vle9qab9irYmL0U2jgCrLoX40tmfeknsiFa0BR/g+fDfo7PvBV+a8r0JEb1L
         LhLUesPYV4jx7LFk+lprIr78fGTGbBIiei5TL9HLL6Fk9c9m2EFSM7eMyDhUsB5gI4ZR
         dJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775926212; x=1776531012;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzgL/QU71Um+y9qS+lS50DlDTn35f/5YxepgXOHJWHs=;
        b=kNYtrxuutZBh4nti5sUTKG/1S7HKuexzNysNKV1JKx4sywFZX0ONq4A1mLppoRB1/1
         +jo6Ub9tn7bLO+lUdocehJCq+GPjglEyzjHepF3JfcXtPz8W8VLE86onC2/jbRzfh58I
         IXkxBYrTOZTNeEJjI6PAJVXyK4xYBuhDWT7Kwwg3Lo9EQWuarZ757dqSA5Gw63RTIXGr
         BafrYjUgzqI06hAe94Dxj1/qfV8//Kr8xg9E75SmempPd46lW9H5I5GFpCqT5L/BJUXd
         VdOT6MxQV5jHo2Ez5dNaLn+aXyHFypBkW6ie5TsKgq8M3CmJOnCYJw2I9elT4Na/YrlK
         Gjtg==
X-Forwarded-Encrypted: i=1; AJvYcCUad7jUY73+as+jqUEdRcYh/2ZwYGz3ujb5lx/Jcholurmf6p9YmNFmxQIV6dJMCmWYyWjrePSp1P3CdP027mCvG8ws@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbccQv4jpq2ThwaY1d2wNL6gWqKlqP7CxxLD0vxH0pK17Gms7
	vffkonGk3AjT+g1kdT5J5M0SP9WkUSi2+CBnucdPi660VpXLt3nRjIsD
X-Gm-Gg: AeBDiet1lxLzfgMeVwNNUemGu1iKlUDHs+75ycHA1Pt+G5IMOlOZgbOMF9+gVVzkQmp
	I0tcS+wtFXQFFqpAx49J1D/mp/cuOr5RYc3hnxYAJyCsrO6XQ/2LTbGZBCx5/wlBRLz5NvR5UoZ
	8UxNQ/vdJ1Ip6vUAVtY0mQGgnp9YfcQfVHdGAyafq0RaCiieRNatNxA6DHrFOL54fhn7BABKrcH
	zDOH/Wb9+d/YAcENekoKQqypUKooVLsOvfIOUM10VpSDpfj5gJh+gCbHwSh+5gm8BPtBCCguJK5
	xT4HupG477e0d7HNDuaUH2FcBDdm8mHhlthl0VYdk5+AJHmcDSdxCR6o7uc8EQxVrPyb7k0SVK2
	zxai9YaOr29hbROL/IX2n91Us8HQ1oqzmaS9X8ZLYMP5+WqvLPednebmkGBDFQs46aam/wv1jWo
	9f/IuY0dXFh9Vj0JL/TnNrLLfKBW921AiGyBly81BZIrmVfipYO8PSZBLdjw41QECdZ/pVcxnBg
	lRlt7o5BreNlXTIJpfb5Q==
X-Received: by 2002:a05:7300:4347:b0:2c8:717:7ec7 with SMTP id 5a478bee46e88-2d58945dd66mr4281950eec.20.1775926211662;
        Sat, 11 Apr 2026 09:50:11 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ff826dcsm9107587eec.13.2026.04.11.09.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 09:50:11 -0700 (PDT)
Date: Sat, 11 Apr 2026 09:50:10 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_12/16=5D_platform/x86=3A_leno?=
 =?US-ASCII?Q?vo-wmi-other=3A_Add_GPU_tunable_attributes?=
User-Agent: Thunderbird for Android
In-Reply-To: <8bc493ef82f143191239c43487313904a7082289.camel@rong.moe>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com> <20260411162334.25682-13-derekjohn.clark@gmail.com> <8bc493ef82f143191239c43487313904a7082289.camel@rong.moe>
Message-ID: <77DCB409-FD0A-4A73-BAA0-1AADDF5AB25D@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 11, 2026 9:40:58 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Sat, 2026-04-11 at 16:23 +0000, Derek J=2E Clark wrote:
>> Use an enum for all GPU attribute feature ID's and add GPU attributes=
=2E
>>=20
>> Reviewed-by: Rong Zhang <i@rong=2Emoe>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> v9:
>>   - Rename gpu_didvid -> dgpu_didvid in documentation to match actual
>>     attribute name=2E
>> v7:
>>   - Fix typo in dgpu_boost_clk attribute string=2E
>> v4:
>>   - Align CPU feature enum values=2E
>>   - Remove gpu_oc_stat from Documentation=2E
>> v3:
>>   - Remove gpu_oc_stat=2E
>> ---
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          |  10 ++
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh     |   1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec       | 105 ++++++++++++++++=
++
>>  3 files changed, 116 insertions(+)
>>=20
>> diff --git a/Documentation/wmi/devices/lenovo-wmi-other=2Erst b/Documen=
tation/wmi/devices/lenovo-wmi-other=2Erst
>> index 189dd4d31926=2E=2E011054d64eac 100644
>> --- a/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> +++ b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>> @@ -69,6 +69,16 @@ Each attribute has the following properties:
>> =20
>>  The following firmware-attributes are implemented:
>>   - cpu_temp: CPU Thermal Load Limit
>> + - dgpu_boost_clk: Dedicated GPU Boost Clock
>> + - dgpu_didvid: Dedicated GPU Device Identifier and Vendor Identifier
>
>Thanks for correcting the typo in the documentation=2E However=2E=2E=2E
>
>> + - dgpu_enable: Dedicated GPU Enabled Status
>> + - gpu_mode: GPU Mode by Power Limit
>> + - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Off=
set
>> + - gpu_nv_bpl: Nvidia GPU Base Power Limit
>> + - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
>> + - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
>> + - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
>> + - gpu_temp: GPU Thermal Load Limit
>>   - ppt_cpu_cl: CPU Cross Loading Power Limit
>>   - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limi=
t
>>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>> diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/plat=
form/x86/lenovo/wmi-capdata=2Eh
>> index f2d45cd7a188=2E=2E891b12ca1db6 100644
>> --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> @@ -20,6 +20,7 @@
>> =20
>>  enum lwmi_device_id {
>>  	LWMI_DEVICE_ID_CPU =3D 0x01,
>> +	LWMI_DEVICE_ID_GPU =3D 0x02,
>>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>>  };
>> =20
>> diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-other=2Ec
>> index adf4300415f8=2E=2E8abfea8c308a 100644
>> --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> @@ -61,6 +61,19 @@ enum lwmi_feature_id_cpu {
>>  	LWMI_FEATURE_ID_CPU_IPL =3D	0x09,
>>  };
>> =20
>> +enum lwmi_feature_id_gpu {
>> +	LWMI_FEATURE_ID_GPU_NV_PPAB =3D		0x01,
>> +	LWMI_FEATURE_ID_GPU_NV_CTGP =3D		0x02,
>> +	LWMI_FEATURE_ID_GPU_TEMP =3D		0x03,
>> +	LWMI_FEATURE_ID_GPU_AC_OFFSET =3D		0x04,
>> +	LWMI_FEATURE_ID_DGPU_BOOST_CLK =3D	0x06,
>> +	LWMI_FEATURE_ID_DGPU_EN =3D		0x07,
>> +	LWMI_FEATURE_ID_GPU_MODE =3D		0x08,
>> +	LWMI_FEATURE_ID_DGPU_DIDVID =3D		0x09,
>> +	LWMI_FEATURE_ID_GPU_NV_BPL =3D		0x0a,
>> +	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
>> +};
>> +
>>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
>> =20
>>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
>> @@ -624,6 +637,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
>>  	=2Etype_id =3D LWMI_TYPE_ID_CROSSLOAD,
>>  };
>> =20
>> +static struct tunable_attr_01 gpu_nv_ppab =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_PPAB,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 gpu_nv_ctgp =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_CTGP,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 gpu_temp =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_TEMP,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 gpu_nv_ac_offset =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_AC_OFFSET,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 dgpu_boost_clk =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_DGPU_BOOST_CLK,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 dgpu_enable =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_DGPU_EN,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 gpu_mode =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_MODE,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 dgpu_didvid =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_DGPU_DIDVID,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 gpu_nv_bpl =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_BPL,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>> +static struct tunable_attr_01 gpu_nv_cpu_boost =3D {
>> +	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>> +	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
>> +	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>> +};
>> +
>>  struct capdata01_attr_group {
>>  	const struct attribute_group *attr_group;
>>  	struct tunable_attr_01 *tunable_attr;
>> @@ -959,6 +1032,7 @@ static bool lwmi_attr_01_is_supported(struct tunab=
le_attr_01 *tunable_attr)
>>  		=2Ename =3D _fsname, =2Eattrs =3D _attrname##_attrs               \
>>  	}
>> =20
>> +/* CPU tunable attributes */
>>  LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
>>  			      "Set the CPU thermal load limit");
>>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
>> @@ -984,9 +1058,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_p=
l4_ipl",
>>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
>>  			      "Set the CPU cross loading instantaneous power limit");
>> =20
>> +/* GPU tunable attributes */
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "dgpu_boost_clk",
>> +			      "Set the dedicated GPU boost clock");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
>
>=2E=2E=2Ehere the _fsname is still mismatched=2E
>

-_-
Damnit=20
I'll fix it in the next version, this time tomorrow if there are no other =
comments=2E


>Thanks,
>Rong
>
>> +			      "Get the GPU device identifier and vendor identifier");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
>> +			      "Set the dedicated Nvidia GPU enabled status");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
>> +			      "Set the GPU mode by power limit");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
>> +			      "Set the Nvidia GPU AC total processing power baseline offset=
");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
>> +			      "Set the Nvidia GPU base power limit");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
>> +			      "Set the Nvidia GPU to CPU dynamic boost limit");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
>> +			      "Set the GPU configurable total graphics power");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
>> +			      "Set the Nvidia GPU power performance aware boost limit");
>> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
>> +			      "Set the GPU thermal load limit");
>> =20
>>  static struct capdata01_attr_group cd01_attr_groups[] =3D {
>>  	{ &cpu_temp_attr_group, &cpu_temp },
>> +	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
>> +	{ &dgpu_didvid_attr_group, &dgpu_didvid },
>> +	{ &dgpu_enable_attr_group, &dgpu_enable },
>> +	{ &gpu_mode_attr_group, &gpu_mode },
>> +	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
>> +	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
>> +	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
>> +	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
>> +	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
>> +	{ &gpu_temp_attr_group, &gpu_temp },
>>  	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
>>  	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
>>  	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },

