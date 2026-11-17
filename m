Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877758;
	b=ETRAoGf0BqqsNaELVGvx5Ds/xU5ovZGPre/ivLDKQ02aKKXmQSd4aHC86cFZrBmRguic
	 GJhduuMN4uZaujE42LL+loWz57Hv7Syqy0ZZ9y8ea6Xim90WkJnsf+Dac+G/gW0dV8iUI
	 Kaa08rE5zedJeTdrBMwv/dKin5GKHnoC5ITJpALAAVlf1uYLaubHJbxdVHNoKB4J+X3jj
	 EMrT0G8LUSIHMSQ4xmleLUV4CMtkR1lf6h1w6f/v59gXkJWTLARVOw1d/E0yC1MzLAbba
	 JOEjBaxAaQXxFguhb0TW4GfmXfBBjguLL1U3nhOFTDo3Ubn56tjNBqEPdY1YzCIxh+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877758;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gtUAPqHMHP5k3gFwPO62jRFf/1Gqj9gZb2L6gognAgk=;
	b=fAPEAoXBBhkqbBVhp453naXvqkoj+boLOLT29RvSEFRJtNlr0K1mRPUCrjCbJaf7yPiI
	 qbPx498cKt9VuJz/b7BDN389OMm28rtBiyS2MBs0q6V9U2ux3YF2pc75RrRshHsJqnfVq
	 GGY0aM+mjI1CQduq6G08n0mTCosnd6HMkdNUrSXTtdE+KMJuyF/wwcO6b+BKXrxPmVdW6
	 jkuPmw3PAX1Fqja2/9nvvl2tNGaesJWVxNx3uTDv2crKb0Fs5rh5fcROzzHwrrUvLCoyB
	 aYE/RprZ7WhT2QjYOnevOQXGL99ucV0xRMDhhy/abRw/jmqTyPnBNSv/VqGgAftkdEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qV+XYkCh;
	arc=none smtp.remote-ip=95.215.58.231
