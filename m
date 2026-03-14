Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2D8336885;
	Sat, 14 Mar 2026 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512702; cv=none; b=oaK1pPXSxKIqRTS6vKwgupBQ2Y/D2W36fuqGD8rc1S9KJ7//yD8o5XKTrpT0uGMPuKSBFEX3lebEyWlRkhmhnmMsTHD/osiH/nOkp9xgQvPQ6wx8QuNPk0rILZLm5ivYwNb7m4ACQaB/DJEUb4lVB3/pvkQJqcYmk4f299yMgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512702; c=relaxed/simple;
	bh=uIk/hsWYvqLG8VfQAAb/f/WYPko9v6/sFY0hMgO9yJY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vFeGoeTPrjKrGooKiZHysXkjM7j9YXsQZWWLaCaHIO/aP2SOMAcbkDPwzjkbFzpetdV9SJgzoiCB3ZzeQ3Qm2cv2lpDTeWR8dlqswIh5qNMMaQJAxp4zRod9zlT5NHhdpNCM0QYjhD3RD8NWjv9+gYx+5hdmaAoJO2mclo0ClFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=HwmUHUa/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ay39SnED; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="HwmUHUa/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ay39SnED"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 25C27EC0B49;
	Sat, 14 Mar 2026 14:24:59 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 14 Mar 2026 14:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1773512699;
	 x=1773599099; bh=uJcw/ORlbZ/GB/kovtAC5hYAfeWQWHdCStzUenjNczs=; b=
	HwmUHUa/m/amIdONgGLN/lEUPrktkc5/vo7VUM/T0xvWsvkLuoQ684M5vbnJrSf+
	1fKgkbo262pwxW1H17iGMuZ22HvLLGzQKPfwkMxdNXzDsAt+kORlQslDyjR1OBNN
	A8keDPiX5jTUILFt0qDntE/jKR++xUVMo0kmonkk9MfTN12uDySOS5tKIhbDPnMF
	GeZvD2cWCKC0xbtx561y4yw/aHSSBWyZSRS6ZHz8MNtnL3k2XkFWo0thcZ/2msQF
	4yH8dLWFMS6v1I1FkzVsf4vQkUQBv6Qofb2vmA6XaB8Y+UL2A4sM0/zgqo9DeThM
	oewSvEibBcoHkIoWEk8FKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773512699; x=
	1773599099; bh=uJcw/ORlbZ/GB/kovtAC5hYAfeWQWHdCStzUenjNczs=; b=A
	y39SnEDLDCKSoucZ93rbH9nAAX742KPwQqnOj+WFIo02NMPccd857opQywzhY8HX
	YMKkQC3Yd6GzkhtCPQ9jspERh1+oHdAC+LvlhK5Rlne2PL/X9cY+l7wN1yVbpKNn
	Kds+aWXPHAwCkvFWoNwU2hhuwnWyZdjumZEP2YB5XjozB0GPflO+UT7yMom4UOn6
	RRROTjBYWcq3ZGi7tuEQdWW5fzXBiXTblcx2QKx3NUxDg1V4ZLxcZTOxYphrGil4
	+2XpU+nx7kHznq6qQgAPCofnTcAf5T1IWfxnS7j8M6Tu9o8zjNogvZit7nYrUrHE
	RmSvDI1cSfGUXIJgwoF7Q==
X-ME-Sender: <xms:-ae1aaMte8oAg9P8fvLLZna0CSvjLdIU2WPCux7a7uGsr9TZkZk5BQ>
    <xme:-ae1aTy0RSmDc2L5qeWRZPVppl1C84IHgqls3BPsTq8tWtkTG12veb-Y8SL3-EqsC
    VWI_kmbIpsJninKcr0v6kD0fBwMkdhbH5PYhBLkp5O-MCvSQKBD5ko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefgjeetgeevvddtleffkeevkedugfegudejhefftefg
    gfegleefvdffteehfeeiueenucffohhmrghinheplhgvnhhovhhordgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepledpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehpihhthhgvnhhrihgthhdvugesghhmrghilhdrtghomh
    dprhgtphhtthhopehpihhthhgvnhhrihgthhdvugesghhoohhglhgvmhgrihhlrdgtohhm
    pdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghpthhtohephhgrnhhsgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlh
    eslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrth
    hfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-ae1aTYgquRi4Li1-2OOYIpNGmbPEJxBVd4uiiTKf3MpfLuGQchudQ>
    <xmx:-ae1aYayKpSui4PLhKb-2xnVDhZa3HxVgs1RFX-v2N2DRkKNoHnwKA>
    <xmx:-ae1aQzQ2s1ZIdi6jQVq5x8r8e1NGBr-MY2r_werY6RecKZP6LkPwA>
    <xmx:-ae1acdtlzK5NR5wNj0dEp6aBZ6g2Bw5h-0fKf_E99ctaRV4GgOE3w>
    <xmx:-6e1aW_WmPDOHdhHz9uVOA6tF9mfU0qWhXzRFRB4MzgRAupPLsG7uW1o>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 00B652CE0072; Sat, 14 Mar 2026 14:24:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXcetOvEVYjc
Date: Sat, 14 Mar 2026 14:24:35 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Pit Henrich" <pithenrich2d@googlemail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, pithenrich2d@gmail.com
Message-Id: <0b0f6ef9-ae3a-4642-85af-fbdf7ebafd1e@app.fastmail.com>
In-Reply-To: <20260314142236.74514-1-pithenrich2d@gmail.com>
References: <20260314142236.74514-1-pithenrich2d@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment
 detection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Pit,

On Sat, Mar 14, 2026, at 10:22 AM, Pit Henrich wrote:
> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
> attached (on the screen) via EC register 0xc1 bit 7, but thinkpad-acpi does
> not expose this to userspace.
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
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 92 ++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 8982d92dfd97..5b255062ff51 100644
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
> @@ -2928,6 +2930,70 @@ static void hotkey_tablet_mode_notify_change(void)
>  			     "hotkey_tablet_mode");
>  }
> 
> +/*
> + * On the ThinkPad X1 Fold 16 Gen 1, EC register 0xc1 reports the 
> keyboard
> + * attachment state in bit 7.
> + */
> +#define TPACPI_X1_FOLD_KBD_EC_STATUS	0xc1
> +#define TPACPI_X1_FOLD_KBD_ATTACHED	BIT(7)
> +
> +static bool keyboard_attached_on_screen;
> +static bool keyboard_attached_on_screen_initialized;
> +
> +static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
> +{
> +	u8 status;
> +
> +	if (!tp_features.has_keyboard_attached_on_screen)
> +		return -ENODEV;
> +
> +	if (!acpi_ec_read(TPACPI_X1_FOLD_KBD_EC_STATUS, &status))
> +		return -EIO;
> +
> +	*attached = status & TPACPI_X1_FOLD_KBD_ATTACHED;
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
> @@ -3032,6 +3098,7 @@ static struct attribute *hotkey_attributes[] = {
>  	&dev_attr_hotkey_adaptive_all_mask.attr,
>  	&dev_attr_hotkey_recommended_mask.attr,
>  	&dev_attr_hotkey_tablet_mode.attr,
> +	&dev_attr_keyboard_attached_on_screen.attr,
>  	&dev_attr_hotkey_radio_sw.attr,
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>  	&dev_attr_hotkey_source_mask.attr,
> @@ -3046,6 +3113,9 @@ static umode_t hotkey_attr_is_visible(struct 
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
> @@ -3462,6 +3532,7 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  	}
> 
>  	tabletsw_state = hotkey_init_tablet_mode();
> +	keyboard_attached_on_screen_update();
> 
>  	/* Set up key map */
>  	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
> @@ -3842,6 +3913,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
> bool *send_acpi_ev)
>  	case TP_HKEY_EV_TABLET_CHANGED:
>  		tpacpi_input_send_tabletsw();
>  		hotkey_tablet_mode_notify_change();
> +		if (keyboard_attached_on_screen_update())
> +			keyboard_attached_on_screen_notify_change();
>  		*send_acpi_ev = false;
>  		return true;
> 
> @@ -3998,6 +4071,8 @@ static void hotkey_resume(void)
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();
>  	hotkey_tablet_mode_notify_change();
> +	keyboard_attached_on_screen_update();
> +	keyboard_attached_on_screen_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
>  	hotkey_poll_setup_safe(false);
> @@ -4296,6 +4371,17 @@ static const struct dmi_system_id fwbug_list[] 
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
> @@ -12230,6 +12316,8 @@ static int __init 
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

I'm checking to see if we have the EC spec for this platform (it's not in our Linux certification program).

The code looks fine but some notes:
 - We usually do the DMI_MATCH on the BOARD_NAME for quirks. I was checking psref.lenovo.com and there seem to be two distinct models for this platform, which is a bit confusing. I don't have a way to confirm that your changes will work for the other model so wondering if it's safer to do the quirks for 21ES/21ET or 20RL/20RK depending on what you have in hand? (I might be overthinking this too)
 - I would have called it detachable_keyboard instead of keyboard_attached_on_screen. See what other reviewers think.

If I get details back on the EC spec and confirmation it's correct I'll let you know :)

Mark

