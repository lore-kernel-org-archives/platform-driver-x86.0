Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3130C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:01:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C378221E5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbhADOBB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:01:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45174 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726871AbhADOBB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609768774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qvSWlf3CRXHja/3mFFy4H6SjbY0WNebl5EBD9/NzC74=;
        b=HjaHL5Val8zKhL7iqdzdgpggTMnIIbKlIIM7ecy77+lzdS3biyJYfFyTuK/bTumi/9PdJe
        EtV4t1pgITnzbG9NEVeKKKogoK0Jkovsu94W81mZkTZzLR51EAb/3GAqGqMLClJP3HoECl
        geJLue3XNjSw1cjAUW4/YfBSrdXpNNE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-63vxev3VOs-E0jdSanLtdA-1; Mon, 04 Jan 2021 08:59:31 -0500
X-MC-Unique: 63vxev3VOs-E0jdSanLtdA-1
Received: by mail-ej1-f71.google.com with SMTP id y14so7025242ejf.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 05:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qvSWlf3CRXHja/3mFFy4H6SjbY0WNebl5EBD9/NzC74=;
        b=P1AI+l/bDnyhJ1qee06DPRqgeROvXUPBm9yAZ+RTf6SqryZ2prUHOM6rCLJsMRBRgs
         HXJv6TKMnHZcBhU2ZiJvnlih12T3bzskSgzUfGKykhEX/xNDuG/l+UdATJpe65GhshIa
         AqqD4ibUi2kNQFhVvrtsxNwxl8NiMQdjOfOWpXF8pD3i2wQYw6T3JmSaKGeLN2Uz7KSe
         b5tiwLH2gBoiaBY4PPsw4D7WYU8m/UJcIh7m00CQBqxO8IZrFLbyqX1X97ErhVpu93mL
         suHb/0dGCxOTzgGeisRmnnoOo6wTfj1qDuGTAsdHMMBQ9eMeBVPF0xTxvKzEG4AdSZCT
         3arw==
X-Gm-Message-State: AOAM531lneQnLQfUL0Jp/lV+kU5aVJXVQMrFqS7pJYYCRjTOQj+dABGW
        oEFJusXaChiPl/ql+Wc5xlr4/S92QISI3xgGxNgEYlTohSwpUcpiMR8VVQe65O55nHlLlTtCCO0
        pnR+R/TmZKMTioh1aaExZw2SRMThOyJtQSg==
X-Received: by 2002:a17:906:34c3:: with SMTP id h3mr66426488ejb.132.1609768769821;
        Mon, 04 Jan 2021 05:59:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy3gx62AOsi6TbAX7kHj7zLjr/a/AaJ0Hjw5vkps6VWRD8P7RIGMOMsHj1TtnSX64kVz+VYQ==
X-Received: by 2002:a17:906:34c3:: with SMTP id h3mr66426469ejb.132.1609768769602;
        Mon, 04 Jan 2021 05:59:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u16sm44376631eds.10.2021.01.04.05.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:59:28 -0800 (PST)
Subject: Re: [PATCH] ACPI / scan: Don't create platform device for INT3515
 ACPI nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Moody Salem <moody@uniswap.org>, stable@vger.kernel.org
References: <20201223143644.33341-1-heikki.krogerus@linux.intel.com>
 <ae94a191-4273-0000-deda-4859034343b8@redhat.com>
 <20210104122343.GT4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c59bb4a0-62bc-3390-dd29-758d415c59fa@redhat.com>
Date:   Mon, 4 Jan 2021 14:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210104122343.GT4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/4/21 1:23 PM, Andy Shevchenko wrote:
> On Mon, Jan 04, 2021 at 12:59:39PM +0100, Hans de Goede wrote:
>> On 12/23/20 3:36 PM, Heikki Krogerus wrote:
>>> There are several reports about the tps6598x causing
>>> interrupt flood on boards with the INT3515 ACPI node, which
>>> then causes instability. There appears to be several
>>> problems with the interrupt. One problem is that the
>>> I2CSerialBus resources do not always map to the Interrupt
>>> resource with the same index, but that is not the only
>>> problem. We have not been able to come up with a solution
>>> for all the issues, and because of that disabling the device
>>> for now.
>>>
>>> The PD controller on these platforms is autonomous, and the
>>> purpose for the driver is primarily to supply status to the
>>> userspace, so this will not affect any functionality.
>>>
>>> Reported-by: Moody Salem <moody@uniswap.org>
>>> Fixes: a3dd034a1707 ("ACPI / scan: Create platform device for INT3515 ACPI nodes")
>>> Cc: stable@vger.kernel.org
>>> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1883511
>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> Thank you for your patch, I've applied this patch to my review-hans 
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
> 
> I'm wondering if my reply has been seen...
> 
> https://lore.kernel.org/platform-driver-x86/ae94a191-4273-0000-deda-4859034343b8@redhat.com/T/#m30308ca22cd0ce266aa6913ab7ef1fc56b3279de

Yes I've done the s/Link/BugLink/ in the commit msg and fixed up the
typo-s in the comment block locally. I should have mentioned that in
my reply instead of just blindly using the template-reply which I have for
this, sorry; and thank you for the review.

Regards,

Hans

