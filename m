Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0826C396560;
	Thu,  8 Oct 2026 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469833; cv=none; b=DmL1T1QfcsN8hcqtk8TjftV3nSMTfen87Vfgi+szFUI570hYxnq/brIdphTFMWHdKSCcU2/4IHObGIs7jjtV1sv0kzPb9cvZOu3aU7PYRKw25LYb3+hqhpqn8vE4sGJxXG0Xg5iupWcV5wTETsXjzi3TUZ0xhh2SFX+YuNiTkXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469833; c=relaxed/simple;
	bh=Dui4tNmQKYSbNahAQP4yGmPhmi3TcFo4f1QNtbuLDp0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BtcWkeUpide27s/PIdLyZjmwqWubihjAqoU4Au9v7AVesr0VR3hfLk/PmGc3Dq5s3gM3nX8t3d4IZxjVhVLigvxYJ0DGnhQ9jjxbpq3ob8y17gzURX8W7ByTNImtXojUKNGZiiYIT2sxuzXegXzUs0TF8Kn90kJ/N6jOz0sVESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Et07FQ84; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Et07FQ84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791469828; x=1823005828;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Dui4tNmQKYSbNahAQP4yGmPhmi3TcFo4f1QNtbuLDp0=;
  b=Et07FQ841b/OKJyLhd02IXvNnU27MePwC9uGsacqDYxJ+irkmPuLQk1l
   qa540PNr/UuylcE1KqA4yfK4pzVG31zzR/teuHVn9e0y581+KbJtm9fii
   X6vrUp8zZi4GKUiEC02Wdnq7Oj60KcOvAekRuEdDqls+8xtQGXbZ3kwiW
   giE/AoiLZTEfwgWjvmoLrIpRg2L5gtGrxlOxgdbfjl0BTQQgMLZNeXkwp
   TN6/7t65M5cFY9sM36FeyOCi36l/7or0N8HaSZhlghx0TP0UUGhoaVXDM
   tVfvxyZA9s2FGWvrc59IiWTacAu4kBnYG73iI7l5PVMLuN5e/U/1gHA5l
   w==;
X-CSE-ConnectionGUID: rcJsWwMmS6SLi1PW1vJpzg==
X-CSE-MsgGUID: kZrPWLENRz6IyziXdNP/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="264397"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="264397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:30:27 -0700
X-CSE-ConnectionGUID: IUSYXERSS0ius6/0TU4L4g==
X-CSE-MsgGUID: BwuTdyI8QUS+lO83ditqoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="499072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 07:30:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 Oct 2026 17:30:21 +0300 (EEST)
To: chitranshmandhaniya@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: fall back to PCH PWM
 on UART timeout
