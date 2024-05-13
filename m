Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DD1474BF
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715589254; cv=none; b=itfkyUc66sxC2/pWVGdWFqXFqZr4JV2UzuXGt7DSlAN0T9GSvZJ/gfOyOeGA9kVM8muxr7WM2rNZfEMEvyY7DdiioZtNWXEHN/yTVJORiuaVmNU4Krljzbmo7M1QLVJpl+xm1DOa15Y0ZHiBibxEUaNoDwyb9HTwnMtLJ6RVe5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715589254; c=relaxed/simple;
	bh=GfGnQnviGS04E3kt9UbpK7TEOEvN7xCcRC24ihEK92E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nn3lN/KYD66qYp3xFeJx263sSQyWIEzoG2Mnja7BhEZBUd4yt8VCrR6Gk2r3Y0UaMWhgsg2JipGFZLfw7N29v0xhlFA1i+IsBnFp06YFlSbCpkGSSqc/QJ82NCaaU7wrn0p0uh2XRC9bXJ9l3vkC9RVKlywypZekqFSeCLg4HbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFpIo8Si; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFpIo8Si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715589253; x=1747125253;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GfGnQnviGS04E3kt9UbpK7TEOEvN7xCcRC24ihEK92E=;
  b=QFpIo8SiQ/DuxKDxMkbpEk1bTK+mRK5ZtTHjE1ix8fPjWqU9BeHZ8Zha
   2JF9Hp4AZSLbnmcQXhrt9vKl/59I65BbH3AZBM6LCAxcAK1IDvgiK0dph
   pPKAJxOYVRRHY/6z9XwbzRunxTzAEGc+ZVMS7EsozKglQ/mUe33yjbGXw
   amjIQcsVMKbnJ6kriDMHYlSTmudeheKeW0G2+T+z4OiO1D5w8SiCnYylp
   tSWUuYkcUWXJm7NthMZrV/3KGWng1fZjYLFCQqY/5wxRfTUjqzyy0DSnD
   YlSISvqRRyrL8/Gyp29lu8noAfCF7bn18aLMAL/0H06ir4jp/XJgULNgw
   g==;
X-CSE-ConnectionGUID: 4EIdm0puSkeTsT96/uH33g==
X-CSE-MsgGUID: dFmso6EYSp6/FeU51wHNvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11451335"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11451335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:34:12 -0700
X-CSE-ConnectionGUID: fbE3+U4mTLm/51pgd/CT9A==
X-CSE-MsgGUID: u9JdLTCuSZ2S5NoWLL54IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30110750"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:34:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 11:34:04 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <20240512162353.46693-2-hdegoede@redhat.com>
Message-ID: <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 May 2024, Hans de Goede wrote:

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
> Co-developed-by: AceLan Kao <acelan.kao@canonical.com>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/Kconfig             |  15 +
>  drivers/platform/x86/dell/Makefile            |   1 +
>  .../platform/x86/dell/dell-uart-backlight.c   | 409 ++++++++++++++++++
>  3 files changed, 425 insertions(+)
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
> index 000000000000..d3ffea9e6270
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -0,0 +1,409 @@
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
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/serdev.h>
> +#include <linux/wait.h>
> +#include "../serdev_helpers.h"
> +
> +/* The backlight controller must respond within 1 second */
> +#define DELL_BL_TIMEOUT		msecs_to_jiffies(1000)
> +#define DELL_BL_MIN_RESP_SIZE	3
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
> +	dell_bl->status = 0;
> +	dell_bl->resp = resp;
> +	dell_bl->resp_idx = 0;
> +	dell_bl->resp_max_len = resp_max_len;
> +	dell_bl->pending_cmd = cmd[1];
> +
> +	/* The TTY buffer should be big enough to take the entire cmd in one go */
> +	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
> +	if (ret != cmd_len) {
> +		dev_err(dell_bl->dev, "Error writing command: %d\n", ret);
> +		ret = (ret < 0) ? ret : -EIO;
> +		goto out;
> +	}
> +
> +	ret = wait_event_timeout(dell_bl->wait_queue, dell_bl->status, DELL_BL_TIMEOUT);
> +	if (ret == 0) {
> +		dev_err(dell_bl->dev, "Timed out waiting for response.\n");
> +		dell_bl->status = -ETIMEDOUT;
> +	}
> +
> +	if (dell_bl->status == 1)
> +		ret = 0;
> +	else
> +		ret = dell_bl->status;

I wonder if it would make dell_bl->status easier to follow if you'd first 
make it -EBUSY instead of 0 and set it to 0 on success?

It would basically be normal errno behavior without extra values then and 
you wouldn't need to map it into return value here.