Received: from mta1.migadu.com (out-231.mta1.migadu.com [95.215.58.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAACA606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 01:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAACA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qV+XYkCh
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MPpTPh88Nfy9eiOTO3i85nb/65Af7N8qg4f4W7GlzF4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794877754; v=1; x=1795482554;
 b=qV+XYkChdr/jD7V5Xau7Om9IjxWVYcrHgYF++3iiUg9W9R7e4dyBWtFDuEusPasxFg/FH6NG
 sJ7AyZAhjstiH3oNYUmfcAk/8lQIHSjpR3rOdCSEvM8yCsJyYcvUJxPKHUlK7azylIjgXWDLMHX
 AhBJ52/Mo6YRXcZSKnYvp764=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ac75ed4a77224e6a;
	Tue, 17 Nov 2026 01:09:14 +0000
X-Mizu-Trace-ID: ac75ed4a77224e6a
X-Migadu-Flow: FLOW_OUT
Message-ID: <a35a487b-7932-41f7-bbd5-0d0fad2035c4@linux.dev>
Date: Tue, 17 Nov 2026 02:09:13 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook
 S14
To: Rong Zhang <i@rong.moe>, skyedryv <skyedryv@gmail.com>, git@turtledev.nz,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Jos=C3=A9_Guilherme_de_Castro_Rodrigues?=
 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
 <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
 <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/16/26 13:48, Rong Zhang wrote:
> Hi All,
>
> On Wed, 2026-10-21 at 20:34 +0800, Rong Zhang wrote:
>> Hi Zane, José,
>>
>> Hopefully I am not too late to show up here.

Hi all,

I have been watching this silently for a while and I think I have a general
understanding of the problem...

>> Regarding the title, you are not fixing a bug of the driver, but adding
>> support for ASUS_WMI_DEVID_CAMERA_LED_NEG.
>>
>> On Mon, 2026-10-19 at 19:35 +1300, Zane Hunt via B4 Relay wrote:
>>> From: Zane Hunt <git@turtledev.nz>
>>>
>>> On some newer Zenbooks (Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) the
>>> camera key turns the camera off in firmware, but the LED on the key never
>>> lights up under Linux. These machines don't have
>>> ASUS_WMI_DEVID_CAMERA_LED, so asus-wmi never registers asus::camera. The
>>> firmware exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG instead.
>>>
>>> Reading CAMERA_LED_NEG is what drives the LED: the DSTS handler reads the
>>> camera state from the EC and writes it to the LED GPIO before returning
>>> it. The set side can't be used, the firmware only accepts DEVS on this
>>> device once per boot.
>>>
>>> When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
>>> asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read it
>>> after every camera key event, sending a brightness_hw_changed event.
>>> Registering the LED reads it as well, which fixes the LED being dark after
>>> a cold boot with the camera disabled.
>> I agree with José that the current ignore-anything-but-resync behavior
>> has a weird semantics, especially considering that writing to the
>> attribute has a side-effect that updates led_cdev->brightness
>> unconditionally [1].
>>
>> Unfortunately, errors from an LED driver never reach userspace through
>> brightness_store(). Also, not every code path of the LED core prints set
>> errors to kmsg. This is also the default behavior of the LED core when
>> neither brightness_set() nor brightness_set_blocking() is implemented.
>> Thus, returning an error here really doesn't make much sense here.
>>
>> If we really want to ensure the brightness and trigger attributes are
>> read-only to userspace, consult LED_SYSFS_DISABLE and do not implement
>> brightness_set[_blocking]() at all, but do we?
>>
>> [1]: While the cached brightness never reaches userspace because of the
>> presence of brightness_get(), it's still... very weird.
>>
>>> While at it, include <linux/container_of.h>, which this file already
>>> relied on.
>>>
>>> Link: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221752
>>> Assisted-by: Claude:claude-opus-5-5 iasl
>>> Co-developed-by: José Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
>>> Signed-off-by: José Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
>>> Signed-off-by: Zane Hunt <git@turtledev.nz>
>>> ---
>>> Changes in v4:
>>> - Keep José's Signed-off-by from v2 and add his Co-developed-by
>>> - Use my full name in the tags
>>> - Include <linux/container_of.h>
>>> - Reuse the existing asus::camera registration block, only the
>>>   handlers and flags differ
>>> - camera_neg_led_available is now only set when CAMERA_LED is missing,
>>>   so asus::camera is always the CAMERA_LED_NEG one when it's set. That
>>>   makes the LED_BRIGHT_HW_CHANGED check in the event handler unneeded,
>>>   so it's gone
>>> - Drop the explicit read at probe, led_classdev_register() already
>>>   reads the state through brightness_get
>>> - Link to v3: https://patch.msgid.link/20261017-asus-wmi-camera-led-v3-1-845a82373997@turtledev.nz
>>>
>>> Changes in v3 (picking up José's v2, which had stalled):
>>> - Rebased on pdx86 for-next
>>> - Also read CAMERA_LED_NEG at probe, so the LED is right after a cold boot
>>> - Register a read-only asus::camera LED when only CAMERA_LED_NEG exists,
>>>   with brightness_hw_changed on key presses (Ilpo's suggestion on v2)
>>> - Comment on why the read is what updates the LED (also from v2 review)
>>> - v2: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
>>>
>>> Tested again on the Zenbook S 14 UX5406SA (BIOS 309), on Fedora's 7.2.9
>>> kernel with the same change applied: camera key presses keep the LED,
>>> asus::camera and the camera output in sync, and with the camera disabled
>>> and the LED forced off, loading the driver turns the LED back on.
>>>
>>> I used Claude while working on this. It helped
>>> me read through the DSDT, drafted the changes on top of v2 and wrote the
>>> test scripts. I went through the patch myself and ran the tests on my
>>> laptop.
>>> ---
>>>  drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++++++++--
>>>  include/linux/platform_data/x86/asus-wmi.h |  2 +-
>>>  2 files changed, 73 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>> index fb1d4a0..93b51c8 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -17,6 +17,7 @@
>>>  #include <linux/backlight.h>
>>>  #include <linux/bits.h>
>>>  #include <linux/cleanup.h>
>>> +#include <linux/container_of.h>
>>>  #include <linux/debugfs.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/dmi.h>
>>> @@ -72,6 +73,8 @@ module_param(fnlock_default, bool, 0444);
>>>  #define NOTIFY_KBD_TTP			0xae
>>>  #define NOTIFY_LID_FLIP			0xfa
>>>  #define NOTIFY_LID_FLIP_ROG		0xbd
>>> +#define NOTIFY_CAMERA_TOGGLE_1		0x82
>>> +#define NOTIFY_CAMERA_TOGGLE_2		0x85
>>>  #define NOTIFY_KEYSTONE			0xb4
>>>  
>>>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>>> @@ -312,6 +315,7 @@ struct asus_wmi {
>>>  	u32 kbd_rgb_dev;
>>>  	bool kbd_rgb_state_available;
>>>  	bool oobe_state_available;
>>> +	bool camera_neg_led_available;
>>>  
>>>  	u8 throttle_thermal_policy_mode;
>>>  	u32 throttle_thermal_policy_dev;
>>> @@ -2096,6 +2100,54 @@ static int camera_led_set(struct led_classdev *led_cdev,
>>>  	return err < 0 ? err : 0;
>>>  }
>>>  
>>> +static bool is_camera_toggle(int code)
>>> +{
>>> +	return code == NOTIFY_CAMERA_TOGGLE_1 || code == NOTIFY_CAMERA_TOGGLE_2;
>>> +}
>>> +
>>> +/*
>>> + * Some models (e.g. Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) have no
>>> + * ASUS_WMI_DEVID_CAMERA_LED. The firmware handles the camera key itself and
>>> + * only exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG, and reading
>>> + * that has a side effect: the firmware copies the state to the LED GPIO.
>>> + * Nothing else updates the LED, so read it after every camera key event.
>>> + * Registering asus::camera reads it too (via brightness_get), which sets the
>>> + * LED at probe. Setting it is no use, the firmware accepts DEVS on this
>>> + * device only once per boot.
>>> + *
>>> + * Returns 1 if the camera is disabled (LED lit), 0 if enabled, or -errno.
>>> + */
>>> +static int camera_neg_led_sync(struct asus_wmi *asus)
>>> +{
>>> +	u32 result;
>>> +	int err;
>>> +
>>> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, &result);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	return !(result & ASUS_WMI_DSTS_STATUS_BIT);
>>> +}
>>> +
>>> +static enum led_brightness camera_neg_led_get(struct led_classdev *led_cdev)
>>> +{
>>> +	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, camera_led);
>>> +	int state = camera_neg_led_sync(asus);
>>> +
>>> +	return state < 0 ? LED_OFF : state;
>>> +}
>>> +
>>> +/* The firmware owns this LED; a write just resyncs it with the camera state. */
>>> +static int camera_neg_led_set(struct led_classdev *led_cdev,
>>> +			      enum led_brightness brightness)
>>> +{
>>> +	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, camera_led);
>>> +
>>> +	if (!(led_cdev->flags & LED_UNREGISTERING))
>>> +		camera_neg_led_sync(asus);
>>> +	return 0;
>>> +}
>> I agree with José that this should be unnecessary considering that
>> asus_wmi_handle_event_code() has handled the event.
>>
>> Still, could you confirm whether pressing the camera key during s2idle
>> toggles the camera state without emitting a WMI event or not? If so, a
>> resync should be performed on resume.
> skyedryv tested this on their device, see
> https://msgid.link/CA+Bqb3R2ZCrZZr6pUqLmw3qXMSA13Ft3nYqCx7jv+5PDEuH0uw@mail.gmail.com
>
> According to the result, camera_neg_led_set() should be completely
> useless. I'd prefer to remove it.
>
> We don't need to set LED_SYSFS_DISABLE either. There has been a lot of
> get-only LED drivers, none of them sets it.
>
> As for my proposal...

I agree here.

I would throw an idea, perhaps not the best one but I want to hear what you think:
what if you setup a kthread that periodically sync the device?

>> If there is really a need to preserve the manual resync functionality,
>> it'd be better to use custom LED attributes to achieve sensible
>> semantics, see led_cdev->groups.
>>
>>> +
>>>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>>>  {
>>>  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
>>> @@ -2227,11 +2279,18 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>>  			goto error;
>>>  	}
>>>  
>>> -	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
>>> +	if (asus->camera_neg_led_available ||
>>> +	    asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
>>>  		asus->camera_led.name = "asus::camera";
>>>  		asus->camera_led.max_brightness = 1;
>>> -		asus->camera_led.brightness_get = camera_led_get;
>>> -		asus->camera_led.brightness_set_blocking = camera_led_set;
>>> +		if (asus->camera_neg_led_available) {
>>> +			asus->camera_led.flags = LED_BRIGHT_HW_CHANGED;
>>> +			asus->camera_led.brightness_get = camera_neg_led_get;
>>> +			asus->camera_led.brightness_set_blocking = camera_neg_led_set;
>>> +		} else {
>>> +			asus->camera_led.brightness_get = camera_led_get;
>>> +			asus->camera_led.brightness_set_blocking = camera_led_set;
>>> +		}
>>>  
>>>  		rv = led_classdev_register(&asus->platform_device->dev,
>>>  						&asus->camera_led);
>>> @@ -4733,6 +4792,13 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>>  	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
>>>  		return;
>>>  
>>> +	if (is_camera_toggle(code) && asus->camera_neg_led_available) {
>>> +		int state = camera_neg_led_sync(asus);
>>> +
>>> +		if (state >= 0)
>>> +			led_classdev_notify_brightness_hw_changed(&asus->camera_led, state);
>>> +	}
>>> +
>>>  	if (!sparse_keymap_report_event(asus->inputdev, code,
>>>  					key_value, autorelease))
>>>  		pr_info("Unknown key code 0x%x\n", code);
>>> @@ -5210,6 +5276,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>>>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>>>  
>>>  	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
>>> +	asus->camera_neg_led_available =
>>> +		!asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) &&
>>> +		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);
>> When a device has both ASUS_WMI_DEVID_CAMERA_LED and
>> ASUS_WMI_DEVID_CAMERA_LED_NEG implemented, camera_neg_led_available is
>> false and the LED device can't benefit from brightness_hw_changed.

Does such device even exists? Can it exists?

>> It'd be better to decouple the brightness_hw_changed path from
>> !ASUS_WMI_DEVID_CAMERA_LED, since devices with both IDs should be able to
>> emit the WMI event.
>>
>> With that, how about adding a wrapper function that dispatches call to
>> either asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED) or
>> asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED_NEG) according to the
>> IDs' presence? Then you can share the same brightness_hw_changed path by
>> calling the wrapper function and eliminate the need of adding a dedicated
>> brightness_get() callback in the same manner.

