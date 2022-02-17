Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EE3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 12:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiBQM0E (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 07:26:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiBQM0D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 07:26:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA8BF2AE282
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 04:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645100748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iUj4J1PFFLeHNXV2hswnucw5C2wWUfAkQGdSpmyWvgs=;
        b=i81LZ1C/WCtBzcnwhXzthFZIm7sH+vLNS/vw0nbcHNlfEGYxaGHJi4gcggXtQIYd+X9Oyx
        zaBTMTakU579oggTHgnKTHY5xQ/cvn6Pq6wcu+nBq5Jhr/rQewQswikRz/WNFpOxDIllRr
        iqWk0MZKxLg/gjSnkCRMMmQ1UgEz92g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-CUIi706gP0-L78Gru4eYIw-1; Thu, 17 Feb 2022 07:25:46 -0500
X-MC-Unique: CUIi706gP0-L78Gru4eYIw-1
Received: by mail-ed1-f72.google.com with SMTP id d11-20020a50c88b000000b00410ba7a14acso3420247edh.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 04:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iUj4J1PFFLeHNXV2hswnucw5C2wWUfAkQGdSpmyWvgs=;
        b=fLQi7kz0oBv1n6Y4qP1Ua5FnkxHEQGSjD20uIs8PgdLJmkhqsFHrK3I8exKpiWUJSy
         Gr9PpkeLXeoif6AWrLSXGVPAMBRDhOORbEKK8vebN20gfyHI0xS8fBNPJYXJ3/3k755L
         MdHdzaeoL09zFHWKdZBa0RzoMOwOmxz5ppdjUeDAjB/t7cB3t/VwAn/oIGaUWQEsvvxw
         1gZk42RjNbrqTc1r2zXo5Cd5yhsfdjZBLlxhoxPt9kTrc+l6ZlAeX3GsD3Az1c6AIBYd
         dGtivwjl+HGu+SJd/TepV8sCZs9LUT6S4QxDHiA+PbWdpv/afiD4bnYDdn11zluzMtps
         BaZQ==
X-Gm-Message-State: AOAM530d+WRpauqvgLXmf+eiHExQ5ek8Otp140qYUdOUo907gcY58l0P
        1UbB6J5wys7HsqN21fy6mmieA8DVjnSuWo69PLuFk9NzjH1eF+WG6ZgYZQHyPfkoUKo7j26u6ll
        IqmbVFK+BDb5KWyhFuUA481sx7vk3EVorRg==
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id g2-20020a17090670c200b006cfe1cc4d8cmr2224505ejk.696.1645100745349;
        Thu, 17 Feb 2022 04:25:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN/iov4B91rfM/jVGW5nEH5EFSej0rTDUYappc11DWR8GVyjT7l+SS39eRGb0gPCW/KsDCjQ==
X-Received: by 2002:a17:906:70c2:b0:6cf:e1cc:4d8c with SMTP id g2-20020a17090670c200b006cfe1cc4d8cmr2224490ejk.696.1645100745075;
        Thu, 17 Feb 2022 04:25:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b11sm3251779edd.17.2022.02.17.04.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 04:25:44 -0800 (PST)
Message-ID: <bfbf91a7-1266-89da-c242-9fef14b6fc70@redhat.com>
Date:   Thu, 17 Feb 2022 13:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/4] platform/x86/intel/uncore-freq: Enhance HW interface
Content-Language: en-US
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/22 01:03, Srinivas Pandruvada wrote:
> The uncore frequency scaling is getting used by more customers to either
> have a deterministic performance or control power consumption.
> The uncore frequency scaling depends on non architecture MSRs, format of
> those MSR can be different on different generations of CPUs.
> This series prepares for easy addition of new HW interface.
> 
> There are no functional changes done except adding a new addition to
> read uncore frequency.
> 
> - The first patch creates a separate folder for uncore-freq.
> - The second patch uses sysfs groups to create attributes.
> - The third patch adds capability to read current uncore frequency.
> - The fourth patch splits common and enumeration part. The enumeration
> part will be specific to each HW interface.
> 
> Srinivas Pandruvada (4):
>   platform/x86/intel/uncore-freq: Move to uncore-frequency folder
>   platform/x86/intel/uncore-freq: Use sysfs API to create attributes
>   platform/x86/intel/uncore-freq: Display uncore current frequency
>   platform/x86/intel-uncore-freq: Split common and enumeration part

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Note I've squashed a small MAINTAINERS change in to patch 1/4 so
that the maintainers entry now points to the new sub-dir.

Regards,

Hans



> 
>  drivers/platform/x86/intel/Kconfig            |  14 +-
>  drivers/platform/x86/intel/Makefile           |   4 +-
>  drivers/platform/x86/intel/uncore-frequency.c | 452 ------------------
>  .../x86/intel/uncore-frequency/Kconfig        |  21 +
>  .../x86/intel/uncore-frequency/Makefile       |   9 +
>  .../uncore-frequency-common.c                 | 252 ++++++++++
>  .../uncore-frequency-common.h                 |  62 +++
>  .../intel/uncore-frequency/uncore-frequency.c | 272 +++++++++++
>  8 files changed, 620 insertions(+), 466 deletions(-)
>  delete mode 100644 drivers/platform/x86/intel/uncore-frequency.c
>  create mode 100644 drivers/platform/x86/intel/uncore-frequency/Kconfig
>  create mode 100644 drivers/platform/x86/intel/uncore-frequency/Makefile
>  create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
>  create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
>  create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> 

