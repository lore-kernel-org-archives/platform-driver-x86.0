Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2997C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 May 2022 20:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235187AbiEBUsR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 May 2022 16:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiEBUsR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 May 2022 16:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 57CE2EBA
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 May 2022 13:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651524285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nB4XWB6DtEwsiJKv47yOoLg6qiV091VAjWRgKsjHDpA=;
        b=PJtmDBudTucseXfXATadUSUTS8E+rd6pE/YF3ECRi0bAMIsbXv7tr2KIyIjaEqv1eoBLJx
        eGMENZoQxVwj5ytXrvc4wX91bL56ritBkqjKDOwiSzpBDTOO7mSWVsqpBoxdtoZtqGidOl
        991X/EfBGQbrPMCPLXuPU3fx1iDXOKk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-DxhN0jUnPg-JZCK3Ux3QQw-1; Mon, 02 May 2022 16:44:44 -0400
X-MC-Unique: DxhN0jUnPg-JZCK3Ux3QQw-1
Received: by mail-qt1-f200.google.com with SMTP id f24-20020a05622a1a1800b002f396578cbbso7082508qtb.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 May 2022 13:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=nB4XWB6DtEwsiJKv47yOoLg6qiV091VAjWRgKsjHDpA=;
        b=3RpP+4N1yP52n5sk7aL5pQZPusqR7vE9p4MeAJC0ZoLPHkUHs2nwzW80fwmRfFNgmt
         DEoc8yasLQK7tQbXRMRij6HEL389lYaTdknmXRlbgbh6NpKvCzju6WVpbhvDcgra5mXK
         Gow6QGWbYkWGXopAxALxAdIZqrlbkwYBvmSZ8jJQVgdLfMs+v0lbibm/nmeWbATrnQwL
         qVvgHW3+iWPKVLcFWXLeB+G88H7PInhWx8uoegcub3FBpANhvKZS8iya5jDRTY79eOll
         tlRrS9jQvX5ssIZt22pu13lIZGjVwJvS9zRHMB9wNQkPdMrbxNLr4UyunHaV8Txmu09j
         6vnA==
X-Gm-Message-State: AOAM5336wSOiI4cGMm4YnrRPLptth6DoILHZ+7aOqLWkQjBq5hLgl0vw
        YUJhtGTM12MhOsN6jM57wfmv08EVPNDsxeCPHa8dYTkt9MaVzV5KdD2QxOH9bzB6kKM0G6XTRwW
        /A+QZKVyGM/GixEn0FP8bS8YEQY4o7BY7IQ==
X-Received: by 2002:a0c:c784:0:b0:432:304c:a383 with SMTP id k4-20020a0cc784000000b00432304ca383mr10887019qvj.100.1651524284259;
        Mon, 02 May 2022 13:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxxuONLgfUbgHxtQuCDGWCoRIdFvFg7T/jKsUji/JwVreyO8AbV9SNuGTqj/hCMBUQ+AEr2A==
X-Received: by 2002:a0c:c784:0:b0:432:304c:a383 with SMTP id k4-20020a0cc784000000b00432304ca383mr10887003qvj.100.1651524284014;
        Mon, 02 May 2022 13:44:44 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id l13-20020ac8724d000000b002f39b99f6b0sm4558490qtp.74.2022.05.02.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:44:43 -0700 (PDT)
Message-ID: <068d86a5e72de4352c4d69f664abb04cb115ae6c.camel@redhat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Correct dual fan probe
From:   Lyude Paul <lyude@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, thomas@t-8ch.de
Date:   Mon, 02 May 2022 16:44:42 -0400
In-Reply-To: <20220502191200.63470-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
         <20220502191200.63470-1-markpearson@lenovo.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Seems to work great on my machine! The one thing it's missing is a Fixes: tag
for the commit that introduced the dual fan probing code originally. With that
fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Lyude Paul <lyude@redhat.com>

On Mon, 2022-05-02 at 15:12 -0400, Mark Pearson wrote:
> There was an issue with the dual fan probe whereby the probe was
> failing as it assuming that second_fan support was not available.
> 
> Corrected the logic so the probe works correctly. Cleaned up so
> quirks only used if 2nd fan not detected.
> 
> Tested on X1 Carbon 10 (2 fans), X1 Carbon 9 (2 fans) and T490 (1 fan)
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index f385450af864..5eea6651a312 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8862,24 +8862,27 @@ static int __init fan_init(struct ibm_init_struct
> *iibm)
>                         fan_status_access_mode = TPACPI_FAN_RD_TPEC;
>                         if (quirks & TPACPI_FAN_Q1)
>                                 fan_quirk1_setup();
> -                       if (quirks & TPACPI_FAN_2FAN) {
> -                               tp_features.second_fan = 1;
> -                               pr_info("secondary fan support enabled\n");
> -                       }
> -                       if (quirks & TPACPI_FAN_2CTL) {
> -                               tp_features.second_fan = 1;
> -                               tp_features.second_fan_ctl = 1;
> -                               pr_info("secondary fan control enabled\n");
> -                       }
>                         /* Try and probe the 2nd fan */
> +                       tp_features.second_fan = 1; /* needed for get_speed
> to work */
>                         res = fan2_get_speed(&speed);
>                         if (res >= 0) {
>                                 /* It responded - so let's assume it's there
> */
>                                 tp_features.second_fan = 1;
>                                 tp_features.second_fan_ctl = 1;
>                                 pr_info("secondary fan control detected &
> enabled\n");
> +                       } else {
> +                               /* Fan not auto-detected */
> +                               tp_features.second_fan = 0;
> +                               if (quirks & TPACPI_FAN_2FAN) {
> +                                       tp_features.second_fan = 1;
> +                                       pr_info("secondary fan support
> enabled\n");
> +                               }
> +                               if (quirks & TPACPI_FAN_2CTL) {
> +                                       tp_features.second_fan = 1;
> +                                       tp_features.second_fan_ctl = 1;
> +                                       pr_info("secondary fan control
> enabled\n");
> +                               }
>                         }
> -
>                 } else {
>                         pr_err("ThinkPad ACPI EC access misbehaving, fan
> status and control unavailable\n");
>                         return -ENODEV;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

