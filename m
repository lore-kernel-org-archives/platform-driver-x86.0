Received: from mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B644F476CF0
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350074; cv=none; b=PnXCJit7d4Cf+eV1yG8azT2tCStypeOxDVn5WP/z5Ci4KiezoNsre2fARW8l2wk2sefhtCRWIROgru1AqRXY+2qzKC2yBwW3DWQrhNt7tTlXN03HU2qQF9iVtJgW4Gxw6l1PdWyoa/slh2KbPdywe1lOQNuFqoRwhI90URzjLnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350074; c=relaxed/simple;
	bh=aQYGC2wvAvGiMyomsHHwCWz//Ge7ZRLzGnThPXs7Oqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+L4M5wZ6ICb/qE7i/qxidsBei2kDBJwkdR/k4QDF7vgrBJSLdY703UnGWcpW4kwfd8nDN3TaR+ZYZrIMYE/kfOyb0QtpC+CxArxViWZZkEoJji425xH1Y2NFBL84ZBnU1pX+fWBl341LflXuexonN3lKsVTPIXiu9w3b9wW0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zf+n0EJ5; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zf+n0EJ5"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aQYGC2wvAvGiMyomsHHwCWz//Ge7ZRLzGnThPXs7Oqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788350053; v=1; x=1788954853;
 b=Zf+n0EJ5V6m3x1JihKJwQNG4oUU6SnoXcosU6zy0/MoqOTpNxLPVq5dv3OjEPcmRbU8hY2qT
 xCRfziNELbygx3GU1oYdvznqKgA9ruERqiClQokAYRh6SLpLicAOpMlkV25FvyAtn5e3jh1sTnR
 MyJx/pJU0BNIJ7uv3Q7LbDog=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec51bc7ccc9a418b;
	Wed, 02 Sep 2026 11:54:13 +0000
X-Mizu-Trace-ID: ec51bc7ccc9a418b
X-Migadu-Flow: FLOW_OUT
Message-ID: <a6bff161-0d6c-467e-99a8-2062f123a6f8@linux.dev>
Date: Wed, 2 Sep 2026 13:54:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix FA401 series keyboard
 sleep strobe
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260902032353.16106-1-idotohors@gmail.com>
 <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/2/26 11:42, Ilpo Järvinen wrote:
