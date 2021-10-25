Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE7CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Oct 2021 21:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F15B46109D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Oct 2021 21:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbhJYVby (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Oct 2021 17:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31460 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233673AbhJYVbw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Oct 2021 17:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635197369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UIAILnvmh2/9j33N6oAfYSNJRTmxRzsLhCUoA4trZck=;
        b=bawaqQcXyOmee01AU3+g0l2vVGB8ev1pBzv70N/t8dMxyxfdEC9WquK+7htWgmDl9hyumd
        4tCqBbde8ZwryIhPweFrOwj7HlZLQKR2GAVizNq+F0e+xaKQGdMaMGhIUyhFwWuNxT1yZb
        9nCWy29xqmi8ptFrBbvu6iLJQi3pyns=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-SO4em3eMMp2S4Jt8YRCubg-1; Mon, 25 Oct 2021 17:29:27 -0400
X-MC-Unique: SO4em3eMMp2S4Jt8YRCubg-1
Received: by mail-ed1-f72.google.com with SMTP id g6-20020a056402424600b003dd2b85563bso8438574edb.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Oct 2021 14:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UIAILnvmh2/9j33N6oAfYSNJRTmxRzsLhCUoA4trZck=;
        b=Eaz9GnhuM71YNtOuotWoIhUJ2bDmVTEoniBIJlZnnbgdjWqDNrciv5Kyk6AA43RCFQ
         XjgM2OeBGxrchOkgFJ8M7TTHQ3rO1I7cWLTafpZaLJr4z/BuTkjoQm7Pjri9ha1gVhml
         7s5dKJbRrzh5JqB6GKNe1s6iezC2yMTyeUODVBupkQzFdIuFiRURw+e/Ga3qOqvCXRUc
         cTvuHp1m9mdn37CvcJAKRGRj9qMISW+AjNVhbWeCmWB1FbdJsCPMYLnQ/DDaqyEdEG3j
         vrxNOgPTeGxwSipyTwYp5N6amQ2uZWerDDdTxdh7Lmp/QAIF/zZmrMBte9JvNLy7uwFg
         zzBA==
X-Gm-Message-State: AOAM533+tZwCq1VrPbpKZn7KHdHRQR9OTQ6Keq9bdbv6rMKtH1lK1kPa
        DW7h+56qdCktVyUo/lUjGCOTCggLZQ5ThZjyxMgvf8890pgekJ2HeU8/NRWM0SMYgT1IL9/0HbL
        VJ3uIzIrn699VvamTSC7OTi2FS5AqX0lrjw==
X-Received: by 2002:aa7:d597:: with SMTP id r23mr20892318edq.173.1635197366527;
        Mon, 25 Oct 2021 14:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBXicjEvqfzjQGmMrGMrVfZ0t6sWdigCRR5A3wK4GkKr68KFXxwwGJi7WxzddZAAO7jdFklQ==
X-Received: by 2002:aa7:d597:: with SMTP id r23mr20892299edq.173.1635197366371;
        Mon, 25 Oct 2021 14:29:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b9sm9733063edk.62.2021.10.25.14.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 14:29:26 -0700 (PDT)
Message-ID: <92c26aee-d3eb-258c-a0dd-e09783db6a20@redhat.com>
Date:   Mon, 25 Oct 2021 23:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: Tree for Oct 25 (drivers/platform/x86/amd-pmc.c)
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <af7d7b8f-45fd-53c5-a8c4-1f594a16111e@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <af7d7b8f-45fd-53c5-a8c4-1f594a16111e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/25/21 22:50, Randy Dunlap wrote:
> On 10/25/21 2:49 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> There seems to be something amiss with cnosole output in today's release
>> (at least on my ppc qemu boot tests).
>>
>> Changes since 20211022:
>>
> 
> on x86_64:
> 
> ../drivers/platform/x86/amd-pmc.c: In function ‘amd_pmc_verify_czn_rtc’:
> ../drivers/platform/x86/amd-pmc.c:428:30: error: ‘CONFIG_RTC_SYSTOHC_DEVICE’ undeclared (first use in this function); did you mean ‘CONFIG_RTC_HCTOSYS_DEVICE’?
>   rtc_device = rtc_class_open(CONFIG_RTC_SYSTOHC_DEVICE);
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~
>                               CONFIG_RTC_HCTOSYS_DEVICE

Hmm, yes using either CONFIG setting is a problem since it is not always
defined. Both simply default to "rtc0" though and this is also which
standard distro configs use.

Mario, can we just replace CONFIG_RTC_SYSTOHC_DEVICE with "rtc0"
here to fix this ?

Regards,

Hans

