Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460137B3FE
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115130; cv=pass; b=Z+K6Q0p/pbqjpQGO5zQiXJE5RX+zpeuAl4Welk8rmL3zbFNldQe9P4W0Drpypl09AEze7056fNpsudBEMLhCnoH+4DGsc2tmCSaqEu/A9v52yVdlOds9p1FxueqY18GbruU6/A5EvNylJ0SLhu26a6tUXQ0SUj2kNrVE0pKkNsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115130; c=relaxed/simple;
	bh=tI578i2ODzrZ/HdhnltbrYOzKsbVd4jJ04fso8I2zaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXupIzf2C3dAj65lP5nYTKIrqKDAt7mNBfQh7Fe41BRFlSQwj0UPc9hJ+bBFdOFAE3QB9sFg/Qu3u/oKkopzGYYHRTJykpst0vMnlDv011VBUrGaLDhxi4P1PqG/Myz1vvtfGdzA/DpNlggMFBz0XGLdYItIYo9JNgwRcG6iCh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkCbeU1Q; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkCbeU1Q"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5308fc4b67cso7878161cf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 01:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789115126; cv=none;
        d=google.com; s=arc-20260327;
        b=D70QkoOYKANiwxBN6EjjXMWqrFR1EI6eR4liwhihjjSZH5GCp/uUV3SfpGjptYBY7d
         Q50JlWEN2qqhCOpO9TnyMhwro1jaZzYtEOfxYQOKqCvRo7hqrPIdh2wwDPw5ulMYoycN
         4T2j6C08f/YZXugTpIVkG/USqkM+4dxvKFlfNxfmfswbQfmcDUzokSsdb7kQVGYXewV9
         Uz6TbEflU0zt0ltCfuXC/6d1WsUfdqzfB5R3dgr88c/F47WOZ+oGlouoAa2FRtd7/ELJ
         sEKiS3qjeyGmprGR+l0dZXEUXiEhH+PrBuTCsBmhFFL7LlmLRUYvUgrgw7ImpENFuRNQ
         3P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=udeCoBp3KmC4CmtX/UWoAnVKXjbR3IBLa5iJg13qhJY=;
        fh=LXX8yWfuE8Z/5nkHPYzly/ul8/7zOaCJvw49lsQVxc4=;
        b=iBxFyy24X678MjyoMQARBKu5pKzxE+o08puONMvqA3RM0BJWF7+GblFCqxJUK3a1IY
         mv/5GOWkvlayK9n1MMdtqFaoUhU4G3hBg8WcOO5PC2CBdd9vurebpXnYAq1db9slyQG7
         TCx+t/I3rewJvzNcJ2TBieFiki4wcUCeGsqr+1f4xnslbrZCssDJ/ObqT7cbsvv+hQgC
         dGhORHI+9Z+A3rkh8A7P3N9htwYl6O1hHfbBf6vr36WnqdRMCaL1Al2W595hZCJzNVWs
         QIP/v/p4mwz8B4EIrOTIS4QO/sjHXLe7H+7mfRCsAvk2sYg6a3jGAzf1ZUgBfW4BroiL
         F+xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789115126; x=1789719926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udeCoBp3KmC4CmtX/UWoAnVKXjbR3IBLa5iJg13qhJY=;
        b=KkCbeU1QbrEjemX1AP4OdbfSw2bBaC1k1xZ/JhX9SPsGltAVmgFGRz/lsGBDriP3ZP
         EboScY3qpjzEFyVYE/aStZ4v5ui5mBxMpqg0+8mwWd973+K41TsOp6WDaGOD9HfVMb+I
         7ntGCB/FsUohq6JJx029vA5l/83D4QueYe1e+dh/dSKbBoKJTKjtxd3Tq7pJFjJQE8LC
         S1Y+3CkBYx2Lwg8oULW59oZFBiYbXD3d+F2niS8jBhGxV1oOJWpgu8w8HUtR85Jw6k1j
         G/nN3XYsifepobxDSzGZisMBG5n3THIDpayiewaMiY0ZzgMQUekdobqvkMONjxiXerID
         Kw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115126; x=1789719926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udeCoBp3KmC4CmtX/UWoAnVKXjbR3IBLa5iJg13qhJY=;
        b=UugrABCHRtRfbK13PQPaQO1zKTm8cCERwj8M7EeEGW/00K00MM4bpkwVH/ExxbYPnZ
         SMsm/+9myU3a8N9/7G3uu3+/2Y7/iHWmd3l8RQX26i8nph/wewvJLqWoQQXvV7wmcdF3
         kJPhOgeeSUPfCSISOpYvcxKA9nZABTSzTlY4Z6zSaPN8dQztk081UmsUDHzMSWgFfpKg
         8WnCO0EiM6hacEVXNj1G4QwAUAXNiHm4oie6oAY5lLF3ZCUV6K2kazzPguQvtpU3HBqI
         DUIahFI5JZfg22xz+tm985gEG/CrbHumR3wt2M+Z5d6qDXatdeUA8y2XRhxXySM+o06Q
         StqQ==
