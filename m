Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6C3F9F45;
	Mon, 31 Aug 2026 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180720; cv=none; b=ntoIQBwwwbLaBbqFL1l4NnbtgPnUuKZgkG+AZIv/AjSSdqVxD0+BEzTvickoJvXoO1bmogzZHBY9+u4SvYaUu+Kl1TQA1b0XRQ9lSkgzQnAFvJVtU6cmTen1+Vt7PnurFtqArNbxZo3IB6lKCf578vziLQzanZja5ZGlNXi/g68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180720; c=relaxed/simple;
	bh=Oajofr7KPV85sFuo8LuV95A6tWjTPeAaHRq02rjjfeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeDKUKt2GUJzRdWq4Q8jb2+lxHmGpSKia3txq0dFrMFO4/9dA34LDYJt4aKVMx8SoEc7fyMakQ3eXbPQzHBffV+nG9RziNppI4whlEGV35cz1Lsy9zouZ8CX4koMT7g91nA4GDGrMPtDJN5Nwqa+NH/mkz4e7aEobn4SF0PITTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbLRK3oa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbLRK3oa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788180717; x=1819716717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oajofr7KPV85sFuo8LuV95A6tWjTPeAaHRq02rjjfeU=;
  b=UbLRK3oaPRsAVIMYjpg7xB8PFmGp6Hv/5S8MM78iR3D2iS5UwfThJ+Bm
   ATQCJ44RKIOivkgvYpSSi1joOm6Vr6OljrsuRqeOAyFyRXJwvLGQPw+qk
   emtgWP+kvg8gjcJWYboOhEZDPbzptZmxLuBT0bEWvYqszd8VLM6AiHFQ+
   vgzPqUYo1tA0rPwB1W1K4lEUfAubWd0FUmdz6AF9tBT6E9uHbe/ZWdPcF
   Buy5mzPAVHplCY9Q4aIzkThmuPzwaZyk5dSAe7YoFG9S3bL9K1S5makMs
   jbRqvLb345TC6xsyGD0EKw7rVdQ1QUCVYLKWNxFIHoyDr0hgyWoPxIS+/
   A==;
X-CSE-ConnectionGUID: 97hTi5eUTjuoKy765E3bkQ==
X-CSE-MsgGUID: Zpg5qCWFSoWxoxFK1lQbmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88463140"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88463140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:51:56 -0700
X-CSE-ConnectionGUID: l4RmVY4yRKewSayijrYXnA==
X-CSE-MsgGUID: Z2L+3ySJSeazq0gcpPIuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267460591"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.140])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:51:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B8B5411F7F5;
	Mon, 31 Aug 2026 15:51:49 +0300 (EEST)
Date: Mon, 31 Aug 2026 15:51:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: ov13858: add regulator, clock and reset
 GPIO handling
Message-ID: <apV45bZYB3MAd7tE@kekkonen.localdomain>
References: <20260831124352.86935-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831124352.86935-1-lsa.uz@pm.me>

Hi Sergey,

Thanks for the update. A new more comments below...

On Mon, Aug 31, 2026 at 12:44:00PM +0000, Sergey Lebedev wrote:
> The driver assumes the sensor is already powered when probe() reads its chip
> ID. That holds where the rails and clock are ACPI power resources, but not
> where an INT3472 companion device registers them as regulators, a clock and a
> reset GPIO for the sensor driver to consume, which this driver does not do.
> 
> Request the three supplies and the reset GPIO, and sequence them along with
> the clock the driver already looks up, in runtime PM callbacks.
> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> Changes in v2, all from Sakari Ailus's review:
> - commit message cut down; the detail below
> - dropped the comment on the supply names; it is a KAPI with int3472
> - ARRAY_SIZE() directly instead of a local macro
> - fsleep() instead of usleep_range()
> - one function each for power on and off, used as the PM callbacks directly,
>   instead of a pair of wrappers
> - removed the now-useless dev_err() in the probe error path
> - i declared inside its loop
> Link to v1: https://patch.msgid.link/20260831100404.40463-1-lsa.uz@pm.me
> 
> Without the patch the first I2C transaction fails:
> 
>   ov13858 i2c-OVTID858:00: failed to find sensor: -5
> 
> The power sequence follows ov02c10: supplies, then clock, then release reset,
> and the reverse on the way down.
> 
> Measured on a Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7),
> with the parts isolated one at a time:
> 
>   supplies enabled, clock enabled   sensor identifies, driver binds
>   supplies enabled, clock left off  -EIO
>   supplies left off, clock enabled  -EIO
> 
> so both are needed; a longer settling delay alone is not enough. Verified
> across five module unload/load cycles with no probe failure, and again after
> this rework, with the sensor streaming each time.
> 
> This needs POWER1 GPIO support in int3472 to be useful on that machine: the
> dvdd rail is described there as an INT3472 GPIO of type 0x08, and without that
> patch the rail is never registered.
> Link: https://patch.msgid.link/20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm
> 
> The same sensor on the Surface Pro 10 was made to work downstream by forcing
> the regulators on for the driver's lifetime, which the people who did it
> called too broad for upstream. Runtime PM keeps them off while the sensor is
> idle instead.
> Link: https://github.com/linux-surface/linux-surface/issues/2153
> 
> dovdd is not described on this machine and resolves to a dummy regulator. It
> is listed because it is one of the three supplies these sensors normally take.
> 
> A working camera also needs an ipu-bridge entry for OVTID858, separately.
> ---
> --- a/drivers/media/i2c/ov13858.c
> +++ b/drivers/media/i2c/ov13858.c
> @@ -3,9 +3,12 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -1028,9 +1031,17 @@
>  	}
>  };
>  
> +static const char * const ov13858_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  struct ov13858 {
>  	struct device *dev;
>  	struct clk *clk;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov13858_supply_names)];
> +	struct gpio_desc *reset_gpio;
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -1653,8 +1664,54 @@
>  {
>  	v4l2_ctrl_handler_free(ov13858->sd.ctrl_handler);
>  	mutex_destroy(&ov13858->mutex);
> +}
> +
> +static int ov13858_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13858 *ov13858 = to_ov13858(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov13858_supply_names), ov13858->supplies);

