Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6A4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 15:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D9B4610EA
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 15:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234571AbhKBP2w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 11:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234590AbhKBP2v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 11:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635866776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=89OwjSHhRUc5TKARB/wwFNGb4/vNxlAmpJoF8OrxBjs=;
        b=iUs7dkynbei0t21toAV4SyTJXeDHA8rtZi5ufGAeD6lXkB9z2XQi+HQXStNRn3Jj4FkgL8
        xNrtUMG3Wp8+n9uIpo/xWKdKVysLpIRQovc9HWEC9iPTDCtxxn/2xdZOE2HJaA9lKs43ue
        qFO1srindj+1DtTqT3clePit/EYthMg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-M8A5VwBhOs-hS-53U-Vf_w-1; Tue, 02 Nov 2021 11:26:15 -0400
X-MC-Unique: M8A5VwBhOs-hS-53U-Vf_w-1
Received: by mail-ed1-f71.google.com with SMTP id f20-20020a0564021e9400b003e2ad3eae74so459260edf.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Nov 2021 08:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=89OwjSHhRUc5TKARB/wwFNGb4/vNxlAmpJoF8OrxBjs=;
        b=J3G+pe9GaV7xuWRDLA+u0FOlnGFiDMB4yF9Zwn57metP/jrvpgh5+lW+LdOgR1X0/n
         qV7IBXnJZfzZE5dCZ+IzaFRQ37EoaiEx3A/Wfs2FmeJjKOvp3Rplv01/P82Y8G0Jsgp+
         XDOojVtL4A1h1srGlg6vcbcwP7QS3CciIvhGdgpMslaR3k1mQ4YpR2P4IJoFf3kcNaW2
         emTiybonDpd/2Q+yXfQjCwjcnA77nznSCQc65GX0e2Y8gYB6rE/Ua3CbgSZpHd1ym3A3
         NUMOahvr4lV9i1Dbou7gulpwnXovD3bBab22Ozb/cs8rdLBCrJKofIcHwMdyr/bA1fb/
         ZLuA==
X-Gm-Message-State: AOAM532qdShnAkqTbsdIq97qp/n2mPP5d/QniF01vKy1cX8tsT7nm+ht
        K8EheObLMt183r2RV2kIOA3gVBOvuksSS2GUuwf08vojh5V8LUZN3ovXtI4nbbpAvKG8bJrz9PE
        EuiN9sdCJdzhdLXfIukmpQymm3Cr9GGqVjw==
X-Received: by 2002:a05:6402:4401:: with SMTP id y1mr12668613eda.225.1635866774248;
        Tue, 02 Nov 2021 08:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAn2UDGcrFsyIYOLDeKibrEe02o7BrQtwnWNva9u6fGpKkXaOt/FpdFXQqm48SR6QpVZTb3A==
X-Received: by 2002:a05:6402:4401:: with SMTP id y1mr12668583eda.225.1635866774054;
        Tue, 02 Nov 2021 08:26:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sg17sm3526921ejc.72.2021.11.02.08.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 08:26:13 -0700 (PDT)
Message-ID: <0bd6303e-1f93-1fc0-1dcc-329092ac9963@redhat.com>
Date:   Tue, 2 Nov 2021 16:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: Tree for Nov 2 (drivers/platform/x86/amd-pmc.o)
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20211102191553.7467166d@canb.auug.org.au>
 <caa259b7-0560-647d-80d0-6dd25a6f09d2@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <caa259b7-0560-647d-80d0-6dd25a6f09d2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/2/21 16:14, Randy Dunlap wrote:
> On 11/2/21 1:15 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any v5.17 related material to your linux-next included
>> trees until the merge window has closed.
>>
>> Changes since 20211101:
>>
> 
> 
> on i386:
> 
> ld: drivers/platform/x86/amd-pmc.o: in function `amd_pmc_suspend':
> amd-pmc.c:(.text+0x5db): undefined reference to `rtc_class_open'
> ld: amd-pmc.c:(.text+0x5ea): undefined reference to `rtc_read_alarm'
> ld: amd-pmc.c:(.text+0x604): undefined reference to `rtc_read_time'
> ld: amd-pmc.c:(.text+0x660): undefined reference to `rtc_alarm_irq_enable'
> 
> 
> Also "depends on RTC_CLASS" ?

Yes, thank you for reporting this. I've just send out my main PR
to Linus for 5.16, which includes the amd-pmc changes here.

I'll prepare a patch and include that in my first fixes PR to Linus
once 5.16-rc1 is out.

Regards,

Hans

