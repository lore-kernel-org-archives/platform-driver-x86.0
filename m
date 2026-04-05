Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823C1339A4;
	Sun,  5 Apr 2026 00:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775350123; cv=none; b=o2HtixHvs3+S3ikYvdmvF2ncIBMLe/OBvNbYnx914L1CUg+j8ZGWuAEtnwCdpJMwlNF5zmj6WaylvkFhkzXhHj0WTVNiXngJFV03kjCgWFLf/+YlcjfteWxeYYzMvP0uwyAeQ+jiG0z+MdQPvjVtxUZPdcO6MKNfBnjnHHzbRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775350123; c=relaxed/simple;
	bh=R8rk3trUh1qYKNAL0PGx+ma5Xdj+vCPSOxTyQdITTLo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=upxSBNib2zMMTRQ1DWUAixPofpJZwO1BcskNDeI+RSG1vZrlLbRQuMM6eHEsYSuS61ClYhaIZwcA1JXtbNY781ZrmJhLNI7PcFpPaJTprWnv1p2yMlz0CrxOHwbA2GnHe1SYZ0LONvQS5VdjZhqda6eMSveDnZD1fpMAm+igpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=R0WdqPO3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OsJey+6W; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="R0WdqPO3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OsJey+6W"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 4D2B71D0000D;
	Sat,  4 Apr 2026 20:48:41 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 04 Apr 2026 20:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775350121;
	 x=1775436521; bh=PEaGmOc9f1lqqiwV8LiAvI6nfireBpV/Jm2mp4O+AB0=; b=
	R0WdqPO3diOmcx+L7rbozASwBU4ZUzZgktJifu+V2Z9YD/dZu5FakQR9zlhyyLjA
	LZmtocE1GijKAy884ZD3nwOGSt4WEq3u/WziC6zUYUC2+XIpJvOXmNWzHOG0B2W7
	nddnULEtKa+SooBmAJguRG09nJdEiP1fi6sqCgqRKSl2BUgTVD7p+LtCavbwrg5A
	877lifE19Imh/QApBDIgdqO6vGt3i3Y6FurxYPeVzL0n3jZ6Ug+F+u2py4UPacxq
	he6dgDSb3TphBgam2wH22Jb5dQmaijkqpHkdRR7xVpu2EzbrK6hfCLrxaoFrN0bx
	Dz7/nYAGuU4JjShhEIcf9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775350121; x=
	1775436521; bh=PEaGmOc9f1lqqiwV8LiAvI6nfireBpV/Jm2mp4O+AB0=; b=O
	sJey+6WLksqN0JKWRm0l6T5rVaEqLCkQLIbaeKfSLKY38hEnmIWUpYAsk7HhaZpL
	MxLhMzRXZ5asnMps/ovh0/ajh77CD841IDLAgFd5sls/l++Ic4BZA6xmM2HMwojq
	i2N7al1IzcLVpDnK16KIWJHWvMd8Kywrbw4aFd4TUnAGZQcXHWbBtC0vPucx83mq
	RdI4gcLKfVUpu+gecSg5kKgiPfg6TymJxgxL0M0rwmPa7wUEplRjPFdHG/F8DV7H
	cQG5TbM5dpYdWjI5f4sheQvFhTxnpVG0Xw2L+QXDq//koYx1aaVoATwsnqEN3zyZ
	23EAmO/hjiY3lhElFIXDQ==
X-ME-Sender: <xms:aLHRaQCe8ZOfsEL-dfFeCxswObmmQBB5vkXvxyfIzF5TG4VypE-t8Q>
    <xme:aLHRadUZY5UtkkKzZPakqOineCujVnkeUf5tWcXDZSRykA-ILpJcg6UNeRg3xznLW
    M3QNgRSHVHoHNfhBL35QgZmMNWuQgkpqFiMWcKhwFv-gKosxlV1Cn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkh
    hjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehkuhhurhhtsges
    ghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtph
    htthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheptghorhgsvg
    htsehlfihnrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:aLHRaXjFTrPRZaMYAnuw2qUGEzKzDE9wJ-eGPe8DGmds-gq2H4zD5g>
    <xmx:aLHRaQnLX7AFRxkCfj4TZr0DobSXOW7DwyYpnbMY226Aa4aQDAW2yg>
    <xmx:aLHRabjBJZcuQXNRDJtxgdTranX_8xNPTALiNwQR5x8BZJrOxpz1Cw>
    <xmx:aLHRabHMM51iyirvlCAVTV82wKG2RglTPWJbWAmdz6Fl6QUFeauIUA>
    <xmx:abHRaal9W7wOWxz9DXCM3TIagTVLCj7r_5weZj-iGI1LiGCT7E0PYzYV>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A1B02CE3F96; Sat,  4 Apr 2026 20:48:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A78gagOl5mRc
