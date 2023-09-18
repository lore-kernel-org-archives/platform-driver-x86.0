Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B92CD13D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 15:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjIRP1V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 11:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbjIRP1E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 11:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319A91BD0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695050484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZJxOEUwKq2KwnFmZk3pOWmt+ygYn9o53lf6vTBXs108=;
        b=D4Imi09B/fF1/+JxI5wcuD68UmmMSAyj6kg2812w20HxsIDiX7iIGwn/Npj3px8kjvpmlb
        JkqqgzNk8vTR/tJ5MdzxffiYK7LE/dXhPoFogEdcBfVyAUCIDBn3d5VTh7IUo6lAq/u7Y5
        XvD59JF+4VuTFvw3d04yPF2UhEuUTFY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-fz-Li2gYNDKVUUExHh72-w-1; Mon, 18 Sep 2023 09:21:05 -0400
X-MC-Unique: fz-Li2gYNDKVUUExHh72-w-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50309111618so1879221e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 06:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695043263; x=1695648063;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJxOEUwKq2KwnFmZk3pOWmt+ygYn9o53lf6vTBXs108=;
        b=iFcMPTqywl8twobR+MCC8HmDT3D7fkb+qnMRDMHSjUjkfqH/A2VQsLMN2AA3ZTdCop
         ei+Z9cXorym581MZL3dpI8BQDdmXDnONrBDtZmsB5VOpWI9aIcxZiiBbFRgWA3Q3FnPw
         RrDN+8ms6l6NwyMPOUVf1VmFq02Y4bAOM/aASH2p1/vIsbGXADHHEIdE8ivyurQHghO5
         mUkcQWRLfs18X7uG7Vv/Jt7UPmMIawiXd0w7XHynvd4xt8X9oeFCr6uG9GKXvAID0ijV
         ptNvqxCwsZAcESfMRx7eALs+vcrdhFfgEwaQVYvOkCjhrztZSk8t7IcIb12UEG/ETTJo
         cv6A==
X-Gm-Message-State: AOJu0Yz0EOuLkoht7EGJmOyU9wmY5haROMbMXFE1kOP1oBhUQ7v5UJVO
        0buEepgDFnRIW5rnN49mGS6T5pHpi2ikFJ0Jp+uI8iyPv278yHkMXlnEOWlNmmjL6RmuDNeHwlw
        1MlAGIwgQeVYidsxfOPlibbDC2eX7fgapKHe9fO7wdw==
X-Received: by 2002:a19:7113:0:b0:500:9a45:62f with SMTP id m19-20020a197113000000b005009a45062fmr6427105lfc.8.1695043263248;
        Mon, 18 Sep 2023 06:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg3y8j6ulHCSsYRNzSopEL/zg2ePatS9CF1ypxa0pAhrRRg0cuUohYCdUZGe8vuUkbYRI1hg==
X-Received: by 2002:a19:7113:0:b0:500:9a45:62f with SMTP id m19-20020a197113000000b005009a45062fmr6427097lfc.8.1695043262906;
        Mon, 18 Sep 2023 06:21:02 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a056402028100b0052237dfa82fsm5973258edv.64.2023.09.18.06.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 06:21:02 -0700 (PDT)
Message-ID: <37947c4f-abd1-afeb-ed5e-54e7a3aba28b@redhat.com>
Date:   Mon, 18 Sep 2023 15:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] MAINTAINERS: Add myself into x86 platform driver
 maintainers
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230918102901.17669-1-ilpo.jarvinen@linux.intel.com>
 <20230918102901.17669-2-ilpo.jarvinen@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230918102901.17669-2-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/18/23 12:29, Ilpo Järvinen wrote:
> Hans has been asking for another person to help as the maintainer of
> the x86 platform driver because Mark has not been able to find time to
> do that. I got asked for the task and have been reviewing the relevant
> patches for a while now but lets make it more official by adding the
> MAINTAINERS entries.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..b04cbcec521f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13617,6 +13617,7 @@ F:	drivers/net/ethernet/mellanox/mlxfw/
>  
>  MELLANOX HARDWARE PLATFORM SUPPORT
>  M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Mark Gross <markgross@kernel.org>
>  M:	Vadim Pasternak <vadimp@nvidia.com>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -14211,6 +14212,7 @@ F:	drivers/platform/surface/surface_gpe.c
>  
>  MICROSOFT SURFACE HARDWARE PLATFORM SUPPORT
>  M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Mark Gross <markgross@kernel.org>
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> @@ -23424,6 +23426,7 @@ F:	drivers/platform/x86/x86-android-tablets/
>  
>  X86 PLATFORM DRIVERS
>  M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Mark Gross <markgross@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained

