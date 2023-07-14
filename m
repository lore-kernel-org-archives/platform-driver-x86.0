Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075A3C0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 13:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbjGNN2K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbjGNN2I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 09:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB052698
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689341240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9IgKJJNZS/TbDNJUn/7MzKZpZbUXG/7hMfiYQjSmbSw=;
        b=VxqRzXuD12LnOLfxlcltVbe7fEJ8+7pEHNntrPo0B8lXK0A6FFbX0vwnZX22ej8UBVsb07
        TSSD20qfBgltkoXoKNRiB7LPQKOARLa+0nY4FtxDVya+t+5nHsEWnqGsYD2GV2GHoyM3iX
        7hhtNE7JMJh1ueb8I5I4XY3+sEGqMfY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-vecv8WC6MiW1xfF9VETKrg-1; Fri, 14 Jul 2023 09:27:19 -0400
X-MC-Unique: vecv8WC6MiW1xfF9VETKrg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34a0b75eso117811266b.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 06:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689341237; x=1691933237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IgKJJNZS/TbDNJUn/7MzKZpZbUXG/7hMfiYQjSmbSw=;
        b=CuP5Qe2xAA9AWPWBoC/x5z/4a+Ah1vcM346MNLg2bagqV3zwnz4n7SmJAlvuIeoIXi
         IrKnHwUTzOhWfyh2X3CeS+pCQ1UeIAdblKCob7sJM3Sk6/XwydIPg1Q5vKUchKPfRtz0
         hi5yrIgTrPMZ7MqXAcztPyq874goUemwn5/Y61lQtQEPdU9H2oo3xrBQZJo9H1XAo6mG
         KANaLq7T/WOFErleHlTgbWVPeeEVIuOLn/4tTZURulZFLlikDHtNfyVL8SZn/RCXAOrY
         ZTllrZLRpnqPUzfccEWY4GLGbHncOXkakrnPkrZA+9hpaliVnTYsvqS/ilJS0pM22tnH
         JZbQ==
X-Gm-Message-State: ABy/qLbQT+JJDV/69KS6p5cGEPjlME6NWPGYHJlYnb4Xt6xER131PdJp
        X1vItSf4bnDbRv3VGAMcjIai+AEP1Gnur8SluZ2KH/UQ5Pk/Q7G6oWcPXPYhlxbFFQw4PTwhG90
        AIKrZbjJg061V9cu3ibkkXooAfWTSblCoYY42fbd8SQ==
X-Received: by 2002:a17:906:3497:b0:970:1b2d:45cc with SMTP id g23-20020a170906349700b009701b2d45ccmr3970350ejb.57.1689341237592;
        Fri, 14 Jul 2023 06:27:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHZ/14VylTsfFAfhnHMA1XfeuCqWXa+D2USRkhwFQazztUpCpKRZA9cAXIsQP6UXeld4EY29A==
X-Received: by 2002:a17:906:3497:b0:970:1b2d:45cc with SMTP id g23-20020a170906349700b009701b2d45ccmr3970342ejb.57.1689341237291;
        Fri, 14 Jul 2023 06:27:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p18-20020a1709060dd200b00982d0563b11sm5405286eji.197.2023.07.14.06.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:27:16 -0700 (PDT)
Message-ID: <8737515b-e5ef-2614-70bf-c296eeda46d5@redhat.com>
Date:   Fri, 14 Jul 2023 15:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 0/3] TPMI control and debugfs support
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712225950.171326-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230712225950.171326-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/13/23 00:59, Srinivas Pandruvada wrote:
> The first patch provides interface to read feature status. This is
> generic patch to be used by other feature drivers.
> 
> The second patch add support for debugfs. Debugfs also display
> feature status using the first patch
> 
> Srinivas Pandruvada (3):
>   platform/x86/intel/tpmi: Read feature control status
>   platform/x86/intel/tpmi: Add debugfs interface
>   doc: TPMI: Add debugfs documentation
> 
>  Documentation/ABI/testing/debugfs-tpmi |  31 ++
>  MAINTAINERS                            |   1 +
>  drivers/platform/x86/intel/tpmi.c      | 399 ++++++++++++++++++++++++-
>  include/linux/intel_tpmi.h             |   2 +
>  4 files changed, 426 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-tpmi

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

With Andy's Reviewed-by added.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


