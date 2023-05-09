Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEB1C7EE24
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 09:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbjEIJVF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 05:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbjEIJU1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 05:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334E819A3
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683623978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZWNrPjJClNk2tTJqQsLsON3RxLFqVAdo0C0Uzamz98=;
        b=S8B8uMniZg9VXWSAs59uZloOsEXMWVTK9xfLmCIZN/ojT+q/QB9STpHPYkBe1OFAImMRYo
        OUm+yFo1dfovG9+jP993FFVV+njN+FqHS1g/L9+1o9A0pRrK7Cy1lnWvmDgl+8IZhtjEpO
        Hf4JtRplQIDQhN/DTODNAnVAJfHnQd0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-3t_k6MkzNCKbTqzqN1zEsw-1; Tue, 09 May 2023 05:19:37 -0400
X-MC-Unique: 3t_k6MkzNCKbTqzqN1zEsw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9662fbb79b3so293028666b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 02:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623975; x=1686215975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GZWNrPjJClNk2tTJqQsLsON3RxLFqVAdo0C0Uzamz98=;
        b=gFzQIQOXNtyWlcarzoO363h7G0X9zFbdGifDfn3p3Mr6gx/y/l7NdvTjpvSQM8GA37
         i2H6ef/yoDhkTgy+AYkcLysIEVbjzf+xaqbqi1VLq9VP3V4QLFkkneQk82H/UUDO2Lhb
         94W1VXqTqwAxT/rpKIniFC5BdPsSBEMETakDBynYok8Z29+WyO4YpjwmVQNBLvDv72Wt
         iCH6W18fnY3rD6rwLesH7IHCPDxb1wrk/uk+OHJvIo6ke6m1WeKWJ2QIm6JuTXs7ckQv
         UNtP2NJyRRWuEGf1CmoDQ3j6GEcitC3HY6NatZiUqSMXjnGoRlqjjrXm1GVGL7x7g6qR
         sPRg==
X-Gm-Message-State: AC+VfDwHt3nwrPgBe75YMrcMiD/+a5fgJCd6aZKNnFQxwVBI6EwzMuOr
        UyquhzHLwRth2gWVg8SenbN6GZh9w+0EVgMYIJZzF/joV4IfkrH/ssURq9Fyh0G2axQNDZt8rsU
        9vgHt00UwuBFMLmoQWA8M/lps++2eN0q82/T3MxK8PQ==
X-Received: by 2002:a17:907:5c5:b0:95f:56e8:1c3c with SMTP id wg5-20020a17090705c500b0095f56e81c3cmr11216027ejb.17.1683623975516;
        Tue, 09 May 2023 02:19:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5j287DFP8IHyRW9PPepnhjkGMk46wbQKsdzIHLY7OYt3AXaqK3kmnbU5pPVWrjfQbMf0Exsg==
X-Received: by 2002:a17:907:5c5:b0:95f:56e8:1c3c with SMTP id wg5-20020a17090705c500b0095f56e81c3cmr11216009ejb.17.1683623975155;
        Tue, 09 May 2023 02:19:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090655c400b009660449b9a3sm1080351ejp.25.2023.05.09.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:19:34 -0700 (PDT)
Message-ID: <5a8bba97-00dd-5a02-f378-944dbc075909@redhat.com>
Date:   Tue, 9 May 2023 11:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/3] Uncore frequency scaling using TPMI
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230418171340.681662-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230418171340.681662-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/18/23 19:13, Srinivas Pandruvada wrote:
> Implement support of uncore frequency control via TPMI (Topology Aware
> Register and PM Capsule Interface). This driver provides the similar
> functionality as the current uncore frequency driver using MSRs.
> 
> Previously I posted only 1/3 and got reviewed and addressed with
> this submission. The other two patches were links in the submission.
> 
> But it is better that all three patches considered together.
> I know this is close to merge window for 6.4, so it is fine to differ.
> 
> Srinivas Pandruvada (3):
>   platform/x86/intel-uncore-freq: Uncore frequency control via TPMI
>   platform/x86/intel-uncore-freq: Support for cluster level controls
>   platform/x86/intel-uncore-freq: tpmi: Provide cluster level control

Thank you for your patch-series, I've applied the series
(with the updated 1/3) to my review-hans branch:
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
>  .../pm/intel_uncore_frequency_scaling.rst     |  57 ++-
>  .../x86/intel/uncore-frequency/Kconfig        |   4 +
>  .../x86/intel/uncore-frequency/Makefile       |   2 +
>  .../uncore-frequency-common.c                 |  51 ++-
>  .../uncore-frequency-common.h                 |  16 +-
>  .../uncore-frequency/uncore-frequency-tpmi.c  | 418 ++++++++++++++++++
>  .../intel/uncore-frequency/uncore-frequency.c |   1 +
>  7 files changed, 545 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> 

