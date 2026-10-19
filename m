Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE34848AC;
	Mon, 19 Oct 2026 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407743; cv=none; b=e1/yVKyuDALzHwx/ceJwGqm7ePq0Iuivlbxal4IDNRv/D94BuAfHSvand9rfGAsDVPPIY9qLSG/fg6MNThTt2tSpU8AcH5ABxGpamn5uyEJ/2Bh5/slmTka/NpS4WIXbh8ykb6UTKbLEJs6A53q9YS1lonVTmqeSQ8k0EdfzIXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407743; c=relaxed/simple;
	bh=J9TOpsrVFCnEu+RgE2VIHDZ8x8cazGgWZp8Kspa11qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+UzAfjLFItVhPpOQ/pg/5jBsGnKdnPLbs/hEpd68M4UpQlY7/L62C9hh64S9YOin1TZhOcgu7XdgPjavX0aTaZukBHcYHZ2n+Ho60DaMhNwnIz9dfcTYLo3VEQfcogirCP7ceSgQKpmmrgEpM0tL4DF9j4dq1nTBZC6Tiz0EiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uwzk1Ofg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uwzk1Ofg"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FA1D593;
	Mon, 19 Oct 2026 13:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792407613;
	bh=J9TOpsrVFCnEu+RgE2VIHDZ8x8cazGgWZp8Kspa11qw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uwzk1OfgyvKJDuafy+/0ptFC/xJBJiI9dJjKAsTtHiNDaMUUmP4eCA3IiSIqfd0lz
	 1s8bsUt0DW5mXxa7VpEI0sj9Rpn26AT8JUSlHneUmcMcfSatOV2X9oZmn39TXn5mJe
	 n683NXxPVrCwsZUneRy58fgzE3xo2RZOYteEX/bg=
Message-ID: <93136a91-62e5-429b-acd1-2d83e78e1d21@ideasonboard.com>
Date: Mon, 19 Oct 2026 12:02:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] platform/x86: int3472: Add support for DOVDD and DVDD
 GPIO types
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
 <20261016141716.130220-4-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261016141716.130220-4-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans

On 16/10/2026 15:17, Hans de Goede wrote:
> Add defines for INT3472_GPIO_TYPE_DOVDD (type 0x0f) and
> INT3472_GPIO_TYPE_DVDD (type 0x11) and map them to regulators with
> matching names.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/platform/x86/intel/int3472/discrete.c | 12 ++++++++++++
>   include/linux/platform_data/x86/int3472.h     |  2 ++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index f3d6c6ccad0d..046f93ed1c9f 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -277,11 +277,19 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   		*con_id = "dvdd";
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
> +	case INT3472_GPIO_TYPE_DOVDD:
> +		*con_id = "dovdd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>   	case INT3472_GPIO_TYPE_AVDD:
>   		/* Should be avdd kept as dovdd for now to avoid regressions */
>   		*con_id = "dovdd";

Won't this cause any device that has a gpio type of both 0x0f and 0x10 to fail on this commit 
because of the duplicate mapping? On the other hand, if it needs both rails then it wasn't working 
anyway, so:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
> +	case INT3472_GPIO_TYPE_DVDD:
> +		*con_id = "dvdd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>   	case INT3472_GPIO_TYPE_HANDSHAKE:
>   		*con_id = "dvdd";
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -403,7 +411,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   	case INT3472_GPIO_TYPE_STROBE:
>   	case INT3472_GPIO_TYPE_POWER_ENABLE:
>   	case INT3472_GPIO_TYPE_POWER1:
> +	case INT3472_GPIO_TYPE_DOVDD:
>   	case INT3472_GPIO_TYPE_AVDD:
> +	case INT3472_GPIO_TYPE_DVDD:
>   	case INT3472_GPIO_TYPE_HANDSHAKE:
>   		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
>   		if (IS_ERR(gpio))
> @@ -430,7 +440,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   			second_sensor = int3472->quirks.avdd_second_sensor;
>   			fallthrough;
>   		case INT3472_GPIO_TYPE_POWER1:
> +		case INT3472_GPIO_TYPE_DOVDD:
>   		case INT3472_GPIO_TYPE_AVDD:
> +		case INT3472_GPIO_TYPE_DVDD:
>   		case INT3472_GPIO_TYPE_HANDSHAKE:
>   			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
>   							     con_id, second_sensor);
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index e1d5c4915ef7..f0ec2e7c68fa 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -30,7 +30,9 @@
>   #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>   #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>   #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_DOVDD					0x0f
>   #define INT3472_GPIO_TYPE_AVDD					0x10
> +#define INT3472_GPIO_TYPE_DVDD					0x11
>   #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>   #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>   

