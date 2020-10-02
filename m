Return-Path: <SRS0=yw7w=DJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C32EC4363D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 14:54:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07BA420708
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 14:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN7DLpVY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387990AbgJBOyU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387919AbgJBOyU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Oct 2020 10:54:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52768C0613D0
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2020 07:54:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q18so922184pgk.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2020 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBUQBoNwK2IqioMfsl/sD8gWfhAHIOihfzF2P2GWXc8=;
        b=nN7DLpVY4DaLqQyKsC9lYrF3XhBBC5b9V2sgIJA7yeHPrQHstBWgyFqtQ/89WjbxBJ
         Cm0riJQ7woavw2kqSxZMAtGGYtaekLxUYz36JULIkiDQqmNr6G/CJVVGc8funBxvtruz
         AMJeY8+MWgqiJVHo3iVxWTPICvgPkaCTJ3f4ZkRs28JPHKjKvL7qVX9Wz5MDzh5iRW60
         HdF2f/3Z4PHNVwpMOF3q0j6MVFjFn+RWZjMhwHZSk6tynnznhW5rFhIZr6JIvGrQ0heB
         gxuJQ7FXZfLneT0Fu8rfXi/oCKBMePvkhHUbHTk5af4LNGiuGfl7+s+kbGQnsjkiDrS+
         ix1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBUQBoNwK2IqioMfsl/sD8gWfhAHIOihfzF2P2GWXc8=;
        b=e1k2a7RXOFK/dxqNLb856kOu8SFpVldKQHfVmcq6MyIVlF6/qCU9VbAVaeWeVnsx2D
         UpJGVFX4Z0/e5tvfgy0dC2rxqgqIeXqE0ya3eI626pYzeb+89JUk9kQZFp8gAZegJM6D
         hnVQ2h4etaulZn1XamBDq0g7ZmbYp735Exmk65DdbH6LL4h/CjswiniaHhYO9W2n9Rbo
         p7a15+iMssFolVEqmAlCEaeF484MCpdo5GA+jdJIj6AgISJAChkebxuyabqSlF4ZDRd4
         yNj1TIKL/5ROH86Niw5KwRQlANAJghd7vi4qd95hrnp11voDSVcFI12wGHdDqyx9QuD5
         wB1g==
X-Gm-Message-State: AOAM530UXNXAWUfYU1AsKC4nC2PpQSX4lr8FcIEbXIzXqZGG3HSgb2Sm
        7MsdSNlyVebqO5fi/iIG92SREUj5Cwwj+zYxhZY=
X-Google-Smtp-Source: ABdhPJxNnGhMUqL6JAWXCuDYj4QVeDWe8di0sX5g2qdggEtYNymohXg72io3JsinI9cJd4bmtS2/xQ3y67yK+UGGRu0=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr2472789pgj.74.1601650459718;
 Fri, 02 Oct 2020 07:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200930131905.48924-1-hdegoede@redhat.com>
In-Reply-To: <20200930131905.48924-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Oct 2020 17:54:01 +0300
Message-ID: <CAHp75VcoyvpvfpfpcNa_j4oTRQV2Cyue+RJ33AdYz+q8uyCFag@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Switch to an allow-list for
 SW_TABLET_MODE reporting
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Barnab1s PY1cze <pobrn@protonmail.com>,
        Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 30, 2020 at 4:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> 2 recent commits:
> cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE
> on the 9 / "Laptop" chasis-type")
> 1fac39fd0316 ("platform/x86: intel-vbtn: Also handle tablet-mode switch on
> "Detachable" and "Portable" chassis-types")
>
> Enabled reporting of SW_TABLET_MODE on more devices since the vbtn ACPI
> interface is used by the firmware on some of those devices to report this.
>
> Testing has shown that unconditionally enabling SW_TABLET_MODE reporting
> on all devices with a chassis type of 8 ("Portable") or 10 ("Notebook")
> which support the VGBS method is a very bad idea.
>
> Many of these devices are normal laptops (non 2-in-1) models with a VGBS
> which always returns 0, which we translate to SW_TABLET_MODE=1. This in
> turn causes userspace (libinput) to suppress events from the builtin
> keyboard and touchpad, making the laptop essentially unusable.
>
> Since the problem of wrongly reporting SW_TABLET_MODE=1 in combination
> with libinput, leads to a non-usable system. Where as OTOH many people will
> not even notice when SW_TABLET_MODE is not being reported, this commit
> changes intel_vbtn_has_switches() to use a DMI based allow-list.
>
> The new DMI based allow-list matches on the 31 ("Convertible") and
> 32 ("Detachable") chassis-types, as these clearly are 2-in-1s and
> so far if they support the intel-vbtn ACPI interface they all have
> properly working SW_TABLET_MODE reporting.
>
> Besides these 2 generic matches, it also contains model specific matches
> for 2-in-1 models which use a different chassis-type and which are known
> to have properly working SW_TABLET_MODE reporting.
>
> This has been tested on the following 2-in-1 devices:
>
> Dell Venue 11 Pro 7130 vPro
> HP Pavilion X2 10-p002nd
> HP Stream x360 Convertible PC 11
> Medion E1239T

I have reverted previous attempts and applied this one, but...

> Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
> BugLink: https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-on-kernel-5-6/22668
> BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1175599

> Cc: Barnab1s PY1cze <pobrn@protonmail.com>

...seems like a broken name to me. I'll try to fix this.

> Cc: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 52 +++++++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index e85d8e58320c..f5901b0b07cd 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -167,20 +167,54 @@ static bool intel_vbtn_has_buttons(acpi_handle handle)
>         return ACPI_SUCCESS(status);
>  }
>
> +/*
> + * There are several laptops (non 2-in-1) models out there which support VGBS,
> + * but simply always return 0, which we translate to SW_TABLET_MODE=1. This in
> + * turn causes userspace (libinput) to suppress events from the builtin
> + * keyboard and touchpad, making the laptop essentially unusable.
> + *
> + * Since the problem of wrongly reporting SW_TABLET_MODE=1 in combination
> + * with libinput, leads to a non-usable system. Where as OTOH many people will
> + * not even notice when SW_TABLET_MODE is not being reported, a DMI based allow
> + * list is used here. This list mainly matches on the chassis-type of 2-in-1s.
> + *
> + * There are also some 2-in-1s which use the intel-vbtn ACPI interface to report
> + * SW_TABLET_MODE with a chassis-type of 8 ("Portable") or 10 ("Notebook"),
> + * these are matched on a per model basis, since many normal laptops with a
> + * possible broken VGBS ACPI-method also use these chassis-types.
> + */
> +static const struct dmi_system_id dmi_switches_allow_list[] = {
> +       {
> +               .matches = {
> +                       DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31" /* Convertible */),
> +               },
> +       },
> +       {
> +               .matches = {
> +                       DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32" /* Detachable */),
> +               },
> +       },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7130"),
> +               },
> +       },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
> +               },
> +       },
> +       {} /* Array terminator */
> +};
> +
>  static bool intel_vbtn_has_switches(acpi_handle handle)
>  {
> -       const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
>         unsigned long long vgbs;
>         acpi_status status;
>
> -       /*
> -        * Some normal laptops have a VGBS method despite being non-convertible
> -        * and their VGBS method always returns 0, causing detect_tablet_mode()
> -        * to report SW_TABLET_MODE=1 to userspace, which causes issues.
> -        * These laptops have a DMI chassis_type of 9 ("Laptop"), do not report
> -        * switches on any devices with a DMI chassis_type of 9.
> -        */
> -       if (chassis_type && strcmp(chassis_type, "9") == 0)
> +       if (!dmi_check_system(dmi_switches_allow_list))
>                 return false;
>
>         status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
