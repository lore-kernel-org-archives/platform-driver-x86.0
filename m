Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE723DB302;
	Tue,  9 Jun 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994954; cv=none; b=iPiZOAYNt3hvgmEZVCBDKYNCnLhdKGE/H7fjbT2W4AWrJJF/4Ocp/JmU7zrlExRDH2TUv+GODHp+ssKOfeUY2WFH/eZuYzhV8qFChT/AQqunHkRgao598asyxnDo8YA7xvSeCb8Ks0SPYjdpDsXsNUNEBQdPNxzlrkEQqcovVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994954; c=relaxed/simple;
	bh=cN3ofdglNZDsNQ3ZROafUMGWAoDoWQeL2gbWa4ZmYZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1BVi9lRJoxyDvSlUSAfku4sL/mBiA4xRqkejmP6n2XEvhHfFdW0CL1qY1IzXLfotZu4cbdU5hQd/RpL6QJy7OSvhjFCCrRCsIkLodfIAQHGL0LmzZ1o6ItOqyUx2/JwuFGM+wrrRWy/maIA7NHfiY8nXRjZlzA/tobPKk8DdFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/fHj81r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/fHj81r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4491F00893;
	Tue,  9 Jun 2026 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994953;
	bh=w7aqdPe4Yps5aIYcq2q/Vt/NpjbBhhkYSQqEWrIdDvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=l/fHj81raT28aByM1nwQcp4+yW78fIpFOjrSfL0XcFnvYZuYPyUsHVEZLisQHrfr4
	 ERUr2brGjZiAng7+GDS3ScCAL+aToJHrN1w6amASfEuFHvmTzrow+3BkNmHFMyaCGh
	 CFcD4anewGg1zAkV3wCn7hfrgwhh9Uk4td7s9W6LGjl7qNVBHpjjlIIw0OY1v2xDOz
	 pN5alIsBBgy9czSpzJyEEgiyHPM9Frh+EhiYrbJYM+/iXR/49VIlJ3kpDx5MuLWalF
	 n/EawPKMTX5Hxl5c3Ae5zvdPy8Qz2zGvL5nT5H9F2l0AxjM+HFh1qRZ47MH5bX27xP
	 j862l39Z+5Wqg==
Message-ID: <57dd1c8a-5699-4ab7-8818-f27e04a841b1@kernel.org>
Date: Tue, 9 Jun 2026 10:49:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Pit Henrich <pithenrich2d@googlemail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, pithenrich2d@gmail.com
References: <20260419102724.91451-1-pithenrich2d@gmail.com>
 <1fc62844-2cc9-49b8-8ee0-081d2c4a984f@app.fastmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1fc62844-2cc9-49b8-8ee0-081d2c4a984f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Jun-26 03:19, Mark Pearson wrote:
