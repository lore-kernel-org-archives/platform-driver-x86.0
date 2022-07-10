Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D84C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 16:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiGJQOb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 12:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiGJQOa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 12:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 328B76441
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657469668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AFxyhw3hxCeITYGqSpvXClKGZ7TaZDyQ/0GKQi35CAo=;
        b=IkX+Wd2cfOOv1djN/T2iSvSgZjXtusNAQ0mkaMgsBGonic+vkIaSg4obPfpuZ84jLq90Jg
        7st4ts7nocyOT8KG/e0yl5RRosKo6ZGQo6MuJ9ANlnURp1EBg7wqSj6bPcvor2jm7V6olR
        FgdQ+ErowwVzJfJNRoG9RNyvxRRfPr4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-QVmgEZ0HPdGfzukfPTppLA-1; Sun, 10 Jul 2022 12:14:26 -0400
X-MC-Unique: QVmgEZ0HPdGfzukfPTppLA-1
Received: by mail-ed1-f69.google.com with SMTP id w15-20020a056402268f00b0043ac600a6bcso1771256edd.6
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AFxyhw3hxCeITYGqSpvXClKGZ7TaZDyQ/0GKQi35CAo=;
        b=7rtf6vtH3fkEc+lhvpzQeHPMAPOBbk9hfFEiXxSiUREZTCR3bRolqyv/3rL2pDPKED
         kFnYuBtS3wjtxty2O2upxF16UN/7nb9oy6meq2J0IHn0/HczENrDaV7yupBB3En2z7Ub
         mpo2TFQjpKIFXg5uYdpD48Q73TE1nZJK/876viEA+Piy0eu2qMelq28cvLOa6nv5IDd+
         qAo0ZQBoUnfx8EPOGyuESX1kcFPaVYmqyy5zJo4gMSHE9mba6lE82F+W6HkiCi12qTfm
         cltAON7s9IdDW02NHc607JLuU0iixjNV2OV7JQSaTMsM75norMkYDgkNgiEFVgoy8X2f
         qjOQ==
X-Gm-Message-State: AJIora/2aqopEE7BkJ8cKK1oCg0NqkjNkDY1lXn1yCT56nrqTYWZuyGh
        KHNHfyP3ERh0UQZsFfC/1C7DFMEFoh6m+ysErYq00AoKSz4q05d7P/KV9MU4We/FqL56jY+aJfM
        qRDa/14gUbve1I58UHVDsFWrmLI0ag+fQ3Q==
X-Received: by 2002:aa7:d143:0:b0:43a:88f4:4ec1 with SMTP id r3-20020aa7d143000000b0043a88f44ec1mr19442268edo.141.1657469665610;
        Sun, 10 Jul 2022 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhzc/cdal9a4+4hJM9ZpgcURVq2YCEddp9nP2O73BIffQ2uRNftTxYpAqo9taQcZY2/dOvDg==
X-Received: by 2002:aa7:d143:0:b0:43a:88f4:4ec1 with SMTP id r3-20020aa7d143000000b0043a88f44ec1mr19442240edo.141.1657469665413;
        Sun, 10 Jul 2022 09:14:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sd33-20020a1709076e2100b0072afb23fb9esm1723591ejc.16.2022.07.10.09.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 09:14:25 -0700 (PDT)
Message-ID: <08d17a63-3c77-0422-b2a9-64f154358276@redhat.com>
Date:   Sun, 10 Jul 2022 18:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/6] platform/x86: serial-multi-instantiate: Improve
 autodetection
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>
References: <20220709211653.18938-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220709211653.18938-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/9/22 23:16, Andy Shevchenko wrote:
> Instead of calling specific resource counter, let just probe each
> of the type and see what it says. Return -ENOENT if no resources
> found.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> v2: squashed patch 1, restored behaviour, added comment, dropped message (Hans)
>  .../platform/x86/serial-multi-instantiate.c   | 23 ++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 1e8063b7c169..366087a9fce2 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -100,7 +100,7 @@ static int smi_spi_probe(struct platform_device *pdev, struct acpi_device *adev,
>  	if (ret < 0)
>  		return ret;
>  	else if (!ret)
> -		return -ENODEV;
> +		return -ENOENT;
>  
>  	count = ret;
>  
> @@ -184,7 +184,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct acpi_device *adev,
>  	if (ret < 0)
>  		return ret;
>  	else if (!ret)
> -		return -ENODEV;
> +		return -ENOENT;
>  
>  	count = ret;
>  
> @@ -232,6 +232,7 @@ static int smi_probe(struct platform_device *pdev)
>  	const struct smi_node *node;
>  	struct acpi_device *adev;
>  	struct smi *smi;
> +	int ret;
>  
>  	adev = ACPI_COMPANION(dev);
>  	if (!adev)
> @@ -255,15 +256,21 @@ static int smi_probe(struct platform_device *pdev)
>  	case SMI_SPI:
>  		return smi_spi_probe(pdev, adev, smi, node->instances);
>  	case SMI_AUTO_DETECT:
> -		if (i2c_acpi_client_count(adev) > 0)
> -			return smi_i2c_probe(pdev, adev, smi, node->instances);
> -		else
> -			return smi_spi_probe(pdev, adev, smi, node->instances);
> +		/*
> +		 * For backwards-compatibility with the existing nodes I2C
> +		 * is checked first and if such entries are found ONLY I2C
> +		 * devices are created. Since some existing nodes that were
> +		 * already handled by this driver could also contain unrelated
> +		 * SpiSerialBus nodes that were previously ignored, and this
> +		 * preserves that behavior.
> +		 */
> +		ret = smi_i2c_probe(pdev, adev, smi, node->instances);
> +		if (ret != -ENOENT)
> +			return ret;
> +		return smi_spi_probe(pdev, adev, smi, node->instances);
>  	default:
>  		return -EINVAL;
>  	}
> -
> -	return 0; /* never reached */
>  }
>  
>  static int smi_remove(struct platform_device *pdev)

