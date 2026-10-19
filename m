Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BA4E06C0;
	Mon, 19 Oct 2026 11:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407773; cv=none; b=I8kxeBZ6T33O3lr8YqxgDZUwJBSiXGfhUmlpOocZsbd9gdAHFEMnXPSb2nfFjY/W84MMXrBFpjXhRtRR/zEaSC4797qyPNMZOVt6wMvvjKOo8tpYySkOPVcdqQk5suMVyoP55P6aDWKI6swgajB+rfXh5KUSG1N/3Nk2bZ1VtJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407773; c=relaxed/simple;
	bh=+BJ29K1xdm4tXo5HnHM9Rc3vocSn7HFTWstlXWPrzcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGrQtnwwzp6VyaNk4XREljKIMXxHx/dK+jIO+5I21r89E6f6qeLSo7yyYuNBM8be53Qb0SzOWyZ46XjVXw5JfN2x/Scqz33PRcxqI7QZOlDXmhe5t1JIoa+wyB9pTsLjLFh3dwfUULFwv93kYpxwlQvBxxWpmTINBATHxDmrSvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FjMJx0wU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FjMJx0wU"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B93D4593;
	Mon, 19 Oct 2026 13:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792407645;
	bh=+BJ29K1xdm4tXo5HnHM9Rc3vocSn7HFTWstlXWPrzcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FjMJx0wU669jOS1vIqQwv60iJTLFy8Dznpdgh+uqF4YvHcfHzPm58N88JGVHHXBJP
	 Zlt3qBXerIyS7yflz/GvBUfNArpEKKRM3FlZFq+BSjns6MBrc72DaZ2J1V5sQAmnkC
	 xrUj12Sfm9giDGUd8RGxg3kc7lkwI2KaloudSk5U=
Message-ID: <c4668283-dfec-46bf-a332-b021b51c84b4@ideasonboard.com>
Date: Mon, 19 Oct 2026 12:02:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO
 type to a "avdd" regulator
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antti Laakso <antti.laakso@linux.intel.com>
Cc: Alexander Patrakov <patrakov@gmail.com>,
 Leif Skunberg <diamondback@cohunt.app>, Sahan Nissanka
 <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
 <20261016141716.130220-6-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261016141716.130220-6-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans

On 16/10/2026 15:17, Hans de Goede wrote:
> Before commit 34e31390a3b9 ("platform/x86: int3472: support the POWER1 GPIO
> type") the int3472/discrete.c code mapped 3 GPIO types to regulators:
> 
> 0x0b INT3472_GPIO_TYPE_POWER_ENABLE -> avdd
> 0x10 INT3472_GPIO_TYPE_AVDD         -> dovdd
> 0x12 INT3472_GPIO_TYPE_HANDSHAKE    -> dvdd
> 
> (with the INT3472_GPIO_TYPE_AVDD define wrongly being named
> INT3472_GPIO_TYPE_DOVDD in the past)
> 
> The OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6 uses the following
> GPIO types:
> 
> 0x0f INT3472_GPIO_TYPE_DOVDD
> 0x10 INT3472_GPIO_TYPE_AVDD
> 0x11 INT3472_GPIO_TYPE_DVDD
> 
> A previous patch in this series maps the DOVDD and DVDD types to "dovdd"
> resp. "dvdd" regulators. This creates a regulator naming conflict on this
> laptop for the old AVDD to "dovdd" mapping.
> 
> This patch fixes this by changing the unfortunate mapping of the AVDD type
> to a "dovdd" regulator by swapping the POWER_ENABLE and AVDD mappings,
> mapping POWER_ENABLE to "dovdd" and AVDD to "avdd".
> 
> This is safe to do because all sensors which may be used with the INT3472
> code are listed in drivers/media/pci/intel/ipu-bridge.c and a manual check
> of all drivers for sensors listed there in current media-committers/next
> has found that all drivers either support all 3 of "dovdd", "avdd" and
> "dvdd" or none of them and enable all 3 of them at the same time. So this
> swap ends up being a no-op.
> 
> With the exception being the new in -next ov05c10 driver which only
> supports "avdd", this is fixed by an earlier patch in this series.
> 
> Note this change does not impact the recent adding of mapping POWER1 to
> a "dvdd" regulator since it does not touch any "dvdd" mappings.
> 
> Reported-by: Alexander Patrakov <patrakov@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com/
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Seconding Andy's comment!

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/discrete.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 18649ee448a4..ff94dc2ad8a1 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -270,7 +270,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
>   	case INT3472_GPIO_TYPE_POWER_ENABLE:
> -		*con_id = "avdd";
> +		*con_id = "dovdd";
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
>   	case INT3472_GPIO_TYPE_POWER1:
> @@ -282,8 +282,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
>   	case INT3472_GPIO_TYPE_AVDD:
> -		/* Should be avdd kept as dovdd for now to avoid regressions */
> -		*con_id = "dovdd";
> +		*con_id = "avdd";
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
>   	case INT3472_GPIO_TYPE_DVDD:

