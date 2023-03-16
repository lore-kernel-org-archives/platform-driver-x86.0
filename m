Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F35C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 12:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjCPMCp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjCPMCo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 08:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83341BE5FA
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678968116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zsyuBqNojzRNFuOenBIPWKl1BuAwGYQDoxK4hLpZ4cY=;
        b=P5iC1fFckamhp8wWFm+ah8+4A+d29BXW82HEFiLC/EkWLAx3q22pg3MY9/QmXkpwBeL8mC
        6cIaqLtOfcW9cedjHHpGrGOc4Zehj+3lX8ultwI1R9O9ygvK4MZA3gb8htK22GKmhCeU8m
        gvJnNE6s94ssVApe+85Ex4Q2GYrSiSQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-pLkn-HBiNge2acjbQ-awNA-1; Thu, 16 Mar 2023 08:01:55 -0400
X-MC-Unique: pLkn-HBiNge2acjbQ-awNA-1
Received: by mail-ed1-f69.google.com with SMTP id z14-20020a05640235ce00b004e07ddbc2f8so2710485edc.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678968114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsyuBqNojzRNFuOenBIPWKl1BuAwGYQDoxK4hLpZ4cY=;
        b=ljhFLUkGD6UmtFDESVe8TjfiC3BXx1w5TJ8JGiS13LAgHyJOLzdCFCZONF65xvCriT
         AV+iaHGjm2QKYGTLIykRK4xhUCriQsB1fHeA2b7jBxmUXqWAu8Tyzb60nM9Eispa+f1s
         xvGXiMFy6H4lMnMKx6GI6Yq9Cv6cLjKlk4oeSHBJZnMoOiNgzKSIb0A16jdz7FDMxmQC
         wuuRqdyBVUGs5bf40mBMunAQ8R/g/MbCQSNoN8I96wOVwv2scDtzVPPFCyvgg+/O/gWy
         eSPQef7Curd+U6LtChwKOl4y5/pMOZ0AdpP8l13cagdg1+tB8FI3T+WsvJUFMmXyXG3v
         PSgA==
X-Gm-Message-State: AO0yUKWt9t0qSriBR2Wd+xg4HkqUpnFq2uiMqE7Lh8WMmsvO0F6hC6KB
        vBjksl9/4XACe1TSwexN8vCyl3+34l6FCGBzwxutuVS7ekVF9OAZx2yxRRUe7sabNW52SnkBvgp
        YmNar0iujV5oEt+zhqN1efOltAIasQfZ6/RzFCj/RGw==
X-Received: by 2002:a17:906:5792:b0:8b0:2440:3903 with SMTP id k18-20020a170906579200b008b024403903mr9941470ejq.6.1678968114003;
        Thu, 16 Mar 2023 05:01:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set+gtnpGoHAVPNrilEVy5W38KHJqcVtUHQLDqtM3ObIzoY97rGE30juaPeRQOHsnH28jbgawtw==
X-Received: by 2002:a17:906:5792:b0:8b0:2440:3903 with SMTP id k18-20020a170906579200b008b024403903mr9941437ejq.6.1678968113674;
        Thu, 16 Mar 2023 05:01:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q6-20020a50aa86000000b004af5968cb3bsm3810490edc.17.2023.03.16.05.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 05:01:53 -0700 (PDT)
Message-ID: <c8f12f66-829d-0222-9dde-80211d256e0b@redhat.com>
Date:   Thu, 16 Mar 2023 13:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
To:     Nikita Kravets <teackot@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Jose Angel Pastrana <japp0005@red.ujaen.es>,
        Aakash Singh <mail@singhaakash.dev>
References: <20230311144054.8754-1-teackot@gmail.com>
 <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
 <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com>
 <badebe08-7c9b-6f34-b938-b14c06a57985@redhat.com>
 <CAPXvF05Sp6jVGaMMPaSfFtaz=Ogt46E2fibu2Q_zBh=HnQzhGA@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF05Sp6jVGaMMPaSfFtaz=Ogt46E2fibu2Q_zBh=HnQzhGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/15/23 15:29, Nikita Kravets wrote:
> Hi,
> 
>> Note most drivers/platform/x86 drivers do indeed use /* ... */, so I would not mind if you convert the comments
> 
> Okay, I'll do it then

Thank you.

>> But I guess it might be better to put that on the TODO list somewhere and do it once the module has had some more testing.
>>
>> E.g. I should really test this on my desktop's MSI B550M PRO-VDH board and see what it does there (hopefully nothing).
> 
> By design it should fail to load on your motherboard since ec_read()
> will return with
> ENODEV if EC isn't present, or read an incompatible version if it is.
> Some testing would be good, so we can add a DMI table in the next set
> of patches.

Ok I have tested this on the 2 MSI devices I have access to:

MSI B550M PRO-VDH desktop motherboard:
-Does not have an ACPI EC device, so the first ec_read()
 fails with -ENODEV

MSI S270 (ancient) laptop
-To my surprise this one does have an ACPI EC device,
 load_configuration() fails with:
 "msi_ec: Your firmware version is not supported!"
 Note:
 1) It would be good to log the not supported version.
 2) Since hitting this is expected on unsupported models this should IMHO be changed
    from a pr_err to a pr_warn
 3) This laptop's EC is currently supported by the old msi-laptop kernel driver
    and this driver is necessary for backlight control at least.


> I have a question about naming. We have the fn_super_swap
> configuration parameter,
> but I noticed that in the kernel code the Super key is often called Meta.
> Should I also rename it to fn_meta_swap or stick with 'Super'?

Either way is fine meta/super are both used in various places of the stack. Probably best to keep it as is to keep compatibility for existing msi-ec users.

Regards,

Hans


