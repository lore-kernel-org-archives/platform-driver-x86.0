Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C277BC43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Jul 2022 09:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbiGBJyc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Jul 2022 05:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBJyb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Jul 2022 05:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C02F175BD
        for <platform-driver-x86@vger.kernel.org>; Sat,  2 Jul 2022 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656755669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5aY2747Hk3us9Bi14d8WdjF4WmVrxBQs7Bc7ML/SUFk=;
        b=KSFMLIqCMN5iBYZ4BxUG6yjxBsKu6bRK1fHmSpOTfVSLk5wgsNxGlwSSh8B4Hx1M1imQeY
        td82S/vITyFrxNJoFfFJ5wfqNVEsZYRCtj7oWzaZ1dj1p/9JfDa1N24po9N0oHhQ4k9Y2R
        A7LTof3IripBbuyuww8nqT7CqaRycV0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-DsHTfxZiM-OKyRLlKNh7hQ-1; Sat, 02 Jul 2022 05:54:28 -0400
X-MC-Unique: DsHTfxZiM-OKyRLlKNh7hQ-1
Received: by mail-ed1-f69.google.com with SMTP id y5-20020a056402358500b0043592ac3961so3362038edc.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Jul 2022 02:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5aY2747Hk3us9Bi14d8WdjF4WmVrxBQs7Bc7ML/SUFk=;
        b=iNxCj2X0g2+iLCplBEwgud/HMcJd1wmdcZ4mkU/WKJ9I8Y9g0ykxl/apUL5bIEQ8yI
         5vXm5mPGXoTJKjv+PkZuaZS8byB55BuwuPDo4zreqNF6PkmOpYjpolDjgS1Q+xa7/tQv
         RqPTTxtS42g/iKyQQW6u2HDBBLMyOtNbJ0F3x8c1puWBeE8wpy138xBzSYwHGW0nnHpK
         23yG9oeLBg4m9gXj0ydq+YCrwMdTgaJl8sl5XjGbiUcqAnxUWsHV4vqq+gq5t6y9t4ep
         Tka1yZESmacXxv/nJu04Ua+I6FWbDKuBB/5pv7GpfRDx4jxuws4wtq1i7nsT/RT2bzF6
         DJ0w==
X-Gm-Message-State: AJIora+Bfv7KaWvUGW2AXR4XaQXpPvQlmY17AIG/qzAdbAPvsc3fOGka
        6gNa9WRP0fW/akDkhQZCBKi6Kq5e2wK/jItLvQFT9As7wUwWL9zb8k1HNRuLV9QRsmgjfhdVa44
        Z0nOV/fUMX70OlpnlEqgQM7Ol6AurzTm51g==
X-Received: by 2002:a17:907:7283:b0:727:b4c0:b1f6 with SMTP id dt3-20020a170907728300b00727b4c0b1f6mr18578673ejc.197.1656755666982;
        Sat, 02 Jul 2022 02:54:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4/6byBX8rh0oM+kgYZVCwfnRyKKcPLodPqj5yer0AXp+5bcVTNwbBRZT1aNEzCvQOsoO/KA==
X-Received: by 2002:a17:907:7283:b0:727:b4c0:b1f6 with SMTP id dt3-20020a170907728300b00727b4c0b1f6mr18578652ejc.197.1656755666790;
        Sat, 02 Jul 2022 02:54:26 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.147.70])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906308400b006f3ef214e27sm3759870ejv.141.2022.07.02.02.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jul 2022 02:54:26 -0700 (PDT)
Message-ID: <ac7bfd35-203b-5002-a3ff-787ca1738a41@redhat.com>
Date:   Sat, 2 Jul 2022 11:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 0/4] Add Raptor Lake and PCI error recovery support
Content-Language: en-US
To:     Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, david.e.box@linux.intel.com,
        srinivas.pandruvada@intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220629221334.434307-1-gayatri.kammela@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220629221334.434307-1-gayatri.kammela@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/30/22 00:13, Gayatri Kammela wrote:
> Hi,
> 
> This patch set adds Raptor Lake support as well as PCI error recovery
> support to PMT driver. It also has a rework patch and a fix for fixed
> region handling.
> 
> Patch 1: Rework early hardware code
> Patch 2: Add support for Raptor Lake
> Patch 3: Fix fixed region handling
> Patch 4: Add PCI error recovery support to Intel PMT

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


> 
> David E. Box (3):
>   platform/x86/intel/vsec: Rework early hardware code
>   platform/x86/intel/vsec: Add support for Raptor Lake
>   platform/x86/intel/pmt: telemetry: Fix fixed region handling
> 
> Gayatri Kammela (1):
>   platform/x86/intel/vsec: Add PCI error recovery support to Intel PMT
> 
>  drivers/platform/x86/intel/pmt/class.c     |  23 ++--
>  drivers/platform/x86/intel/pmt/telemetry.c |  18 ++-
>  drivers/platform/x86/intel/vsec.c          | 130 ++++++++++++++++-----
>  drivers/platform/x86/intel/vsec.h          |  11 +-
>  4 files changed, 136 insertions(+), 46 deletions(-)
> 
> 
> base-commit: 03c765b0e3b4cb5063276b086c76f7a612856a9a

