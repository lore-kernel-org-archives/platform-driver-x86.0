Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF1DC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 12:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjBFMzx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjBFMzw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 07:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B301D222C8
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 04:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675688105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UX1daTOnFKuVGY1erJNvOV1r3LJAnkWkwfFQVfdnZmc=;
        b=KDeyCPV/ui0Xvm0+HroWy/XQPnPJsSkGfEgJzArPEtQBDE+ugkWSZUE6arjXUHib1/8UY0
        zekKf2qMnXYk6SQSBjxvK2VNb/HB12AOuZQ5GGFZgfZv1Y67ChMEi17jDMYMElfhI9ASp8
        etcZzgnYOhAg5AjPout1SFciP+buPSs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-qJUnf47tPIiX4GjfNfyFaA-1; Mon, 06 Feb 2023 07:55:03 -0500
X-MC-Unique: qJUnf47tPIiX4GjfNfyFaA-1
Received: by mail-ed1-f72.google.com with SMTP id ev18-20020a056402541200b004a621e993a8so7683097edb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Feb 2023 04:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UX1daTOnFKuVGY1erJNvOV1r3LJAnkWkwfFQVfdnZmc=;
        b=nq56hmo0tl5gWCgfPw4EWDJJCxuPGNgFjlsOou3JjkAY8PuIGrOOFg16UyvnNWPMi9
         tVhA9x/s9R73MB4WuhTZ74LtY6YjxVutrA7A4Up/KBplYW9pq5THhRgFzRZt6dswR0Og
         CZ6j4LjIVkH9Kg94tt9nHHk6bqhua90Ry4ISVa2tD8u2+OXe7QkGq0YYmiUKNQpYEXXX
         Bw7rZ5dsR2hXxSnb5WwplMZ0DEh8skjNgBkm3jfZLohUprpR1Z4x5dg80V1WkOMtP3bT
         86He2LVcxFDV7Jizw/vGfbtaFoHWj5jAy+uHFfOfDswfXXMXcOeP7Vd/IbbeivjJj4ZD
         I7dg==
X-Gm-Message-State: AO0yUKVYdNeBREH/O53ahSzt+5BDy3BhC8dF8+gE+9fR6rrmx9jZZnDu
        CPVVE4fxS0s6JGBQbnf3n40tI2DEefq/aU0ScBOi4GKBpNpJuBQnWBmUxE83f6R5ZkEK5a4Pgd4
        aNjQ184jn39VRyMvRW4w/8k/zbTBDaz1Bvg==
X-Received: by 2002:a17:906:5658:b0:878:7b5c:3811 with SMTP id v24-20020a170906565800b008787b5c3811mr18145534ejr.42.1675688102741;
        Mon, 06 Feb 2023 04:55:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8BAMTxyg8K7m5+aY3GW33lxao9oRWSvbibbghTiKRaybEKgPTSyk9g9sXLTrfSGV9maPvHIw==
X-Received: by 2002:a17:906:5658:b0:878:7b5c:3811 with SMTP id v24-20020a170906565800b008787b5c3811mr18145526ejr.42.1675688102586;
        Mon, 06 Feb 2023 04:55:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lv3-20020a170906bc8300b00883410a786csm5350194ejb.207.2023.02.06.04.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:55:02 -0800 (PST)
Message-ID: <14c1201b-7caf-e096-624c-e5ec3597d67f@redhat.com>
Date:   Mon, 6 Feb 2023 13:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/7] Add TPMI support
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202010738.2186174-1-srinivas.pandruvada@linux.intel.com>
 <918ac0c5-9f35-0099-5be8-6dbc72aa88e9@redhat.com>
In-Reply-To: <918ac0c5-9f35-0099-5be8-6dbc72aa88e9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/23 13:49, Hans de Goede wrote:

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

One thing which I did notice, which is a pre-existing problem
is that the IDA accesses in drivers/platform/x86/intel/vsec.c
are not protected by any locking.

This is likely ok for now because there is only 1 PCI device
per type of ida and the enumeration of the vsec devices
under the PCI device is done in a single loop, so all
IDA accesses are single threaded atm.

But still IMHO it would be good to protect the IDA accesses
(ida_alloc() / ida_free()) with a mutex to protect against
any future races.

I think that a single global static mutex inside
drivers/platform/x86/intel/vsec.c to protect the
ida calls there should suffice for this.

Regards,

Hans



