Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CB5FA3741
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 15:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236242AbiJ0Pkt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236230AbiJ0Pkm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 11:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D4F900F8
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666885241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YKRsMCLFqXQIRxY49mceOe7zpnfO38tmJlxXIDPO3nk=;
        b=E6zmMnyvnDzzaYEs6tFOO3UGNIDC+V5aT6tWy8NE2vKvbsR+dVb85lTdXbnrfUjcRrjz+b
        Uk85HT5HUoRog7JjCuAmLGbnDF4Qu/cxaZ8GWCirtO3dpt/moOvdyZreuOYjqsDDIo4KoA
        ODO5D1Enz1tTCW5MKZCtk2L1X7Psfh0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-KFCMn0r6P86Dfqt2_PMQYg-1; Thu, 27 Oct 2022 11:40:39 -0400
X-MC-Unique: KFCMn0r6P86Dfqt2_PMQYg-1
Received: by mail-ej1-f72.google.com with SMTP id sc11-20020a1709078a0b00b0078d95df8a2eso1267943ejc.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKRsMCLFqXQIRxY49mceOe7zpnfO38tmJlxXIDPO3nk=;
        b=PY4lPR94dtGUuEWyYlpv6lzQbtQMvgjTrEayvYbmFiiZlwBuWHsXh/31IJer6BbwWy
         I+K9WZXRL6qbWeoswquGnCaZyMcJcIdqzYMl7NANDpSNIMOPy4cnuXxJKHAmlL7fHG0Z
         iWh0u3sgWm0mc4weppWYKsLLrQSVFng5CWiNvAPWcAiXsVj8nxCpenJ8DvfewleteBqE
         9CfWt0gdVIjA4T/mIha+PhStbuFMnk+yq7b0Lf8wQytsmrItiGiwKR4qGPW6Tscx6+jU
         Y8bheUbjW7G6VGradYdOO+CEAhn+YAafn+tLfAKazdmDWD6RHh8UCirG/7yYUWGvOMRH
         2Xqg==
X-Gm-Message-State: ACrzQf3I0/f7XJGCRJuEFzmaVuFxtkXkhZAx38aBvY4jCspKKterEj7s
        Z6XELj+36mtkORQEQvXieeMdYvsxsiJYuva325aFvG12eATAHJCie+Bnnc0x2UlyRoA1JpxJ2yh
        iim9oBv8VUOebZTve/qcFdl3I3C55mUyZMA==
X-Received: by 2002:a17:907:a067:b0:7a7:dc5e:eb2d with SMTP id ia7-20020a170907a06700b007a7dc5eeb2dmr20247171ejc.121.1666885238070;
        Thu, 27 Oct 2022 08:40:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Fsb3RaQYZ9nrA1g50CSpu2aVgB/3n8AKmtdSp8DoNxb2z0BGKLJ2hM5h6GwUEI0EWwBKMHw==
X-Received: by 2002:a17:907:a067:b0:7a7:dc5e:eb2d with SMTP id ia7-20020a170907a06700b007a7dc5eeb2dmr20247150ejc.121.1666885237895;
        Thu, 27 Oct 2022 08:40:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jp1-20020a170906f74100b007a9a56e2a07sm965692ejb.49.2022.10.27.08.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:40:37 -0700 (PDT)
Message-ID: <4b7304c0-8dd5-9add-7c84-4e9f0aa9396b@redhat.com>
Date:   Thu, 27 Oct 2022 17:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1] platform/x86: intel_pmc_core: promote S0ix failure
 warn() to WARN()
Content-Language: en-US, nl
To:     Sven van Ashbrook <svenva@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Rafael J Wysocki <rjw@rjwysocki.net>,
        Rajat Jain <rajatja@google.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
References: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221027151908.v1.1.I295e65357f06f162b46ea6fc6c03be37e3978bdc@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/27/22 17:19, Sven van Ashbrook wrote:
> The "failure to enter S0ix" warning is critically important for monitoring
> and debugging power regressions, both in the field and in the test lab.
> 
> Promote from lower-case warn() to upper-case WARN() so that it becomes
> more prominent, and gets picked up as part of existing monitoring
> infrastructure, which typically focuses on WARN() and ignores warn()
> type log messages.
> 
> Signed-off-by: Sven van Ashbrook <svenva@chromium.org>

WARN() is really only intended for internal kernel bugs and not for
hw misbehaving, so I'm not a fan of the change you are suggesting here.

Intel folks, do you have an opinion on this ?

Regards,

Hans


> ---
> Against v6.1-rc2
> 
>  drivers/platform/x86/intel/pmc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index a1fe1e0dcf4a5..834f0352c0edf 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -2125,7 +2125,7 @@ static __maybe_unused int pmc_core_resume(struct device *dev)
>  	}
>  
>  	/* The real interesting case - S0ix failed - lets ask PMC why. */
> -	dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
> +	dev_WARN(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
>  		 pmcdev->s0ix_counter);
>  	if (pmcdev->map->slps0_dbg_maps)
>  		pmc_core_slps0_display(pmcdev, dev, NULL);

