Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B23C2BB40
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 09:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7374023ABA
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 09:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgLHJMw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 04:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40055 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728640AbgLHJMw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 04:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607418684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Ad9dVIz2TEPmfPmKHjiScQxj4MpEXhAMwys+bMreiU=;
        b=TYg8lpo2EgI1q6tKJHnrrWKDnaaMuhzylm5XD4CyjA28kfu2UMRiYLDrCMQ3QHcpcfSIA1
        47u4BEq6xjUdYYMhj7vyiwlB3u3Sv2IwtaPP26dnm5hpntdnUWlTYs8Gp1MDoSiiuPHgpe
        L2adre0gB49pjc4NSsee/vVIqEfUKTs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-i7Ug4cdfNfCAerdjSZMEQQ-1; Tue, 08 Dec 2020 04:11:23 -0500
X-MC-Unique: i7Ug4cdfNfCAerdjSZMEQQ-1
Received: by mail-ed1-f70.google.com with SMTP id h5so7138076edq.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 01:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5Ad9dVIz2TEPmfPmKHjiScQxj4MpEXhAMwys+bMreiU=;
        b=ibbebY9DivaU7mfyWz5fO7McqgMFVK1FfMXe7t0fPQsaim2To7QCQWwmIeEl1w3wfB
         aaVSf92ZZTIqSbDT1zg9El0/2m8r9xjcZ51Yjg/1zZrd9o9BU72eQ4eYvAmAcgxrhacg
         abdhpFpGgoYjzcm54X7IeQh5Nkke+VpSVfKAq6dE/wcGa2CKRG2KlIR1pneyuLWI4xCn
         oEX0Q7hmKSkv/TcXGHbi7c1Ly1rO1rnFntc2h5rRGcPHx6O8k/hgcdYxO+VCY0fGenV5
         sCIorQ22kBYR4zr95SzBbwUkkRsN2ouaIm3quKFf/iQN0UcQYY1qfkL6kKjihkqugFxp
         0U5A==
X-Gm-Message-State: AOAM531JEZAdK9KcVUYrFqYwG59gseLnNonfiO/wqPApPy0ucTFOybP8
        9S82WgIqjVJaKZp4LHKzNBR6IQKA3+NAogXV2y0b9sHxH3NL86hUzM2B3KiIEDm5+aVssunyJ4b
        jq5aFtZJATV1X/51N/85ert7fLom1QMh+/w==
X-Received: by 2002:a17:906:1194:: with SMTP id n20mr22002835eja.269.1607418682098;
        Tue, 08 Dec 2020 01:11:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw790b+pkpX7nw4XPxUqBpja8l3M/T+KRTl5nj0rMBa8xD00oQ4kISlVGPU4VL//BKIPAAapw==
X-Received: by 2002:a17:906:1194:: with SMTP id n20mr22002831eja.269.1607418681943;
        Tue, 08 Dec 2020 01:11:21 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id rl7sm13740822ejb.107.2020.12.08.01.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 01:11:21 -0800 (PST)
Subject: Re: [PATCH v5 1/3] Documentation: Add documentation for new
 platform_profile sysfs attribute
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <mgross@linux.intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Elia Devito <eliadevito@gmail.com>,
        Benjamin Berg <bberg@redhat.com>,
        Darren Hart <dvhart@infradead.org>
References: <markpearson@lenovo.com>
 <20201202171120.65269-1-markpearson@lenovo.com>
 <74b6ef2c-ac13-bffe-edda-478512950d22@redhat.com>
 <CAJZ5v0iWD5Ej-1oCfMAskvQoovMRVc5TkpST1t9brsJirx+5zQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ecc70307-aca0-16f8-26b3-4360c61f752b@redhat.com>
Date:   Tue, 8 Dec 2020 10:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iWD5Ej-1oCfMAskvQoovMRVc5TkpST1t9brsJirx+5zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/20 8:29 PM, Rafael J. Wysocki wrote:
> On Thu, Dec 3, 2020 at 10:46 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 12/2/20 6:11 PM, Mark Pearson wrote:
>>> On modern systems the platform performance, temperature, fan and other
>>> hardware related characteristics are often dynamically configurable. The
>>> profile is often automatically adjusted to the load by some
>>> automatic-mechanism (which may very well live outside the kernel).
>>>
>>> These auto platform-adjustment mechanisms often can be configured with
>>> one of several 'platform-profiles', with either a bias towards low-power
>>> consumption or towards performance (and higher power consumption and
>>> thermals).
>>>
>>> Introduce a new platform_profile sysfs API which offers a generic API for
>>> selecting the performance-profile of these automatic-mechanisms.
>>>
>>> Co-developed-by: Mark Pearson <markpearson@lenovo.com>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Thank you, patches 1 and 2 look good to me now, you may add my:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> To patch 2 (since I'm co-author of patch 1 it would be a bit weird
>> to add it there too).
>>
>> Rafael, it would be great if you pick up patches 1 and 2 for merging
>> into 5.11 (assuming that you agree that they are ready) then I will merge
>> patch 3 once 5.11-rc1 is out.
> 
> I've applied patch [1/2] (as 5.11-rc material) for now, but I still
> needed to fix it up somewhat.  Please check the result in my
> bleeding-edge branch.

Thank you.

> I'll get to the other patch tomorrow.

The other patch likely conflicts with a bunch of other thinkpad_acpi
changes already in pdx86/for-next; and I still need to review v5 of
it, so please do not apply it.

I will pick it up after 5.11-rc1 and send it out as part of a
pull-req for rc2.

Regards,

Hans

