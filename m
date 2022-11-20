Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D105C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Nov 2022 15:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiKTP36 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Nov 2022 10:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiKTP35 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Nov 2022 10:29:57 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F125B2B610
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Nov 2022 07:29:55 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id g12so16434891wrs.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Nov 2022 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BThqvxdM/AQBjq/OXPxC1zRSvflY5nEQCNuC2HUcmek=;
        b=bGNbMvITg5EixGpi4stJ0dNnSwGHWr3ATYSEKCiY2RC+rIKsV2LOLMXDXPR2GkB4su
         UHXTXSfZoOvChtebXT+QzxkC7r5Bc1KlfDLngxlA8tckGN1ujWmBMz39osVyx+2TCMGS
         JHou+FABmB/+/o74ltuCxeYm8CO0j/8da1Gdv//2pJ9vFYufghvqqwGZAQZPOJDPNZLz
         rfm3CpgIsHBwWAfgZL1FR1Js7NQmjF4RUZ2DnHWQNw38mQIEKMxlPej4xLIvdIwfDbYF
         qVhDEgh4iMNeRrxz6nUHHY5duQtBuqg9+OXP3Tb+SeSAVYNxyhSyGB3nP73qsIeZZn1n
         Rd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BThqvxdM/AQBjq/OXPxC1zRSvflY5nEQCNuC2HUcmek=;
        b=2rwoTxNdr7+vLeWzBoAWg9dAVWE+HaJWpsLzIOLkUBl1mIDRcBPDfmIYzhRZFru9pN
         rJ+ykj5r/+LwyKIAk0FCR0xcBxzW2LgmQDXNOa9N0XS/8B/8TvSUta0/CUso3mrxAxLX
         CjRekNMybl/XUB3V+sTXGFqbayYYP0g6Imsrz8aSA5wHYaNQ/DFqYqQrW1MglMBEHuJw
         JRa3hEm5ZQK3NBUYryk7GcjwNTCt7uycYhDREisqXvJ4W/kCZ9RceUfbOQ+Chsf4tyH9
         wzOVpcYIqBRSD2QSIUOBdhUfqn3YGdHsxqSITZyYxlAgHg8OsQJepwxCau9XwVkQ4dkX
         pq8A==
X-Gm-Message-State: ANoB5pkMIp2rtD8wVFnWYxxpzo/+3Q2R7Xyx4+lQZojlXqh4MeAwa5Qo
        UXSpG49bmGLg8w0aX2iz1vKZmM26DLVPISYnEqE=
X-Google-Smtp-Source: AA0mqf4fmW0msQmKwaNCe2sy+HgpZ3N8sfykMbUC5ocDP1gtBWFpLVuavNHz8edpHeNt1tb8nEjGPjwBKFuWhYUrYLY=
X-Received: by 2002:a5d:4a08:0:b0:236:6e2a:ac17 with SMTP id
 m8-20020a5d4a08000000b002366e2aac17mr8884147wrq.345.1668958194292; Sun, 20
 Nov 2022 07:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20221117110244.67811-1-hdegoede@redhat.com> <20221117110244.67811-4-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-4-hdegoede@redhat.com>
From:   =?UTF-8?B?0JzQsNC60YHQuNC8?= <maxtram95@gmail.com>
Date:   Sun, 20 Nov 2022 17:29:27 +0200
Message-ID: <CAKErNvq42Cs8SK=3K0+X=aSJfx=njyLqW4cobjt0xaZZk1yeqg@mail.gmail.com>
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
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 17 Nov 2022 at 13:03, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Recently there have been multiple patches to disable the ideapad-laptop's
> touchpad control code, because it is causing issues on various laptops:
>
> Commit d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634")
> Commit a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_switch")
>
> The turning on/off of the ps2 aux port was added specifically for
> the IdeaPad Z570, where the EC does toggle the touchpad on/off LED and
> toggles the value returned by reading VPCCMD_R_TOUCHPAD, but it does not
> actually turn on/off the touchpad.
>
> The ideapad-laptop code really should not be messing with the i8042
> controller on all devices just for this special case.
>
> Add a new ctrl_ps2_aux_port flag set based on a DMI based allow-list
> for devices which need this workaround, populating it with just
> the Ideapad Z570 for now.
>
> This also adds a module parameter so that this behavior can easily
> be enabled on other models which may need it.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

On Z570:

Tested-by: Maxim Mikityanskiy <maxtram95@gmail.com>

A few notes for Z570:

1. Touchpad toggle still works properly after this series of patches.

2. My laptop's EC reenables the touchpad on boot and on resume, and
this behavior still works after this series.

3. Patch 2 stops sending "spurious" key press events on resume, which
actually make sense on my laptop, when the touchpad is reenabled on
resume. Maybe we should send a key press, but only if the state
changed? (However, for some reason I don't see the OSD for this even
before this series.)

4. The sysfs attribute for touchpad doesn't exist on my laptop, but it
would still make sense if we made it read only. Right now there is a
module parameter to force enable this sysfs attribute, but it's
created as read-write, and writes are no-op.

> ---
>  drivers/platform/x86/ideapad-laptop.c | 29 ++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index eb0b1ec32c13..1d86fb988d56 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -143,6 +143,7 @@ struct ideapad_private {
>                 bool hw_rfkill_switch     : 1;
>                 bool kbd_bl               : 1;
>                 bool touchpad_ctrl_via_ec : 1;
> +               bool ctrl_ps2_aux_port    : 1;
>                 bool usb_charging         : 1;
>         } features;
>         struct {
> @@ -174,6 +175,12 @@ MODULE_PARM_DESC(set_fn_lock_led,
>         "Enable driver based updates of the fn-lock LED on fn-lock changes. "
>         "If you need this please report this to: platform-driver-x86@vger.kernel.org");
>
> +static bool ctrl_ps2_aux_port;
> +module_param(ctrl_ps2_aux_port, bool, 0444);
> +MODULE_PARM_DESC(ctrl_ps2_aux_port,
> +       "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
> +       "If you need this please report this to: platform-driver-x86@vger.kernel.org");
> +
>  /*
>   * shared data
>   */
> @@ -1507,7 +1514,8 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>          * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>          * KEY_TOUCHPAD_ON to not to get out of sync with LED
>          */
> -       i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> +       if (priv->features.ctrl_ps2_aux_port)
> +               i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>
>         if (send_events) {
>                 ideapad_input_report(priv, value ? 67 : 66);
> @@ -1615,6 +1623,23 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>         {}
>  };
>
> +/*
> + * On some models the EC toggles the touchpad muted LED on touchpad toggle
> + * hotkey presses, but the EC does not actually disable the touchpad itself.
> + * On these models the driver needs to explicitly enable/disable the i8042
> + * (PS/2) aux port.
> + */
> +static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
> +       {
> +       /* Lenovo Ideapad Z570 */
> +       .matches = {
> +               DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +               DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
> +               },
> +       },
> +       {}
> +};
> +
>  static const struct dmi_system_id no_touchpad_switch_list[] = {
>         {
>         .ident = "Lenovo Yoga 3 Pro 1370",
> @@ -1642,6 +1667,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
>                 set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
>         priv->features.hw_rfkill_switch =
>                 hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
> +       priv->features.ctrl_ps2_aux_port =
> +               ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
>
>         /* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
>         if (acpi_dev_present("ELAN0634", NULL, -1))
> --
> 2.38.1
>
