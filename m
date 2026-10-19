Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138D4DA9BC;
	Mon, 19 Oct 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407308; cv=none; b=ToYYJcmHvhdVU/k7v91Pr01CHRvjbCkrcnEyUoQ5Y42C8LjrDXM8h1PHvci9H8eKu6k1jH18SumZ0yoy10Hu3V+wTZo4BYawhNUQhy+Xvg0GeBLwLtODmrpbIZx97fTt+w703iYXVyIj03KWb1cUWtP//N3/rUkh6iVl54IBgw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407308; c=relaxed/simple;
	bh=4iNni5go5Y2+tg4d/7jutAUBiOcfhOjBzEjW1HPTiAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQVJwmDtpSHARkc15EnBZsTT1XG/RA5DU5nf+0vdeZ3iVnV9G5NluawFE9OgySTcJWagSr0BK67oC71Q+TWxoUx1YJVwB3T6skUVo3rsk8dgeMglSJ3b1v1gCCV6vsfklDWABiIqMxqfDZswtQuO18ecmbpTBRjZuSJnUqCIs9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jcvmi+e5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jcvmi+e5"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28481593;
	Mon, 19 Oct 2026 12:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792407177;
	bh=4iNni5go5Y2+tg4d/7jutAUBiOcfhOjBzEjW1HPTiAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jcvmi+e59lppAiP5uoO61vQ4tZlPXd9GOgoO3bP8+RGOMVmRaolTfBf31CrdYwq+y
	 mfkrhv7TWstX7UgwRX1f6VsUqN5m1W1U8T3SGf6FXCsEVDl9d5vEy5x22PAQk3eF9w
	 i5QrXiT2MfLnPHKSsBWvYuJgGpn3RY3rEqGuZMtw=
Message-ID: <041fdf90-839c-43ab-a118-d5a49106f509@ideasonboard.com>
Date: Mon, 19 Oct 2026 11:54:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86: int3472: Rename avdd_second_sensor to
 power_enable_second_sensor
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
 <20261016141716.130220-5-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261016141716.130220-5-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans

On 16/10/2026 15:17, Hans de Goede wrote:
> The avdd_second_sensor quirk is for when a GPIO with the power-enable type
> is shared between sensors. Sofar power-enable happened to be mapped to
> a "avdd" regulator. But that is going to change in future patches, rename
> the quirk to better reflect what it actually is for.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/discrete.c        | 2 +-
>   drivers/platform/x86/intel/int3472/discrete_quirks.c | 2 +-
>   include/linux/platform_data/x86/int3472.h            | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 046f93ed1c9f..18649ee448a4 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -437,7 +437,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   
>   			break;
>   		case INT3472_GPIO_TYPE_POWER_ENABLE:
> -			second_sensor = int3472->quirks.avdd_second_sensor;
> +			second_sensor = int3472->quirks.power_enable_second_sensor;
>   			fallthrough;
>   		case INT3472_GPIO_TYPE_POWER1:
>   		case INT3472_GPIO_TYPE_DOVDD:
> diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
> index 552869ef91ab..4e57d3f73111 100644
> --- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
> +++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
> @@ -5,7 +5,7 @@
>   #include <linux/platform_data/x86/int3472.h>
>   
>   static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
> -	.avdd_second_sensor = "i2c-OVTI2680:00",
> +	.power_enable_second_sensor = "i2c-OVTI2680:00",
>   };
>   
>   const struct dmi_system_id skl_int3472_discrete_quirks[] = {
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index f0ec2e7c68fa..86b7510d5a45 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -98,8 +98,8 @@ struct int3472_cldb {
>   };
>   
>   struct int3472_discrete_quirks {
> -	/* For models where AVDD GPIO is shared between sensors */
> -	const char *avdd_second_sensor;
> +	/* For models where power-enable GPIO is shared between sensors */
> +	const char *power_enable_second_sensor;
>   };
>   
>   struct int3472_gpio_regulator {

