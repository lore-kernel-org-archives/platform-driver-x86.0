Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EC6C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 14:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 810996194D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 14:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhFYO1q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Jun 2021 10:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60586 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229831AbhFYO1q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Jun 2021 10:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624631124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S3W9enwm7ow0y8+Hu0dScqnQFYmuRFj9j7NopgJsIYU=;
        b=ApHN9gXo7Lcmk3ZZXW/OnVIUi3xKgxIhqkXGRg7v+WyqLtFOG6hUAMX4Gof0udpRdY2f4K
        wj5GbEPC2fXqgHk87m3HwqDSF8pqLESqkqzMQgSg4Mayexat17thJQ0QoPpZZif/9FzK4r
        UQdT4yirWWcsgHrHL8NrOs+cY588XMU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-orpfEJsnOTq8ctcp2PdXPQ-1; Fri, 25 Jun 2021 10:25:23 -0400
X-MC-Unique: orpfEJsnOTq8ctcp2PdXPQ-1
Received: by mail-ej1-f71.google.com with SMTP id mh17-20020a170906eb91b0290477da799023so3180922ejb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jun 2021 07:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S3W9enwm7ow0y8+Hu0dScqnQFYmuRFj9j7NopgJsIYU=;
        b=NsM/b5A+hAtFMV/2gukqnWb1KRNxJIve0GfdfXFJmE1ML/tkYQN1LUf+/x0t12vvxq
         iiHyNZ/gH+FxATBDSgpkHUYN1i3UTMNpRhIuEZi5QmwIg3Aaj2x5tIJCBoQrY3VMEAKt
         wPELUP4iuPcIeEO55zQvn/bo0Atk3JeHvPrX2eFAyEz80zSnfEZA6jKHGjElluQb6FfH
         YIrs+Rk7SB2wuOU1w6e4GxR0jKBTQceQSI33A0WOTKnlZU9UZkNaRHBhPND5WJWxfn8E
         /aiXwxTl1eDeqcTg+rc68tRDI3okCZ7fxuUzYi9vmnE6SE7SVgr6UJeyXimswy4HQ34s
         dNAg==
X-Gm-Message-State: AOAM530yx6gRJ561JABo1JQ65+93FgRFNHtYzHoPvt9atJ6gWA32x33H
        z5okKde+vop86Mcn5M+RMGcPXqZ07OMSkiO7thHXx9BrI0r/X93Uj6t+Ai9DX2lujIIGahGLu2T
        OPwGh+jpTKIpndKJnlW6OUPzBkG2PLVb/gHjrwvtqWYRa1l5xSGIkcTBCS1WKNu6czd6Mz2Ctqr
        SdC1IgaET0ow==
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr15172928edx.295.1624631122046;
        Fri, 25 Jun 2021 07:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXVU8FB4jgZKkRQa5WeI/+kex/rDn43E0w57PARSNtGCUvcz7Xhwn464fjoG/1fe79PAb2cQ==
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr15172902edx.295.1624631121831;
        Fri, 25 Jun 2021 07:25:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dh23sm4020458edb.53.2021.06.25.07.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 07:25:21 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] updates to amd-pmc driver
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, Raul E Rangel <rrangel@chromium.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
 <17e342aa-fa99-c14d-d018-2b4b65d31933@redhat.com>
 <b56d0232-5002-ace3-f3ce-21c506c1eeac@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <030527ae-9e5c-c3b4-ea48-f1dc5a4ec805@redhat.com>
Date:   Fri, 25 Jun 2021 16:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b56d0232-5002-ace3-f3ce-21c506c1eeac@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/24/21 7:42 AM, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 6/24/2021 2:14 AM, Hans de Goede wrote:
>> Hi Shyam,
>>
>>
>> On 6/23/21 10:01 PM, Shyam Sundar S K wrote:
>>> Couple of existing issues on the completion codes to SMU
>>> and a newer way to get the s0ix statistics are introduced.
>>>
>>> Also, add acpi ids for current and future revisions of the
>>> pmc controller.
>>>
>>> Shyam Sundar S K (7):
>>>   platform/x86: amd-pmc: Fix command completion code
>>>   platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
>>>   platform/x86: amd-pmc: call dump registers only once
>>>   platform/x86: amd-pmc: Add support for logging SMU metrics
>>>   platform/x86: amd-pmc: Add support for logging s0ix counters
>>>   platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
>>>   platform/x86: amd-pmc: Add new acpi id for future PMC controllers
>>
>> Thank you for the new version.
>>
>> Can you please respond to Raul's reply to patch 1/6 of v1 of
>> the series?  Raul's remark seems very relevant to me.
> 
> Unfortunately, I could not find Raul's email in my inbox and hence I
> missed to reply.
> 
> Hi Raul,
> 
> The break condition for readx_poll_timeout() should be 'val ==
> AMD_PMC_RESULT_OK'. Reason being:
> 
> The smu firmware spec says, we have to wait until the response register
> says 1, meaning it is ready to take the job requests. If it is anything
> apart from 1, it means it's not in a state to take any requests.

Hmm, if I understand things correctly 0 means "not ready", waiting
for that to go away is fine, but then we have:

43:#define AMD_PMC_RESULT_OK                    0x01
44:#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
45:#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
46:#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
47:#define AMD_PMC_RESULT_FAILED                0xFF

What if the PMC e.g. responds with AMD_PMC_RESULT_CMD_UNKNOWN ? Then we
should definitely stop polling.

After patch 1/7 there are 2 waits:

1. To wait for any pending previous command to complete
2. A new one introduced by patch 1/7 which waits for the just
send command to complete.

1. seems redundant since we are the only one talking to the PMC,
and we (now) wait for the command to complete before returning
from amd_pmc_send_cmd().

2. The command could be unknown, or fail for some reason,
so it seems that the old wait for any response != 0
(after we clear the register) is the right thing to do
and then we should do a switch-case on the response
to see if the response is ok, or some error.

Also I see no protection against 2 amd_pmc_send_cmd()
calls running in parallel. ATM that seems to be fine since
this cannot happen, but it might be good to still add a
mutex and take that so that this does not break in the
future when some new user may show up which can run in
parallel.

So IMHO the right sequence here would be:

1. Take mutex
2. Clear response register (clearing response from previous command)
3. Write argument
4. Write message id
5. Wait for response register to become !- 0.
6. release mutex
7. do a switch-case on the read response, treating ok
as success an anything else as an error.

Regards,

Hans





> 
> And yes, response register always returns 'val > 0'. Refer to
> AMD_PMC_RESULT_* macros.
> 
> Maybe instead of doing 'return rc', should I just do 'return -EBUSY' ?
> 
> +	if (rc) {
> +		dev_err(dev->dev, "SMU response timed out\n");
> +		return rc;
> +	}
> +  	return 0;
> 
> Am I missing anything obvious frmo your comments?
> 
> Thanks,
> Shyam
> 

