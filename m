Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F2C3DB651
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 02:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093087; cv=none; b=TGc9ZhW5ycF1tl4CtLJMo4xb/AUCbFeOPKvUh5X2JmEK6OpKNPiyWFXVrTxAWyMb3AYD/KCY5XoZIpD3iZLKNCfiAKugM8t/w711uMXFYpnqDvtFpsmUgkL38u/4vM/0s88u3dik4KRVHPUAO/uLs9HYsMOFwvboskAIKAUfukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093087; c=relaxed/simple;
	bh=C1AOTlXRXq77lXY7otRCpW2MWLL5JN0mSy5ETgmnptc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z68ArxdgmT3iymofhxTihun/zM/HQR162hjLtFTtzYhLUi9ohPKEN4I+Irq2we8uU30GOX00SV1h5Fzfs0BjwtRj8vOzeZRPo0//7WOaTeY5MYRxzHDIhQlLxx3nbWEbhMdzLb+8vcc+juk1cINeVaBKFIAIo3SmpRSolnXXW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N7r0nSKT; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N7r0nSKT"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C1AOTlXRXq77lXY7otRCpW2MWLL5JN0mSy5ETgmnptc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789093078; v=1; x=1789697878;
 b=N7r0nSKT08slHbdIoyZL54uDpMF4DGtDiwgzs/gxqPfbZLKFLLV8doa1OuOPcR43ZNh83hWz
 lljkMYnIHjGJuLSHiQuhYB7bYnRBiaLX2+z6F0U39lZOw0pwO7vT9QZPQd/Ur2yOaU15NgbD4jk
 CdqwA/WMlBZHrTBFD0U3juGI=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 51043b1c51d9e39b;
	Fri, 11 Sep 2026 02:17:48 +0000
X-Mizu-Trace-ID: 51043b1c51d9e39b
X-Migadu-Flow: FLOW_OUT
Message-ID: <3f3e02d7-1e72-4098-a84b-38e6557fd468@linux.dev>
Date: Fri, 11 Sep 2026 04:17:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: asus-wmi: screenpad backlight power state is never read back
 (UX5400EA)
To: hugo baigue <hugobaigue2004@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com,
 luke@ljones.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
References: <CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com>
 <d34b4d0f-2db4-47fb-bada-ef71f3ef3eff@linux.dev>
 <CAO84+xJ9aW3pj3x8e9b5biWtnNd4EyH7A4Uy7aqBR4qZMDcVvg@mail.gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAO84+xJ9aW3pj3x8e9b5biWtnNd4EyH7A4Uy7aqBR4qZMDcVvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/10/26 10:48, hugo baigue wrote:
> Hi Denis,
>
> Thanks. I tested your patch on the UX5400EA. It does fix the inversion,
> but the screenpad power state cannot be read back at all on this
> machine, and that turns out to be the reason my original report looked
> the way it did. Details and measurements below.
>
> Method: drivers/platform/x86/asus-wmi.c from v7.1.9 built as an
> out-of-tree module, unpatched and with your patch, swapped on the same
> machine. Firmware state was read independently through acpi_call on
> \_SB.ATKD.WMNB, so none of the numbers below come from the driver under
> test.

You can trust what asus_wmi_get_devstate returns.

> 1) Your patch fixes the write path. Confirmed.
>
> Unpatched v7.1.9:
>
>     echo 4 > bl_power  (BACKLIGHT_POWER_OFF)  ->  panel ON,  DSTS 0x000100a0
>     echo 0 > bl_power  (BACKLIGHT_POWER_ON)   ->  panel OFF, DSTS 0x00010000
>
> Fully inverted, reproducible. With your patch the two are the right way
> round.

So far, so good. Consistent with what the other person told me.

> 2) The power state is not readable through ASUS_WMI_DSTS_STATUS_BIT.
>
> DSTS(ASUS_WMI_DEVID_SCREENPAD_POWER) toggled four times with DEVS,
> panel state cross-checked against the DRM connector:
>
>     panel ON   DSTS = 0x000100a0   bit0 = 0   HDMI-A-2 connected
>     panel OFF  DSTS = 0x00010000   bit0 = 0   HDMI-A-2 disconnected
>
> The state is there, but in the low byte (0xa0 vs 0x00), not in
> ASUS_WMI_DSTS_STATUS_BIT. So
>
>     asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER)
>
> returns 0 whether the panel is on or off, and
> read_screenpad_backlight_power() consequently reports
> BACKLIGHT_POWER_OFF unconditionally. That is what my original report
> described as "never read back": not a missing propagation, but a read
> that queries a bit this device does not use.
>
> For reference, DSTS(ASUS_WMI_DEVID_SCREENPAD_LIGHT) reads 0x0001ffa0
> here, i.e. max 0xff and current 0xa0 under the documented brightness
> masks, which is consistent with the low byte of the POWER devstate
> being the same brightness value.

