Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B784C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EABF619CB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbhCWUQD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60125 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232991AbhCWUPm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 16:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616530541;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mzUdqnfXwtrtoaMsh3TXXRLu23z5WG6FAbKxH0tVEm0=;
        b=Fx7IW04jPdOxRdFAvsDPSqbXmVbMWCLCRg7f8PPvbycsYjgO1fANQSkaPlz/27XKUx7Cpu
        hj4mVqEh0rqVxJ6dDs6nNShoXNLdTQWD2iVHQd1yGpzjicY8gqAn60/DDgJfmTmpDhcFxI
        jpzvhCbp3V8Xm8BV51DMEt1rl+cOj+o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458--zZtu6HlNO-sDoGU24h80g-1; Tue, 23 Mar 2021 16:15:39 -0400
X-MC-Unique: -zZtu6HlNO-sDoGU24h80g-1
Received: by mail-ed1-f72.google.com with SMTP id bi17so1510947edb.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 13:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mzUdqnfXwtrtoaMsh3TXXRLu23z5WG6FAbKxH0tVEm0=;
        b=XPRG2qypKwYxjrcuKIwNQkmhr1OkSkYbZhehNSlAGHLhJvLoiJFZ56WEiDa3dCrt12
         KMXkJjZL9kdA1en2KpcPnXyuB0b3DsD/UZ8Sv9hLJYxiNG7dwx2SOl5lKXqpmdUhJCmz
         jxMRvGiTeTnsMFJzLmxrwkRS5u3ov2+e2G1+RQS76deLh8cBoi+tefohpe6lqHWHGmLD
         E60+wbvIlvSLCu2m/Ke/VAs47e4xSk7InQ8own7jSTgvRqFp6FXrAe8gIg1zMq8YvhBb
         9XAEAlXKDWGLG+h8ly7D+37j1PCNDDzw/UYwpw+5QM/ydTmTFQ9SWxN+eCcv7WNOzP4N
         42Lw==
X-Gm-Message-State: AOAM532vcgwC/LjgeOFsKiwIMvU77WMFuD/xAvQBZ/ookjqyopu6hT5z
        1b/BJDIe+hPUic5oH70IcxSFd25hpy2NZ80PZ5jR3JEl5jlS6K28HiiPMESORN8lsxWbVJyISh0
        tVP4XLOXRYjhQ5q5n/ICG8deeWYDqUl4UUA==
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr6413922edb.186.1616530538471;
        Tue, 23 Mar 2021 13:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3vNTyVkq4htiGTStm2JyVf5ljilwLvdXObic7u9LI8U3xo4xcRKQ1eicn5quqI6J3GwHnsg==
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr6413914edb.186.1616530538362;
        Tue, 23 Mar 2021 13:15:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e8sm7165edq.77.2021.03.23.13.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 13:15:38 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform/x86: intel_pmt_class: Initial resource to 0
To:     david.e.box@linux.intel.com, mgross@linux.intel.com
Cc:     lee.jones@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210317024455.3071477-1-david.e.box@linux.intel.com>
 <425422a30006a869f8cbefce3ee6be8764b2b03c.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ecd7af6-1147-a07d-3376-d304c8041b21@redhat.com>
Date:   Tue, 23 Mar 2021 21:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <425422a30006a869f8cbefce3ee6be8764b2b03c.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/23/21 6:29 PM, David E. Box wrote:
> On Tue, 2021-03-16 at 19:44 -0700, David E. Box wrote:
>> Initialize the struct resource in intel_pmt_dev_register to zero to
>> avoid a
>> fault should the char *name field be non-zero.
> 
> Hi Hans. Can these 2 patches be pulled as fixes for 5.12? Thanks.

I've merged this into my review-hans branch now.

I'll also them to my fixes branch and add them to my next
pull-req to Linus for 5.12.

Regards,

Hans



> David
> 
>>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>
>> Base commit is v5.12-rc3.
>>
>>  drivers/platform/x86/intel_pmt_class.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmt_class.c
>> b/drivers/platform/x86/intel_pmt_class.c
>> index c8939fba4509..ee2b3bbeb83d 100644
>> --- a/drivers/platform/x86/intel_pmt_class.c
>> +++ b/drivers/platform/x86/intel_pmt_class.c
>> @@ -173,7 +173,7 @@ static int intel_pmt_dev_register(struct
>> intel_pmt_entry *entry,
>>                                   struct intel_pmt_namespace *ns,
>>                                   struct device *parent)
>>  {
>> -       struct resource res;
>> +       struct resource res = {0};
>>         struct device *dev;
>>         int ret;
>>  
>>
>> base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
> 
> 

