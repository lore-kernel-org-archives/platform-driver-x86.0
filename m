From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Mon, 22 Jan 2018 11:16:32 +0100
Message-ID: <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:19617 "EHLO
        ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbeAVKQp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 05:16:45 -0500
In-Reply-To: <20180119234547.GB24590@marvin.atrad.com.au>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Hi Jonathan,

Am 20.01.2018 um 00:45 schrieb Jonathan Woithe:
> On Fri, Jan 19, 2018 at 11:40:11PM +0100, Jan-Marek Glogowski wrote:
>> I'm still pondering about the microphone mute.  Should this be handled
>> like the all the other volume buttons, which seem to work without touching
>> the fujitsu-laptop.c driver?  I have no idea how these other buttons are
>> forwarded to the sound drivers.  And I'm still wondering about the ECO
>> button, which is still handled via FUNC 0x1002, which was previously just
>> used for extra HW buttons.
> 
> Regarding the volume buttons, as you have observed fujitsu-laptop hasn't
> ever had to deal with them before.  On the Fujitsu hardware I have access to
> the volume and mute buttons are handled through the standard ACPI subsystem:
> fujitsu-laptop doesn't play any part.  The ACPI actions generated are
> "volumeup", "volumedown" and "mute".  These can be bound to userspace mixer
> tools to effect the desired outcome.
> 
> Does your new hardware emit keycodes for the volume buttons (which would
> presumedly be picked up by ACPI)?  If so it's a bit odd that they'd include
> this functionality and yet leave the mute out of it.  Still, if that's what
> they've done then that's what we have to work with.

It does. Normal volume keys are handled by the keyboard driver, so probably some userspace program handles this.

> I guess the question is whether it is necessary to add the mute handling to
> fujitsu-laptop, or whether a more appropriate change is to allow APCI to
> handle it natively.  That in turn comes down to what the hardware can
> actually do.

???

