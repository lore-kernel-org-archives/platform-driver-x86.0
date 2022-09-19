Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A60ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 11:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiISLuY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 07:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiISLuX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 07:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEA02A42C
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 04:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663588220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CD9LgQ4mipRBRhM2oAmyf57AJ2qYnRbtIiemUERdoCY=;
        b=N399LyoCJSsaOKNwnk0I/zO7xf814orYHmiMucp+thJ6rK1oC62IBKsK8g9jsWv9YUCNLc
        xIvZWgs0J/7OEm0I9cFKm0LYNejOFybSaIqL0yjhYDbTCaB1URkc+ea3Qp3K4pX5QrSPYB
        zOrzV8Nu2tt04v1zlfRrI+XdlMsrA/k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-timosPscP3CbPM471LzeFw-1; Mon, 19 Sep 2022 07:50:19 -0400
X-MC-Unique: timosPscP3CbPM471LzeFw-1
Received: by mail-ej1-f69.google.com with SMTP id hp18-20020a1709073e1200b0078054727517so3940261ejc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 04:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CD9LgQ4mipRBRhM2oAmyf57AJ2qYnRbtIiemUERdoCY=;
        b=BIkGsMktu72X/SvU7u/zPyVesSqFxi5PwTUpz00uKHtTAxReXf27hQVBbofGw5K0/x
         EuF5RKtzQH2wHZTgzIOq8HU7FVaHZH0MB2DeK2CAR5/MYwn8CN1JZOzsz5KtiOaJbf5V
         y/Sg0Pr4IgCgFMmr87rn4NQdtrZ1CYe0ril6opz4A8MeQ9ZN+yfXD0qW1eKJhANnOTyb
         SjlhmN7t4nUA4GeKN3j2Kb1fec6abvOhwxTRwtI4wTTZ2n1i4jeE/fFa8vOeyvyruL1C
         +vtPnB1CDfUXtSnCC0APtOprG6VW7TBbDZnG2xlmV7MRBxn9aHQyzLNc22t8JCfVNJaZ
         ob/w==
X-Gm-Message-State: ACrzQf0Z0ukvcWNxOhF2Ep6fybiDD6xY7DupAF3Y7Ia8Y6jpkriil6Oj
        W8wy5Tc37TxFrVk/RfVWZp3njq1BGbU6qNANKT0KWPj7ip9OPd6fh0atRbDncvsu8SmF2BrRgmS
        BNYA11mXuHFXN7brSFuTRJwhahcImI1//PQ==
X-Received: by 2002:a05:6402:180d:b0:453:bd1d:421c with SMTP id g13-20020a056402180d00b00453bd1d421cmr7465910edy.311.1663588218263;
        Mon, 19 Sep 2022 04:50:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iwknGHBOKUY7UBLj3fK7C/RR/ucIGe/rzb5/tClauXGsdWA9F6hvLkgNTZ+myYqvs4TxyyQ==
X-Received: by 2002:a05:6402:180d:b0:453:bd1d:421c with SMTP id g13-20020a056402180d00b00453bd1d421cmr7465894edy.311.1663588218081;
        Mon, 19 Sep 2022 04:50:18 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b24-20020a17090630d800b0077b523d309asm14661094ejb.185.2022.09.19.04.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:50:17 -0700 (PDT)
Message-ID: <dbb9a37c-d155-2026-72f4-b48e835f3d2c@redhat.com>
Date:   Mon, 19 Sep 2022 12:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] platform/x86/amd: pmc: Add sysfs files for SMU
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20220914141850.259-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220914141850.259-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/14/22 15:18, Mario Limonciello wrote:
> The CPU/APU SMU FW version and program is currently discoverable by
> turning on dynamic debugging or examining debugfs for the amdgpu
> driver. To make this more discoverable, create a dedicated sysfs
> file for it that userspace can parse without debugging enabled.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

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
> v1->v2:
>  * Feedback from Barnabás Pőcze
>    - Fix documentation EOF missing newline
>    - Use ATTRIBUTE_GROUPS macro
>    - Add missing NULL at end of attr
> 
>  Documentation/ABI/testing/sysfs-amd-pmc | 14 +++++++++
>  drivers/platform/x86/amd/pmc.c          | 39 +++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-amd-pmc
> 
> diff --git a/Documentation/ABI/testing/sysfs-amd-pmc b/Documentation/ABI/testing/sysfs-amd-pmc
> new file mode 100644
> index 000000000000..5d71c2298f5b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-amd-pmc
> @@ -0,0 +1,14 @@
> +What:		/sys/bus/platform/drivers/amd_pmc/*/smu_fw_version
> +Date:		October 2022
> +Contact:	Mario Limonciello <mario.limonciello@amd.com>
> +Description:	Reading this file reports the version of the firmware loaded to
> +		System Management Unit (SMU) contained in AMD CPUs and
> +		APUs.
> +
> +What:		/sys/bus/platform/drivers/amd_pmc/*/smu_program
> +Date:		October 2022
> +Contact:	Mario Limonciello <mario.limonciello@amd.com>
> +Description:	Reading this file reports the program corresponding to the SMU
> +		firmware version.  The program field is used to disambiguate two
> +		APU/CPU models that can share the same firmware binary.
> +
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 700eb19e8450..6373c1bce649 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -455,6 +455,44 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  	return 0;
>  }
>  
> +static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct amd_pmc_dev *dev = dev_get_drvdata(d);
> +
> +	if (!dev->major) {
> +		int rc = amd_pmc_get_smu_version(dev);
> +
> +		if (rc)
> +			return rc;
> +	}
> +	return sysfs_emit(buf, "%u.%u.%u\n", dev->major, dev->minor, dev->rev);
> +}
> +
> +static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct amd_pmc_dev *dev = dev_get_drvdata(d);
> +
> +	if (!dev->major) {
> +		int rc = amd_pmc_get_smu_version(dev);
> +
> +		if (rc)
> +			return rc;
> +	}
> +	return sysfs_emit(buf, "%u\n", dev->smu_program);
> +}
> +
> +static DEVICE_ATTR_RO(smu_fw_version);
> +static DEVICE_ATTR_RO(smu_program);
> +
> +static struct attribute *pmc_attrs[] = {
> +	&dev_attr_smu_fw_version.attr,
> +	&dev_attr_smu_program.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(pmc);
> +
>  static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  {
>  	struct amd_pmc_dev *dev = s->private;
> @@ -935,6 +973,7 @@ static struct platform_driver amd_pmc_driver = {
>  	.driver = {
>  		.name = "amd_pmc",
>  		.acpi_match_table = amd_pmc_acpi_ids,
> +		.dev_groups = pmc_groups,
>  	},
>  	.probe = amd_pmc_probe,
>  	.remove = amd_pmc_remove,

