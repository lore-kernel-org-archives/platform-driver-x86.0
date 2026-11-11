Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400022;
	b=R/nZhxR0RLCCsvtAqy8vWvLa6uDGDhzMSHRuOaN18CAFOpkhJMaegZCHzB89JZaBgDk2
	 9YJlfwJPqOibjipfFfWp02+7WmwYbUZbbYbP5oN1YZ+SloJQjRofLaF/Sa3gg1mQe5mvO
	 giB1K2LwKZsREa2VrY0D95XKKtCjGYQjR95u4a5+WB5KQAVOTyFYosiCQfA2E538Zk4hl
	 iGbiDZi89VBvMC43DOuGocNGMYzlFZaAjeg1MQ6STQiS4gfKKqoX+Mn79o5pilthONA1y
	 qmBFxBBcNWRwWn/nRdPdI8pmw45Iqre9YpEYBwXZnwsyZ+7/eWHljVnSsVaK+kBqvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400022;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ty9rPwMxhpx+zjNI13KdsoMqrXSZhKgLEC01TrXNvMM=;
	b=iiyiwaWQzLm2GS6+tYG/VNoIOMcZUo41Oq4nR8E3lgnT9yxPn3SKthobwtj8lTME0YkV
	 x2Bos9h4qXEpEXcWt0kH3bZpJZc+BZkvJDcjyUHyz5t5CTRkpe9zKedhKqQPJ3QGOjSDy
	 tf6BMy8q05bxvmenwaW1Tsq83NeJIzQWBLY+9g9blmcRmvFApCopUTVJnYeE+wePAV1jb
	 qC4g7krztpTTTN6Lojaxw23USaeMIM4HI5kG5q/Znane95o++I8FUZYvKSFMDOuvVetYs
	 De7vQFbXVHvRcj+sueX9+GdWvCHyuozHx8pPaGlTcbWrYqrQ1GbfsodvUzLxlDeCs/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HBusxRWh;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE922606A31C;
	Wed, 11 Nov 2026 12:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE922606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HBusxRWh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400017; x=1825936017;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=V2Hyg/sqJQwHx0xYHtk2PzJGLwRpGxF/4d8g72ZeQBA=;
  b=HBusxRWhQ/natniOESsxtOLIoIp5sSg5C5ABzPCbWFwoH45Xq6diHfFc
   DgS7tR14k81VQAUiBe8jDgXM3ECk4TAbba5mUQk2KMKhCAxoV9rPcbn2I
   2N2mS2X57btY878Otz6Pvn1A7hW04BCqnY2VvkOIB5d9yZ/gBrPBkrwM6
   hA6/Vys+WEj4AyLWBJHl6w6bzMJwAqdoSyWTnYfWWib+/4e1gmcJWJGKj
   iZDj6BRGyrZe7pM2Ceg9JsYSQKgJeykoVtvmWJ/oycxmayZOP5mE6KaLQ
   tMHJQLqPBcGe6RW0Kd07Q5daEZkX+CiBSOVRfTGmq7pAGLrDicb0YvPiW
   Q==;
X-CSE-ConnectionGUID: sp/5N1nbQlylwGZO1eAthQ==
X-CSE-MsgGUID: Vk0rZ48XSu2s/MYbUbPFtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3077431"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3077431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:26:57 -0800
X-CSE-ConnectionGUID: ymh8QBLDQBSWDEotb9E7Xw==
X-CSE-MsgGUID: 7EZ0xVbORfS6Q7t5s3Ak8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8409195"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:26:55 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Nov 2026 14:26:51 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Add TUXEDO Stellaris 16
 - Gen8 - Intel
In-Reply-To: <20261111115811.498955-1-wse@tuxedocomputers.com>
Message-ID: <18e8c77c-f605-8eb6-158c-69f3b49ed458@linux.intel.com>
References: <20261111115811.498955-1-wse@tuxedocomputers.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Nov 2026, Werner Sembach wrote:

> Same features as the Gen7. Just 2 new entries for the new boardnames.

The changelog should be readable as standalone, which this clearly isn't.

> I wrote the ident the same way the system product dmi string is written,

Don't use personalized terms like "I wrote".

> which itself now follows how the device is listed in your online shop. The
> only actual change was adding the '-' with spaces around.

What online shop have is irrelevant detail when it comes to kernel changes.

--
 i.

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> This commit was built on top of Armins latest series:
> https://lore.kernel.org/all/20261110165318.631010-1-W_Armin@gmx.de/
> 
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index dc99bf8a8568c..e2a6a704e942e 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -3629,6 +3629,22 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  		},
>  		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>  	},
> +	{
> +		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx"),
> +		},
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
> +	},
> +	{
> +		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx_mLED"),
> +		},
> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
> +	},
>  	{
>  		.ident = "TUXEDO Book BA15 Gen10 AMD",
>  		.matches = {
> 

