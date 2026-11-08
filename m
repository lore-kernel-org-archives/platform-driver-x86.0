Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146764;
	b=Xt+blA+NowqT4cm6csXiXCUQ1MP2gbjRFesqw6Y319XWBrQiXNZ1Qfzb/vmzhLvGmxPJ
	 mrv8kMY2kNiESg13BzKJAxigi6LF3roSbXhZhc9GxANxTMPjUrAdbXl+MuigsrN2bcQpe
	 5Q+duJP8G/pIPvhavvSH7EuMnw9kLVqJtHar0gQRXWwt7Epxa2byGoITGBDRx7qu6WVV3
	 LMxJ8PltPPNJn8O8ZWF7ob+10VrHXOKfZ8UIa5gGqyH+HSDxXyVxYMNba9/z00lu9wHni
	 7fU/+LxY9AU54Txw+iFETJMbBusiyTbC2q3yNYbmpNW3OiwCDEiWizJ7O2aEtg5DcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146764;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=DZAL0OKNV5p81qluo5xHKTMjaLs1RO7E9aG9WbvXH4Q=;
	b=Evwg0NeXc8pzj2CF66+/oyCqhhNI21L/1zNspzD0/D1bWDxzJXKBSLteiXjLNp6F0KSP
	 SZsULV3jKvDcU/HDfBgoOmx2r2uGKNNJWSfgwdy+f3JX2uENw3CArboQ6RQd1VAW5onJ/
	 jZoHuaFcIB44kQjiditn3wdPkDGNjSKBTD5y4t3hQLQnqikc1co/8EC7s4mCr1HLgkR04
	 2+d/4W4aut3OJY9w0XFMoR0SF+sHUH6Kucvbb3m8fqBkSi6o/prmDkJSHuOyX05AVP/+0
	 qTNVkAodzk2eLGrJvxJF/H8zpT0DZiENnKzvgkc7RjEAg6a5geZE/WilMh8Kg1LWGfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=eQdgvep+;
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD859606A321
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 14:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD859606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=eQdgvep+
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 998223EA67
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 14:06:00 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 959013EB0A
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 14:05:59 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A9AD1200C58
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 16:05:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794146759;
	bh=DZAL0OKNV5p81qluo5xHKTMjaLs1RO7E9aG9WbvXH4Q=;
	h=Received:From:Subject:To;
	b=eQdgvep+IyFyKDJrW1Ai1jHXvhnEwRdgGRZbh3szJCXgqEvgKyxa+OJmIUaVzYBWh
	 w1LO0J372YkzOtMvFjgDUpF0zSxfd9t8URzyXjq2qNbLQTDzFckUKq+iyOOCLPRm2D
	 LCYzver6ARrJU4fRwKDfY/IEMs6hYBWpvD6sowoxVbEo28q70O76Bp/HZphhtJ5TiW
	 KWNZaBlFGJon619qiz0haXXAw0wn7Y19fTRX3kocxRwWYi9IR5WuWkhwbgR7Yaew+n
	 p8H4Mb4g4ec5xT5ygOW3ACGIiINuhqL7FoZHNpzlm1vuxcsCF3N4gDx1M7nVM0ibIr
	 97NdXDMBFjG7Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-8a058315c79so23435b3a.3
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 08 Nov 2026 06:05:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErFIdQK2JCiUt2U53Ew/oMl4KLZFztGE7wLEWymjsAjzrc4Z3h0UO+7UfOGJLEPXtf0FtwRWVEDJU+aQjrUms3aB+lzX@vger.kernel.org
X-Gm-Message-State: APuU4Z/++xpdcJs/JrEm/q5gcrskGW292IA3YOwZTb2PWh/t10jkVdN1
	JB8+qDxetj+DKcWmWcdjDxZhvD5fL1xRwYRTYxTz8v0Nv3co6YFQGNyi0qGH8MpNmBqihwPLNSS
	to6RNbWBy8yVYde9+RXky+knCm8bHCU8=
X-Received: by 2002:a05:6300:2201:b0:3e2:1850:ec5e with SMTP id
 adf61e73a8af0-3eecfb7914dmr1460097637.1.1794146757158; Sun, 08 Nov 2026
 06:05:57 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-asus-wmi-kbd-readback-v1-1-bf38f6400ade@proton.me>
