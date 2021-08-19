Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7A1C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 13:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3AF6610A1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 13:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240073AbhHSNfT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 09:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24182 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239913AbhHSNfR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 09:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629380081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ps+yLkOEy/hrcU9IbnjByrznQShPQ8E81PW5BMepISY=;
        b=FBBmDXevac+tySaE7/qYSB27wKdvVHFYmSgzSWvch0k4ZH3JGyxOMtolnlbuDGLFSzs1w+
        D4GQYCcYa+bUtoagGiuaELTLxcdqAkir4r6EJPLQ8IlDKGiN8annVvOjrh8A7xTM7bDqnq
        bgzfpvSIvzdqhL5yx8LC3K0fpsX8Hxk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234--Xk3IrQmP5Sw042S7TI_Tw-1; Thu, 19 Aug 2021 09:34:40 -0400
X-MC-Unique: -Xk3IrQmP5Sw042S7TI_Tw-1
Received: by mail-ej1-f69.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso2241098ejc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Aug 2021 06:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ps+yLkOEy/hrcU9IbnjByrznQShPQ8E81PW5BMepISY=;
        b=EM7iTymIg5VVYCf+zQX6VWWbEnt/zp1J11tSFrbTp1O7sc+U4p3LsD0TQ/nJgUT8K6
         3Vx0wbRHj/YWcPg6Mi8oHJ0MrPAHUw5Mlj5N9O9mHmVo19P2ybAU5wF3Hq7H50tpFeMB
         ppLl48YluNjVNc/YmKGzrOCmfs7G27Y/LX9CrRynCwm8itJKb8N9oYgUXmay59D7P80r
         DSvlWt9FcAmllrLivvpC3syl+VGc6NHUfT/t4rP/bG5DfWpvbIHMRCx05HIdKVB+OO/+
         CuSU1k1qa53QgFD2z56KN/D82Kzf9/8Yobi1tsPRgpcTOfbJewJ6PFFAagCv00ng9nvJ
         TXLQ==
X-Gm-Message-State: AOAM531IGJZEHTld2lWA8HKEvcyrgQxymTJ6bG629ow55YgWB2PMl1X7
        9LGamDEYIIgDAbtJfulcI083C2awNeAZ8joeqoHT5BhVo84WoHjdrY9TIEsBdLtgzSUMRWnVdiq
        MIDGa4quQqqcxIaKbOLLDhLDVnMGy0xW3a6XBMwP+H0+fXsbFzIKvAo8HzG3O1tzXMV60uRDL3D
        xiMuZhKNaS6Q==
X-Received: by 2002:a05:6402:51cf:: with SMTP id r15mr16549136edd.211.1629380078898;
        Thu, 19 Aug 2021 06:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwwMpLOCS3BaI6SAkMBcbSfFImX5Pv/q+Bhb98HnIHQoJzN+K8bxXklRlSvXgJvsQvJ0ZGew==
X-Received: by 2002:a05:6402:51cf:: with SMTP id r15mr16549101edd.211.1629380078700;
        Thu, 19 Aug 2021 06:34:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id da1sm1793286edb.26.2021.08.19.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 06:34:38 -0700 (PDT)
Subject: Re: [PATCH v3 00/20] Intel platform driver code movement
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210819033001.20136-1-hpa@redhat.com>
 <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
 <CAHp75VcdOc+G1Yov9HcGhMbEqzGwemmD7=SHd3qOOsEdAqjg2Q@mail.gmail.com>
 <CAHp75VfvjVeq716d=aGvZXvmzbpW4+XG66ryVYrBxk5G5Wd6cg@mail.gmail.com>
 <a5e52890-c162-ab48-4858-3eb0e971e5a1@redhat.com>
Message-ID: <07cfd37a-cce6-56f2-0ff1-d4daeccfc67c@redhat.com>
Date:   Thu, 19 Aug 2021 15:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a5e52890-c162-ab48-4858-3eb0e971e5a1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/21 3:31 PM, Hans de Goede wrote:
> Hi,
> 
> On 8/19/21 2:14 PM, Andy Shevchenko wrote:
>> On Thu, Aug 19, 2021 at 3:03 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Thu, Aug 19, 2021 at 1:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>>
>>>> Thank you for your patch-series, I've applied the series to my
>>>> review-hans branch:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>>
>>>> With the changes mentioned in replies to individual patches.
>>>
>>> Can we postpone this a bit, please?
>>>
>>> I have a few comments here and there. I'll send asap.
>>
>> Hmm... It seems it will take less time if I simply take what you have
>> in your repo and produce a v4.
>> Would it work?
> 
> That is fine by me, I might be better to just do a small follow-up patch
> though, given that you seem to only have a few small remarks.
> 
> But if you prefer to do a v4 that is fine too. I was planning on
> keeping this in review-hans for a while anyways.
> 
> I did notice the couple of stray changes which you pointed out but
> they get corrected by other commits (or are removal of extra whitespace
> left-over from other commits), so I decided that they were harmless
> since the end-result Makefile / Kconfig files were good.

p.s.

Note that drivers/platform/x86/intel_ips.h is deliberately not moved
(for now) since it is also used by the i915 driver.

My plan is to merge a follow-up patch moving that through drm-intel-next
once 5.15-rc1 is out.

Regards,

Hans

