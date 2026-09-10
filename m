Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A5375AAB
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030105; cv=pass; b=XnKY1tYeRmakkA1l+ZNqwHzvS9nfxEW8tbtf/eRJXDS7EwcEHM8N6MLNlVKcr6bBeLDyDwuyVMAnJMuzKoC2wHly313YLMwfoaFPPtVa8ta61nkvKU96r9FLIOjDSltF92WpoNjkS4qol5nZkZmwryyVBxNVLw5zOj6oekAwH+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030105; c=relaxed/simple;
	bh=xSe4NPVpZqyztu8tHHdmm6NpP9bd2PiXu75N0W9knTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLmAEhN20VbBUiFaxU8nKyX1EfdJ/R5GZ3GsNQy4/ENp77nFcC/ZX+8q+XNkWxeB+biypIJlFjlh6IYxkZx2juVJkZdQLY7Q2w6KONwfmIVnJNPmeKpdv6IhRIZHJDhiqbG+cp3ftkOLjLFQ+Kyoq0CtX+YxyDz+zwenmI6sNz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjSHeMVj; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjSHeMVj"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5302b692c8eso60328681cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 01:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789030098; cv=none;
        d=google.com; s=arc-20260327;
        b=JdvyT8GS/+VZx326VAtr1W/rHhMvRJdeUftvMIRfE0II415JZpSfOyNQ1Az5olI83u
         lEvlVLC6S+8fq4Zi1hzN4k4UlNRUMqxXmLFaDkI1/k1GWBRcxhHaIMHESI9lsi8ngVtq
         ElYLZQ7IdcCGKkVm93mJJpR6+v/5w17mm1hXNqHz/1Y/Ms1v8oz4q6n9pusezHjbq1Ei
         Dxo4aCUWnOAI3udaUI07lNi9IihpNA7SSntv83dqyGiLwk92vU0nxCICgwyQEznLkC0H
         KbjDyXtLNKRRPofWTKpLVKY1S6tq9ZNMcIlZ9T32KV7SStOsxuSORz27l6JAW1a52VAk
         zcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTcZaKxqDPLemLptkc/YEpegk99XcC23aX89s+OeND8=;
        fh=LXX8yWfuE8Z/5nkHPYzly/ul8/7zOaCJvw49lsQVxc4=;
        b=jKdBMsIWbyXkrfjLvbIk3deolfMCi+iJk9qMJjKKHQpBPYIPHwbIayLpCAtFXYXQaU
         ZonODGg50eY+iEBNhkimLc7T1xFGfKNiV3uXC0YO2K9o1GhgbbcEGmbcV8P5fcPUq9dv
         Cxf6WSgBU96B9OLD6DDlgdQyDh7C15R7js4xVooyp9kKL2A9Z2wvvgaZVRIAKy65km+R
         zzgFCEhB1puoYsdtupSuNy6wNRJ4L2w/wlm4bwfu+FryhEgMht0qx5YD4AXps2jMh5oL
         hMAPINBqI5u1onXBOGVg2TmhNLTQQXWYZWwfW8I/wZidNJ8gOom4ZrNW5IW2gdejr9g2
         mJ6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789030098; x=1789634898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yTcZaKxqDPLemLptkc/YEpegk99XcC23aX89s+OeND8=;
        b=HjSHeMVjJFDCOGzzNjPjC63GjmBBl/IYycnvNc35wotry5m5ltCmnthFVw22zNDxEJ
         TXfkpzC6rNWqvlatLkxfpCLae+/QYtxDMfvG2VumPNKjiMqaBnw7DVrRpGJRdVTGVAPL
         azR8y73fes0XoKJouoPLhMAEd6gYTcnhw6y+qrseWIMm8Ysh4SNl7gboBZEoDu5u7Kf3
         DhGrbpjeBKgr4sB84n2hSD+FtboWvPX0TGKqmZVuPbVNXEuvmNHzws9Kspy5uIbIoEip
         fbJP8VChLhmd0ce2xP74ubyC9gJ3gaH1xu8ixnGIp4nwN5v70qeee/s46Hz042HepZ0J
         y1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030098; x=1789634898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTcZaKxqDPLemLptkc/YEpegk99XcC23aX89s+OeND8=;
        b=JyfS+niAsRRSiysa5/4zJfVaT3H5Z95TurdqZ/JWZgBLTIiL05HAqZZ9mW2G0meGgj
         oGvEmoH3hSyH6qhAVSwJRhm7BqGl6+MOSVIWy4L6sp5joLggAB+kkgSu3yGB1f03/X2P
         WHuSKUmBlD5xXWdjJjaYwpZpdP2fF41YqA4lDnMShmdsNj2Cz3bPdUSVAigVwKq4mAh6
         jg4AFDCCLHK4mSMgPcFWq8yyPhUsnz6iFEtjAxX85Qw1dOHS1MpxX2cDEStPHcpg0e7R
         0nLqB1qr2tahRYj9h9zaUqXV2QWGKKTbq6avTAs2ouIiBbpx3EVtn9on3pg90FxA2UXA
         ad6g==
