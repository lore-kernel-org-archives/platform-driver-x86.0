Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9A9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238741AbiD0O4y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238763AbiD0O4w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 48331483A1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651071220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r6CvxDRQX9hap+vqFaN/XVmHNdzCpgKtxYYuOYTRUwA=;
        b=T4X16RWVXxvXt9jgHitrLW0YKIvWGbHofAS0zxgQp85Y3eBr/T5+LPLGZeYYA5Xn1f0kZp
        wSgi5fFPznfQyKxDABf/7bUl9QNPqGP1W6zehBe27QifeC5/AhCKz7jVIuuko2TlDfVFCY
        QhiMNHuq3iinH9+rcLi+n8A1puXplYI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-w9FIwm6cM9my5s2efld-eg-1; Wed, 27 Apr 2022 10:53:36 -0400
X-MC-Unique: w9FIwm6cM9my5s2efld-eg-1
Received: by mail-ej1-f69.google.com with SMTP id qw33-20020a1709066a2100b006f001832229so1318404ejc.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r6CvxDRQX9hap+vqFaN/XVmHNdzCpgKtxYYuOYTRUwA=;
        b=Mzgi+7oGxUhlRP9YthEax3DuOhRmXDTC2Zb4Bm7TkVpwHPEbgS+yJzKioW/eJ6tPc7
         cto6cAiWrME0yOuqiGMHxu/Oo4D91qpf/5/e7jlRdd7URS4DiS5g8skdPTSrx7qxAfe6
         8wm/ygR6c/iTRQzhGW+cgw2ikQ3Ipj5cAzB0v3LsfHflnYSvtEDcIU44xSIN2+OsjtW9
         zH3YdNLG2SLWIaY+sNKRqDnbQQM0z9EFTycocnOjiMkYb/agxe+JOowECq1q7zoJ2wUV
         K1II0i6FaqvYnqhclnnP7HQWR5HTowX1GjNt471NV+acZ7du3Fi+unR6c0dWkO5VD2s7
         mzAA==
X-Gm-Message-State: AOAM5303T5AgNqsOtBFkK4qyCpWuqtNzhqnp1ko0U5r+mG+HWmSdmXxL
        saMKBafvIgAG7RI63myQ+1ah4wBnPoBTanIuF4vYUnlFdGh46QYXmc033uG5O62BPiioLaMFP1V
        ABxTV9ywTYNUH3GCrx/mXumJIYQBULSr4/A==
X-Received: by 2002:a05:6402:1450:b0:425:e43f:7ccd with SMTP id d16-20020a056402145000b00425e43f7ccdmr17959279edx.299.1651071215682;
        Wed, 27 Apr 2022 07:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyVIla25urTUx/nT30ZZX4UouKyEF/wS+A27NAB4Al7DQRX6wrGRYOMCdW4zpmUNIJhb8I1A==
X-Received: by 2002:a05:6402:1450:b0:425:e43f:7ccd with SMTP id d16-20020a056402145000b00425e43f7ccdmr17959259edx.299.1651071215449;
        Wed, 27 Apr 2022 07:53:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ek21-20020a056402371500b0042025e47eddsm8036126edb.7.2022.04.27.07.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:53:34 -0700 (PDT)
Message-ID: <918f62e1-4f55-70ca-0ab3-a28a202a4ba2@redhat.com>
Date:   Wed, 27 Apr 2022 16:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: dell-laptop: Add quirk entry for Latitude
 7520
Content-Language: en-US
To:     gabriele.mzt@gmail.com, platform-driver-x86@vger.kernel.org
Cc:     pali@kernel.org, mjg59@srcf.ucam.org
References: <20220426120827.12363-1-gabriele.mzt@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220426120827.12363-1-gabriele.mzt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/26/22 14:08, gabriele.mzt@gmail.com wrote:
> From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> 
> The Latitude 7520 supports AC timeouts, but it has no KBD_LED_AC_TOKEN
> and so changes to stop_timeout appear to have no effect if the laptop
> is plugged in.
> 
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>

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
> As per the discussion here https://github.com/dell/libsmbios/issues/48,
> this is really a BIOS bug. My Latitude 7520 has the latest BIOS
> update installed, which was released just few months ago, but the
> issue is still there.
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 8230e7a68a5e..1321687d923e 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -80,6 +80,10 @@ static struct quirk_entry quirk_dell_inspiron_1012 = {
>  	.kbd_led_not_present = true,
>  };
>  
> +static struct quirk_entry quirk_dell_latitude_7520 = {
> +	.kbd_missing_ac_tag = true,
> +};
> +
>  static struct platform_driver platform_driver = {
>  	.driver = {
>  		.name = "dell-laptop",
> @@ -336,6 +340,15 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>  		},
>  		.driver_data = &quirk_dell_inspiron_1012,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Dell Latitude 7520",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 7520"),
> +		},
> +		.driver_data = &quirk_dell_latitude_7520,
> +	},
>  	{ }
>  };
>  

