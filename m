Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47003E7B5E3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 09:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbjJDJ4i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241774AbjJDJ4h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 05:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2439E
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696413349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4X/b1d2pkgLp5p3YIRE7ps+4IziH+AFeELkbhS8aDOo=;
        b=Pu2HBPFiZ42PwcW8wOsNguuU9rRVepiYpLbzinIuKctf9dazFZlJTMxAEJeHu3eSYmXicF
        P1DHkhHm/YkVxNWhNDeizwmkkngmxfO+Y/647etkWyTsqDd4n98dCW+qyuWVPuqKDn+C6g
        43WGMhwS2ScI+1E19E4Jnd0P4lQlduo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-OXievD88O9q34EQf2GzR_Q-1; Wed, 04 Oct 2023 05:55:42 -0400
X-MC-Unique: OXievD88O9q34EQf2GzR_Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5346626c1c5so1609207a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 02:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696413341; x=1697018141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X/b1d2pkgLp5p3YIRE7ps+4IziH+AFeELkbhS8aDOo=;
        b=ZE6tW+1P4TKW/NCyUDoSGzo4Ku7yeTUw94hQyhuNzcMaHR8QScf1zz4RtowLI3e8iP
         OuA3eY3JnGX+7K548xLJoCla+Bgk0f8Kkoa/I1CHXQ13SjOTGIUFN0qCXTr0VM2O9pDi
         u6vXmyayR23s35foO9MtsGnwqk71ZWC+/OhCZ5OJhwGuewYUMOPG9O60Lo7tHvvrlcyV
         FZl6OZH1dIwV/0tHhacnknhbeM2KTkb19vUs+UT5lrLjWy2SGMbfs7RR0XL+Z/ekud9g
         MDX9EK8kR9xa/IeDct0OBqJ2seeBE8BO9KF/EsmJhzTwYRpaGT6PhMvr/DlTvCE72rDN
         1uzQ==
X-Gm-Message-State: AOJu0Yz3vNLS3eDkf8KzQVW0ZZHVCMfD/U2xNe1t8hrGZOJnT/BYP5tZ
        dTv4/vQSLrE+zsxk6IBoP2Qc4wG7RgwUvykt3Ekuu7tAXyWQ28KmR/8FnfebpetkeVPxsLpO7+C
        v/5ZmAzhH7wpPUllR+Xkbcggos/d3PfopUQ==
X-Received: by 2002:a17:906:3282:b0:9a5:846d:d81f with SMTP id 2-20020a170906328200b009a5846dd81fmr1434592ejw.17.1696413340906;
        Wed, 04 Oct 2023 02:55:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4NJH4WV0usT3nmC3sZlXOvlzpHK2MaHCMZaLc9JRwL4fNL5dxmTSxCV4ADpMGmpxFMMnJpw==
X-Received: by 2002:a17:906:3282:b0:9a5:846d:d81f with SMTP id 2-20020a170906328200b009a5846dd81fmr1434578ejw.17.1696413340630;
        Wed, 04 Oct 2023 02:55:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709063c4700b0098884f86e41sm2494828ejg.123.2023.10.04.02.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:55:40 -0700 (PDT)
Message-ID: <52413aa9-054a-d0db-e240-bdddd31f3d79@redhat.com>
Date:   Wed, 4 Oct 2023 11:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 0/2] platform/x86: Fix reference leaks
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markpearson@lenovo.com,
        jorge.lopez2@hp.com
Cc:     markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230925142819.74525-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230925142819.74525-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/25/23 16:28, Armin Wolf wrote:
> If a duplicate attribute is found using kset_find_obj(), a reference
> to that attribute is returned which needs to be disposed accordingly
> using kobject_put(). This issue likely first appeared inside the
> dell-wmi-sysman driver, see
> commit 7295a996fdab ("platform/x86: dell-sysman: Fix reference leak").
> However, it also seems that the bug was copied from this driver into
> the think-lmi and hp-bioscfg drivers. Maybe a more abstract
> fw_attr_class could prevent such issues in the future by abstracting
> away the kobject handling?
> 
> Armin Wolf (2):
>   platform/x86: think-lmi: Fix reference leak
>   platform/x86: hp-bioscfg: Fix reference leak

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 14 ++++++++----
>  drivers/platform/x86/think-lmi.c             | 24 ++++++++++++++++----
>  2 files changed, 30 insertions(+), 8 deletions(-)
> 
> --
> 2.39.2
> 