> Hi Pit,
> 
> On Sun, Apr 19, 2026, at 6:27 AM, Pit Henrich wrote:
>> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
>> attached (on the screen), but thinkpad-acpi does not expose this to userspace.
>> The state can be obtained via ACPI methods: GDST (get device state).
>>
>> Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
>> a DMI match. The state is read directly from the EC.
>>
>> Cache the state and emit a sysfs notification on
>> TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
>> hotkey setup and refresh it before the resume notification to keep the state
>> consistent across suspend and resume.
>>
>> Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
>> ---
>> This replaced the v1 patch in:
>> https://lore.kernel.org/all/20260314142236.74514-1-pithenrich2d@gmail.com/
>>
>> Changes v1 -> v2:
>>  * Use ACPI method instead of using the EC directly (thanks Mark).
>>
>> ---
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 85 ++++++++++++++++++++-
>>  1 file changed, 83 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index 8982d92dfd97..b57ae7eb5548 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -218,8 +218,9 @@ enum tpacpi_hkey_event_t {
>>  	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
>>  	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
>>  	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
>> -	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
>> -						   * enter/leave tablet mode
>> +	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* posture change event:
>> +						   * X1 Yoga (2016): enter/leave tablet mode
>> +						   * X1 Fold 16 Gen 1: keyboard attachment state changed
>>  						   */
>>  	TP_HKEY_EV_PEN_INSERTED		= 0x500b, /* tablet pen inserted */
>>  	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
>> @@ -375,6 +376,7 @@ static struct {
>>  	u32 has_adaptive_kbd:1;
>>  	u32 kbd_lang:1;
>>  	u32 trackpoint_doubletap:1;
>> +	u32 has_keyboard_attached_on_screen:1;
>>  	struct quirk_entry *quirks;
>>  } tp_features;
>>
>> @@ -2928,6 +2930,63 @@ static void hotkey_tablet_mode_notify_change(void)
>>  			     "hotkey_tablet_mode");
>>  }
>>
>> +static bool keyboard_attached_on_screen;
>> +static bool keyboard_attached_on_screen_initialized;
>> +
>> +static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
>> +{
>> +	int state;
>> +
>> +	if (!tp_features.has_keyboard_attached_on_screen)
>> +		return -ENODEV;
>> +
>> +	if (!acpi_evalf(NULL, &state, "\\_SB.DEVD.GDST", "d"))
>> +		return -EIO;
> 
> I wondered if this should be adding a devd_handle in the same way as hkey_handle etc? (up at the top of the file using define TPACPI_HANDLE
> 
> Then you would have
>     if (!acpi_evalf(devd_handle, &state, "GDST", "d"))
> 
> Not sure if this is needed or not - hopefully one of the experts on the mailing list knows.


I don't think using a cached ACPI handle for the parent node
of the method is necessary in this case.

Using the cached handles is mostly an optimization for
handles which are used a lot.

Regards,

Hans




> 
>> +
>> +	*attached = state != 0;
>> +	return 0;
>> +}
>> +
>> +static ssize_t keyboard_attached_on_screen_show(struct device *dev,
>> +						struct device_attribute *attr,
>> +						char *buf)
>> +{
>> +	bool attached;
>> +	int res;
>> +
>> +	res = x1_fold_keyboard_attached_on_screen_get(&attached);
>> +	if (res)
>> +		return res;
>> +
>> +	return sysfs_emit(buf, "%d\n", attached);
>> +}
>> +
>> +static DEVICE_ATTR_RO(keyboard_attached_on_screen);
>> +
>> +static void keyboard_attached_on_screen_notify_change(void)
>> +{
>> +	if (tp_features.has_keyboard_attached_on_screen)
>> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
>> +			     "keyboard_attached_on_screen");
>> +}
>> +
>> +static bool keyboard_attached_on_screen_update(void)
>> +{
>> +	bool attached;
>> +
>> +	if (x1_fold_keyboard_attached_on_screen_get(&attached))
>> +		return false;
>> +
>> +	if (keyboard_attached_on_screen_initialized &&
>> +	    keyboard_attached_on_screen == attached)
>> +		return false;
>> +
>> +	keyboard_attached_on_screen = attached;
>> +	keyboard_attached_on_screen_initialized = true;
>> +
>> +	return true;
>> +}
>> +
>>  /* sysfs wakeup reason (pollable) 
>> -------------------------------------- */
>>  static ssize_t hotkey_wakeup_reason_show(struct device *dev,
>>  			   struct device_attribute *attr,
>> @@ -3032,6 +3091,7 @@ static struct attribute *hotkey_attributes[] = {
>>  	&dev_attr_hotkey_adaptive_all_mask.attr,
>>  	&dev_attr_hotkey_recommended_mask.attr,
>>  	&dev_attr_hotkey_tablet_mode.attr,
>> +	&dev_attr_keyboard_attached_on_screen.attr,
>>  	&dev_attr_hotkey_radio_sw.attr,
>>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>>  	&dev_attr_hotkey_source_mask.attr,
>> @@ -3046,6 +3106,9 @@ static umode_t hotkey_attr_is_visible(struct 
>> kobject *kobj,
>>  	if (attr == &dev_attr_hotkey_tablet_mode.attr) {
>>  		if (!tp_features.hotkey_tablet)
>>  			return 0;
>> +	} else if (attr == &dev_attr_keyboard_attached_on_screen.attr) {
>> +		if (!tp_features.has_keyboard_attached_on_screen)
>> +			return 0;
>>  	} else if (attr == &dev_attr_hotkey_radio_sw.attr) {
>>  		if (!tp_features.hotkey_wlsw)
>>  			return 0;
>> @@ -3462,6 +3525,7 @@ static int __init hotkey_init(struct 
>> ibm_init_struct *iibm)
>>  	}
>>
>>  	tabletsw_state = hotkey_init_tablet_mode();
>> +	keyboard_attached_on_screen_update();
>>
>>  	/* Set up key map */
>>  	keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
>> @@ -3842,6 +3906,8 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
>> bool *send_acpi_ev)
>>  	case TP_HKEY_EV_TABLET_CHANGED:
>>  		tpacpi_input_send_tabletsw();
>>  		hotkey_tablet_mode_notify_change();
>> +		if (keyboard_attached_on_screen_update())
>> +			keyboard_attached_on_screen_notify_change();
>>  		*send_acpi_ev = false;
>>  		return true;
>>
>> @@ -3998,6 +4064,8 @@ static void hotkey_resume(void)
>>  	tpacpi_send_radiosw_update();
>>  	tpacpi_input_send_tabletsw();
>>  	hotkey_tablet_mode_notify_change();
>> +	keyboard_attached_on_screen_update();
>> +	keyboard_attached_on_screen_notify_change();
>>  	hotkey_wakeup_reason_notify_change();
>>  	hotkey_wakeup_hotunplug_complete_notify_change();
>>  	hotkey_poll_setup_safe(false);
>> @@ -4296,6 +4364,17 @@ static const struct dmi_system_id fwbug_list[] 
>> __initconst = {
>>  	{}
>>  };
>>
>> +static const struct dmi_system_id keyboard_attached_on_screen_list[] 
>> __initconst = {
>> +	{
>> +		.ident = "ThinkPad X1 Fold 16 Gen 1",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 16 Gen 1"),
>> +		},
> 
> Should there also be a matches for the X1 Fold Gen 1 (13" model)?
> 
> I think doing the DMI match on the product family is OK, but just a note that everywhere else uses the board ID. e.g: DMI_MATCH(DMI_BOARD_NAME, "21ES")
> I think this way works too, but it's different and I haven't had confirmation from the FW team if it could be different across different SKUs (I'll see if I can find out).
> 
> If you do want to use board names:
>  - X1 Fold 16 G1 has "21ES' and "21ET"
>  - X1 Fold G1 has "20RK" and "20RL"
> 
>> +	},
>> +	{}
>> +};
>> +
>>  static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
>>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
>> @@ -12230,6 +12309,8 @@ static int __init 
>> thinkpad_acpi_module_init(void)
>>  	dmi_id = dmi_first_match(fwbug_list);
>>  	if (dmi_id)
>>  		tp_features.quirks = dmi_id->driver_data;
>> +	tp_features.has_keyboard_attached_on_screen =
>> +		dmi_check_system(keyboard_attached_on_screen_list);
>>
>>  	/* Device initialization */
>>  	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, 
>> PLATFORM_DEVID_NONE,
>> -- 
>> 2.43.0
> 
> Thanks
> Mark

