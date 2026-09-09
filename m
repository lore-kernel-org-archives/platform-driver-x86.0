Received: from mta0.migadu.com (out-121.mta0.migadu.com [91.218.175.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BA81D5146
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982137; cv=none; b=FRWK4E+PDRuglfc1AqRwdmwPF2nfwLl8vEC8AkSQ6eI89tPNUttb6ooyvFavglfMSIV/pTFFdMoZ48FLbeCCphbW6XUeyqpO78Qfr7nlXmFFzoXvico41RzyPKNygItMtnlgQjt9RvMOA0IVO/Te79RDKvrCmWEFVOJnkMWYfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982137; c=relaxed/simple;
	bh=IUSJp1TaXzmvEdBM8CM11hp9tdq67L/uxcrv3iRZbIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N3MHX5wmTFTCGsREHlQ4pPN3ufS0uMjKdL6eqlJ3zQ2kXh1odEkhskeZn2W/NZfnolBddU9/Dn/XIGVjEuedwBKWNe5iAIF5mgp/xcU2L4ovZCy+d0ypPkninWbOBcp6/VB0r/z5N+xmYQmT5mvTQYfAXWoI3vP2MBGqVURwQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lP0M9i5M; arc=none smtp.client-ip=91.218.175.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lP0M9i5M"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IUSJp1TaXzmvEdBM8CM11hp9tdq67L/uxcrv3iRZbIo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788982129; v=1; x=1789586929;
 b=lP0M9i5MNWBd75krhpb9/7h+NBrgFxDEKmLC9kCNrMlRRVCiISFO1IC+tQdMCGL7giYxRZjW
 tstIJy0ezKyHCz3CJjRyIp+K19am4j6SVfkhSpkW1ocpLcwOJWdgeOqAMQAgAjeKNcUlgAlvt/b
 BDIodT4m6DGhvoCg0lcDJSJw=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 31067135801e5d9b;
	Wed, 09 Sep 2026 19:28:49 +0000
X-Mizu-Trace-ID: 31067135801e5d9b
X-Migadu-Flow: FLOW_OUT
Message-ID: <d34b4d0f-2db4-47fb-bada-ef71f3ef3eff@linux.dev>
Date: Wed, 9 Sep 2026 21:28:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: asus-wmi: screenpad backlight power state is never read back
 (UX5400EA)
To: hugo baigue <hugobaigue2004@gmail.com>,
 platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com,
 luke@ljones.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
References: <CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/9/26 21:20, hugo baigue wrote:
> platform/x86: asus-wmi: screenpad backlight power state is never read back
>
> Hardware: ASUS ZenBook 14X OLED UX5400EA, ScreenPad 2.0 (2160x1080 panel,
> exposed on HDMI-A-2), kernel 7.1.9.
>
> asus-wmi registers the `asus_screenpad` backlight device and knows both
> ASUS_WMI_DEVID_SCREENPAD_POWER (0x00050031) and SCREENPAD_LIGHT (0x00050032).
> However the power state exposed through `bl_power` neither reflects the
> firmware state nor allows changing it.
>
> The firmware leaves the ScreenPad panel off at boot. While it is off the DRM
> connector stays `disconnected`, so the panel is indistinguishable from an empty
> port and no userspace can use it.
>
> Observed:
>
>   step                          bl_power   firmware (DSTS 0x00050031)   HDMI-A-2
>   panel on                      0          0x100a0
>  connected
>   panel powered off by firmware 0          0x10000                      gone
>   write bl_power 0 / 1 / 0      0          0x10000                      gone
>   DEVS 0x00050031 = 1 via ACPI  0          0x100a0
>  connected
>
> Two distinct problems:
>
> 1. `bl_power` reports 0 (FB_BLANK_UNBLANK, "on") while the panel is powered
>    down. Nothing reads the state back from the firmware, so the attribute is
>    stale from the moment the firmware changes it on its own — which it does on
>    boot, on resume, and whenever the panel brightness is driven low.
>
> 2. Writing `bl_power` does not restore the panel. Calling the same device id
>    directly through acpi_call does:
>
>      echo '\_SB.ATKD.WMNB 0x0 0x53564544 b3100050001000000' > /proc/acpi/call
>
> Consequence: on this machine the ScreenPad is unusable without an out-of-tree
> helper, even though the driver already knows the device id needed to drive it.
>
> A related detail that may matter for the fix: on this firmware, writing a low
> brightness value to /sys/class/backlight/asus_screenpad/brightness (tested 0, 1,
> 30, 50, 100, 120, 150) makes DSTS 0x00050031 return 0 and the DRM connector
> disappear. Brightness and power appear to be a single firmware setting, so
> clamping or refusing low values may be needed alongside the state read-back.
>
> The DSDT also exposes three device ids in the same family that the driver does
> not use: 0x00050033 (returns a constant, likely a presence flag), 0x00050034
> (toggles a bit in the EC), and 0x00050035 (writes EC commands 5 and 6 on the
> same path as POWER).
>
> Workaround and full analysis:
> https://github.com/izigower/asus-screenpad-linux


Hi,

can you try the patch at the endo of this email please?

I am already tracking this, but progress has been slow. In theory this is a regression,
and this patch solves it but I can't understand if it is solving it fully or not.

From e9f4d0ef00c4f3e1ba26db68a688e523a743e733 Mon Sep 17 00:00:00 2001
From: Denis Benato <denis.benato@linux.dev>
Date: Wed, 5 Aug 2026 16:05:36 +0000
Subject: [PATCH] platform/x86: asus-wmi: fix unclear usage of bd->props.power
The bd->props.power is checked in parts of the driver correctly comparing with
BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
and !bd->props.power, moreover in certain checks the logic has been
inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
usage and the inconsistencies by using proper comparisons.
Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
Closes: https://lore.kernel.org/all/178362762638.911488.8564892548331679884@eldamar.lan/
Closes: https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev/
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
drivers/platform/x86/asus-wmi.c | 12 +++++++++---
1 file changed, 9 insertions(+), 3 deletions(-)
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8610663b8269..3600dddd8f36 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4500,7 +4500,8 @@static int update_screenpad_bl_status(struct backlight_device *bd)
u32 ctrl_param = bd->props.brightness;
int err = 0;
- if (bd->props.power) {
+ switch (bd->props.power) {
+ case BACKLIGHT_POWER_ON:
err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
if (err < 0)
return err;
@@ -4508,12 +4509,17 @@static int update_screenpad_bl_status(struct backlight_device *bd)
err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
if (err < 0)
return err;
- }
+ break;
- if (!bd->props.power) {
+ case BACKLIGHT_POWER_OFF:
err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
if (err < 0)
return err;
+ break;
+
+ default:
+ pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
+ return -EINVAL;
}
return err;
-- 
2.47.3
