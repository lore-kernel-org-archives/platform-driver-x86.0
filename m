Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96267361663;
	Mon, 16 Mar 2026 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667352; cv=none; b=uBL18+T5tXu6IzEjmp5l5p7DN5MQCC3JC7Zem3vmwSpb+xbUEZLjcvYxPANgv+jSzuU0E8SjVvdFsgxQDBzSDzggCB9fbcrtpHGOjO6ULwsbl4Mmdr6etvuSfKCmPciND8zeJZsPvtGhCTfsrnV+j5UG4Mmw071lRAPenLoLrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667352; c=relaxed/simple;
	bh=G/E7WQfez6xZ3SV9ChqtM7y6TLjXb2DKhtVGapDM0bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iniOt/0u1+ArvmoLBwO++tmhG5IBiKAnSIHateoEXdDOIr6gL0bduYVgZYsBl52mpqBrK99+LhII1gevoo3q71hIzv/hiWUAgtG7dsrKrlIa0MarqNTfBMk9GgFrOk8MVNFGxUeOuHTSFgL82yMA84Nkbz6jvM1xvgAe6pcf6Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZxPvylx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZxPvylx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880D9C19421;
	Mon, 16 Mar 2026 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773667352;
	bh=G/E7WQfez6xZ3SV9ChqtM7y6TLjXb2DKhtVGapDM0bk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZxPvylxI6XMZL+TyY4i32NHM+ZfOMgRYtO5YcVRrRCXalpoX3QfvvLGlYVbwXUtR
	 9s6mq6KrrRVnoBLfjgybq/JXyh9okTw6PX9pD7eE3CAIqAn7wIKeza9Q7RIIvKzvXI
	 /8kLJx3MZQGH/P/XCuYhy+UmAeHhZaWO/8QxD+zUduwajZoPrSiHr7HdVrybtyTwxF
	 mLnqqsme8riRi4Znfrn8pHjwPckQK0ysIa/afIMP/zi6OsyE7EPsjG7/nh9BTbXmSz
	 Dh0hyEJ4+1NGX0rprfoL5/9XXu1KRCmmPrQXhoOb0uUkRD3GvnOLxQ15f7Blglw9xk
	 NkdfvD8TPsXyw==
Message-ID: <d04bf5e8-b02a-44c7-bc04-0d74c1208bde@kernel.org>
Date: Mon, 16 Mar 2026 14:22:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
To: Pit Henrich <pithenrich2d@googlemail.com>, hmh@hmh.eng.br
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 ilpo.jarvinen@linux.intel.com, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 pithenrich2d@gmail.com
References: <20260314142236.74514-1-pithenrich2d@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260314142236.74514-1-pithenrich2d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Mar-26 3:22 PM, Pit Henrich wrote:
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

I'm wondering about the userspace API for this. When you say: "the keyboard is
magnetically attached (on the screen)" do you mean that the keyboard is
attached in a way that you can type on it, like e.g. a microsoft surface tablet
keyboard, or is it attached to the back of the screen for storage purposes?

Can you also type on the keyboard when it is not attached (bluetooth kbd); or
does the keyboard only work when attached to the tablet?

Ok, looking for more info on the Fold 16 gen 1, I assume attached to the
screen means clamped on the screen so that the setup looks like a regular
clamshell laptop.

And I assume the keyboard always works. So this indeed is a special unique
case and adding a new sysfs attribute for this is probably the best
we can do ...

Regards,

Hans




> 
> Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 92 ++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
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
> + * On the ThinkPad X1 Fold 16 Gen 1, EC register 0xc1 reports the keyboard
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
>  /* sysfs wakeup reason (pollable) -------------------------------------- */
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
> @@ -3046,6 +3113,9 @@ static umode_t hotkey_attr_is_visible(struct kobject *kobj,
>  	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
>  		if (!tp_features.hotkey_tablet)
>  			return 0;
> +	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
> +		if (!tp_features.has_keyboard_attached_on_screen)
> +			return 0;
>  	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
>  		if (!tp_features.hotkey_wlsw)
>  			return 0;
> @@ -3462,6 +3532,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	}
>  
>  	tabletsw_state = hotkey_init_tablet_mode();
> +	keyboard_attached_on_screen_update();
>  
>  	/* Set up key map */
>  	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
> @@ -3842,6 +3913,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
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
> @@ -4296,6 +4371,17 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>  	{}
>  };
>  
> +static const struct dmi_system_id keyboard_attached_on_screen_list[] __initconst = {
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
> @@ -12230,6 +12316,8 @@ static int __init thinkpad_acpi_module_init(void)
>  	dmi_id = dmi_first_match(fwbug_list);
>  	if (dmi_id)
>  		tp_features.quirks = dmi_id->driver_data;
> +	tp_features.has_keyboard_attached_on_screen =
> +		dmi_check_system(keyboard_attached_on_screen_list);
>  
>  	/* Device initialization */
>  	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,

