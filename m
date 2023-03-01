Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD1EC6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 15:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjCAPVb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 10:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjCAPVb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 10:21:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265CF3BD86
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 07:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677684041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I9PLhUPgXsFPO46O1k5X0ux8B04J6DdtkiKJuHD24Pw=;
        b=OY3oafhvMQsF5icFz92c+W6dv1bg/zYjUpNY3BknSStyIXR1fXd6KLp9lvRWVmY3dgew6W
        oTWFJWCtKu0jaEepxsNVKddxy/h+mewjVb+0KsRD6EiAqnIK5AixrA3ORh4Ko4r2psElte
        XQXiP1xWURZicQinhYEZ/mlCXzH19Jw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-gpoegFazM_SYFCh6NGr5pQ-1; Wed, 01 Mar 2023 10:20:13 -0500
X-MC-Unique: gpoegFazM_SYFCh6NGr5pQ-1
Received: by mail-ed1-f70.google.com with SMTP id g33-20020a056402322100b004b0e54e03acso18875188eda.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 07:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9PLhUPgXsFPO46O1k5X0ux8B04J6DdtkiKJuHD24Pw=;
        b=PNo21sGBdK12Ll98ATkhyMCO+zm1G4TCsx04FItcMMYxeMF+4NsUe0nTFmED5SvUps
         wCbwuFM4qxefdbydaUGGQlH59h26BNXjQlexVGASCsEbdQCZoh3hjXbRxSZabqV4VdGA
         yolt8gULoe1RK7AtbN4QEvi1FDAFl/U2LuEG4lx+IF55MMcIrjEASTHMeQ+w52bISXoE
         TgBCxb/6o7wqVsx61QHA8+xZWPGA4vDmwOdMnW2wqLpJL/yE15UGTSNXm/MCQ2o79Ca1
         WzWGhHVCWNttA/U4ZDf1NB8TwsrD9GXKoKysHh+1TP4bvQX/m1+fevBySqiq5hvAWU9f
         AOvQ==
X-Gm-Message-State: AO0yUKUc16Sq6iYPt5q+l1AFZE4KUJy0dyjjBB6vkmeQKASCGggRra7c
        D1OT17QiMtvsfWWigmrat/LcZBwgb7YzwxodenhJEzZnHN9vTGqB63UbQWqZvJ2DNtgrhclmyIf
        VukL2+WIvdA2AFy5I7otUaVflCisfjiABdg==
X-Received: by 2002:aa7:d1d7:0:b0:4ae:f496:ee2 with SMTP id g23-20020aa7d1d7000000b004aef4960ee2mr7726241edp.20.1677683995431;
        Wed, 01 Mar 2023 07:19:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+QSlCrmFMIC/zxzoI/m/QqcHexE7g2arSSSPKak958kQzqX8fQfK0Lhl2bv/Oa+MjTWLKugQ==
X-Received: by 2002:aa7:d1d7:0:b0:4ae:f496:ee2 with SMTP id g23-20020aa7d1d7000000b004aef4960ee2mr7726223edp.20.1677683995178;
        Wed, 01 Mar 2023 07:19:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f18-20020a50a6d2000000b004bbfec0cd51sm919499edc.10.2023.03.01.07.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 07:19:54 -0800 (PST)
Message-ID: <03e01393-f9ab-30d2-ba0b-e2f5022c43e9@redhat.com>
Date:   Wed, 1 Mar 2023 16:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
Content-Language: en-US, nl
To:     Nikita Kravets <teackot@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230214132522.32631-1-teackot@gmail.com>
 <83AkxqZKq3bgBwaStV4wlfKJ_gH589YsVpodZGlDzxEydljNFJWfJG8cesFfH_cr5n7YaxxqIRQUxSuiGSgQiHZJkb_q1GoJgtrIGFNChzg=@protonmail.com>
 <CAPXvF06Gr_Dh9NukoTmnpd+s4uNJaVOvXjmkhQ7NVOnOie1xjg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPXvF06Gr_Dh9NukoTmnpd+s4uNJaVOvXjmkhQ7NVOnOie1xjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Before diving into a full review of the driver I thought
it would be good to first catch up with the email thread sofar.

I agree with everything discussed so far. One clarifying remark
below:

On 2/15/23 22:27, Nikita Kravets wrote:

<snip>

>> This will start poking the embedded controller when the module is loaded, regardless of the platform. I am not sure that is desirable.
> 
> It only reads though, can it cause any harm?

I have seen cases where some weird (i2c) hw reacts to
reads as if they are writes.

But since this is using the standardized ACPI EC access
routines I believe that doing reads should generally
speaking be safe.

Also it seems that atm the module must always be loaded
manually ?

I don't see any MODULE_ALIAS or MODULE_DEVICE_TABLE entries
in the driver to make it auto-load.

I think this should get a dmi_system_id tables with known
MSI DMI_SYS_VENDOR() matches in there + a
MODULE_DEVICE_TABLE() pointing to the dmi_system_id table
to have the driver auto-load on MSI systems.

I think what we should do here is:

1. Get the module in the mainline kernel
2. Do a blogpost asking MSI laptop users to test
3. Assuming testing does not show any regressions / issues
   (it will likely show lots of unsupported fw versions)
   add the MODULE_DEVICE_TABLE().

Regards,

Hans


