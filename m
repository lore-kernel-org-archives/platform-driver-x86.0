Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69AD17557E;
	Tue,  9 Jun 2026 01:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968019; cv=none; b=eEqkXjsC4649oiApfu0D9POZN1J4VVE01imry59HzLh5Zp3tTH/4IATDWlbT8B0h5rlGMCbVQ/USyqPSc5PVE1u5YlxJLaZbAjJnp6VmOVqvGtjfYElObkyFhIttO8T6zsm/FAoimbSNki/9u4jeMNmQX95dWhwq/1uxupyltU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968019; c=relaxed/simple;
	bh=GS72MBcR3AYAdiDF53SCAv81WI1XkRlBbf9iWhFMw6M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mjmfW4jD+WATs14DRV4nu5U8Tp+gbVzOKwDlTlGNXtZSTiXM2WBR+CRm+A+YlUAnYY4cl8rY/aSv2qOnTgSbhckJPQkQJ/b3GksVkEx2QidnorBgjoJUcaVtDs8J8sDX3bZGDjvk+M1WP5ne53OmuI7VsMVMfByElTrBKoKhLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=lfZHMqh3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ofh9m9ap; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="lfZHMqh3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ofh9m9ap"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E50A8EC0107;
	Mon,  8 Jun 2026 21:20:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 08 Jun 2026 21:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780968016;
	 x=1781054416; bh=DBespgZVH3ZBSAyCq4eoPkLWvSWf9d1UZZCYSCFAxS4=; b=
	lfZHMqh3bua5tBplpdTeVkyMbMVmc4GYMfYU9XBlXfWkTLjLUIV8r92UiYFrkemL
	pmVljecTTLlti/P6GNXfY+DcOxnrFqwJ3MygbiyznTw72FyLX6wgUhDW1LiMaMIA
	+cVUUNzBIqc+y0RP3FBZf9ilRgmtYx1IFzcO7je+ei/Qw3+Vvzz55b1+nVWNCWdd
	6Kon6/YE469BW/Qqu+eKNp8okrPUuGN8BkZxiy7Eo6KtSMQHP1hzNKsc8LjbU5n7
	gMXeMH0nhrlmpIoLabrKtOIE38NBykM1ytgfSc0e+TOKMx4bhwewqWEMgyaibIna
	lrBD0mHm0QTlDyiqVIMWew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780968016; x=
	1781054416; bh=DBespgZVH3ZBSAyCq4eoPkLWvSWf9d1UZZCYSCFAxS4=; b=O
	fh9m9ap2QJTqbflpISaUnQYlLmStmYZz7mQryyiCsyNRcEma3kNIDYwV9PoeGCsy
	TIggqNHnYEGtQdD4TFU/ozsGz1qKY+56eWHRWiujrBAxY8CeDQjWG4GIFMYHUYUz
	YphxYAu1f0ngWl+CBmJuuLutTrXULT7fk94sBlqu11n/ZumNeYBrthZu0po/0fQ9
	q9izmVwvyApSBox7IvjEom+dHlsEYQhvq0S/OzXF6pySDMkUoHCFeEbwu2UAS/vJ
	r1lOpWWWb5o+KjlXSJuM/1WxPUjgMI08a1UtiOtsBsYCLbcotBSn6smXUnBLvbdR
	/zYqPB77+utVS8ntkwX+Q==
X-ME-Sender: <xms:UGonaol82C83nBQbJQBegkOoF6weJC3fEV4PutjLkPBvo_d4JdDc3A>
    <xme:UGonairw6lZc-9ajRglFG34TFOvnY3DNLZCyIMFt_mdWB30HwW0fLvCataT_lK_60
    TPM_5kk8I3bDIvRCtZ0A5QTgjaN_dtpGRiqoHdUIrIGIBA2KX_lg-H2>
X-ME-Proxy-Cause: dmFkZTE453eypNeIQ7i5QPeHHcXX6ixQeJKcsGQFbNeAi0PW2fblQSgURTmQ8mJNdAWtfe
    I3PoB/7jDkduNcTALEXc9KYJ9TN1h6hAG0oB+q6CR+twmDbLo4vtsucotV2JPzFxYjaMUm
    Cebc/watc/dKQsLxJbjCKW8L/ijbMYu//Bkty1VCv0uUw31kWpTazUxdvHGMgmV8C/JHy6
    ua4HAefINBf4NGabbnv+k6sTX/oUUb4NmQn36F9v+430rOUBLDl9MZmXvY9vhBVH7kcHWi
    MKAbdvH61ADn9zLCfF12vmaRJK9MrAtqXGmszi9Mi3Kq1k0KW7XfJSevtUaevsXY61SxZN
    0TQEB2fUYaVRZGTrNhRArpvlArGNcWA2bi35cnWMd1cFRSM1XD+69x21beMvGKvLRHnyxq
    SUQWVkpeTD2PbzGyG/mlaQIsD+gOSUl5v1G4/tDjxSZIQBjFBzyaFv1ISstMxoaPI+WRND
    D5t/vyv7UGKGdyVKS+7OZ6wNqL13weiOU2k+Xt3S4U6wUjlGVebG5ZgxSvI17jn8n7gy3K
    oqKjwJX0MX5pvaUNA3N2K8jPQo+51HqIvthErTZ9ceC5azpDNgmOfduVbKTYonMHA9w9RD
    EW3jTAIITA5Nw/MaMBWoKvMJl73ptT1MzfkZ1sT9J1sOC/BOSTeolU9iZ9Kg
