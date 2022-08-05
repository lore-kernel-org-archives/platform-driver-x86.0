Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFD6C00140
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Aug 2022 11:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240407AbiHELFV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Aug 2022 07:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237960AbiHELFU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Aug 2022 07:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B734263BB
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Aug 2022 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659697518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uqqxsAuTaoaTRgzcE2PrT8aUxcdWPomDFREncl1rDqA=;
        b=Hcl8g0gg9XC9znxjNPSu4eec60w0nfASIdGcvdneBEBW17D6/ZlljgD3WkElDsFtUPlEGF
        ksLx9B9fde9X/JxryPFQNnBW5gnCyofBnZ03aFDg3rQBkxgXBt4+P7FnRI3WK8nafzUDbD
        WDozgRQN4hBr4pG6APzGzdPtAorK4fk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-XlExH7MPN7aKj-QzZRaZ9Q-1; Fri, 05 Aug 2022 07:05:09 -0400
X-MC-Unique: XlExH7MPN7aKj-QzZRaZ9Q-1
Received: by mail-ej1-f72.google.com with SMTP id qk37-20020a1709077fa500b00730c2d975a0so1086276ejc.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Aug 2022 04:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=uqqxsAuTaoaTRgzcE2PrT8aUxcdWPomDFREncl1rDqA=;
        b=uN76MCI/op7dn8yhS+7hM0VclxKhNZ8xnNHlGOKlDytGP6+bQXu2JwlqeK6hrZkjqG
         F9GJZ5e09kfqrS1gKKbEjEaR+JTh+J0D3jAVka/2aGPH9vLQ1e60GSdYFejavXh2enSA
         mdRBnpx4Meywhc0Vc+K6XYeGP/ssDhR0524j6KR7ZepBB8CkASdRy/jBFE8QkBWjz+2Q
         K0ZXNbIjd4S5L6NWZ7a2ra3Sgtu3WiHbxy0ZrSTyw648a4/G4gYC2HZN4omsC+LwDvct
         5tM7APWZE+gG6vvMvwJPvoSSLB6N15Z40vv118wBpvP44+NMqKYL5Jd3AbQvvgUg/GTW
         BHnw==
X-Gm-Message-State: ACgBeo1vZYyEW+Oskq7Ahg7K1gEtKhNoDLKG+BFW+ueJq5xJvjk0pCPf
        xJhU0SRfzV8RhOTX30iyee6ardgzrDEL8SKhdt02J9QNqc9mHS0Ng/2XCYMZ6gC2KIZsBWbnA5a
        bWKekHQG76PnVH9cg0qCJ5rB2EJ0DS2jrTw==
X-Received: by 2002:a17:907:6e12:b0:730:bc12:82e3 with SMTP id sd18-20020a1709076e1200b00730bc1282e3mr5065843ejc.36.1659697508413;
        Fri, 05 Aug 2022 04:05:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4c3La5v5O5Zqepa1HhlQz9/2G9hBMIGzXy6hQMBUQUyAe1ZWkDS220goyRPqtG8/KLtEiAjg==
X-Received: by 2002:a17:907:6e12:b0:730:bc12:82e3 with SMTP id sd18-20020a1709076e1200b00730bc1282e3mr5065832ejc.36.1659697508172;
        Fri, 05 Aug 2022 04:05:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ku3-20020a170907788300b006fe8ac6bc69sm1488350ejc.140.2022.08.05.04.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 04:05:07 -0700 (PDT)
Message-ID: <5637b655-054e-5fcb-575f-a7c3b97834b0@redhat.com>
Date:   Fri, 5 Aug 2022 13:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 10/11] platform/x86/amd/pmf: Force load driver on older
 supported platforms
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-11-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802151149.2123699-11-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 17:11, Shyam Sundar S K wrote:
> Some of the older platforms with _HID "AMDI0100" PMF driver can be force
> loaded by interested users but only for experimental purposes.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 4467d682cd11..dbca5d7c6311 100644
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

That space at the start of the help string should not be there,
I will fix this up while merging this.

Regards,

Hans

> +
>  static int current_power_limits_show(struct seq_file *seq, void *unused)
>  {
>  	struct amd_pmf_dev *dev = seq->private;
> @@ -208,6 +214,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  }
>  
>  static const struct pci_device_id pmf_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
>  	{ }
>  };
> @@ -265,6 +272,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  }
>  
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> +	{"AMDI0100", 0x100},
>  	{"AMDI0102", 0},
>  	{ }
>  };
> @@ -272,6 +280,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
>  
>  static int amd_pmf_probe(struct platform_device *pdev)
>  {
> +	const struct acpi_device_id *id;
>  	struct amd_pmf_dev *dev;
>  	struct pci_dev *rdev;
>  	u32 base_addr_lo;
> @@ -280,6 +289,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
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

