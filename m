Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2D8C43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 09:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiGIJtJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 05:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiGIJsq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 05:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98A2471BD8
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657360086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BlyBQAyYHr94kaXAtNbsePMNGWU7xxVjNP6Ohft23ow=;
        b=I+AleDTy2reGvQpCgJk9H+G6BlFWut+Ub2yjbvCrnv4hz9KCRIs7ZJ8CVBKprYiPcA0Udc
        7qKll8TdzeaHH6PaCsgyoWkJq1tr2ZBdGnO5ar2tvSugoMutEHIWNpiIjFUefgiML1u7rW
        zu+XLcez2z8z94p76zwn5cY7D7b4I2M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-cJNsRShxOZ-14KN37lcTGQ-1; Sat, 09 Jul 2022 05:48:05 -0400
X-MC-Unique: cJNsRShxOZ-14KN37lcTGQ-1
Received: by mail-ed1-f69.google.com with SMTP id b7-20020a056402350700b00435bd1c4523so831263edd.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 02:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=BlyBQAyYHr94kaXAtNbsePMNGWU7xxVjNP6Ohft23ow=;
        b=zvho2zHWMvlDNgkr+lLvkywiZ+5Vw6hurT1YNwxa/5+IcvRRctqyl0scmKrIWSlSf8
         w0D0CvNawQ9H0zzFsTxSlZBwLkRifyqYvB5r7G2B0lPoeASq51XMRxRBlyj87kdGlqkl
         xNoQ3R8mj0g8ttJwu4PvUFtmArfNXhddzoz2TQ1yvXBuFB2CEZT4tod9bYtKBLGjCeCQ
         7bCaL31nayHF4OeV5lt7hfdtd2RB1MYGPvLvjLu5HaZeAnbCA9Veq6CbwwHZmTyy9N+S
         If6gMKI2cz4+CmNV/irSS78ybaXugLB+IcrtbX37N0bbPXSmxNqiCPPxjwdqr8s8J/NQ
         iRzA==
X-Gm-Message-State: AJIora/AonLZBL4GxFDTuK2cbDG6ibnAFLOhzRWE7WK+SbMd2X5BySSu
        6ZkYEwYI2CyOl0DWDixKA6ujW8mEu8soVeptOuU01A6E2lZ8CchSHqzEw5Jux2YMcs7BbdPn8J3
        zvEdo+wOK0MHUa6g1ADFcEbfSyvDyN4TLhg==
X-Received: by 2002:a05:6402:7da:b0:43a:6fe3:b7a9 with SMTP id u26-20020a05640207da00b0043a6fe3b7a9mr10483551edy.410.1657360084322;
        Sat, 09 Jul 2022 02:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCp3mRdrtnkzP+ynBSq50nc9ST/sufvKQLSHaXJ+i+49NH7M0ZCD5q8Pppa2o0iJgLjgnwHg==
X-Received: by 2002:a05:6402:7da:b0:43a:6fe3:b7a9 with SMTP id u26-20020a05640207da00b0043a6fe3b7a9mr10483532edy.410.1657360084113;
        Sat, 09 Jul 2022 02:48:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7cf19000000b0043a56c0ededsm680948edy.74.2022.07.09.02.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 02:48:03 -0700 (PDT)
Message-ID: <edba69a1-3404-d20f-2a9c-6359de37b6ee@redhat.com>
Date:   Sat, 9 Jul 2022 11:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 2/7] platform/x86: serial-multi-instantiate: Improve
 autodetection
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Binding <sbinding@opensource.cirrus.com>
Cc:     Mark Gross <markgross@kernel.org>, patches@opensource.cirrus.com
References: <20220709000636.35550-1-andriy.shevchenko@linux.intel.com>
 <20220709000636.35550-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20220709000636.35550-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

<resend with Stefan added to the To list>

Hi,

On 7/9/22 02:06, Andy Shevchenko wrote:
> Instead of calling specific resource counter, let just probe each
> of the type and see what it says. Also add a debug message when
> none is found.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Only probing for I2C resources if some are present is deliberate:

commit 68f201f9061c000d7a4a9f359f021b1cd535d62b
Author: Stefan Binding <sbinding@opensource.cirrus.com>
Date:   Fri Jan 21 17:24:29 2022 +0000

    platform/x86: serial-multi-instantiate: Add SPI support
    
    Add support for spi bus in serial-multi-instantiate driver
    
    Some peripherals can have either a I2C or a SPI connection
    to the host (but not both) but use the same HID for both
    types. So it is not possible to use the HID to determine
    whether it is I2C or SPI. The driver must check the node
    to see if it contains I2cSerialBus or SpiSerialBus entries.
    
    For backwards-compatibility with the existing nodes I2C is
    checked first and if such entries are found ONLY I2C devices
    are created. Since some existing nodes that were already
    handled by this driver could also contain unrelated
    SpiSerialBus nodes that were previously ignored, and this
    preserves that behavior. If there is ever a need to handle
    a node where both I2C and SPI devices must be instantiated
    this can be added in future.
    
    Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
    Link: https://lore.kernel.org/r/20220121172431.6876-8-sbinding@opensource.cirrus.com
    Reviewed-by: Hans de Goede <hdegoede@redhat.com>
    Signed-off-by: Hans de Goede <hdegoede@redhat.com>

So nack for this change.

Regards,

Hans



> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 97db23243018..e599058196bb 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -232,6 +232,7 @@ static int smi_probe(struct platform_device *pdev)
>  	const struct smi_node *node;
>  	struct acpi_device *adev;
>  	struct smi *smi;
> +	int ret;
>  
>  	adev = ACPI_COMPANION(dev);
>  	if (!adev)
> @@ -255,15 +256,20 @@ static int smi_probe(struct platform_device *pdev)
>  	case SMI_SPI:
>  		return smi_spi_probe(pdev, adev, smi, node->instances);
>  	case SMI_AUTO_DETECT:
> -		if (i2c_acpi_client_count(adev) > 0)
> -			return smi_i2c_probe(pdev, adev, smi, node->instances);
> -		else
> -			return smi_spi_probe(pdev, adev, smi, node->instances);
> +		ret = smi_i2c_probe(pdev, adev, smi, node->instances);
> +		if (ret && ret != -ENOENT)
> +			return ret;
> +		ret = smi_spi_probe(pdev, adev, smi, node->instances);
> +		if (ret && ret != -ENOENT)
> +			return ret;
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Error No resources found\n");
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
>  
> -	return 0; /* never reached */
> +	return 0;
>  }
>  
>  static int smi_remove(struct platform_device *pdev)

