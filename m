Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59454D0CD1;
	Mon, 19 Oct 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407268; cv=none; b=hoWCHM1R1WBJjG3cIoMyBeHoK/i4wm9yuedK4Qe/n+cVI0+w1ZvNl+jAv6T0GXBB/PDR847RWxg7jBwZeTIZtPwnXDJHZJi2UeaqmQuC39J8pbDiimDM1lpk/bDDrffDbGsXoq0YmbN/9liChdi980ZAV4jSoXsyU0gTOh8FUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407268; c=relaxed/simple;
	bh=5ZzKxhoY7usesmeANVXRKb0m6DgD5hkWm34NgfORcCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS7OWsK0b5zEd5QGL8/cqUmu8/BME+y4syvb29pTVAsELfafln/rn46W5vrFO329OvzHABX/c2ZpynIbzM5rjqXF0nzzsXVSkuyj6AsY6ksDsD4UvicAzw50KleE5oMMXepnOl/TZeoJSeDSUdMx1M474fclukG67elqADZj6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MhIAgSmP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MhIAgSmP"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A34F593;
	Mon, 19 Oct 2026 12:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792407136;
	bh=5ZzKxhoY7usesmeANVXRKb0m6DgD5hkWm34NgfORcCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MhIAgSmPg9Ages6+1wV5D14WQRy+0vjM8YwYUe/kqGelR5O2ulGbZV0Dd8ywh5WHK
	 nhgiaW6c9Hj6tY5TeIY8yt3bhTrk7yw/M2oGCBNjwRTJySV/11AjRsS1Rld07DvbFv
	 +L6dYWKM1E2xb82rByFA33td8VcwcoQUsmM5fMQg=
Message-ID: <eb8398a2-5c62-4a96-ae8f-06353f347b3c@ideasonboard.com>
Date: Mon, 19 Oct 2026 11:54:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform/x86: int3472: Rename DOVDD GPIO type to AVDD
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
 <20261016141716.130220-3-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261016141716.130220-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans

On 16/10/2026 15:17, Hans de Goede wrote:
> The window drivers call GPIO type 0x10 AVDD not DOVDD, rename
> the INT3472_GPIO_TYPE_DOVDD define to INT3472_GPIO_TYPE_AVDD to match.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/discrete.c | 7 ++++---
>   include/linux/platform_data/x86/int3472.h     | 2 +-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index b19ea6ee3374..f3d6c6ccad0d 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -277,7 +277,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   		*con_id = "dvdd";
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
> -	case INT3472_GPIO_TYPE_DOVDD:
> +	case INT3472_GPIO_TYPE_AVDD:
> +		/* Should be avdd kept as dovdd for now to avoid regressions */
>   		*con_id = "dovdd";
>   		*gpio_flags = GPIO_ACTIVE_HIGH;
>   		break;
> @@ -402,7 +403,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   	case INT3472_GPIO_TYPE_STROBE:
>   	case INT3472_GPIO_TYPE_POWER_ENABLE:
>   	case INT3472_GPIO_TYPE_POWER1:
> -	case INT3472_GPIO_TYPE_DOVDD:
> +	case INT3472_GPIO_TYPE_AVDD:
>   	case INT3472_GPIO_TYPE_HANDSHAKE:
>   		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
>   		if (IS_ERR(gpio))
> @@ -429,7 +430,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   			second_sensor = int3472->quirks.avdd_second_sensor;
>   			fallthrough;
>   		case INT3472_GPIO_TYPE_POWER1:
> -		case INT3472_GPIO_TYPE_DOVDD:
> +		case INT3472_GPIO_TYPE_AVDD:
>   		case INT3472_GPIO_TYPE_HANDSHAKE:
>   			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
>   							     con_id, second_sensor);
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index b1040e36deb8..e1d5c4915ef7 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -30,7 +30,7 @@
>   #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>   #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>   #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> -#define INT3472_GPIO_TYPE_DOVDD					0x10
> +#define INT3472_GPIO_TYPE_AVDD					0x10
>   #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>   #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
>   

