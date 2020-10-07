Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E18C4363D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 14:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DC61208C7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 14:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InlvT154"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgJGOVT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50390 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728053AbgJGOVT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 10:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602080477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1q7e9dcumNsDzc8Ar/Spb1H/OiCsYQsapPR2RaO1VLU=;
        b=InlvT1549CwoEPd4GQkad3GaIRzJbQw83s7ajW60EAydUQ86qy0SUq7OZ4aLgEqzEde9Q3
        falZumc3gnvgjaX1CuOYjSzyxHVoe0UMG67Uhd8vPNmzPh7x165GO3oDiv2/v8PeQcwxyz
        r4R7LOKnudxzgfFRUEAqht6SmydS5+4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-aumgyHmBOYSh_j_ztPbHIA-1; Wed, 07 Oct 2020 10:21:15 -0400
X-MC-Unique: aumgyHmBOYSh_j_ztPbHIA-1
Received: by mail-ed1-f69.google.com with SMTP id u24so968472edv.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 07:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1q7e9dcumNsDzc8Ar/Spb1H/OiCsYQsapPR2RaO1VLU=;
        b=pdQjw/YSLeIeOueEplLb00/ZCV8iO+0QmNF2XoY6ZKJYgVhnzeJr+8KwlGlQeIzd2S
         gkFx0npvaPeh+L1S0W7u/0LN9mh+2LnGYMsmScxMCx7gbZb0YQFi9Jz32GrW4nlh1eOe
         cDUZv8NdhNFaWtRzfgq338J0MQp6JnV1E+hGSN4FILYZQeF45R5c820CEVHJVMsNRdrZ
         BMoF03jhLztU1ce/ogEzRiTT9oH9mmQdB9gQvFpU4uMQD4n2ZFmHakZXVpNQCMU5BRli
         2rm/vIzkn8RF1Bi3juuNqmiCiRQ02uI/b36yW2oJuL5dv6oks/n3ZQXjuFXzKjZZw0mt
         y+Ww==
X-Gm-Message-State: AOAM531b7t932TUtfc3PbT+sSbOHmr5Mxd9b07AtE1Tt+U7p7jTJEbod
        S3C99uWX9S/dGsF5eWQxCdVvIqvTcQWZw7XKZwjYOmwOBpKydtcbjrEh6EIgFXvopXpIjiN2fkI
        0k8bg2bWZFo22QamHYKaeDp8yBjnplV7H0A==
X-Received: by 2002:aa7:d4d8:: with SMTP id t24mr3915936edr.247.1602080474105;
        Wed, 07 Oct 2020 07:21:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/utpohranSdojRVlf0BTc14Nk1aVMKRu7rU75JnW1e74B5vbtr7pp3pXaWWpvMIRphd/K2w==
X-Received: by 2002:aa7:d4d8:: with SMTP id t24mr3915917edr.247.1602080473878;
        Wed, 07 Oct 2020 07:21:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m25sm1567836edp.36.2020.10.07.07.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 07:21:13 -0700 (PDT)
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
To:     Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
 <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
 <DM6PR19MB26362F0581FA78C7E777BF56FA0C0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
Date:   Wed, 7 Oct 2020 16:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/20 5:23 AM, Gerardo Esteban Malazdrewicz wrote:
>  From bda6b6db0d76186ff37ffce8ac836379447ef2bc Mon Sep 17 00:00:00 2001
> From: Gerardo Malazdrewicz <36243997+GerMalaz@users.noreply.github.com>
> Date: Sat, 3 Oct 2020 07:43:02 -0300
> Subject: [PATCH] dell-smbios-base: Consider Alienware a Dell system

These lines are no supposed to be part of the body of the email
and the actual patch itself has been line-wrapped breaking it.

I've fixed this up manually this time. But next time please use
git send-email to submit patches to avoid breakage like this.

Thank you for your patch, I've applied this patch to me review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be added
to the platform-drivers-x86/for-next branch and eventually will be
included in the pdx86 pull-request to Linus for the next merge-window.

Regards,

Hans



> 
> Alienware has been a subsidiary of Dell since 2006.
> 
> 2020 Alienware laptop:
> $ sudo dmidecode | head -3
> # dmidecode 3.2
> Getting SMBIOS data from sysfs.
> SMBIOS 3.2.0 present.
> $ sudo dmidecode | grep -A 29 "OEM Strings"
> OEM Strings
> 	String 1: Alienware
> 	String 2: 1[099B]
> 	String 3: 3[1.0]
> 	String 4: 4[0001]
> 	String 5: 5[0000]
> 	String 6: 6[D0, D4, D8, DA, DE]
> 	String 7: 7[]
> 	String 8: 8[]
> 	String 9: 9[]
> 	String 10: 10[1.3.0]
> 	String 11: 11[]
> 	String 12: 12[]
> 	String 13: 13[P38E002]
> 	String 14: 14[0]
> 	String 15: 15[0]
> 	String 16: 16[0]
> 	String 17: 17[0000000000000000]
> 	String 18: 18[0]
> 	String 19: 19[1]
> 	String 20: 20[]
> 	String 21: 21[]
> 	String 22: <BAD INDEX>
> 	String 23: <BAD INDEX>
> 	String 24: <BAD INDEX>
> 	String 25: <BAD INDEX>
> 	String 26: <BAD INDEX>
> 	String 27: <BAD INDEX>
> 	String 28: <BAD INDEX>
> 
> 2013 Alienware laptop:
> OEM Strings
>          String 1: Dell System
>          String 2: 1[05AA]
>          String 3: 14[2]
>          String 4: 15[0]
>          String 5: String5 for Original Equipment Manufacturer
> 
> Don't know when the OEM String changed.
> Change tested in the 2020 laptop, loads dell_smbios without further
> issues.
> 
> Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar>
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>   drivers/platform/x86/dell-smbios-base.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-smbios-base.c
> b/drivers/platform/x86/dell-smbios-base.c
> index 2e2cd565926aa..5ad6f7c105cf3 100644
> --- a/drivers/platform/x86/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell-smbios-base.c
> @@ -564,7 +564,8 @@ static int __init dell_smbios_init(void)
>   	int ret, wmi, smm;
>   
>   	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> NULL) &&
> -	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> NULL)) {
> +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> NULL) &&
> +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Alienware",
> NULL)) {
>   		pr_err("Unable to run on non-Dell system\n");
>   		return -ENODEV;
>   	}
> 
> 
> 

