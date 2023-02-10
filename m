Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD3CC05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 16:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjBJQQi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 11:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjBJQQh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFF21B557
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676045755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eKne9KVuVdje+JYeGh16BUK5PUdXLIJtZx0OA4yquDU=;
        b=Yjq6VXI8e4c9AxZnUxz+MjNG/LS+npO8jZZ9JpSjr7SzsaEQw7IiHnwf55FIXdEzLCBG58
        GS2Is58K3bmSxCIG9h04cZ3ikt41Yf+N8PzTzjJ8d/2hs8LqrAsyYo6OqtSAuaxnbnlGku
        LDcncJ48zp3V4+VuvK2WCcH3k8mYAoU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-bjpP_CPoMlGFdFG_mPm5yA-1; Fri, 10 Feb 2023 11:15:54 -0500
X-MC-Unique: bjpP_CPoMlGFdFG_mPm5yA-1
Received: by mail-ej1-f71.google.com with SMTP id nd38-20020a17090762a600b00871ff52c6b5so3858228ejc.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKne9KVuVdje+JYeGh16BUK5PUdXLIJtZx0OA4yquDU=;
        b=CKSM9xUanMGzMQJuyvblaBAo4AzNc1xovDnlwvGHif3JABN7CGgSOjkkBdIIZV2J1C
         R+6FpNaDqvO62+yu8zPN0cMU+z5V67Yfa5uZIhNg8HqMaNH2C3eTIPHh23IFMtWDs5UM
         Oy3OJqaQ4mQ+8Lb5a54DjYurV7fGIT9CBxcJEoab5o++SOES0gYkrf9Cw034HAIu6ObD
         CbEHGAxeD7g+G/in/Ur2sNnhH7PGrJTv9wYJVPOoBBFHCvOM5sUJc1AhwvvFgR5p/gr5
         1/ya+ABYpD/wVTnh+DG1hjR3EIlqPj7jPcIDS3a8eTrAH1YDVQ5fS0tATalRe3hV0GjD
         rAng==
X-Gm-Message-State: AO0yUKVtUIHO1g2Gyp/5uvxG6My/iJqwFsHcLlZJEZC0Jvt75UY5yqPU
        KwH1VAU/joWRvZ6XwxlA8Yp01w55CHVBuwIi8lJ+93ITNpuoFn9rmqEHH7EVYRyF96Sdly+Mslk
        mE8XacsIu2Sbvt+pj0l6IunpCRce47TX+Og==
X-Received: by 2002:a50:d78f:0:b0:4aa:c77d:fa0a with SMTP id w15-20020a50d78f000000b004aac77dfa0amr16755403edi.22.1676045753540;
        Fri, 10 Feb 2023 08:15:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9nSFQLGra3eu64GQ4Kkjwj62X9ldWiXdK+DbO+h+sjbItyTGn3UGxBQFM11FncNyve1qPFaA==
X-Received: by 2002:a50:d78f:0:b0:4aa:c77d:fa0a with SMTP id w15-20020a50d78f000000b004aac77dfa0amr16755393edi.22.1676045753385;
        Fri, 10 Feb 2023 08:15:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f8-20020a50d548000000b004ab33d52d03sm1421293edj.22.2023.02.10.08.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:15:52 -0800 (PST)
Message-ID: <7d1749ec-bd8a-1fb4-49c1-0bb680ad530f@redhat.com>
Date:   Fri, 10 Feb 2023 17:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 1/1] platform/x86: Fix header inclusion in
 linux/platform_data/x86/soc.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20230206145238.19460-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230206145238.19460-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/23 15:52, Andy Shevchenko wrote:
> First of all, we don't use intel-family.h directly. On the other hand
> we actively use boolean type, that is defined in the types.h (we take
> top-level header for that) and x86_cpu_id, that is provided in the
> mod_devicetable.h.
> 
> Secondly, we don't need to spread SOC_INTEL_IS_CPU() macro to the users.
> Hence, undefine it when it's appropriate.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  include/linux/platform_data/x86/soc.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/x86/soc.h b/include/linux/platform_data/x86/soc.h
> index da05f425587a..a5705189e2ac 100644
> --- a/include/linux/platform_data/x86/soc.h
> +++ b/include/linux/platform_data/x86/soc.h
> @@ -8,10 +8,13 @@
>  #ifndef __PLATFORM_DATA_X86_SOC_H
>  #define __PLATFORM_DATA_X86_SOC_H
>  
> +#include <linux/types.h>
> +
>  #if IS_ENABLED(CONFIG_X86)
>  
> +#include <linux/mod_devicetable.h>
> +
>  #include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
>  
>  #define SOC_INTEL_IS_CPU(soc, type)				\
>  static inline bool soc_intel_is_##soc(void)			\
> @@ -34,6 +37,8 @@ SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
>  SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
>  SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
>  
> +#undef SOC_INTEL_IS_CPU
> +
>  #else /* IS_ENABLED(CONFIG_X86) */
>  
>  static inline bool soc_intel_is_byt(void)