X-Gm-Message-State: AFuF++lNXr7ciRkHF+3eCc58EhdCh2VfNK7L7HxENXVi/D2EGnUTQG+s
	4wNZLCP3Ct9Z0zNv6D4MnbYO7mH05BIDuvh9htACd1C0NCxN5uM+NrZ2/3Hd24ltCikevLIO2Tp
	Ayz/Cz/EuDaIc5wNdHflR096a/Rk26HGgIp8WqR8=
X-Gm-Gg: AYBFou1+ZRkICOjHiZV1LwSMdkqnV3v5Oq/tFDx1MEx4wI930tqiNCm+Nf5m/ZNsPzy
	g89ZFBqhwYdy9+Qx+ZJjezUO/sYjKRdFCMkpqsxfepD8Amf2bhDXe6rrLzCVAHA4KrVRDmn2Uo9
	uVFpOKpWMmzmXUF0ZJokjsJieknpLAnzG1D9gmANPwxCJypZOfNVIo4HzW66Rkk6688r7vRUG8I
	d1r3mY9+ayjQ5phROaAoA3M2VhuEuPgWnoMeT5kTxGbBfmc2FRaw2GydEXr67fm1mBLBGoLxKI0
	m5hkf87R2tJctmkoOL3YmHh4ekPFHuFjrGq1wAd2ROhuL2sdLqr0cha0EP8=
X-Received: by 2002:a05:622a:4d8c:b0:530:da1d:5892 with SMTP id
 d75a77b69052e-530da1d69f7mr4678051cf.37.1789115126164; Fri, 11 Sep 2026
 01:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO84+xJLVW_9_D9-8cwJYv_Vz+LK7nJqRaG-1P4_eeLrQmSiWw@mail.gmail.com>
 <d34b4d0f-2db4-47fb-bada-ef71f3ef3eff@linux.dev> <CAO84+xJ9aW3pj3x8e9b5biWtnNd4EyH7A4Uy7aqBR4qZMDcVvg@mail.gmail.com>
 <3f3e02d7-1e72-4098-a84b-38e6557fd468@linux.dev>
In-Reply-To: <3f3e02d7-1e72-4098-a84b-38e6557fd468@linux.dev>
From: hugo baigue <hugobaigue2004@gmail.com>
Date: Fri, 11 Sep 2026 10:25:14 +0200
X-Gm-Features: AcwNN1XmnRQ1Lmw9hfdgrZX4Vk9uGT6SZ463MJfxOZUAQfxtnan90hEf2SrLVQE
Message-ID: <CAO84+x+P2_xyHP89+nGVSMV6bL+dy0P9=vyEEfZGnFhv0hBNWw@mail.gmail.com>
Subject: Re: asus-wmi: screenpad backlight power state is never read back (UX5400EA)
To: Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
	luke@ljones.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Patch 2/2 on top of 1/2 works here; Tested-by at the end. Testing it
