Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316224BD795;
	Fri,  9 Oct 2026 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542943; cv=none; b=aI1XDw/LzGIaw9NHVp0Y6nU5dJxr8E3nwOaykvS/USrTbqUnfz5vXQnIaCVK2x++DC9W9ll0mQTHdNLW7UlBVNxR9aqwoNuqHibfgSHnp8P94+t0v+NuqN3Gty4X5Ka04pjzdjSTV//j7pW43a6XPgWbMM0m7IHtwidMbrS/N+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542943; c=relaxed/simple;
	bh=n9TRkKy7AjZqU/RJe12O7daFDVN2nXMKU0sAnkTwous=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Quwvpe8COzp/rBBBbVUN8CdXcprlYtKyL0AEOajNpATFxRtrBMHKoVls4PBd4WMAgc+llk88S+9y7VOh4O0ocVlIzqZHpTXEX0opQKfuMzoQ5ZzyVXl8kDWEGTX02ozduZib+HaQ5zrIpHwSSkoPlZl1hRK03SLZgHx+bF7U4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEhSqEgh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEhSqEgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791542923; x=1823078923;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=n9TRkKy7AjZqU/RJe12O7daFDVN2nXMKU0sAnkTwous=;
  b=WEhSqEgh9cQ6MDPuLAhoyQB7Txepk+fyYSUgTAiRvgtFQrW/GmjTdIxw
   i9iRwc7sCaT5dzh1d8TB3XMzbxTWhkSxocqnoS4U2qNCRakGbBjKNys18
   xYny0K6L6O5B3G7iRzG/QfVicJNAcoVqcFC8eh2dt+f2t3n07pR0WTdrj
   teC1tG4iyjw5VaOg925dXyCAjnRkxER7QTWOGS1LkRITYP53J4wGsYYut
   lAOzom/wJ9nfyss1VNRmCbZwmzeXJQS4j+9jRdYAeCorkA31ieC7S3Utz
   Q5/q6MUPRrZ4f9T2Eb1m5LxDHQ0LVZSdGi8JWX1wXR+e1XyZCGGSY+jll
   A==;
X-CSE-ConnectionGUID: v7Z1QCoJQJWaQW1dZgOZSw==
X-CSE-MsgGUID: TdL86c03TsWzVlSxlEs6bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="227258"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="227258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:48:42 -0700
X-CSE-ConnectionGUID: jaoMTA+2QWChDfjyzTpO0Q==
X-CSE-MsgGUID: V4+HOa5QTk611Opv5wGOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="449186"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:48:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 9 Oct 2026 13:48:36 +0300 (EEST)
To: chitranshmandhaniya@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v2] platform/x86: dell-uart-backlight: fall back to PCH
 PWM on UART timeout
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Message-ID: <853d1552-0ec4-3fbc-a4a5-e6538a3fab6f@linux.intel.com>
References: <20261008141610.42894-1-chitranshmandhaniya@gmail.com> <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Oct 2026, chitranshmandhaniya@gmail.com wrote:

> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> 
> Some Dell OptiPlex AIO 7410 (35W, board 01KP8D) ship with DELL0501 in
> the ACPI DSDT (status = 0x0F) even though no UART scalar board is
> physically present.  This causes acpi_video_get_backlight_type() to
> return acpi_backlight_dell_uart, which makes i915 skip registering
> intel_backlight.  The dell-uart-backlight driver then times out talking
> to the absent board and the probe fails, leaving the machine with zero
> backlight control.
> 
> A BIOS update fixes this on some models (e.g. OptiPlex 7420, board
> 0914RT) by setting DELL0501 _STA to 0, but Dell has not shipped a
> corrected BIOS for the 7410 even in the latest release (1.37.0,
> 2026-05-28).
> 
> When the initial get_version command returns -ETIMEDOUT, fall back to
> driving the backlight through the Intel PCH PWM registers (BLC_PWM_CTL /
> BLC_PWM_FREQ / BLC_PWM_DUTY at MMIO BAR0 + 0xC8250).  The fallback
> reads the BIOS-programmed PWM frequency as max_brightness and registers
> a BACKLIGHT_PLATFORM device so that compositors (Weston, GNOME, KDE)
> pick it up normally.
> 
> Tested on:
>   - OptiPlex AIO 7410 35W (01KP8D) -- timeout, fallback activates, works
>   - OptiPlex AIO 7420 35W (0914RT, old BIOS) -- timeout, fallback works
>   - OptiPlex AIO 7420 35W (0914RT, new BIOS) -- DELL0501 absent, driver
>     not loaded, intel_backlight works natively (no regression)
> 
> Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> ---
> v1 -> v2:
>   - Use __free(pci_dev_put) for automatic PCI device cleanup (Ilpo)
>   - Replace 0x10 with SZ_16, add linux/sizes.h (Ilpo)
>   - Name BIT(31) as PCH_BLC_PWM_ENABLE (Ilpo)
>   - Fix double-space in block comment (Ilpo)
>   - Reduce devm_backlight_device_register() to fewer lines (Ilpo)

