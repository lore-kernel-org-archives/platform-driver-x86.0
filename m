Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5E0C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 09:04:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC5C56113D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 09:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhFVJGQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 05:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58273 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229486AbhFVJGQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 05:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624352640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ANzaJSLFFBLAe06Y/sBuxfE6og1qOQNyUI433GTInyA=;
        b=iq2iqCVk1d6Il3domIz4K5zVp6uxMusLQZw4d630bKL1qeNJOFIAn3d6W+j8JtjIUXPuSy
        kstqTd2TLtGKsYG3DsCUaFXrLriWJLMVtbDsDxiufB4HNOjdfTnDD3+JAzBlrXcEFLNtnc
        ry2G24J4vO4MkjYBRXsC9JOLOL0xmgU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-YcuZbauKMVGtxJxWaMhf0w-1; Tue, 22 Jun 2021 05:03:58 -0400
X-MC-Unique: YcuZbauKMVGtxJxWaMhf0w-1
Received: by mail-ej1-f72.google.com with SMTP id ho42-20020a1709070eaab02904a77ea3380eso182696ejc.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Jun 2021 02:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ANzaJSLFFBLAe06Y/sBuxfE6og1qOQNyUI433GTInyA=;
        b=pM6jl3YHK3KPQ/nG/nZCYa6YVIrXVpKbo5y/J6azWULwqOh7/0qsoKZQu2Qg4E3m+t
         aTkYgcqJ8SIKeqcBFq5tZik5TyI+j9Qi6sDilkVkZaaSZp1Fb9IgdEdC2XvKI2kZf/E6
         /yKI5F6Ia/Ol25f/KrMlyInzDGaMESaeI0nxCg/tCqivMv7ZLoAbcY3en91XFEzvdtQ9
         vRUTy6goY+/Dfl15NwAvsqNmiyj77lLjh1PGD/SBEE3SkMgPzEf2H1DtAuux6KTCTyiY
         TX3Avyv23rljvvtNHGhR/gD6/U8LWrba8eW2oiC5tpYExqWVr22hSeOaZ7LIJKUpUvbX
         BGGQ==
X-Gm-Message-State: AOAM5306Ipqtu93pUfylyoExScs2zSeK9uzSEkhiBPt8f3dlYvFPq1SO
        0coH9fNqDuzamPWBMyzlt3mzWH6M8pCy/oo6ZKz8IL1JaVxuM7wYeGbD1nyEfV5G1XK0Zc3sExv
        aqS0C1RqVAudwBxqCHJ7ftn7OVRJAu5dqQQ==
X-Received: by 2002:a17:906:1318:: with SMTP id w24mr2810239ejb.222.1624352637773;
        Tue, 22 Jun 2021 02:03:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWoz+otEuPZXWbOrMuuDEoK9BD/nT21EjD39p7UyGYGWFwNQQpD2zMULF+0d5rNvHcwjPpYw==
X-Received: by 2002:a17:906:1318:: with SMTP id w24mr2810224ejb.222.1624352637655;
        Tue, 22 Jun 2021 02:03:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ee47sm4586283edb.51.2021.06.22.02.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:03:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] platform/x86: Remove "default n" entries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
References: <20210618125516.53510-1-andriy.shevchenko@linux.intel.com>
 <CAHp75Vcjr5F=4qSCrEWtUhBhFycBrE6u55Krg77ENsVn6DbOMA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <23f1f2db-7a08-416e-ba0a-4cbf9774647f@redhat.com>
Date:   Tue, 22 Jun 2021 11:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vcjr5F=4qSCrEWtUhBhFycBrE6u55Krg77ENsVn6DbOMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/22/21 11:02 AM, Andy Shevchenko wrote:
> On Fri, Jun 18, 2021 at 4:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> Linus already once did that for PDx86, don't repeat our mistakes.
>> TL;DR: 'n' *is* the default 'default'.
> 
> Daniel, thanks for your testing!
> 
> Hans, patches 2-6 were reviewed and tested, do you think we have a
> chance for the series to be applied?

Yes I was working on applying it right now :)

Regards,

Hans


