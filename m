Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38854C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AF906058D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238439AbhIMJVN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 05:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49581 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236022AbhIMJVN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 05:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631524796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m3j2L2tbisQar85R5nhBxxNpBf8VLNPZf56KSEhSHdc=;
        b=O1MBjR8zjDUrLi1Xdby8zG/bhCzqt3qDviKg2gAfvKo+EWKmzuupj7jgNPoMbP5J23uF1P
        0PketBBZR8/381HxfM7MJuqZFATyF2oHp/2g8Gpiv+5roXX1OKBc4Erm6CzeH49sPISCP0
        Evz96meJPDaszGQLSG1QYg6Ly9xtctg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-Dj_S--L_PHWpLU2oOeOyKA-1; Mon, 13 Sep 2021 05:19:55 -0400
X-MC-Unique: Dj_S--L_PHWpLU2oOeOyKA-1
Received: by mail-ed1-f72.google.com with SMTP id m20-20020aa7c2d4000000b003d1add00b8aso1481246edp.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 02:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m3j2L2tbisQar85R5nhBxxNpBf8VLNPZf56KSEhSHdc=;
        b=D3FvjxchAWT1mQRjmvywQ/RaXWIt/gP14gRVp3QAsDriniXvejzCQAMCOsrscltZ3R
         IdurUaMcTCQnOB0jPYhVWjKHoFKlePuAW3ebfhxfkB35OydZbqxVnVcSs3P5GtB5HacY
         jEM46o6OBqxcqAkeBz05ANMyd+NTnHYDorFIAoIHXZzditnbdSr4slNGpf2VccjHaLsY
         ObB9oH3CJFTdYeMd5P3FUo6llrG6ekbP8tU8KUQvqr+wJ1EfutvCpmQ/7L4cQBoM/98U
         NosROkx/OkS8pZA0p+K3FVENLyPVuE2+Fb40b/USpjf0McQPaCmtcH0abI+XEPrgIf08
         +o6w==
X-Gm-Message-State: AOAM532cN7HrgWr38QxZ4MMcVBeGCYPzWouLV4WaR7Bv0MS4Ubm+1dGN
        vg/McSwyPyyn0ZaQIdqM/ZOsFzzooZGL31/h952HZk2IXmo/xUXmRJDemFQSyU4BF+Wcbrrj6hw
        X5t+FN2s5kY8/RQqwPKjZ/fUB6lr0Dm+yrrH8eORSSwZCa59dFsu/6dy6ZWm3977/EZOUSkaBcB
        9nz0s6zih9lQ==
X-Received: by 2002:a05:6402:1385:: with SMTP id b5mr11790642edv.276.1631524794300;
        Mon, 13 Sep 2021 02:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznKd8zVhT9ldyubrk0J3OXOQ6qAF3wU+HhEiGNZl+WE7O7uazepS10HyD/PB6Y8dDBVJdIZA==
X-Received: by 2002:a05:6402:1385:: with SMTP id b5mr11790627edv.276.1631524794076;
        Mon, 13 Sep 2021 02:19:54 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id n15sm3612431edw.70.2021.09.13.02.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 02:19:53 -0700 (PDT)
Subject: Re: [RFC PATCH v1 00/30] platform/x86: wmi: minor improvements
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210904175450.156801-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <902a8c92-618f-51a5-3288-253243744ed2@redhat.com>
Date:   Mon, 13 Sep 2021 11:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904175450.156801-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Barnabás,

On 9/4/21 7:54 PM, Barnabás Pőcze wrote:
> This patch series contains minor changes in the WMI bus, which
> aim to remove unnecessary code, get rid of duplication, and
> various style changes.
> 
> Most of the patches should have no observable effect on the behaviour.
> 
> Barnabás Pőcze (30):
>   platform/x86: wmi: fix kernel doc
>   platform/x86: wmi: fix checkpatch warnings
>   platform/x86: wmi: remove commas
>   platform/x86: wmi: remove unnecessary initialization
>   platform/x86: wmi: remove unnecessary initializations
>   platform/x86: wmi: remove unnecessary variable
>   platform/x86: wmi: remove unnecessary argument
>   platform/x86: wmi: remove unnecessary casts
>   platform/x86: wmi: remove stray empty line
>   platform/x86: wmi: remove unnecessary checks
>   platform/x86: wmi: use BIT() macro
>   platform/x86: wmi: use bool instead of int
>   platform/x86: wmi: use dynamic debug to print data about events
>   platform/x86: wmi: use guid_t and guid_equal()
>   platform/x86: wmi: make GUID block packed
>   platform/x86: wmi: use sysfs_emit()
>   platform/x86: wmi: use sizeof() instead of hard-coding
>   platform/x86: wmi: use !p to check for NULL
>   platform/x86: wmi: use sizeof(*p) in allocation
>   platform/x86: wmi: remove variable
>   platform/x86: wmi: move variables
>   platform/x86: wmi: align arguments of functions
>   platform/x86: wmi: improve debug messages
>   platform/x86: wmi: do not fail if disabling fails
>   platform/x86: wmi: simplify error handling logic
>   platform/x86: wmi: introduce helper to convert driver to WMI driver
>   platform/x86: wmi: introduce helper to generate method names
>   platform/x86: wmi: introduce helper to determine type
>   platform/x86: wmi: introduce helper to retrieve event data
>   platform/x86: wmi: more detailed error reporting in find_guid()
> 
>  drivers/platform/x86/wmi.c | 378 +++++++++++++++++++------------------
>  1 file changed, 197 insertions(+), 181 deletions(-)

Thank you for this big cleanup series.

Not sure why this is marked as a RFC?

I've gone over patches 1 - 7 sofar and they all look like
straight forward simple cleanups. So I will at least apply those
right away.

I've some small remarks to patch 6, which I've fixed up while applying
the patch. I will reply to patch 6 with my remarks.

I will continue the process the series and reply to patches which
I have any remarks to. Depending on how this goes I might end up merging
the first X patches, or just merge everything, we will see :)

Regards,

Hans

