Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE62ECAAD4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 11:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiHZLRw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 07:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238911AbiHZLRr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 07:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780BADAED6
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661512665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ddvLFWr0dppIKrW1k4YJVEPcXHDgtKpWMSoYQvT/k4Q=;
        b=WPssorNoiUqAteDrERMaAr2iytEOnbFRatEELWe8ME3yGKwtSmc3XpKxpiLSsRDkVqoTle
        y5FVrG8mtvtlWsd6RvaOgSiOlkLvKfHev01U+Dg6logrG3HLVlWKBLaXjsLuUCm0CwkAXO
        arwHoNnEskPjBR650y8dPEGO6+m4ym4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-ySgCzoZJMIm02Ns0ceA-mg-1; Fri, 26 Aug 2022 07:17:44 -0400
X-MC-Unique: ySgCzoZJMIm02Ns0ceA-mg-1
Received: by mail-ej1-f71.google.com with SMTP id sb14-20020a1709076d8e00b0073d48a10e10so498256ejc.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ddvLFWr0dppIKrW1k4YJVEPcXHDgtKpWMSoYQvT/k4Q=;
        b=jurJHql6T+cInTSkJODHOnTbcrdkBKEg/naw3anmaZnlzTGkw7Q4kLzO0oje8qjIVD
         Bhigoeqd0QZFIrQMlu9ThTmsjSPgphYACGIrR3nuSrMX4uxGAsAcMsx+GAgwYrynVhKq
         z0TjpqIoqk8Q+YBNP1rk7rXdxPOVvq9tjQhgYy8ECx1YpCc22nLoki3xRcJ02OA/liXu
         mtVusksBDiSW7qbCVpfgmTm5qftjreJK6KrQqvoF0RfiM5zoy45cWNGC6F+rU/80P7J1
         47SIt+aqoyudIdEjAXozsO20Ptq+QCxvvJ8DYV3j4A67PvGbLRcqaAmwk+tf8l7Fw2hd
         vegg==
X-Gm-Message-State: ACgBeo1iBZ4t7uW9+KXtSmQQTlgH+e1Ft200cicafPheUvnRF5ttZG7n
        fTA11veTVERC9Go5pGOmM8JCsby0GELbtiOKrF75R3RZ/FwFCKFeaQNi+jDaftSD7scUlCwh8le
        P0eHkTijc8rj+Wap6ZKRiBy91jksJ5WXHvw==
X-Received: by 2002:a05:6402:320b:b0:448:a6d:495a with SMTP id g11-20020a056402320b00b004480a6d495amr102717eda.214.1661512662879;
        Fri, 26 Aug 2022 04:17:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4LcFaSwRPWKxESahT5a+8IU0GuPx0fMYLbyJ/oPzfouR+zYbMk21bQfQuMq4haGnrAVc/q5g==
X-Received: by 2002:a05:6402:320b:b0:448:a6d:495a with SMTP id g11-20020a056402320b00b004480a6d495amr102700eda.214.1661512662625;
        Fri, 26 Aug 2022 04:17:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b0073dc897e040sm791106ejg.51.2022.08.26.04.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 04:17:40 -0700 (PDT)
Message-ID: <a82bec5e-636e-5e2e-a2f4-e0867f8ec005@redhat.com>
Date:   Fri, 26 Aug 2022 13:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] platform/x86: msi-laptop: Fix old-ec check for
 backlight registering
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220825141336.208597-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220825141336.208597-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/22 16:13, Hans de Goede wrote:
> Commit 2cc6c717799f ("msi-laptop: Port to new backlight interface
> selection API") replaced this check:
> 
> 	if (!quirks->old_ec_model || acpi_video_backlight_support())
> 		pr_info("Brightness ignored, ...");
> 	else
> 		do_register();
> 
> With:
> 
> 	if (quirks->old_ec_model ||
> 	    acpi_video_get_backlight_type() == acpi_backlight_vendor)
> 		do_register();
> 
> But since the do_register() part was part of the else branch, the entire
> condition should be inverted.  So not only the 2 statements on either
> side of the || should be inverted, but the || itself should be replaced
> with a &&.
> 
> In practice this has likely not been an issue because the new-ec models
> (old_ec_model==false) likely all support ACPI video backlight control,
> making acpi_video_get_backlight_type() return acpi_backlight_video
> turning the second part of the || also false when old_ec_model == false.
> 
> Fixes: 2cc6c717799f ("msi-laptop: Port to new backlight interface selection API")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/msi-laptop.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 93ef8851b93e..54170172a666 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -1047,8 +1047,7 @@ static int __init msi_init(void)
>  		return -EINVAL;
>  
>  	/* Register backlight stuff */
> -
> -	if (quirks->old_ec_model ||
> +	if (quirks->old_ec_model &&
>  	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
>  		struct backlight_properties props;
>  		memset(&props, 0, sizeof(struct backlight_properties));

