Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14F25C6EE;
	Mon, 31 Aug 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172666; cv=none; b=HwuF+cUoJELX1gJ94C5oRe4WzdbzQzFlpwFBdFhol58OoXUKfRLSO+8X+0PJMg31z5lRZrMB3UeuKyXYoGaI1M8oDQ4xb3OEYCUNffaaOj0QwFkux5oxTvhRlg7b+sUW8SbUTPOz0zLKYxyqg2tOZcybG78foKVkVylnow0Nf3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172666; c=relaxed/simple;
	bh=FZhWBdfLiMK15UjZlRFS+dk3BZ8Rnw8+Havedpb4cTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbLj69OCHJ+j7bdJQBjehVhlw+QBH+u/Pfd9OxQ2RjlZulwmk9X6gRgDLP8wivJHgo6/mzDulYoGhbaYnnyJ99ZWzK1ZfUQk3hXzWkdW3H2lA7TMAfDSFTPFljF8UIAY23eE2a6OiST1jtXhi31XXT6nlZasQfoVU+EQ6sw1MFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnBl9ORm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnBl9ORm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788172664; x=1819708664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZhWBdfLiMK15UjZlRFS+dk3BZ8Rnw8+Havedpb4cTk=;
  b=jnBl9ORm4dZG441Q2xqbbA6auN+DRzrSr6cPAC3FQ78AffwOSdis5JgL
   HU3jBRNShSqVo9i4Re/MnFTS4bi0+R6xi5TfLNGAOcJSYMGcEOdvmBPUO
   DUZQRQn8tTq4KrTjmCDFkgCPOk/qS20zVpngqf8eFROvuM6Qf4u4+MOqd
   u4FYWFNmfgZr1e8gLkmqpa77+Wh+pZ95FQjI00AHn0MN8KEQrE+uM6PDP
   vo0U4Mxp8wB3TwW1ptiBKn6EyWvzxDn7hctMyuhSs8hV7Fp09tHMsX4tV
   /cv5jV/zBHz8NxoJgZXHdkl15M7vd3KAzGjQKCGouU1vlaUvskvt1qA23
   g==;
X-CSE-ConnectionGUID: raRkVBH6REeme58e/VqDWQ==
X-CSE-MsgGUID: 6MfKqmiERbi/RzjM58QvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99240027"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99240027"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:37:43 -0700
X-CSE-ConnectionGUID: qlJpqkE/QUybuVvE0MbNOw==
X-CSE-MsgGUID: TW83O2iVSaCjZSR2T2JCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292267000"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:37:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 61ED911F894;
	Mon, 31 Aug 2026 13:37:38 +0300 (EEST)
Date: Mon, 31 Aug 2026 13:37:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: add regulator, clock and reset GPIO
 handling
Message-ID: <apVZcg10jL4xbyxB@kekkonen.localdomain>
References: <20260831100404.40463-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831100404.40463-1-lsa.uz@pm.me>

Hi Sergey,

Thanks for the patch.

On Mon, Aug 31, 2026 at 10:04:13AM +0000, Sergey Lebedev wrote:
> ov13858_probe() reads the chip ID over I2C on the assumption stated in its
> own comment:
> 
> 	/*
> 	 * Device is already turned on by i2c-core with ACPI domain PM.
> 	 * Enable runtime PM and turn off the device.
> 	 */
> 
> That holds where the sensor's rails and clock are ACPI power resources. It
> does not hold where an INT3472 companion device describes them, because
> INT3472 registers them as regulators, a clock and a reset GPIO for the
> sensor driver to consume - and this driver consumes none of them. They stay
> off, the sensor stays in reset, and the first I2C transaction fails:
> 
>   ov13858 i2c-OVTID858:00: failed to find sensor: -5
> 
> Add the three standard supplies, the reset GPIO and the clock the driver
> already looks up, sequenced in runtime PM callbacks the driver did not have.
> The shape follows ov02c10, which handles the same situation: supplies, then
> clock, then release reset, and the reverse on the way down.
> 
> This depends on POWER1 GPIO support in int3472. On the Surface Pro 11 the
> dvdd rail is described as an INT3472 GPIO of type 0x08, so without that patch
> the rail is never registered and there is nothing here to consume:
> 
> Link: https://patch.msgid.link/20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm
> 
> The same sensor on the Surface Pro 10 was made to work downstream by adding
> reset handling to ov13858_probe() and forcing the regulators on for the
> lifetime of the driver; the people who did it called that second half too
> broad for upstream, and it is. Driving the rails from runtime PM instead
> keeps them off while the sensor is idle, which is what the companion device
> registered them for:
> 
> Link: https://github.com/linux-surface/linux-surface/issues/2153
> 
> Measured on a Microsoft Surface Pro 11 for Business (Intel Lunar Lake,
> IPU7), kernel 7.0.0-30, with the parts isolated one at a time:
> 
>   supplies enabled, clock enabled   sensor identifies, driver binds
>   supplies enabled, clock left off  -EIO
>   supplies left off, clock enabled  -EIO
> 
> so both are needed; a longer settling delay alone is not enough. Verified
> across five module unload/load cycles with no probe failure, and the sensor
> streams after each one.
> 
> dovdd is not described on this machine and resolves to a dummy regulator. It
> is listed because it is one of the three supplies these sensors normally
> take, and machines that do describe it should get it.
> 
> With this patch the sensor probes on every boot and runtime PM powers it
> down when idle. Producing a working camera also needs an ipu-bridge entry
> for OVTID858, which is a separate patch.
> 

