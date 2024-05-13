Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501215E9B
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715613054; cv=none; b=FSLWpiPegMO23xygwousbZLBBGAmbPcEqLsk/AVkjDKdeQTgjvJ4EVtt4BY+7JcdtS4IJi7hHXYlaZAQ8rBYv5EqLB+x43qD+iUjjmnDb4f156wkO2R5mptm0ceqcnPfuBG+tBiwIxjJw5TQtdQ6aqmXnH7wCsXYcaVIQ5PlBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715613054; c=relaxed/simple;
	bh=E8or7gzzX5eV3jUpZtZYM9tJcN53mgzl6YkR+5bkbn8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VK6l1TCf/jto6h8ewkDBkRBvqQSkOoGHc0T/mXqosMNw9yqgpDVv5li+Q5Pn9jR8CXEzXdh2fvLLpM4lefcozIJFX8Sru8dwnUnpN9KUJfm0/8XzWzm7P+7mchF8MOZ597z9stW5118xwmejIcrM9Hd6YTzonl8Wn8bsWniZ0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMdxKltL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMdxKltL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715613052; x=1747149052;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=E8or7gzzX5eV3jUpZtZYM9tJcN53mgzl6YkR+5bkbn8=;
  b=GMdxKltLo7m2FQ9sFWzG6nTubx1aCqYun7Jy/7ETrQfotWnZaHn9mVk5
   4/2aGlXDF8vhray1OAtnCeW1XBgG7bFqBLVBxKLCaxVJ0MwWs/Stg/MSE
   V1XBTGbXmjvoxcaJC+qGKn06VM097vv14dko6YpV2ctauz85xPd1dC+1x
   913pTqr1XrisFPhvaDV9urD3PmWcP0HGftAHkp28TkP6Q91sghZ/0gehh
   MNIahtIM3XePfgwTAJ51g64403jpZJidQLejBUwbTizQci0IJh/7UyCko
   bWxP9Sxf/WJy9d0xZNcCqDS4tT5vkFpISLT3FD04WLeHHVpDuSzyYP7SI
   A==;
X-CSE-ConnectionGUID: EdHb7ccFTLWMcq5EDL4S/g==
X-CSE-MsgGUID: b4AUoq4nRJKgyEwDmKIMIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15368981"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="15368981"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:07:26 -0700
X-CSE-ConnectionGUID: DzXQuXw3TdSwPOXDtVwmhg==
X-CSE-MsgGUID: On8TK5MxTP2tbKGsF11kHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="34795438"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:07:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 18:07:19 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Roman Bogoyev <roman@computercheck.com.au>, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 1/2] platform/x86: Add new Dell UART backlight
 driver
In-Reply-To: <20240513144603.93874-2-hdegoede@redhat.com>
Message-ID: <e969f26d-6d6c-ffbf-97e2-cfd0122568f4@linux.intel.com>
References: <20240513144603.93874-1-hdegoede@redhat.com> <20240513144603.93874-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 May 2024, Hans de Goede wrote:

