Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DAFC0015E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Aug 2023 15:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjHFPUJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Aug 2023 11:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjHFPUI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2023 11:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95799E50
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Aug 2023 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691335160;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AhfpOREeEhVXZ8cxJasLZg5Zec9o2IwuXj0XyZAWd8M=;
        b=DNMp0kbv2Pr4HccbsxOuUCccXXVVYfTAzEGn/RGXEjiQ6Tp4HVlA8lTbE2bVVL/XO+JYaI
        UHT/pvtI0Jh7XP8Lb5ezKaGaO5QTcPUPlIlR13XKiCGjlOnwaZf6/eVc8gDXAvqioeORYk
        P27YNaq95asIG1ivyZo9XYy6JFnjkuY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-OvaXOJ1RPlmt7VVEXI9mOw-1; Sun, 06 Aug 2023 11:19:19 -0400
X-MC-Unique: OvaXOJ1RPlmt7VVEXI9mOw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99bc8f1290eso246063866b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Aug 2023 08:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691335158; x=1691939958;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhfpOREeEhVXZ8cxJasLZg5Zec9o2IwuXj0XyZAWd8M=;
        b=i70IribcRTGUteW/tS9LwxKxN7Dpx9IbNERgj/WXDOaq+R3CyP93XH3Shd7FROq2cv
         8FFgbU7T1I2MXGLT0Hg+Ya8PJiSk9KtGu12H21DFfnRO48QHz00YFPrSAXnJh83vhOpW
         YPDikx7catfg0f3rmQTi//YfTNuAbdk8TFuT3BecvBNyI5ceevdbjaXLcdQaBTw4nq5R
         66wx7ofuaOKQw5CNFxqrXde5EPsfpvCiCqPuwitec6RxdtgbvWxSjGiw6q9y3IiwfXDu
         Wm+UVaa6bklz4jOS/tNQsPT4M6fJpr+LhdJaGwQcdFwnNSQlJiB03Gcahd624kC2jhTS
         +sjw==
X-Gm-Message-State: AOJu0YxdV2w/G+sFdY4u5FvXPnwyvEEy60cVHkYgulzGqaFw5dFwj+C5
        vm489jnErtcEevSZwGmOCNyOl3gPUPAhQP3VqZB3vcQ9z1wa0TENl8xxkDVJ3JnIYEhlgAV6v6I
        47X4wSjF+3qkOSU3gNjy+DgPiZrBVIQAC9g==
X-Received: by 2002:a17:907:2cd4:b0:970:c9f:2db6 with SMTP id hg20-20020a1709072cd400b009700c9f2db6mr5334971ejc.63.1691335158316;
        Sun, 06 Aug 2023 08:19:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHilB2YSqkhczP2772KNrt8XqRol0iVm73acAAU4kmFWAZNv16hlcyPfHrwapBfuOIbfu/Tsg==
X-Received: by 2002:a17:907:2cd4:b0:970:c9f:2db6 with SMTP id hg20-20020a1709072cd400b009700c9f2db6mr5334956ejc.63.1691335157934;
        Sun, 06 Aug 2023 08:19:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gl23-20020a170906e0d700b009894b476310sm3993690ejb.163.2023.08.06.08.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 08:19:17 -0700 (PDT)
Message-ID: <37523499-5226-dcca-3b7c-87b92815bd12@redhat.com>
Date:   Sun, 6 Aug 2023 17:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     August Wikerfors <git@augustwikerfors.se>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Linux Input Devices <linux-input@vger.kernel.org>,
        ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
        Linux x86 Platform Drivers 
        <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
 <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
 <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
 <cc9e37b4-b5cb-fd4d-84b8-5b824afe710a@redhat.com>
In-Reply-To: <cc9e37b4-b5cb-fd4d-84b8-5b824afe710a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/5/23 15:09, Hans de Goede wrote:
> Hi,
> 
> On 8/4/23 17:26, August Wikerfors wrote:
>> On 2023-07-30 06:49, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> Lo!
>>>
>>> On 30.07.23 04:41, Bagas Sanjaya wrote:
>>>>
>>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>>
>>>>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>>>>
>>>>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
>>>
>>> That is a AMD Ryzen Laptop. And if that really started from
>>> v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
>>> by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
>>> Mario. Hence adding him to the list of recipients.
>>
>> Confirmed now, see https://bugzilla.kernel.org/show_bug.cgi?id=217726#c9
>>
>> #regzbot introduced: a9c4a912b7dc7ff922d4b9261160c001558f9755
> 
> We just have received 2 bug reports for Fedora which I believe are also
> this issue (not confirmed yet):
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2229165
> https://bugzilla.redhat.com/show_bug.cgi?id=2229317
> 
> I'm going to create a Fedora 6.4.y test-kernel with a9c4a912b7dc7ff
> reverted.
> 
> IMHO we really should revert a9c4a912b7dc7ff upstream,
> at least for the 6.4.y series where it seems to be doing
> more harm then good.
> 
> And propably also for 6.5-rc# for now until we figure out
> a better solution.

Testing has shown that reverting also fixes the 2 Fedora bugs.

I have submitted a revert of a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks") upstream now, because I believe that that is the best way to fix the regressions caused by this (until we figure out a better way to deal with the kbd interrupt trigger-type issues):

https://lore.kernel.org/linux-acpi/20230806151453.10690-1-hdegoede@redhat.com/

Regards,

Hans

