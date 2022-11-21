Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF957C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 09:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiKUJpn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 04:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiKUJpk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 04:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6B994A74
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669023876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=su7TSQ7LdZLfUe5cDAl60Bz9Qg3+yC/LHFZinyPivK0=;
        b=f4L4ZvJIqzUVf1YJcsB2+69BiGh8bCry2nau6Hj1sJ1TM8CCO2pWWhdlyhuFse6q8qefz+
        ir3P+noY/bNhvtCKJRYJ73c7KOptpGHQ99BFBkqhuz4bOrQg1hDBRB5lf/3PfXCT2AC6AH
        SQWIIacG6oskG+z/z3Qnxy7gSbyhmI4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-XIOhykFaOlqZ1yGRlmg9yw-1; Mon, 21 Nov 2022 04:44:35 -0500
X-MC-Unique: XIOhykFaOlqZ1yGRlmg9yw-1
Received: by mail-ed1-f70.google.com with SMTP id m13-20020a056402510d00b0046913fa9291so4377759edd.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 01:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=su7TSQ7LdZLfUe5cDAl60Bz9Qg3+yC/LHFZinyPivK0=;
        b=NQs5PuGsCvXl7+sbIHTk1K+p8+TBJHK1X267iyRauvKPE5dNRHqHs/8eDnTJOWOl9C
         PtgHiikFyFqmqumsdbP0mAo+QRomCPtYkS4Dlz3k8ja00dDh1ll2WVQNCrDyDl5hnMp1
         tbAlgnNCPvYJj/i1rGx/ZuJmI7pj0tv8+uz2rzLvsFaLSkA/Y+VsVeetnmgSznhnji5+
         p+EQtdDF68VYUeutWp+HBIMRg8x/fXIwNYBQlaOcar3nuCVyZK5RlO5TXud3CfWBYSA2
         mipM1DNoG/Ze1euTvYeOacJHVJyVIEtMfQjcaBpTGiCXQmbe8QhMy8jGDIoSOPwfmKon
         WGaw==
X-Gm-Message-State: ANoB5pkLfPUpgLUgs4bKQ4tyQjfIIzhNf5Yu/94S1GdDA4dVUFOjSivD
        45SiFqiqUTb3JPGZDJWIbHmIY7TforLlSrP9FhO8+gtp0NA/gyIzMtkfjveMaAeR8C7x7z4YOYW
        G2s+/Z1DHK0tez9rjhN3yZmcD4HrK0ozwyQ==
X-Received: by 2002:a17:906:3fce:b0:7ad:bb54:75d3 with SMTP id k14-20020a1709063fce00b007adbb5475d3mr14418654ejj.484.1669023873844;
        Mon, 21 Nov 2022 01:44:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5CQ4s6u6deYOuzxXR2uxz5DzRtJuc3s5n3j6ZpmqxQNgHFMMoBtAiz6lQg6ylfpO2JOXtkYw==
X-Received: by 2002:a17:906:3fce:b0:7ad:bb54:75d3 with SMTP id k14-20020a1709063fce00b007adbb5475d3mr14418637ejj.484.1669023873597;
        Mon, 21 Nov 2022 01:44:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id i10-20020aa7c9ca000000b00461a6997c5dsm4990751edt.83.2022.11.21.01.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:44:33 -0800 (PST)
Message-ID: <2a3f8cc5-4c6e-7bb9-5a09-1dc20929271e@redhat.com>
Date:   Mon, 21 Nov 2022 10:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 0/8] Redesign the pmc core driver
Content-Language: en-US
To:     Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     irenic.rajneesh@gmail.com, markgross@kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        sukumar.ghorai@intel.com, xi.pardee@intel.com,
        rajvi.jingar@intel.com,
        Rajvi Jingar <rajvi.jingar@linux.intel.com>,
        David E Box <david.e.box@linux.intel.com>