In-Reply-To: <20261008141610.42894-1-chitranshmandhaniya@gmail.com>
Message-ID: <8a238379-73df-5070-8a7c-c440383bfe77@linux.intel.com>
References: <20261008141610.42894-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Oct 2026, chitranshmandhaniya@gmail.com wrote:

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
>  .../platform/x86/dell/dell-uart-backlight.c   | 116 +++++++++++++++++-
>  1 file changed, 113 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index f323a667dc2d..a2045e6c49bd 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -13,8 +13,10 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/serdev.h>
>  #include <linux/string.h>
> @@ -50,6 +52,11 @@
>  #define MIN_RESP_LEN			3
>  #define MAX_RESP_LEN			80
>  
> +/* PCH PWM backlight registers relative to Intel GPU MMIO BAR0 */
> +#define PCH_BLC_PWM_CTL		0xC8250
> +#define PCH_BLC_PWM_FREQ	0xC8254
> +#define PCH_BLC_PWM_DUTY	0xC8258
> +
>  struct dell_uart_backlight {
>  	struct mutex mutex;
>  	wait_queue_head_t wait_queue;
> @@ -64,6 +71,11 @@ struct dell_uart_backlight {
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
> @@ -267,6 +279,97 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
>  	.write_wakeup = serdev_device_write_wakeup,
>  };
>  
> +/*
> + * Some Dell AIO models (e.g. OptiPlex 7410) declare DELL0501 in ACPI but
> + * have no physical UART scalar board.  When the UART times out fall back

Nit, one space is enough.

> + * to driving the Intel PCH PWM backlight registers directly.
> + */
> +static int dell_pwm_update_status(struct backlight_device *bd)
> +{
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

Please add linux/io.h to includes.

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
> +	struct dell_pwm_backlight *pwm;
> +	struct backlight_properties props = {};
> +	struct backlight_device *bl;
> +	struct pci_dev *gpu;
> +	resource_size_t bar0;
> +	u32 freq, duty, ctl;
> +
> +	gpu = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
> +	if (!gpu || gpu->vendor != PCI_VENDOR_ID_INTEL) {
> +		pci_dev_put(gpu);
> +		dev_warn(dev, "No Intel GPU found, cannot fall back to PCH PWM\n");

Add include.

> +		return -ENODEV;
> +	}
> +
> +	bar0 = pci_resource_start(gpu, 0);
> +	pci_dev_put(gpu);

Don't duplicating pci_dev_put(), __free() can be used to autorelease it.

> +	if (!bar0) {
> +		dev_warn(dev, "Intel GPU BAR0 not assigned\n");
> +		return -ENODEV;
> +	}
> +
> +	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
> +	if (!pwm)
> +		return -ENOMEM;
> +
> +	pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, 0x10);

SZ_xx + add include.

> +	if (!pwm->mmio) {
> +		dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
> +		return -ENOMEM;
> +	}
> +
> +	ctl  = readl(pwm->mmio);
> +	freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
> +	duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
> +
> +	if (!(ctl & BIT(31)) || freq == 0) {

Please name BIT(31) with a define.

> +		dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n",
> +			 ctl, freq);
> +		return -ENODEV;
> +	}
> +
> +	pwm->max_brightness = freq;
> +
> +	dev_info(dev, "Falling back to PCH PWM backlight (max=%u current=%u)\n",
> +		 freq, duty);
> +
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.brightness = duty;
> +	props.max_brightness = freq;
> +
> +	bl = devm_backlight_device_register(dev, "dell_uart_backlight",
> +					    dev, pwm,
> +					    &dell_pwm_backlight_ops,
> +					    &props);

Fits to less lines.

You may also use up to 100 chars for code where it helps.

> +	return PTR_ERR_OR_ZERO(bl);
> +}
> +
>  static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  {
>  	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
> @@ -300,18 +403,18 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  
>  	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "getting firmware version\n");
> +		goto uart_fail;
>  
>  	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
>  
>  	/* Initialize bl_power to a known value */
>  	ret = dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
>  	if (ret)
> -		return ret;
> +		goto uart_fail;
>  
>  	ret = dell_uart_get_brightness(dell_bl);
>  	if (ret < 0)
> -		return ret;
> +		goto uart_fail;
>  
>  	props.type = BACKLIGHT_PLATFORM;
>  	props.brightness = ret;
> @@ -323,6 +426,13 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  						     &dell_uart_backlight_ops,
>  						     &props);
>  	return PTR_ERR_OR_ZERO(dell_bl->bl);
> +
> +uart_fail:
> +	if (ret == -ETIMEDOUT) {
> +		dev_info(dev, "UART backlight controller not responding, trying PCH PWM fallback\n");
> +		return dell_pwm_fallback_register(dev);

This looks like rollback path but isn't.

How about adding a function for the "normal" BL init so you can structure 
the code more logically.

> +	}
> +	return dev_err_probe(dev, ret, "UART backlight communication failed\n");
>  }
>  
>  static struct serdev_device_driver dell_uart_bl_serdev_driver = {
> 

-- 
 i.

