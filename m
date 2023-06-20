Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF06DEB64DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Jun 2023 10:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjFTK47 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Jun 2023 06:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjFTK46 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2023 06:56:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85EA197
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2023 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687258570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=052e1nKmdQCg7m1wzHj9pJt49WF7dYPUwtoAs0k/Va4=;
        b=PpfWwK4ng6VyENrfrlr5L/va1gsfc3lfu7WuRlY4JVshgJdYCuzLID5f1N9BfCPWypZX6T
        MmX0JDrRmrdQLsIrjop1yQKZSpwil3DZFGU5fP+YfgLtsDz9RKpF+NI1aFmkg6Kuh9ZqB3
        1VinauVRI0AG2Rtv/ODQ/Dg28OwAUec=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-3MTlMSJfNSGhjp3GYXe29Q-1; Tue, 20 Jun 2023 06:56:08 -0400
X-MC-Unique: 3MTlMSJfNSGhjp3GYXe29Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9835bf83157so334784966b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2023 03:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687258567; x=1689850567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=052e1nKmdQCg7m1wzHj9pJt49WF7dYPUwtoAs0k/Va4=;
        b=d48UazFotONkzoRs39YfRW8N/Lli9lV4jt+YrnQSN95V2zwzhM2pXujWDouHdpQcOV
         6rIq9EnUDsvFcwPQHVhIRpgQHzzFvNCPedyJVC72VEci3OPbPhJenb2c7H6A9JwfUULw
         +RKpg0MZA4AMuVYlUQGeuKqSkA0FOeY3XX4IDIHq8TTytPCx9YEd7JDTsenrBhGuf+Uu
         AmE3UEfrIxxUCXrFH1igvQ+B2p9nbbaiJVWVgKdZYWnzPQzNyfwsxlk3lcOtsFs/cfgb
         WW1EzrjUrewzL6unCJJh13kZffwAMGZ96N2dmmRxRWUyDX30oKZ1hNJvgJWJo5Ge7uwZ
         x5pw==
X-Gm-Message-State: AC+VfDxmUNoYuB7pcDD+3hNM002ZyJVSo8Lmt1uEHLUt+gYdwAZ788jA
        7XHCKFMVFdTyd1fTr9kG/n/kwgejzLq6xOTlUsfRxIsJddLYzj2rZSNJsms6vR9xMM5z0R4imPP
        m+L5tVJnj9qUfrZwHiZ24vfhmVz4nMA9ZFw==
X-Received: by 2002:a17:907:3e0a:b0:974:1ef1:81ad with SMTP id hp10-20020a1709073e0a00b009741ef181admr12126275ejc.4.1687258567471;
        Tue, 20 Jun 2023 03:56:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6PVKZpAWGwEI7g+6CZqHGpDz+kkW/Ai2NeMQNHK6x359/dg6aaPO/nDhVVoU6EdBIvy0yLHg==
X-Received: by 2002:a17:907:3e0a:b0:974:1ef1:81ad with SMTP id hp10-20020a1709073e0a00b009741ef181admr12126263ejc.4.1687258567173;
        Tue, 20 Jun 2023 03:56:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709060a4c00b009737b8d47b6sm1140785ejf.203.2023.06.20.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:56:06 -0700 (PDT)
Message-ID: <99b14625-b760-21c2-61da-755813755971@redhat.com>
Date:   Tue, 20 Jun 2023 12:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/8] Add multiple PMCs support in pmc core driver
Content-Language: en-US, nl
To:     Rajvi Jingar <rajvi.jingar@linux.intel.com>,
        david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
        irenic.rajneesh@gmail.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     xi.pardee@intel.com
References: <20230613225347.2720665-1-rajvi.jingar@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230613225347.2720665-1-rajvi.jingar@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/14/23 00:53, Rajvi Jingar wrote:
> Newer platforms starting from Meteor Lake can have multiple PMCs.
> This patch series include changes to enable pmc core driver to support
> multiple PMCs for newer platforms. It adds devid and register maps to
> enable IOE-P and IOE-M available on Meteor Lake platform. It also fixes
> the register maps for SOC-M.
> 
> Patch includes:
> platform/x86:intel/pmc: Update maps for Meteor Lake P/M platforms
> platform/x86:intel/pmc: Combine core_init() and core_configure()
> platform/x86:intel/pmc: Add support to handle multiple PMCs
> platform/x86:intel/pmc: Enable debugfs multiple PMC support
> platform/x86:intel/pmc: Discover PMC devices
> platform/x86:intel/pmc: Use SSRAM to discover pwrm base address of primary PMC
> platform/x86:intel/pmc: Add Meteor Lake IOE-P PMC related maps
> platform/x86:intel/pmc: Add Meteor Lake IOE-M PMC related maps

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
>  drivers/platform/x86/intel/pmc/Makefile     |   4 +-
>  drivers/platform/x86/intel/pmc/adl.c        |  16 +-
>  drivers/platform/x86/intel/pmc/cnp.c        |  18 +-
>  drivers/platform/x86/intel/pmc/core.c       | 470 ++++++----
>  drivers/platform/x86/intel/pmc/core.h       | 125 ++-
>  drivers/platform/x86/intel/pmc/core_ssram.c | 133 +++
>  drivers/platform/x86/intel/pmc/icl.c        |   7 +-
>  drivers/platform/x86/intel/pmc/mtl.c        | 954 +++++++++++++++++++-
>  drivers/platform/x86/intel/pmc/spt.c        |   7 +-
>  drivers/platform/x86/intel/pmc/tgl.c        |  21 +-
>  10 files changed, 1516 insertions(+), 239 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmc/core_ssram.c
> 

