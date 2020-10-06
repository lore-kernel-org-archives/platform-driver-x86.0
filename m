Return-Path: <SRS0=8/nu=DN=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE2EC4363D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 13:16:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AA3120782
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Oct 2020 13:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b40i88cR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgJFNQ1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Oct 2020 09:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725939AbgJFNQ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Oct 2020 09:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601990186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PdBabuZSKWTI/6jyRf+C+MjUr6DspUBK5sRTKQrXqpo=;
        b=b40i88cRgsA2F//q/Q+RyYfbhl+1VWP1062sVVneUzPyW0M5UvJ3X9Zz02IOgJENSvSyZW
        A1Wk3g6b7o3pTNZE09mwooc4LfF2ETwmN9hE0s1vA7h1c9cFQTEjCgeeA1BQTEJnbOdxd+
        DH+8/X8jQj61W1HM9B6awtVilc3QlEI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-kGvEiVjWMUSgYYuLK7Fi4A-1; Tue, 06 Oct 2020 09:16:23 -0400
X-MC-Unique: kGvEiVjWMUSgYYuLK7Fi4A-1
Received: by mail-ed1-f72.google.com with SMTP id u24so3410251edv.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2020 06:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PdBabuZSKWTI/6jyRf+C+MjUr6DspUBK5sRTKQrXqpo=;
        b=bMvQZLjUxIgp11KwZxGWwnfnyLYk58gQY2+aeSqwWJ4WgajK9Q+xwRVEORRZ5eDUMI
         cYyNvVCiqTuEeRtFocEjAjw/iGyobEcal3WLNHLx60fm3Uf+BQdmoIVYCtbknw5w5J0+
         UmrnG42muBB2fWxXsVSubXe8JbTZI229zpLRfuGucHaT2lZEz5lJhYOlxYtlgvKO2wxk
         /uPgBMN4f4+ThS0yLdueYWExhOMP/c7zUHHl/lqFyVGORWibW4M8goC4txkYNBK4jP9u
         RtIESnI6dAduklWFdppXiHyczZqudaflGSA6IAJtBvq0WGAV7v2Hr4gwwPyAr9UIonvp
         NIbQ==
X-Gm-Message-State: AOAM532pqO+dMzIE9YvcAisuaof3TDqr6Pc9m9Ot/h0zot32V3yjmqaB
        9Us+9ofosbaLKa+21ok1x+s/1Vyy4CKBPXIFRB2KzPRnBK8Ctpsnck/aTwdDtfbsfO3BjTIe6Cg
        +fuHw2/Dp+fKvbio4asnly0SJLT6Ae9U0PA==
X-Received: by 2002:a17:906:b858:: with SMTP id ga24mr5093870ejb.378.1601990179372;
        Tue, 06 Oct 2020 06:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH0uhqBzdvqWsKVyURtWWKV4ojXHOxPufl+ghlNRFlIs0BHg5naqns3d0IlkNpxq03ZgLKLQ==
X-Received: by 2002:a17:906:b858:: with SMTP id ga24mr5093673ejb.378.1601990177277;
        Tue, 06 Oct 2020 06:16:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id o12sm2123829ejb.36.2020.10.06.06.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 06:16:16 -0700 (PDT)
Subject: Re: intel_vbtn dead keyboard bug on Acer Aspire E5-511G
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?0JjQs9C+0YDRjA==?= <igooor7@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <CALBXvcZR8mR83Zxy-vu2MBt2uhT+chFyrXPZ1t0xNDPBmD4A1A@mail.gmail.com>
 <20201006101610.GF4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f7671652-0534-dd10-7c00-2d55132a1802@redhat.com>
Date:   Tue, 6 Oct 2020 15:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006101610.GF4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Igor,

On 10/6/20 12:16 PM, Andy Shevchenko wrote:
> +Cc: mailing list and maintainers
> 
> On Mon, Oct 05, 2020 at 05:59:40PM +0300, Ð˜Ð³Ð¾Ñ€ÑŒ wrote:
>> Good time of day!
>> Sorry for bothering you, I found a strange bug in "intel_vbtn" kernel
>> module which makes the keyboard non-responding.
>> Reproducible 100% starting from kernel 5.4.0-45 and till 5.8.0-20.
>> Everything works fine on 5.4.0-42 or on Windows 10
>>
>> As a workaround I blacklisted the intel_vbtn module and everything works
>> fine. Seems like it somehow relative to tablet mode detection patch.
>>
>> I did research and found out that this bug is affecting Acer Aspire E5-511G
>> laptops and some HP model(s).
>> Here it is: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1894017
>>
>> Looking forward to hearing something from you.
>> Thanks for your attention!

Thank you for your bug report.

This should be fixed by this upstream commit, which landed in Linus' tree a couple of hours ago:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86?id=8169bd3e6e193497cab781acddcff8fde5d0c416

Igor, if you do:

cat /sys/class/dmi/id/chassis_type

On your laptop, and the output is NOT "31" or "32" then this
fix should work for you.

If the output actually is "31" or "32 (which I do not expect),
then please let me know, because then we need a different fix.

I've also added this comment to the launchpad bug.

Regards,

Hans

