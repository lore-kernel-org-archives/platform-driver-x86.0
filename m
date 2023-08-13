Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC88C04A6A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 13:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjHMNAm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 09:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHMNAl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 09:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11CD1716
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691931597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xx6IS/2QmZwgaFnutuM14/dSOdQ9YI2iAsu/U1we0B4=;
        b=YPPZZwanZX+8uOYhZmR2PkvtgIJx4z6o8n5+aWlkEC1D0bAOe+yrlIA6DbtVbYwJ1w70Uv
        ICvpakexG1W6/ETMGLJ6+IPorP8R/qdsmZ0kdmukNy84R7e2+X4F6CIuYgCUiJBXaRsOSx
        v0KXCKu8+S2NXUkMQGjA7rR19r7QmwY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-1q5Vh0VkNFWxeVrd6Fxm0w-1; Sun, 13 Aug 2023 08:59:55 -0400
X-MC-Unique: 1q5Vh0VkNFWxeVrd6Fxm0w-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fe32cab9b7so3260211e87.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 05:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691931594; x=1692536394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx6IS/2QmZwgaFnutuM14/dSOdQ9YI2iAsu/U1we0B4=;
        b=GhZqEnU78kBcRBrZ+AlNx/WNkAUaEMX+WW4CAvHRh/3LPQQ3bveZZTf7S7ml2r8tDY
         3dj2JFcrOklf3u3z31i/iZNVlOoJxYoGEk/6UmPAceBtpJuxobu1X7dYIdRbcaYbw6Jg
         tVBdgGnlelk2QoP22TzivU3nak/Knvs5jRp2MiPFm+J+PxDD+FiLdrCSRg/KWCvE+5KZ
         5pyFwjn8ve0Z1AG3pm1TKCH+1+DzUP1HaBo2nhfNwmI7YKdromJMDkt9X/UGFiULBfVd
         tEx2VpJo9ELtGKQOb9qPHreHLNt8zvjoLd6Fdd1mAxVapxOwHmNgwJUlwcBJKhqTm6kV
         dCOw==
X-Gm-Message-State: AOJu0YzIcKAJXZ5QzXcSN0EtklI4TC88r5GoJJZ6tgPs5g1nj8o/+3rO
        iN80/yjljfHWZHXQp68wNpuOBDFDU2J8O83D+5nCQizKTjMXa52Z5XVXdODdk7XFRyHwP8qepnF
        KbF2sxyftlVW/KfomiXr27GTuqmzvygs7qA==
X-Received: by 2002:a05:6512:703:b0:4f8:49a7:2deb with SMTP id b3-20020a056512070300b004f849a72debmr3342615lfs.8.1691931593760;
        Sun, 13 Aug 2023 05:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYOgMTF9w4RxpDr/YwX5EdgnQ8YlkvmBjUKO1Nsu7whTwP2ooxmuiYVX4g2c/9uHKGSebWBg==
X-Received: by 2002:a05:6512:703:b0:4f8:49a7:2deb with SMTP id b3-20020a056512070300b004f849a72debmr3342608lfs.8.1691931593439;
        Sun, 13 Aug 2023 05:59:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i23-20020a1709061cd700b0099293cdbc98sm4595094ejh.145.2023.08.13.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 05:59:52 -0700 (PDT)
Message-ID: <68b690bd-f232-0637-a621-9126a189dd0d@redhat.com>
Date:   Sun, 13 Aug 2023 14:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86/siemens: simatic-ipc: fix nonsensical
 condition
Content-Language: en-US, nl
To:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        "xingtong.wu" <xingtong.wu@siemens.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Henning Schild <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20230811130948.2211800-1-arnd@kernel.org>
 <97764bad-7091-e9ed-6f49-d31861fc622f@linux.intel.com>
 <ef7d94a4-9f65-47fb-906a-4fed4480d020@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ef7d94a4-9f65-47fb-906a-4fed4480d020@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/11/23 17:02, Arnd Bergmann wrote:
> On Fri, Aug 11, 2023, at 15:17, Ilpo Järvinen wrote:
>> On Fri, 11 Aug 2023, Arnd Bergmann wrote:
>>
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The condition checking for a constant SIMATIC_IPC_DEVICE_BX_59A value
>>> clearly makes no sense, as clang warns:
>>>
>>> drivers/platform/x86/siemens/simatic-ipc.c:132:42: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
>>>                 if (ledmode == SIMATIC_IPC_DEVICE_227G || SIMATIC_IPC_DEVICE_BX_59A)
>>>                                                        ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/platform/x86/siemens/simatic-ipc-batt.c:197:49: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
>>>                 if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A || SIMATIC_IPC_DEVICE_BX_59A)
>>>                                                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Most likely, this was meant to check ledmode to be one of the two values,
>>> so change it to that.
>>>
>>> Fixes: b8af77951941e ("platform/x86/siemens: simatic-ipc: add new models BX-56A/BX-59A")
>>> Fixes: c56beff203754 ("platform/x86/siemens: simatic-ipc-batt: add support for module BX-59A")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Ok, I see. I missed those as there is hasn't been a new linux-next in
> a few days.
> 
> I suppose this one is also fixed then?
> 
> WARNING: unmet direct dependencies detected for P2SB
>   Depends on [n]: PCI [=n] && X86 [=y]
>   Selected by [m]:
>   - SIEMENS_SIMATIC_IPC_WDT [=m] && WATCHDOG [=y] && SIEMENS_SIMATIC_IPC [=y]
> drivers/platform/x86/p2sb.c:68:9: error: call to undeclared function 'pci_scan_single_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

No that one has not been fixed yet. This is the first time I've heard of this one. It seems to not have been caught by the LKP bot.

Regards,

Hans