> +out:
> +	mutex_unlock(&dell_bl->mutex);
> +	return ret;
> +}
> +
> +static int dell_uart_set_brightness(struct dell_uart_backlight *dell_bl, int brightness)
> +{
> +	/*
> +	 * Set Brightness level: Application uses this command to set brightness.
> +	 * Command: 0x8A 0x0B <brightness-level> Checksum (Length:4 Type:0x0A Cmd:0x0B)
> +	 *          <brightness-level> ranges from 0~100.

Why ~ character, is this just - ?

> +	 * Return data: 0x03 0x0B 0xF1 (Length:3 Cmd:0x0B Checksum:0xF1)

All these commands return header + echo cmd + (optional) data + checksum. 
I'm not sure why they all need a comment about it...

It's also slightly misleading to call it "Return data" which can be 
misinterpreted to mean the return value of this function which is not 
correct (code calls it resp(onse) anyway so if it's necessary, use 
response data instead).

> +	 */
> +	u8 set_brightness[] = { 0x8A, 0x0B, 0x00, 0x00 };

Use #defines instead of literals.

I think it makes the entire comments about the commands mostly useless 
when these are converted into properly named defines.

> +	u8 resp[3];
> +
> +	set_brightness[2] = brightness;
> +	set_brightness[3] = dell_uart_checksum(set_brightness, 3);

Also, couldn't these be accessed through a struct to eliminate most of the 
magic indexes?

> +	return dell_uart_bl_command(dell_bl, set_brightness, ARRAY_SIZE(set_brightness),
> +				    resp, ARRAY_SIZE(resp));
> +}
> +
> +static int dell_uart_get_brightness(struct dell_uart_backlight *dell_bl)
> +{
> +	/*
> +	 * Get Brightness level: Application uses this command to get brightness.
> +	 * Command: 0x6A 0x0C 0x89 (Length:3 Type:0x0A Cmd:0x0C Checksum:0x89)
> +	 * Return data: 0x04 0x0C Data Checksum
> +	 *              (Length:4 Cmd:0x0C Data:<brightness level>
> +	 *               Checksum: SUM(Length and Cmd and Data) xor 0xFF)
> +	 *              <brightness level> ranges from 0~100.

~ -> - ?

> +	 */
> +	const u8 get_brightness[] = { 0x6A, 0x0C, 0x89 };
> +	u8 resp[4];
> +	int ret;
> +
> +	ret = dell_uart_bl_command(dell_bl, get_brightness, ARRAY_SIZE(get_brightness),
> +				   resp, ARRAY_SIZE(resp));
> +	if (ret)
> +		return ret;
> +
> +	if (resp[0] != 4) {

sizeof(resp), but isn't this already checked when reading it??

> +		dev_err(dell_bl->dev, "Unexpected get brightness response length: %d\n", resp[0]);
> +		return -EIO;
> +	}
> +
> +	if (resp[2] > 100) {

Add #define.

> +		dev_err(dell_bl->dev, "Unexpected get brightness response: %d\n", resp[2]);
> +		return -EIO;
> +	}
> +
> +	return resp[2];
> +}
> +
> +static int dell_uart_set_bl_power(struct dell_uart_backlight *dell_bl, int power)
> +{
> +	/*
> +	 * Screen ON/OFF Control: Application uses this command to control screen ON or OFF.
> +	 * Command: 0x8A 0x0E Data Checksum (Length:4 Type:0x0A Cmd:0x0E) where
> +	 *          Data=0 to turn OFF the screen.
> +	 *          Data=1 to turn ON the screen.
> +	 *          Other value of Data is reserved and invalid.
> +	 * Return data: 0x03 0x0E 0xEE (Length:3 Cmd:0x0E Checksum:0xEE)
> +	 */
> +	u8 set_power[] = { 0x8A, 0x0E, 0x00, 0x00 };
> +	u8 resp[3];
> +	int ret;
> +
> +	set_power[2] = (power == FB_BLANK_UNBLANK) ? 1 : 0;
> +	set_power[3] = dell_uart_checksum(set_power, 3);
> +
> +	ret = dell_uart_bl_command(dell_bl, set_power, ARRAY_SIZE(set_power),
> +				   resp, ARRAY_SIZE(resp));
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
> + * and then track and report its status by power variable

Missing .

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
> +		ret = dell_uart_set_bl_power(dell_bl, bd->props.power);
> +
> +	return ret;
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
> +	if (dell_bl->status) {

As mentioned above, != -EBUSY ?

> +		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
> +		return len;
> +	}
> +
> +	for (i = 0; i < len; i++) {
> +		dell_bl->resp[dell_bl->resp_idx] = data[i];
> +
> +		switch (dell_bl->resp_idx) {
> +		case 0: /* Length byte */
> +			dell_bl->resp_len = dell_bl->resp[0];
> +			if (dell_bl->resp_len < DELL_BL_MIN_RESP_SIZE) {
> +				dev_err(dell_bl->dev, "Response length too small %d < %d\n",
> +					dell_bl->resp_len, DELL_BL_MIN_RESP_SIZE);
> +				dell_bl->status = -EIO;
> +				goto wakeup;
> +			} else if (dell_bl->resp_len > dell_bl->resp_max_len) {

Unnecessary else because of the goto.

> +				dev_err(dell_bl->dev, "Response length too big %d > %d\n",
> +					dell_bl->resp_len, dell_bl->resp_max_len);
> +				dell_bl->status = -EIO;
> +				goto wakeup;
> +			}
> +			break;
> +		case 1: /* CMD byte */
> +			if (dell_bl->resp[1] != dell_bl->pending_cmd) {
> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
> +					dell_bl->resp[1], dell_bl->pending_cmd);
> +				dell_bl->status = -EIO;
> +				goto wakeup;
> +			}
> +			break;
> +		}
> +
> +		dell_bl->resp_idx++;
> +		if (dell_bl->resp_idx < dell_bl->resp_len)
> +			continue;
> +
> +		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
> +		if (dell_bl->resp[dell_bl->resp_len - 1] != csum) {
> +			dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
> +				dell_bl->resp[dell_bl->resp_len - 1], csum);
> +			dell_bl->status = -EIO;
> +			goto wakeup;
> +		}

