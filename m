Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB33CC05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 16:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbjBJQSC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 11:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbjBJQSB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:18:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD8D1114A
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676045843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LyNJHBjkPhp6dO6qdq/8uwmfPNug6xuTeDuV5tQxfC4=;
        b=D2pC0XFtoW6FMIDelBPF+LFkn9MTvySUL8FNf2vMFymG1TIuCmJV4S26ZEvDB8x6/rtwFr
        zo2y1Ky7MbH7k4n/KRnfDCV4q4jY9wX7ZuHXJezJE8NZP6GGKxKGEakRWOHHgqazH5e+Dq
        1kS85Q6rVnoRhu/mppMr0Q0Wg506mgI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-X_JFtZaKMaCoyqRdHFjzlw-1; Fri, 10 Feb 2023 11:17:22 -0500
X-MC-Unique: X_JFtZaKMaCoyqRdHFjzlw-1
Received: by mail-ej1-f72.google.com with SMTP id qn8-20020a170907210800b0088eda544bd6so3893707ejb.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyNJHBjkPhp6dO6qdq/8uwmfPNug6xuTeDuV5tQxfC4=;
        b=KZ1f9bmse//6woKksY5dVxmbVh4dTY+jUiBzrzGHHzSwSzVXUdkGlvgPzjz1riBVqe
         lPFoL262lqJvqTDRgXjxkQu17uhcvoWR0e8MUaz/Qzuro8Vk47xEsorDN5xe+KX6l66H
         c+6740Qd+ft3FMgf9LRoTLMF4wIfZNmyoYFfNYAYAwut4mLD5bqVLSY0uGY/QuBVNgZR
         qZMDJXWPAxxtDSA7T/aVr58b2I+yKA+alCXJsXBg4vNtMnfDPSuEDAa/ao1/JJUvlbJP
         PwHsJTTrUId4/77/Z0Ptb+krhrUp2AJXKwPLF+50tetL/Pw9FvD4Tx43kf5VtSd3NzQQ
         X/Aw==
X-Gm-Message-State: AO0yUKW2geClqROYM9OKHR+TShOWXXDmXGEwtR1Jqkp+x4VSQjuzXJGC
        Wuu4pHPLdPtPtj/Jzh/aJSYCbg2dMI1hZU28zrLWKxMvlao6V1TkKUqwzoNqiQd0b5eF0kbE2ZX
        LBydNIhTQ2GVz15gOmnPI8fzj7OKbqGJTSg==
X-Received: by 2002:a17:907:25cb:b0:8af:4344:f0df with SMTP id ae11-20020a17090725cb00b008af4344f0dfmr6357647ejc.53.1676045841548;
        Fri, 10 Feb 2023 08:17:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+gBeXkhc1IPf4hXsbQVr4xDTTRiW50KVy4Ei+fRQ/sh+hbadAX/JuzukZxhPW7KlIRfTiuMA==
X-Received: by 2002:a17:907:25cb:b0:8af:4344:f0df with SMTP id ae11-20020a17090725cb00b008af4344f0dfmr6357638ejc.53.1676045841359;
        Fri, 10 Feb 2023 08:17:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906768c00b007bff9fb211fsm2564885ejm.57.2023.02.10.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:17:20 -0800 (PST)
Message-ID: <e9f6202f-af0a-baab-b50b-b9152842e290@redhat.com>
Date:   Fri, 10 Feb 2023 17:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/4] Updates to amd_pmc driver
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/23 16:08, Shyam Sundar S K wrote:
> This patch series includes:
> - Add num_samples message id support to STB
> - Write a dummy postcode in DRAM to get latest data
> - Add proper debug print support for STB
> - Add linebreak for code readability
> 
> v2->v3:
> - Clear msg_port flag in case of mbox command failure
> 
> v1->v2:
> - Fix incorrect pointer handling while memcpy()

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> Shyam Sundar S K (4):
>   platform/x86/amd: pmc: Add num_samples message id support to STB
>   platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
>   platform/x86/amd: pmc: differentiate STB/SMU messaging prints
>   platform/x86/amd: pmc: Add line break for readability
> 
>  drivers/platform/x86/amd/pmc.c | 40 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 

