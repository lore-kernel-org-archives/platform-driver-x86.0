Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBAAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 24 Dec 2021 11:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352616AbhLXLxQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 24 Dec 2021 06:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33981 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235597AbhLXLxQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Dec 2021 06:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640346795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P5SEGrlabKir9+21ito7bgqQMBia1eMc5YIpSgIqoME=;
        b=DzxGFL4MOQe7GMwKxvxBQX0LbVCRd1vhMNgulp6QP4BapxPaPzYaqeGgbsBrDCDJsvqaJO
        f9aKsya6fsR1/gKM/IM4ha+l1SVKglKpd7swPkr54AVOr8WOwG17FHksTV/sutvkPmq3cD
        +efqxLxfvNxmaFHj5UtaiZESP3SlRjI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-eCY2u5yFMZGrggmjEA2teA-1; Fri, 24 Dec 2021 06:53:14 -0500
X-MC-Unique: eCY2u5yFMZGrggmjEA2teA-1
Received: by mail-ed1-f71.google.com with SMTP id ch27-20020a0564021bdb00b003f8389236f8so6587318edb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Dec 2021 03:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P5SEGrlabKir9+21ito7bgqQMBia1eMc5YIpSgIqoME=;
        b=hFDkDdPd8xDGT+lg51pC8hCUBCKR29nIarKtR3Fyp0TVMPkP/cTyNIB3YcQX+Y+CcN
         pIrDhfbvajj2l78VKhs2KG/kTvPvz6oorg4nKNsbljJfX5PH1bBn7geMl1grBhpPTLIi
         O+3Ie8oZ11YsqL7Ug/hAjMK2rcQwXdLasP9JTJ/FqXVSP6qwp+UFDM62A70V96Fg4i7r
         YkKmv8bDXanomNB38NZPIP57YavBW6Fihr7dgA45JIzeINwSXcdOCi5NiuYaZnpddkPg
         70hffAcmX+zGZe188t38WXJi8QiyfkByExojCq6auS59lnMTDrVlGrDXE7rSaJtU5rt1
         heLA==
X-Gm-Message-State: AOAM53071QmDOodxdwZqC66C5cLir7mhTTJ6zK8TPpST9h5KhINAjX04
        NcPbMsIVFoIEQVKacqWq9e9bM8lvzssAa2SgzGFWkIE/2H44/Iu3799iXt7HMUWNVuxzbpnuO99
        gZTV413S4HqBYEWL2/TqMN6kQdGOfNsilzQ==
X-Received: by 2002:a17:906:f890:: with SMTP id lg16mr5284576ejb.757.1640346792951;
        Fri, 24 Dec 2021 03:53:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfs1t0YSMB2z1FJv7fkgOqnY8rm5GgLnqpJcLoh0cbGWFC3HB70t3Y5qUUUzxfV0ynMWaYeg==
X-Received: by 2002:a17:906:f890:: with SMTP id lg16mr5284569ejb.757.1640346792726;
        Fri, 24 Dec 2021 03:53:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id n9sm2607960ejl.201.2021.12.24.03.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Dec 2021 03:53:12 -0800 (PST)
Message-ID: <19026222-e9ec-82a8-6100-ab99b3a00a86@redhat.com>
Date:   Fri, 24 Dec 2021 12:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.17-rc1
Content-Language: en-US
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <b92dc5d21512a6393fb16a6f55f9ed09b2cc1ef9.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b92dc5d21512a6393fb16a6f55f9ed09b2cc1ef9.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/21 03:08, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> These changes are on top of
> git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-
> x86/for-next
> 
> The following changes since commit
> a602f5111fdd3d8a8ea2ac9e61f1c047d9794062:
> 
>   platform/x86: amd-pmc: Fix s2idle failures on certain AMD laptops
> (2021-12-02 12:58:26 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 9346ea083abe7f08d03a8a4f3e9a3e00ac085c30:
> 
>   tools/power/x86/intel-speed-select: v1.11 release (2021-12-15
> 17:46:56 -0800)

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
> ----------------------------------------------------------------
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Update max frequency
>       tools/power/x86/intel-speed-select: v1.11 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Thanks,
> Srinivas
> 

