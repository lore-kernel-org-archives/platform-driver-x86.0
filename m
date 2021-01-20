Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBB3C43332
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jan 2021 17:23:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB39233ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jan 2021 17:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732366AbhATOJn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731636AbhATNKY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jan 2021 08:10:24 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A6CC0613ED
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Jan 2021 05:09:32 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id f63so6650841pfa.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Jan 2021 05:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fOs5TQhjcwhWaE0XOAI9BH4eNgS6pjrUVywi9Oej/sw=;
        b=r+y+aD2mS0nbO4il2wo3xIrDm63bVcDO5bnwOIy8LkURoFxeAyhBtNBM+jZ3c9Rurl
         LGJuizds3YBFeglVLmgp1GWsWxQBNSJOJcDJsuXZKkQ6JIYoR4sEYh26m2ExAhxmni9k
         jNEplzNWiqp51zvS0+hRt54F4mhKVziEUkPRk2k3w5Tti9ANJseVkKFu6Iy5fdhjK2+h
         TM57vQ8ZBG1JRnR1bZqMA1rP5VbjgOuPj7URrqfGaaM3OawhSwQx7m5gj1J2bqznWSbl
         xPdSiPeMFlSIUFjiEtTiZeackTmreNrgzGfkt/epc4eSkqfWCiathi4DZ0USe/uR6lS+
         u2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fOs5TQhjcwhWaE0XOAI9BH4eNgS6pjrUVywi9Oej/sw=;
        b=UaaD6MzDwYXDJ9qz8jc3ctkdhRGRmkxuuvZ8M/adhJOD1TH8Z8yvvB1vQ4fv+A4IQJ
         rY1iRDhHd8iI2rJwQ2f3ZdRlVUNOsePGjk5UjkiVI7I+GmSTdUvhZlPFCeFC+phJlsD2
         Mc/ujGOmMBAITTj29yMmYmQ5lOkLlnyFvJiwzx1hwN6xJgdFGGwAZApDml5fECCqf6XJ
         t0B+I359N8GDA+xEtX9Voe3fTsM7IO66R9r9mOsC3HC0vR8Y79kU67evAN3On/JOXtDu
         nSp78veRaAnsN7sk9roPyTMkCmywCp7lDmqgUWNfVWhmHHtv9WhSrQOQdI9H4G+cGjdA
         6r/w==
X-Gm-Message-State: AOAM531jO39ySEbdu3h5CF6AHjxDySlVA4QiUmdGqZWb9ibjTPEck7XZ
        K9PnzGdOJrHLHNOU6VME3q45X08BIS9MFDhbPps=
X-Google-Smtp-Source: ABdhPJz+Z15fyhJ4irY8tKyBnRNWMOUswvxk3aReRnfxaqqNNupKkE04EonZ07GbTTYMP2nY+c0Ow+1R3WXf/CsQjgE=
X-Received: by 2002:a65:644b:: with SMTP id s11mr9397546pgv.4.1611148171524;
 Wed, 20 Jan 2021 05:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20210120124941.73409-1-hdegoede@redhat.com>
In-Reply-To: <20210120124941.73409-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 20 Jan 2021 15:10:20 +0200
Message-ID: <CAHp75VcCX6z+AGn5EhTRq4LudWg+7vUwzU7sb4tGiLPaw4z0Sg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable tablet-mode reporting by default
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Elia Devito <eliadevito@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Stefan_Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 20, 2021 at 2:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Recently userspace has started making more use of SW_TABLET_MODE
> (when an input-dev reports this).
>
> Specifically recent GNOME3 versions will:
>
> 1.  When SW_TABLET_MODE is reported and is reporting 0:
> 1.1 Disable accelerometer-based screen auto-rotation
> 1.2 Disable automatically showing the on-screen keyboard when a
>     text-input field is focussed
>
> 2.  When SW_TABLET_MODE is reported and is reporting 1:
> 2.1 Ignore input-events from the builtin keyboard and touchpad
>     (this is for 360=C2=B0 hinges style 2-in-1s where the keyboard and
>      touchpads are accessible on the back of the tablet when folded
>      into tablet-mode)
>
> This means that claiming to support SW_TABLET_MODE when it does not
> actually work / reports correct values has bad side-effects.
>
> The check in the hp-wmi code which is used to decide if the input-dev
> should claim SW_TABLET_MODE support, only checks if the
> HPWMI_HARDWARE_QUERY is supported. It does *not* check if the hardware
> actually is capable of reporting SW_TABLET_MODE.
>
> This leads to the hp-wmi input-dev claming SW_TABLET_MODE support,

claiming

> while in reality it will always report 0 as SW_TABLET_MODE value.
> This has been seen on a "HP ENVY x360 Convertible 15-cp0xxx" and
> this likely is the case on a whole lot of other HP models.
>
> This problem causes both auto-rotation and on-screen keyboard
> support to not work on affected x360 models.
>
> There is no easy fix for this, but since userspace expects
> SW_TABLET_MODE reporting to be reliable when advertised it is
> better to not claim/report SW_TABLET_MODE support at all, then
> to claim to support it while it does not work.
>
> To avoid the mentioned problems, add a new enable_tablet_mode_sw
> module-parameter which defaults to false.
>
> Note I've made this an int using the standard -1=3Dauto, 0=3Doff, 1=3Don
> tripplet, with the hope that in the future we can come up with a

triplett

> better way to detect SW_TABLET_MODE support. ATM the default
> auto option just does the same as off.

...

> +static int enable_tablet_mode_sw =3D -1;
> +module_param(enable_tablet_mode_sw, int, 0444);
> +MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting=
 (-1=3Dauto, 0=3Dno, 1=3Dyes)");

Does it need any documentation update?

...

> +       if (enable_tablet_mode_sw > 0) {
> +               val =3D hp_wmi_hw_state(HPWMI_TABLET_MASK);

> +               if (!(val < 0)) {

Perhaps while at it you may change it to more natural
  if (val >=3D 0)
?

> +                       __set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit=
);
> +                       input_report_switch(hp_wmi_input_dev, SW_TABLET_M=
ODE, val);
> +               }
>         }

--=20
With Best Regards,
Andy Shevchenko