>   - Extract dell_uart_bl_init() for the normal UART backlight path
>     so the probe function reads more clearly (Ilpo)

I suggest you do dell_uart_bl_init() refactor in a preparetory patch and 
do a two patch series. I believe it would make the patches easier to 
review.

-- 
 i.


>  .../platform/x86/dell/dell-uart-backlight.c   | 157 +++++++++++++++---
>  1 file changed, 134 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index f323a667dc2d..edc7cfe38069 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -13,10 +13,13 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/serdev.h>
> +#include <linux/sizes.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/wait.h>
> @@ -50,6 +53,12 @@
>  #define MIN_RESP_LEN			3
>  #define MAX_RESP_LEN			80
>  
> +/* PCH PWM backlight registers relative to Intel GPU MMIO BAR0 */
> +#define PCH_BLC_PWM_CTL		0xC8250
> +#define PCH_BLC_PWM_FREQ	0xC8254
> +#define PCH_BLC_PWM_DUTY	0xC8258
> +#define PCH_BLC_PWM_ENABLE	BIT(31)
> +
>  struct dell_uart_backlight {
>  	struct mutex mutex;
>  	wait_queue_head_t wait_queue;
> @@ -64,6 +73,11 @@ struct dell_uart_backlight {
>  	int power;
>  };
>  
> +struct dell_pwm_backlight {
> +	void __iomem *mmio;
> +	u32 max_brightness;
> +};
> +
>  /* Checksum: SUM(Length and Cmd and Data) xor 0xFF */
>  static u8 dell_uart_checksum(u8 *buf, int len)
>  {
> @@ -267,32 +281,97 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
>  	.write_wakeup = serdev_device_write_wakeup,
>  };
>  
> -static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
> +/*
> + * Some Dell AIO models (e.g. OptiPlex 7410) declare DELL0501 in ACPI but
> + * have no physical UART scalar board. When the UART times out fall back
> + * to driving the Intel PCH PWM backlight registers directly.
> + */
> +static int dell_pwm_update_status(struct backlight_device *bd)
>  {
> -	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
> +	struct dell_pwm_backlight *pwm = bl_get_data(bd);
> +	u32 duty;
> +
> +	if (bd->props.power != BACKLIGHT_POWER_ON ||
> +	    bd->props.state & BL_CORE_SUSPENDED)
> +		duty = 0;
> +	else
> +		duty = bd->props.brightness;
> +
> +	writel(duty, pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
> +	return 0;
> +}
> +
> +static int dell_pwm_get_brightness(struct backlight_device *bd)
> +{
> +	struct dell_pwm_backlight *pwm = bl_get_data(bd);
> +
> +	return readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
> +}
> +
> +static const struct backlight_ops dell_pwm_backlight_ops = {
> +	.update_status  = dell_pwm_update_status,
> +	.get_brightness = dell_pwm_get_brightness,
> +};
> +
> +static int dell_pwm_fallback_register(struct device *dev)
> +{
> +	struct pci_dev *gpu __free(pci_dev_put) = NULL;
>  	struct backlight_properties props = {};
> -	struct dell_uart_backlight *dell_bl;
> -	struct device *dev = &serdev->dev;
> -	int ret;
> +	struct dell_pwm_backlight *pwm;
> +	struct backlight_device *bl;
> +	resource_size_t bar0;
> +	u32 freq, duty, ctl;
>  
> -	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
> -	if (!dell_bl)
> +	gpu = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
> +	if (!gpu || gpu->vendor != PCI_VENDOR_ID_INTEL) {
> +		dev_warn(dev, "No Intel GPU found, cannot fall back to PCH PWM\n");
> +		return -ENODEV;
> +	}
> +
> +	bar0 = pci_resource_start(gpu, 0);
> +	if (!bar0) {
> +		dev_warn(dev, "Intel GPU BAR0 not assigned\n");
> +		return -ENODEV;
> +	}
> +
> +	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm)
>  		return -ENOMEM;
>  
> -	mutex_init(&dell_bl->mutex);
> -	init_waitqueue_head(&dell_bl->wait_queue);
> -	dell_bl->dev = dev;
> +	pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, SZ_16);
> +	if (!pwm->mmio) {
> +		dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
> +		return -ENOMEM;
> +	}
>  
> -	serdev_device_set_drvdata(serdev, dell_bl);
> -	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
> +	ctl  = readl(pwm->mmio);
> +	freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
> +	duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
>  
> -	ret = devm_serdev_device_open(dev, serdev);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "opening UART device\n");
> +	if (!(ctl & PCH_BLC_PWM_ENABLE) || freq == 0) {
> +		dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n", ctl, freq);
> +		return -ENODEV;
> +	}
>  
> -	/* 9600 bps, no flow control, these are the default but set them to be sure */
> -	serdev_device_set_baudrate(serdev, 9600);
> -	serdev_device_set_flow_control(serdev, false);
> +	pwm->max_brightness = freq;
> +
> +	dev_info(dev, "Falling back to PCH PWM backlight (max=%u current=%u)\n", freq, duty);
> +
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.brightness = duty;
> +	props.max_brightness = freq;
> +
> +	bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, pwm,
> +					    &dell_pwm_backlight_ops, &props);
> +	return PTR_ERR_OR_ZERO(bl);
> +}
> +
> +static int dell_uart_bl_init(struct device *dev, struct serdev_device *serdev,
> +			     struct dell_uart_backlight *dell_bl)
> +{
> +	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
> +	struct backlight_properties props = {};
> +	int ret;
>  
>  	get_version[0] = DELL_SOF(GET_CMD_LEN);
>  	get_version[1] = CMD_GET_VERSION;
> @@ -300,7 +379,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  
>  	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "getting firmware version\n");
> +		return ret;
>  
>  	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
>  
> @@ -318,13 +397,45 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	props.max_brightness = DELL_BL_MAX_BRIGHTNESS;
>  	props.power = dell_bl->power;
>  
> -	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight",
> -						     dev, dell_bl,
> -						     &dell_uart_backlight_ops,
> -						     &props);
> +	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, dell_bl,
> +						     &dell_uart_backlight_ops, &props);
>  	return PTR_ERR_OR_ZERO(dell_bl->bl);
>  }
>  
> +static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
> +{
> +	struct dell_uart_backlight *dell_bl;
> +	struct device *dev = &serdev->dev;
> +	int ret;
> +
> +	dell_bl = devm_kzalloc(dev, sizeof(*dell_bl), GFP_KERNEL);
> +	if (!dell_bl)
> +		return -ENOMEM;
> +
> +	mutex_init(&dell_bl->mutex);
> +	init_waitqueue_head(&dell_bl->wait_queue);
> +	dell_bl->dev = dev;
> +
> +	serdev_device_set_drvdata(serdev, dell_bl);
> +	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
> +
> +	ret = devm_serdev_device_open(dev, serdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "opening UART device\n");
> +
> +	/* 9600 bps, no flow control, these are the default but set them to be sure */
> +	serdev_device_set_baudrate(serdev, 9600);
> +	serdev_device_set_flow_control(serdev, false);
> +
> +	ret = dell_uart_bl_init(dev, serdev, dell_bl);
> +	if (ret == -ETIMEDOUT) {
> +		dev_info(dev, "UART backlight controller not responding, trying PCH PWM fallback\n");
> +		return dell_pwm_fallback_register(dev);
> +	}
> +
> +	return ret;
> +}
> +
>  static struct serdev_device_driver dell_uart_bl_serdev_driver = {
>  	.probe = dell_uart_bl_serdev_probe,
>  	.driver = {
> 
