Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D912BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 07:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbiECHwC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 03:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbiECHv7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 03:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E2E9201B0
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 00:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651564106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RK4+d7IXOmnVvMuBtdXRM0A5n8ssUbmBR+IC4Lj417Y=;
        b=NRuB3uNBKKVRtL0+ulJ4vcSA2yr5CM471HNOUeM7b5daK7qoeHuxrBgG8CJE8vvkNCl00m
        Ci7k4K9MrbdvQ6uNwpwIhpJxHxRaVHklxjqBwD6v5TgOESwBobvuWDYqx7YYaTe5hL8tZe
        EE1qYIY6ZZqJ55f0qS7rQsEYlBpAzOE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-NRxi7wNTMHWE-sLYLpcRkg-1; Tue, 03 May 2022 03:48:25 -0400
X-MC-Unique: NRxi7wNTMHWE-sLYLpcRkg-1
Received: by mail-ed1-f72.google.com with SMTP id dk9-20020a0564021d8900b00425a9c3d40cso9611688edb.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 May 2022 00:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RK4+d7IXOmnVvMuBtdXRM0A5n8ssUbmBR+IC4Lj417Y=;
        b=ZKVkaB0+XWQ3BlLH7bI3phLZktCLdSwOCP3YFDyt1oxD0aC18Fj8T9cGD1IH8S3Gtj
         3DnzC60Gl/whYi9c3G0zBdwfhbPGtj69aEcK4737jNkSAEtLmTbnmCUDuCqeF3roAqwW
         hbqKoCVIejbMxbHO7LbBSO7TobMyXSYuuYpR0ejjR/ITZXOd6O1xy06xvfZnaYLNmJXc
         eDz6zP8o/FpUyvaaHJHI9jl4xK2cmqCYxz3yQkdD2jnHMBz9qQJT/a8uLpY0yW8qMUVL
         QWQunRVQGb5pF5LFZSyh+95fmrBsyvwLbz49W6GiBIsOjXnJoO7ZHEI86NcT3x5fQ8r6
         yaVQ==
X-Gm-Message-State: AOAM533i4f36hkcM+CY0tj5AdI3vztFe+hmuBr3QWd/z9zcsBH7HQB+4
        Tni6469iSD18gP+yGT6xI9Ce7egn/fYkKDiAkiDMK6T/zyy3BcJeDxZt/pnEPq6ShaXUVv2suZj
        Z2mzdRUuHVx2wnkRvlOcW/PfG3CSTkdG87w==
X-Received: by 2002:a17:906:19c3:b0:6ec:c7b:ed28 with SMTP id h3-20020a17090619c300b006ec0c7bed28mr14140041ejd.612.1651564103919;
        Tue, 03 May 2022 00:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAaULOlxzyT0iv2iUzlfT8MNaSJkBtBPmhJ5VcL6pKgzwEbSFqaxeTus5zp8qT3F+CAYQj5A==
X-Received: by 2002:a17:906:19c3:b0:6ec:c7b:ed28 with SMTP id h3-20020a17090619c300b006ec0c7bed28mr14140028ejd.612.1651564103744;
        Tue, 03 May 2022 00:48:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id dq10-20020a170907734a00b006f3ef214deasm4366641ejc.80.2022.05.03.00.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 00:48:23 -0700 (PDT)
Message-ID: <84b5b002-9d5f-e87d-ef54-95a161a72718@redhat.com>
Date:   Tue, 3 May 2022 09:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/4] platform: allow ATOM PMC code to be optional
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        linux-kernel@vger.kernel.org,
        Aubrey Li <aubrey.li@linux.intel.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20220428062430.31010-1-paul.gortmaker@windriver.com>
 <YmpoeJtFNSyCq1QL@smile.fi.intel.com> <20220428181131.GG12977@windriver.com>
 <827dc313-33ff-1c91-afaf-7645b655a1be@redhat.com>
 <YnABLhyUGR+ZRQ+u@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YnABLhyUGR+ZRQ+u@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/2/22 18:05, Andy Shevchenko wrote:
> On Mon, May 02, 2022 at 04:30:57PM +0200, Hans de Goede wrote:
>> On 4/28/22 20:11, Paul Gortmaker wrote:
> 
> ...
> 
>> As for users breaking support for BYT/CHT setups because they forget
>> to enable this, without X86_INTEL_LPSS being enabled BYT/CHT are pretty
>> much broken anyways and since patch 2/4 adds a "select PMC_ATOM" to the
>> X86_INTEL_LPSS Kconfig option I'm not really worried about that.
>>
>> I'm afraid this patch-set might break some randomconfig builds though,
>> but I cannot see anything obviously causing such breakage here, so
>> I think it would be fine to just merge this series as is and then
>> see if we get any breakage reports.
>>
>> Andy, are you ok with me moving ahead and merging this series as is?
> 
> It seems as is can't be fulfilled due to your own comment, but in general I'm
> not objecting the idea. So, go ahead if you feel it's ready.

Right, my later comment to just replace PMC_ATOM with X86_INTEL_LPSS
supersedes this.

I'll send out a patch with that approach so that this can get some
comments / review.

Regards,

Hans

  