Date: Sat, 04 Apr 2026 20:48:19 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <22b180a6-c6ee-4785-9cee-577b9f55d48b@app.fastmail.com>
In-Reply-To: <20260402032424.678528-12-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-12-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 11/16] platform/x86: lenovo-wmi-other: Add missing CPU tunable
 attributes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Derek

On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> Use an enum for all device ID's and CPU attribute feature ID's,
> add missing CPU attributes.
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v7:
>   - Fix typo in documentation.
> v4:
>   - Align type ID defines.
>   - Align CPU feature enum values.
>   - remove cpu_oc_stat from Documentation.
> v3:
>   - Remove cpu_oc_stat.
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  9 ++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  5 +-
>  drivers/platform/x86/lenovo/wmi-other.c       | 99 ++++++++++++++++++-
>  3 files changed, 107 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst 
> b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 01d471156738..189dd4d31926 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -68,9 +68,18 @@ Each attribute has the following properties:
>   - type
> 
>  The following firmware-attributes are implemented:
> + - cpu_temp: CPU Thermal Load Limit
> + - ppt_cpu_cl: CPU Cross Loading Power Limit
> + - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> + - ppt_pl1_spl_cl: Platform Profile Tracking Cross Loading Sustained 
> Power Limit
> + - ppt_pl1_tau: Exceed Duration for Platform Profile Tracking 
> Sustained Power Limit
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> + - ppt_pl2_sppt_cl: Platform Profile Tracking Cross Loading Slow 
> Package Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> + - ppt_pl3_fppt_cl: Platform Profile Tracking Cross Loading Fast 
> Package Power Tracking
> + - ppt_pl4_ipl: Platform Profile Tracking Instantaneous Power Limit
> + - ppt_pl4_ipl_cl: Platform Profile Tracking Cross Loading 
> Instantaneous Power Limit
> 

Just wanted to flag that the naming for sppt and fppt seems wrong to me. Wanted to make sure it was deliberate.

I have, for Feature ID's:
1 = CPU Short Term Power Limit (you have Slow package Power Tracking)
3 = CPU Peak Power Limit (you have as Fast Package Power Tracking)

>  LENOVO_FAN_TEST_DATA
>  -------------------------
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h 
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 1388eaf4ab4a..f2d45cd7a188 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -18,7 +18,10 @@
>  #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
>  #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
> 
> -#define LWMI_DEVICE_ID_FAN	0x04
> +enum lwmi_device_id {
> +	LWMI_DEVICE_ID_CPU = 0x01,
> +	LWMI_DEVICE_ID_FAN = 0x04,
> +};
> 
>  #define LWMI_TYPE_ID_NONE 0x00
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 19a072bea2d4..56c8b84f306d 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -50,14 +50,21 @@
> 
>  #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> 
> -#define LWMI_DEVICE_ID_CPU 0x01
> -
> -#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> -#define LWMI_FEATURE_ID_CPU_SPL 0x02
> -#define LWMI_FEATURE_ID_CPU_FPPT 0x03
> +enum lwmi_feature_id_cpu {
> +	LWMI_FEATURE_ID_CPU_SPPT =	0x01,
> +	LWMI_FEATURE_ID_CPU_SPL =	0x02,
> +	LWMI_FEATURE_ID_CPU_FPPT =	0x03,
> +	LWMI_FEATURE_ID_CPU_TEMP =	0x04,
> +	LWMI_FEATURE_ID_CPU_APU =	0x05,
> +	LWMI_FEATURE_ID_CPU_CL =	0x06,
> +	LWMI_FEATURE_ID_CPU_TAU =	0x07,
> +	LWMI_FEATURE_ID_CPU_IPL =	0x09,
> +};
> 
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> 
> +#define LWMI_TYPE_ID_CROSSLOAD	0x01
> +
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> 
> @@ -551,18 +558,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
> @@ -898,17 +959,45 @@ static bool lwmi_attr_01_is_supported(struct 
> tunable_attr_01 *tunable_attr)
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

Depending on what you think above, these might need updating too

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
> -- 
> 2.53.0
