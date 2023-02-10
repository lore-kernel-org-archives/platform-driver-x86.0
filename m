Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A3EC05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 17:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbjBJRrK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 12:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbjBJRrJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 12:47:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEE972A1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 09:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676051181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oHwMDctmPyuPEHsQrGGOGlA3ca79YEp0OfbA8DMCS78=;
        b=Lk8YFXrMxm+RXK7nTUesvivSqzthLF+KMHh/R+cwBLYW8HppVjcbppmLGiNLIygsdvn1LJ
        4UGpZGL/9tBLFe3ydSCNF3LxtQ35mKqWrVYLZSsr7nhZIRQKIPwvbQbeqfVwrVv4QCBXAQ
        E/3XrX8mx/Zt/y4buCZV36ClxtAAEs4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-L0yQ9kPDPh-0xw4hgU6WoQ-1; Fri, 10 Feb 2023 12:46:18 -0500
X-MC-Unique: L0yQ9kPDPh-0xw4hgU6WoQ-1
Received: by mail-ed1-f71.google.com with SMTP id g14-20020a056402090e00b0046790cd9082so4005234edz.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 09:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHwMDctmPyuPEHsQrGGOGlA3ca79YEp0OfbA8DMCS78=;
        b=Z4K0btIJX/QnRkfCWseAz/afOnRGsv8ePqkrxnA8m8Kh6Trn9uaTzYvxvuavbGJMmJ
         XgsexdxtPIcr7XzX13zUljYYWd2L09gSWtQvJWbk/k+1e/iYZkTYk1O0/MZcDmhBbC4R
         isZMtuioERJE8SgGSeCn21co/wRpOy5w+mPJ4cRnfjNpEyc2WMckTDOudQrd842Doxrf
         mURwpSiIREkD72pLbzIe2WEzve5wsKyugn+6rDQzTyrdAzFCT16sJ5GVks1Kom6TRLPF
         TfRe20s2LXL9Rl5p1B10IEyKXGX/zib/VLNORJeqpRS6x+++F/AyrCuIU4wskgUpxE1b
         ZiQQ==
X-Gm-Message-State: AO0yUKUORApx3z51URGfuTj1vbocIX/lL9oZHXhyibCl2343NdB3PHk+
        ldL1L6v8B+lWytu0ZhwAv0YLn9i6vFzqXdi+tvlZh7TH8d6O6snm2l3vbaj1xDsoTA+rb9FkI2L
        yau/gcKblpeeQOyJajUIBXevUNHfUjzux8kfre1E=
X-Received: by 2002:a50:9f44:0:b0:4ab:4011:ff47 with SMTP id b62-20020a509f44000000b004ab4011ff47mr3836995edf.6.1676051176485;
        Fri, 10 Feb 2023 09:46:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+xX4YOSxIBysSI5DhRxy4s4xvU8E3MbZWaJiljnnutiTXtDYH5MfYWwvbJzS0oUBTp7uPe6A==
X-Received: by 2002:a50:9f44:0:b0:4ab:4011:ff47 with SMTP id b62-20020a509f44000000b004ab4011ff47mr3836985edf.6.1676051176358;
        Fri, 10 Feb 2023 09:46:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e5-20020a50d4c5000000b004873927780bsm2562271edj.20.2023.02.10.09.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 09:46:15 -0800 (PST)
Message-ID: <eadf0d4b-1426-6339-880a-f11de6438f17@redhat.com>
Date:   Fri, 10 Feb 2023 18:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH platform-next 00/13] platform/x86: Add new systems and
 features for Nvidia systems
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230208063331.15560-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/8/23 07:33, Vadim Pasternak wrote:
> The patchset:
> - Introduces new systems.
> - Adds new features.
> - Preparation for to support systems equipped PCIe based programming 
>   logic device.
> - Cosmetic changes.
> 
> Patches #1, #4-#5: introduce support for new systems.
> Patch #2: changes attribute name.
> Patches #3, #12: cosmetic changes and removing code out from the loop.
> Patches #6 - #7, #10 - #11: infrastructure changes to prepare driver to
> 	support systems equipped with PCIe based FPGA.
> Patch #8: provides synchronization between I2C main bus and other
> 	platform drivers using notification callback.
> Patch #9: allows non-successive definition of hotplug signals
> 	configuration.
> Patch #13 - documentation.

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




> Vadim Pasternak (13):
>   platform: mellanox: Introduce support for rack manager switch
>   platform: mellanox: Change "reset_pwr_converter_fail" attribute
>   platform: mellanox: Cosmetic changes - rename to more common name
>   platform: mellanox: Introduce support for next-generation 800GB/s
>     switch
>   platform: mellanox: Introduce support of new Nvidia L1 switch
>   platform: mellanox: Split initialization procedure
>   platform: mellanox: Split logic in init and exit flow
>   platform: mellanox: Extend all systems with I2C notification callback
>   platform/mellanox: mlxreg-hotplug: Allow more flexible hotplug events
>     configuration
>   platform_data/mlxreg: Add field with mapped resource address
>   platform: mellanox: mlx-platform: Add mux selection register to regmap
>   platform: mellanox: mlx-platform: Move bus shift assignment out of the
>     loop
>   Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
> 
>  .../ABI/stable/sysfs-driver-mlxreg-io         |  122 +-
>  drivers/platform/mellanox/mlxreg-hotplug.c    |   28 +-
>  drivers/platform/x86/mlx-platform.c           | 1394 ++++++++++++++---
>  include/linux/platform_data/mlxreg.h          |    2 +
>  4 files changed, 1339 insertions(+), 207 deletions(-)
> 

