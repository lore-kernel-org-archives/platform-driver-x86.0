Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AF1DED7B
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382873; cv=none; b=lJcu9kURS0VxLTs8faHtlacQE/3jRNOTVjdaK4W0yhyqsDBy8CWS0Ok9Nhzb6ksrTmyKEDxfYk7b8a53rnulu9VwN3QhEZcelzRD37dGZtygwGn7cAj42R3hHUZnCO+xgbvCseDB3WIa7ePYYqaXbiWq0ae9RAqhf95dndbm6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382873; c=relaxed/simple;
	bh=Fl96K9esW6LWBAInRledYElVR4e9yckZGio8+/AWWlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c11Q5Fybt0Cvj1rmKIUiROpVZd9dYM2QgtEHF0Gt1ezn7qJFcsdrBTIQcJYiXBGVBSidQIn+imf/NyY/pES83pwF8XWxXLfTErPf5zVgwMOEGufOeQ8CcIETaoyaZJMf3I2gKwzqo7QGfaxzcpWNkjFbJsD+5QqwmRNhBuu2+Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQu1tinl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQu1tinl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737382872; x=1768918872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fl96K9esW6LWBAInRledYElVR4e9yckZGio8+/AWWlc=;
  b=dQu1tinlzubGuUMByDxbQUlsYkEqyDt3RLR0u/Jb78OKMyrILkyNV5z5
   UJzudDfUwYo790okxZf5NfigIhv1DNUk7NssTlf57XMQoVzCJmEd4zIJs
   9kzN2DDFivLBxg6E1p5/aOMjER2WWeIdX2d/kF5BU8S+Z2f+2LGoZH/1A
   qsDbE73hg3L4JZtaO4RvOXQVnjluqZHll8tAcCxScu8Q9CQwtuldTymmn
   53YPScPsonrFYsoTOAgHxxtGldeX0nG4Kc6A59KhABb2bdV1kTks0byOP
   BOoYueRdcwPWhSz3PvAX3hKY4H0E2SAYNydUz4dk8j5cTBv6qWm8XuvBP
   A==;
X-CSE-ConnectionGUID: nSo9PQNLRWWMu2LOkDmSrw==
X-CSE-MsgGUID: /JnTThbjTEKFH16Bl589tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41539654"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="41539654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 06:21:11 -0800
X-CSE-ConnectionGUID: 1X7Sl4JHRqq6CX4jAgKBDg==
X-CSE-MsgGUID: 4bSBk0qeRO22jCiy7625Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106333766"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 06:21:10 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B37411F94F;
	Mon, 20 Jan 2025 16:21:07 +0200 (EET)
Date: Mon, 20 Jan 2025 14:21:07 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
Message-ID: <Z45b03w7EV37yBeS@kekkonen.localdomain>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <06b5f424-52a5-4397-9d37-cbb628b98bb8@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06b5f424-52a5-4397-9d37-cbb628b98bb8@redhat.com>

Hi Hans,

On Mon, Jan 20, 2025 at 02:39:39PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
> > The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
> > documentation) but the int3472 indiscriminately provides this as a "reset"
> > GPIO to sensor drivers. Take this into account by assigning it as "enable"
> > with active high polarity for INT347E devices, i.e. ov7251.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Sorry but no this won't fly. If we go this route the amount of
> quirk code in the int3472 driver is going to get out of control.
> 
> Since you are matching this mapping on the sensor-type, this
> should be handled in sensor specific code, IOW in the sensor driver.
> 
> Also see my reply on the linux-media list here:
> 
> https://lore.kernel.org/linux-media/0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com/
> 
> Sorry but I have to hard nack this. There has to be some line
> where the pdx86 glue code stops bending over backwards and
> where some of the burden of supporting more then just devicetree
> moves to the sensor drivers.
> 
> *especially* since this mapping is going to be different per sensor-driver,
> with there being *no consistency at all* in the GPIO/pin names used in
> the sensor drivers just looking at drivers/media/i2c/ov*.c I see all of:

I beg you to reconsider as I have to disagree with your assessment, for the
following reasons:

The "reset" naming used by the int3472 driver comes from the int3472 driver
/ Windows specific ACPI amendments, not from the ACPI standard nor sensor
datasheets. Also in a proper ACPI implementation we wouldn't be dealing
with such GPIOs at all, instead this would simply work through ACPI power
resources.