I'm not understanding this: first the discussion moves toward "what if one
device has both" and then you ask about reusing the code for the non-neg
dev id.... What am I missing here?

>> IOW, the presence of ASUS_WMI_DEVID_CAMERA_LED determines the
>> availability of brightness_set_blocking(), and
>> ASUS_WMI_DEVID_CAMERA_LED_NEG determines brightness_hw_changed. The
>> brightness_get() callback is the same thanks to the wrapper function.
> ...it can be implemented in a follow-up series if you don't want to make
> the next revision too complicated.
>
> As long as camera_neg_led_set() is gone, I will be OK with the patch.

Pretty much the same, but if you find evidence that windows is polling
that devid I think we should be doing the same.

Anyway thank you all for taking care of this :)

Sorry for my delay, I will try to be more present now that I have some
context.

Best regards,
Denis

> Thanks,
> Rong
>
>> Thanks,
>> Rong
>>
>>>  
>>>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
>>>  		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index 4ea1ccc..5964063 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -57,7 +57,7 @@
>>>  #define ASUS_WMI_DEVID_MUTE_LED	0x0004001C
>>>  
>>>  /* Disable Camera LED */
>>> -#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on (unused) */
>>> +#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on */
>>>  #define ASUS_WMI_DEVID_CAMERA_LED	0x00060079 /* 1 = on */
>>>  
>>>  /* Backlight and Brightness */
>>>
>>> ---
>>> base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
>>> change-id: 20261017-asus-wmi-camera-led-06a6e05f01e2
>>>
>>> Best regards,
>>> --  
>>> Zane Hunt <git@turtledev.nz>
>>>
