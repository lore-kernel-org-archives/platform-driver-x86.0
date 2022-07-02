Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36A8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Jul 2022 09:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbiGBJ5x (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Jul 2022 05:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbiGBJ5w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Jul 2022 05:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 20C8A17A97
        for <platform-driver-x86@vger.kernel.org>; Sat,  2 Jul 2022 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656755871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tZGvVtiAAGGvwviINLu6VDEXokYnyCk8uC9NOfIl9eY=;
        b=E/+aI8uer6YX3hZ47ghV/8P3XaY+rIb2SiXx1klR6SVNPgcMKhTFGFyhcMLOOnq3Z/Zbxp
        2mFL35IPZ9Ivcr75OX+DjXjHpGY3arOsIlBhTx3GE8CWPoYA7rCIidrHYeULDIxX9XKD83
        YWBewGchb6e0NSdXqoO5rsTFkvIkLnE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-4KxNIqRKPJewlPTBAUolZg-1; Sat, 02 Jul 2022 05:57:49 -0400
X-MC-Unique: 4KxNIqRKPJewlPTBAUolZg-1
Received: by mail-ed1-f69.google.com with SMTP id g7-20020a056402424700b00435ac9c7a8bso3409260edb.14
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Jul 2022 02:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tZGvVtiAAGGvwviINLu6VDEXokYnyCk8uC9NOfIl9eY=;
        b=hjrILKH8NY2Nr+ZQ1IjllybpAyCS7TKU/XhpDzhZN7oRHB9+Mi9fX7BiceEp9+qYUo
         YHCD2Nxgg4W5r8f9ZIWY0tO7CRiyWFK0Gz216zYX7Aq44XHLyWi1TIWloyNjZuMcRsyj
         P6RXaMtnKi96TB3w+A63e2SveRbFmMPa5XrmtDD4OLVK0B6jFW2UzywSfOQOVxRW1OV+
         GoO04qb9xdrcx8YhVkoyDPC7GX1BGRL1Gcd5zTURDfSMAYq6ypS5tk1i8Gf0pLXo9vu2
         /wswOXAc0R3Q7erKH8F90fiZ9w3v3wyFsUlXIlMG4W3l9EpVHaJz0i9IPxwrpWp24zQ+
         WT4A==
X-Gm-Message-State: AJIora8M6a82zpuE8zZUScQu8NpIJG7tz8cf6kJ5CZpWpY1K5+mpzM2H
        DDuzQ/hsNw7Y3JSI308c2zFJ0wDiKiueMpXW4nrZbdu6E4AefpZTsB0uejCm6QgsMgbtjRlEokq
        dG8I8nzRUdEQLT3ztfQQAxEVlxKmkA+JYCw==
X-Received: by 2002:a05:6402:44a:b0:437:8234:f4c6 with SMTP id p10-20020a056402044a00b004378234f4c6mr24593457edw.346.1656755868722;
        Sat, 02 Jul 2022 02:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smuQKVInS+ycDxEDIDGUuROp281Xj0BnBYVWqzYOWm0egxaT4W9REfOmuciH4mSoi9eO7ulQ==
X-Received: by 2002:a05:6402:44a:b0:437:8234:f4c6 with SMTP id p10-20020a056402044a00b004378234f4c6mr24593446edw.346.1656755868562;
        Sat, 02 Jul 2022 02:57:48 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.147.70])
        by smtp.gmail.com with ESMTPSA id f26-20020a056402005a00b004358f6e0570sm16487844edu.17.2022.07.02.02.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jul 2022 02:57:48 -0700 (PDT)
Message-ID: <40918f75-ebb6-4a7b-7124-604101a9990e@redhat.com>
Date:   Sat, 2 Jul 2022 11:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Add new acpi id for PMC
 controller
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20220630050324.3780654-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220630050324.3780654-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/30/22 07:03, Shyam Sundar S K wrote:
> New version of PMC controller will have a separate ACPI id, add that
> to the support list.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
> Based on "review-hans" branch.
> 
>  drivers/platform/x86/amd/pmc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index f11d18beac18..73d6867cc20b 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -91,6 +91,7 @@
>  #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>  #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
>  #define AMD_CPU_ID_YC			0x14B5
> +#define AMD_CPU_ID_CB			0x14D8
>  
>  #define PMC_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
> @@ -318,6 +319,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
>  		break;
>  	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
>  		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>  		break;
>  	default:
> @@ -491,7 +493,7 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &amd_pmc_idlemask_fops);
>  	/* Enable STB only when the module_param is set */
>  	if (enable_stb) {
> -		if (dev->cpu_id == AMD_CPU_ID_YC)
> +		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)
>  			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>  					    &amd_pmc_stb_debugfs_fops_v2);
>  		else
> @@ -615,6 +617,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>  		return MSG_OS_HINT_PCO;
>  	case AMD_CPU_ID_RN:
>  	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
>  		return MSG_OS_HINT_RN;
>  	}
>  	return -EINVAL;
> @@ -735,6 +738,7 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
>  #endif
>  
>  static const struct pci_device_id pmc_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
> @@ -877,7 +881,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	mutex_init(&dev->lock);
>  
> -	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
> +	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
>  		err = amd_pmc_s2d_init(dev);
>  		if (err)
>  			return err;
> @@ -915,6 +919,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>  	{"AMDI0005", 0},
>  	{"AMDI0006", 0},
>  	{"AMDI0007", 0},
> +	{"AMDI0008", 0},
>  	{"AMD0004", 0},
>  	{"AMD0005", 0},
>  	{ }

