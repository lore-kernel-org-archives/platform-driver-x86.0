Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E71C7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 10:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjCTKeA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 06:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjCTKdn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 06:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F57D2D4F
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YvqAZJKHoZRFU+5gUHofojPGgePG+fCPesUMDb0Y0X4=;
        b=IAPum0VBPBiAS8PfdORGwW32RYcDoJsZ6WHOISuNj+vSiDW228+hIBiVEB84LHFvBZ1VrI
        QJuTFK0x6jleN/H+bpUsGVNpztRot9V99kpsv7ii/RJQM7x/SY/kpHxdqpIbn3iYLGVrlP
        rjI+kjKarTEu0c6WMz3bYN/68cIq81A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-F9UWLtc2NAmGLJ-SSmYaTA-1; Mon, 20 Mar 2023 06:32:47 -0400
X-MC-Unique: F9UWLtc2NAmGLJ-SSmYaTA-1
Received: by mail-ed1-f71.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so17103225edz.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvqAZJKHoZRFU+5gUHofojPGgePG+fCPesUMDb0Y0X4=;
        b=PEdjUar4FIlNG2DIsvY0KZ2dQnJoWrgO4Yma4Qm6976egl8Ab0WeQeGCOh/QBzHeiP
         f7vj2IPxCPsDhIGExhpjxao/sbzWj6ajOaFluFGweTjwr56aBPdKXO3kiXHRb5M4rH7E
         tQUCVevUf0V9EfZXBByPsEVje/wJTVXhNP76XjqtzT0e8nOKxqX5ZOXEKgyKICK8sbK1
         bvikRQ1YTnjwcFADNm+aDDjsfes1feqC+w4VuIXKwW+id0DiVGZi6TgW7e0RCGwGNVa7
         inCPbRkOO24e/qcK+3TKRvIL86m0qv1edRfsXq1d0z6REnly33iRP//IHNl1bTV3kHEQ
         UY4A==
X-Gm-Message-State: AO0yUKUGkzPe0oHmNudd8+V7jUEuekgWxbfZlFYw4bE8YcVNlFh4RR6N
        PTnrgmbb2EAWUs0DzXQcYVwSKhWQLsW5GdXibWCIFCq08wgjXxWI7hcJn9XILgOPFLtLF8DdWYe
        GvqyICY9n9jSzkKn/1K/jevaC6idDVAJXMw==
X-Received: by 2002:a17:906:454c:b0:8b1:4b6d:c57a with SMTP id s12-20020a170906454c00b008b14b6dc57amr7743671ejq.21.1679308366363;
        Mon, 20 Mar 2023 03:32:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set+yapuJjlvFpWtvTArVTrSFPyqqbNwPxwS2XItWam54NawfLMwaPbkP98VrcZl3j87CcMQQKA==
X-Received: by 2002:a17:906:454c:b0:8b1:4b6d:c57a with SMTP id s12-20020a170906454c00b008b14b6dc57amr7743660ejq.21.1679308366113;
        Mon, 20 Mar 2023 03:32:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h23-20020a50cdd7000000b004fe924d16cfsm4697070edj.31.2023.03.20.03.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:32:45 -0700 (PDT)
Message-ID: <8f289b0c-6a5e-64ae-a26d-11d948e727e8@redhat.com>
Date:   Mon, 20 Mar 2023 11:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 1/3] platform/x86/intel/tpmi: Fix double
 free in tpmi_create_device()
Content-Language: en-US
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
 <20230309040107.534716-2-dzm91@hust.edu.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309040107.534716-2-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 05:01, Dongliang Mu wrote:
> The previous commit 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix
> double free reported by Smatch") incorrectly handle the deallocation of
> res variable. As shown in the comment, intel_vsec_add_aux handles all
> the deallocation of res and feature_vsec_dev. Therefore, kfree(res) can
> still cause double free if intel_vsec_add_aux returns error.
> 
> Fix this by adjusting the error handling part in tpmi_create_device,
> following the function intel_vsec_add_dev.
> 
> Fixes: 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix double free reported by Smatch")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

Note this patch causes the following compiler warnings:

  CC [M]  drivers/platform/x86/intel/tpmi.o
drivers/platform/x86/intel/tpmi.c: In function ‘tpmi_create_device’:
drivers/platform/x86/intel/tpmi.c:206:13: warning: unused variable ‘ret’ [-Wunused-variable]
  206 |         int ret, i;
      |             ^~~

I have fixed this and squashed the fix into the patch while applying it,
so there is no need to send a new version:

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
>  drivers/platform/x86/intel/tpmi.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
> index c999732b0f1e..882fe5e4763f 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -215,8 +215,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  
>  	feature_vsec_dev = kzalloc(sizeof(*feature_vsec_dev), GFP_KERNEL);
>  	if (!feature_vsec_dev) {
> -		ret = -ENOMEM;
> -		goto free_res;
> +		kfree(res);
> +		return -ENOMEM;
>  	}
>  
>  	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
> @@ -242,17 +242,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	 * feature_vsec_dev memory is also freed as part of device
>  	 * delete.
>  	 */
> -	ret = intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
> -				 feature_vsec_dev, feature_id_name);
> -	if (ret)
> -		goto free_res;
> -
> -	return 0;
> -
> -free_res:
> -	kfree(res);
> -
> -	return ret;
> +	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
> +				  feature_vsec_dev, feature_id_name);
>  }
>  
>  static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)

