Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA19EE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 13:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbjHUNWQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 09:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjHUNWP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 09:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECEF8F
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692624086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fI9R9Pu6QRroB9MVGxLy/O6kwSpRxFk2cs5sNYWG5ik=;
        b=d5Smj+Dxs9JvWjOOS5L0KLQnSbHB+V11Ht09NtU1GASknS2xmtMAcaH31lKbLXjj+0mo20
        T63c6pwre42LujNc565QJCtPONSbJdnAoxPgmhYkONtKU3xmR21UtXBXAVjvNA5TEJKpxT
        ntZi8b2lnM7KVkF/lwC0HLbetgqI4r4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-KQGfuOtvNjCYNI69ydOaQQ-1; Mon, 21 Aug 2023 09:21:25 -0400
X-MC-Unique: KQGfuOtvNjCYNI69ydOaQQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99df23d6926so224999766b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 06:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692624083; x=1693228883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fI9R9Pu6QRroB9MVGxLy/O6kwSpRxFk2cs5sNYWG5ik=;
        b=P+mcLfVrI7nVUkLpvLJe3RNMjwgWsLe72k2cdmhM2f9rMIFBNdmdcq7Vma4XcmDSUA
         1GPmAP2pzDVb5bn20gjKzp9ulFN+DHXdjLUVHOinVDHTwN1z2XzA4aLdqhuE1oWXTy6c
         pZijVxSMuTC62cwzoPf+E7qPWlGVoP2RngD0lBj0JtTM2x/KorWKwJ0xibby+LyFVSFx
         SG2bQ/wODaK4O6CFuqG7xT5/ZyFGTlcBt2j2VFQed3WoV73WGN7cmq3wYyoKMSflXBXh
         ajpj1OvIsUq7JZ3wOmug6MDOQqk9MHuR0NRkPX/b2uIZo8v76jFtHl0pl6sAUnXT6muw
         OM5g==
X-Gm-Message-State: AOJu0Yx/QgkWrLr40gFyKfzuaKcM5T0S2aayiC2SD9PBcoHWXW4RPojA
        ypTqRJ2B4xyuJXthhYCoR8kQTEshpUoc8Pl5xPl0aHnMD1i4zRv0hDJWPccz/KSZcmS7PlPhbot
        WdbtUc8MsBNh6ctJvGCkW8NhbGQ0kXmlttwB6l47M7g==
X-Received: by 2002:a17:907:78d2:b0:99d:9adc:d69c with SMTP id kv18-20020a17090778d200b0099d9adcd69cmr5008391ejc.14.1692624083739;
        Mon, 21 Aug 2023 06:21:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw135lOPM9jL9VIii6900OW1D6Sb7noMgkJWeT5b6zLcTwRGwL56otiOrdP8aVxodT7Ou6fA==
X-Received: by 2002:a17:907:78d2:b0:99d:9adc:d69c with SMTP id kv18-20020a17090778d200b0099d9adcd69cmr5008377ejc.14.1692624083466;
        Mon, 21 Aug 2023 06:21:23 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p18-20020a1709060e9200b009888aa1da11sm6517544ejf.188.2023.08.21.06.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 06:21:22 -0700 (PDT)
Message-ID: <51b145fc-aa13-66e7-427e-8dfebc7d06ca@redhat.com>
Date:   Mon, 21 Aug 2023 15:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] platform/x86/amd/pmf: Use str_on_off() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>
References: <20230811131330.71263-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230811131330.71263-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/11/23 15:13, Andy Shevchenko wrote:
> We have a common helper to represent a boolean value as "on"/"off"
> string. Use it for the sake of the unified style.
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
>  drivers/platform/x86/amd/pmf/cnqf.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 539b186e9027..bc8899e15c91 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/string_choices.h>
>  #include <linux/workqueue.h>
>  #include "pmf.h"
>  
> @@ -399,7 +400,7 @@ static ssize_t cnqf_enable_store(struct device *dev,
>  			amd_pmf_set_sps_power_limits(pdev);
>  	}
>  
> -	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
> +	dev_dbg(pdev->dev, "Received CnQF %s\n", str_on_off(input));
>  	return count;
>  }
>  
> @@ -409,7 +410,7 @@ static ssize_t cnqf_enable_show(struct device *dev,
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>  
> -	return sysfs_emit(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
> +	return sysfs_emit(buf, "%s\n", str_on_off(pdev->cnqf_enabled));
>  }
>  
>  static DEVICE_ATTR_RW(cnqf_enable);

