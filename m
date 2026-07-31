Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97A42F6E9;
	Fri, 31 Jul 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508907; cv=none; b=Mx6UjZUvZtvh8SrWJb6x7H/Jv5p9N6Z8k5YCRwr6rBcmmqxTL04FX0Kxg3q4gL3K9nGDA99iHM1MFtqIdiqsjrPcvhNOISKhgZHYKrQNmKW3x7X1kJF6cuLrMkPASNyO8GLcoPKXQoiolLbKVuw24mxlyu4vc3VL9poznQwpqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508907; c=relaxed/simple;
	bh=oUNeudQKlsrS6OK5qn1lg5KKz8xkNkob3WFxg5wFEuU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=m+l1dvT4gMQAIk2xWx32jirWn62iHsUf6UBfUaECigZnkH5pmK/p1TYi08vSxcaLEtNXx1C1zhP1CUSRUZf5Xejd2533d4U/K/I4vHN+Y1YLPU3pZo4ql/F2QF8ySyC7fr/AH2F/gxh69w6ELCkY7EcVDefolJ7RRxvsEMvCb5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=OIrU+5Bc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CY6lYycS; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="OIrU+5Bc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CY6lYycS"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 27B5F140011E;
	Fri, 31 Jul 2026 10:41:44 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 10:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1785508904;
	 x=1785595304; bh=trqcJQDOMg0NMuo0xKBk9zbVvxU4otCIwlo0xxt2xs8=; b=
	OIrU+5BcJmWM5hKdb/s9V4tmRhcw3CL2ny4Ws5qcJmQG69vfcIHOIfE8yrMmxqi8
	MXqEqCC8iy1R4c/3447T4r2hrCFFbSv49PCwHtYKHAEHx2HZFhmcJLFZ7Is1ylw8
	JiqWGPDrem7/o9ju2FgxI34I596Imns36lGCH2qyylblfr+oDK5Yx3rasoMzMJmp
	IpBY5x9yt++vNY9iT5HZCpEnYxsqkpAWKNkgob6oA5hnv17uL1v9bBpYhYR/zw6o
	ASOCkd1ZgW4FVAiiIAwa8lwej5D0FRPo7J6zKriOMiDthednRO0M3bp3HomgmpGN
	WlUBg7jLqgJLBN2m2SR4FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785508904; x=
	1785595304; bh=trqcJQDOMg0NMuo0xKBk9zbVvxU4otCIwlo0xxt2xs8=; b=C
	Y6lYycSziWZF9zEFq1yLeBr5n7A4q9dOu9wcX8bBOeea4LXfN5f3Z9mwgnmhodzE
	Dfd4txsKUkXvK+zdnPX/lo5CRVG4usLQN6Nlx01waloGnzjPSBtDEIhIEEy3oQKy
	Zv24twbMjk/aKLW4SmOry37dhSlSXvH5KRGDtFF3zOKM8iOuraztgnpJKj3dvxmY
	UYFCCxbsXbYeihtsywlqE6D4dCiRoTHKCFTaxzA+bCGDBwY8OGq9u5dS7GW/5g6o
	dn9TZNw8Xw55rp2TBM3BItpT+0QPvp82WIngnG3DhUgsFfmhb+XF8rzOrIJu1v6g
	t8S59/ywUWRpzq3EqlB0Q==
X-ME-Sender: <xms:J7RsasvpTUnUfvwSv1WP--YKAy3BBTQq8W03PwOJHePD3TR9CP1PfQ>
    <xme:J7RsakTB66Kqfq1Wv7FIC6WKvJfkhLQgdjJ_xFAW33M0q59EhJ7oal3TmuxscDefN
    07eDU6xFF1JV-Ucga7P1MnC5I5CqElUB8uWXrraxsbIWYwBcSLsqlA>
X-ME-Proxy-Cause: dmFkZTEU/rkwKN+oIXNxWu+jrq7wlU0X/yZHxlbMveqXemF3hJsbJAE+GXC9EeliMEy/ec
    NSjbVndq+czH8egUXhymm9VkuZ5dSHBoQaww8xHDSU70/cJP8UbUio0MPEq8TpyXFxpaLR
    Ku+3vP8ww2AUS8N7C8AJTOPHt5ZeGintbrySMKmY1Ol92nKeDmxsFAJD2vOALpbdaA0slF
    J+f4jjglMGfDCxqkJZ3SoB6zJ1jTfWr1TIWg2dVVD3EEmLU303yt+36dHNEWnWj1QNZ6H2
    wOaHNvzVQUz5K8XlqyuYeIoaMKOQPoy62AxvE7DW96xUHajU0I9VAZcIdXT4kHN+1cKJUL
    dvyFa0UvePbTDvMjWgeYxfB1SGYCvvgM6dvwWSpdmMm2EJXCKOwTQx7lK36vrAt5TiqjaO
    tXAhn52gV3qa+4Dc9YzYemypL1t+mM4IT0JbgdWcPsUMDNEbFiAaJzw+N4zt1jPA8+h9x7
    DTHAwWd5OrmkbKQJJNhnlhqC6iLcxRXT6kLlgxC9uAU7NiEjCpDlgHipdqOG/5/44LnKXl
    4M7bqOIhoEhGcWZKeJuJMwUscaP/RNVtoKyOol2CVvkBkm0zWV0ANmPdv8rdvFHvL3F34k
    716MMzTIqjCLSraytaKCfokENH1yYgPEOFaJ5wF5uDtSzW+nu2cX6gxI8W6Q
X-ME-Proxy: <xmx:J7Rsap6E6cOe3_OurEyM6s-E9s_4r7Lkh0ZgcQsOeaifG3_3Yex2aA>
    <xmx:J7Rsas7iPVbZLwU1J9Xo_Max45VYq3wz4Yzgodwhx_VM59_UnctR4Q>
    <xmx:J7RsarQOx59qz-V7fB8T6C2PaFJGe3R9pklPrZnkNTtrOlo_sY46xQ>
    <xmx:J7Rsak8LWUd0PWQSfPv4efop2nvQb60kdQpwKDehCMqFEP6mjCUDLw>
    <xmx:KLRsalV94QwxEiyZmGv9sWVQ-0ObNiYYV2WnUMUVtQ9cuA35bSjfo1dw>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 709722CE03C1; Fri, 31 Jul 2026 10:41:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aachc0YD4MzN
Date: Fri, 31 Jul 2026 10:41:23 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Pit Henrich" <pithenrichmail@googlemail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, pithenrich2d@gmail.com
Message-Id: <689c7080-8cf3-4d96-b1bd-847a0120bae4@app.fastmail.com>
In-Reply-To: <20260731082818.1578104-1-pithenrich2d@gmail.com>
References: <20260731082818.1578104-1-pithenrich2d@gmail.com>
Subject: Re: [PATCH v3] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment
 detection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 31, 2026, at 4:28 AM, Pit Henrich wrote:
> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
> attached (on the screen), but thinkpad-acpi does not expose this to userspace.
> The state can be obtained via ACPI methods: GDST (get device state).
>
> Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
> a DMI match.
>
> Cache the state and emit a sysfs notification on
> TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
> hotkey setup and refresh it before the resume notification to keep the state
> consistent across suspend and resume.
>
> Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
> ---
> This replaced the v2 patch in:
> https://lore.kernel.org/all/20260419102724.91451-1-pithenrich2d@gmail.com/
>
> Changes v1 -> v2:
>  * Use ACPI method instead of using the EC directly (thanks Mark).
> Changes v2 -> v3:
>  * Added documentation to thinkpad-acpi.rst
>  * Patched against current thinkpad_acpi.c
>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 26 +++++-
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 85 ++++++++++++++++++-
>  2 files changed, 108 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst 
> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index f874db31801d..7873a58cb2f5 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -583,7 +583,8 @@ Events that are propagated by the driver to 
> userspace:
>  0x6030		System thermal table changed
>  0x6032		Thermal Control command set completion  (DYTC, Windows)
>  0x6040		Nvidia Optimus/AC adapter related (TO BE VERIFIED)
> -0x60C0		X1 Yoga 2016, Tablet mode status changed
> +0x60C0		X1 Yoga 2016 tablet mode or X1 Fold 16 Gen 1 keyboard
> +		attachment state changed
>  0x60F0		Thermal Transformation changed (GMTS, Windows)
>  ======		=====================================================
> 
> @@ -1634,6 +1635,29 @@ if damage detected:
>  The property is read-only. If feature is not supported then sysfs
>  attribute is not created.
> 
> +X1 Fold keyboard attachment
> +---------------------------
> +
> +sysfs attribute: keyboard_attached_on_screen
> +
> +ThinkPad X1 Fold 16 Gen 1 systems can report whether the keyboard is
> +currently attached on-screen.
> +
> +This attribute is currently supported on ThinkPad X1 Fold 16 Gen 1
> +systems only.
> +
> +The command to check the keyboard attachment state is::
> +
> +	cat /sys/devices/platform/thinkpad_acpi/keyboard_attached_on_screen
> +
> +The values are:
> +
> +- 0 if the keyboard is not attached on-screen
> +- 1 if the keyboard is attached on-screen
> +
> +The property is read-only. If feature is not supported then the sysfs
> +attribute is not created.
> +
>  Multiple Commands, Module Parameters
>  ------------------------------------
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 445e1403308e..66480609ee05 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -219,8 +219,9 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
>  	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
>  	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
> -	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
> -						   * enter/leave tablet mode
> +	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* posture change event:
> +						   * X1 Yoga (2016): enter/leave tablet mode
> +						   * X1 Fold 16 Gen 1: keyboard attachment state changed
>  						   */
>  	TP_HKEY_EV_PEN_INSERTED		= 0x500b, /* tablet pen inserted */
>  	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
> @@ -374,6 +375,7 @@ static struct {
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap_enable:1;
> +	u32 has_keyboard_attached_on_screen:1;
>  	struct quirk_entry *quirks;
>  } tp_features;
> 
> @@ -2888,6 +2890,63 @@ static void hotkey_tablet_mode_notify_change(void)
>  			     "hotkey_tablet_mode");
>  }
> 
> +static bool keyboard_attached_on_screen;
> +static bool keyboard_attached_on_screen_initialized;
> +
> +static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
> +{
> +	int state;
> +
> +	if (!tp_features.has_keyboard_attached_on_screen)
> +		return -ENODEV;
> +
> +	if (!acpi_evalf(NULL, &state, "\\_SB.DEVD.GDST", "d"))
> +		return -EIO;
> +
> +	*attached = state != 0;
> +	return 0;
> +}
> +
> +static ssize_t keyboard_attached_on_screen_show(struct device *dev,
> +						struct device_attribute *attr,
> +						char *buf)
> +{
> +	bool attached;
> +	int res;
> +
> +	res = x1_fold_keyboard_attached_on_screen_get(&attached);
> +	if (res)
> +		return res;
> +
> +	return sysfs_emit(buf, "%d\n", attached);
> +}
> +
> +static DEVICE_ATTR_RO(keyboard_attached_on_screen);
> +
> +static void keyboard_attached_on_screen_notify_change(void)
> +{
> +	if (tp_features.has_keyboard_attached_on_screen)
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> +			     "keyboard_attached_on_screen");
> +}
> +
> +static bool keyboard_attached_on_screen_update(void)
> +{
> +	bool attached;
> +
> +	if (x1_fold_keyboard_attached_on_screen_get(&attached))
> +		return false;
> +
> +	if (keyboard_attached_on_screen_initialized &&
> +	    keyboard_attached_on_screen == attached)
> +		return false;
> +
> +	keyboard_attached_on_screen = attached;
> +	keyboard_attached_on_screen_initialized = true;
> +
> +	return true;
> +}
> +
>  /* sysfs wakeup reason (pollable) 
> -------------------------------------- */
>  static ssize_t hotkey_wakeup_reason_show(struct device *dev,
>  			   struct device_attribute *attr,
> @@ -3017,6 +3076,7 @@ static struct attribute *hotkey_attributes[] = {
>  	&dev_attr_hotkey_adaptive_all_mask.attr,
>  	&dev_attr_hotkey_recommended_mask.attr,
>  	&dev_attr_hotkey_tablet_mode.attr,
> +	&dev_attr_keyboard_attached_on_screen.attr,
>  	&dev_attr_hotkey_radio_sw.attr,
>  	&dev_attr_doubletap_enable.attr,
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> @@ -3032,6 +3092,9 @@ static umode_t hotkey_attr_is_visible(struct 
> kobject *kobj,
>  	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
>  		if (!tp_features.hotkey_tablet)
>  			return 0;
> +	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
> +		if (!tp_features.has_keyboard_attached_on_screen)
> +			return 0;
>  	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
>  		if (!tp_features.hotkey_wlsw)
>  			return 0;
> @@ -3448,6 +3511,7 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  	}
> 
>  	tabletsw_state = hotkey_init_tablet_mode();
> +	keyboard_attached_on_screen_update();
> 
>  	/* Set up key map */
>  	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
> @@ -3828,6 +3892,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
> bool *send_acpi_ev)
>  	case TP_HKEY_EV_TABLET_CHANGED:
>  		tpacpi_input_send_tabletsw();
>  		hotkey_tablet_mode_notify_change();
> +		if (keyboard_attached_on_screen_update())
> +			keyboard_attached_on_screen_notify_change();
>  		*send_acpi_ev = false;
>  		return true;
> 
> @@ -3984,6 +4050,8 @@ static void hotkey_resume(void)
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();
>  	hotkey_tablet_mode_notify_change();
> +	keyboard_attached_on_screen_update();
> +	keyboard_attached_on_screen_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
>  	hotkey_poll_setup_safe(false);
> @@ -4282,6 +4350,17 @@ static const struct dmi_system_id fwbug_list[] 
> __initconst = {
>  	{}
>  };
> 
> +static const struct dmi_system_id keyboard_attached_on_screen_list[] 
> __initconst = {
> +	{
> +		.ident = "ThinkPad X1 Fold 16 Gen 1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 16 Gen 1"),
> +		},
> +	},
> +	{}
> +};
> +
>  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
> @@ -12239,6 +12318,8 @@ static int __init 
> thinkpad_acpi_module_init(void)
>  	dmi_id = dmi_first_match(fwbug_list);
>  	if (dmi_id)
>  		tp_features.quirks = dmi_id->driver_data;
> +	tp_features.has_keyboard_attached_on_screen =
> +		dmi_check_system(keyboard_attached_on_screen_list);
> 
>  	/* Device initialization */
>  	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, 
> PLATFORM_DEVID_NONE,
> -- 
> 2.43.0

Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