Splendid data, thank you very much. I just hope I don't need to
check the specific bit on older models and can get away with a mask.


It's so weird they use two bytes for one device... Can you make some
guess what's going on here?

> 3) Because of 2), your patch changes probe behaviour.
>
> asus_screenpad_init() does:
>
>     power = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
>     ...
>     bd->props.power = power;        /* always 0 here, see above */
>     backlight_update_status(bd);
>
> 0 is BACKLIGHT_POWER_ON, so that final backlight_update_status() now
> faithfully powers the panel on. Measured, firmware had left the panel
> off before loading the module:
>
>     unpatched v7.1.9   panel stays OFF, bl_power reads 0
>     with your patch    panel is switched ON, bl_power reads 0
>
> Before your patch the inverted branch cancelled the bad value by
> accident. Also, brightness was never read (init only reads it when
> power was set), so the panel comes up powered at brightness 0: a
> connected DRM connector showing nothing, which is roughly the state I
> reported in the first place.

Later in the mail you find the the patch to test: apply on top of the
first one.

> 4) Your new default: branch is unreachable on this machine.
>
> I expected props.power = 1 to hit it. It does not: because of 2), power
> is 0 in every case, on or off. Loading your patched module with the
> panel already on produced no pr_warn and no -EINVAL. So the warning
> will not catch this class of problem here.
>
> 5) Two suggestions, both untested by me beyond compiling.
>
> Reading the state from the low byte rather than the status bit, if you
> consider that safe across models:
>
>     - ret = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
>     - if (ret < 0)
>     - return ret;
>     - /* 1 == powered */
>     - return ret ? BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
>     + err = asus_wmi_get_devstate(asus,
> ASUS_WMI_DEVID_SCREENPAD_POWER, &retval);
>     + if (err < 0)
>     + return err;
>     + return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) ? BACKLIGHT_POWER_ON
>     +       : BACKLIGHT_POWER_OFF;
>
> I do not know whether other ScreenPad models encode it the same way, so
> this is an observation rather than a proposal. If it holds, init could
> then use read_screenpad_backlight_power() instead of the raw devstate,
> which is what the main panel already does through read_backlight_power().

Heh basically my conclusion from above. I hope I won't need to add
another per-model quirk, but if so then be it.

> Separately, update_screenpad_bl_status() ignores props.state although
> the driver sets .options = BL_CORE_SUSPENDRESUME, so BL_CORE_SUSPENDED
> and BL_CORE_FBBLANK never blank the panel. backlight_is_blank() covers
> both that and props.power, and would make the switch and its default:
> unnecessary:
>
>     static int update_screenpad_bl_status(struct backlight_device *bd)
>     {
>     int err;
>
>     if (backlight_is_blank(bd))
>     return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>
>     err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>     if (err < 0)
>     return err;
>
>     return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
>         backlight_get_brightness(bd), NULL);
>     }
>
> That builds clean here. I could not test it end to end because module
> unload oopses on this machine, which is the last point below.

I need to hear what Ilpo want to do about this but I'm open to do it if
it's deemed better.

