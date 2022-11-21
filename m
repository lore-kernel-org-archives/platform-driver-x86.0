Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDC3C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 10:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiKUK4F (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiKUK4E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 05:56:04 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B277D2AE20
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:56:02 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id s5so2048222wru.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s46gK1F3CKWqp5QyxGROepUPZGDXeJppuWXghEvWhY=;
        b=IvCR+KTUKRCutf6aN7L6Hipvpvcv3uQIzWbyo/baqJOXe5uzVO/tQMYEMc37QHFRf7
         LNJGfjNKtU3CTFnCFApB7bj1Hgai6uF539+LcuLpAI4KmDqtGrE8JG8sDfEwzq2ZO0KD
         XvM2a+AAdgPtIwjeV/Yrpi0Occ+VraT7fCx/1iYlfygPUq3DFxReebzkuhC4Bhl41xZ7
         8vC5yBNgijBqNE18VUBDPCFIACf3bm4PGtMBSiYb2GCeatnz43r/BkYwRlCPNwn4TL8T
         1ZCjcDspJmLQe6+PwLruB5hCzcN1ziNsTB+P65fS/VyO58ZqXNrbuMPLu6JgGzbAY1Mn
         7rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9s46gK1F3CKWqp5QyxGROepUPZGDXeJppuWXghEvWhY=;
        b=xGS9XygJAyPYyToumzHOcaPkfK3GaciVk8ZWu/sJFkU3H5TiDOBboyiMTqgnrlRONF
         PM0+vtfblaElRn4PWWAyUiPsCjfkksAfOnXsN3FNS/T8+dA+86dGoUktyAJhqyDv34g0
         kEozi532p4U9EEgXkfpNt6byPXkbxVKVkMmFV19izHPj5HU5L2IBZRHnU9qF/uCYJQDy
         YcF/o4OnPQ+LIDAdWLrhL8nmnNl1bke4LbzVISZQJLxRg16XUKp9agjOfB6L/0dGq1MO
         YGRagoTKfp0W6qhiEKndxHZDHzZr5PKpBvovcK/mV3etczHKPYMeNw2cA2xd5+Ir9rx/
         ge/A==
X-Gm-Message-State: ANoB5pk4aLste97K43EAWOdl3sNwJTHi/t/mIPn+8BVtgaJp4wsnUPC1
        MstzC6iYmNQoJ9xZR3q2Zg4Z3G9hYmNSHIHnVYI=
X-Google-Smtp-Source: AA0mqf7zPbqNMOFlGxgMZERfXMSJPVMPvYbEbYUQ0q8iVGGRu7pkFvEiOeC2aDYk7WlJBe6FvEDL7Q4mAqhlmZS46x4=
X-Received: by 2002:adf:e74e:0:b0:241:c0f1:a9d with SMTP id
 c14-20020adfe74e000000b00241c0f10a9dmr8210693wrn.217.1669028161062; Mon, 21
 Nov 2022 02:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20221117110244.67811-1-hdegoede@redhat.com> <20221117110244.67811-4-hdegoede@redhat.com>
 <CAKErNvq42Cs8SK=3K0+X=aSJfx=njyLqW4cobjt0xaZZk1yeqg@mail.gmail.com> <ba2ca2d1-d422-552a-ece8-ae9488b93307@redhat.com>
In-Reply-To: <ba2ca2d1-d422-552a-ece8-ae9488b93307@redhat.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Mon, 21 Nov 2022 12:55:34 +0200
Message-ID: <CAKErNvou4FG1MaaDPntgrOVV4U+cra=pO_GHSod12AcBXMZSjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] platform/x86: ideapad-laptop: Only toggle ps2 aux
 port on/off on select models
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 21 Nov 2022 at 12:07, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi =D0=9C=D0=B0=D0=BA=D1=81=D0=B8=D0=BC,
>
> On 11/20/22 16:29, =D0=9C=D0=B0=D0=BA=D1=81=D0=B8=D0=BC wrote:
> > On Thu, 17 Nov 2022 at 13:03, Hans de Goede <hdegoede@redhat.com> wrote=
:
> >>
> >> Recently there have been multiple patches to disable the ideapad-lapto=
p's
> >> touchpad control code, because it is causing issues on various laptops=
:
> >>
> >> Commit d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_s=
witch for ELAN0634")
> >> Commit a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_s=
witch")
> >>
> >> The turning on/off of the ps2 aux port was added specifically for
> >> the IdeaPad Z570, where the EC does toggle the touchpad on/off LED and
> >> toggles the value returned by reading VPCCMD_R_TOUCHPAD, but it does n=
ot
> >> actually turn on/off the touchpad.
> >>
> >> The ideapad-laptop code really should not be messing with the i8042
> >> controller on all devices just for this special case.
> >>
> >> Add a new ctrl_ps2_aux_port flag set based on a DMI based allow-list
> >> for devices which need this workaround, populating it with just
> >> the Ideapad Z570 for now.
> >>
> >> This also adds a module parameter so that this behavior can easily
> >> be enabled on other models which may need it.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > On Z570:
> >
> > Tested-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>
> Thank you for testing!
>
> > A few notes for Z570:
> >
> > 1. Touchpad toggle still works properly after this series of patches.
> >
> > 2. My laptop's EC reenables the touchpad on boot and on resume, and
> > this behavior still works after this series.
> >
> > 3. Patch 2 stops sending "spurious" key press events on resume, which
> > actually make sense on my laptop, when the touchpad is reenabled on
> > resume. Maybe we should send a key press, but only if the state
> > changed? (However, for some reason I don't see the OSD for this even
> > before this series.)
>
> I'm not sure if sending the key-press and thus showing the OSd makes
> sense in resume even if the state did change.

