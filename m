Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191BAC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 14:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjCPOwa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 10:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbjCPOw1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 10:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A38A882C
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678978297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tw7bSBZTDd8cVyjfcwvHc6Vcof/hpUltsviHy1kMWEE=;
        b=iTdlNV6PM6bjKllJ+zwC7T6PIxxL3NXTBwBzzdWfsVBbNLic53gDKRfNrybaZJn2++bRYI
        B77iIuBiU/julb2GByfLN55gVLcqosfYyJA1YxtDGg7DwcX1bBo2muc7P3pvJElr3Fgs3F
        +lmbXhx3v9cTCDLlia7dN9app+OXR0Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-qCIlr7fyMpm176n66s5L-A-1; Thu, 16 Mar 2023 10:51:35 -0400
X-MC-Unique: qCIlr7fyMpm176n66s5L-A-1
Received: by mail-ed1-f69.google.com with SMTP id j21-20020a508a95000000b004fd82403c91so3411566edj.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678978294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tw7bSBZTDd8cVyjfcwvHc6Vcof/hpUltsviHy1kMWEE=;
        b=pQyouxGTyrf05Cz+LtqD/GchV221czTzWKaEQPg3HkrVzBryG3pMtAESuqGemiucEa
         47WkZXbnYPUgQFPOGMtskoA1gNJifY6EXisQ+4NRXZrsmlFqnrcK+70hCUoqzVMeTYwD
         x1p7l0L1wYTb8P03YwaBUDpBEO5QfstYhnDIeiV84wwrN29gwJbyAINlmwTGGiHx9nnK
         7fKh9eTIqFQBI/jjbleSO6I7aLgR3E8T0IXaiQ7KlBab6pioKK9DedWdKi3Bu+5D7wUc
         CD4SkrcWvFb993FQJOy4WK0UUKyjDOGB3jSTl65uK3U7wccBCpSaRDRPapSc9gAqygSx
         pMKQ==
X-Gm-Message-State: AO0yUKVvIXo0L2jFFc3y3IXjWNUoa+LrdovCgL4kT99wqj0UEo0nrLcx
        NcT/sZkUwAuyL9QwK+kLggqgmi11c2fJdBesE3YDJPvpUAwM4UeTKykZYF7hiFWjyHX0NS9WUC2
        HbQ0vSiOdCA7tuxu+o/8EVydG6cD5ZUP+xA==
X-Received: by 2002:aa7:c054:0:b0:4fd:2290:976d with SMTP id k20-20020aa7c054000000b004fd2290976dmr6470162edo.37.1678978294721;
        Thu, 16 Mar 2023 07:51:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+mrk3Nm9NsulO9ENFABZHkvrVnMLNqkm9qS0VvveoRKRDSsvz7a3U/ks0RHgBltwlRZzuygg==
X-Received: by 2002:aa7:c054:0:b0:4fd:2290:976d with SMTP id k20-20020aa7c054000000b004fd2290976dmr6470138edo.37.1678978294414;
        Thu, 16 Mar 2023 07:51:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t14-20020a508d4e000000b004fc01b0aa55sm3971676edt.4.2023.03.16.07.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:51:33 -0700 (PDT)
Message-ID: <2d8d484d-55d6-446e-10af-49be3f2f0f7c@redhat.com>
Date:   Thu, 16 Mar 2023 15:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/11] Intel pmc_core: Enable telemetry
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, markgross@kernel.org,
        andy.shevchenko@gmail.com, rajvi.jingar@linux.intel.com,
        xi.pardee@intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230315183405.2465630-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230315183405.2465630-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 3/15/23 19:33, David E. Box wrote:
> On Intel SoCs, registers for the Power Management Controller are available
> in the PCI BAR of the SSRAM device, 0000:14.2. On Meteor Lake, these
> registers are structured in Intel PMT Telemetry regions which could be
> handled by the pmt_telemetry driver. This series adds APIs to the
> intel_vsec and pmt_telemetry drivers so that pmc_core driver can both
> create the telemetry instance from the SSRAM device and register for a
> handle to read the telemetry which contains the low power mode requirements
> for the S0ix states supported by Meteor Lake. The series also adds some
> fixes.

Thank you for the series. I notice that none of these patches have a Reviewed-by nor a Tested-by from some other Intel developers.

It really helps if you can get someone other Intel kernel people to review and test your patches and then add their tags before posting a large(ish) series like this upstream.

Regards,

Hans





> 
> David E. Box (6):
>   platform/x86/intel/vsec: Explicitly enable capabilities
>   platform/x86/intel/vsec: Add base address field
>   platform/x86/intel/pmt: Add INTEL_PMT module namespace
>   platform/x86/intel/pmt: telemetry: Add telemetry read functions
>   platform/x86/intel/pmt/telemetry: Add driver version
>   platform/x86/intel/pmc: Add Intel PMT support for MTL PMC
> 
> Gayatri Kammela (1):
>   platform/x86/intel/vsec: Add intel_vsec_register
> 
> Rajvi Jingar (1):
>   platform/x86/intel/pmc: Alder Lake slp_s0_residency fix
> 
> Xi Pardee (3):
>   platform/x86:intel/pmc: Combine core_init and core_configure function
>   platform/x86:intel/pmc: Move get_low_power_modes function
>   platform/x86/intel/pmc/mtl: get LPM information using Intel PMT
> 
>  drivers/platform/x86/intel/pmc/Kconfig     |   1 +
>  drivers/platform/x86/intel/pmc/adl.c       |  17 +-
>  drivers/platform/x86/intel/pmc/cnp.c       |  17 +-
>  drivers/platform/x86/intel/pmc/core.c      |  71 +++++---
>  drivers/platform/x86/intel/pmc/core.h      |  24 +--
>  drivers/platform/x86/intel/pmc/icl.c       |  11 +-
>  drivers/platform/x86/intel/pmc/mtl.c       | 187 ++++++++++++++++++-
>  drivers/platform/x86/intel/pmc/spt.c       |  11 +-
>  drivers/platform/x86/intel/pmc/tgl.c       |  17 +-
>  drivers/platform/x86/intel/pmt/class.c     |  48 +++--
>  drivers/platform/x86/intel/pmt/class.h     |  35 ++--
>  drivers/platform/x86/intel/pmt/crashlog.c  |   3 +-
>  drivers/platform/x86/intel/pmt/telemetry.c | 199 ++++++++++++++++++++-
>  drivers/platform/x86/intel/pmt/telemetry.h | 120 +++++++++++++
>  drivers/platform/x86/intel/vsec.c          | 131 ++++++--------
>  drivers/platform/x86/intel/vsec.h          |  64 ++++++-
>  16 files changed, 790 insertions(+), 166 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmt/telemetry.h
> 
> 
> base-commit: 02c464b73645404654359ad21f368a13735e2850

