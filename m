Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEF728686;
	Sun, 30 Aug 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788093054; cv=none; b=mvYvsS0SxTOMlv5k3yhvaRRlhDqxhAcBPwQ+EwrAE/i4qB8q6YLlZTLdbJ6Oj6U3qWSjqxmzBzSW54kvSFJMX7XNkEgdR110sN1471ZBFP8c0eQZ2GBVGO1AkRMJ2xAM+aYVdaU8dTs6gK3jRpAy8KLyL1EAYLALQLhPMXuhn1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788093054; c=relaxed/simple;
	bh=AkpaE4j9f5lyxuk4jd9qVHB3nXf8xfcZSXNVP12Ru3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfyGl47zbmgrpi6J+BbiwH0dW8LFL14uMP3yIfeD689u3x/3Y/K89GqTzCy3bj4CtT5/JMyhKHwEiqmcmT4oq7RS+CT+rIUTd5EjcmXS4hkkssNl4muoE1R6xYUVSKvJXXySiCy+A0YzfliKFCMaVKGTo7CkkeMDRvI3HNwoEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGPCtg1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGPCtg1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036031F000E9;
	Sun, 30 Aug 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788093052;
	bh=wYv/c8xgtRcRRjKu/TXHwCu9Z0itCsQOguvE04sQbc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fGPCtg1rwvIibpRY0kQDggBvqoH6LCwFqqSDzBHqkk6JOI6l3OAJrakqPbn5inPs+
	 1d8I0QuTml0bDof/kaFF2n7hXIUO+Ncalh93ReWcoTP2UfTTSYPcHJLCamXFJDIXNd
	 QtUGgTPq6m4HmG839i5h3NTbjzwYhk3YvGi1aOz5/8hEEdRY25PI438A5oLhSBBKuD
	 yZoGyzeBTaEQOyvsTigWrY8R+DAJAylJXdNGMz4RC/bHlBSab75zIjdloIVqE45uPs
	 4mt7S7oj7neX0fX9ujdufcYacOhss0OPvS/E5yJXgYS8ak+B5oP5phJ6r+Aou0CI+k
	 CsqkzagPni9RA==
Message-ID: <619cbfad-5c9d-4491-bc21-229107d90223@kernel.org>
Date: Sun, 30 Aug 2026 14:30:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
To: Jakob Berg Jespersen <dev@berg.pm>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tooraj Taraz <tooraj.taraz@yahoo.com>,
 "Joseph V. Lavigne" <jlavig88@gmail.com>, "D. Manresa" <dmanresa@gmail.com>
References: <20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Aug-26 10:29, Jakob Berg Jespersen wrote:
> INT3472 can describe a second sensor power rail as a GPIO of type
> POWER1 (0x08), which the driver does not recognise, so the rail is left
> unmapped and never enabled:
> 
>   int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
>   not work
> 
> On the Microsoft Surface Pro 7+ the rear camera's INT3472 (INT347A,
> ov8865) has such a pin; without it the ov8865 "dvdd" supply resolves to
> a dummy regulator and the sensor never probes.
> 
> Define the POWER0 (0x07) and POWER1 (0x08) GPIO types and map POWER1 to
> a regulator with con_id "dvdd" for all devices, the supply the in-tree
> ov8865 driver already requests. POWER0 is defined but left unmapped, as
> no device that uses it is known.
> 
> Out-of-tree work approached the same rail by exposing it to the sensor
> as a new "pwr1" supply (linux-surface PR #1867 for the Surface Pro 9,
> PR #2201 for the Pro 7+ ov8865); mapping POWER1 to the existing "dvdd"
> keeps the change contained to int3472.
> 
> With this change the Surface Pro 7+ rear camera probes and streams
> reliably.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/1867
> Link: https://github.com/linux-surface/linux-surface/pull/2201
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>


Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans

> ---
> Changes in v3:
> - No functional changes; the patch is identical to v2, rebased onto
>   current pdx86/for-next (which has since gained the multi-HID GPIO map
>   entries and the IMX471 "vana" entries).
> - Resent with linux-media@vger.kernel.org on Cc, as requested.
> - Link to v2: https://patch.msgid.link/20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm
> 
> Changes in v2:
> 
> - Reworked from a per-device INT347A quirk into a generic mapping of the
>   POWER1 (0x08) GPIO type to "dvdd" for all devices, per review.
> - Added INT3472_GPIO_TYPE_POWER0 (0x07) and POWER1 (0x08) definitions;
>   POWER0 is defined but left unmapped for now.
> - Retested on the Surface Pro 7+ (kernel 7.1.5): the rear ov8865 probes,
>   instantiates its VCM, and streams.
> - Link to v1: https://patch.msgid.link/20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 8 ++++++++
>  include/linux/platform_data/x86/int3472.h     | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 6c729fcfce5d..6ab8e589fcd3 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -266,6 +266,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "avdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_POWER1:
> +		*con_id = "dvdd";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_DOVDD:
>  		*con_id = "dovdd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -296,6 +300,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   * 0x00 Reset
>   * 0x01 Power down
>   * 0x02 Strobe
> + * 0x07 Power 0
> + * 0x08 Power 1
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> @@ -382,6 +388,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +	case INT3472_GPIO_TYPE_POWER1:
>  	case INT3472_GPIO_TYPE_DOVDD:
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
> @@ -408,6 +415,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		case INT3472_GPIO_TYPE_POWER_ENABLE:
>  			second_sensor = int3472->quirks.avdd_second_sensor;
>  			fallthrough;
> +		case INT3472_GPIO_TYPE_POWER1:
>  		case INT3472_GPIO_TYPE_DOVDD:
>  		case INT3472_GPIO_TYPE_HANDSHAKE:
>  			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index a73841dfae27..b1040e36deb8 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -25,6 +25,8 @@
>  #define INT3472_GPIO_TYPE_RESET					0x00
>  #define INT3472_GPIO_TYPE_POWERDOWN				0x01
>  #define INT3472_GPIO_TYPE_STROBE				0x02
> +#define INT3472_GPIO_TYPE_POWER0				0x07
> +#define INT3472_GPIO_TYPE_POWER1				0x08
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> 
> ---
> base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
> change-id: 20260719-sp7plus-int3472-8f014b8de79c
> 
> Best regards,
> --  
> Jakob Berg Jespersen <dev@berg.pm>
> 