Please wrap lines over 80 unless there's a specific reason to do otherwise.

> +	if (ret) {
> +		dev_err(ov13858->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ov13858->clk);
> +	if (ret) {
> +		dev_err(ov13858->dev, "failed to enable clock: %d\n", ret);
> +		regulator_bulk_disable(ARRAY_SIZE(ov13858_supply_names), ov13858->supplies);
> +		return ret;
> +	}
> +
> +	if (ov13858->reset_gpio) {
> +		/* Hold reset for at least 1 ms on a back to back off-on */
> +		fsleep(1000);
> +		gpiod_set_value_cansleep(ov13858->reset_gpio, 0);
> +	}
> +
> +	/* t4: 8192 XVCLK cycles after reset is released, before the first I2C */
> +	fsleep(5000);
> +
> +	return 0;
>  }
>  
> +static int ov13858_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13858 *ov13858 = to_ov13858(sd);
> +
> +	gpiod_set_value_cansleep(ov13858->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ov13858_supply_names), ov13858->supplies);
> +	clk_disable_unprepare(ov13858->clk);
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov13858_pm_ops, ov13858_power_off,
> +				 ov13858_power_on, NULL);
> +
>  static int ov13858_probe(struct i2c_client *client)
>  {
>  	struct ov13858 *ov13858;
> @@ -1678,14 +1735,34 @@
>  				     "external clock %lu is not supported\n",
>  				     freq);
>  
> +	for (unsigned int i = 0; i < ARRAY_SIZE(ov13858_supply_names); i++)
> +		ov13858->supplies[i].supply = ov13858_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(ov13858->dev, ARRAY_SIZE(ov13858_supply_names),
> +				      ov13858->supplies);
> +	if (ret)
> +		return dev_err_probe(ov13858->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	ov13858->reset_gpio = devm_gpiod_get_optional(ov13858->dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov13858->reset_gpio))
> +		return dev_err_probe(ov13858->dev,
> +				     PTR_ERR(ov13858->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov13858->sd, client, &ov13858_subdev_ops);
>  
> +	ret = ov13858_power_on(ov13858->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* Check module identity */
>  	ret = ov13858_identify_module(ov13858);
>  	if (ret) {
>  		dev_err(ov13858->dev, "failed to find sensor: %d\n", ret);
> -		return ret;
> +		goto error_power_off;
>  	}
>  
>  	/* Set default mode to max resolution */
> @@ -1693,7 +1770,7 @@
>  
>  	ret = ov13858_init_controls(ov13858);
>  	if (ret)
> -		return ret;
> +		goto error_power_off;
>  
>  	/* Initialize subdev */
>  	ov13858->sd.internal_ops = &ov13858_internal_ops;
> @@ -1729,8 +1806,10 @@
>  
>  error_handler_free:
>  	ov13858_free_controls(ov13858);
> -	dev_err(ov13858->dev, "%s failed:%d\n", __func__, ret);
>  
> +error_power_off:
> +	ov13858_power_off(ov13858->dev);
> +
>  	return ret;
>  }
>  
> @@ -1744,11 +1823,14 @@
>  	ov13858_free_controls(ov13858);
>  
>  	pm_runtime_disable(ov13858->dev);
> +	if (!pm_runtime_status_suspended(ov13858->dev))
> +		ov13858_power_off(ov13858->dev);
> +	pm_runtime_set_suspended(ov13858->dev);
>  }
>  
>  static const struct i2c_device_id ov13858_id_table[] = {
> -	{ .name = "ov13858" },
> -	{ }
> +	{ "ov13858" },
> +	{}

This is an unrelated change (and not preferred either).

>  };
>  
>  MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
> @@ -1766,6 +1848,7 @@
>  	.driver = {
>  		.name = "ov13858",
>  		.acpi_match_table = ACPI_PTR(ov13858_acpi_ids),
> +		.pm = pm_ptr(&ov13858_pm_ops),
>  	},
>  	.probe = ov13858_probe,
>  	.remove = ov13858_remove,
> 

-- 
Kind regards,

Sakari Ailus
