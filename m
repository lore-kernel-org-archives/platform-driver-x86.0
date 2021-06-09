Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4A0C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:27:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 480BB61377
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhFIO25 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33101 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234529AbhFIO24 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 10:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623248821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dWskz1tpoE2n45qyKiTGnaNgZEHi4b3U+rlmrEUOMgM=;
        b=EN/KhWzN24Rpi3HTLzQio5Rg8yRyiXkGMtop0fS4lwHW82+AZq50XF7MEErP5h2ORqiVEG
        3/ds74IjMqqJFQ0xhvr/OYfGujoUokt6LO7rRnQUXAuZf0I39kQouFh8dybHBUKE+Fli9s
        j4vIh1wtN8yLLxWoZfC6H+uVVZiJb0Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-C6ObECrCNCu89V--Aarqig-1; Wed, 09 Jun 2021 10:27:00 -0400
X-MC-Unique: C6ObECrCNCu89V--Aarqig-1
Received: by mail-ej1-f69.google.com with SMTP id e11-20020a170906080bb02903f9c27ad9f5so8087658ejd.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 07:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dWskz1tpoE2n45qyKiTGnaNgZEHi4b3U+rlmrEUOMgM=;
        b=jajaTbUYRDlkCyd/qp/+eBso4EMFdLTshJADVJ4K6Tx5VEpOAiGT7/q19BOTbWQQwV
         I2BZ859cLpAkVDIo/G01JwHbAggx6qp59NnzHZPFgX5rVx3OXRgkn15H9LBG5MaIxikC
         84kKMzO3i0HnTp5GP/zQQfhHBWf6KzkLsx5M/y62zMGNjgPGMyPrHo4/U3p20FqK9c5s
         wxAmy5+CWqBB98GSVRNyXmTNsqNFjfHcg5PhbV+eoLDfqPHqGw0bcFeqVVSw/TKo/v5p
         xK+XDp4pi8zxtbW4125BatgWFO6nDaunVKym1LKF+tiowGqf3Z2vyI8RSfPoToI+zatv
         M09Q==
X-Gm-Message-State: AOAM532Pso+yysc28eN5bSZ57j7ODz9Zh2y8BS+Ib3vxft8tZsXXxBUd
        it0Unb6iBjfGwixHgRIE77Svfs4CV3qhJJVkOCn8k2aVgAznD2BFHBYoUlL8Oyt0E6mAiWwsslA
        Oco9m+wW/M/cHxHqWB5CuMrV1lDl/iMjz0A==
X-Received: by 2002:a17:906:bc2:: with SMTP id y2mr102544ejg.489.1623248818893;
        Wed, 09 Jun 2021 07:26:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6Ifm3foifqY4kzazj+RDwjAzoIvaLRrU5gP8J1FL48CV04hAwHGui12uCt0VCCwkDpUd8+A==
X-Received: by 2002:a17:906:bc2:: with SMTP id y2mr102534ejg.489.1623248818778;
        Wed, 09 Jun 2021 07:26:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l11sm1213511edb.3.2021.06.09.07.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:26:58 -0700 (PDT)
Subject: Re: [PATCH 0/4] platform/x86: Constify static attribute_group structs
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Frank Seidel <frank@f-seidel.de>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Justin Ernst <justin.ernst@hpe.com>
Cc:     Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Travis <mike.travis@hpe.com>
References: <20210605203807.60547-1-rikard.falkeborn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e6d3ecf9-c664-4fba-aa93-773fa054783e@redhat.com>
Date:   Wed, 9 Jun 2021 16:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210605203807.60547-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/5/21 10:38 PM, Rikard Falkeborn wrote:
> Constify a couple of static attribute_group structs which are never
> modified to allow the compiler to put them in read-only memory.
> 
> Rikard Falkeborn (4):
>   platform/x86: hdaps: Constify static attribute_group struct
>   platform/x86: intel_pmt_crashlog: Constify static attribute_group
>     struct
>   platform/x86: tc1100-wmi: Constify static attribute_group struct
>   x86/platform/uv: Constify static attribute_group struct

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