also turned up three more things: a brightness bug in
asus_screenpad_init() that your patch makes reachable, the answer to
your two-bytes question straight from the DSDT, and the cause of the
unload oops, which is not a screenpad problem at all.

1) Patches 1+2: results

Same method as before, firmware state read independently via acpi_call.

    panel OFF at module load    stays off, bl_power 4
    panel ON  at module load    stays on,  bl_power 0
    echo 4 > bl_power           panel off, DSTS(POWER) 0x00010000, DRM
disconnected
    echo 0 > bl_power           panel on,  DSTS(POWER) 0x000100a0, DRM conn=
ected
    echo 40, 200 > brightness   DSTS(LIGHT) low byte 0x28, 0xc8

The probe regression from 1/2 alone is gone.

2) Init stores the unmasked devstate as brightness

Now that power reads correctly, this branch runs for the first time on
this machine:

    if (power =3D=3D BACKLIGHT_POWER_ON) {
            err =3D asus_wmi_get_devstate(asus,
ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
            ...
    }
    ...
    bd->props.brightness =3D brightness;

brightness is the raw devstate, 0x0001ffa0. After loading with the
panel on:

    patches 1+2                brightness 130976   max_brightness 255
    patches 1+2 + mask below   brightness 160      max_brightness 255

(systemd-backlight was masked for this measurement; otherwise it
overwrites the value within ~40 ms and hides the bug.)

The hardware is unaffected, because DEVS stores the value into a byte
buffer and so truncates it to 0xa0 (see 3). Userspace, however, sees
an out-of-range brightness, and systemd-backlight saves it. Keeping
only the low byte, as read_screenpad_brightness() already does, fixes
it:

                err =3D asus_wmi_get_devstate(asus,
ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
                if (err < 0)
                        return err;
    +
    +           brightness &=3D ASUS_WMI_DSTS_BRIGHTNESS_MASK;
        }

Tested, numbers above. It could be folded into 2/2, since that is the
patch that makes it reachable.

3) Why two bytes: it is one EC register, read twice

From the decompiled DSDT (\_SB.ATKD.WMNB, BIOS 315):

    DSTS 0x00050031:  Local0 =3D EC0.REBC (0x0F, 0x02)        // 2-byte rea=
d
                      Return (Local0[0] | 0x00010000)
    DSTS 0x00050032:  Local0 =3D EC0.REBC (0x0F, 0x02)        // same read
                      Return (Local0[1] | 0xFF00 | 0x00010000)

    DEVS 0x00050031:  TMBF[0] =3D IIA1                ; EC0.WEBC (0x10, 1, =
TMBF)
    DEVS 0x00050032:  TMBF[0] =3D 2, TMBF[1] =3D IIA1   ; EC0.WEBC (0x10, 2=
, TMBF)

So the EC holds a 2-byte screenpad status: byte 0 is power, byte 1 is
brightness. POWER returns byte 0 as is, never converted to a 0/1 bit,
and LIGHT returns byte 1 with a hardcoded 0xFF as the max. On the write
side, EC command 0x10 appears to take a sub-command byte: 0 off, 1 on,
2 set brightness.

Byte 0 is not a brightness, though, which is what the comment in 2/2
says. I swept DEVS(LIGHT) from 0x01 to 0xfe, with a power off/on cycle
at every step: DSTS(POWER) read 0x000100a0 each time. It is 0xa0 when
powered, 0x00 when off, and nothing else. What bits 7 and 5 mean is
internal to the EC; the DSDT only passes the byte through.

That should settle your worry about older models too:
ASUS_WMI_DSTS_STATUS_BIT (0x1) lies inside ASUS_WMI_DSTS_BRIGHTNESS_MASK
(0xff), so the one mask covers both firmware that sets bit 0 and
firmware like this one, with no quirk. It would only miss a panel that
is powered with a status byte of 0. If you respin, the commit message
could name SCREENPAD_POWER rather than SCREENPAD_LIGHT, and describe
the low byte as a raw EC status byte rather than a brightness.

