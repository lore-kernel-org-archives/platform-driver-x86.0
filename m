Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCE7081E;
	Sun,  5 Apr 2026 00:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775350478; cv=none; b=tqtpHLYX5zTS+5UjPb8hRwEaDR2BfkUfqoP1/MGvmA7JBxszF0EmPzLZaOWh8zwaEtgQDITxjq1tIgyfIWVDhapImFCev09rGBN2YjJ0j081vyZEstFQYsbZuxTS2whkqiekeHUGbXDfs4BbXBEs/RoBnaNAQO5lsWMQdVQLc4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775350478; c=relaxed/simple;
	bh=civ7nllWZj7AeUPpQsfXPZFYZj3ZjXPS/fsiUUnJLCc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j0M4owkLdkEuEN0qXb9mfDGmFB992cVNLxxMuFWLMb77RdCDmZz/Sw4v2fKbqXoREASvthMwvXfCGexVMU36AAdXH/IOcgUupv0n7C4r2D0KS3Qg99lHmXe7FKB8/aObflZMM7LjK1NAKvnZDMU0FklJODxYiRIBvlAeORyYMN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=LZT67oSH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RSN/rZfS; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="LZT67oSH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RSN/rZfS"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB6047A0169;
	Sat,  4 Apr 2026 20:54:36 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 04 Apr 2026 20:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775350476;
	 x=1775436876; bh=aeLYEhk4eGUGkw9vfbxPgVFNNvn28nlbdNrOwvhwmIs=; b=
	LZT67oSHUlYXcckEtvrn5loxElhU/dGNFIITZR1u2hHD7/rZ70vU12LiMU75YbUN
	eCVq/zXJYzWwah3SyRhHqSVV0FDx7fpquRTitsO7QnohyR2j2exFDKODwqI9MaLb
	flQhsYHmlqX27qzq6mJzQyKg3EwClv6mQ8y5K3okEHvd6mShlRWuocrXWWRAoTOc
	7JPP3XXTclWHvqa1O70AAULx8Xd+QhYpgJur5skTlK/hw+MVoMdWXQKJp9xKGmfg
	p7dDyz4geqcFT89n4g4nj+xV3CaGNS/gh6cNCYhWfXiLa97Co94fTcx66XOwXE98
	3bQpo+s5Qy7BDgXUVhI80A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775350476; x=
	1775436876; bh=aeLYEhk4eGUGkw9vfbxPgVFNNvn28nlbdNrOwvhwmIs=; b=R
	SN/rZfSowY7YDXrJFxOk/dU4qtJ57et63vq2i/lNkzV1B+FBsYnX1hPxIvy7Y74y
	jsj/Kef8A5j1Pn34MISgE+kEt4mKj9IrOB2u6106rKaW0je/FgVt/nyO+njCxwMx
	JeUwBC8mk6AVCzwbI/exT2H/k2d2+kqj159zggiJW3vA8T8mO9MsIcMXScEFlSWU
	eB4S/U4qOwewBSdbCrORVQX6sNWTvFmWmSFvQe6Cr/201p/PB8lf32if32Wh1Krn
	TyxMEDj8U4DmlAHoyek5X2Sudg7oab/8wLqqACV3H55KSXNfkFpJ+KUVwIOrw/vA
	UXsDFlxqeAAhJy9R3WEAg==
X-ME-Sender: <xms:zLLRab1S5qkfQPuDMgmLg91Mzj01DCH0ZzVgwyCPGNWD7aOw5KXTow>
    <xme:zLLRaU7cMU2G0_3EryZcWkDkiGC88Lgz7xbOielEVmS2xYoIkM5gEsbSTqSeWWi7s
    fHmJhxZ81AhZb34wbg14xGSO8xfWC7MMVQVe_KwhgUmk4ck5mZFvvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeefgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:zLLRaa0HIlo6XcSzRF88UkV-11Wyr9JdgQqqN4s2ObH2LITp_AvVaQ>
    <xmx:zLLRaZqZqoTOrG7PZ67XuuTANoPC3lzeEPlA-PvM6FlZSvucMFFLpg>
    <xmx:zLLRaXX7QVwSYwEHw397hMFr34otq3MqCoXMBqJuNJjqIvRscRpQ8Q>
    <xmx:zLLRaSowVAYxuWrgsuz_3bPrBXjle6ot2mbeMYwzEuzukLU-2ftAhQ>
    <xmx:zLLRaX6rNMfAbPATQC4Kyu3TR18huEfO5AVjqGnAC7wBGprGqm9JoOYS>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4D2572CE3F96; Sat,  4 Apr 2026 20:54:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4QOj-V9OT7R
Date: Sat, 04 Apr 2026 20:54:16 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <dbfb6211-179b-4d92-aa62-374df2d39490@app.fastmail.com>
In-Reply-To: <20260402032424.678528-13-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-13-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 12/16] platform/x86: lenovo-wmi-other: Add GPU tunable
 attributes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Derek,

On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> Use an enum for all GPU attribute feature ID's and add GPU attributes.
>
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
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst 
> b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 189dd4d31926..988ae04ff724 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -69,6 +69,16 @@ Each attribute has the following properties:
> 
>  The following firmware-attributes are implemented:
>   - cpu_temp: CPU Thermal Load Limit
> + - dgpu_boost_clk: Dedicated GPU Boost Clock
> + - dgpu_enable: Dedicated GPU Enabled Status
> + - gpu_didvid: GPU Device Identifier and Vendor Identifier
> + - gpu_mode: GPU Mode by Power Limit
> + - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline 
> Offset
> + - gpu_nv_bpl: Nvidia GPU Base Power Limit
> + - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
> + - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
> + - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
> + - gpu_temp: GPU Thermal Load Limit
>   - ppt_cpu_cl: CPU Cross Loading Power Limit
>   - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h 
> b/drivers/platform/x86/lenovo/wmi-capdata.h
> index f2d45cd7a188..891b12ca1db6 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -20,6 +20,7 @@
> 
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU = 0x01,
> +	LWMI_DEVICE_ID_GPU = 0x02,
>  	LWMI_DEVICE_ID_FAN = 0x04,
>  };
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 56c8b84f306d..57b6b6f17f33 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -61,6 +61,19 @@ enum lwmi_feature_id_cpu {
>  	LWMI_FEATURE_ID_CPU_IPL =	0x09,
>  };
> 
> +enum lwmi_feature_id_gpu {
> +	LWMI_FEATURE_ID_GPU_NV_PPAB =		0x01,
> +	LWMI_FEATURE_ID_GPU_NV_CTGP =		0x02,
> +	LWMI_FEATURE_ID_GPU_TEMP =		0x03,
> +	LWMI_FEATURE_ID_GPU_AC_OFFSET =		0x04,
> +	LWMI_FEATURE_ID_DGPU_BOOST_CLK =	0x06,
> +	LWMI_FEATURE_ID_DGPU_EN =		0x07,
> +	LWMI_FEATURE_ID_GPU_MODE =		0x08,
> +	LWMI_FEATURE_ID_DGPU_DIDVID =		0x09,
> +	LWMI_FEATURE_ID_GPU_NV_BPL =		0x0a,
> +	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
> +};
> +

I don't have feature ID's 0x6 to 0xa defined in the spec that I have (which I got off the Yoga team last week).
We should sync up offline and compare notes.

Mark
