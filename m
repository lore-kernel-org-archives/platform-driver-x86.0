Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4CD3DAAA3;
	Fri, 21 Aug 2026 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338576; cv=none; b=QIJ3Ym9Zw1o7OY28LJaI4t3dXsBQf9hAJboKr0Ij6f/qdINsU8Xl1L6Fvw/HfFBMAHfDhTEozNDssLzLDvU4MhiKWnVgYu7XDgz6OmyWCObY1iyjcgh560scahVLZMKImNvwT1p9BYqLTsI4jZviaL0HPPpz/JPwgKzxKYczIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338576; c=relaxed/simple;
	bh=Zki8O9DF3A9xDZdz8vUsgJljGe4YGZv3UtocOxPJ6/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8eFh9QYTNQGpVcQTkmQfe4Az0m5VJt3RewgZWgEvS5ZAOK+MC2Rg13hVAsM9TvliblxoxImK+WZNDGe5LuM//bAt7cVIK0BbJwGAqhii/dl5DXfxNXqfgDVH/9iKeivDTWkiZoz43XRN5d5F8BfFY7aaDGcniN8xUgpKjjRjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erlTA2eb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erlTA2eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787338575; x=1818874575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zki8O9DF3A9xDZdz8vUsgJljGe4YGZv3UtocOxPJ6/Q=;
  b=erlTA2ebd81kouKnJzt66IhRIntywi/83dWfKO9kvFgiT5WHckPmbgja
   SKGe3rc/xT23Fb0JvNxliYWQMKY94uCW138/ys1mZ12KyEtQj8zjJb+a2
   dUouFNVbXIW9BccYxKuACepRPZDg0YqTo8S1wTmWRyJUUkRqdCs8HNug4
   VZfrNHQHkuO5+UcqEMZevjGuqUonu8GvvCyFVrGzzMEe2SIoSWhcTRZAO
   POJacBPHigh4d2hMLTRQRwtW0d4W1ivYBSpl4kSMU5AkB/M/0IjFxaz6x
   VwfqGMn/FYy24C9hL4ybl4CNlhfe0CuOD5jgXX8fp+VXmwLt4PuVqfHpK
   Q==;
X-CSE-ConnectionGUID: EP9IdAtcSoqNOfMulpob+g==
X-CSE-MsgGUID: tJMEGWLNQTW1lFgh69VuLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87912714"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87912714"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:56:14 -0700
X-CSE-ConnectionGUID: hgWw0xzBTpmMHZ5WybPwXQ==
X-CSE-MsgGUID: rl0RjzL3Slep7s7c9P13zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270645435"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.37])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:56:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 97C4D121BE2;
	Fri, 21 Aug 2026 21:56:19 +0300 (EEST)
Date: Fri, 21 Aug 2026 21:56:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: Fix uninitialised variable
 warning
Message-ID: <aoifU8ddCczzKHz4@kekkonen.localdomain>
References: <20260820205148.2910639-1-sakari.ailus@linux.intel.com>
 <20260820205148.2910639-3-sakari.ailus@linux.intel.com>
 <ca97b754-795e-e579-8705-9f2e3d66287b@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca97b754-795e-e579-8705-9f2e3d66287b@linux.intel.com>

Moi,

Thanks for the review.

On Fri, Aug 21, 2026 at 11:34:06AM +0300, Ilpo Järvinen wrote:
> On Thu, 20 Aug 2026, Sakari Ailus wrote:
> 
> > Fix a smatch warning about uninitialised err_msg variable, by printing the
> > error where it is handled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel/int3472/discrete.c | 21 +++++++++----------
> >  1 file changed, 10 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > index 6c729fcfce5d..cf8a58ef963b 100644
> > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > @@ -329,7 +329,6 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  	unsigned long gpio_flags;
> >  	union acpi_object *obj;
> >  	struct gpio_desc *gpio;
> > -	const char *err_msg;
> >  	const char *con_id;
> >  	int ret;
> >  
> > @@ -375,7 +374,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> >  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
> >  		if (ret)
> > -			err_msg = "Failed to map GPIO pin to sensor\n";
> > +			dev_err(int3472->dev, "Failed to map GPIO pin to sensor\n");
> >  
> >  		break;
> >  	case INT3472_GPIO_TYPE_CLK_ENABLE:
> > @@ -387,7 +386,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
> >  		if (IS_ERR(gpio)) {
> >  			ret = PTR_ERR(gpio);
> > -			err_msg = "Failed to get GPIO\n";
> > +			dev_err(int3472->dev, "Failed to get GPIO\n");
> >  			break;
> >  		}
> >  
> 
> ssahiko is not happy about dev_err_probe() -> dev_err() conversion.

I was wondering, too, whether I should keep it, but then again returning
the error won't help here (as of now at least) and it is probably not
possible -EPROBE_DEFER would be returned in these cases. I can keep using
dev_err_probe() though if you prefer that.

> 
> > @@ -395,14 +394,14 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  		case INT3472_GPIO_TYPE_CLK_ENABLE:
> >  			ret = skl_int3472_register_gpio_clock(int3472, gpio);
> >  			if (ret)
> > -				err_msg = "Failed to register clock\n";
> > +				dev_err(int3472->dev, "Failed to register clock\n");
> >  
> >  			break;
> >  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> >  		case INT3472_GPIO_TYPE_STROBE:
> >  			ret = skl_int3472_register_led(int3472, gpio, con_id);
> >  			if (ret)
> > -				err_msg = "Failed to register LED\n";
> > +				dev_err(int3472->dev, "Failed to register LED\n");
> >  
> >  			break;
> >  		case INT3472_GPIO_TYPE_POWER_ENABLE:
> > @@ -413,7 +412,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
> >  							     con_id, second_sensor);
> >  			if (ret)
> > -				err_msg = "Failed to register regulator\n";
> > +				dev_err(int3472->dev, "Failed to register regulator\n");
> >  
> >  			break;
> >  		default: /* Never reached */
> > @@ -436,11 +435,11 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  	int3472->ngpios++;
> >  	ACPI_FREE(obj);
> 
> As a general comment to logic in this function, it would be preferrable to 
> arrange code such that the error cases inside the switch could just return 
> directly.
> 
> To realize that, one would need to
> 
> 1) use __free() for obj
> 
> 2) handle that ngpios++ earlier; but I'm not even entire sure about ngpios 
> correctness and function, it seems to be only used for indexing in
> acpi_evaluate_dsm_typed() (successive calls into 
> skl_int3472_handle_gpio_resources()?) but then I don't understand why 
> the !obj early return does not increment ngpios too.

"ngpios" is in fact an iterator. In case of an error incrementing it
doesn't really matter and !obj signals the end.

I'll see how to refactor this a little in another patch. The intent here
was just to fix the smatch warning as we can't currently add int3472 to
Media CI because of it.

> 
> > -	if (ret < 0)
> > -		return dev_err_probe(int3472->dev, ret, err_msg);
> > -
> > -	/* Tell acpi_dev_get_resources() to not make a copy of the resource */
> > -	return 1;
> > +	/*
> > +	 * Either return an error or tell acpi_dev_get_resources() to not make a
> > +	 * copy of the resource.
> > +	 */
> > +	return ret < 0 ? ret : 1;
> >  }
> >  
> >  int int3472_discrete_parse_crs(struct int3472_discrete_device *int3472)
> > 
> 

-- 
Kind regards,

Sakari Ailus
