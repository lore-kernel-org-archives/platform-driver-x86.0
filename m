Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED789C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 15:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbiIVPpX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 11:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiIVPon (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 11:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14CCFD18
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663861473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RHodpV7EhpaXu4aRtMhZB8p3sn/BG8brHG4TYIiiWwM=;
        b=g5PNmi9NIb93y4PypYPQUtUdAbCwrJLHTGaa1z51onGO1mPMdJoRnfTKfRXYwd6Utu8IKW
        wJty8RCXjyeyD4inYFKSWxJ9jg99XC0CpXT9/gs4PAx8eHBsT0BFPW5nr0ydUQ+GLUNqR/
        8PZw892SfR2NiQzeOsLwrROJ+GXHqhM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-CURpFPjRP4OkaKS4n7fNww-1; Thu, 22 Sep 2022 11:44:31 -0400
X-MC-Unique: CURpFPjRP4OkaKS4n7fNww-1
Received: by mail-ed1-f69.google.com with SMTP id c6-20020a05640227c600b004521382116dso7068323ede.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 08:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RHodpV7EhpaXu4aRtMhZB8p3sn/BG8brHG4TYIiiWwM=;
        b=6gusJ8REMPtQ0TanChZCTzV8QOGrXC+r2sxkaxmuoq+njl9ugLV8F65mXJEpi/DfZf
         ltw/zPGu5cs8TNUbAZJRJQuuOVOLYPyHOcYVM2LtvORkcn8HJtvz23d9Fs/r60piKphL
         vLra+MFNTQc3Hx28pCGEHk2faKkIE1DPT7fbdl9gTyYADmxifX9+lVpny15PvMYfsof4
         f3SbnhrXN9aerGsJJ7j0aTNYUpB6hey/lSROBtNEdmVUDHfL5ZXSxlF8kChsWsswQ9aq
         r/7SYoMj7ClsqXRRcpo2GaBdcKeihzTD9oKuUAomfb39HDrsoSqDtKYwQU/Ss23hye3f
         sO9Q==
X-Gm-Message-State: ACrzQf0yxw7sSxk+cePP/OonRy8dU/PJZdCzKdGw5AK5xMgYwnSrb0+Z
        ndd6H8IMXPzF1CPk5tAm5wXeBNaW7XJoIZJ/Z1GBDNW/Vkw2mxGHCZuR575+vUwY5gueHryX31P
        U4vjhI16M9ZqjfZtetSrunIwqj48ZEOo6Qw==
X-Received: by 2002:a05:6402:d47:b0:454:e621:3b3f with SMTP id ec7-20020a0564020d4700b00454e6213b3fmr3985268edb.5.1663861470798;
        Thu, 22 Sep 2022 08:44:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6SpdK/PURq+X8cfXm0UH59zJ6jwrvbA2mVx1spGsqNnfrCFxza1apEtPYQDr3CbKYztRe/NA==
X-Received: by 2002:a05:6402:d47:b0:454:e621:3b3f with SMTP id ec7-20020a0564020d4700b00454e6213b3fmr3985246edb.5.1663861470594;
        Thu, 22 Sep 2022 08:44:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a10-20020a50ff0a000000b00454546561cfsm3777921edu.82.2022.09.22.08.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 08:44:30 -0700 (PDT)
Message-ID: <7b5ca374-4d54-9848-f059-f76a8e1fc3c6@redhat.com>
Date:   Thu, 22 Sep 2022 17:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86/amd: pmc: Fix build without debugfs
To:     Nathan Chancellor <nathan@kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
References: <20220922153100.324922-1-nathan@kernel.org>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220922153100.324922-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/22/22 17:31, Nathan Chancellor wrote:
> Without CONFIG_DEBUG_FS, the following build error occurs:
> 
>   drivers/platform/x86/amd/pmc.c:984:17: error: use of undeclared identifier 'pmc_groups'; did you mean 'set_groups'?
>                   .dev_groups = pmc_groups,
>                                 ^~~~~~~~~~
>                                 set_groups
>   ./include/linux/cred.h:65:13: note: 'set_groups' declared here
>   extern void set_groups(struct cred *, struct group_info *);
>               ^
>   drivers/platform/x86/amd/pmc.c:984:17: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Werror,-Wincompatible-pointer-types]
>                   .dev_groups = pmc_groups,
>                                 ^~~~~~~~~~
>   2 errors generated.
> 
> pmc_groups was only defined inside a CONFIG_DEBUG_FS block but
> commit 7f1ea75d499a ("platform/x86/amd: pmc: Add sysfs files for SMU")
> intended for these sysfs files to be available outside of debugfs.
> Shuffle the necessary functions out of the CONFIG_DEBUG_FS block so that
> the file always builds.
> 
> Fixes: 7f1ea75d499a ("platform/x86/amd: pmc: Add sysfs files for SMU")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

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
>  drivers/platform/x86/amd/pmc.c | 116 ++++++++++++++++-----------------
>  1 file changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 0616ef8ce64c..e47e54b095af 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -371,6 +371,64 @@ static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
>  }
>  #endif
>  
> +static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
> +{
> +	int rc;
> +	u32 val;
> +
> +	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> +	if (rc)
> +		return rc;
> +
> +	dev->smu_program = (val >> 24) & GENMASK(7, 0);
> +	dev->major = (val >> 16) & GENMASK(7, 0);
> +	dev->minor = (val >> 8) & GENMASK(7, 0);
> +	dev->rev = (val >> 0) & GENMASK(7, 0);
> +
> +	dev_dbg(dev->dev, "SMU program %u version is %u.%u.%u\n",
> +		dev->smu_program, dev->major, dev->minor, dev->rev);
> +
> +	return 0;
> +}
> +
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
>  #ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
> @@ -437,64 +495,6 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
>  
> -static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
> -{
> -	int rc;
> -	u32 val;
> -
> -	rc = amd_pmc_send_cmd(dev, 0, &val, SMU_MSG_GETSMUVERSION, 1);
> -	if (rc)
> -		return rc;
> -
> -	dev->smu_program = (val >> 24) & GENMASK(7, 0);
> -	dev->major = (val >> 16) & GENMASK(7, 0);
> -	dev->minor = (val >> 8) & GENMASK(7, 0);
> -	dev->rev = (val >> 0) & GENMASK(7, 0);
> -
> -	dev_dbg(dev->dev, "SMU program %u version is %u.%u.%u\n",
> -		dev->smu_program, dev->major, dev->minor, dev->rev);
> -
> -	return 0;
> -}
> -
> -static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *attr,
> -				   char *buf)
> -{
> -	struct amd_pmc_dev *dev = dev_get_drvdata(d);
> -
> -	if (!dev->major) {
> -		int rc = amd_pmc_get_smu_version(dev);
> -
> -		if (rc)
> -			return rc;
> -	}
> -	return sysfs_emit(buf, "%u.%u.%u\n", dev->major, dev->minor, dev->rev);
> -}
> -
> -static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
> -				   char *buf)
> -{
> -	struct amd_pmc_dev *dev = dev_get_drvdata(d);
> -
> -	if (!dev->major) {
> -		int rc = amd_pmc_get_smu_version(dev);
> -
> -		if (rc)
> -			return rc;
> -	}
> -	return sysfs_emit(buf, "%u\n", dev->smu_program);
> -}
> -
> -static DEVICE_ATTR_RO(smu_fw_version);
> -static DEVICE_ATTR_RO(smu_program);
> -
> -static struct attribute *pmc_attrs[] = {
> -	&dev_attr_smu_fw_version.attr,
> -	&dev_attr_smu_program.attr,
> -	NULL,
> -};
> -ATTRIBUTE_GROUPS(pmc);
> -
>  static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  {
>  	struct amd_pmc_dev *dev = s->private;
> 
> base-commit: 401199ffa9b69baf3fd1f9ad082aa65c10910585