References: <20221114183257.2067662-1-gayatri.kammela@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221114183257.2067662-1-gayatri.kammela@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/14/22 19:32, Gayatri Kammela wrote:
> This patch series focuses on redesigning the PMC core driver for
> maintainability and readability. Moving PCH specific structures and
> functions to separate c files, simplifies core.c file and makes it
> easier to add new platforms in future. The series includes two
> preparatory patches that lays the ground work for the redesign. The
> patch series also adds legacy support for Meteor Lake.
> 
> This redesign adds following c files to support different PCHs. There
> are no functional changes involved for the already supported platforms.
> 
> spt.c: Sunrise Point PCH supports: Sky Lake, Sky Lake L, Kaby Lake,
> Kaby Lake L
> cnp.c: Cannon Lake Point PCH supports: Cannon Lake L, Comet Lake,
> Comet Lake L
> icl.c: Ice Lake PCH supports: Ice Lake L, Ice Lake NNPI, Jasper Lake
> tgl.c: Tiger Lake PCH supports: Tiger Lake, Tiger Lake L, Alder Lake L,
> Alder Lake N, Rocket Lake, Raptor Lake P, Elkhart Lake
> adl.c: Alder Lake PCH supports: Alder Lake, Raptor Lake, Raptor Lake S
> mtl.c: Meteor Lake PCH supports: Meteor Lake
> 
> Patch 1: platform/x86: intel/pmc: Replace all the reg_map with init
> functions
> Patch 2: platform/x86: intel/pmc: Move variable declarations and
> definitions to header and core.c
> Patch 3: platform/x86: intel/pmc: Relocate Sunrise Point PCH support
> Patch 4: platform/x86: intel/pmc: Relocate Cannon Lake Point PCH
> support
> Patch 5: platform/x86: intel/pmc: Relocate Ice Lake PCH support
> Patch 6: platform/x86: intel/pmc: Relocate Tiger Lake PCH support
> Patch 7: platform/x86: intel/pmc: Relocate Alder Lake PCH support
> Patch 8: platform/x86: intel/pmc: Add Meteor Lake support to pmc core
> driver

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






> Gayatri Kammela (4):
>   platform/x86: intel/pmc: Replace all the reg_map with init functions
>   platform/x86: intel/pmc: Relocate Tiger Lake PCH support
>   platform/x86: intel/pmc: Relocate Alder Lake PCH support
>   platform/x86: intel/pmc/core: Add Meteor Lake support to pmc core
>     driver
> 
> Rajvi Jingar (1):
>   platform/x86: intel/pmc: Relocate Sunrise Point PCH support
> 
> Xi Pardee (3):
>   platform/x86: intel/pmc: Move variable declarations and definitions to
>     header and core.c
>   platform/x86: intel/pmc: Relocate Cannon Lake Point PCH support
>   platform/x86: intel/pmc: Relocate Ice Lake PCH support
> 
>  drivers/platform/x86/intel/pmc/Makefile |   3 +-
>  drivers/platform/x86/intel/pmc/adl.c    | 325 ++++++++
>  drivers/platform/x86/intel/pmc/cnp.c    | 210 +++++
>  drivers/platform/x86/intel/pmc/core.c   | 994 ++----------------------
>  drivers/platform/x86/intel/pmc/core.h   |  89 ++-
>  drivers/platform/x86/intel/pmc/icl.c    |  56 ++
>  drivers/platform/x86/intel/pmc/mtl.c    |  52 ++
>  drivers/platform/x86/intel/pmc/spt.c    | 140 ++++
>  drivers/platform/x86/intel/pmc/tgl.c    | 269 +++++++
>  9 files changed, 1183 insertions(+), 955 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmc/adl.c
>  create mode 100644 drivers/platform/x86/intel/pmc/cnp.c
>  create mode 100644 drivers/platform/x86/intel/pmc/icl.c
>  create mode 100644 drivers/platform/x86/intel/pmc/mtl.c
>  create mode 100644 drivers/platform/x86/intel/pmc/spt.c
>  create mode 100644 drivers/platform/x86/intel/pmc/tgl.c
> 
> 
> base-commit: 309e0a6ed6e3fdb4febacc3e91aeb268500b90c6
> 
> Cc: Xi Pardee <xi.pardee@intel.com>
> Cc: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> Cc: David E Box <david.e.box@linux.intel.com>

