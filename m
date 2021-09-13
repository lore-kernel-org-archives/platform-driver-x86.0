Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBDFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 10:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CB6761004
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 10:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238823AbhIMKb3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 06:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30304 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238162AbhIMKb2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 06:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631529012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DYm01P91Ca3FG+wJWOiAhFHoj1XpRfxdNcfXw92Hkac=;
        b=PswQkD30/zTCFpruqE5rVQzqxXfT8O9/Ss8wVLmoDMfCX5lUCq69L1ABhokH0nXXXDQgYQ
        5SDBqOSyLEFHyZxNH+inwVGd5dK4fmCwHuUDn+7QVm2xbsVTWvGrGC2lAYjWj8iT63fM3C
        0OeSPp6hXrpN45uK5QmnJUkexXq9m9Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-M-tbKSLEN460TtSJ8VgpAQ-1; Mon, 13 Sep 2021 06:30:11 -0400
X-MC-Unique: M-tbKSLEN460TtSJ8VgpAQ-1
Received: by mail-ej1-f72.google.com with SMTP id ar17-20020a170907265100b005eff65b9184so1305608ejc.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 03:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DYm01P91Ca3FG+wJWOiAhFHoj1XpRfxdNcfXw92Hkac=;
        b=8HnLki5eMPv9KUWlA2iXlOMLKPjPWGkUYuWK6WoKgSrsCl3BijJyOeCDGaXoLvwOIG
         66GIJqs1MMvNnhKDjQ/QTkz4baiu1tJYYvTDew2aH/wkd0agMGDeO/j8eRg0yTtMbYGT
         NCE//2GwH67ea1afIKZo1ilZ6VL0Sb2Xx9vHWnG1Rpoi3zaq1RsmYxG1ANVUzyYIbnoN
         O972nv3V+shBc9ZOOq+9DM5QIa25fYLBHwyn6SWS3qfFkYl1kmWODTfSOlf6BAT8kqR8
         bsWYK/uKJLm5qOknv6eJBJKZVh2wgm6n1Hwn867cbAO/buvXd24ZeWY+I93lvl5WzC4L
         qKEg==
X-Gm-Message-State: AOAM5316mwAatiYFWLh8VOTlFqRZcZl0csRmiGCsR5mz/MtY6JbS0Ohi
        FRrqBrOf4ohVEaEV9TeHsKI64OkjYGXOubzt/TQCwT4vWLZxVwLz7uM+PZ+8iqAwfLO58Jog457
        Kpah6IEmrKN5FxB+iws8320PvK2/rW5dDykp0f/uLR5J8aWHImu7KWHFU2lF6nHxLf5OiScXdGD
        VXKecqpJjcxQ==
X-Received: by 2002:a05:6402:2908:: with SMTP id ee8mr10162629edb.33.1631529010063;
        Mon, 13 Sep 2021 03:30:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcwlyOz9xcr8wTC6m+k64lakuBihfrj56UZcprQuqvxf2JPBgs4Lv6Kdm3XhVJ8XlSbcceiw==
X-Received: by 2002:a05:6402:2908:: with SMTP id ee8mr10162607edb.33.1631529009802;
        Mon, 13 Sep 2021 03:30:09 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id f30sm3215749ejl.78.2021.09.13.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 03:30:09 -0700 (PDT)
Subject: Re: [RFC PATCH v1 13/30] platform/x86: wmi: use dynamic debug to
 print data about events
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210904175450.156801-14-pobrn@protonmail.com>
 <cca079b3-1a55-845b-3cfc-1b0a1879484e@redhat.com>
 <bh-WuyQoOPt-bn0_bhN86zDXoltPaAI1BQ-jNRsDv_MApIiYNNhTQOslgbbiRv2KzcRq_m-N9ZtXvel-qu22r2W6m5UzUgXOLCBHPCENscE=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e7cd191-633e-3ef6-4e18-c9207eb8a19e@redhat.com>
Date:   Mon, 13 Sep 2021 12:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bh-WuyQoOPt-bn0_bhN86zDXoltPaAI1BQ-jNRsDv_MApIiYNNhTQOslgbbiRv2KzcRq_m-N9ZtXvel-qu22r2W6m5UzUgXOLCBHPCENscE=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Barnabás,

On 9/13/21 12:09 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. szeptember 13., hétfő 11:43 keltezéssel, Hans de Goede írta:
>>> -	if (debug_event)
>>> -		pr_info("DEBUG Event GUID: %pUL\n", wblock->gblock.guid);
>>> +	dev_dbg(&wblock->dev.dev, "event 0x%02X\n", event);
>>
>> The debug_event value gets set by a module-parameter and several WMI related
>> howto-s and forum threads on the web refer to this. At one point in time even:
>> https://wiki.ubuntu.com/Hotkeys/Troubleshooting
>>
>> Used to refer to this, but they seem to have dropped this.
>>
>> Either way this changes makes users have to also deal with dyndbg stuff to
>> get the same info which before they could get with just the debug_event module
>> param, which makes debugging harder, so I'm going to drop this patch from the
>> series.
> 
> Would you consider accepting a patch that changes it to:
> 
>   if (debug_event)
>     dev_info(&wblock->dev.dev, "event 0x%02X\n", event);
> 
> ?

So I've just finished reviewing the series and I've pushed it out to
my review-hans branch minus this patch and I've also dropped patch 17 as
you requested.

I've added the "event 0x%02X\n", event bit to the existing pr_info, because I agree
that printing the event is useful.

I've squashed this change into the:

"[RFC PATCH v1 23/30] platform/x86: wmi: improve debug messages"

patch since that was making the same change for the wmi_notify_debug() code.

If you want to send out a follow-up patch/series on top of my current review-hans
switching to dev_info(), then that would be a welcome improvement, but in that
case please replace all pr_info() calls with dev_info(), not just this one.

Regards,

Hans

