Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448171509BF
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605105; cv=none; b=fukd1jWJB0DPgUVgZDM+Ovak+EdgFpQcUQHCSPaZjz5TDGTzNsqfWpNv8DcWohBRffdphfooM5TnWUPw95ioZBUtps9qYm2+jy0ceyKOVwBTe9dBXSfNjAVA5y7ZH+UVhBF6HmxqUWFixoXNrDh9E25Ji5hidJyc6g2rPdKxQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605105; c=relaxed/simple;
	bh=nmGpNv6Bb2g5qZFOb1MYwWOppp+agjri+qK+MyjeoxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOWFCts9yVrg3i+Wtbx2KYZI8sTvuA/paq7VssxxORkUgdP3LJvHFBvoUhu7TEvU2aL8G08Ebb4KvNqtT2HsAaqY4NBEG8rMktpLtq/4F1Rv35fMM3pcnJUrtmMIhgG/W88/YiDBmNazB6yoFsPkKI59voHffmPZ7tfH1MIJu20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 7/8TNK14R1OqSRgbIA91OA==
X-CSE-MsgGUID: dvKdn2WESQ2giE+WxeCXqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15328410"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="15328410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:58:24 -0700
X-CSE-ConnectionGUID: jPMt+YjWREqRTKucIS68+Q==
X-CSE-MsgGUID: imeKaWaGRzGVBdHdxPwqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="61509993"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:58:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s6VFz-000000078hR-295v;
	Mon, 13 May 2024 15:58:19 +0300
Date: Mon, 13 May 2024 15:58:19 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86: Add new Dell UART backlight driver
Message-ID: <ZkIOa6jo47CqgxGK@smile.fi.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513111552.44880-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 01:15:50PM +0200, Hans de Goede wrote:
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

...

> Reported-by: Roman Bogoyev <roman@computercheck.com.au>

Privately? I mean no links to the report?

...

> +config DELL_UART_BACKLIGHT
> +	tristate "Dell AIO UART Backlight driver"
> +	depends on ACPI

Can it be compile-tested in non-ACPI kernels?

> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on SERIAL_DEV_BUS

...

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Yeah, I don't like this, can we move it into header itself?

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

...

> +/* 1st byte Start Of Frame 3 MSB bits: cmd-len + 01010 SOF marker */
> +#define SOF(len)			(((len) << 5) | 0x0a)

This kinda too short to be somehow unique, potential collision might be if
somebody introduces this in the header which somehow will be chain-included
here. Perhaps a namespace? DELL_SOF?

...

> +static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
> +				const u8 *cmd, int cmd_len,
> +				u8 *resp, int resp_max_len)
> +{
> +	int ret;
> +
> +	ret = mutex_lock_killable(&dell_bl->mutex);

Can't be called via cleanup.h?

> +	if (ret)
> +		return ret;
> +
> +	dell_bl->status = -EBUSY;
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
> +	ret = wait_event_timeout(dell_bl->wait_queue, dell_bl->status != -EBUSY,
> +				 DELL_BL_TIMEOUT);
> +	if (ret == 0) {
> +		dev_err(dell_bl->dev, "Timed out waiting for response.\n");
> +		ret = -ETIMEDOUT;
> +	} else {
> +		ret = dell_bl->status;
> +	}
> +
> +out:
> +	mutex_unlock(&dell_bl->mutex);
> +	return ret;
> +}

> +static int dell_uart_get_brightness(struct dell_uart_backlight *dell_bl)
> +{

	struct device *dev = dell_bl->dev;

> +	u8 get_brightness[GET_CMD_LEN], resp[GET_RESP_LEN];
> +	int ret;
> +
> +	get_brightness[0] = SOF(GET_CMD_LEN);
> +	get_brightness[1] = CMD_GET_BRIGHTNESS;
> +	get_brightness[2] = dell_uart_checksum(get_brightness, 2);

> +	ret = dell_uart_bl_command(dell_bl, get_brightness, GET_CMD_LEN, resp, GET_RESP_LEN);
> +	if (ret)
> +		return ret;
> +
> +	if (resp[RESP_LEN] != GET_RESP_LEN) {
> +		dev_err(dell_bl->dev, "Unexpected get brightness response length: %d\n",
> +			resp[RESP_LEN]);

		dev_err(dev, "Unexpected get brightness response length: %d\n", resp[RESP_LEN]);

> +		return -EIO;
> +	}
> +
> +	if (resp[RESP_DATA] > DELL_BL_MAX_BRIGHTNESS) {
> +		dev_err(dell_bl->dev, "Unexpected get brightness response: %d\n",
> +			resp[RESP_DATA]);

		dev_err(dev, "Unexpected get brightness response: %d\n", resp[RESP_DATA]);

> +		return -EIO;
> +	}
> +
> +	return resp[RESP_DATA];
> +}

...

> +		case RESP_CMD: /* CMD byte */
> +			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
> +				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
> +					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> +				dell_bl->status = -EIO;
> +				goto wakeup;
> +			}
> +			break;

No default case?

...

> +	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);

I would be on the safest side, i.e. not trusting that it will be NUL-terminated
string, hence something like %*pE?


-- 
With Best Regards,
Andy Shevchenko


