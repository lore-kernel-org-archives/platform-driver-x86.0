Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE11C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FDAA206B2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XID1RQAP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgKXLep (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgKXLeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 06:34:44 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A53C0613D6
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 03:34:44 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 131so18229404pfb.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 03:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xU3HdMgBQvOq2QujVAbV1qhQyM0L9pa6DmkGBzS94VQ=;
        b=XID1RQAP0vDYlf5oRRdPv5XceqWnyH/VNXq0miJT7kK7mPdtVbxtt4o+yBFw1dsdSG
         aYewyCUg/v5oARopTPOWJxCDp/3CiBnHJfogAaBzWi2qKr+0c5UZr41OcYOCOwEAotRV
         ujmt867VoRCjzVF1rr8Uk6046/iHDC+3fZpozs7iLZx1Ec/9ESuxZSicybpnQoGZfhIb
         cD5GAVxtadHByq/TDqX3jV3Mkuu1+Vo6GPBsBR9AZiJ+zxNLcfcRR8/j0aQir9hRjpON
         8GzBmR3cXSgYessmoGNNQIZjLQBm+yNcx6FLD5YzaWYzDnAwOle6Yp665lDeFXckGkMy
         yo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xU3HdMgBQvOq2QujVAbV1qhQyM0L9pa6DmkGBzS94VQ=;
        b=iutHaZsmBmtga1YYSkeyHltWw2eikFvqmPt7j1cL0vmozTPpgUhNOLr1FIQB1dijVH
         zD/sNbRNb+aoOv2vEzup4Ewur10w3ZGEpzceFt9nRwxmNkd0MxX/A/76yi2ctW+pCWaz
         Q60vYH9P73z6IylQ/vovbTv1TX2WUlcWQ0p2eo/vYnLcQ3G0OKUf+6jIPhnn9cQw9R6N
         oyLCdYUWXNrh1r/PCyzexnMNQ23RJ8DajC41yNlmcay2/mnWZ+5UZmYPTmKbxgWuO/Vw
         pEDaAB/j8z9g6D9n7FA/jPawDIMAKgPlrdKdLodEUuSCCWxNC/p7GJvPt+dyplDJv2qI
         k0IA==
X-Gm-Message-State: AOAM531onFC5HcIm7jddakqlTfTLDLl1FjywvAdESmwbQzamVMnoqeFn
        bX1H8r5UTYOvwaT9+GqIn5/uSQvX7g1xQyqLXPc=
X-Google-Smtp-Source: ABdhPJxQnaMFXiPn0OG4dQ0S/i6FLdhIjhx6l9ttdxarBvlJmAQzdaoO2WZ+8AlDrXs5807v/oVfi24OW/hpsu9GgM4=
X-Received: by 2002:a62:55c6:0:b029:197:f982:e980 with SMTP id
 j189-20020a6255c60000b0290197f982e980mr3620138pfb.40.1606217683958; Tue, 24
 Nov 2020 03:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20201124110454.114286-1-hdegoede@redhat.com>
In-Reply-To: <20201124110454.114286-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 Nov 2020 13:35:32 +0200
Message-ID: <CAHp75Vfxs0H+AsKZApsd_-7FD7riTFqv9Bx05pq6gxS7MVVvmg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Irbis
 TW118 tablet
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        russianneuromancer <russianneuromancer@ya.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Nov 24, 2020 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add touchscreen info for the Irbis TW118 tablet.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Reported-and-tested-by: russianneuromancer <russianneuromancer@ya.ru>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 26cbf7cc8129..5783139d0a11 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -295,6 +295,21 @@ static const struct ts_dmi_data irbis_tw90_data = {
>         .properties     = irbis_tw90_props,
>  };
>
> +static const struct property_entry irbis_tw118_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
> +       PROPERTY_ENTRY_U32("touchscreen-min-y", 30),
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1960),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1510),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-irbis-tw118.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       { }
> +};
> +
> +static const struct ts_dmi_data irbis_tw118_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = irbis_tw118_props,
> +};
> +
>  static const struct property_entry itworks_tw891_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
>         PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
> @@ -953,6 +968,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "TW90"),
>                 },
>         },
> +       {
> +               /* Irbis TW118 */
> +               .driver_data = (void *)&irbis_tw118_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "IRBIS"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "TW118"),
> +               },
> +       },
>         {
>                 /* I.T.Works TW891 */
>                 .driver_data = (void *)&itworks_tw891_data,
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
