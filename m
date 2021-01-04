Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF0CC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3A7321D79
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbhADL55 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51027 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725830AbhADL55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 06:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609761390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PPO3p8wH39HQHRuJNW2ZsM7qvp7F52JwkVCYJQCC+mA=;
        b=cw7Hq7tfjnDWZrJKtBaPxp/x/qx4F+3WV1En4LIEHyGOM7A3J0j9GQz1tIaXNxHAlw4S0S
        hdmZ2VSQ38OYErmp8/5SZTSyB5vhn27dEnKgHWCtGBPongOeHnIZTVe7tVJLhAc8csh89I
        HNR+rXWNjMZ7q3tOWV68zozNGgqgwjI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-9mdgVojENjynNWNudSUM-A-1; Mon, 04 Jan 2021 06:56:29 -0500
X-MC-Unique: 9mdgVojENjynNWNudSUM-A-1
Received: by mail-ed1-f71.google.com with SMTP id i15so12069209edx.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 03:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PPO3p8wH39HQHRuJNW2ZsM7qvp7F52JwkVCYJQCC+mA=;
        b=gZokmuexzjOq77ik39M7JERkM1mbFwu2ijJfcriKEJnTypCjF5dfa17VWZRgv60Ed+
         5ZeiePSswbHY5h23FrPHaxbDMOqbEjbmDkfUxe1p1qEMLAnh+OdgRza6nHUw/n/M8ejC
         vrYmdcPBVO42hh8M9+5d6GYMZ4d9CFVg3pX7bID43PrjeYhfsNeIrfRX/AY986DJDv72
         nOoN7CJdiF6Ao6DpMbrzp+z2BXUsPL6B5yDiXd3nt2216BsO6A3PekoaHFDZOep+R9ZG
         R/UHYtAcO5sBJZcoW2owIHveTEPA6itzUckDSaAQkwIfAv9Stg9MmH3SswK8h9EHMF82
         zsvw==
X-Gm-Message-State: AOAM533ftMg0uTOdiTRuoOhkMhHzK3OLDI5zi9Mt7SUnhpF4DcNcF1E6
        Y8APPK/vb6v14JbdVt34KS8N33jlaQozHbs4h2T5rd7wMZ12w1AUdE9lDLOiceMDtf1DbnvhpEC
        jTL5NuMu9mwphdmvMkYPNarP0nSHDIhinAA==
X-Received: by 2002:a50:d888:: with SMTP id p8mr18605652edj.147.1609761388073;
        Mon, 04 Jan 2021 03:56:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRZNrGB86jkAjlLuv6/cPOD1ZlILuv5+EvaZXPZUh2JMyn1lszo6k7gefX0uW1jPs87KfL+Q==
X-Received: by 2002:a50:d888:: with SMTP id p8mr18605641edj.147.1609761387942;
        Mon, 04 Jan 2021 03:56:27 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id j20sm23409841ejy.124.2021.01.04.03.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 03:56:27 -0800 (PST)
Subject: Re: tools/power/x86/intel-speed-select: Fixes for regression
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201221071859.2783957-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <489cb4bb-28b5-e7c8-829e-3d58f047f514@redhat.com>
Date:   Mon, 4 Jan 2021 12:56:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221071859.2783957-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/21/20 8:18 AM, Srinivas Pandruvada wrote:
> One side-effect of fixing the scaling frequency limits using the
> commit eacc9c5a927e ("cpufreq: intel_pstate: Fix intel_pstate_get_hwp_max()
> for turbo disabled") causes stale HWP_CAP.GUARANTEED to be used as max.
> Without processing HWP interrupts, user space needs to be able to update
> a new max while Intel SST is in use. This is not a problem as the
> change of guaranteed is caused by user space action, so user space knows
> that guarantee will change.
> 
> This series causes user space to trigger scaling_max_freq update with
> the new base_frequency.
> 
> 
> Srinivas Pandruvada (2):
>   tools/power/x86/intel-speed-select: Set scaling_max_freq to
>     base_frequency
>   tools/power/x86/intel-speed-select: Set higher of cpuinfo_max_freq or
>     base_frequency

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

