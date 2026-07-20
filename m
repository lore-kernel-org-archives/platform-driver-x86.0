Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8E2F549F;
	Mon, 20 Jul 2026 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542929; cv=none; b=Am8RJqxiWsgpzYI1ZB+L6bc8/ODu5EAts653al0URVvycv/j0gGn1FcWI5Nlw3StALx63ndht5cKvMw4Q+8BjcOUGDrLX0JSN0BUJeBtjy1i9maoQbzrDdpAcOwRTFZLaeho6FhlRb/hE1EFmmSHcbGmIucmTCEpG8EkcXjMYCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542929; c=relaxed/simple;
	bh=wYGuh2AldTLmkwb1KvBSxs4x7wXorFiwncoJUrpoD+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e52ei7ABpTRq8ZxAsROsmAPAO7dN4Liw5F4QUZqofGu1rU9OtOpIX3jap6AQcfzxgGqSGoSdBGIunAQDgbni3U93GyyNE2buG+Npup4yMUhhfOaosi1pH9Fok2mNqZYzzHlNXY+/qjaM9/2HixCLxFdEqjTFScDgHgcGlzqbz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWKUThwY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWKUThwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798BC1F000E9;
	Mon, 20 Jul 2026 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542928;
	bh=Pp2s5qzqaeiHN6QY2DvHLp6GwygBxFb6Oj0tpOeXAM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gWKUThwYg3pWE7idNIPxpT4QnoIJkxErV4NBOisf4inFKesmdXiFpH9tcZEAmi+nz
	 x4WfFN8rdy9UJSQD8cObeIATtOulv1Ftd3fNrrvqeskOj1ePVWsGmV4ecZGPtWTwo5
	 7CV8oQ7nhbwHhCVHPFngldzF7H+bbZn99jfOv5uOTcrV1mbkB9QrvBZFSZ5AkVaGF0
	 9PH6lPC1q4AOoUSMFIOJ/37cd92f5beBREKR4RnLiXKaLSk/dNTcFSDGAjNBwz1qqc
	 OsdacBGeaTEPgkQkha2m8C7HO8IE8Q9R+y3j8412H5Huu+7AE8xZjoMolWdEP5rlNR
	 gu9oRYRg8GEDA==
Message-ID: <5958d6d2-26a3-4ec4-b976-5881b33696df@kernel.org>
Date: Mon, 20 Jul 2026 12:22:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform: int3472: discrete: Support multiple HIDs per
 GPIO map entry
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 sakari.ailus@linux.intel.com
Cc: hpa@redhat.com, linux-media@vger.kernel.org,
 Daniel Scally <dan.scally@ideasonboard.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718203821.17684-1-tarang.raval@siliconsignals.io>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260718203821.17684-1-tarang.raval@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Jul-26 22:38, Tarang Raval wrote:
> Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
> GPIO quirk. As more sensors needing the same quirk are identified, this
> means adding a full duplicate table entry per HID, differing only in
> the HID string, which does not scale.
> 
> Change int3472_gpio_map::hid to a NULL-terminated hids array so a
> single entry can match any number of ACPI HIDs, letting new HIDs be
> added to the relevant array instead of duplicating quirk entries.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Tested-by: Kate Hsuan <hpa@redhat.com>

Thank you for your patch.

> ---
> change log:
> 
> v1 -> v2:
> 
> - Add per-HID comments to power_enable_hids_vana[] (Lenovo X9-14/X9-15
>   for SONY471A, Lenovo X1 Carbon G14 for TBE20A0)
> - Convert INT33F0 (mt9m114), INT347E (ov7251) entries to use named
>   power_enable_hids_*[] arrays instead of anonymous compound literals,
>   for style consistency
> - Did not convert OVTI08F4 (ov08x40) to a named array, and did not add
>   a NULL guard in int3472_gpio_map_hids_match(): not fully convinced
>   these changes are needed yet, but open to further discussion on both
> 
> Identified while reviewing Kate Hsuan's imx471 vana con_id patch, whose
> two near-identical SONY471A/TBE20A0 entries are collapsed here into
> one, backed by a new power_enable_hids_vana[] array.
> 
> This patch is on top of kate's imx471 driver series[1].
> 
> Link: https://lore.kernel.org/linux-media/20260629074026.35490-1-hpa@redhat.com/T/#t [1].
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 63 +++++++++++++------
>  1 file changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index adff564bf3fd..f70bd661592d 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -123,10 +123,35 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>  	return desc;
>  }
> 
> +/*
> + * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be added to
> + * this array instead of adding new quirk table entries.
> + */
> +static const char * const power_enable_hids_vana[] = {
> +	/* Lenovo X9-14 and X9-15 */
> +	"SONY471A",
> +	/* Lenovo X1 Carbon G14 */
> +	"TBE20A0",
> +	NULL
> +};

