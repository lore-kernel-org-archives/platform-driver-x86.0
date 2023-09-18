Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8581C46CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 12:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239792AbjIRMdu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 08:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241494AbjIRMdc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 08:33:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360699F
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695040345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8L41GDnIhY69bJ3ItERiXeNx/v3dOVoNSZWSaM0kuxI=;
        b=LWzaq6tAepj6U4oQEdRFYNCqgFxGb7deCa2/cYYTYj55ee4l2qAwdJRMwXPMUd94Hs7CaY
        Mjph49US60E9HowxLWIeoJSILs+pduoHgHHjMXSp4j+RqaSaufIZJRwl3L7Gdyv1uhFFj6
        pdE7UagjjR1kb41duJ36zdGNSa5AjLo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-ZPFYRc00Mz-PS8haF1BLKw-1; Mon, 18 Sep 2023 08:32:24 -0400
X-MC-Unique: ZPFYRc00Mz-PS8haF1BLKw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-501c7c4059aso5054059e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 05:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695040343; x=1695645143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8L41GDnIhY69bJ3ItERiXeNx/v3dOVoNSZWSaM0kuxI=;
        b=J9ULcjPlxquesfMR/3xwnxo8vdIPUwXHuN2uaYBmkcTf8OEILwjN3AHOluYfdnuwfz
         ISdkI7I8eSefVNYCxnLGEnNSj5q4iuA4nbwW4p11H3Qh+iIWvJ7XhlbCZTzsYexFwqsH
         M71j0G6g+9EYXMJatxzDdYQ8itFCbpkUq8UjrsXm/A4QOvzGb7makq1KeriHpn3uMM2W
         J3QYlJoR1Gq3I3yuETkVOx5ZZq/bSv1+iLWZuBX36iSepfz4AMZQ0RZWCjUYaht0hpOM
         LZrOVBGfHox1V9xG0PqTHXOM+uYGL1W2tFV/pzSCs74Yb4bwNIlc7osfIbNbeA/HV6RT
         rYrw==
X-Gm-Message-State: AOJu0YwuKNKNEDeY6YYMx0j+2rWVbX3/jTsbiClnNyW/BeY95DjlNKGb
        zCE/4CzOFcYeUPeW+q0ogrthkb6fgDpQUYeGcMbU2U8hvf5WL031mkQL8yId9xfiE6R5MDE3No8
        1Pj6f8wBT4RaG6pwacCKdM4au8unu3M864g==
X-Received: by 2002:a05:6512:33c8:b0:500:7a21:3e78 with SMTP id d8-20020a05651233c800b005007a213e78mr8709086lfg.55.1695040342813;
        Mon, 18 Sep 2023 05:32:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqCVOkBF4pHzlcyjxj4AjUg7UdWxj/KWzodQ1NOSfj9e+Yc8/+2YgWvzpvG5JuQGfplf38Q==
X-Received: by 2002:a05:6512:33c8:b0:500:7a21:3e78 with SMTP id d8-20020a05651233c800b005007a213e78mr8709060lfg.55.1695040342456;
        Mon, 18 Sep 2023 05:32:22 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cn10-20020a0564020caa00b00530be302f08sm3373855edb.49.2023.09.18.05.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:32:21 -0700 (PDT)
Message-ID: <ec68c553-1a12-6e33-b732-fd51d89cd439@redhat.com>
Date:   Mon, 18 Sep 2023 14:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/10] IFS support for GNR and SRF
Content-Language: en-US
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        rostedt@goodmis.org, ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        pengfei.xu@intel.com
References: <20230913183348.1349409-1-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230913183348.1349409-1-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jithu,

On 9/13/23 20:33, Jithu Joseph wrote:
> This series adds IFS support for newer CPUs like Granite Rapids(GNR)
> and Sierra Forest(SRF).
> 
> There are changes in the IFS image loading and test flow to support
> these new CPUs.
> 
> Note to reviewers:
>  - patch 01/10 adds a bit definition to arch/x86/.../msr-index.h,
>   hence x86 maintainers are cc-d.
>  - patch 05/10 modifies an existing tracepoint, cc Steven Rostedt
>  - Rest are localized to IFS driver
> 
> Jithu Joseph (10):
>   platform/x86/intel/ifs: Store IFS generation number
>   platform/x86/intel/ifs: Refactor image loading code
>   platform/x86/intel/ifs: Image loading for new generations
>   platform/x86/intel/ifs: Scan test for new generations
>   trace: platform/x86/intel/ifs: Modify scan trace
>   platform/x86/intel/ifs: Validate image size
>   platform/x86/intel/ifs: Metadata validation for start_chunk
>   platform/x86/intel/ifs: Add new CPU support
>   platform/x86/intel/ifs: Add new error code
>   platform/x86/intel/ifs: ARRAY BIST for Sierra Forest
> 
>  arch/x86/include/asm/msr-index.h         |   2 +
>  drivers/platform/x86/intel/ifs/ifs.h     |  47 +++++++
>  include/trace/events/intel_ifs.h         |  16 +--
>  drivers/platform/x86/intel/ifs/core.c    |  14 +-
>  drivers/platform/x86/intel/ifs/load.c    | 159 +++++++++++++++++++++--
>  drivers/platform/x86/intel/ifs/runtest.c |  68 +++++++++-
>  6 files changed, 273 insertions(+), 33 deletions(-)
> 
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d

Thank you for the patch series, please submit a new version addressing
the various review-remarks.

Regards,

Hans