> 6) Unrelated, but it is what stopped me testing further: rmmod oopses.
>
>     # rmmod asus_nb_wmi
>
> kills rmmod, leaves the modules loaded and the platform device half torn
> down, and needs a reboot. Reproduced on every attempt, including with
> the distributed in-tree modules only. The OE/unsigned taint below comes
> from acpi_call, which I use to read the ScreenPad state independently.
>
>     BUG: kernel NULL pointer dereference, address: 0000000000000000
>     #PF: supervisor read access in kernel mode
>     #PF: error_code(0x0000) - not-present page
>     PGD 0 P4D 0
>     Oops: Oops: 0000 [#1] SMP NOPTI
>     CPU: 0 UID: 0 PID: 18879 Comm: rmmod
>     Tainted: G           OE       7.1.9-arch1-2 #1 PREEMPT(full)
>     Hardware name: ASUSTeK COMPUTER INC. Zenbook UX5400EA_UX5400EA/UX5400EA
>     RIP: 0010:led_classdev_unregister+0x9b/0x110
>     RAX: 0000000000000000 RBX: ffff88b2c77d2380 RCX: ffff88b2ca43f200
>     RDX: 0000000000000000 RSI: 0000000000000026 RDI: ffff88b2c77d23e0
>     CR2: 0000000000000000
>     Call Trace:
>      <TASK>
>      release_nodes+0x56/0xf0
>      devres_release_all+0x9e/0x110
>      device_unbind_cleanup+0xe/0xa0
>      device_release_driver_internal+0x1c3/0x200
>      bus_remove_device+0xfe/0x200
>      device_del+0x179/0x410
>      platform_device_del+0x30/0xa0
>      platform_device_unregister+0x12/0x30
>      asus_wmi_unregister_driver+0x31/0x50 [asus_wmi]
>      __do_sys_delete_module+0x1de/0x350
>      do_syscall_64+0xaa/0x660
>
> RAX is 0 and the faulting instruction is the list check in
> led_classdev_unregister, so this looks like unregistering a led_classdev
> whose list node was never linked. Two observations, neither proven to be
> the cause:
>
> - The trace goes through devres_release_all, so it is a devm-registered
>   led_classdev. asus->kbd_led is the only one registered with
>   devm_led_classdev_register(); it is registered lazily from the
>   kbd_led_update_all() workqueue item, and asus_wmi_led_exit() destroys
>   that workqueue during remove.
>
> - Independently, asus_wmi_led_exit() calls led_classdev_unregister()
>   unconditionally on tpd_led, wlan_led, lightbar_led, micmute_led and
>   camera_led, while asus_wmi_led_init() registers each only behind a
>   condition. On this machine none of the five is registered:
>
>       $ ls /sys/class/leds | grep asus
>       $ (no output)
>
>   Guarding those five on led_cdev->dev being non-NULL did not stop the
>   oops, which is consistent with the devres path being the real one, but
>   the asymmetry looks worth fixing anyway.
>
> Happy to run whatever you want tested; the hardware is in front of me.


The temptation to cry here is real lol. I'll take a look at this tomorrow
probably.

> Tested-by: Hugo Baigue <hugobaigue2004@gmail.com>


Thank you and thank you for the valuable data!

> Hardware: ASUS ZenBook 14X OLED UX5400EA, BIOS UX5400EA.308, kernel
> 7.1.9-arch1-2.


From 4e3dd920fb000e866f15401d503736195d1522d4 Mon Sep 17 00:00:00 2001
From: Denis Benato <denis.benato@linux.dev>
Date: Fri, 11 Sep 2026 01:51:50 +0000
Subject: [PATCH 2/2] asus-wmi: fix screenpad power state detection

It has been reported that on certain models ASUS_WMI_DEVID_SCREENPAD_LIGHT
behaves organizes the bits as ASUS_WMI_DEVID_BRIGHTNESS does, therefore
account for that in the screenpad power detection function and reuse that
function on the screenpad init to make the code shorter and easier to read.

Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
Suggested-by: Hugo Baigue <hugobaigue2004@gmail.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2c14e62d3d98..7d6426691df1 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4486,13 +4486,19 @@ static int is_display_toggle(int code)
 
 static int read_screenpad_backlight_power(struct asus_wmi *asus)
 {
-       int ret;
+       int ret, retval;
 
-       ret = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
+       ret = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_POWER, &retval);
        if (ret < 0)
                return ret;
-       /* 1 == powered */
-       return ret ? BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
+
+       /**
+        * On certain models the LSB indicates the brightness status the
+        * same way as ASUS_WMI_DEVID_BRIGHTNESS does, while on others
+        * it's simply 1 on ASUS_WMI_DSTS_STATUS_BIT for power state.
+        */
+       return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) ?
+               BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
 }
 
 static int read_screenpad_brightness(struct backlight_device *bd)
@@ -4558,11 +4564,11 @@ static int asus_screenpad_init(struct asus_wmi *asus)
        int err, power;
        int brightness = 0;
 
-       power = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
+       power = read_screenpad_backlight_power(asus);
        if (power < 0)
                return power;
 