Why is the checksum calculation and check inside the loop??

> +		dell_bl->status = 1; /* Success */

As mentioned above, change this to = 0 ?

> +		goto wakeup;

Huh? Now I'm totally lost how the control flow is supposed to go in this 
function. Can you rethink this loop so it actual makes sense and doesn't 
misuse gotos like this?

> +	}
> +
> +	return len;
> +
> +wakeup:
> +	wake_up(&dell_bl->wait_queue);
> +	return i + 1;
> +}
> +
> +static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
> +	.receive_buf = dell_uart_bl_receive,
> +	.write_wakeup = serdev_device_write_wakeup,
> +};
> +
> +static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
> +{
> +	/*
> +	 * Get Firmware Version: Tool uses this command to get firmware version.
> +	 * Command: 0x6A 0x06 0x8F (Length:3 Type:0x0A Cmd:6 Checksum:0x8F)
> +	 * Return data: 0x0D 0x06 Data Checksum (Length:13 Cmd:0x06
> +	 *              Data:F/W version(APRILIA=APR27-Vxxx/PHINE=PHI23-Vxxx)
> +	 *              Checksum:SUM(Length and Cmd and Data) xor 0xFF)
> +	 */
> +	const u8 get_firmware_ver[] = { 0x6A, 0x06, 0x8F };
> +	struct dell_uart_backlight *dell_bl;
> +	struct backlight_properties props;
> +	struct device *dev = &serdev->dev;
> +	u8 get_firmware_ver_resp[80];
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
> +	ret = dell_uart_bl_command(dell_bl, get_firmware_ver, ARRAY_SIZE(get_firmware_ver),
> +				   get_firmware_ver_resp, ARRAY_SIZE(get_firmware_ver_resp));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "getting firmware version\n");
> +
> +	dev_dbg(dev, "Firmware version: %.*s\n", get_firmware_ver_resp[0] - 3,
> +		get_firmware_ver_resp + 2);
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
> +	memset(&props, 0, sizeof(struct backlight_properties));

Just assigned = {} when declaring.

> +	props.type = BACKLIGHT_PLATFORM;
> +	props.brightness = ret;
> +	props.max_brightness = 100;

Use #define.

> +	props.power = dell_bl->power;
> +
> +	dell_bl->bl = devm_backlight_device_register(dev, "dell_uart_backlight",
> +						     dev, dell_bl,
> +						     &dell_uart_backlight_ops,
> +						     &props);
> +	if (IS_ERR(dell_bl->bl))
> +		return PTR_ERR(dell_bl->bl);
> +
> +	return 0;
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
> +	if (ret) {
> +		serdev_device_remove(serdev);
> +		return ret;
> +	}
> +
> +	/*
> +	 * serdev device <-> driver matching relies on OF or ACPI matches and
> +	 * neither is available here, manually bind the driver.
> +	 */
> +	ret = device_driver_attach(&dell_uart_bl_serdev_driver.driver, &serdev->dev);
> +	if (ret) {
> +		serdev_device_driver_unregister(&dell_uart_bl_serdev_driver);
> +		serdev_device_remove(serdev);
> +		return ret;
> +	}

The last two error branch could use normal rollback with goto.

-- 
 i.

> +
> +	/* So that dell_uart_bl_pdev_remove() can remove the serdev */
> +	platform_set_drvdata(pdev, serdev);
> +	return 0;
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
