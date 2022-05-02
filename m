Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146D3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 May 2022 15:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385774AbiEBPf3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 May 2022 11:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376473AbiEBPf2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 May 2022 11:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1218A6340
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 May 2022 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651505518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0sglHWDk0UrNSQnvXeEwWDQVaJy7moHeM6s16y69uVg=;
        b=P5BmmuXlnQksTAsfgDTsMCXTOSiurC7Axl/LyVnRyL4xtOxYHhbZa50fewfWDu8vbjNS2l
        vEpHjD90/89DHJe0/XOK/WLE/fsxBS7QcBJbBFtLlWQTtBIawchYdXOhGXIynT1YZhqsDx
        RZrZLh/75b8PtgEMhdD6I6WolDXfMew=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-wcA7EBEsNt227gP1oxUeEg-1; Mon, 02 May 2022 11:31:56 -0400
X-MC-Unique: wcA7EBEsNt227gP1oxUeEg-1
Received: by mail-ej1-f69.google.com with SMTP id jg5-20020a170907970500b006f42a861bb9so1549993ejc.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 May 2022 08:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0sglHWDk0UrNSQnvXeEwWDQVaJy7moHeM6s16y69uVg=;
        b=QSBXX8CVZS1RDdXVA1alOKpqMXSlr64Y2gKY3Ak6HGT20KbNXPohnyBxg512R45L2O
         JJt/9VhgdUz5yyDWp5VBZEMVkoMGBm3Ex1XNcsP7cU1+b6hKSfe3tqhCgK7JOCiCVj41
         wZKT7bUeKlluqwfAoeJngyMV396Uywwe1Eig+IIo9PxwtPfisohJFNf3bmPrFiFiSE5t
         Uj/oB1c4lPINSE/DvQ8/aoezTa8fdFONEqaYLDh+02SId3MFcmjvoB5JW07kGWmsuToL
         Owj+1iNJXGeMCJ8ELU9hz2IfQtud5BHMZI5MFIHjdOxuqpBTuhVWI7NMwxyqXCIYHgTu
         G90Q==
X-Gm-Message-State: AOAM532xOwlTLKzDBSs2mwxPepFriw68grr+oMoDpdH4SfFmf1tGZl1T
        35C69uQJehku6HMszsH/noTAObZYHgcTRsWQTPUTo4tOXkspYg+A3Om6zfYe2kfFpInihsR1pOU
        6Pq2cREqxKXqKj0SVPgy6eMfXJ23GJ2ZGmw==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id 4-20020a170906310400b006ce6b85ecc9mr11125205ejx.339.1651505515474;
        Mon, 02 May 2022 08:31:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIVrdqnhRmWiDRTOAiDHV2xSjT5UaIDqHpuf7N4+qIPVbf8KtFs1CmxMzjfWdo0GGG2m0qpw==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id 4-20020a170906310400b006ce6b85ecc9mr11125166ejx.339.1651505515066;
        Mon, 02 May 2022 08:31:55 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id jl1-20020a17090775c100b006f3ef214e2bsm3772097ejc.145.2022.05.02.08.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:31:54 -0700 (PDT)
Message-ID: <0232e24a-eda6-4baa-6a95-13e32b777ce6@redhat.com>
Date:   Mon, 2 May 2022 17:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] Add a workaround for s2idle resume on Lenovo laptops
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:THINKPAD ACPI EXTRAS DRIVER" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "open list:THINKPAD ACPI EXTRAS DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220429030501.1909-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220429030501.1909-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/22 05:04, Mario Limonciello wrote:
> Lenovo Thinkpads have a SMI handler during the D0 transition for NVME
> devices specifically during resume from s2idle.  When the IOMMU
> translation layer is enabled for NVME devices (which is the default
> behavior per the IVRS table), then this SMI handler causes a very long
> resume time (10+ seconds).
> 
> For the common s2idle circumstance on Linux this SMI handler is
> unnecessary and just significantly inflates resume time. To avoid it,
> add a new s2idle resume handler to thinkpad_acpi that will prevent it
> from running on known problematic systems.  If the SMI handler is fixed on
> these systems the DMI data can be modified to exclude them or only match
> problematic BIOS versions.
> 
> Mario Limonciello (2):
>   platform/x86: thinkpad_acpi: Convert btusb DMI list to quirks
>   platform/x86: thinkpad_acpi: Add a s2idle resume quirk for a number of
>     laptops
> 
>  drivers/platform/x86/thinkpad_acpi.c | 134 ++++++++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 3 deletions(-)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

I'll also cherry-pick these into the pdx86 fixes branch and add them
to my next 5.18 fixes pull-req to Linus.

Regards,

Hans

 

