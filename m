Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F967C4361B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 15:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C9A723A79
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 15:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgLHP3P (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 10:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45338 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729910AbgLHP3P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 10:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607441268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xr5jQ17tI5rLCWomlbBlC+vVMUJYwNJfuplB6ldKqjw=;
        b=fpLSsQ3jCfZNSIwzpel2zxvDuetQQ1WHk9mjrG2vUe90nIxGw1iE2XLFy1UCVKM+YQXYVf
        fsI7T7FbhmJF6jR2c11A6zcwXXlXoQX+TZB55PTRpxSwhjFZaQj26JO3GaqQVaBvxTb5VV
        ldZ5I2/EIYS/QxAzUwTHm7N6glh8ghI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-vuroDct5OYav4aHrSM09Og-1; Tue, 08 Dec 2020 10:27:45 -0500
X-MC-Unique: vuroDct5OYav4aHrSM09Og-1
Received: by mail-ed1-f70.google.com with SMTP id z20so7572184edl.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 07:27:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xr5jQ17tI5rLCWomlbBlC+vVMUJYwNJfuplB6ldKqjw=;
        b=ILvQDLYT4q+jsfh0faDCvoHoEgPFxdo589/VAkCO//mX3wRNH+z+LJh/O2O2bg42Tj
         rSwU/YtqZh0oFgHMAo31/1p9SiO+omgY5O5IRhuShhhzVEs3E7V/XeDbpLpERDaSGZn8
         WCTrKcC2VYGFQLKyoukRUfNIkB2HT5rDUsIfi2gmBnJW5/Os5erz8kU4Ff/xfWjUD/og
         N3Sb3k0B+zqoNI7NbiDyQf3Z+scgrPIHrP/jq7rm0MwJ8T/qu6BijU0KPIpDyorSDc2s
         YZN9xd3VRadbhTwkdwq6uJu8slhT7BbkSCnpbE56fWZgh6pZeKBNaePmZ+iV2uYvPw4s
         XaVQ==
X-Gm-Message-State: AOAM530+urkZESWhRdcuL46lk+YG3E/6AdpOKfkr/7uPGNsgPmkZFetr
        CF1XrFi6yUVa42YpsWnrMjAAD0Pk5UPIcsX+XJHnn1MXUgLGTerV0Z/JP8K0NxmQ8IVxjUb9t+G
        jznRiUKbaD7mab4Wj9Yb0qIjcUasr6zg5Bg==
X-Received: by 2002:a17:906:b20f:: with SMTP id p15mr9459748ejz.542.1607441264233;
        Tue, 08 Dec 2020 07:27:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXjJbN5M9gONlp70KY56vz5xTWbiybJRXvIYLl+C7UFgBkWJVGw26sjytDWrUHJwlOqWECGw==
X-Received: by 2002:a17:906:b20f:: with SMTP id p15mr9459731ejz.542.1607441264052;
        Tue, 08 Dec 2020 07:27:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a10sm14794203ejk.92.2020.12.08.07.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 07:27:43 -0800 (PST)
Subject: Re: [PATCH -next] platform/x86: ISST: Mark mmio_range_devid_0 and
 mmio_range_devid_1 with static keyword
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "zou_wei@huawei.com" <zou_wei@huawei.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1607430489-116200-1-git-send-email-zou_wei@huawei.com>
 <194d5a3c2c0f99345454004eb81c08d94181b7d7.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <179b9e9c-5f38-b6e9-2135-636bdb275989@redhat.com>
Date:   Tue, 8 Dec 2020 16:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <194d5a3c2c0f99345454004eb81c08d94181b7d7.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/8/20 4:22 PM, Pandruvada, Srinivas wrote:
> On Tue, 2020-12-08 at 20:28 +0800, Zou Wei wrote:
>> Fix the following sparse warnings:
>>
>> drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c:23:24:
>> warning: symbol 'mmio_range_devid_0' was not declared. Should it be
>> static?
>> drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c:28:24:
>> warning: symbol 'mmio_range_devid_1' was not declared. Should it be
>> static?
>>
> Yesterday I sent a patch "[PATCH v2 2/3] platform/x86: ISST: Allow
> configurable offset range" to fix.

And I replied to that v2 with the following:

"I've already added v1 of these to the for-next branch of:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/

Please send the changes in this v2 as (a) follow-up
patch(es)."

https://lore.kernel.org/platform-driver-x86/2f663d89-184b-f52e-6156-f485205f27f5@redhat.com/T/#t

But I guess you may not have seen this because Intel's mail-servers
seem to have gone completely foobar lately and are bouncing most
of my emails it seems. I strongly suggest that you subscribe to
the platform-driver-x86 lists, so that you at least get replies
to your patches through the list.

So are the changes in this patch from Zou Wei the only changes in v2
of your ISST changes? If that is the case then I'll just merge
Zou Wei's patch and then we're done.

Regards,

Hans



>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>> ---
>>  drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
>> b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
>> index 2906cfe..ff49025 100644
>> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
>> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
>> @@ -20,12 +20,12 @@ struct isst_mmio_range {
>>         int end;
>>  };
>>  
>> -struct isst_mmio_range mmio_range_devid_0[] = {
>> +static struct isst_mmio_range mmio_range_devid_0[] = {
>>         {0x04, 0x14},
>>         {0x20, 0xD0},
>>  };
>>  
>> -struct isst_mmio_range mmio_range_devid_1[] = {
>> +static struct isst_mmio_range mmio_range_devid_1[] = {
>>         {0x04, 0x14},
>>         {0x20, 0x11C},
>>  };
> 

