Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94D4FDE74;
	Thu, 17 Sep 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648076; cv=none; b=RG1Fz8jmThPFY93Ag0oEDDsgOxoE09S8oFFwv7niCTh3v5ZryCZ4uEpk2npNihyXJkNgiyyrP0YNsOIndZUqewSqt0hohxO79IAub+rOsJe7wGL3q9RCzBzA2TjuOdEaZOBiLDIQbpu6xWAf6ZNLe9/gGUuIei/Sv3SgL5ZCMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648076; c=relaxed/simple;
	bh=eieRPwPonrLr6k1TPvd2vHx+CwUXH2oUR3uiDTLhIqQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U/8ta63GoVvXypb6mlTFkCE3acWOnC0JJlEsW8pvGYzIskUfoz7oJLuvbvFSFtgdHeiqRZYu84kQdjGBYL/0dN7YvFqa4GMuQrLkc4BKHhGQqui1AxHLp2YzgF8PM2CatU2qJP+gJ9H/tGrIdtKxQOb7+D5l+3aLiuhwqJeS/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIpWYmNG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIpWYmNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789648064; x=1821184064;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eieRPwPonrLr6k1TPvd2vHx+CwUXH2oUR3uiDTLhIqQ=;
  b=jIpWYmNGSElSZyW/Sw0RUoT0bbSLKKQPqBip33n4iVzHmWgPkkDYrSQu
   q8VE2tQ8sTzjpCvMVhp4og6rTCI7DisecFBSJtWr+K3QFzicKbE9qSF99
   W1/h+zjDYtk3Z0a5AiZXPexSauaWlMJv+2JS2tq8qyVVM5vpdq7POq1TU
   LSaRcwD3m6T97+xNlVgU4xCWsZS7fJPAoKnHyJF/ZOTouq487ZgagtZ5F
   Hxhn/wlkKXpkIDXw5Ip1jMvIWzgJnO7eYVth/sJHHQDcvmL5JmjEpZq/O
   AJDD1R18XDfKRlR+R+fU3MYnk2OEtdVejHx+5ZhbLBfQQ1xqe1nN4SeeU
   w==;
X-CSE-ConnectionGUID: 8B/pMrMJS4OTE3IpInxc9g==
X-CSE-MsgGUID: hm4kFvw5SF+T5CrnnAMeHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92573530"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92573530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:27:39 -0700
X-CSE-ConnectionGUID: P+HQzeDkQWarMObjHut31w==
X-CSE-MsgGUID: acZHy5J+SJqGcM0/A57LNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270070629"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:27:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 15:27:31 +0300 (EEST)
To: Hilgad Montelo <hilgad.montelo@gmail.com>
cc: kenneth.t.chan@gmail.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] platform/x86: panasonic-laptop: Add driver for
 CF-33 A1/A2 buttons (TBTN)
In-Reply-To: <20260813221744.25668-3-hilgad.montelo@gmail.com>
Message-ID: <963b17f0-2489-e5f5-709b-a8d1c07a1d39@linux.intel.com>
References: <20260813221744.25668-1-hilgad.montelo@gmail.com> <20260813221744.25668-3-hilgad.montelo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Aug 2026, Hilgad Montelo wrote:

> On the Panasonic Toughbook CF-33 the bezel A1/A2 buttons are wired to
> a separate ACPI device, MAT003C (ACPI path \_SB.TBTN), rather than the
> main Hotkey device (MAT0019/HKEY) this driver already talks to.
> MAT003C was present in the ACPI namespace but had no driver bound to
> it, so A1/A2 produced no signal through any channel: no evdev events,
> no ACPI notify (nothing logged), no WMI device, and no correlated ACPI
> GPE interrupt activity.
> 
> Found by dumping and disassembling the platform's ACPI tables
> (acpidump -b + iasl -d) and searching for EC _Qxx query handlers that
> push scancodes into a hotkey queue. TBTN turned out to implement its
> own HINF/HIND/SQTY/SINF method quartet, structurally a clone of HKEY's:
> _Qxx handlers call TBTN.HIND(code) then Notify(TBTN, 0x80); HINF()
> dequeues one scancode from a small EC-side FIFO. Confirmed scancodes:
> 0x38/0x39 = A1 press/release, 0x42/0x43 = A2 press/release. Unlike
> HKEY, TBTN's codes never set the high bit -- press and release are
> distinct scancodes rather than one code plus an up/down flag.
> 
> TBTN.SQTY returns 1 (it has no brightness/battery data, just a
> button-availability flag), so it cannot be probed via the existing
> acpi_pcc_hotkey_probe(), which requires num_sifr > SINF_DC_CUR_BRIGHT
> (assumes every device has the full brightness/eco-mode/battery SINF
> block). Add a second, minimal platform_driver bound to MAT003C
> instead, with its own small input device reporting KEY_PROG2 (A1) and
> KEY_PROG3 (A2) -- both already carry standard XKB keysym mappings
> (XF86Launch2/XF86Launch3), so no udev/hwdb work is needed for desktop
> environments to bind them to actions.
> 
> Verified on a CF-33 Mk1: evtest shows clean KEY_PROG2/KEY_PROG3
> press/release pairs with real physical timing; confirmed bindable as
> GNOME custom shortcuts and launching applications correctly.
> 
> Signed-off-by: Hilgad Montelo <hilgad.montelo@gmail.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c | 168 +++++++++++++++++++++++-
>  1 file changed, 167 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 0c0e4a6..93e6511 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -197,6 +197,42 @@ static const struct acpi_device_id pcc_device_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, pcc_device_ids);
>  
> +/*
> + * On the CF-33 the bezel A1/A2 buttons are wired to a separate ACPI device
> + * (MAT003C, ACPI path \_SB.TBTN) rather than the main Hotkey (MAT0019/HKEY)
> + * device the rest of this driver talks to. TBTN implements its own
> + * HINF/HIND/SQTY/SINF method quartet, structurally a clone of HKEY's, but
> + * SQTY only reports a single SIFR element (a button-availability flag) --
> + * it has none of HKEY's brightness/battery/backlight state, so it can't be
> + * probed via acpi_pcc_hotkey_probe(), which requires the full SINF block.
> + * Register a second, minimal platform_driver for it instead.
> + */
> +#define METHOD_TBTN_QUERY	"HINF"
> +#define TBTN_NOTIFY		0x80
> +
> +static const struct acpi_device_id tbtn_device_ids[] = {
> +	{ "MAT003C", 0},
> +	{ "", 0},

{ } is enough to initialize default values, and no trailing comma for the 
terminator.

> +};
> +MODULE_DEVICE_TABLE(acpi, tbtn_device_ids);
> +
> +struct tbtn_acpi {
> +	acpi_handle		handle;
> +	struct input_dev	*input_dev;
> +};
> +
> +static int tbtn_probe(struct platform_device *pdev);
> +static void tbtn_remove(struct platform_device *pdev);

Please reorganize the struct/code so that these forward-declarations are 
avoided.

