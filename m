Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0B4C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29C6F21D79
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbhADL6u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34867 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725840AbhADL6u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 06:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609761443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8qKepDTp4R0zcC407CreBxuHjBt5Mqx/wA9MwAN6PMg=;
        b=OlrM41gdQXc+9CYlplGwU49n+ZDNL9hyEdaxzhjV7YEQ90cuEA38KgbZDnqBSv5CwGxAm+
        Ce8a3qtBLQeaD4rlKC9fwjBP+MO9+EVbFy7s0gWFEVGGqBiLq2h+VowSwB4NL3RB3yRwit
        0vc8LtWIxg1rKi+6MqB///pp4bq/3Nw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-WP4T92SAOHu4uEzwZqDrEw-1; Mon, 04 Jan 2021 06:57:21 -0500
X-MC-Unique: WP4T92SAOHu4uEzwZqDrEw-1
Received: by mail-ed1-f71.google.com with SMTP id dc6so12037602edb.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 03:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8qKepDTp4R0zcC407CreBxuHjBt5Mqx/wA9MwAN6PMg=;
        b=uRKvmovfRmdw2Qgt/++Fs4oRQzb/OiyN+dEfivffIVTDhbDZcx6BufaIl/3/+pCQQM
         8l40LKzlzz7OWLOwWjWsdEVpAm6DzV5dAGh48U4JxL3j+hFAwNIMZ0hMbZgDJ6ZPcJ+T
         ZL7Um/oT1exYHLAhmPAU8+ofdZRV8r8yGsIDPG65C75oZERRr5/mIUrzNSx9LMtHl8sH
         DOtj/zhpQvaeNOB1TkYC8UADv9YPx6BdZa2T7yHIBGOkn0OSr9tg2jKl2BvgoRZIo1dX
         xY1IX5C3JCc446KgotGOF1LMgpB/OQccFxQff7DZJJJwW/fY7SDBWxGmQ8gU/88wgTd0
         YlLg==
X-Gm-Message-State: AOAM530iZTOqmvWZ0bnLUnmEDmqnrGP2/C+HJctmjnjEuRwQwOwFhMBY
        8Zqv09+VAoVkj7an6Kr/EbUqrsndkdafkAGgJLK2/Ma6uPKfwPfX7R5eHLtE+ZdI1TicXGh6c1p
        iz1c861lswWHtFzWE/wo7Sg6vLDmEJHe17g==
X-Received: by 2002:a05:6402:158:: with SMTP id s24mr72674262edu.19.1609761440632;
        Mon, 04 Jan 2021 03:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA5M+UosSLQuLFMOGX8p0BZQ35y3OLuyJeU+Zh98OioAWClTUkzC2I7QHGS6+yxPq/L16gEA==
X-Received: by 2002:a05:6402:158:: with SMTP id s24mr72674248edu.19.1609761440516;
        Mon, 04 Jan 2021 03:57:20 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x20sm23357764ejv.66.2021.01.04.03.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 03:57:20 -0800 (PST)
Subject: Re: tools/power/x86/intel-speed-select: Fixes for regression
From:   Hans de Goede <hdegoede@redhat.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201221071859.2783957-1-srinivas.pandruvada@linux.intel.com>
 <489cb4bb-28b5-e7c8-829e-3d58f047f514@redhat.com>
Message-ID: <a290b74e-4b04-7eb9-196e-381a45f0a2db@redhat.com>
Date:   Mon, 4 Jan 2021 12:57:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <489cb4bb-28b5-e7c8-829e-3d58f047f514@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/4/21 12:56 PM, Hans de Goede wrote:
> Hi,
> 
> On 12/21/20 8:18 AM, Srinivas Pandruvada wrote:
>> One side-effect of fixing the scaling frequency limits using the
>> commit eacc9c5a927e ("cpufreq: intel_pstate: Fix intel_pstate_get_hwp_max()
>> for turbo disabled") causes stale HWP_CAP.GUARANTEED to be used as max.
>> Without processing HWP interrupts, user space needs to be able to update
>> a new max while Intel SST is in use. This is not a problem as the
>> change of guaranteed is caused by user space action, so user space knows
>> that guarantee will change.
>>
>> This series causes user space to trigger scaling_max_freq update with
>> the new base_frequency.
>>
>>
>> Srinivas Pandruvada (2):
>>   tools/power/x86/intel-speed-select: Set scaling_max_freq to
>>     base_frequency
>>   tools/power/x86/intel-speed-select: Set higher of cpuinfo_max_freq or
>>     base_frequency
> 
> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

Note this is a templated reply, I will also cherry-pick these into the
fixes branch in this case.

Regards,

Hans