There generally isn't a single datasheet name used for such signals across
sensor vendors (or even sensors from a single vendor). Thus the assumption
made in the int3472 driver isn't correct, even if DT bindings were using
the vendor-provided GPIO signal name from datasheets as-is.

We've done quite a bit of work to make the system firmware (including
design differences or outright bugs) invisible to the drivers elsewhere, I
don't see why we should make an exception here. To add to that, mapping the
GPIO name / function to what the driver expects is trivially done in the
int3472 driver, as this patch shows.

The naming used in Devicetree bindings is an ABI, we cannot change that.
For drivers it's an authoritative reference, even if the naming is not
aligned with hardware datasheets. DT binding authors are within their
rights in naming things differently form datasheets, too. I object drivers
having to assume GPIO naming imposed by the int3472 driver when it
conflicts with the naming (and functionality) used in DT bindings. Camera
sensors are a bit special as they require less trivial resources (GPIOs,
regulators and clocks) than most other devices while they are similarly
used in both DT and ACPI based systems.
  
> 
> "enable"
> "powerdown"
> "pwdn"
> "reset"
> "resetb"
> "Camera power"
> "Camera reset"
> 
> being used. Given this total lack of consistent pin naming this really
> needs to be fixed in the sensor drivers.

FWIW, the int3472 driver uses "power-enable" for a GPIO that powers on a
device. Do you expect drivers to support that as-is? Currently the int3472
driver appears to be the only one using that string in the kernel.

> 
> Not to mention the fact that the "reset" used by the ACPI tables is
> easily more correct for the ov7251 then the "enable" the driver
> currently expects given that the datasheet lists the pin as:
> 
> XSHUTDOWN input reset (active low with internal pull down resistor)
> 
> I don't see any "enable" in there were as the datasheet does say
> "reset".
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> > ---
> > since v1:
> > 
> > - Fixed device name string.
> > 
> >  drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > index d881b2cfcdfc..6404ef1eb4a7 100644
> > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > @@ -122,13 +122,47 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
> >  	return desc;
> >  }
> >  
> > -static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> > +/**
> > + * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
> > + * the sensor driver (as in DT bindings)
> > + * @devname: The name of the device without the instance number e.g. i2c-INT347E
> > + * @func: The function, e.g. "enable"
> > + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
> > + */
> > +static const struct int3472_reset_gpio_map {
> > +	const char *devname;
> > +	const char *func;
> > +	unsigned int polarity;
> > +} int3472_reset_gpio_map[] = {
> > +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
> > +};
> > +
> > +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
> > +					  const char **func, u32 *polarity)
> >  {
> >  	switch (type) {
> > -	case INT3472_GPIO_TYPE_RESET:
> > -		*func = "reset";
> > -		*polarity = GPIO_ACTIVE_LOW;
> > +	case INT3472_GPIO_TYPE_RESET: {
> > +		const struct int3472_reset_gpio_map *map = NULL;
> > +		unsigned int i;
> > +
> > +		for (i = 0; i < ARRAY_SIZE(int3472_reset_gpio_map); i++) {
> > +			if (strncmp(sensor_name, int3472_reset_gpio_map[i].devname,
> > +				    strlen(int3472_reset_gpio_map[i].devname)))
> > +				continue;
> > +
> > +			map = &int3472_reset_gpio_map[i];
> > +			break;
> > +		}
> > +
> > +		if (map) {
> > +			*func = map->func;
> > +			*polarity = map->polarity;
> > +		} else {
> > +			*func = "reset";
> > +			*polarity = GPIO_ACTIVE_LOW;
> > +		}
> >  		break;
> > +	}
> >  	case INT3472_GPIO_TYPE_POWERDOWN:
> >  		*func = "powerdown";
> >  		*polarity = GPIO_ACTIVE_LOW;
> > @@ -217,7 +251,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  
> >  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
> >  
> > -	int3472_get_func_and_polarity(type, &func, &polarity);
> > +	int3472_get_func_and_polarity(int3472->sensor_name, type, &func,
> > +				      &polarity);
> >  
> >  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
> >  	if (pin != agpio->pin_table[0])
> 

-- 
Kind regards,

Sakari Ailus
