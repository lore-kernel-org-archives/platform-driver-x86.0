Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B46C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 09:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D8C3610C8
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 09:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235901AbhDQJMz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Apr 2021 05:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28734 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235455AbhDQJMy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Apr 2021 05:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618650748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JCAUfIYkdpTGynKIaUv71vkYD7F6xLlVWHSczcQnpTs=;
        b=Ng+FZkHjWeAWl6rTEgAw3hFrWx/ICMJgAS7DyLRkSh7rW8RzTmqrUqZMfq5K34DXUCoWVG
        Fi7bTLd2kxB/tUVZc2cD0REGuhGj5Pk1LFtFhzeP9kik27HIDpmoCcnchxrdmZ3WUttnFz
        34ZLTpxTrEdS94rRDutj8Tsau8a6PMI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-Nm35PzE7O1WSrXRwuRUjhQ-1; Sat, 17 Apr 2021 05:12:25 -0400
X-MC-Unique: Nm35PzE7O1WSrXRwuRUjhQ-1
Received: by mail-ed1-f71.google.com with SMTP id l22-20020a0564021256b0290384ebfba68cso4559098edw.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Apr 2021 02:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JCAUfIYkdpTGynKIaUv71vkYD7F6xLlVWHSczcQnpTs=;
        b=cPObeAhSkl4hUHpikNtPK7yE++unv+BKl7HTmUTI/BIVeE74Q2wnkuys7Sk1FdM1iA
         ZRXhL3ubyNAKvviUC8Ew8VW2sJsd7o1ixIkRsq6utQnp2L9ZArIfYPY5fUJHC7ZulvAO
         xECxlp0VdvCdfHS2LThwDtSZY67ecV6oAkLKt7JKBd709+Sbu9sPZT31p33zI3fbmtW3
         1bLct870EBqdF7kVEMmcGxrFzxSsDvfd4Ha8FFkf6Qt+RkXM7f1KTWv1JmFXOcQ8DcMz
         T3pXrT+hAfk9Nxla9lvMIyZ5AAaw25Tf2EaeJpfKN2sKPKuEwtPe/32DS7oEulRolj6y
         DZPQ==
X-Gm-Message-State: AOAM532LXqEiqlk4jQcILyTRfeA7kVTUTcwdqqaRQm0+2SIaJHhBoIlt
        EBibG5KhhWVZlFxzDP3tdwDCGISBNvAcBxM+xer6dD5YN+LmfgIFVk+X+gu4Oqa6UeS/GjQAF8e
        6JCyT8yPHn5YCzlzHdVKJoDgdBokDpJSBrw==
X-Received: by 2002:a17:906:9bd3:: with SMTP id de19mr11853761ejc.329.1618650744382;
        Sat, 17 Apr 2021 02:12:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhRPpxjMNiQ8NjjYPjJFIyPgs7wEJEFEI5l/ty3UqCm2Hu5sw3UmnEQlOyAvHTghEBsrqt0g==
X-Received: by 2002:a17:906:9bd3:: with SMTP id de19mr11853743ejc.329.1618650744188;
        Sat, 17 Apr 2021 02:12:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b8sm7935010edu.41.2021.04.17.02.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 02:12:23 -0700 (PDT)
Subject: Re: [PATCH V2 0/9] intel_pmc_core: Add sub-state requirements and
 mode
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210417031252.3020837-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5b372264-3504-5e98-da20-859709acea8f@redhat.com>
Date:   Sat, 17 Apr 2021 11:12:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417031252.3020837-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/17/21 5:12 AM, David E. Box wrote:
> - Patch 1 and 2 remove the use of the global struct pmc_dev
> - Patches 3-7 add support for reading low power mode sub-state
>   requirements, latching sub-state status on different low power mode
>   events, and displaying the sub-state residency in microseconds
> - Patch 8 adds missing LTR IPs for TGL
> - Patch 9 adds support for ADL-P which is based on TGL
> 
> Applied on top of latest hans-review/review-hans

Thank you, the series looks good to me know, except for one very minor
issue in patch 5, which as I already mentioned in a reply to patch 5,
I can fixup while merging this.

Once I have you ack for the prososed changes to patch 5 I'll merge this
into me review-hans branch.

Depending on if Linus does a rc8 or not I'll then push this to for-next
for 5.13, or this will have to wait for 5.14 :

Linus does a rc8          -> I'll promote this from review-hans to for-next in time for 5.13
Linus releases 5.12 final -> I'll rebase my review-hans on top of 5.13-rc1 once released and
                             then push this to for-next

Regards,

Hans




> 
> Patches that changed in V2:
> 	Patch 3: Variable name change
> 	Patch 5: Do proper cleanup after fail
> 	Patch 7: Debugfs write function fixes
> 
> David E. Box (4):
>   platform/x86: intel_pmc_core: Don't use global pmcdev in quirks
>   platform/x86: intel_pmc_core: Remove global struct pmc_dev
>   platform/x86: intel_pmc_core: Add option to set/clear LPM mode
>   platform/x86: intel_pmc_core: Add support for Alder Lake PCH-P
> 
> Gayatri Kammela (5):
>   platform/x86: intel_pmc_core: Handle sub-states generically
>   platform/x86: intel_pmc_core: Show LPM residency in microseconds
>   platform/x86: intel_pmc_core: Get LPM requirements for Tiger Lake
>   platform/x86: intel_pmc_core: Add requirements file to debugfs
>   platform/x86: intel_pmc_core: Add LTR registers for Tiger Lake
> 
>  drivers/platform/x86/intel_pmc_core.c | 384 +++++++++++++++++++++++---
>  drivers/platform/x86/intel_pmc_core.h |  47 +++-
>  2 files changed, 395 insertions(+), 36 deletions(-)
> 
> 
> base-commit: 823b31517ad3196324322804ee365d5fcff704d6
> 

