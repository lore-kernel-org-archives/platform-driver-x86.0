Return-Path: <SRS0=eaFJ=DK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B0BC41604
	for <platform-driver-x86@archiver.kernel.org>; Sat,  3 Oct 2020 13:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 470D2206C9
	for <platform-driver-x86@archiver.kernel.org>; Sat,  3 Oct 2020 13:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N8tWnEDD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgJCNAp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 3 Oct 2020 09:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33492 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgJCNAp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Oct 2020 09:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601730043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DJcuDDzqqtan9iylMnxuN+SD33Vkn7wSIF3r5x/KSWk=;
        b=N8tWnEDDoPUHWpm8M8qmjdgXO01u+3AGURRfmhcYALARu+HdquIocdRk+Bvk9ry2KAuW9t
        +mI6qGe4jUfcq3qXzotgMMXEAXma0zNjJi4yyhl3UqSc82XWHPJb38sazVrv9Ijxv8HUDc
        9G1al/Zs0jKZ3SztmJ38elHYEb1sbFY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-F_GWEX5YPNOFfLwz8B97dw-1; Sat, 03 Oct 2020 09:00:42 -0400
X-MC-Unique: F_GWEX5YPNOFfLwz8B97dw-1
Received: by mail-ed1-f70.google.com with SMTP id g16so2195083edy.22
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Oct 2020 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DJcuDDzqqtan9iylMnxuN+SD33Vkn7wSIF3r5x/KSWk=;
        b=ZaL9ZA+YGTe7LUSclac52I4L27m/LiBNdDmVDdQCXGXQeHQaxv3vVAPOWgt1ths9t6
         pC45wHy4Zd/G0Jqc+I0NfaxxAGf0A9G179/brxJlpp/6BRpdVcGfHQyV0YzGPJbfQq2D
         7sdgrugWj3tlDgYeJLDulrcPkXscdveVOZStUkgHoOADZrxsmAmrDXE7J7coonUxgNj0
         tGqNPq2ySucXEopKFnOvgWs8vG59MNURBNLCp9CrRc9/IvBaR3XAZlew4D1cula3/3Qx
         ZcDBwGGA+wSirhKEMLtEmKLrgtdzzvnasvtYxYfcitYORk0vNQHC1hKCysNWBivgYWKu
         cbPw==
X-Gm-Message-State: AOAM531Gw8tu1rZ2xWm3UDSqjrmErvoybXR7Xl5SVN3f8i+WXq0SfB/O
        ZUERA/mAX0bN4dl/W1yK5mu5vCajWDhccLMa9kkmZCM7sVfPY1ePZCzWiJ+SufsXbB41V3QAbe5
        4yW/grY0Cy7LcB6Qp1AkmeE57qlUgJLKIzg==
X-Received: by 2002:aa7:d501:: with SMTP id y1mr8318895edq.29.1601730040297;
        Sat, 03 Oct 2020 06:00:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVxFBuLnuJd1QcoRry7+eoHHCkXH2ctn9/h0bykyZq3I8n6Jwl5rq/YjmQTrAwDuki6RCPFA==
X-Received: by 2002:aa7:d501:: with SMTP id y1mr8318869edq.29.1601730040112;
        Sat, 03 Oct 2020 06:00:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f28sm4235220edc.94.2020.10.03.06.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 06:00:39 -0700 (PDT)
Subject: Re: [ PATCH: 1/1] dell smbios driver : Consider Alienware a valid OEM
 String
To:     Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <de108a8c-672f-4136-dc80-9ad7f14cea32@redhat.com>
Date:   Sat, 3 Oct 2020 15:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d17b7266b3bcc433477cf4f3b89e0b5cbf0126cb.camel@malazdrewicz.com.ar>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/3/20 1:52 PM, Gerardo Esteban Malazdrewicz wrote:
>  From bda6b6db0d76186ff37ffce8ac836379447ef2bc Mon Sep 17 00:00:00 2001
> From: Gerardo Malazdrewicz <36243997+GerMalaz@users.noreply.github.com>
> Date: Sat, 3 Oct 2020 07:43:02 -0300
> Subject: [PATCH] dell-smbios-base: Consider Alienware a Dell system
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
> Thanks,
>          Gerardo

The "Thanks, Gerado" bit is a bit weird for in a commit message,
otherwise this looks good to me (please wait for further feedback
before sending a v2 though).

Mario, what is your take on this, do you think this change is ok,
or might this cause some issues ?

Regards,

Hans






> 
> Signed-off-by: Gerardo E. Malazdrewicz <gerardo@malazdrewicz.com.ar>
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