> Dell All In One (AIO) models released after 2017 use a backlight controller
> board connected to an UART.
> 
> In DSDT this uart port will be defined as:
> 
>    Name (_HID, "DELL0501")
>    Name (_CID, EisaId ("PNP0501")
> 
> Instead of having a separate ACPI device with an UartSerialBusV2() resource
> to model the backlight-controller, which would be the standard way to do
> this.
> 
> The acpi_quirk_skip_serdev_enumeration() has special handling for this
> and it will make the serial port code create a serdev controller device
> for the UART instead of a /dev/ttyS0 char-dev. It will also create
> a dell-uart-backlight driver platform device for this driver to bind too.
> 
> This new kernel module contains 2 drivers for this:
> 
> 1. A simple platform driver which creates the actual serdev device
>    (with the serdev controller device as parent)
> 
> 2. A serdev driver for the created serdev device which exports
>    the backlight functionality uses a standard backlight class device.
> 
> Reported-by: Roman Bogoyev <roman@computercheck.com.au>
> Tested-by: Roman Bogoyev <roman@computercheck.com.au>
> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Co-developed-by: AceLan Kao <acelan.kao@canonical.com>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Rework dell_uart_bl_receive() loop (based on suggestions from Ilpo)
> - s/SOF/DELL_SOF/ to avoid future namespace conflicts
> 
> Changes in v2:
> - Address various review remarks from Ilpo and Andy
> ---
>  drivers/platform/x86/dell/Kconfig             |  15 +
>  drivers/platform/x86/dell/Makefile            |   1 +
>  .../platform/x86/dell/dell-uart-backlight.c   | 398 ++++++++++++++++++
>  3 files changed, 414 insertions(+)
>  create mode 100644 drivers/platform/x86/dell/dell-uart-backlight.c
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index bd9f445974cc..195a8bf532cc 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -145,6 +145,21 @@ config DELL_SMO8800
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called dell-smo8800.
>  
> +config DELL_UART_BACKLIGHT
> +	tristate "Dell AIO UART Backlight driver"
> +	depends on ACPI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on SERIAL_DEV_BUS
> +	help
> +	  Say Y here if you want to support Dell AIO UART backlight interface.
> +	  The Dell AIO machines released after 2017 come with a UART interface
> +	  to communicate with the backlight scalar board. This driver creates
> +	  a standard backlight interface and talks to the scalar board through
> +	  UART to adjust the AIO screen brightness.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell_uart_backlight.
> +
>  config DELL_WMI
>  	tristate "Dell WMI notifications"
>  	default m
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index 1b8942426622..8176a257d9c3 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -14,6 +14,7 @@ dell-smbios-objs			:= dell-smbios-base.o
>  dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
>  dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
>  obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
> +obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
>  obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
>  dell-wmi-objs				:= dell-wmi-base.o
>  dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> new file mode 100644
> index 000000000000..4e73fa035aca
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Dell AIO Serial Backlight Driver
> + *
> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
> + * Copyright (C) 2017 AceLan Kao <acelan.kao@canonical.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/serdev.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/wait.h>
> +#include "../serdev_helpers.h"
> +
> +/* The backlight controller must respond within 1 second */
> +#define DELL_BL_TIMEOUT		msecs_to_jiffies(1000)
> +#define DELL_BL_MAX_BRIGHTNESS	100
> +
> +/* Defines for the commands send to the controller */
> +
> +/* 1st byte Start Of Frame 3 MSB bits: cmd-len + 01010 SOF marker */
> +#define DELL_SOF(len)			(((len) << 5) | 0x0a)
> +#define GET_CMD_LEN			3
> +#define SET_CMD_LEN			4
> +
> +/* 2nd byte command */
> +#define CMD_GET_VERSION			0x06
> +#define CMD_SET_BRIGHTNESS		0x0b
> +#define CMD_GET_BRIGHTNESS		0x0c
> +#define CMD_SET_BL_POWER		0x0e
> +
> +/* Indexes and other defines for response received from the controller */
> +#define RESP_LEN			0
> +#define RESP_CMD			1 /* Echo of CMD byte from command */
> +#define RESP_DATA			2 /* Start of received data */
> +
> +#define SET_RESP_LEN			3
> +#define GET_RESP_LEN			4
> +#define MIN_RESP_LEN			3
> +#define MAX_RESP_LEN			80
> +
> +struct dell_uart_backlight {
> +	struct mutex mutex;
> +	wait_queue_head_t wait_queue;
> +	struct device *dev;
> +	struct backlight_device *bl;
> +	u8 *resp;
> +	u8 resp_idx;
> +	u8 resp_len;
> +	u8 resp_max_len;
> +	u8 pending_cmd;
> +	int status;
> +	int power;
> +};
> +
> +/* Checksum: SUM(Length and Cmd and Data) xor 0xFF */
> +static u8 dell_uart_checksum(u8 *buf, int len)
> +{
> +	u8 val = 0;
> +
> +	while (len-- > 0)
> +		val += buf[len];
> +
> +	return val ^ 0xff;
> +}
> +
> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
> +				const u8 *cmd, int cmd_len,
> +				u8 *resp, int resp_max_len)
> +{
> +	int ret;
> +
> +	ret = mutex_lock_killable(&dell_bl->mutex);
> +	if (ret)
> +		return ret;
> +
> +	dell_bl->status = -EBUSY;
> +	dell_bl->resp = resp;
> +	dell_bl->resp_idx = 0;
> +	dell_bl->resp_len = -1; /* Invalid / unset */
> +	dell_bl->resp_max_len = resp_max_len;
> +	dell_bl->pending_cmd = cmd[1];
> +
> +	/* The TTY buffer should be big enough to take the entire cmd in one go */
> +	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
> +	if (ret != cmd_len) {
> +		dev_err(dell_bl->dev, "Error writing command: %d\n", ret);
> +		ret = (ret < 0) ? ret : -EIO;

This does nothing because you return dell_bl->status.

-- 
 i.

> +		goto out;
> +	}
> +
> +	ret = wait_event_timeout(dell_bl->wait_queue, dell_bl->status != -EBUSY,
> +				 DELL_BL_TIMEOUT);
> +	if (ret == 0) {
> +		dev_err(dell_bl->dev, "Timed out waiting for response.\n");
> +		/* Clear busy status to discard bytes received after this */
> +		dell_bl->status = -ETIMEDOUT;
> +	}
> +
> +out:
> +	mutex_unlock(&dell_bl->mutex);
> +	return dell_bl->status;
> +}
> +
> +static int dell_uart_set_brightness(struct dell_uart_backlight *dell_bl, int brightness)
> +{
> +	u8 set_brightness[SET_CMD_LEN], resp[SET_RESP_LEN];
> +
> +	set_brightness[0] = DELL_SOF(SET_CMD_LEN);
> +	set_brightness[1] = CMD_SET_BRIGHTNESS;
> +	set_brightness[2] = brightness;
> +	set_brightness[3] = dell_uart_checksum(set_brightness, 3);
> +
> +	return dell_uart_bl_command(dell_bl, set_brightness, SET_CMD_LEN, resp, SET_RESP_LEN);
> +}
> +
> +static int dell_uart_get_brightness(struct dell_uart_backlight *dell_bl)
> +{
> +	struct device *dev = dell_bl->dev;
> +	u8 get_brightness[GET_CMD_LEN], resp[GET_RESP_LEN];
> +	int ret;
> +
> +	get_brightness[0] = DELL_SOF(GET_CMD_LEN);
> +	get_brightness[1] = CMD_GET_BRIGHTNESS;
> +	get_brightness[2] = dell_uart_checksum(get_brightness, 2);
> +
> +	ret = dell_uart_bl_command(dell_bl, get_brightness, GET_CMD_LEN, resp, GET_RESP_LEN);
> +	if (ret)
> +		return ret;
> +
> +	if (resp[RESP_LEN] != GET_RESP_LEN) {
> +		dev_err(dev, "Unexpected get brightness response length: %d\n", resp[RESP_LEN]);
> +		return -EIO;
> +	}
> +
> +	if (resp[RESP_DATA] > DELL_BL_MAX_BRIGHTNESS) {
> +		dev_err(dev, "Unexpected get brightness response: %d\n", resp[RESP_DATA]);
> +		return -EIO;
> +	}
> +
> +	return resp[RESP_DATA];
> +}
> +
> +static int dell_uart_set_bl_power(struct dell_uart_backlight *dell_bl, int power)
> +{
> +	u8 set_power[SET_CMD_LEN], resp[SET_RESP_LEN];
> +	int ret;
> +
> +	set_power[0] = DELL_SOF(SET_CMD_LEN);
> +	set_power[1] = CMD_SET_BL_POWER;
> +	set_power[2] = (power == FB_BLANK_UNBLANK) ? 1 : 0;
> +	set_power[3] = dell_uart_checksum(set_power, 3);
> +
> +	ret = dell_uart_bl_command(dell_bl, set_power, SET_CMD_LEN, resp, SET_RESP_LEN);
> +	if (ret)
> +		return ret;
> +
> +	dell_bl->power = power;
> +	return 0;
> +}
> +
> +/*
> + * There is no command to get backlight power status,
> + * so we set the backlight power to "on" while initializing,
> + * and then track and report its status by power variable.
> + */
> +static int dell_uart_get_bl_power(struct dell_uart_backlight *dell_bl)
> +{
> +	return dell_bl->power;
> +}
> +
> +static int dell_uart_update_status(struct backlight_device *bd)
> +{
> +	struct dell_uart_backlight *dell_bl = bl_get_data(bd);
> +	int ret;
> +
> +	ret = dell_uart_set_brightness(dell_bl, bd->props.brightness);
> +	if (ret)
> +		return ret;
> +
> +	if (bd->props.power != dell_uart_get_bl_power(dell_bl))
> +		return dell_uart_set_bl_power(dell_bl, bd->props.power);
> +
> +	return 0;
> +}
> +
> +static int dell_uart_get_brightness_op(struct backlight_device *bd)
> +{
> +	return dell_uart_get_brightness(bl_get_data(bd));
> +}
> +
> +static const struct backlight_ops dell_uart_backlight_ops = {
> +	.update_status = dell_uart_update_status,
> +	.get_brightness = dell_uart_get_brightness_op,
> +};
> +
> +static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
> +{
> +	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
> +	size_t i;
> +	u8 csum;
> +
> +	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
> +
> +	/* Throw away unexpected bytes / remainder of response after an error */
> +	if (dell_bl->status != -EBUSY) {
> +		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
> +		return len;
> +	}
> +
> +	i = 0;
> +	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
> +		dell_bl->resp[dell_bl->resp_idx] = data[i++];
> +
> +		switch (dell_bl->resp_idx) {
> +		case RESP_LEN: /* Length byte */
> +			dell_bl->resp_len = dell_bl->resp[RESP_LEN];
> +			if (dell_bl->resp_len < MIN_RESP_LEN ||
> +			    dell_bl->resp_len > dell_bl->resp_max_len) {
> +				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
> +					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
> +				dell_bl->status = -EIO;
> +				goto wakeup;
> +			}
> +			break;
> +		case RESP_CMD: /* CMD byte */
> +			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
> +					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> +				dell_bl->status = -EIO;
> +				goto wakeup;
> +			}
> +			break;
> +		}
> +		dell_bl->resp_idx++;
> +	}
> +
> +	if (dell_bl->resp_idx != dell_bl->resp_len)
> +		return len; /* Response not complete yet */
> +
> +	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
> +	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
> +		dell_bl->status = 0; /* Success */
> +	} else {
> +		dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
> +			dell_bl->resp[dell_bl->resp_len - 1], csum);
> +		dell_bl->status = -EIO;
> +	}
> +wakeup:
> +	wake_up(&dell_bl->wait_queue);
> +	return i;
> +}
> +
> +static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
> +	.receive_buf = dell_uart_bl_receive,
> +	.write_wakeup = serdev_device_write_wakeup,
> +};
> +
> +static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
> +{
> +	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
> +	struct backlight_properties props = {};
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
> +	ret = devm_serdev_device_open(dev, serdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "opening UART device\n");
> +
> +	/* 9600 bps, no flow control, these are the default but set them to be sure */
> +	serdev_device_set_baudrate(serdev, 9600);
> +	serdev_device_set_flow_control(serdev, false);
> +	serdev_device_set_drvdata(serdev, dell_bl);
> +	serdev_device_set_client_ops(serdev, &dell_uart_bl_serdev_ops);
> +
> +	get_version[0] = DELL_SOF(GET_CMD_LEN);
> +	get_version[1] = CMD_GET_VERSION;
> +	get_version[2] = dell_uart_checksum(get_version, 2);
> +
> +	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "getting firmware version\n");
> +
> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
> +
> +	/* Initialize bl_power to a known value */
> +	ret = dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> +	if (ret)
> +		return ret;
> +
> +	ret = dell_uart_get_brightness(dell_bl);
> +	if (ret < 0)
> +		return ret;
> +
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.brightness = ret;
> +	props.max_brightness = DELL_BL_MAX_BRIGHTNESS;
> +	props.power = dell_bl->power;
> +
> +	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight",
> +						     dev, dell_bl,
> +						     &dell_uart_backlight_ops,
> +						     &props);
> +	return PTR_ERR_OR_ZERO(dell_bl->bl);
> +}
> +
> +struct serdev_device_driver dell_uart_bl_serdev_driver = {
> +	.probe = dell_uart_bl_serdev_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	},
> +};
> +
> +static int dell_uart_bl_pdev_probe(struct platform_device *pdev)
> +{
> +	struct serdev_device *serdev;
> +	struct device *ctrl_dev;
> +	int ret;
> +
> +	ctrl_dev = get_serdev_controller("DELL0501", NULL, 0, "serial0");
> +	if (IS_ERR(ctrl_dev))
> +		return PTR_ERR(ctrl_dev);
> +
> +	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
> +	put_device(ctrl_dev);
> +	if (!serdev)
> +		return -ENOMEM;
> +
> +	ret = serdev_device_add(serdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "error %d adding serdev\n", ret);
> +		serdev_device_put(serdev);
> +		return ret;
> +	}
> +
> +	ret = serdev_device_driver_register(&dell_uart_bl_serdev_driver);
> +	if (ret)
> +		goto err_remove_serdev;
> +
> +	/*
> +	 * serdev device <-> driver matching relies on OF or ACPI matches and
> +	 * neither is available here, manually bind the driver.
> +	 */
> +	ret = device_driver_attach(&dell_uart_bl_serdev_driver.driver, &serdev->dev);
> +	if (ret)
> +		goto err_unregister_serdev_driver;
> +
> +	/* So that dell_uart_bl_pdev_remove() can remove the serdev */
> +	platform_set_drvdata(pdev, serdev);
> +	return 0;
> +
> +err_unregister_serdev_driver:
> +	serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
> +err_remove_serdev:
> +	serdev_device_remove(serdev);
> +	return ret;
> +}
> +
> +static void dell_uart_bl_pdev_remove(struct platform_device *pdev)
> +{
> +	struct serdev_device *serdev = platform_get_drvdata(pdev);
> +
> +	serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
> +	serdev_device_remove(serdev);
> +}
> +
> +static struct platform_driver dell_uart_bl_pdev_driver = {
> +	.probe = dell_uart_bl_pdev_probe,
> +	.remove_new = dell_uart_bl_pdev_remove,
> +	.driver = {
> +		.name = "dell-uart-backlight",
> +	},
> +};
> +module_platform_driver(dell_uart_bl_pdev_driver);
> +
> +MODULE_ALIAS("platform:dell-uart-backlight");
> +MODULE_DESCRIPTION("Dell AIO Serial Backlight driver");
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> +MODULE_LICENSE("GPL");
> 