Considering what the patch does, I think a few lines should be enough to
describe the patch. The rest may be put below the '---' line.

> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> Hans suggested two patches, one for the regulators and one for the reset
> GPIO. They are sent as one here because neither half leaves the sensor in a
> working state on its own - with supplies but no reset handling the part stays
> held in reset, and vice versa. Happy to split it if you would still prefer
> that.
> 
> An earlier version of this patch released reset before starting the clock. It
> worked on this hardware, but only because the 8192-cycle wait that follows
> covered for it, and it is the wrong order. Mentioning it in case anyone is
> carrying that version downstream.
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
> @@ -1037,9 +1040,23 @@
>  	}
>  };
>  
> +/*
> + * The sensor's rails are described by an INT3472 companion device on ACPI
> + * platforms; the names match the con_ids that driver registers.
> + */

These are really a KAPI between the int3472 and this driver; no need for
the comment. (If OF support comes around, this nees to be adjusted.)

> +static const char * const ov13858_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +#define OV13858_NUM_SUPPLIES ARRAY_SIZE(ov13858_supply_names)

Please use ARRAY_SIZE() where needed.

> +
>  struct ov13858 {
>  	struct device *dev;
>  	struct clk *clk;
> +	struct regulator_bulk_data supplies[OV13858_NUM_SUPPLIES];
> +	struct gpio_desc *reset_gpio;
>  
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> @@ -1699,10 +1716,66 @@
>  	mutex_destroy(&ov13858->mutex);
>  }
>  
> +static int ov13858_power_on(struct ov13858 *ov13858)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(OV13858_NUM_SUPPLIES, ov13858->supplies);
> +	if (ret) {
> +		dev_err(ov13858->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ov13858->clk);
> +	if (ret) {
> +		dev_err(ov13858->dev, "failed to enable clock: %d\n", ret);
> +		regulator_bulk_disable(OV13858_NUM_SUPPLIES, ov13858->supplies);
> +		return ret;
> +	}
> +
> +	if (ov13858->reset_gpio) {
> +		/* Hold reset for at least 1 ms on a back to back off-on */
> +		usleep_range(1000, 1500);

How about fsleep(), also below?

> +		gpiod_set_value_cansleep(ov13858->reset_gpio, 0);
> +	}
> +
> +	/* t4: 8192 XVCLK cycles after reset is released, before the first I2C */
> +	usleep_range(5000, 6000);
> +
> +	return 0;
> +}
> +
> +static void ov13858_power_off(struct ov13858 *ov13858)
> +{
> +	gpiod_set_value_cansleep(ov13858->reset_gpio, 1);
> +	regulator_bulk_disable(OV13858_NUM_SUPPLIES, ov13858->supplies);
> +	clk_disable_unprepare(ov13858->clk);
> +}
> +
> +static int ov13858_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +
> +	return ov13858_power_on(to_ov13858(sd));
> +}
> +
> +static int ov13858_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +
> +	ov13858_power_off(to_ov13858(sd));
> +
> +	return 0;

Please refactor this so you have one function for powering the device on
and another one for powering it off.

> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov13858_pm_ops, ov13858_runtime_suspend,
> +				 ov13858_runtime_resume, NULL);
> +
>  static int ov13858_probe(struct i2c_client *client)
>  {
>  	struct ov13858 *ov13858;
>  	unsigned long freq;
> +	unsigned int i;
>  	int ret;
>  
>  	ov13858 = devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);
> @@ -1722,14 +1795,34 @@
>  				     "external clock %lu is not supported\n",
>  				     freq);
>  
> +	for (i = 0; i < OV13858_NUM_SUPPLIES; i++)

i could be declared here.

> +		ov13858->supplies[i].supply = ov13858_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(ov13858->dev, OV13858_NUM_SUPPLIES,
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
> +	ret = ov13858_power_on(ov13858);
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
> @@ -1737,7 +1830,7 @@
>  
>  	ret = ov13858_init_controls(ov13858);
>  	if (ret)
> -		return ret;
> +		goto error_power_off;
>  
>  	/* Initialize subdev */
>  	ov13858->sd.internal_ops = &ov13858_internal_ops;
> @@ -1773,6 +1866,9 @@
>  
>  error_handler_free:
>  	ov13858_free_controls(ov13858);
> +
> +error_power_off:
> +	ov13858_power_off(ov13858);
>  	dev_err(ov13858->dev, "%s failed:%d\n", __func__, ret);

This isn't probably useful anymore, can be removed IMO.

>  
>  	return ret;
> @@ -1788,6 +1884,9 @@
>  	ov13858_free_controls(ov13858);
>  
>  	pm_runtime_disable(ov13858->dev);
> +	if (!pm_runtime_status_suspended(ov13858->dev))
> +		ov13858_power_off(ov13858);
> +	pm_runtime_set_suspended(ov13858->dev);
>  }
>  
>  static const struct i2c_device_id ov13858_id_table[] = {
> @@ -1810,6 +1909,7 @@
>  	.driver = {
>  		.name = "ov13858",
>  		.acpi_match_table = ACPI_PTR(ov13858_acpi_ids),
> +		.pm = pm_ptr(&ov13858_pm_ops),
>  	},
>  	.probe = ov13858_probe,
>  	.remove = ov13858_remove,
> 

-- 
Regards,

Sakari Ailus
