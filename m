Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC7446BE3;
	Tue, 21 Jul 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621785; cv=none; b=sE53WwJ18CPmMXO6dxTgMBLyrqLHWoNirDSefXYexpKJfEpfySCrmpj3/8psV4vyLtfezhO5ypq4d/hf5lrtm0pi7lw+4xKCVWr862gMi3f8M+ghVLMr4bFLrqIpjCKdWG/mmo4YaFc8HyQ02IywyvCe4ziRlIgkdZcluEXBHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621785; c=relaxed/simple;
	bh=CWe0er85Mz1HG2+UoowK1fqM2T00r7dxqvSIYtwufMc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TNfL+60csTBWphgvq0zI0l3Tot8/P0GlDc1ZSY8IrTu4bfmkLKSmUKg3eb2ek9CuaJWxHsPw1cdld4DFpq7shPUNjtTy2WRhiHYF0IEbhrUIBM2xm9k/UdFXS6gwRF/g7SBT/lBvxykzykDB7Aff8A6Bj3bYPuLE/7CMV6IcFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRmr841T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRmr841T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784621772; x=1816157772;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CWe0er85Mz1HG2+UoowK1fqM2T00r7dxqvSIYtwufMc=;
  b=mRmr841TQmXDTQ/bsEv1ZnS+YjNiXBnneBlJ33o/WIgKQV8PZrYEDzbn
   uJqpOjOtk/clhQ1a3RaQyXmYKZZOZnYc9z5PJvcSYrWSYnfjyPvWrcG6O
   x6X6CDsSUMbFikuOszZnZDRbZS85L3facBGE8AlWcuizEs5WJzsyTA++s
   JG28F3UlGkzj28hq6vcCk3RmC1E4EGKxXhmIPBjQNIpwjxq4txTCsLfF6
   Z8/Q2YsgRlxdqfaEbqYYHje3E2Zfm5K3Ll9nMmdhvXLivjRX4OgS4r0g8
   F3h9MWmBm0SblbYabnolxYEYSLK/EIkEb4tPu3kwuaX7IZ1Dp6SkzYKTD
   g==;
X-CSE-ConnectionGUID: 9opFigB2Rh+zedUvOZnyEg==
X-CSE-MsgGUID: +Tz5Z/PDTcmzIusZD2Ojvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102629670"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="102629670"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 01:16:05 -0700
X-CSE-ConnectionGUID: hTatMzxvQEeTaTIL4auiWw==
X-CSE-MsgGUID: TBK3RAMpTX2VS3tgoKi6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="261469827"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 01:16:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 11:16:00 +0300 (EEST)
To: Zhan Chubukou <chubukou@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: Add GETAC MPMD programmable button
 driver
In-Reply-To: <20260715004203.14549-1-chubukou@gmail.com>
Message-ID: <759668e0-f9a3-0ba9-e0bd-98a722defa1c@linux.intel.com>
References: <20260715004203.14549-1-chubukou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jul 2026, Zhan Chubukou wrote:

> From: chubukou <chubukou@gmail.com>
> 
> GETAC rugged laptops (e.g. S410) expose vendor button events through an
> ACPI device "MPMD" with hardware ID MTC0303. The Embedded Controller
> raises query methods that issue Notify(MPMD, <code>) on programmable /
> hotkey button activity. Because no Linux driver binds MTC0303, these
> notifies are silently dropped and the buttons appear dead under Linux
> (neither libinput nor acpid observe them: they are device notifies, not
> generic ACPI events).
> 
> Add a minimal ACPI driver that binds MTC0303 and forwards the notifies
> as input events through a sparse-keymap. On the S410 (BIOS R1.25) the
> programmable P2 button generates Notify(MPMD, 0x97) and is mapped to
> KEY_PROG1. Other buttons in the 0xC0..0xCB range (EC queries _Q81.._Q89,
> _Q6A, _Q6B) remain unmapped until confirmed on a given model; enable
> dynamic-debug to identify them.
> 
> Signed-off-by: chubukou <chubukou@gmail.com>

We need a read name here. For more information, please see 
Documentation/process/submitting-patches.rst

