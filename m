Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10B359703
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696302; cv=pass; b=T1vcxZk/utGp2rU8aEK+eCQh/lNRsg+QVP7Zr6IMGMr84wsxsxyDfn8nPkMYDH0bjDYEIUGoF3BsAPeUt87NFRltqSIb4q8mJKiXhVfAv3jydHuzPPWF3jT05SVi1l1qWyu5Jnhyp4XGJTawxJ4P4yfqaCC5qyfK3CQ3y6+u6TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696302; c=relaxed/simple;
	bh=enV8aIYhl8a+5F1vnewl2QRQSQi+7LWXPvOtFmqkxyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDOXPh832D82EnwmJOwPWkEmTgTZbdyUmnAl8b3kFCV2eKo07b4Tj/KOeoOKIT5DCItZJNvViuA4BVQ4fksYkDDguv+wcNMIyZeAfbqtksidQA//UqOw4r6IEdwPKCi7ill4ofBvUIF6utmGqy+8q+dHRzMspQw98yW0+QWiBVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JLDbm9RU; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JLDbm9RU"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ca1ba0089so4912408d50.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 14:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773696300; cv=none;
        d=google.com; s=arc-20240605;
        b=LfDpmoGeXvnht30pCNSGTHNiQeZeKQq6B/FOGBXgXTjxwB95L62R/Jr9npDxFtffWt
         sOzWP+ZMLxhBmy3lA4QzHSJ8zMHefhmBvMpxFMkaDb/V4HIkh/zvmfc4t5T71scBB1SD
         gDmpJRYi1q8EgD4lMnyAD0UpXR/EqVKT+EWiOq0f+U+qS3X9hFxiJYk0fYP80idsLfU8
         R+W0+gzO43gfRe7aSYDNTQB2btPLn1gfV8afRI5eZdWe1Im3RbXcHMk8F4NcGT1ArPBH
         smUfwsayGc6AXXlOirFgKYUuFUEZhp7NozFCFA4Tz6D7E6OF0FB3LvNvSihSxxhIIkHW
         ZqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bE1AVwIkONsf8xLpWGp2WapgQT5zJ7kfXgI+X1OpNP4=;
        fh=6EqsBHM9ebARMIVoN+fk6XQ1QaX/a0tcm6SpYSwtf9o=;
        b=Tr4YQE3wX6xuQlDk5pAsSpJnKwEJ1Kjm/LmfBrPB437NNMCRZ/DU4ZEgPPugWyFAhG
         FheW6iu87okCYw1p/iO/EL9J1fQa1RR8K6G8it/IRtVW19EzCXC1alluvMTwlB6jUEoP
         54m+n9IePJfeSXQII+AIjvwgiG7JwXEg2Cm0/h7o2+CjPQcML2kgaUi57PNmr8u/NFk9
         gOEVvaXUZN64YO8Dz5UYcYaHPw9u2GSDyHKT260oQ63JhDpExZbCiQoe4OG5mMtMvE3w
         TutghDlaErZ5G/Ss5KsIBgdfGxlS65EU3aaIl5jNiuzVxaFRanRGErdZ1lEb5wmNwDtx
         DPcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1773696300; x=1774301100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE1AVwIkONsf8xLpWGp2WapgQT5zJ7kfXgI+X1OpNP4=;
        b=JLDbm9RUCWrtOmmDQYUpP2JafJdw3eQCiH5FR5oRNqYytvSRHSQAz/kfuLoHJ7fBrv
         74CWweZmPDneDO027o7sRl54Et4eerBScio07X0gf2nzdwab2674FNuyatxgr5Mz97HC
         groaC5366UeXunfpkSY2rvKSZHuJPaXiywxuCtrAqbDRtpBlX3Bbxzv2Y+NnYkdLBHFO
         Wz1pSPwVwRaa226wEUPFEt0nHcyTu+80LoqhgRlAC8Hk7TinaDvfCANKL3wU/RqnPFMr
         T52xgbYhSp0DbjxCjhA5CHYCxWKdti2pugM7ofpsNDA5trxc7VvelD2CrdIwMbvMR8ta
         usaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696300; x=1774301100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bE1AVwIkONsf8xLpWGp2WapgQT5zJ7kfXgI+X1OpNP4=;
        b=c3J0uRgBQRr9unKuCl8vcQns8CogGGOtQ29MOTm/utfD9glmV9BAGqmwX6zTRwMzrm
         8RgralhuG5MSBZpOLFfMVcGRuANDaRb5F0XIuGHuJIa3/AOlGOXeQlBggaZTp6G+KXlW
         jyUuBNDdyJ4eZyJ354yXmevFb+GlD1QNqk7U1v9T1M0R0Q/9aCTvNoU+FyyoHGiKEnpN
         ON39LjuwMuiI6JzGQ0z8swAU8Vl4xGOqNKXLuXSRGfmKsRReeI352EotkB5ol9mxwo9h
         KTjBJzblC9it7omj0/n9lkMwRnpQOefGRHQwu3i94Z3dCxKLxoiCJAGwpVLLzrtPJ5ps
         zBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLfh5SfSnKnfthQAnxkioHMm1ldUPmigBugEbCecMotCIzGHiGyKe4+s9Uo9vBCXxpYXf38oS/KkT0JmgYOwJi2Ady@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPgcM+F6tnQ1euANVrpJwTXFxfMO0nqZlBFj4865Be/0CLFXh
	qLkdgElhm1UWhqzeZ+mRexzZAOLOUhpLf3UcJY5fSpZQCkh2RlWXCWpBizyQCfMpLp2+hTizebi
	+rpaQSycfOZAPKt4UJhPcB/kZuecHxw==
