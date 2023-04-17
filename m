Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F98C77B70
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 08:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjDQIZy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 04:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjDQIZv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 04:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5BA558B
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681719895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UcXu6x56VatJHPoIi02+E+e45LAvk1jm28QAaFuNKY4=;
        b=YDSPUjD9c5RvXZAQ9pZxkp1RloTqDGZK9N6mWeUT4yBxVm1DD9LFVyvOJF+0aP113ky+3Y
        ShSHVb5tlzOYLhFo1knzWckxUaDajeXOMgvhByP2tuRGTFcbqbsLzRVlw+Jgujc8NE0a2J
        R2ogg0xMwJQ/Qa5MaUODE906LCnGQPs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-vZgEDSvMPJ6VOsUjzASwXA-1; Mon, 17 Apr 2023 04:24:54 -0400
X-MC-Unique: vZgEDSvMPJ6VOsUjzASwXA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5054bd98964so2327075a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 01:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681719893; x=1684311893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcXu6x56VatJHPoIi02+E+e45LAvk1jm28QAaFuNKY4=;
        b=aQviE/E2x9Ovb5NoL+ViAvAxeB58aAxo/zfe/H66E91f2rrlQD16A3Y4nw7XZwkPU1
         5a1w2666v3Lo+WVRHwl9fQQfUVkG2uco5W1NM+WsnfJadFixQayFSpjqOOTzJ+ZeJkVC
         BpOCcV/Uoxlbsegjx1WSDI57Oq5zJPiu3jJ+5q0zxmZNmLRddd9I3bgOJDHfRbH4T5nV
         hpQk5CHmP6SW+ZtPXI4bLDSALA2z/l6uVoesatTsvm8O26599E4dvv7QEgwiWju7BxkW
         ezgWuSxLLG6g8ieFd9RTXlVTG/iHZ2sLCw+p+3oforjYJuU1GQBoxGtD05nHONyN11wC
         LLnQ==
X-Gm-Message-State: AAQBX9fN/r+C693IZGHSbG9YMDRoh8R/+gLPr6T/Ot3yu54I1XAQv/oa
        05IqR49gaoe2Ee8AU9aRjXCXJBKFy39Lj89zgE1CB9FLrw7sdigxCBxqRqLmM8PaIeHZOgR+HX8
        QAtLdyUNvbRsuO1eVC42qsZKsPuycxhLMEQ==
X-Received: by 2002:aa7:c155:0:b0:506:8edd:b883 with SMTP id r21-20020aa7c155000000b005068eddb883mr6453571edp.36.1681719893518;
        Mon, 17 Apr 2023 01:24:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350b4i65gxNLASOvBXz6lnH55FvdetEEPTPD6VrcxYPr+lNl+ZQCC+GMWZsfmqc1JZ9am8bk2vw==
X-Received: by 2002:aa7:c155:0:b0:506:8edd:b883 with SMTP id r21-20020aa7c155000000b005068eddb883mr6453555edp.36.1681719893168;
        Mon, 17 Apr 2023 01:24:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l12-20020a056402344c00b00504803f4071sm5552136edc.44.2023.04.17.01.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 01:24:52 -0700 (PDT)
Message-ID: <8a4f2454-809c-d773-42b2-e62fb057feb2@redhat.com>
Date:   Mon, 17 Apr 2023 10:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v9 0/4] Add vendor agnostic mechanism to report hardware
 sleep
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Box David E <david.e.box@intel.com>, jstultz@google.com,
        pavel@ucw.cz, svenva@chromium.org,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Shyam-sundar.S-k@amd.com, rrangel@chromium.org,
        Jain Rajat <rajatja@google.com>, linux-kernel@vger.kernel.org
References: <20230414012346.1946-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230414012346.1946-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario, et al.,

On 4/14/23 03:23, Mario Limonciello wrote:
> An important part of validating that s0ix worked properly is to check how
> much of a cycle was spent in a hardware sleep state.
> 
> The reporting of hardware sleep is a mix of kernel messages and sysfs
> files that vary from vendor to vendor. Collecting this information
> requires extra information on the kernel command line or fetching from
> debugfs.
> 
> To make this information more readily accessible introduce a new file in
> suspend_stats that drivers can report into during their resume routine.
> 
> Userspace can fetch this information and compare it against the duration
> of the cycle to allow determining residency percentages and flagging
> problems.
> 
> Mario Limonciello (4):
>   PM: Add sysfs files to represent time spent in hardware sleep state
>   platform/x86/amd: pmc: Report duration of time in hw sleep state
>   platform/x86/intel/pmc: core: Always capture counters on suspend
>   platform/x86/intel/pmc: core: Report duration of time in HW sleep
>     state
> 
>  Documentation/ABI/testing/sysfs-power | 29 +++++++++++++
>  drivers/platform/x86/amd/pmc.c        |  6 +--
>  drivers/platform/x86/intel/pmc/core.c | 17 ++++----
>  drivers/platform/x86/intel/pmc/core.h |  4 +-
>  include/linux/suspend.h               |  8 ++++
>  kernel/power/main.c                   | 59 +++++++++++++++++++++------
>  6 files changed, 98 insertions(+), 25 deletions(-)
> 
> 
> base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d

Thank you for working on this, this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series. Since this also touches kernel/power/main.c
I think it would be best if the entire series is merged
through the linux-pm tree and I'm fine with the pdx86 bits
also getting merged through linux-pm.

Rafael ?

Regards,

Hans