> ---
>  MAINTAINERS                       |  6 ++
>  drivers/platform/x86/Kconfig      | 11 ++++
>  drivers/platform/x86/Makefile     |  3 +
>  drivers/platform/x86/getac-mpmd.c | 96 +++++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+)
>  create mode 100644 drivers/platform/x86/getac-mpmd.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ce5c518..9bdabdf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11014,6 +11014,12 @@ F:	Documentation/filesystems/gfs2/
>  F:	fs/gfs2/
>  F:	include/uapi/linux/gfs2_ondisk.h
>  
> +GETAC MPMD DRIVER
> +M:	chubukou <chubukou@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/getac-mpmd.c
> +
>  GIGABYTE WATERFORCE SENSOR DRIVER
>  M:	Aleksa Savic <savicaleksa83@gmail.com>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b521..2effb96 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -440,6 +440,17 @@ config FUJITSU_TABLET
>  
>           If you have a Fujitsu convertible or slate, say Y or M here.
>  
> +config GETAC_MPMD
> +	tristate "GETAC MPMD programmable button support"
> +	depends on ACPI
> +	help
> +	  Driver for the GETAC MPMD ACPI device (HID MTC0303) which forwards
> +	  Embedded Controller button events (e.g. the programmable P2 button)
> +	  as input key events. Without this driver the buttons are silently
> +	  dropped and appear dead under Linux.
> +
> +	  Say Y or M if you have a GETAC rugged laptop (e.g. S410).
> +
>  config GPD_POCKET_FAN
>  	tristate "GPD Pocket Fan Controller support"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 872ac38..8896da3 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -57,6 +57,9 @@ obj-$(CONFIG_FUJITSU_TABLET)	+= fujitsu-tablet.o
>  # GPD
>  obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
>  
> +# GETAC
> +obj-$(CONFIG_GETAC_MPMD)	+= getac-mpmd.o
> +
>  # Hewlett Packard
>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
>  
> diff --git a/drivers/platform/x86/getac-mpmd.c b/drivers/platform/x86/getac-mpmd.c
> new file mode 100644
> index 0000000..0f1ec8b
> --- /dev/null
> +++ b/drivers/platform/x86/getac-mpmd.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * GETAC MPMD programmable button driver
> + *
> + * GETAC rugged laptops expose vendor events through an ACPI device named
> + * "MPMD" with hardware ID MTC0303. The Embedded Controller raises query
> + * methods that Notify(MPMD, <code>) on programmable / hotkey button
> + * activity. Without a driver bound to MTC0303 these notifies are silently
> + * dropped, so the buttons appear dead under Linux.
> + *
> + * This driver binds MTC0303 and forwards the notifies as input events.
> + *
> + * Observed on GETAC S410 (BIOS R1.25.070520):
> + *   0x97  P2 programmable button (repeats at ~3 Hz while held)
> + *
> + * The 0xC0..0xCB range is generated by EC query methods _Q81.._Q89, _Q6A
> + * and _Q6B and is left as KEY_UNKNOWN until a button is confirmed; enable
> + * module dynamic-debug to identify further buttons on a given model.
> + *
> + * Copyright (C) 2026 chubukou <chubukou@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>

You probably need something in Kconfig for these?

> +#include <linux/module.h>
> +
> +struct getac_mpmd_priv {
> +	struct input_dev *input;
> +};
> +
> +static const struct key_entry getac_mpmd_keymap[] = {
> +	{ KE_KEY, 0x97, { KEY_PROG1 } },		/* P2 programmable button */
> +	{ KE_END, 0 }
> +};
> +
> +static void getac_mpmd_notify(struct acpi_device *adev, u32 event)
> +{
> +	struct getac_mpmd_priv *priv = acpi_driver_data(adev);
> +
> +	if (!sparse_keymap_report_event(priv->input, event, 1, true))
> +		dev_dbg(&adev->dev, "unknown notify event 0x%02x\n", event);

Add include for dev_dbg()

> +}
> +
> +static int getac_mpmd_add(struct acpi_device *adev)
> +{
> +	struct getac_mpmd_priv *priv;
> +	struct input_dev *input;
> +	int ret;
> +
> +	priv = devm_kzalloc(&adev->dev, sizeof(*priv), GFP_KERNEL);

Please add linux/device.h include for this.

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	input = devm_input_allocate_device(&adev->dev);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	input->name = "GETAC MPMD programmable buttons";
> +	input->phys = "getac-mpmd/input0";
> +	input->id.bustype = BUS_HOST;
> +
> +	ret = sparse_keymap_setup(input, getac_mpmd_keymap, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = input_register_device(input);
> +	if (ret)
> +		return ret;
> +
> +	priv->input = input;
> +	adev->driver_data = priv;

Once you've converted to platform_driver (see below), please use the 
accessor to set drvdata.

> +	return 0;
> +}
> +
> +static const struct acpi_device_id getac_mpmd_ids[] = {
> +	{ "MTC0303" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, getac_mpmd_ids);
> +
> +static struct acpi_driver getac_mpmd_driver = {

Please don't add new acpi_drivers anymore. Rafael is trying to get rid all 
of them.

> +	.name = "getac_mpmd",
> +	.class = "getac",
> +	.ids = getac_mpmd_ids,
> +	.ops = {
> +		.add = getac_mpmd_add,
> +		.notify = getac_mpmd_notify,
> +	},
> +};
> +
> +module_acpi_driver(getac_mpmd_driver);
> +
> +MODULE_AUTHOR("chubukou <chubukou@gmail.com>");
> +MODULE_DESCRIPTION("GETAC MPMD (MTC0303) programmable button driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