X-Gm-Gg: ATEYQzw9H2i2VmzoIPeyBFrId3hbaT7gtdTGxvgz+64p6pLhPOMdfCphufDgkNL81yI
	05eo8dPV3GJ5JnkOwwU5qFl71RWQncX9QsYE2lXY4n1I131wVGu79Onf4827m1SLqUWhiVVJW5v
	ZAZAsMZ2E2DiMGnJW7cuIbdaPEWm1WFNXEhOjKY5SvVMMtuCIdA+pb+DomSsFfAzEzw8YcWOX5F
	+WneR/I+QkwAPokzpBnJq3wkkd32jh2dnb6ZqOlzRdOjyEMmlsRXKPcBApbE8fHQWmDf3sw2jXl
	nQxFKYK20EjeEcD5aMfjuaCgIUsV6PYeS+zRgw4=
X-Received: by 2002:a53:a842:0:b0:649:c512:140c with SMTP id
 956f58d0204a3-64e6304cf59mr10751283d50.43.1773696300148; Mon, 16 Mar 2026
 14:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314142236.74514-1-pithenrich2d@gmail.com> <0b0f6ef9-ae3a-4642-85af-fbdf7ebafd1e@app.fastmail.com>
In-Reply-To: <0b0f6ef9-ae3a-4642-85af-fbdf7ebafd1e@app.fastmail.com>
From: Pit Henrich <pithenrich2d@googlemail.com>
Date: Mon, 16 Mar 2026 22:24:49 +0100
X-Gm-Features: AaiRm52cVGliAs9q4IjGiKUyA6od4dG15NoXnyj3PrNCufzx1yjn-jRLS0M3HUM
Message-ID: <CAMBPg2fCtHoA6cX3kCGN7BUARsC5UrB1he6+eC06vfrLXTtktw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Heya,

>  - We usually do the DMI_MATCH on the BOARD_NAME for quirks. I was checki=
ng psref.lenovo.com and there seem to be two distinct models for this platf=
orm, which is a bit confusing. I don't have a way to confirm that your chan=
ges will work for the other model so wondering if it's safer to do the quir=
ks for 21ES/21ET or 20RL/20RK depending on what you have in hand? (I might =
be overthinking this too)

I based this on the code in drivers/platform/x86/intel/hid.c which
also does a DMI_MATCH against DMI_PRODUCT_FAMILY.
Just for the records: I have an ES21 model, and the code in
drivers/platform/x86/intel/hid.c works for me too (correctly enables
the 5-button array).

> If I get details back on the EC spec and confirmation it's correct I'll l=
et you know :)

Awesome :)

Greetings
Pit

