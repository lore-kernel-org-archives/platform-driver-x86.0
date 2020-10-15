Return-Path: <SRS0=x/JX=DW=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F121C433E7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Oct 2020 20:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3127B2068D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Oct 2020 20:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfwWOrJV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732510AbgJOUYT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Oct 2020 16:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730465AbgJOUYT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Oct 2020 16:24:19 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CFEC061755
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2020 13:24:18 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w21so101357pfc.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2020 13:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJ0d6c4EP60rCT2LRDcAHtDOJU4Gyakr84hLIaJ2qWc=;
        b=NfwWOrJV56lre+cQrza+3vUgwn/gSBCX4g9s5R6eO90z66Cjv3hDG25XsNDPDr/4OE
         k3eFTvFdC8/SvvlxqV224BLtvfi7PgQWwWHn1QFycTYt7KO2QEYe0uFNcnn4ePmk3b/9
         2legcwzDsMuWWfonrYIzc6yvq7NNr+L3l3RnDtLRfVNYs4aLnP/xHV1nLwiBxVn8eaFR
         chvnDQhcVQSDCHnseQmntbzDlnTxy9TuKkwqWY0giA3xHfOU4n3gzdWEztchE3n4pPm5
         8fFccg6MvGPVhKdwsQubowuYOqO1JwRMotZ/pa+xHlu5rW2tDyv37F1NPqLMptWF4IJC
         nOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJ0d6c4EP60rCT2LRDcAHtDOJU4Gyakr84hLIaJ2qWc=;
        b=NQTJ4sy9vnsoW+JwB+VpUK0+eGkSG1m6Ieou1yEjjCGbneqC1/xyWwk78FXhNR53hZ
         4NwHg+lSMsxfDLXMnz5HrdCtwasxlk7Fvx7UlGEuoAzkZd6Akv4UyotX9EqM6A4hmmT2
         RhYZZ7zg2SHE9TRHXSfmCbwa6iSoCuM+7Rvbq7VNtnliCE9CUZBSFodO56G1jxOZ5cV3
         d/OGcNb+DxlB+EnQPJS3hR8byiQ8is4M/9JbQm6Hh0T5J4oVvPMq43tLr1JaSKaQWIa9
         lLnJJ0rYoDbTPvaDiZi7yf7isT2eSkO+VArsclGEa4hLy9D00GR1ooYIbpm/Kj+1JbOu
         2lDg==
X-Gm-Message-State: AOAM532FFyJaoVgxC6p7IkJUc1uIedpdJVmi/Kihkcx9Y2GbSwEjaOxQ
        DfpUcyZHt39FX0hWYqS0hz/brxZX6eQPR2iH3R4BhEc2A3yjSA==
X-Google-Smtp-Source: ABdhPJzrR6ggnjlQJ2DHB0kTX2+hIas9Pfo4CZTlup7IO0Qnwe5bh3HK7FWCyEpea1ZeosYDc8xd7PLwonQEZX2sK0k=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr343772pfn.73.1602793458326; Thu, 15 Oct
 2020 13:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201015194949.50566-1-hdegoede@redhat.com>
In-Reply-To: <20201015194949.50566-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 15 Oct 2020 23:25:07 +0300
Message-ID: <CAHp75VevOaZTF5RH8NsERBsL7SK6D4mDAYKB56OkNpQySYM7kg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Predia
 Basic tablet
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Oct 15, 2020 at 10:50 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add touchscreen info for the Predia Basic tablet.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index dda60f89c951..26cbf7cc8129 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -623,6 +623,23 @@ static const struct ts_dmi_data pov_mobii_wintab_p1006w_v10_data = {
>         .properties     = pov_mobii_wintab_p1006w_v10_props,
>  };
>
> +static const struct property_entry predia_basic_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-min-x", 3),
> +       PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1144),
> +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-predia-basic.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data predia_basic_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = predia_basic_props,
> +};
> +
>  static const struct property_entry schneider_sct101ctm_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -1109,6 +1126,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_BIOS_DATE, "10/24/2014"),
>                 },
>         },
> +       {
> +               /* Predia Basic tablet) */
> +               .driver_data = (void *)&predia_basic_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "CherryTrail"),
> +                       /* Above matches are too generic, add bios-version match */
> +                       DMI_MATCH(DMI_BIOS_VERSION, "Mx.WT107.KUBNGEA"),
> +               },
> +       },
>         {
>                 /* Point of View mobii wintab p800w (v2.1) */
>                 .driver_data = (void *)&pov_mobii_wintab_p800w_v21_data,
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