In-Reply-To: <20261108-asus-wmi-kbd-readback-v1-1-bf38f6400ade@proton.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Nov 2026 15:05:44 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwENHjfYUJMT5CP_Jvp6fYr54jxrgbrZBKfSH+8K_3wqMA@mail.gmail.com>
X-Gm-Features: AclHuK_Z0b9bwqpxA9Ii_zy1OA9EvDXMEUEkv0LJFGFGJk6iLFdSkmjo6WnPShU
Message-ID: 
 <CAGwozwENHjfYUJMT5CP_Jvp6fYr54jxrgbrZBKfSH+8K_3wqMA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Ignore kbd backlight read-back on
 rejected writes
To: tarrihmoad@proton.me
Cc: Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Sercan GOKMEN <gokmensercan@gmail.com>,
	Burak Goncu <burakgon12@gmail.com>, Denis Benato <benato.denis96@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179414675904.1168612.5059612707910463559@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Nov 2026 at 14:44, Moad Tarrih via B4 Relay
<devnull+tarrihmoad.proton.me@kernel.org> wrote:
>
> From: Moad Tarrih <tarrihmoad@proton.me>
>
> On the ASUS ROG Strix G18 G814FP, the brightness attribute of
> asus::kbd_backlight always reads 0, and every read breaks the keyboard
> brightness keys.
>
> The firmware reports the keyboard backlight WMI device as present, but
> DSTS(0x50021) returns 0x50000 (presence bit set, level 0) whatever level
> the keyboard shows, and DEVS(0x50021, 0x80..0x83) returns
> ASUS_WMI_UNSUPPORTED_METHOD for every level. The backlight is driven by
> hid-asus through its asus-wmi listener instead.
>
> Since commit fac55d29581f ("platform/x86: asus-wmi: Add support for
> multiple kbd led handlers"), kbd_led_get() stores the level it reads in
> kbd_led_wk, and the brightness key handlers step from kbd_led_wk. Any
> read of the attribute, for example by a desktop environment or
> systemd-backlight, therefore resets the stored level to 0, and the next
> brightness-up press sets the keyboard to the lowest level instead of
> stepping up:
>
>   # echo 3 > /sys/class/leds/asus::kbd_backlight/brightness
>   (keyboard goes to high)
>   # cat /sys/class/leds/asus::kbd_backlight/brightness
>   0
>   (brightness-up key: keyboard drops to low)
>
> systemd-backlight also saves 0 at shutdown, so the level is lost across
> reboots.
>
> Remember when the firmware rejects a write with -ENODEV, and from then
> on return the stored level from kbd_led_get(), as is already done when
> the WMI device is not available. The first write is queued right after
> the LED is registered, so the read-back is only trusted before any
> level has been set.
>
> The cause was found and this fix written with the help of an AI coding
> assistant (Claude Code, Claude Opus 5.5). I reviewed the change and
> tested it on the affected laptop.
>
> Fixes: fac55d29581f ("platform/x86: asus-wmi: Add support for multiple kbd led handlers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Moad Tarrih <tarrihmoad@proton.me>
> ---
> Tested on an ASUS ROG Strix G18 (board G814FP, BIOS G814FP.317,
> keyboard 0b05:19b6) only, on 7.2.14 as a DKMS module. With the patch,
> the attribute reads back low, medium and high correctly, the brightness
> keys step from the real level, and the level survives suspend/resume
> and reboots. Build-tested with W=1 against pdx86 for-next
> (c339f4010dea): no warnings. checkpatch --strict is clean.
>
> Limitation: a machine whose firmware rejects writes but changes the
> brightness by itself would now report a stale level. I don't know of
> such a machine.
>
> Sercan GOKMEN posted a patch for the same symptom on the B9406CAA:
> https://lore.kernel.org/platform-driver-x86/20261030-b4-asus-wmi-b9406caa-kbd-readback-v2-1-ca93bb9039f6@gmail.com/
> On that board writes succeed and only the read-back is constant, so it
> uses a DMI quirk. The two patches are complementary: the rejected-write
> check doesn't catch the B9406CAA, and the quirk doesn't catch the
> G814FP. They touch the same condition in kbd_led_get(), so whichever
> lands second needs a trivial rebase; I'm happy to rebase onto it.
>
> This touches different code from Bartu Alev's pending series
> '[PATCH 0/2] platform/x86: asus-wmi: fix and unify keyboard brightness
> key handling' and applies cleanly before or after it.
>
> A more general option would be to ignore the WMI read-back whenever a
> hid-asus listener is registered, since hid-asus drives the backlight on
> the G814FP. I didn't do that because it could report stale levels on
> machines where the firmware does change the brightness itself, but I can
> rework the patch that way if preferred.
>
> AI assistance: Claude Code was used over several sessions to trace the
> read-back path in asus-wmi and hid-asus, run the debugfs DSTS/DEVS
> probes, write the patch and draft this message. Testing and final
> review were done by me on the hardware.

Try to rewrite the commit message in your own words. It is hard to
follow. This patch adds too much code.

From what you are saying, your device always returns 0. So that is the
bug. The code already has handling (as you said) for both the case
reads are bugged and the wmi device is missing.

Therefore, in your case the proper fix is to either piggyback on that
quirk so that we do not read that device or, if you want to also avoid
logged errors, introduce a small new quirk that sets kbd_led_avail to
false and does not initialize a WMI device. The latter is an ideal
solution though, minor errors in dmesg due to bios misconfiguration
are common and harmless. The simplest solution for you is to use the
read quirk.

In both cases, if Sercan's patches are queued, find Ilpo's remote and
base on that so you get no conflicts

We cannot use a heuristic for when hid-asus is present. The device
reports a WMI handle. There are devices with multiple aura devices on
them.

If it is found that a lot of devices report bogus reads, a potential
future approach is to remove readback from WMI altogether and always
use the bios stored value. This allows dropping the read quirk
altogether.

Best,
Antheas

> ---
>  drivers/platform/x86/asus-wmi.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index b33ebdb21aa2..c47ebc1f184a 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -258,6 +258,7 @@ struct asus_wmi {
>         struct led_classdev kbd_led;
>         int kbd_led_wk;
>         bool kbd_led_notify;
> +       bool kbd_led_write_rejected;
>         bool kbd_led_avail;
>         bool kbd_led_registered;
>         struct led_classdev lightbar_led;
> @@ -1724,8 +1725,9 @@ static struct asus_hid_ref asus_ref = {
>         .listeners = LIST_HEAD_INIT(asus_ref.listeners),
>         .asus = NULL,
>         /*
> -        * Protects .asus, .asus.kbd_led_{wk,notify}, and .listener refs. Other
> -        * asus variables are read-only after .asus is set.
> +        * Protects .asus, .asus.kbd_led_{wk,notify,write_rejected}, and
> +        * .listener refs. Other asus variables are read-only after .asus is
> +        * set.
>          *
>          * The led cdev device is not protected because it calls backlight_get
>          * during initialization, which would result in a nested lock attempt.
> @@ -1896,10 +1898,24 @@ static enum led_brightness tpd_led_get(struct led_classdev *led_cdev)
>  static void kbd_led_update(struct asus_wmi *asus)
>  {
>         int ctrl_param = 0;
> +       int err;
>
>         scoped_guard(spinlock_irqsave, &asus_ref.lock)
>                 ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
> +       err = asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param,
> +                                   NULL);
> +
> +       /*
> +        * Some firmware reports the device as present but rejects writes,
> +        * and its read-back does not follow the level set through other
> +        * paths, such as hid-asus. Stop trusting the read-back once a
> +        * write has been rejected.
> +        */
> +       if (err == -ENODEV) {
> +               pr_debug("Keyboard backlight write rejected, ignoring read-back\n");
> +               scoped_guard(spinlock_irqsave, &asus_ref.lock)
> +                       asus->kbd_led_write_rejected = true;
> +       }
>  }
>
>  static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
> @@ -1975,7 +1991,7 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
>         asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>
>         scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> -               if (!asus->kbd_led_avail)
> +               if (!asus->kbd_led_avail || asus->kbd_led_write_rejected)
>                         return asus->kbd_led_wk;
>         }
>
>
> ---
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> change-id: 20261108-asus-wmi-kbd-readback-236245e82de8
>
> Best regards,
> --
> Moad Tarrih <tarrihmoad@proton.me>
>
>
>

