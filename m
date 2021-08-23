Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99941C4320A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 07:35:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8126761078
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 07:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbhHWHgM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Aug 2021 03:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58504 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235200AbhHWHgL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Aug 2021 03:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629704128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6OA8eH4X+/rUwV1XCNtrrURDB+H2MofOHgguQaSqFBQ=;
        b=JFqJYfFpOGAXEqBzAb+jLBkrtDz9zZmwIk8jbdMATmo/asBLY2prK+nfIaSeT9n3zPf/m0
        x4oUQgxVSdKWSEKxWonczCH/t7/fH4syxYn8CHctgGv/woc60rI6oAinMufDRJnD4gZEPw
        AR9ZJ8scXnvLE1JhDVfhgqqew/Ec08k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-QqeQzT6HMY2xMIw0SHEQSQ-1; Mon, 23 Aug 2021 03:35:25 -0400
X-MC-Unique: QqeQzT6HMY2xMIw0SHEQSQ-1
Received: by mail-ej1-f72.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso5316292ejc.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 00:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6OA8eH4X+/rUwV1XCNtrrURDB+H2MofOHgguQaSqFBQ=;
        b=mdVo4vFwJbELC9LiTmsP32R9tvtWhok72PWhkGQdD/yJUojWOK+k0gwVj1idDAFQmE
         6ZEEJ1Irot26vCY+UtuHS5wBRQRvxY3f/7ix3QkjlVN4+nyLQKWk4gJkY4Xvqfn5ZWWK
         Y3B9WEYpxBl+9bjFlAl5g6u7s924zDPIjIL5ImSEo+026BE0iqm5U7XKhJXGxBQp947M
         DYYapDV5Fiorsp++YBxrVw7z/C8MiZuwCgf1h5TCbzxEtH5vbglk2EmZf3AWE3adTeiB
         fYyVHuQ57IdlOwAGoWD36JcSI9yp7LBW5pNts/HHuW0r+02rjoIif2WmEAf1BthdE4xO
         zoiw==
X-Gm-Message-State: AOAM5328RGbqQyJgDgC6g/MSauHPHAq6vAtKl9En22YedGtgUGt9stHm
        3MjM+k6wC1BSxngK4D4sMuBnP0rjXCbSKBAOXCk+q0f9NbiSygGMexGTOE8HP47klkjCMJDH+GQ
        GUfU5DiY4BzyHOL1XpDfacKU3cyGjG1kEgw==
X-Received: by 2002:a17:907:12d5:: with SMTP id vp21mr11270074ejb.144.1629704124137;
        Mon, 23 Aug 2021 00:35:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBq9QKj048GdBmdC2ZCRCqLH/ZUbEYowgfxS/omx9bPbu/e87I0uqUwgFEMLs/NTuvVxYNiw==
X-Received: by 2002:a17:907:12d5:: with SMTP id vp21mr11270062ejb.144.1629704123966;
        Mon, 23 Aug 2021 00:35:23 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id oy11sm3669357ejb.104.2021.08.23.00.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 00:35:23 -0700 (PDT)
Subject: Re: [PATCH v5 07/20] platform/x86: pmc_atom: Move to intel
 sub-directory
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kate Hsuan <hpa@redhat.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dell.Client.Kernel@dell.com, Mark Gross <mgross@linux.intel.com>,
        Alex Hung <alex.hung@canonical.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>
References: <20210820110458.73018-1-andriy.shevchenko@linux.intel.com>
 <20210820110458.73018-8-andriy.shevchenko@linux.intel.com>
 <ccae9fcb-fa2f-5c44-1241-9f107b358103@redhat.com>
 <YSNPGRt6azqfXFKP@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6a2c03a2-cb25-5e64-04bd-0e387c2d4cb1@redhat.com>
Date:   Mon, 23 Aug 2021 09:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSNPGRt6azqfXFKP@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/21 9:32 AM, Andy Shevchenko wrote:
> On Fri, Aug 20, 2021 at 08:18:17PM +0200, Hans de Goede wrote:
>> On 8/20/21 1:04 PM, Andy Shevchenko wrote:
>>> Move Intel Atom PMC driver to intel sub-directory to improve readability.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> This means that pmc_atom will now not be build if X86_PLATFORM_DRIVERS_INTEL
>> is not set (and PCI is enabled). Which will cause missing pmc_atom_read/_write
>> symbols in drivers/acpi/acpi_lpss.c. So I have dropped this patch from the
>> set, while applying the rest.
>>
>> Note I'm thinking that we should just remove the whole X86_PLATFORM_DRIVERS_INTEL
>> Kconfig option and in the drivers/platform/x86/Makefile replace:
>>
>> obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)                += intel/
>>
>> with:
>>
>> obj-y                                                   += intel/
>>
>> This will also allows us to fix the scu issue without needing any
>> changes to drivers/mfd/Kconfig .
>>
>> But this can all wait for the 2nd round of renames after 5.15-rc1.
>>
>> For now I'm moving forward with this v5 series, except with this
>> patch dropped.
> 
> Indeed. Thanks for the analysis.
> 
> Btw, should we convert Dell subdir to something similar in terms of Kconfig?

I'm not sure, if someone is trying to build a minimal kernel then being able
to say 'N' once for all the Dell drivers make sense. OTOH even someone
building a minimal (x86) config very likely still needs some of the Intel
drivers.

So I think we should just keep the Dell bits as is.

Regards,

Hans





> 

