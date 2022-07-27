Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17323C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 21:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiG0VlD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 17:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiG0VlC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 17:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA940BE06
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658958060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XjpX+Hxm97fE+CSZFoqr2RxDKqQPz41lFZIaoWOHVGw=;
        b=NBs9sp0FsDq5oE7DoHtTaHkpQp1WXHvCslE1WhaAtJGjxAANdS+h3LDQ6k/2S6NeZi27PL
        1Ns7eDZfwZAD25xqEEYs+vYoPq3VsvghBR0ZlFbRq4EQ5Rfgz7AC1TQh20V1GqVgACDX1g
        4DgZE6pQEg0ymcY9XMqCU8IZA/HZOQo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-U6PZvpJ3PAuiOfUS8-hykw-1; Wed, 27 Jul 2022 17:40:58 -0400
X-MC-Unique: U6PZvpJ3PAuiOfUS8-hykw-1
Received: by mail-ed1-f72.google.com with SMTP id e6-20020a056402190600b0043bde36ab23so12766edz.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 14:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XjpX+Hxm97fE+CSZFoqr2RxDKqQPz41lFZIaoWOHVGw=;
        b=6w93uTcupElcTF2cItiN6AvIucdUHrXzZeSuM6Rhp17zI16Fcdt9+5YhqGJuJiASbF
         nRBZYWBU3immlj03MQA7M0HESq4UD4W+dRrL0a6GNx06v7tZiSFvhgS4FYUBWdDO1gic
         Js2R9bTPMaDrb8gk2c6ICYplHruIN6JRATd9A6dEQIWFkSQClWBXSq0jRakeeCT3fKcW
         B+ooDYaanE+rapJN99YaBE+E119gb3C+ziTCL3nS6aiRWTni7UH9ORz8xnxcYv4tcsHK
         tLiVxHe09um1T+i2p0sZhLJsHn8i6whIwsp27UYhS2O6ZstrN0a7KUjUmjocFfu3y9lx
         oftQ==
X-Gm-Message-State: AJIora+7B0I8J2Je8GhiITdBIKU6lqpNWyKteugd1Or/zCzPxgH8riRl
        3DiIAXWKlTip9f6ymQG5MuTKE+P5GJucmSwXTNHUFvVoZrzpjs3WQeaqfnLrmI1B288OjFODRxG
        dyetDWqeg1L1Xc//Bq3H6PFjylYSfpvfBeg==
X-Received: by 2002:a05:6402:26c8:b0:43c:1ce4:e9a4 with SMTP id x8-20020a05640226c800b0043c1ce4e9a4mr14766881edd.26.1658958057556;
        Wed, 27 Jul 2022 14:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBnML6PVTOE7Ed9JwcZobWmA4wRe5J95C0yephLR2Dst1WmpEFPgc1AwstUydoXK26ESSW6A==
X-Received: by 2002:a05:6402:26c8:b0:43c:1ce4:e9a4 with SMTP id x8-20020a05640226c800b0043c1ce4e9a4mr14766870edd.26.1658958057360;
        Wed, 27 Jul 2022 14:40:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a17-20020a50ff11000000b00435a62d35b5sm10746267edu.45.2022.07.27.14.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:40:56 -0700 (PDT)
Message-ID: <26254e35-ccb9-b1d5-fc7e-f5b3177caff0@redhat.com>
Date:   Wed, 27 Jul 2022 23:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 14/15] platform/x86/amd/pmf: Force load driver on older
 supported platforms
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-15-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-15-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> Some of the older platforms with _HID "AMDI0100" PMF driver can be force
> loaded by interested users but only for experimental purposes.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/amd/pmf/core.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 2a3dacfb2005..ef50d67f6013 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -39,6 +39,7 @@
>  #define AMD_PMF_RESULT_FAILED                0xFF
>  
>  /* List of supported CPU ids */
> +#define AMD_CPU_ID_RMB			0x14b5
>  #define AMD_CPU_ID_PS			0x14e8
>  
>  #define PMF_MSG_DELAY_MIN_US		50
> @@ -52,6 +53,11 @@ static int metrics_table_loop_ms = 1000;
>  module_param(metrics_table_loop_ms, int, 0644);
>  MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size time (default = 1000ms) ");
>  
> +/* Force load on supported older platforms */
> +static bool force_load;
> +module_param(force_load, bool, 0444);
> +MODULE_PARM_DESC(force_load, " Force load this driver on supported older platforms (experimental) ");
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int current_power_limits_show(struct seq_file *seq, void *unused)
>  {
> @@ -240,6 +246,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  }
>  
>  static const struct pci_device_id pmf_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
>  	{ }
>  };
> @@ -313,6 +320,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  }
>  
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> +	{"AMDI0100", 0x100},
>  	{"AMDI0102", 0},
>  	{ }
>  };
> @@ -320,6 +328,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
>  
>  static int amd_pmf_probe(struct platform_device *pdev)
>  {
> +	const struct acpi_device_id *id;
>  	struct amd_pmf_dev *dev;
>  	struct pci_dev *rdev;
>  	u32 base_addr_lo;
> @@ -328,6 +337,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	u32 val;
>  	int err;
>  
> +	id = acpi_match_device(amd_pmf_acpi_ids, &pdev->dev);
> +	if (!id)
> +		return -ENODEV;
> +
> +	if (id->driver_data == 0x100 && !force_load)
> +		return -ENODEV;
> +
>  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>  	if (!dev)
>  		return -ENOMEM;

