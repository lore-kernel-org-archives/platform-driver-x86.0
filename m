Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08F7C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 13:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiHAN6Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 09:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbiHAN6W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 258A528E3E
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659362300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NG9ejdPDU0D1wyJLUosz3RCvbs4o/KBpK3t01p6ZOXI=;
        b=DyPh+NsAwdYJ1AP+E5Sd2xPE/euO6ZWHKhH1xgR/54+PXfpxK/PxTVW6z1Gfy5K49W2hjH
        F2mHYDlzQGo27kFoLb0C3wJjmNLdkWAJ96IfJGSS9PW2eyT1xsFHzbwv1okuei1G0KJjT+
        bbf9i0HvoRoUp2xXSWRlG9tdCnoUkdE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-9EKJUMzNNwi1PiUFG---sg-1; Mon, 01 Aug 2022 09:58:18 -0400
X-MC-Unique: 9EKJUMzNNwi1PiUFG---sg-1
Received: by mail-ej1-f70.google.com with SMTP id gn23-20020a1709070d1700b0073094d0e02cso616785ejc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NG9ejdPDU0D1wyJLUosz3RCvbs4o/KBpK3t01p6ZOXI=;
        b=eECjNawckIfRVr7/jgEYn3HaDVALvdyGCcnnAnBgO6euGekbyXRmuyuRvK6AYxXJKm
         dvKL1nmHRJ6EBeka6XUvlSBo32UEg3qDDOyCOQVJtAMErr8AgfK0lUXhsiHdLzSA88Px
         a8ZDiMDQmqjBIRjCi7+Eqj/wnpfGRx0xLZJcudq0HP9jYiUWkg7j024Ntnr2nzS6fnBf
         oa/p4lERpdlAblhKCMf78D/P5/97L58XFKTn/NCBGwVWbdN9seLZIUy3YUp6/zIt238H
         o/JctPxdjnCgHQipBNQPQHaY02AgBAG4I0zjceQv5vEmisklVJihrIXCz+5sNK5en7iG
         qGpw==
X-Gm-Message-State: ACgBeo2CWeGwkX4+W+BNwC/DSqL94ViTM6DZ89caUQ6TSpi3nKKHNTgA
        fXExPshjZhN69rtCGBTKh4AsZuMWiIl7OGOTJBYfgsJfuRos3Y11PPUpv44kGp9SOCqkgFitwkt
        PkT66r6Au8TI3VFYZI8Do1nI/YydVcJ4VSA==
X-Received: by 2002:a17:906:8a6d:b0:730:9cd5:6688 with SMTP id hy13-20020a1709068a6d00b007309cd56688mr75154ejc.158.1659362297770;
        Mon, 01 Aug 2022 06:58:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5oFV0Xtvf4073++FF///ecal04ktZodvXnGbPlEn96k3q2JzxtypVDTIk5QE0s9gNKJVWW6Q==
X-Received: by 2002:a17:906:8a6d:b0:730:9cd5:6688 with SMTP id hy13-20020a1709068a6d00b007309cd56688mr75148ejc.158.1659362297598;
        Mon, 01 Aug 2022 06:58:17 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ws10-20020a170907704a00b007306f2ff447sm1792901ejb.65.2022.08.01.06.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 06:58:16 -0700 (PDT)
Message-ID: <567f53bd-761f-4a0a-3faa-ed20dbe496cd@redhat.com>
Date:   Mon, 1 Aug 2022 15:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 10/11] platform/x86/amd/pmf: Force load driver
 on older supported platforms
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-11-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-11-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
> Some of the older platforms with _HID "AMDI0100" PMF driver can be force
> loaded by interested users but only for experimental purposes.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

This patch still looks good to me.

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmf/core.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bfae779ccc23..c0e3780ae3d1 100644
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
>  static int current_power_limits_show(struct seq_file *seq, void *unused)
>  {
>  	struct amd_pmf_dev *dev = seq->private;
> @@ -237,6 +243,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  }
>  
>  static const struct pci_device_id pmf_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
>  	{ }
>  };
> @@ -294,6 +301,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  }
>  
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> +	{"AMDI0100", 0x100},
>  	{"AMDI0102", 0},
>  	{ }
>  };
> @@ -301,6 +309,7 @@ MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
>  
>  static int amd_pmf_probe(struct platform_device *pdev)
>  {
> +	const struct acpi_device_id *id;
>  	struct amd_pmf_dev *dev;
>  	struct pci_dev *rdev;
>  	u32 base_addr_lo;
> @@ -309,6 +318,13 @@ static int amd_pmf_probe(struct platform_device *pdev)
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