X-Gm-Message-State: AFuF++mNigH6lbiFj5qZlXEZV8WDaWPxDBP2FXOqoY9CpdjePF/t28rM
	g+mrhHeuhj7w42P8IDSQq6T/tu9vYwjBTVsQFZubwJhwUzpa6/JL0bNXENy8DqeIEY87/179Ipl
	r95vWuPiLzL61Ucerlz0lb5oMckzMP60=
X-Gm-Gg: AYBFou3dsz1CXyR3BbnLrM64q4omVldfLoe9TLmNkFIWgoKbyFQY426Wxhtu75hY1oq
	d1H1NAflblr/5X66KRrc4P0fEVncG3IMkm02PzcYkF5iQCIWuNseelecc9WUqF05CZnl6nKiku+
	+U+KjMY4vpn0xFj1fD4tBeVBZE5jdnMNWLkGU29MzRx6PL0TXROrfnuFyKuC0KPzilxEndietcI
	dUGUEJHwW3Tr/ZW6IsO8DyTIzq9p3RD5x2bcp96TfzRSMpx/wifnRnGY6pvg2irD0Wb4OF0pXSt
	KVRjYZ+hB+b8dG/zy1dlgqMd8d1QRVy9HTT+T2yH9+q1IxpDR0MozkA06A==
X-Received: by 2002:a05:622a:4cc6:b0:530:b2e4:d59c with SMTP id
 d75a77b69052e-530b2e4ddeamr51929471cf.55.1789030098001; Thu, 10 Sep 2026
 01:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com>
 <d34b4d0f-2db4-47fb-bada-ef71f3ef3eff@linux.dev>
In-Reply-To: <d34b4d0f-2db4-47fb-bada-ef71f3ef3eff@linux.dev>
From: hugo baigue <hugobaigue2004@gmail.com>
Date: Thu, 10 Sep 2026 10:48:06 +0200
X-Gm-Features: AcwNN1Vst099bm2M0xTEtaacbhBgwEQPjk_xXNIApD35R9eYgjUOqAENXlHxcFw
Message-ID: <CAO84+xJ9aW3pj3x8e9b5biWtnNd4EyH7A4Uy7aqBR4qZMDcVvg@mail.gmail.com>
Subject: Re: asus-wmi: screenpad backlight power state is never read back (UX5400EA)
To: Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
	luke@ljones.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thanks. I tested your patch on the UX5400EA. It does fix the inversion,
but the screenpad power state cannot be read back at all on this
machine, and that turns out to be the reason my original report looked
the way it did. Details and measurements below.

Method: drivers/platform/x86/asus-wmi.c from v7.1.9 built as an
out-of-tree module, unpatched and with your patch, swapped on the same
machine. Firmware state was read independently through acpi_call on
\_SB.ATKD.WMNB, so none of the numbers below come from the driver under
test.

1) Your patch fixes the write path. Confirmed.