Two side observations, harmless for your patches: DEVS(LIGHT, 0) does
not power the panel off, whereas DEVS(LIGHT, non-zero) powers a
switched-off panel back on.

4) The unload oops is a use-after-free of kbd_led

Three oopses on unload today, two of them with the unmodified Arch
7.1.9 module (tainted only by acpi_call):

    RIP: 0010:led_classdev_unregister+0x9b/0x110
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

kbd_led_update_all() registers kbd_led with devm_led_classdev_register()
on the platform device, but kbd_led is embedded in struct asus_wmi,
which asus_wmi_remove() kfree()s. The driver core calls .remove before
devres_release_all(), so the devres release runs
led_classdev_unregister() on freed memory. Whether that faults depends
on whether the slab has been reused in between, which is why it is
intermittent. The LED-exit asymmetry I pointed at last time was a red
herring.

It is worse than an unload problem: after each oops the machine hung
at poweroff until I held the power button. Presumably
device_shutdown() blocks on the device lock that rmmod held when it
died in device_release_driver_internal().

The fix I tested unregisters it before the struct is freed, after the
workqueue is destroyed so the work cannot register it again:

    @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
        if (asus->led_workqueue)
                destroy_workqueue(asus->led_workqueue);
    +
    +   if (asus->kbd_led_registered)
    +           devm_led_classdev_unregister(&asus->platform_device->dev,
    +                                        &asus->kbd_led);
     }

To test it deterministically I temporarily added
memset(asus, 0x6b, sizeof(*asus)) before the kfree(), so any later
access faults every time instead of depending on slab reuse. With the
fix: 10 load/unload cycles, all poisoned, no oops. kbd_led was
registered before unload in each of the 8 cycles where I checked.

I have not tracked down which commit introduced the lazy devm
registration, so I leave the Fixes: tag to you. I can send this as a
proper patch if that is easier, or you can take it as is.

Tested-by: Hugo Baigue <hugobaigue2004@gmail.com>

Hardware: ASUS ZenBook 14X OLED UX5400EA, BIOS UX5400EA.315 (updated
since my first mail, same behaviour), kernel 7.1.9-arch1-2.

Hugo

Le ven. 11 sept. 2026 =C3=A0 04:17, Denis Benato <denis.benato@linux.dev> a=
 =C3=A9crit :