> +static struct platform_driver acpi_tbtn_driver = {
> +	.probe = tbtn_probe,
> +	.remove = tbtn_remove,
> +	.driver = {
> +		.name = "Panasonic Tablet Buttons",
> +		.acpi_match_table = tbtn_device_ids,
> +	},
> +};
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int acpi_pcc_hotkey_resume(struct device *dev);
>  #endif
> @@ -961,6 +997,112 @@ static void acpi_pcc_hotkey_notify(acpi_handle handle, u32 event, void *data)
>  	}
>  }
>  
> +/*
> + * TBTN's HINF dequeues one raw scancode from a small EC-side FIFO (0 if
> + * empty) and re-Notify()s itself if more than one entry was pending, so a
> + * single evaluate-and-report per notification is sufficient here -- unlike
> + * HKEY, TBTN's codes never set the high bit, since press and release are
> + * distinct scancodes rather than one code plus an up/down flag.
> + */
> +static void tbtn_report_key(struct tbtn_acpi *tbtn, unsigned int code)
> +{
> +	static const struct {
> +		unsigned int code;
> +		unsigned int keycode;
> +		bool down;
> +	} keymap[] = {
> +		{ 0x38, KEY_PROG2, true },  /* A1 press */
> +		{ 0x39, KEY_PROG2, false }, /* A1 release */
> +		{ 0x42, KEY_PROG3, true },  /* A2 press */
> +		{ 0x43, KEY_PROG3, false }, /* A2 release */
> +	};
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(keymap); i++) {
> +		if (keymap[i].code != code)
> +			continue;
> +		input_report_key(tbtn->input_dev, keymap[i].keycode, keymap[i].down);
> +		input_sync(tbtn->input_dev);

Doesn't this duplicate input's sparse keymap handling?

> +		return;
> +	}
> +
> +	pr_info("Unknown TBTN hotkey event: 0x%02x\n", code);
> +}
> +
> +static void tbtn_notify(acpi_handle handle, u32 event, void *data)
> +{
> +	struct tbtn_acpi *tbtn = data;
> +	unsigned long long result;
> +	acpi_status status;
> +
> +	if (event != TBTN_NOTIFY)
> +		return;
> +
> +	status = acpi_evaluate_integer(tbtn->handle, METHOD_TBTN_QUERY,
> +				       NULL, &result);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("TBTN: error getting hotkey status\n");
> +		return;
> +	}
> +
> +	if (result)
> +		tbtn_report_key(tbtn, result);
> +}
> +
> +static int tbtn_probe(struct platform_device *pdev)
> +{
> +	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
> +	struct tbtn_acpi *tbtn;
> +	struct input_dev *input_dev;
> +	int error;
> +
> +	if (!device)

adev is usually used for acpi_device variables.

> +		return -ENODEV;
> +
> +	tbtn = devm_kzalloc(&pdev->dev, sizeof(*tbtn), GFP_KERNEL);
> +	if (!tbtn)
> +		return -ENOMEM;
> +
> +	tbtn->handle = device->handle;
> +	device->driver_data = tbtn;
> +
> +	input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name = "Panasonic Tablet Buttons";
> +	input_dev->phys = "panasonic/tbtn0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->id.vendor = 0x0001;
> +	input_dev->id.product = 0x0002;
> +	input_dev->id.version = 0x0100;
> +	input_set_capability(input_dev, EV_KEY, KEY_PROG2);
> +	input_set_capability(input_dev, EV_KEY, KEY_PROG3);
> +
> +	error = input_register_device(input_dev);
> +	if (error) {
> +		pr_err("TBTN: unable to register input device\n");
> +		return error;
> +	}
> +
> +	tbtn->input_dev = input_dev;
> +
> +	error = acpi_dev_install_notify_handler(device, ACPI_DEVICE_NOTIFY,
> +						tbtn_notify, tbtn);
> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static void tbtn_remove(struct platform_device *pdev)
> +{
> +	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
> +
> +	acpi_dev_remove_notify_handler(device, ACPI_DEVICE_NOTIFY, tbtn_notify);
> +	device->driver_data = NULL;
> +}
> +
>  static void pcc_optd_notify(acpi_handle handle, u32 event, void *data)
>  {
>  	if (event != ACPI_NOTIFY_EJECT_REQUEST)
> @@ -1221,4 +1363,28 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
>  	kfree(pcc);
>  }
>  
> -module_platform_driver(acpi_pcc_driver);
> +static int __init panasonic_module_init(void)
> +{
> +	int error;
> +
> +	error = platform_driver_register(&acpi_pcc_driver);
> +	if (error)
> +		return error;
> +
> +	error = platform_driver_register(&acpi_tbtn_driver);
> +	if (error) {
> +		platform_driver_unregister(&acpi_pcc_driver);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit panasonic_module_exit(void)
> +{
> +	platform_driver_unregister(&acpi_tbtn_driver);
> +	platform_driver_unregister(&acpi_pcc_driver);
> +}
> +
> +module_init(panasonic_module_init);
> +module_exit(panasonic_module_exit);
> 

-- 
 i.