Unpatched v7.1.9:

    echo 4 > bl_power  (BACKLIGHT_POWER_OFF)  ->  panel ON,  DSTS 0x000100a=
0
    echo 0 > bl_power  (BACKLIGHT_POWER_ON)   ->  panel OFF, DSTS 0x0001000=
0

Fully inverted, reproducible. With your patch the two are the right way
round.

2) The power state is not readable through ASUS_WMI_DSTS_STATUS_BIT.

DSTS(ASUS_WMI_DEVID_SCREENPAD_POWER) toggled four times with DEVS,
panel state cross-checked against the DRM connector:

    panel ON   DSTS =3D 0x000100a0   bit0 =3D 0   HDMI-A-2 connected
    panel OFF  DSTS =3D 0x00010000   bit0 =3D 0   HDMI-A-2 disconnected

The state is there, but in the low byte (0xa0 vs 0x00), not in
ASUS_WMI_DSTS_STATUS_BIT. So

    asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER)

returns 0 whether the panel is on or off, and
read_screenpad_backlight_power() consequently reports
BACKLIGHT_POWER_OFF unconditionally. That is what my original report
described as "never read back": not a missing propagation, but a read
that queries a bit this device does not use.

For reference, DSTS(ASUS_WMI_DEVID_SCREENPAD_LIGHT) reads 0x0001ffa0
here, i.e. max 0xff and current 0xa0 under the documented brightness
masks, which is consistent with the low byte of the POWER devstate
being the same brightness value.

3) Because of 2), your patch changes probe behaviour.

asus_screenpad_init() does:

    power =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_P=
OWER);
    ...
    bd->props.power =3D power;        /* always 0 here, see above */
    backlight_update_status(bd);

0 is BACKLIGHT_POWER_ON, so that final backlight_update_status() now
faithfully powers the panel on. Measured, firmware had left the panel
off before loading the module:

    unpatched v7.1.9   panel stays OFF, bl_power reads 0
    with your patch    panel is switched ON, bl_power reads 0

Before your patch the inverted branch cancelled the bad value by
accident. Also, brightness was never read (init only reads it when
power was set), so the panel comes up powered at brightness 0: a
connected DRM connector showing nothing, which is roughly the state I
reported in the first place.

4) Your new default: branch is unreachable on this machine.

I expected props.power =3D 1 to hit it. It does not: because of 2), power
is 0 in every case, on or off. Loading your patched module with the
panel already on produced no pr_warn and no -EINVAL. So the warning
will not catch this class of problem here.

5) Two suggestions, both untested by me beyond compiling.

Reading the state from the low byte rather than the status bit, if you
consider that safe across models:

    - ret =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_P=
OWER);
    - if (ret < 0)
    - return ret;
    - /* 1 =3D=3D powered */
    - return ret ? BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
    + err =3D asus_wmi_get_devstate(asus,
ASUS_WMI_DEVID_SCREENPAD_POWER, &retval);
    + if (err < 0)
    + return err;
    + return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) ? BACKLIGHT_POWER_ON
    +       : BACKLIGHT_POWER_OFF;

I do not know whether other ScreenPad models encode it the same way, so
this is an observation rather than a proposal. If it holds, init could
then use read_screenpad_backlight_power() instead of the raw devstate,
which is what the main panel already does through read_backlight_power().

Separately, update_screenpad_bl_status() ignores props.state although
the driver sets .options =3D BL_CORE_SUSPENDRESUME, so BL_CORE_SUSPENDED
and BL_CORE_FBBLANK never blank the panel. backlight_is_blank() covers
both that and props.power, and would make the switch and its default:
unnecessary:

    static int update_screenpad_bl_status(struct backlight_device *bd)
    {
    int err;

    if (backlight_is_blank(bd))
    return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);

    err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
    if (err < 0)
    return err;

    return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
        backlight_get_brightness(bd), NULL);
    }

That builds clean here. I could not test it end to end because module
unload oopses on this machine, which is the last point below.