Small nit, IMHO it would be cleaner to have the comments behind the
actual HID strings, e.g. :

static const char * const power_enable_hids_vana[] = {
	"SONY471A", /* Lenovo X9-14 and X9-15 */
	"TBE20A0",  /* Lenovo X1 Carbon G14 */
	NULL
};

and maybe also mention which sensor the HID is for, e.g.:

static const char * const power_enable_hids_vana[] = {
	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
	"TBE20A0",  /* imx471 on Lenovo X1 Carbon G14 */
	NULL
};

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> +
> +static const char * const power_enable_hids_vdd[] = {
> +	/* mt9m114 */
> +	"INT33F0",
> +	NULL
> +};
> +
> +static const char * const power_enable_hids_enable[] = {
> +	/* ov7251 */
> +	"INT347E",
> +	NULL
> +};
> +
>  /**
>   * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
>   * sensor driver (as in DT bindings)
> - * @hid: The ACPI HID of the device without the instance number e.g. INT347E
> + * @hids: NULL-terminated array of ACPI HIDs of the devices without the
> + * instance number e.g. INT347E
>   * @type_from: The GPIO type from ACPI ?SDT
>   * @type_to: The assigned GPIO type, typically same as @type_from
>   * @enable_time_us: Enable time in usec for GPIOs mapped to regulators
> @@ -135,7 +160,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>   * GPIO_ACTIVE_HIGH otherwise
>   */
>  struct int3472_gpio_map {
> -	const char *hid;
> +	const char * const *hids;
>  	u8 type_from;
>  	u8 type_to;
>  	bool polarity_low;
> @@ -145,38 +170,27 @@ struct int3472_gpio_map {
> 
>  static const struct int3472_gpio_map int3472_gpio_map[] = {
>  	{	/* mt9m114 designs declare a powerdown pin which controls the regulators */
> -		.hid = "INT33F0",
> +		.hids = power_enable_hids_vdd,
>  		.type_from = INT3472_GPIO_TYPE_POWERDOWN,
>  		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
>  		.con_id = "vdd",
>  		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
>  	},
>  	{	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
> -		.hid = "INT347E",
> +		.hids = power_enable_hids_enable,
>  		.type_from = INT3472_GPIO_TYPE_RESET,
>  		.type_to = INT3472_GPIO_TYPE_RESET,
>  		.con_id = "enable",
>  	},
>  	{	/* ov08x40's handshake pin needs a 45 ms delay on some HP laptops */
> -		.hid = "OVTI08F4",
> +		.hids = (const char * const[]) { "OVTI08F4", NULL },
>  		.type_from = INT3472_GPIO_TYPE_HANDSHAKE,
>  		.type_to = INT3472_GPIO_TYPE_HANDSHAKE,
>  		.con_id = "dvdd",
>  		.enable_time_us = 45 * USEC_PER_MSEC,
>  	},
> -	{	/* imx471 expects "vana" as con_id for power enable */
> -		.hid = "SONY471A",
> -		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
> -		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
> -		.con_id = "vana",
> -		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
> -	},
> -	{
> -		/*
> -		 * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as con_id
> -		 * for power enable
> -		 */
> -		.hid = "TBE20A0",
> +	{	/* Sensors which expect "vana" as con_id for power enable */
> +		.hids = power_enable_hids_vana,
>  		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
>  		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
>  		.con_id = "vana",
> @@ -184,6 +198,17 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
>  	},
>  };
> 
> +static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
> +					const char * const *hids)
> +{
> +	for (unsigned int i = 0; hids[i]; i++) {
> +		if (acpi_dev_hid_uid_match(adev, hids[i], NULL))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
>  					    const char **con_id, unsigned long *gpio_flags,
>  					    unsigned int *enable_time_us)
> @@ -200,7 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		if (*type != int3472_gpio_map[i].type_from)
>  			continue;
> 
> -		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
> +		if (!int3472_gpio_map_hids_match(adev, int3472_gpio_map[i].hids))
>  			continue;
> 
>  		dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x %s\n",
> --
> 2.34.1
> 