> On Wed, 2 Sep 2026, Idotoho Reimon Simanjuntak wrote:
>
>> The FA401 series accepts the TUF keyboard RGB power-state command but does
>> not advertise the device through the normal DSTS presence probe. Register
>> the state attributes for this series and re-assert keyboard brightness in
>> the PM prepare callback so the EC enters S0ix with the correct state.
>>
>> Without the brightness re-assertion, the display server blanks the keyboard
>> before the kernel suspend path runs, leaving the EC with brightness=0 and
>> preventing the sleep strobe from activating. Because kbd_led_wk may already
>> be zeroed by the display server at prepare time, always re-assert level 3
>> (max) brightness when sleep backlight is enabled.
>>
>> Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather than
>> ad-hoc dmi_match() calls. Cache power-state flags from sysfs writes and
>> initialize the cache to the default enabled state during probe, so the
>> workaround also applies before userspace writes the attribute. Do not add
>> a module parameter; the sysfs power-state setting is authoritative.
>> Use the standard dev_pm_ops .prepare callback rather than overloading the
>> Ally-specific LPS0 ops. Define self-documenting macros for the TUF RGB
>> state bitfields at file scope.
>>
>> Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
>> ---
>> Changes in v2:
>>  - Cache RGB power state flags from sysfs writes instead of attempting DSTS read.
>>  - Initialize state flags to enable all modes during driver probe.
>>  - Move TUF_RGB_STATE_* bitfield macros to file scope.
>>  - Drop module parameter in favor of DMI quirk + sysfs control.
>>  drivers/platform/x86/asus-nb-wmi.c | 14 +++++++
>>  drivers/platform/x86/asus-wmi.c    | 61 +++++++++++++++++++++++++++++-
>>  drivers/platform/x86/asus-wmi.h    |  1 +
>>  3 files changed, 75 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index aeb461b16..fb06013ca 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 = {
>>  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
>>  };
>>  
>> +static struct quirk_entry quirk_asus_fa401 = {
>> +	.wapf = 0,
>> +	.kbd_rgb_state_quirk = true,
>> +};
>> +
>>  static int dmi_matched(const struct dmi_system_id *dmi)
>>  {
>>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
>> @@ -163,6 +168,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
>>  }
>>  
>>  static const struct dmi_system_id asus_quirks[] = {
>> +	{
>> +		.callback = dmi_matched,
>> +		.ident = "ASUSTeK COMPUTER INC. FA401",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_BOARD_NAME, "FA401"),
>> +		},
>> +		.driver_data = &quirk_asus_fa401,
>> +	},
>>  	{
>>  		.callback = dmi_matched,
>>  		.ident = "ASUSTeK COMPUTER INC. Q500A",
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index a65090429..a0b678272 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -129,6 +129,18 @@ module_param(fnlock_default, bool, 0444);
>>  #define ASUS_SCREENPAD_BRIGHT_MAX 255
>>  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>>  
>> +/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE) */
>> +#define TUF_RGB_STATE_CMD		0xbd
>> +#define TUF_RGB_STATE_SAVE		BIT(8)
>> +#define TUF_RGB_STATE_BOOT		(0x03 << 16)
>> +#define TUF_RGB_STATE_AWAKE		(0x0c << 16)
>> +#define TUF_RGB_STATE_SLEEP		(0x30 << 16)
>> +#define TUF_RGB_STATE_KEYBOARD		(0xc0 << 16)
>> +#define TUF_RGB_STATE_ALL_MODES		(TUF_RGB_STATE_BOOT | \
>> +					 TUF_RGB_STATE_AWAKE | \
>> +					 TUF_RGB_STATE_SLEEP | \
>> +					 TUF_RGB_STATE_KEYBOARD)
>> +
>>  #define ASUS_MINI_LED_MODE_MASK		0x03
>>  /* Standard modes for devices with only on/off */
>>  #define ASUS_MINI_LED_OFF		0x00
>> @@ -308,6 +320,8 @@ struct asus_wmi {
>>  	u32 nv_temp_target;
>>  
>>  	u32 kbd_rgb_dev;
>> +	u32 kbd_rgb_state_flags;
>> +	bool kbd_rgb_state_valid;
>>  	bool kbd_rgb_state_available;
>>  	bool oobe_state_available;
>>  
>> @@ -1120,8 +1134,13 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
>>  				 const char *buf, size_t count)
>>  {
>>  	u32 flags, cmd, boot, awake, sleep, keyboard;
>> +	struct led_classdev *led;
>> +	struct asus_wmi *asus;
>>  	int err;
>>  
>> +	led = dev_get_drvdata(dev);
>> +	asus = container_of(led, struct asus_wmi, kbd_led);
>> +
>>  	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
>>  		return -EINVAL;
>>  
>> @@ -1138,6 +1157,9 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
>>  	if (keyboard)
>>  		flags |= BIT(7);
>>  
>> +	asus->kbd_rgb_state_flags = flags << 16;
>> +	asus->kbd_rgb_state_valid = true;
>> +
>>  	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
>>  	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
>>  			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
> Interesting, is this using TUF_RGB_STATE_CMD as literal? Perhaps you 
> should expand this into a patch series and make that conversion in 
> preparatory patch.
>
>> @@ -5153,7 +5175,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>>  
>>  	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>> -	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
>>  
>>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>>  		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
>> @@ -5166,6 +5187,19 @@ static int asus_wmi_add(struct platform_device *pdev)
>>  		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
>>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>>  
>> +	/*
>> +	 * FA401 series accepts the TUF RGB-state DEVS command but does not
>> +	 * advertise the device through DSTS. Keep the normal DSTS probe for
>> +	 * other models and force registration when the quirk is set.
>> +	 */
>> +	asus->kbd_rgb_state_available =
>> +		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
>> +		asus->driver->quirks->kbd_rgb_state_quirk;
>> +	if (asus->driver->quirks->kbd_rgb_state_quirk) {
>> +		asus->kbd_rgb_state_flags = TUF_RGB_STATE_ALL_MODES;
>> +		asus->kbd_rgb_state_valid = true;
>> +	}
>> +
>>  	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
>>  
>>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
>> @@ -5396,11 +5430,36 @@ static int asus_hotk_restore(struct device *device)
>>  
>>  static int asus_hotk_prepare(struct device *device)
>>  {
>> +	struct asus_wmi *asus = dev_get_drvdata(device);
>> +
>>  	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
>>  		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
>>  					   ASUS_USB0_PWR_EC0_CSEE_OFF);
>>  		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
>>  	}
>> +
>> +	/*
>> +	 * The display server may blank the keyboard backlight before the
>> +	 * kernel suspend path runs. Re-assert brightness and power-state
>> +	 * flags so the EC enters S0ix with the correct state. Always use
>> +	 * level 3 (max) because kbd_led_wk may already be zeroed by the
>> +	 * display server at this point, and the sleep strobe requires a
>> +	 * non-zero brightness to activate.
>> +	 */
>> +	if (asus && asus->driver->quirks->kbd_rgb_state_quirk &&
>> +	    asus->kbd_rgb_state_available && asus->kbd_rgb_state_valid &&
>> +	    (asus->kbd_rgb_state_flags & TUF_RGB_STATE_SLEEP)) {
>> +		u8 brightness = 0x80 | 0x03; /* level 3 (max) + light-on bit */
>> +
>> +		asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
>> +				      brightness, NULL);
>> +		asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
>> +					  ASUS_WMI_DEVID_TUF_RGB_STATE,
>> +					  TUF_RGB_STATE_CMD | TUF_RGB_STATE_SAVE |
>> +					  asus->kbd_rgb_state_flags,
> This makes things more confusing overall.
>
> One should use FIELD_PREP() consistently for bitfields where a shift is 
> needed but here you write a pre-shifted value. In the other place, this 
> driver shifts (which should be converted to FIELD_PREP()) while making the 
> evaluate call.
Hi Idotoho!

I tried to change the ASUS TUF interface for leds moving it to asus-armoury once,
I dropped it in the end, but I got these defines and bitfields right: you can reuse
my code code if you want, just leave the interface in asus-wmi.

Also about this restore the backlight setting before entering sleep: do we really
want the kernel to decide to override a userspace decision to shine some leds
in s2idle? My understanding is that if this is a userspace "missing feature"
(the ability to configure what happens to LEDs upon entering s2idle) it is the
userspace that has to be improved, not for the kernel to force a decision.

Best regards,
Denis
>> +					  0, NULL);
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
>> index 5cd4392b9..69d224774 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -52,6 +52,7 @@ struct quirk_entry {
>>  	 */
>>  	int no_display_toggle;
>>  	u32 xusb2pr;
>> +	bool kbd_rgb_state_quirk;
>>  };
>>  
>>  struct asus_wmi_driver {
>>
