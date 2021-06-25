Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23440C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 13:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 034A461474
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 13:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFYNtX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Jun 2021 09:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhFYNtW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Jun 2021 09:49:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD27C061574;
        Fri, 25 Jun 2021 06:47:01 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l12so9949755wrt.3;
        Fri, 25 Jun 2021 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=K4T35kD9xdE5WREeUdRDi4V+8bz/uyfDnLKIKbIbAGs=;
        b=BspRsGbBqSD/LW13d+9o097IQx/JIngS+aSPkCI73oCFfeR24NAC/+o0zhPjetLM0O
         7Zgd7Klvk4xAwOZ37l17Kq0CnY7cvQxE/KPzSVFiup/UKY2KiruRngPNffoQiKgcKs3j
         QohQ67uTnX+A1EADMhFGahMfsRrktt2rAAtyhGlMmfvXOsFGAoNY/faSNR4NK7reKi8y
         LOVDI9AA1GR3FKNu+VaHRfTfjEcbIBZxjHghS4XDgk5puyEn1HUZ38IH+7d7s25NfuzL
         eQYz9Ax5VAmzXb9tKBRQ24bN8J8QL07Ppfnk77QmWy1bLLlCFW2efY4M+4Wf/MqC6uPU
         RDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=K4T35kD9xdE5WREeUdRDi4V+8bz/uyfDnLKIKbIbAGs=;
        b=Rkr67I0JcxNsA3ZlKkBPXKlTx0bnFkeNzLftf2Q+Gzr89F/PiWcm7NZhwlAgITRIrm
         8465Pe9VUEV1e9hU9G04jM2wZJqc+9lkXinzraSVfgmTGoPr+yEj+eQ0w367EYXdhbRP
         ISCe8aehwzhsIU1WejkTWEPJbNx5kF8uDUftY5Bpg29BPkZgjRKV6heaS4inGDQeKcUP
         AqqP81RTnjmYIV59EH7qq/VGAxo/4IpDUbXfjtfjPGdGQFnyuenYUB9lJ/PX3GPPujhv
         hYOv7JFGfl2xDexWQuAgUC7O97A+MQ9fjJn8uOjAgP4FbB3cbsg6/Hn67zpoRXnozEi/
         Mwjw==
X-Gm-Message-State: AOAM530aWCj2HcCOBdJSzgC3dU8EwTt+ZdCXmet5HOfqWY75XtA+o/PH
        SCa5fEJJm7gxFHgYm/NdJSaja2uj3yw=
X-Google-Smtp-Source: ABdhPJyobzir6OgOS1lVuoSu2oun8E+Pds/0/hGTISw94w/WwxovQx6+ER6Bf3Na7RlQCzk1CLj+ZA==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr10941707wrq.34.1624628820556;
        Fri, 25 Jun 2021 06:47:00 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.116])
        by smtp.gmail.com with ESMTPSA id e12sm6190225wrw.34.2021.06.25.06.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 06:47:00 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Uninitialized variable
 in skl_int3472_handle_gpio_resources()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YNXTkLNtiTDlFlZa@mwanda>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <540fe796-00d0-bef5-5b89-11f387aa8006@gmail.com>
Date:   Fri, 25 Jun 2021 14:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNXTkLNtiTDlFlZa@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan, thanks for the patch

On 25/06/2021 14:01, Dan Carpenter wrote:
> This function returns negative error codes, zero (to indicate that
> everything has been completed successfully) and one (to indicate that
> more resources need to be handled still).
>
> This code prints an uninitialized error message when the function
> returns one which potentially leads to an Oops.


Ah! In the default case of the switch, took me a while to see that.
Thanks very much, good catch.


Reviewed-by: Daniel Scally <djrscally@gmail.com>

>
> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  .../platform/x86/intel/int3472/intel_skl_int3472_discrete.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> index 17c6fe830765..9fe0a2527e1c 100644
> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> @@ -286,10 +286,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	int3472->ngpios++;
>  	ACPI_FREE(obj);
>  
> -	if (ret)
> +	if (ret < 0)
>  		return dev_err_probe(int3472->dev, ret, err_msg);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