On Sat, 14 Mar 2026 at 19:24, Mark Pearson <mpearson-lenovo@squebb.ca> wrot=
e:
>
> Hi Pit,
>
> On Sat, Mar 14, 2026, at 10:22 AM, Pit Henrich wrote:
> > ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magn=
etically
> > attached (on the screen) via EC register 0xc1 bit 7, but thinkpad-acpi =
does
> > not expose this to userspace.
> >
> > Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
> > a DMI match. The state is read directly from the EC.
> >
> > Cache the state and emit a sysfs notification on
> > TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cach=
e during
> > hotkey setup and refresh it before the resume notification to keep the =
state
> > consistent across suspend and resume.
> >
> > Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 92 ++++++++++++++++++++-
> >  1 file changed, 90 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > index 8982d92dfd97..5b255062ff51 100644
> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > @@ -218,8 +218,9 @@ enum tpacpi_hkey_event_t {
> >       TP_HKEY_EV_LID_OPEN             =3D 0x5002, /* laptop lid opened =
*/
> >       TP_HKEY_EV_TABLET_TABLET        =3D 0x5009, /* tablet swivel up *=
/
> >       TP_HKEY_EV_TABLET_NOTEBOOK      =3D 0x500a, /* tablet swivel down=
 */
> > -     TP_HKEY_EV_TABLET_CHANGED       =3D 0x60c0, /* X1 Yoga (2016):
> > -                                                * enter/leave tablet m=
ode
> > +     TP_HKEY_EV_TABLET_CHANGED       =3D 0x60c0, /* posture change eve=
nt:
> > +                                                * X1 Yoga (2016): ente=
r/leave tablet mode
> > +                                                * X1 Fold 16 Gen 1: ke=
yboard attachment state changed
> >                                                  */
> >       TP_HKEY_EV_PEN_INSERTED         =3D 0x500b, /* tablet pen inserte=
d */
> >       TP_HKEY_EV_PEN_REMOVED          =3D 0x500c, /* tablet pen removed=
 */
> > @@ -375,6 +376,7 @@ static struct {
> >       u32 has_adaptive_kbd:1;
> >       u32 kbd_lang:1;
> >       u32 trackpoint_doubletap:1;
> > +     u32 has_keyboard_attached_on_screen:1;
> >       struct quirk_entry *quirks;
> >  } tp_features;
> >
> > @@ -2928,6 +2930,70 @@ static void hotkey_tablet_mode_notify_change(voi=
d)
> >                            "hotkey_tablet_mode");
> >  }
> >
> > +/*
> > + * On the ThinkPad X1 Fold 16 Gen 1, EC register 0xc1 reports the
> > keyboard
> > + * attachment state in bit 7.
> > + */
> > +#define TPACPI_X1_FOLD_KBD_EC_STATUS 0xc1
> > +#define TPACPI_X1_FOLD_KBD_ATTACHED  BIT(7)
> > +
> > +static bool keyboard_attached_on_screen;
> > +static bool keyboard_attached_on_screen_initialized;
> > +
> > +static int x1_fold_keyboard_attached_on_screen_get(bool *attached)
> > +{
> > +     u8 status;
> > +
> > +     if (!tp_features.has_keyboard_attached_on_screen)
> > +             return -ENODEV;
> > +
> > +     if (!acpi_ec_read(TPACPI_X1_FOLD_KBD_EC_STATUS, &status))
> > +             return -EIO;
> > +
> > +     *attached =3D status & TPACPI_X1_FOLD_KBD_ATTACHED;
> > +     return 0;
> > +}
> > +
> > +static ssize_t keyboard_attached_on_screen_show(struct device *dev,
> > +                                             struct device_attribute *=
attr,
> > +                                             char *buf)
> > +{
> > +     bool attached;
> > +     int res;
> > +
> > +     res =3D x1_fold_keyboard_attached_on_screen_get(&attached);
> > +     if (res)
> > +             return res;
> > +
> > +     return sysfs_emit(buf, "%d\n", attached);
> > +}
> > +
> > +static DEVICE_ATTR_RO(keyboard_attached_on_screen);
> > +
> > +static void keyboard_attached_on_screen_notify_change(void)
> > +{
> > +     if (tp_features.has_keyboard_attached_on_screen)
> > +             sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> > +                          "keyboard_attached_on_screen");
> > +}
> > +
> > +static bool keyboard_attached_on_screen_update(void)
> > +{
> > +     bool attached;
> > +
> > +     if (x1_fold_keyboard_attached_on_screen_get(&attached))
> > +             return false;
> > +
> > +     if (keyboard_attached_on_screen_initialized &&
> > +         keyboard_attached_on_screen =3D=3D attached)
> > +             return false;
> > +
> > +     keyboard_attached_on_screen =3D attached;
> > +     keyboard_attached_on_screen_initialized =3D true;
> > +
> > +     return true;
> > +}
> > +
> >  /* sysfs wakeup reason (pollable)
> > -------------------------------------- */
> >  static ssize_t hotkey_wakeup_reason_show(struct device *dev,
> >                          struct device_attribute *attr,
> > @@ -3032,6 +3098,7 @@ static struct attribute *hotkey_attributes[] =3D =
{
> >       &dev_attr_hotkey_adaptive_all_mask.attr,
> >       &dev_attr_hotkey_recommended_mask.attr,
> >       &dev_attr_hotkey_tablet_mode.attr,
> > +     &dev_attr_keyboard_attached_on_screen.attr,
> >       &dev_attr_hotkey_radio_sw.attr,
> >  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> >       &dev_attr_hotkey_source_mask.attr,
> > @@ -3046,6 +3113,9 @@ static umode_t hotkey_attr_is_visible(struct
> > kobject *kobj,
> >       if (attr =3D=3D &dev_attr_hotkey_tablet_mode.attr) {
> >               if (!tp_features.hotkey_tablet)
> >                       return 0;
> > +     } else if (attr =3D=3D &dev_attr_keyboard_attached_on_screen.attr=
) {
> > +             if (!tp_features.has_keyboard_attached_on_screen)
> > +                     return 0;
> >       } else if (attr =3D=3D &dev_attr_hotkey_radio_sw.attr) {
> >               if (!tp_features.hotkey_wlsw)
> >                       return 0;
> > @@ -3462,6 +3532,7 @@ static int __init hotkey_init(struct
> > ibm_init_struct *iibm)
> >       }
> >
> >       tabletsw_state =3D hotkey_init_tablet_mode();
> > +     keyboard_attached_on_screen_update();
> >
> >       /* Set up key map */
> >       keymap_id =3D tpacpi_check_quirks(tpacpi_keymap_qtable,
> > @@ -3842,6 +3913,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
> > bool *send_acpi_ev)
> >       case TP_HKEY_EV_TABLET_CHANGED:
> >               tpacpi_input_send_tabletsw();
> >               hotkey_tablet_mode_notify_change();
> > +             if (keyboard_attached_on_screen_update())
> > +                     keyboard_attached_on_screen_notify_change();
> >               *send_acpi_ev =3D false;
> >               return true;
> >
> > @@ -3998,6 +4071,8 @@ static void hotkey_resume(void)
> >       tpacpi_send_radiosw_update();
> >       tpacpi_input_send_tabletsw();
> >       hotkey_tablet_mode_notify_change();
> > +     keyboard_attached_on_screen_update();
> > +     keyboard_attached_on_screen_notify_change();
> >       hotkey_wakeup_reason_notify_change();
> >       hotkey_wakeup_hotunplug_complete_notify_change();
> >       hotkey_poll_setup_safe(false);
> > @@ -4296,6 +4371,17 @@ static const struct dmi_system_id fwbug_list[]
> > __initconst =3D {
> >       {}
> >  };
> >
> > +static const struct dmi_system_id keyboard_attached_on_screen_list[]
> > __initconst =3D {
> > +     {
> > +             .ident =3D "ThinkPad X1 Fold 16 Gen 1",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Fold 1=
6 Gen 1"),
> > +             },
> > +     },
> > +     {}
> > +};
> > +
> >  static const struct pci_device_id fwbug_cards_ids[] __initconst =3D {
> >       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24F3) },
> >       { PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x24FD) },
> > @@ -12230,6 +12316,8 @@ static int __init
> > thinkpad_acpi_module_init(void)
> >       dmi_id =3D dmi_first_match(fwbug_list);
> >       if (dmi_id)
> >               tp_features.quirks =3D dmi_id->driver_data;
> > +     tp_features.has_keyboard_attached_on_screen =3D
> > +             dmi_check_system(keyboard_attached_on_screen_list);
> >
> >       /* Device initialization */
> >       tpacpi_pdev =3D platform_device_register_simple(TPACPI_DRVR_NAME,
> > PLATFORM_DEVID_NONE,
> > --
> > 2.43.0
>
> I'm checking to see if we have the EC spec for this platform (it's not in=
 our Linux certification program).
>
> The code looks fine but some notes:
>  - We usually do the DMI_MATCH on the BOARD_NAME for quirks. I was checki=
ng psref.lenovo.com and there seem to be two distinct models for this platf=
orm, which is a bit confusing. I don't have a way to confirm that your chan=
ges will work for the other model so wondering if it's safer to do the quir=
ks for 21ES/21ET or 20RL/20RK depending on what you have in hand? (I might =
be overthinking this too)
>  - I would have called it detachable_keyboard instead of keyboard_attache=
d_on_screen. See what other reviewers think.
>
> If I get details back on the EC spec and confirmation it's correct I'll l=
et you know :)
>
> Mark
>
