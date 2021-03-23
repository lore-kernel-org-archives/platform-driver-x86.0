Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3DEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 19:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B37C6619C8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 19:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhCWT4p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 15:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59904 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231666AbhCWT4V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 15:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616529378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8vRsMQ+sfRfDVRWc4E1WN8Yx9M3DrPO7l6jjTBCQXyA=;
        b=XaWcxKne14qd8gFMATdJ2dt72uRmxYVnoMJ1UzKeS3XGDZ78NDbjqq3Ay3wPAtQeDvUUAD
        VjVVwe0AwCcqJVQsG2lqd0rr95fAmlIJ0XnaMJN2SSLnOemPil+5PilVAx2QKOQbrO2IKa
        R6oC9AXoE/AxB6CMV7wcJQmtFitjK/0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-PjN4yk23Pa-5jWrTxlIyaQ-1; Tue, 23 Mar 2021 15:56:16 -0400
X-MC-Unique: PjN4yk23Pa-5jWrTxlIyaQ-1
Received: by mail-ed1-f72.google.com with SMTP id h2so1480193edw.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 12:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8vRsMQ+sfRfDVRWc4E1WN8Yx9M3DrPO7l6jjTBCQXyA=;
        b=quNtQydcDxAHHLAz4UaEq/Ghn14ZIwEN3nPdOQwkoJ2T1i3wNaAIDkE2rVf55ylyiO
         GLlUbNqWaq3IrytKewD0lh0dzkVXJGVxB1MXb9x5bS/rWrUklbiM90kGTCbxjFO6f/Px
         JOaw9Mcd3lPCTBhPSdCqYvnFMw0YjdT/PWIXjDFY5HfqxND1o0HsUqQb5HAGFhhzvuVb
         n3JGS4v1y6NB6VFtXFElPGUhVNb/2N0HPs1ZLKJW8Cnz6WbNslhGVBfdHaXXuwjLri2W
         b4djHHtjxwAhlU/Yaw2IKv2rXuSmjEMIpoVqLeEGK7Hkf1z+sGv3dis6C1Y6sEp/NYAG
         216A==
X-Gm-Message-State: AOAM533wE7iypK0oTZDJC6fK9DovizX+71tKw/7fiW8fFQ/vBYvbinko
        h6hsk/2o7Sgtp2uGtDKtcH2suoxZ/eu7lUopktpO8GQpKLy4krPPP/lW/Jgb9zTvwp03GuOInnL
        0eG4zg2fjH+ltZ/DYFLBuEceTBDbyy2axjg==
X-Received: by 2002:a17:907:9709:: with SMTP id jg9mr6358706ejc.276.1616529374850;
        Tue, 23 Mar 2021 12:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5eSG03WTPXO6UbAZOOvNIUSID357ZEHF4QL9u4Y/vqiWyzai9kXrV9wEAPPNlJIdYpoWVVA==
X-Received: by 2002:a17:907:9709:: with SMTP id jg9mr6358692ejc.276.1616529374679;
        Tue, 23 Mar 2021 12:56:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ga28sm7046278ejc.82.2021.03.23.12.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 12:56:14 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus-wmi: Disable fn-lock mode by default
To:     Luca Stefani <luca.stefani.ge1@gmail.com>
Cc:     chiu@endlessm.com, Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210316221747.90829-1-luca.stefani.ge1@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2b060044-1010-4c8c-571f-b037d96670bb@redhat.com>
Date:   Tue, 23 Mar 2021 20:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316221747.90829-1-luca.stefani.ge1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/16/21 11:17 PM, Luca Stefani wrote:
> * On recent ZenBooks the fn-lock is disabled
>   by default on boot while running Windows.
> 
> * Follow the same paradigm also here.
> 
> Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>

This will be a behavioral change for many users where their F-keys will
now all of a sudden work different after boot under Linux then they
did before.

As such this seems like a bad idea, so I'm not going to merge this patch.

What might be an option is adding a module-option which allows users to
configure the default setting at boot that way, while keeping the current
default.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 9ca15f724343..32319f7d6e17 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2673,7 +2673,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
>  
>  	if (asus_wmi_has_fnlock_key(asus)) {
> -		asus->fnlock_locked = true;
> +		asus->fnlock_locked = false;
>  		asus_wmi_fnlock_update(asus);
>  	}
>  
> 