X-ME-Proxy: <xmx:UGonaoy-0zu_cXhaTmfxBtQLYuwzb1kKpszEjaye9Xgs3ok64sEOuw>
    <xmx:UGonaiRhbKA2XK2VMRU-2JBnvEJRGF-l7tHc0e3ehCeKKBBtXcNrgQ>
    <xmx:UGonalIdXAavg6RATXwhC4RHaDFlSl7FmEFKKAsr_Z4yTuwByAsr-A>
    <xmx:UGonapU4ml1o9bAmv6G8bq9lzOLSKARAyNWdEftz6dQdKg_z4v5jGw>
    <xmx:UGonanMkasoBxMQLbbQYiEyMxOXjdqrMJGwBl6UIFn4Uidc3bcxikfbp>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B63A2CE1D5B; Mon,  8 Jun 2026 21:20:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AAQWCgp0QglJ
Date: Mon, 08 Jun 2026 21:19:55 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Pit Henrich" <pithenrich2d@googlemail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, pithenrich2d@gmail.com
Message-Id: <1fc62844-2cc9-49b8-8ee0-081d2c4a984f@app.fastmail.com>
In-Reply-To: <20260419102724.91451-1-pithenrich2d@gmail.com>
References: <20260419102724.91451-1-pithenrich2d@gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment
 detection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Pit,

On Sun, Apr 19, 2026, at 6:27 AM, Pit Henrich wrote:
> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
> attached (on the screen), but thinkpad-acpi does not expose this to userspace.
> The state can be obtained via ACPI methods: GDST (get device state).
>
> Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
> a DMI match. The state is read directly from the EC.
>
> Cache the state and emit a sysfs notification on
> TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
> hotkey setup and refresh it before the resume notification to keep the state
> consistent across suspend and resume.
>
> Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
> ---
> This replaced the v1 patch in:
> https://lore.kernel.org/all/20260314142236.74514-1-pithenrich2d@gmail.com/
>
> Changes v1 -> v2:
>  * Use ACPI method instead of using the EC directly (thanks Mark).
>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 85 ++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 8982d92dfd97..b57ae7eb5548 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -218,8 +218,9 @@ enum tpacpi_hkey_event_t {
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
> @@ -375,6 +376,7 @@ static struct {
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap:1;
> +	u32 has_keyboard_attached_on_screen:1;
>  	struct quirk_entry *quirks;
>  } tp_features;
> 
> @@ -2928,6 +2930,63 @@ static void hotkey_tablet_mode_notify_change(void)
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

I wondered if this should be adding a devd_handle in the same way as hkey_handle etc? (up at the top of the file using define TPACPI_HANDLE

Then you would have
    if (!acpi_evalf(devd_handle, &state, "GDST", "d"))

Not sure if this is needed or not - hopefully one of the experts on the mailing list knows.

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
> @@ -3032,6 +3091,7 @@ static struct attribute *hotkey_attributes[] = {
>  	&dev_attr_hotkey_adaptive_all_mask.attr,
>  	&dev_attr_hotkey_recommended_mask.attr,
>  	&dev_attr_hotkey_tablet_mode.attr,
> +	&dev_attr_keyboard_attached_on_screen.attr,
>  	&dev_attr_hotkey_radio_sw.attr,
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>  	&dev_attr_hotkey_source_mask.attr,
> @@ -3046,6 +3106,9 @@ static umode_t hotkey_attr_is_visible(struct 
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
> @@ -3462,6 +3525,7 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  	}
> 
>  	tabletsw_state = hotkey_init_tablet_mode();
> +	keyboard_attached_on_screen_update();
> 
>  	/* Set up key map */
>  	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
> @@ -3842,6 +3906,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
> bool *send_acpi_ev)
>  	case TP_HKEY_EV_TABLET_CHANGED:
>  		tpacpi_input_send_tabletsw();
>  		hotkey_tablet_mode_notify_change();
> +		if (keyboard_attached_on_screen_update())
> +			keyboard_attached_on_screen_notify_change();
>  		*send_acpi_ev = false;
>  		return true;
> 
> @@ -3998,6 +4064,8 @@ static void hotkey_resume(void)
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();
>  	hotkey_tablet_mode_notify_change();
> +	keyboard_attached_on_screen_update();
> +	keyboard_attached_on_screen_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
>  	hotkey_poll_setup_safe(false);
> @@ -4296,6 +4364,17 @@ static const struct dmi_system_id fwbug_list[] 
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

Should there also be a matches for the X1 Fold Gen 1 (13" model)?

I think doing the DMI match on the product family is OK, but just a note that everywhere else uses the board ID. e.g: DMI_MATCH(DMI_BOARD_NAME, "21ES")
I think this way works too, but it's different and I haven't had confirmation from the FW team if it could be different across different SKUs (I'll see if I can find out).

If you do want to use board names:
 - X1 Fold 16 G1 has "21ES' and "21ET"
 - X1 Fold G1 has "20RK" and "20RL"

> +	},
> +	{}
> +};
> +
>  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
> @@ -12230,6 +12309,8 @@ static int __init 
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

Thanks
Mark
