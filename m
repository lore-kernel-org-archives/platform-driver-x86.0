Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B4CC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 14:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiG1OVE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 10:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiG1OVE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 10:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D50141403D
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659018060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M1bzhQdheP+aCE0rRc5Eot6m1HtYj6l8veE+XE+ee7M=;
        b=h/CX+UdL0O7CyELRSFZCIocmmRYvFtMn66OZ3UkEuhQM5pQORvAlmk4tw2qXF2OolT01kI
        aMtU/ACjYDQ79IPhZoPy9Jr1T4qDpO4ZhfLx28cty0GK432gF9sbF5HV/7KxkrEM9E1ztV
        6bg0kzDWNCzplPt/7QXmNsfjyED30eU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-M9twoEcvOfmzVnDCZR9MLQ-1; Thu, 28 Jul 2022 10:20:59 -0400
X-MC-Unique: M9twoEcvOfmzVnDCZR9MLQ-1
Received: by mail-ed1-f69.google.com with SMTP id w15-20020a056402268f00b0043be4012ea9so1193680edd.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 07:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M1bzhQdheP+aCE0rRc5Eot6m1HtYj6l8veE+XE+ee7M=;
        b=55EUIa7UACuOFRj3pY5B2vzWz9ssWtmysZKLDBA+fA85zggKT5DDmB8LS3iOA7cc2e
         wkzb3JdCdb86WMeW79d0iAChGLKPORRJMSGlOHViV+jOODO69lLLm7H8UHdC2CX5dnQ/
         dwZG2FCNPGWUiyxnOJ4X6qEoAFgAq8kOzFTYfGY/zA8GIR6fPRV/1mLx3wbX1SGMVpHv
         Jrl5+szFZvSH/CDsmGuycfDlqoUJ/Eda2EQcP5JzzunvtXUiczpHZwLBlG274dP6Qrjj
         Zu5udXCVbf1SHynJuJX7yS7VXZ92sZ1Bz+aJojyhZGJ5jiosXmK0vaeefS6GaXRcjPBY
         yyLA==
X-Gm-Message-State: AJIora8hf2johMq07IXtlXPNRpL+dnf85Yk5Z5t9x0DiJ+gmnpAftcvL
        0SRcrTu/HDf/y6kUbnLMfLQTvoJe7X937fe/71EnTWeHOS9IoOlk2Pv4vEGw27rnTtLZcSW34nv
        m8j+uIgiaCwweI8Ok69oWb1XOYv8GXRMn4Q==
X-Received: by 2002:a17:907:9485:b0:72f:97d9:9799 with SMTP id dm5-20020a170907948500b0072f97d99799mr21497575ejc.328.1659018057095;
        Thu, 28 Jul 2022 07:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1oeYD0Es09CpEy38kgJWaxUXlwiVpSC/VZYehUGRaMvNpfy1Cw6hl45F9tK+vdrSKFi8dUg==
X-Received: by 2002:a17:907:9485:b0:72f:97d9:9799 with SMTP id dm5-20020a170907948500b0072f97d99799mr21497526ejc.328.1659018056056;
        Thu, 28 Jul 2022 07:20:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a12-20020a170906368c00b0072af890f52dsm467102ejc.88.2022.07.28.07.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 07:20:55 -0700 (PDT)
Message-ID: <49ef6e43-eb16-052e-3e58-f0290328cdd6@redhat.com>
Date:   Thu, 28 Jul 2022 16:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.20-rc1
Content-Language: en-US
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <f5d261460d60c546005d126a7629bfd5e4deeaba.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f5d261460d60c546005d126a7629bfd5e4deeaba.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/18/22 19:05, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> There are two minor fixes:
> - One for just removing unneeded semicolon
> - Another for array range check
> 
> These changes are on top of
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86/+/refs/heads/for-next
> 
> The following changes since commit
> 7a4a04f4e90d746928501a6d551de87d02c28323:
> 
>   platform/surface: tabletsw: Fix __le32 integer access (2022-07-17
> 16:20:35 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 7d565542f8bdc097d611030572ecf8d9706f14dc:
> 
>   tools/power/x86/intel-speed-select:Unneeded semicolon (2022-07-18
> 09:51:09 -0700)

Thanks. Both commits did not include your Signed-off-by though,
if you apply patches of others you must at your S-o-b since you
are part of the chain how they got upstream.

After pulling I ended up with 2 commits where the S-o-b of
the committer of the patch was not present.

Instead I've picked both patches directly from the list,
now setting me as the committer (and added my own S-o-b).

So this is resolved now and both patches are in my review-hans
branch now. But the next time when applying patches from others
for a pull-req please don't forget to add your own S-o-b.

Regards,

Hans




> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       tools/power/x86/intel-speed-select: Fix off by one check
> 
> Xin Gao (1):
>       tools/power/x86/intel-speed-select:Unneeded semicolon
> 
>  tools/power/x86/intel-speed-select/hfi-events.c  | 2 +-
>  tools/power/x86/intel-speed-select/isst-daemon.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Thanks,
> Srinivas

