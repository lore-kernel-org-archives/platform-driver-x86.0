Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ECA448CE4;
	Tue, 18 Aug 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049785; cv=none; b=A/GUbMgdoJRI4JEf1jshryFrb5G2YxBibSsEYxvGu+T3wR/Xp2lyvHqW+YQJXCqq10HdwJDxbqnGkB6JJKBtpX7OLN34BzmLAi061bByGQXULbNsrT+oIT1O5CiIgPDHC9KNVC1HG/G7gWfeNpw/dXFuktkqPFayfLHEiiiHoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049785; c=relaxed/simple;
	bh=3Jpk33CNwyIysWKSLVmeLo0WXKW3bNPwPeuxcWoHjHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIe166clymT+TOqbmGiwNui40wttD56veD2yhWdk1/okTJURM2Xsr/C3VSOxwOTaxqB5dMaQBe1rXh7X+h3aAlRd2w3te/60G7F6WA0oFzaGc3KJ5fVLSvVZCG/mWc6lgsumN4o4ongZalZFAsj21tctkd2HbAni42T8njGMVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfuIAp/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfuIAp/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D591F000E9;
	Tue, 18 Aug 2026 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049784;
	bh=b5ht3n+ByOd4znGxOYz+Dt16tpRrd+VtHxC/1y5Xwww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kfuIAp/P8pK1ShQlzS9R4bkT9jadigzQucwneFJmbkpF6O94Uavl+tfu1PLd1Ezv2
	 3OhI8VYklUKCm77KUIdwJxbZ6FuOrXyXXIKvDsibMh7s5LQFRpdoaZoBvmMA2fKZJd
	 0uK01Sno0ZbQRf0lWEgcjrdf9hy5mz2S82pBGy4jG2Y0qKCw0ifciMSnGxNobMWPbX
	 4OK8nf8V6FAwLgidZa9wBBIgl4jl/1noDl8uFZvfV3U4b/N2RmF93Simt+ixmh4wSU
	 IzbbC9OzvIC63FJW6w8aJhYbVt6x3fBTdtlu/iYA5Dpx6QhDs2MMYav4SkDZyt1YPH
	 rkqEHwLthfT3Q==
Message-ID: <a062f34e-4e26-457e-a116-5481d34bf8ff@kernel.org>
Date: Tue, 18 Aug 2026 12:43:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: add HP Spectre handshake delay
To: James Alexander <opensource@inspiredexperts.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260816204247.2844986-1-opensource@inspiredexperts.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260816204247.2844986-1-opensource@inspiredexperts.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Aug-26 22:42, James Alexander wrote:
> The OVTI08F4 sensor on an HP Spectre x360 14-eu0xxx failed to read its
> chip ID with error -121 when the existing 45 ms handshake delay was used.
> Increasing the delay to 150 ms allowed the sensor to probe.
> 
> Keep the existing delay for other OVTI08F4 systems. Add a reusable
> handshake-delay field to the discrete-device quirks and set it only for the
> affected HP Spectre family through DMI matching.
> 
> Compile-tested against Linux base fd923b32d761. Hardware-tested with the
> full patch set across 25 consecutive reboots on the affected laptop running
> Ubuntu 7.0.0-29-generic; the sensor probed successfully on every boot.
> 
> Signed-off-by: James Alexander <opensource@inspiredexperts.com>

Thank you for your patch.

There have been more reports about the 45 ms not being enough of a delay,
but IIRC I never got around to bumping the delay because even with
a bigger delay on the laptop in question the probe would still fail
approx. every 1 out of 10 boots and we got stuck on debugging that.

And then I dropped the bal on this, sorry.

See:
https://bugzilla.redhat.com/show_bug.cgi?id=2333331
https://bugzilla.redhat.com/show_bug.cgi?id=2333647

Note as mentioned there in some cases 200ms is necessary.

So please instead of adding this quirk, just bump the existing
OVTI08F4 delay from 45 ms to 200 ms as various other HP laptops
also need a bigger delay and 200 ms seems to do the trick everywhere.

Note it would be also good to add Link: tags to the 2 bugzillas
above.

Regards,

Hans





> ---
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 115bb3757..80efeb452 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -193,6 +193,9 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
>  		*con_id = int3472_gpio_map[i].con_id;
>  		*enable_time_us = int3472_gpio_map[i].enable_time_us;
> +		if (int3472_gpio_map[i].type_to == INT3472_GPIO_TYPE_HANDSHAKE &&
> +		    int3472->quirks.handshake_enable_time_us)
> +			*enable_time_us = int3472->quirks.handshake_enable_time_us;
>  		return;
>  	}
>  
> diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
> index 552869ef9..d31f7c764 100644
> --- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
> +++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
> @@ -8,6 +8,10 @@ static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
>  	.avdd_second_sensor = "i2c-OVTI2680:00",
>  };
>  
> +static const struct int3472_discrete_quirks hp_spectre_14_eu0xxx_quirks = {
> +	.handshake_enable_time_us = 150 * USEC_PER_MSEC,
> +};
> +
>  const struct dmi_system_id skl_int3472_discrete_quirks[] = {
>  	{
>  		/* Lenovo Miix 510-12IKB */
> @@ -17,5 +21,14 @@ const struct dmi_system_id skl_int3472_discrete_quirks[] = {
>  		},
>  		.driver_data = (void *)&lenovo_miix_510_quirks,
>  	},
> +	{
> +		/* HP Spectre x360 2-in-1 Laptop 14-eu0xxx */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> +					"HP Spectre x360 2-in-1 Laptop 14-eu0xxx"),
> +		},
> +		.driver_data = (void *)&hp_spectre_14_eu0xxx_quirks,
> +	},
>  	{ }
>  };
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index a73841dfa..797694aa8 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -96,6 +96,8 @@ struct int3472_cldb {
>  struct int3472_discrete_quirks {
>  	/* For models where AVDD GPIO is shared between sensors */
>  	const char *avdd_second_sensor;
> +	/* Override the default delay for handshake GPIO regulators */
> +	unsigned int handshake_enable_time_us;
>  };
>  
>  struct int3472_gpio_regulator {

