From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] Platform: Samsung Q10 backlight driver
Date: Mon, 21 Feb 2011 21:27:10 -0800
Message-ID: <20110222052709.GA11681@core.coreip.homeip.net>
References: <20110221223743.GA8548@lat.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:40521 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134Ab1BVF1P (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 Feb 2011 00:27:15 -0500
Content-Disposition: inline
In-Reply-To: <20110221223743.GA8548@lat.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Frederick van der Wyck <fvanderwyck@gmail.com>
Cc: mjg59@srcf.ucam.org, gregkh@suse.de, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Fredetick,
On Mon, Feb 21, 2011 at 10:37:43PM +0000, Frederick van der Wyck wrote:
> This adds backlight control on the Samsung Q10 laptop, which does not support 
> the SABI interface. Also tested successfully on the Dell Latitude X200.
> 

Thanks for making the changes, looks mostly good now.

> +
> +static int force;

If it is a bool the call it so.

> +module_param(force, bool, 0);
> +MODULE_PARM_DESC(force,
> +		"Disable the DMI check and force the driver to be loaded");
> +
> +static int samsungq10_bl_set_intensity(struct backlight_device *bd)
> +{
> +
> +	int brightness = bd->props.brightness;
> +	unsigned char c[3] = SAMSUNGQ10_BL_8042_DATA;
> +
> +	if (!samsungq10_suspended) {

Hmm, if samsungq10_bl_set_intensity() can indeed run simultaneously with
suspend/resume then you'd need to protect it with spinlock or mutex.

> +		c[2] = (unsigned char)brightness;
> +		i8042_lock_chip();
> +		i8042_command(c, (0x30 << 8) | SAMSUNGQ10_BL_8042_CMD);
> +		i8042_unlock_chip();
> +		samsungq10_bl_brightness = brightness;
> +	}
> +	return 0;
> +}
> +
> +static int samsungq10_bl_get_intensity(struct backlight_device *bd)
> +{
> +	return samsungq10_bl_brightness;
> +}
> +
> +static const struct backlight_ops samsungq10_bl_ops = {
> +	.get_brightness = samsungq10_bl_get_intensity,
> +	.update_status	= samsungq10_bl_set_intensity,
> +};
> +
> +#ifdef CONFIG_PM
> +static int samsungq10_suspend(struct device *dev)
> +{
> +	samsungq10_suspended = true;
> +	return 0;
> +}
> +
> +static int samsungq10_resume(struct device *dev)
> +{
> +
> +	struct backlight_device *bd = dev_get_drvdata(dev);
> +
> +	samsungq10_suspended = false;
> +	samsungq10_bl_set_intensity(bd);
> +	return 0;
> +}
> +#else
> +#define samsungq10_suspend NULL
> +#define samsungq10_resume  NULL
> +#endif
> +
> +static const struct dev_pm_ops samsungq10_pm_ops = {
> +	.suspend	= samsungq10_suspend,
> +	.resume		= samsungq10_resume,
> +};

Don't you need to restore backlight when resuming from hibernate? I
think you need to guard you methods with CONFIG_PM_SLEEP and then
use SIMPLE_DEV_PM_OPS().

> +
> +static int __devinit samsungq10_probe(struct platform_device *pdev)
> +{
> +
> +	struct backlight_properties props;
> +	struct backlight_device *bd;
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.max_brightness = SAMSUNGQ10_BL_MAX_INTENSITY;
> +	bd = backlight_device_register("samsung", &pdev->dev, NULL,
> +				       &samsungq10_bl_ops, &props);
> +	if (IS_ERR(bd))
> +		return PTR_ERR(bd);
> +
> +	platform_set_drvdata(pdev, bd);
> +
> +	bd->props.brightness = SAMSUNGQ10_BL_DEFAULT_INTENSITY;
> +	samsungq10_bl_set_intensity(bd);
> +
> +	return 0;
> +}
> +
> +static int __devexit samsungq10_remove(struct platform_device *pdev)
> +{
> +
> +	struct backlight_device *bd = platform_get_drvdata(pdev);
> +
> +	bd->props.brightness = SAMSUNGQ10_BL_DEFAULT_INTENSITY;
> +	samsungq10_bl_set_intensity(bd);
> +
> +	backlight_device_unregister(bd);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver samsungq10_driver = {
> +	.driver		= {
> +		.name	= "samsung",

Samsung is way too generic for driver name, maybe call it
KBUILD_MODNAME?

Thanks.

-- 
Dmitry