-       if (power) {
+       if (power == BACKLIGHT_POWER_ON) {
                err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
                if (err < 0)
                        return err;
-- 
2.47.3


> Le mer. 9 sept. 2026 à 21:28, Denis Benato <denis.benato@linux.dev> a écrit :
>>
>> On 9/9/26 21:20, hugo baigue wrote:
>>> platform/x86: asus-wmi: screenpad backlight power state is never read back
>>>
>>> Hardware: ASUS ZenBook 14X OLED UX5400EA, ScreenPad 2.0 (2160x1080 panel,
>>> exposed on HDMI-A-2), kernel 7.1.9.
>>>
>>> asus-wmi registers the `asus_screenpad` backlight device and knows both
>>> ASUS_WMI_DEVID_SCREENPAD_POWER (0x00050031) and SCREENPAD_LIGHT (0x00050032).
>>> However the power state exposed through `bl_power` neither reflects the
>>> firmware state nor allows changing it.
>>>
>>> The firmware leaves the ScreenPad panel off at boot. While it is off the DRM
>>> connector stays `disconnected`, so the panel is indistinguishable from an empty
>>> port and no userspace can use it.
>>>
>>> Observed:
>>>
>>>   step                          bl_power   firmware (DSTS 0x00050031)   HDMI-A-2
>>>   panel on                      0          0x100a0
>>>  connected
>>>   panel powered off by firmware 0          0x10000                      gone
>>>   write bl_power 0 / 1 / 0      0          0x10000                      gone
>>>   DEVS 0x00050031 = 1 via ACPI  0          0x100a0
>>>  connected
>>>
>>> Two distinct problems:
>>>
>>> 1. `bl_power` reports 0 (FB_BLANK_UNBLANK, "on") while the panel is powered
>>>    down. Nothing reads the state back from the firmware, so the attribute is
>>>    stale from the moment the firmware changes it on its own — which it does on
>>>    boot, on resume, and whenever the panel brightness is driven low.
>>>
>>> 2. Writing `bl_power` does not restore the panel. Calling the same device id
>>>    directly through acpi_call does:
>>>
>>>      echo '\_SB.ATKD.WMNB 0x0 0x53564544 b3100050001000000' > /proc/acpi/call
>>>
>>> Consequence: on this machine the ScreenPad is unusable without an out-of-tree
>>> helper, even though the driver already knows the device id needed to drive it.
>>>
>>> A related detail that may matter for the fix: on this firmware, writing a low
>>> brightness value to /sys/class/backlight/asus_screenpad/brightness (tested 0, 1,
>>> 30, 50, 100, 120, 150) makes DSTS 0x00050031 return 0 and the DRM connector
>>> disappear. Brightness and power appear to be a single firmware setting, so
>>> clamping or refusing low values may be needed alongside the state read-back.
>>>
>>> The DSDT also exposes three device ids in the same family that the driver does
>>> not use: 0x00050033 (returns a constant, likely a presence flag), 0x00050034
>>> (toggles a bit in the EC), and 0x00050035 (writes EC commands 5 and 6 on the
>>> same path as POWER).
>>>
>>> Workaround and full analysis:
>>> https://github.com/izigower/asus-screenpad-linux
>>
>> Hi,
>>
>> can you try the patch at the endo of this email please?
>>
>> I am already tracking this, but progress has been slow. In theory this is a regression,
>> and this patch solves it but I can't understand if it is solving it fully or not.
>>
>> From e9f4d0ef00c4f3e1ba26db68a688e523a743e733 Mon Sep 17 00:00:00 2001
>> From: Denis Benato <denis.benato@linux.dev>
>> Date: Wed, 5 Aug 2026 16:05:36 +0000
>> Subject: [PATCH] platform/x86: asus-wmi: fix unclear usage of bd->props.power
>> The bd->props.power is checked in parts of the driver correctly comparing with
>> BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
>> and !bd->props.power, moreover in certain checks the logic has been
>> inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
>> usage and the inconsistencies by using proper comparisons.
>> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
>> Closes: https://lore.kernel.org/all/178362762638.911488.8564892548331679884@eldamar.lan/
>> Closes: https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev/
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>> drivers/platform/x86/asus-wmi.c | 12 +++++++++---
>> 1 file changed, 9 insertions(+), 3 deletions(-)
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 8610663b8269..3600dddd8f36 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -4500,7 +4500,8 @@static int update_screenpad_bl_status(struct backlight_device *bd)
>> u32 ctrl_param = bd->props.brightness;
>> int err = 0;
>> - if (bd->props.power) {
>> + switch (bd->props.power) {
>> + case BACKLIGHT_POWER_ON:
>> err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>> if (err < 0)
>> return err;
>> @@ -4508,12 +4509,17 @@static int update_screenpad_bl_status(struct backlight_device *bd)
>> err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
>> if (err < 0)
>> return err;
>> - }
>> + break;
>> - if (!bd->props.power) {
>> + case BACKLIGHT_POWER_OFF:
>> err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>> if (err < 0)
>> return err;
>> + break;
>> +
>> + default:
>> + pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
>> + return -EINVAL;
>> }
>> return err;
>> --
>> 2.47.3