>
>
> On 9/10/26 10:48, hugo baigue wrote:
> > Hi Denis,
> >
> > Thanks. I tested your patch on the UX5400EA. It does fix the inversion,
> > but the screenpad power state cannot be read back at all on this
> > machine, and that turns out to be the reason my original report looked
> > the way it did. Details and measurements below.
> >
> > Method: drivers/platform/x86/asus-wmi.c from v7.1.9 built as an
> > out-of-tree module, unpatched and with your patch, swapped on the same
> > machine. Firmware state was read independently through acpi_call on
> > \_SB.ATKD.WMNB, so none of the numbers below come from the driver under
> > test.
>
> You can trust what asus_wmi_get_devstate returns.
>
> > 1) Your patch fixes the write path. Confirmed.
> >
> > Unpatched v7.1.9:
> >
> >     echo 4 > bl_power  (BACKLIGHT_POWER_OFF)  ->  panel ON,  DSTS 0x000=
100a0
> >     echo 0 > bl_power  (BACKLIGHT_POWER_ON)   ->  panel OFF, DSTS 0x000=
10000
> >
> > Fully inverted, reproducible. With your patch the two are the right way
> > round.
>
> So far, so good. Consistent with what the other person told me.
>
> > 2) The power state is not readable through ASUS_WMI_DSTS_STATUS_BIT.
> >
> > DSTS(ASUS_WMI_DEVID_SCREENPAD_POWER) toggled four times with DEVS,
> > panel state cross-checked against the DRM connector:
> >
> >     panel ON   DSTS =3D 0x000100a0   bit0 =3D 0   HDMI-A-2 connected
> >     panel OFF  DSTS =3D 0x00010000   bit0 =3D 0   HDMI-A-2 disconnected
> >
> > The state is there, but in the low byte (0xa0 vs 0x00), not in
> > ASUS_WMI_DSTS_STATUS_BIT. So
> >
> >     asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER)
> >
> > returns 0 whether the panel is on or off, and
> > read_screenpad_backlight_power() consequently reports
> > BACKLIGHT_POWER_OFF unconditionally. That is what my original report
> > described as "never read back": not a missing propagation, but a read
> > that queries a bit this device does not use.
> >
> > For reference, DSTS(ASUS_WMI_DEVID_SCREENPAD_LIGHT) reads 0x0001ffa0
> > here, i.e. max 0xff and current 0xa0 under the documented brightness
> > masks, which is consistent with the low byte of the POWER devstate
> > being the same brightness value.
>
> Splendid data, thank you very much. I just hope I don't need to
> check the specific bit on older models and can get away with a mask.
>
>
> It's so weird they use two bytes for one device... Can you make some
> guess what's going on here?
>
> > 3) Because of 2), your patch changes probe behaviour.
> >
> > asus_screenpad_init() does:
> >
> >     power =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENP=
AD_POWER);
> >     ...
> >     bd->props.power =3D power;        /* always 0 here, see above */
> >     backlight_update_status(bd);
> >
> > 0 is BACKLIGHT_POWER_ON, so that final backlight_update_status() now
> > faithfully powers the panel on. Measured, firmware had left the panel
> > off before loading the module:
> >
> >     unpatched v7.1.9   panel stays OFF, bl_power reads 0
> >     with your patch    panel is switched ON, bl_power reads 0
> >
> > Before your patch the inverted branch cancelled the bad value by
> > accident. Also, brightness was never read (init only reads it when
> > power was set), so the panel comes up powered at brightness 0: a
> > connected DRM connector showing nothing, which is roughly the state I
> > reported in the first place.
>
> Later in the mail you find the the patch to test: apply on top of the
> first one.
>
> > 4) Your new default: branch is unreachable on this machine.
> >
> > I expected props.power =3D 1 to hit it. It does not: because of 2), pow=
er
> > is 0 in every case, on or off. Loading your patched module with the
> > panel already on produced no pr_warn and no -EINVAL. So the warning
> > will not catch this class of problem here.
> >
> > 5) Two suggestions, both untested by me beyond compiling.
> >
> > Reading the state from the low byte rather than the status bit, if you
> > consider that safe across models:
> >
> >     - ret =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENP=
AD_POWER);
> >     - if (ret < 0)
> >     - return ret;
> >     - /* 1 =3D=3D powered */
> >     - return ret ? BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
> >     + err =3D asus_wmi_get_devstate(asus,
> > ASUS_WMI_DEVID_SCREENPAD_POWER, &retval);
> >     + if (err < 0)
> >     + return err;
> >     + return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) ? BACKLIGHT_POWER=
_ON
> >     +       : BACKLIGHT_POWER_OFF;
> >
> > I do not know whether other ScreenPad models encode it the same way, so
> > this is an observation rather than a proposal. If it holds, init could
> > then use read_screenpad_backlight_power() instead of the raw devstate,
> > which is what the main panel already does through read_backlight_power(=
).
>
> Heh basically my conclusion from above. I hope I won't need to add
> another per-model quirk, but if so then be it.
>
> > Separately, update_screenpad_bl_status() ignores props.state although
> > the driver sets .options =3D BL_CORE_SUSPENDRESUME, so BL_CORE_SUSPENDE=
D
> > and BL_CORE_FBBLANK never blank the panel. backlight_is_blank() covers
> > both that and props.power, and would make the switch and its default:
> > unnecessary:
> >
> >     static int update_screenpad_bl_status(struct backlight_device *bd)
> >     {
> >     int err;
> >
> >     if (backlight_is_blank(bd))
> >     return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NUL=
L);
> >
> >     err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NU=
LL);
> >     if (err < 0)
> >     return err;
> >
> >     return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
> >         backlight_get_brightness(bd), NULL);
> >     }
> >
> > That builds clean here. I could not test it end to end because module
> > unload oopses on this machine, which is the last point below.
>
> I need to hear what Ilpo want to do about this but I'm open to do it if
> it's deemed better.
>
> > 6) Unrelated, but it is what stopped me testing further: rmmod oopses.
> >
> >     # rmmod asus_nb_wmi
> >
> > kills rmmod, leaves the modules loaded and the platform device half tor=
n
> > down, and needs a reboot. Reproduced on every attempt, including with
> > the distributed in-tree modules only. The OE/unsigned taint below comes
> > from acpi_call, which I use to read the ScreenPad state independently.
> >
> >     BUG: kernel NULL pointer dereference, address: 0000000000000000
> >     #PF: supervisor read access in kernel mode
> >     #PF: error_code(0x0000) - not-present page
> >     PGD 0 P4D 0
> >     Oops: Oops: 0000 [#1] SMP NOPTI
> >     CPU: 0 UID: 0 PID: 18879 Comm: rmmod
> >     Tainted: G           OE       7.1.9-arch1-2 #1 PREEMPT(full)
> >     Hardware name: ASUSTeK COMPUTER INC. Zenbook UX5400EA_UX5400EA/UX54=
00EA
> >     RIP: 0010:led_classdev_unregister+0x9b/0x110
> >     RAX: 0000000000000000 RBX: ffff88b2c77d2380 RCX: ffff88b2ca43f200
> >     RDX: 0000000000000000 RSI: 0000000000000026 RDI: ffff88b2c77d23e0
> >     CR2: 0000000000000000
> >     Call Trace:
> >      <TASK>
> >      release_nodes+0x56/0xf0
> >      devres_release_all+0x9e/0x110
> >      device_unbind_cleanup+0xe/0xa0
> >      device_release_driver_internal+0x1c3/0x200
> >      bus_remove_device+0xfe/0x200
> >      device_del+0x179/0x410
> >      platform_device_del+0x30/0xa0
> >      platform_device_unregister+0x12/0x30
> >      asus_wmi_unregister_driver+0x31/0x50 [asus_wmi]
> >      __do_sys_delete_module+0x1de/0x350
> >      do_syscall_64+0xaa/0x660
> >
> > RAX is 0 and the faulting instruction is the list check in
> > led_classdev_unregister, so this looks like unregistering a led_classde=
v
> > whose list node was never linked. Two observations, neither proven to b=
e
> > the cause:
> >
> > - The trace goes through devres_release_all, so it is a devm-registered
> >   led_classdev. asus->kbd_led is the only one registered with
> >   devm_led_classdev_register(); it is registered lazily from the
> >   kbd_led_update_all() workqueue item, and asus_wmi_led_exit() destroys
> >   that workqueue during remove.
> >
> > - Independently, asus_wmi_led_exit() calls led_classdev_unregister()
> >   unconditionally on tpd_led, wlan_led, lightbar_led, micmute_led and
> >   camera_led, while asus_wmi_led_init() registers each only behind a
> >   condition. On this machine none of the five is registered:
> >
> >       $ ls /sys/class/leds | grep asus
> >       $ (no output)
> >
> >   Guarding those five on led_cdev->dev being non-NULL did not stop the
> >   oops, which is consistent with the devres path being the real one, bu=
t
> >   the asymmetry looks worth fixing anyway.
> >
> > Happy to run whatever you want tested; the hardware is in front of me.
>
>
> The temptation to cry here is real lol. I'll take a look at this tomorrow
> probably.
>
> > Tested-by: Hugo Baigue <hugobaigue2004@gmail.com>
>
>
> Thank you and thank you for the valuable data!
>
> > Hardware: ASUS ZenBook 14X OLED UX5400EA, BIOS UX5400EA.308, kernel
> > 7.1.9-arch1-2.
>
>
> From 4e3dd920fb000e866f15401d503736195d1522d4 Mon Sep 17 00:00:00 2001
> From: Denis Benato <denis.benato@linux.dev>
> Date: Fri, 11 Sep 2026 01:51:50 +0000
> Subject: [PATCH 2/2] asus-wmi: fix screenpad power state detection
>
> It has been reported that on certain models ASUS_WMI_DEVID_SCREENPAD_LIGH=
T
> behaves organizes the bits as ASUS_WMI_DEVID_BRIGHTNESS does, therefore
> account for that in the screenpad power detection function and reuse that
> function on the screenpad init to make the code shorter and easier to rea=
d.
>
> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brig=
htness handling")
> Suggested-by: Hugo Baigue <hugobaigue2004@gmail.com>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 2c14e62d3d98..7d6426691df1 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4486,13 +4486,19 @@ static int is_display_toggle(int code)
>
>  static int read_screenpad_backlight_power(struct asus_wmi *asus)
>  {
> -       int ret;
> +       int ret, retval;
>
> -       ret =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENP=
AD_POWER);
> +       ret =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_POWE=
R, &retval);
>         if (ret < 0)
>                 return ret;
> -       /* 1 =3D=3D powered */
> -       return ret ? BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
> +
> +       /**
> +        * On certain models the LSB indicates the brightness status the
> +        * same way as ASUS_WMI_DEVID_BRIGHTNESS does, while on others
> +        * it's simply 1 on ASUS_WMI_DSTS_STATUS_BIT for power state.
> +        */
> +       return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) ?
> +               BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
>  }
>
>  static int read_screenpad_brightness(struct backlight_device *bd)
> @@ -4558,11 +4564,11 @@ static int asus_screenpad_init(struct asus_wmi *a=
sus)
>         int err, power;
>         int brightness =3D 0;
>
> -       power =3D asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREE=
NPAD_POWER);
> +       power =3D read_screenpad_backlight_power(asus);
>         if (power < 0)
>                 return power;
>
> -       if (power) {
> +       if (power =3D=3D BACKLIGHT_POWER_ON) {
>                 err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREEN=
PAD_LIGHT, &brightness);
>                 if (err < 0)
>                         return err;
> --
> 2.47.3
>
>
> > Le mer. 9 sept. 2026 =C3=A0 21:28, Denis Benato <denis.benato@linux.dev=
> a =C3=A9crit :
> >>
> >> On 9/9/26 21:20, hugo baigue wrote:
> >>> platform/x86: asus-wmi: screenpad backlight power state is never read=
 back
> >>>
> >>> Hardware: ASUS ZenBook 14X OLED UX5400EA, ScreenPad 2.0 (2160x1080 pa=
nel,
> >>> exposed on HDMI-A-2), kernel 7.1.9.
> >>>
> >>> asus-wmi registers the `asus_screenpad` backlight device and knows bo=
th
> >>> ASUS_WMI_DEVID_SCREENPAD_POWER (0x00050031) and SCREENPAD_LIGHT (0x00=
050032).
> >>> However the power state exposed through `bl_power` neither reflects t=
he
> >>> firmware state nor allows changing it.
> >>>
> >>> The firmware leaves the ScreenPad panel off at boot. While it is off =
the DRM
> >>> connector stays `disconnected`, so the panel is indistinguishable fro=
m an empty
> >>> port and no userspace can use it.
> >>>
> >>> Observed:
> >>>
> >>>   step                          bl_power   firmware (DSTS 0x00050031)=
   HDMI-A-2
> >>>   panel on                      0          0x100a0
> >>>  connected
> >>>   panel powered off by firmware 0          0x10000                   =
   gone
> >>>   write bl_power 0 / 1 / 0      0          0x10000                   =
   gone
> >>>   DEVS 0x00050031 =3D 1 via ACPI  0          0x100a0
> >>>  connected
> >>>
> >>> Two distinct problems:
> >>>
> >>> 1. `bl_power` reports 0 (FB_BLANK_UNBLANK, "on") while the panel is p=
owered
> >>>    down. Nothing reads the state back from the firmware, so the attri=
bute is
> >>>    stale from the moment the firmware changes it on its own =E2=80=94=
 which it does on
> >>>    boot, on resume, and whenever the panel brightness is driven low.
> >>>
> >>> 2. Writing `bl_power` does not restore the panel. Calling the same de=
vice id
> >>>    directly through acpi_call does:
> >>>
> >>>      echo '\_SB.ATKD.WMNB 0x0 0x53564544 b3100050001000000' > /proc/a=
cpi/call
> >>>
> >>> Consequence: on this machine the ScreenPad is unusable without an out=
-of-tree
> >>> helper, even though the driver already knows the device id needed to =
drive it.
> >>>
> >>> A related detail that may matter for the fix: on this firmware, writi=
ng a low
> >>> brightness value to /sys/class/backlight/asus_screenpad/brightness (t=
ested 0, 1,
> >>> 30, 50, 100, 120, 150) makes DSTS 0x00050031 return 0 and the DRM con=
nector
> >>> disappear. Brightness and power appear to be a single firmware settin=
g, so
> >>> clamping or refusing low values may be needed alongside the state rea=
d-back.
> >>>
> >>> The DSDT also exposes three device ids in the same family that the dr=
iver does
> >>> not use: 0x00050033 (returns a constant, likely a presence flag), 0x0=
0050034
> >>> (toggles a bit in the EC), and 0x00050035 (writes EC commands 5 and 6=
 on the
> >>> same path as POWER).
> >>>
> >>> Workaround and full analysis:
> >>> https://github.com/izigower/asus-screenpad-linux
> >>
> >> Hi,
> >>
> >> can you try the patch at the endo of this email please?
> >>
> >> I am already tracking this, but progress has been slow. In theory this=
 is a regression,
> >> and this patch solves it but I can't understand if it is solving it fu=
lly or not.
> >>
> >> From e9f4d0ef00c4f3e1ba26db68a688e523a743e733 Mon Sep 17 00:00:00 2001
> >> From: Denis Benato <denis.benato@linux.dev>
> >> Date: Wed, 5 Aug 2026 16:05:36 +0000
> >> Subject: [PATCH] platform/x86: asus-wmi: fix unclear usage of bd->prop=
s.power
> >> The bd->props.power is checked in parts of the driver correctly compar=
ing with
> >> BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.powe=
r
> >> and !bd->props.power, moreover in certain checks the logic has been
> >> inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wr=
ong
> >> usage and the inconsistencies by using proper comparisons.
> >> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/b=
rightness handling")
> >> Closes: https://lore.kernel.org/all/178362762638.911488.85648925483316=
79884@eldamar.lan/
> >> Closes: https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99=
c9@linux.dev/
> >> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> >> ---
> >> drivers/platform/x86/asus-wmi.c | 12 +++++++++---
> >> 1 file changed, 9 insertions(+), 3 deletions(-)
> >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/as=
us-wmi.c
> >> index 8610663b8269..3600dddd8f36 100644
> >> --- a/drivers/platform/x86/asus-wmi.c
> >> +++ b/drivers/platform/x86/asus-wmi.c
> >> @@ -4500,7 +4500,8 @@static int update_screenpad_bl_status(struct back=
light_device *bd)
> >> u32 ctrl_param =3D bd->props.brightness;
> >> int err =3D 0;
> >> - if (bd->props.power) {
> >> + switch (bd->props.power) {
> >> + case BACKLIGHT_POWER_ON:
> >> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL)=
;
> >> if (err < 0)
> >> return err;
> >> @@ -4508,12 +4509,17 @@static int update_screenpad_bl_status(struct ba=
cklight_device *bd)
> >> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_par=
am, NULL);
> >> if (err < 0)
> >> return err;
> >> - }
> >> + break;
> >> - if (!bd->props.power) {
> >> + case BACKLIGHT_POWER_OFF:
> >> err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL)=
;
> >> if (err < 0)
> >> return err;
> >> + break;
> >> +
> >> + default:
> >> + pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.p=
ower);
> >> + return -EINVAL;
> >> }
> >> return err;
> >> --
> >> 2.47.3
