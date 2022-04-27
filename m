Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABF8C43217
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbiD0OTT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237612AbiD0OTI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1290046679
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651068956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jfrCYBmgNfx3UkSpKJ/gizRw9xsmCVdtEotY33U+oT4=;
        b=eEyOOkBE/G7T2Nii+6hm/lHK2tVEueYVJxz6WIMRh24/guqyhdihSs6v7+fCGa98ffO9tJ
        R83XnYlnIWp8Tdt577p3xXmEZ9F/ILOeG9vF+r4INN7R6wSK29SCINXZtd2j1i1Mz3JNrL
        S+y02FE5GDwT0y6djB1xbcboSSANkGI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-k-agZ6CLNKmXvj34OMVXHg-1; Wed, 27 Apr 2022 10:15:54 -0400
X-MC-Unique: k-agZ6CLNKmXvj34OMVXHg-1
Received: by mail-ed1-f71.google.com with SMTP id r26-20020a50aada000000b00425afa72622so1050037edc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jfrCYBmgNfx3UkSpKJ/gizRw9xsmCVdtEotY33U+oT4=;
        b=nkA3csLpiJAyc/6oTVvkM0lGIfkuxDPUNboa6hJbebBh8S6tPghW8X4JmEAYQDP6F+
         4eVReQdHOMMEofx3ESsKEi7U5iZO/G518Qzj42ahaSvFq3hn0dWeCGSnId3tmBMkn0iy
         bhzNbU4lTOSkfDCZ46vdalAluvlG5RhRGzzrKanCjsq7jdoeAH+EedaMJXoSRlG/AlEv
         6gis8z/ftIVqlT+k0HYiX9BbwSPCKf7Zt9Qswmsu2VxLm3VL9AmfELhjfZSU93EX9Fav
         aCgtPDoxpseLC6XwEO1JvsPthFVol+SpWtUmIL6GnYQpig0P0C0uPd2zdT5rqUhYL2xk
         FwMA==
X-Gm-Message-State: AOAM530Dta8FXW8v0dyjHE/yFl7vRWf7wDEd/iKBaeaqvlhGhWuRSQdF
        5dNRnXdgnnlbqtw103HtBzeA7MTT11BAGzjjCkztPIAgy8TJnbffqdt/0uOvB2XOAJrPUBAWKPm
        kvd8rjcNLfCo1ozcZK07oIQMeZK/yVha5XA==
X-Received: by 2002:a17:907:9705:b0:6f0:2b25:784e with SMTP id jg5-20020a170907970500b006f02b25784emr4318891ejc.76.1651068953322;
        Wed, 27 Apr 2022 07:15:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw71pFoZ3LyNw7YtmhbF/K76Nqsn0Umq2y5C9EWCH3aICiwmHN8QKPy9H91qA1qA+p469p/VQ==
X-Received: by 2002:a17:907:9705:b0:6f0:2b25:784e with SMTP id jg5-20020a170907970500b006f02b25784emr4318861ejc.76.1651068953005;
        Wed, 27 Apr 2022 07:15:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090600db00b006df6b34d9b8sm6862160eji.211.2022.04.27.07.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:15:52 -0700 (PDT)
Message-ID: <58704fe9-5621-018a-9dfd-9e26bc612992@redhat.com>
Date:   Wed, 27 Apr 2022 16:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix driver not binding when fan
 curve control probe fails
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D . Jones" <luke@ljones.dev>
References: <20220427114956.332919-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220427114956.332919-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/27/22 13:49, Hans de Goede wrote:
> Before this commit fan_curve_check_present() was trying to not cause
> the probe to fail on devices without fan curve control by testing for
> known error codes returned by asus_wmi_evaluate_method_buf().
> 
> Checking for ENODATA or ENODEV, with the latter being returned by this
> function when an ACPI integer with a value of ASUS_WMI_UNSUPPORTED_METHOD
> is returned. But for other ACPI integer returns this function just returns
> them as is, including the ASUS_WMI_DSTS_UNKNOWN_BIT value of 2.
> 
> On the Asus U36SD ASUS_WMI_DSTS_UNKNOWN_BIT gets returned, leading to:
> 
>   asus-nb-wmi: probe of asus-nb-wmi failed with error 2
> 
> Instead of playing whack a mole with error codes here, simply treat all
> errors as there not being any fan curves, fixing the driver no longer
> loading on the Asus U36SD laptop.
> 
> Fixes: e3d13da7f77d ("platform/x86: asus-wmi: Fix regression when probing for fan curve control")
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2079125
> Cc: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 2104a2621e50..20efcf82ce8d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2223,9 +2223,10 @@ static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
>  
>  	err = fan_curve_get_factory_default(asus, fan_dev);
>  	if (err) {
> -		if (err == -ENODEV || err == -ENODATA)
> -			return 0;
> -		return err;
> +		pr_debug("fan_curve_get_factory_default(0x%08x) failed: %d\n",
> +			 fan_dev, err);
> +		/* Don't cause probe to fail on devices without fan-curves */
> +		return 0;
>  	}
>  
>  	*available = true;