6) Unrelated, but it is what stopped me testing further: rmmod oopses.

    # rmmod asus_nb_wmi

kills rmmod, leaves the modules loaded and the platform device half torn
down, and needs a reboot. Reproduced on every attempt, including with
the distributed in-tree modules only. The OE/unsigned taint below comes
from acpi_call, which I use to read the ScreenPad state independently.

    BUG: kernel NULL pointer dereference, address: 0000000000000000
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 0 P4D 0
    Oops: Oops: 0000 [#1] SMP NOPTI
    CPU: 0 UID: 0 PID: 18879 Comm: rmmod
    Tainted: G           OE       7.1.9-arch1-2 #1 PREEMPT(full)
    Hardware name: ASUSTeK COMPUTER INC. Zenbook UX5400EA_UX5400EA/UX5400EA
    RIP: 0010:led_classdev_unregister+0x9b/0x110
    RAX: 0000000000000000 RBX: ffff88b2c77d2380 RCX: ffff88b2ca43f200
    RDX: 0000000000000000 RSI: 0000000000000026 RDI: ffff88b2c77d23e0
    CR2: 0000000000000000
    Call Trace:
     <TASK>
     release_nodes+0x56/0xf0
     devres_release_all+0x9e/0x110
     device_unbind_cleanup+0xe/0xa0
     device_release_driver_internal+0x1c3/0x200
     bus_remove_device+0xfe/0x200
     device_del+0x179/0x410
     platform_device_del+0x30/0xa0
     platform_device_unregister+0x12/0x30
     asus_wmi_unregister_driver+0x31/0x50 [asus_wmi]
     __do_sys_delete_module+0x1de/0x350
     do_syscall_64+0xaa/0x660

RAX is 0 and the faulting instruction is the list check in
led_classdev_unregister, so this looks like unregistering a led_classdev
whose list node was never linked. Two observations, neither proven to be
the cause:

- The trace goes through devres_release_all, so it is a devm-registered
  led_classdev. asus->kbd_led is the only one registered with
  devm_led_classdev_register(); it is registered lazily from the
  kbd_led_update_all() workqueue item, and asus_wmi_led_exit() destroys
  that workqueue during remove.

- Independently, asus_wmi_led_exit() calls led_classdev_unregister()
  unconditionally on tpd_led, wlan_led, lightbar_led, micmute_led and
  camera_led, while asus_wmi_led_init() registers each only behind a
  condition. On this machine none of the five is registered:

      $ ls /sys/class/leds | grep asus
      $ (no output)

  Guarding those five on led_cdev->dev being non-NULL did not stop the
  oops, which is consistent with the devres path being the real one, but
  the asymmetry looks worth fixing anyway.

Happy to run whatever you want tested; the hardware is in front of me.

Tested-by: Hugo Baigue <hugobaigue2004@gmail.com>

Hardware: ASUS ZenBook 14X OLED UX5400EA, BIOS UX5400EA.308, kernel
7.1.9-arch1-2.

Le mer. 9 sept. 2026 =C3=A0 21:28, Denis Benato <denis.benato@linux.dev> a =
=C3=A9crit :
>
>
> On 9/9/26 21:20, hugo baigue wrote:
> > platform/x86: asus-wmi: screenpad backlight power state is never read b=
ack
> >
> > Hardware: ASUS ZenBook 14X OLED UX5400EA, ScreenPad 2.0 (2160x1080 pane=
l,
> > exposed on HDMI-A-2), kernel 7.1.9.
> >
> > asus-wmi registers the `asus_screenpad` backlight device and knows both
> > ASUS_WMI_DEVID_SCREENPAD_POWER (0x00050031) and SCREENPAD_LIGHT (0x0005=
0032).
> > However the power state exposed through `bl_power` neither reflects the
> > firmware state nor allows changing it.
> >
> > The firmware leaves the ScreenPad panel off at boot. While it is off th=
e DRM
> > connector stays `disconnected`, so the panel is indistinguishable from =
an empty
> > port and no userspace can use it.
> >
> > Observed:
> >
> >   step                          bl_power   firmware (DSTS 0x00050031)  =
 HDMI-A-2
> >   panel on                      0          0x100a0
> >  connected
> >   panel powered off by firmware 0          0x10000                     =
 gone
> >   write bl_power 0 / 1 / 0      0          0x10000                     =
 gone
> >   DEVS 0x00050031 =3D 1 via ACPI  0          0x100a0
> >  connected
> >
> > Two distinct problems:
> >
> > 1. `bl_power` reports 0 (FB_BLANK_UNBLANK, "on") while the panel is pow=
ered
> >    down. Nothing reads the state back from the firmware, so the attribu=
te is
> >    stale from the moment the firmware changes it on its own =E2=80=94 w=
hich it does on
> >    boot, on resume, and whenever the panel brightness is driven low.
> >
> > 2. Writing `bl_power` does not restore the panel. Calling the same devi=
ce id
> >    directly through acpi_call does:
> >
> >      echo '\_SB.ATKD.WMNB 0x0 0x53564544 b3100050001000000' > /proc/acp=
i/call
> >
> > Consequence: on this machine the ScreenPad is unusable without an out-o=
f-tree
> > helper, even though the driver already knows the device id needed to dr=
ive it.
> >
> > A related detail that may matter for the fix: on this firmware, writing=
 a low
> > brightness value to /sys/class/backlight/asus_screenpad/brightness (tes=
ted 0, 1,
> > 30, 50, 100, 120, 150) makes DSTS 0x00050031 return 0 and the DRM conne=
ctor
> > disappear. Brightness and power appear to be a single firmware setting,=
 so
> > clamping or refusing low values may be needed alongside the state read-=
back.
> >
> > The DSDT also exposes three device ids in the same family that the driv=
er does
> > not use: 0x00050033 (returns a constant, likely a presence flag), 0x000=
50034
> > (toggles a bit in the EC), and 0x00050035 (writes EC commands 5 and 6 o=
n the
> > same path as POWER).
> >
> > Workaround and full analysis:
> > https://github.com/izigower/asus-screenpad-linux
>
>
> Hi,
>
> can you try the patch at the endo of this email please?
>
> I am already tracking this, but progress has been slow. In theory this is=
 a regression,
> and this patch solves it but I can't understand if it is solving it fully=
 or not.
>
> From e9f4d0ef00c4f3e1ba26db68a688e523a743e733 Mon Sep 17 00:00:00 2001
> From: Denis Benato <denis.benato@linux.dev>
> Date: Wed, 5 Aug 2026 16:05:36 +0000
> Subject: [PATCH] platform/x86: asus-wmi: fix unclear usage of bd->props.p=
ower
> The bd->props.power is checked in parts of the driver correctly comparing=
 with
> BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
> and !bd->props.power, moreover in certain checks the logic has been
> inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
> usage and the inconsistencies by using proper comparisons.
> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brig=
htness handling")
> Closes: https://lore.kernel.org/all/178362762638.911488.85648925483316798=
84@eldamar.lan/
> Closes: https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@=
linux.dev/
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
> drivers/platform/x86/asus-wmi.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 8610663b8269..3600dddd8f36 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4500,7 +4500,8 @@static int update_screenpad_bl_status(struct backlig=
ht_device *bd)
> u32 ctrl_param =3D bd->props.brightness;
> int err =3D 0;
> - if (bd->props.power) {
> + switch (bd->props.power) {
> + case BACKLIGHT_POWER_ON:
> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
> if (err < 0)
> return err;
> @@ -4508,12 +4509,17 @@static int update_screenpad_bl_status(struct backl=
ight_device *bd)
> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param,=
 NULL);
> if (err < 0)
> return err;
> - }
> + break;
> - if (!bd->props.power) {
> + case BACKLIGHT_POWER_OFF:
> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> if (err < 0)
> return err;
> + break;
> +
> + default:
> + pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.powe=
r);
> + return -EINVAL;
> }
> return err;
> --
> 2.47.3