On one hand, if the state changes, it makes sense to send an event. On
the other hand, there was no real key press, so we shouldn't send
KEY_TOUCHPAD_ON, a key press event. I'm not sure which of these
behaviors is standard, so it's up to you to decide.

> The OSD typically is
> used to confirm an action by the user. If the touchpad is always
> re-enabled after resume then the user will get uses to that quick enough
> and showing an OSD for this will just be a distraction IMHO.

For some reason, I don't see the OSD on resume, even if the driver
sends KEY_TOUCHPAD_ON.

>
> > 4. The sysfs attribute for touchpad doesn't exist on my laptop, but it
> > would still make sense if we made it read only. Right now there is a
> > module parameter to force enable this sysfs attribute, but it's
> > created as read-write, and writes are no-op.
>
> Hmm, since the sysfs attr is normally not there at all (now) and
> since the module option help text says:
> "This may not work on all models."
>
> I think that having writing to the sysfs file succeed but not do anything
> is not really a problem.
>
> I guess we could change the sysfs attr visibility to 444 on models
> with priv->features.ctrl_ps2_aux_port set, but that seems making
> the code unnecessarily complicated given that the sysfs attr is hidden
> by default now anyways.

The initial default was to show the sysfs attribute everywhere, not
sure why it was hidden afterwards...

BTW, I forgot to mention that I found out that there is the
conservation_mode sysfs attribute that shows on Z570, but it's a
no-op. Probably the following condition is not enough to discover this
feature reliably:

        if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBM=
C"))
                priv->features.conservation_mode =3D true;

> Regards,
>
> Hans
>
>
>
>
> >
> >> ---
> >>  drivers/platform/x86/ideapad-laptop.c | 29 ++++++++++++++++++++++++++=
-
> >>  1 file changed, 28 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/=
x86/ideapad-laptop.c
> >> index eb0b1ec32c13..1d86fb988d56 100644
> >> --- a/drivers/platform/x86/ideapad-laptop.c
> >> +++ b/drivers/platform/x86/ideapad-laptop.c
> >> @@ -143,6 +143,7 @@ struct ideapad_private {
> >>                 bool hw_rfkill_switch     : 1;
> >>                 bool kbd_bl               : 1;
> >>                 bool touchpad_ctrl_via_ec : 1;
> >> +               bool ctrl_ps2_aux_port    : 1;
> >>                 bool usb_charging         : 1;
> >>         } features;
> >>         struct {
> >> @@ -174,6 +175,12 @@ MODULE_PARM_DESC(set_fn_lock_led,
> >>         "Enable driver based updates of the fn-lock LED on fn-lock cha=
nges. "
> >>         "If you need this please report this to: platform-driver-x86@v=
ger.kernel.org");
> >>
> >> +static bool ctrl_ps2_aux_port;
> >> +module_param(ctrl_ps2_aux_port, bool, 0444);
> >> +MODULE_PARM_DESC(ctrl_ps2_aux_port,
> >> +       "Enable driver based PS/2 aux port en-/dis-abling on touchpad =
on/off toggle. "
> >> +       "If you need this please report this to: platform-driver-x86@v=
ger.kernel.org");
> >> +
> >>  /*
> >>   * shared data
> >>   */
> >> @@ -1507,7 +1514,8 @@ static void ideapad_sync_touchpad_state(struct i=
deapad_private *priv, bool send_
> >>          * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> >>          * KEY_TOUCHPAD_ON to not to get out of sync with LED
> >>          */
> >> -       i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD=
_AUX_DISABLE);
> >> +       if (priv->features.ctrl_ps2_aux_port)
> >> +               i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I=
8042_CMD_AUX_DISABLE);
> >>
> >>         if (send_events) {
> >>                 ideapad_input_report(priv, value ? 67 : 66);
> >> @@ -1615,6 +1623,23 @@ static const struct dmi_system_id hw_rfkill_lis=
t[] =3D {
> >>         {}
> >>  };
> >>
> >> +/*
> >> + * On some models the EC toggles the touchpad muted LED on touchpad t=
oggle
> >> + * hotkey presses, but the EC does not actually disable the touchpad =
itself.
> >> + * On these models the driver needs to explicitly enable/disable the =
i8042
> >> + * (PS/2) aux port.
> >> + */
> >> +static const struct dmi_system_id ctrl_ps2_aux_port_list[] =3D {
> >> +       {
> >> +       /* Lenovo Ideapad Z570 */
> >> +       .matches =3D {
> >> +               DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> >> +               DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
> >> +               },
> >> +       },
> >> +       {}
> >> +};
> >> +
> >>  static const struct dmi_system_id no_touchpad_switch_list[] =3D {
> >>         {
> >>         .ident =3D "Lenovo Yoga 3 Pro 1370",
> >> @@ -1642,6 +1667,8 @@ static void ideapad_check_features(struct ideapa=
d_private *priv)
> >>                 set_fn_lock_led || dmi_check_system(set_fn_lock_led_li=
st);
> >>         priv->features.hw_rfkill_switch =3D
> >>                 hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
> >> +       priv->features.ctrl_ps2_aux_port =3D
> >> +               ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_por=
t_list);
> >>
> >>         /* Most ideapads with ELAN0634 touchpad don't use EC touchpad =
switch */
> >>         if (acpi_dev_present("ELAN0634", NULL, -1))
> >> --
> >> 2.38.1
> >>
> >
>