>> From: Jan-Marek Glogowski <glogow@fbihome.de>
>> Date: Fri, 19 Jan 2018 21:48:22 +0100
>> Subject: [PATCH] Emit some more button events
>>
>> Seems Fujitsu continues to move HW functionality into software.
>> These are my observations from the U727.
>>
>> Fn+F1 is now a button to mute the microphone.
>> Fn+F5 is now the rfkill button.
>> Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
>> 0x0) returned 0x40000413
> 
> For reference, on the S7020 F1 and F5 have no "Fn" function while F9 is
> "volume up.  There is no ambiguity regarding F1 and F5 at least with this
> hardware so this patch shouldn't create conflict there.  If the newly moved
> ECO function were to be hooked it would probably need to be done dependent
> on model.
> 
>> So in addition to the still working KEY_TOUCHPAD_TOGGLE, we now
>> have to emit KEY_RFKILL for BIT(5) and KEY_MICMUTE for BIT(29).
>>
>> Emitting the KEY_RFKILL will also correctly toggle the
>> corresponding led.
>> ---
>>  fujitsu-laptop.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/fujitsu-laptop.c b/fujitsu-laptop.c
>> index e31ecfa..f784e89 100644
>> --- a/fujitsu-laptop.c
>> +++ b/fujitsu-laptop.c
>> @@ -462,6 +462,8 @@ static const struct key_entry keymap_default[] = {
>>         { KE_KEY, KEY4_CODE, { KEY_PROG4 } },
>>         { KE_KEY, KEY5_CODE, { KEY_RFKILL } },
>>         { KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
>> +       { KE_KEY, BIT(5),    { KEY_RFKILL } },
>> +       { KE_KEY, BIT(29),   { KEY_MICMUTE } },
>>         { KE_END, 0 }
>>  };
>>
>> @@ -915,7 +917,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
>>  static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>>  {
>>         struct fujitsu_laptop *priv = acpi_driver_data(device);
>> -       int scancode, i = 0;
>> +       int scancode, i = 0, funcret;
>>         unsigned int irb;
>>
>>         if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
>> @@ -949,9 +951,15 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
>>          * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
>>          * handled in software; its state is queried using FUNC_FLAGS
>>          */
>> -       if ((priv->flags_supported & BIT(26)) &&
>> -           (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
>> -               sparse_keymap_report_event(priv->input, BIT(26), 1, true);
>> +       if (priv->flags_supported & (BIT(26) | BIT(5) | BIT(29))) {
>> +               funcret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
>> +               if (funcret & BIT(29))
>> +                       sparse_keymap_report_event(priv->input, BIT(29), 1, true);
>> +               else if (funcret & BIT(26))
>> +                       sparse_keymap_report_event(priv->input, BIT(26), 1, true);
>> +               else if (funcret & BIT(5))
>> +                       sparse_keymap_report_event(priv->input, BIT(5), 1, true);
>> +       }
>>  }
> 
> This looks reaonable to me.  However, I'm wondering whether the "else if"
> construct is the right thing to use here.  If it were possible for the
> hardware to flag more than one of these buttons at once then "funcret"
> will obviously have more than one of the bits set.  The code above would
> only report the key corresponding to the highest set bit.

I'll change that.

> Previously we only had to handle a single key so we have no prior experience
> to draw on.

So I've continued playing with the HW:

# libinput debug-events 
-event6   DEVICE_ADDED     Fujitsu FUJ02E3                   seat0 default group1  cap:k
-event3   DEVICE_ADDED     Video Bus                         seat0 default group2  cap:k
-event0   DEVICE_ADDED     Power Button                      seat0 default group3  cap:k
-event1   DEVICE_ADDED     Lid Switch                        seat0 default group4  cap:S
-event4   DEVICE_ADDED     Generic USB Audio                 seat0 default group5  cap:kp scroll-nat
-event13  DEVICE_ADDED     FJ Camera: FJ Camera              seat0 default group6  cap:k
-event7   DEVICE_ADDED     HDA Intel PCH Headphone           seat0 default group7  cap:
-event8   DEVICE_ADDED     HDA Intel PCH HDMI/DP,pcm=3       seat0 default group7  cap:
-event9   DEVICE_ADDED     HDA Intel PCH HDMI/DP,pcm=7       seat0 default group7  cap:
-event10  DEVICE_ADDED     HDA Intel PCH HDMI/DP,pcm=8       seat0 default group7  cap:
-event11  DEVICE_ADDED     HDA Intel PCH HDMI/DP,pcm=9       seat0 default group7  cap:
-event12  DEVICE_ADDED     HDA Intel PCH HDMI/DP,pcm=10      seat0 default group7  cap:
-event2   DEVICE_ADDED     AT Translated Set 2 keyboard      seat0 default group8  cap:k
-event5   DEVICE_ADDED     ETPS/2 Elantech Touchpad          seat0 default group9  cap:pg  size 94x43mm tap(dl off) left scroll-nat scroll-2fg-edge dwt-on
-event6   KEYBOARD_KEY      +6.84s      KEY_MICMUTE (248) pressed
 event6   KEYBOARD_KEY      +6.84s      KEY_MICMUTE (248) released
-event2   KEYBOARD_KEY      +8.05s      KEY_MUTE (113) pressed
 event2   KEYBOARD_KEY      +8.22s      KEY_MUTE (113) released
 event2   KEYBOARD_KEY      +8.94s      KEY_VOLUMEDOWN (114) pressed
 event2   KEYBOARD_KEY      +9.09s      KEY_VOLUMEDOWN (114) released
 event2   KEYBOARD_KEY      +9.91s      KEY_VOLUMEUP (115) pressed
 event2   KEYBOARD_KEY     +10.06s      KEY_VOLUMEUP (115) released
-event6   KEYBOARD_KEY     +10.91s      KEY_RFKILL (247) pressed
 event6   KEYBOARD_KEY     +10.91s      KEY_RFKILL (247) released
 event6   KEYBOARD_KEY     +12.97s      KEY_TOUCHPAD_TOGGLE (530) pressed
 event6   KEYBOARD_KEY     +12.97s      KEY_TOUCHPAD_TOGGLE (530) released
-event3   KEYBOARD_KEY     +14.04s      KEY_BRIGHTNESSDOWN (224) pressed
 event3   KEYBOARD_KEY     +14.04s      KEY_BRIGHTNESSDOWN (224) released
 event3   KEYBOARD_KEY     +17.41s      KEY_BRIGHTNESSUP (225) pressed
 event3   KEYBOARD_KEY     +17.41s      KEY_BRIGHTNESSUP (225) released
-event6   KEYBOARD_KEY     +18.31s      KEY_PROG4 (203) pressed
-event2   KEYBOARD_KEY     +21.58s      KEY_LEFTMETA (125) pressed
 event2   KEYBOARD_KEY     +21.61s      *** (-1) pressed
 event2   KEYBOARD_KEY     +21.64s      *** (-1) released
 event2   KEYBOARD_KEY     +21.68s      KEY_LEFTMETA (125) released

These are Fn+F1 - Fn+F10

The last event2 is the "Switch output" button.

The main remaining problem is the missing release event for the ECO / KEY_PROG4.
Like all buttons the ACPI events are generated on release.
When releasing the button it, this results in:

[Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x4, 0x0, 0x0) returned 0x320
[Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: Flags state     0x00000320
[Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x40000413
[Mo Jan 22 08:37:09 2018] input input21: Push scancode into ringbuffer [0x413]
[Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x0
[Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x1, 0x0, 0x0) returned 0x0

I don't know yet how to distinguish between a separate ECO button and the Fn button here.
Have to recheck with the old HW to see, if some support flags are different now. The button is definitely not in the BTNI mask:

[Mo Jan 22 08:29:02 2018] input: Fujitsu FUJ02E3 as /devices/LNXSYSTM:00/LNXSYBUS:00/FUJ02E3:00/input/input21
[Mo Jan 22 08:29:02 2018] fujitsu_laptop: ACPI: Fujitsu FUJ02E3 [FEXT]
[Mo Jan 22 08:29:02 2018] ACPI: \_SB_.FEXT: Flags supported 0x26020320
[Mo Jan 22 08:29:02 2018] ACPI: \_SB_.FEXT: BTNI: [0x10001]

Then there is the "radios" attribute, which is currently inverted for me. It contains "killed", if the radio is on and "on", if it's killed.

And pressing the brightness-up or -down buttons doesn't change the backlight in KDE5.
Guess I'm facing the "Xorg modeset = no backlight" problem everyone has (since 2016-06): https://bugs.freedesktop.org/show_bug.cgi?id=96572

> Regards
Jan-Marek
