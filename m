Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CED3C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 15:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCAP3O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 10:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjCAP3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 10:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B335EE3AF
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677684505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wo8c3Tcx2DQ//t8xrnZzzLmVvOoVEvkO+NT6PEIlThc=;
        b=CE8sX4ryQroF0nm3OFry+CNa8naM5C7bTp5YloG0NLxmeGAAOnh7p+72wPT09hZJ4FQRly
        PK09SvphonrZb8mmFwGzkcQsFPbLEMWTtsazDgSooGYUObotTrzDxQ4Nyef2ZUy7RW77us
        5dNdZbU9R48qO9opA8qMaOpqKbXph+w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-Te-uftyOO-a3O4d6S4r3yA-1; Wed, 01 Mar 2023 10:28:20 -0500
X-MC-Unique: Te-uftyOO-a3O4d6S4r3yA-1
Received: by mail-ed1-f70.google.com with SMTP id y24-20020aa7ccd8000000b004be3955a42eso1492397edt.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 07:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wo8c3Tcx2DQ//t8xrnZzzLmVvOoVEvkO+NT6PEIlThc=;
        b=l+3IX85GFcLwS8sbUUilCxkUlpJ899zIOsXxZ3l4hhKFAl4EGmKe/nVQOIewgxpnwZ
         NQ2uMsEkRUXcSLqwQqi4PJlAjyPf3fwrPbbK2xtP+VSZgUiPVxS7ZhSYa7asxsjiQvA3
         fjTqImIFqWkhvhRehfBo66dpu2h7u9BKSrZ9Dk8Wb65uYcvvi4TTV6tpyp+Ok7zYNaKN
         hrRkvz6yQbBQTaCANidg0lzQ/VCsGDeMkHeHbdxol3Gv8DEk+HjH5XGXzo0MBRYEz0N9
         tfRiFVo9ti6ZawplBP0a3rI+j8nkS+5wJ6qU9/uOKScHzzOvJ4SJVqmCJIam4jfnEM6q
         iYlA==
X-Gm-Message-State: AO0yUKUmmrf7DsOwe4zfgVF4qmaFEi+t2Fud1gPUXeC3feIpkTRF9hFa
        Bo5WfWesRjFLq20afY+bCvZ7sJIp9/r05d4XSCvxyo+j5bCPin61238OvVF6InlflRoRDKqoXDX
        Uw/JwOKdGXxZwrledhGSP/HU/Bdu04e1uMg==
X-Received: by 2002:aa7:cad7:0:b0:4ae:eae1:946a with SMTP id l23-20020aa7cad7000000b004aeeae1946amr8416082edt.13.1677684499837;
        Wed, 01 Mar 2023 07:28:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/lC7BQ/X3iIUDijFHRroNnDZaqL6Ts7DJtSojrTX+Ep99Lryg0+dX/mA8OAY/h84fKvW+ZAw==
X-Received: by 2002:aa7:cad7:0:b0:4ae:eae1:946a with SMTP id l23-20020aa7cad7000000b004aeeae1946amr8416055edt.13.1677684499505;
        Wed, 01 Mar 2023 07:28:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z30-20020a50cd1e000000b004aee548b3e2sm5660326edi.69.2023.03.01.07.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 07:28:18 -0800 (PST)
Message-ID: <846d6f46-07ab-4d4a-5623-417a469c3d0b@redhat.com>
Date:   Wed, 1 Mar 2023 16:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] platform/x86/amd: pmc: Add a helper for checking
 minimum SMU version
Content-Language: en-US, nl
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230301150821.9791-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230301150821.9791-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 16:08, Mario Limonciello wrote:
> In a few locations there is some boilerplate code for checking
> minimum SMU version.  Switch this to a helper for this check.
> 
> No intended functional changes.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 49 +++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 2edaae04a691..c42fa47381c3 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -418,6 +418,22 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  	return 0;
>  }
>  
> +static bool amd_pmc_verify_min_version(struct amd_pmc_dev *pdev, int major, int minor)
> +{
> +	if (!pdev->major) {
> +		int rc = amd_pmc_get_smu_version(pdev);
> +
> +		if (rc) {
> +			dev_warn(pdev->dev, "failed to read SMU version: %d\n", rc);
> +			return false;
> +		}
> +	}
> +	if (pdev->major > major)
> +		return true;
> +
> +	return pdev->major == major && pdev->minor >= minor;
> +}
> +
>  static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *attr,
>  				   char *buf)
>  {
> @@ -526,14 +542,7 @@ static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
>  	struct amd_pmc_dev *dev = s->private;
>  	int rc;
>  
> -	/* we haven't yet read SMU version */
> -	if (!dev->major) {
> -		rc = amd_pmc_get_smu_version(dev);
> -		if (rc)
> -			return rc;
> -	}
> -
> -	if (dev->major > 56 || (dev->major >= 55 && dev->minor >= 37)) {

The 2 major checks here originally were not in sync, so for major == 55
*and* major == 56 it would only succeed if minor >= 37.

Where as after this patch for major == 56 it will now always succeed.

This feels like a bug in the original code, but might have been
intentional ? Please verify this.

After verifying please post a v2 updating the commit message to
point out this functional change.

> +	if (amd_pmc_verify_min_version(dev, 55, 37)) {
>  		rc = amd_pmc_idlemask_read(dev, NULL, s);
>  		if (rc)
>  			return rc;
> @@ -686,15 +695,8 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>  static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
>  {
>  	struct device *d;
> -	int rc;
>  
> -	if (!pdev->major) {
> -		rc = amd_pmc_get_smu_version(pdev);
> -		if (rc)
> -			return rc;
> -	}
> -
> -	if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
> +	if (amd_pmc_verify_min_version(pdev, 64, 66))
>  		return 0;
>  
>  	d = bus_find_device_by_name(&serio_bus, NULL, "serio0");
> @@ -718,14 +720,10 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  	struct rtc_time tm;
>  	int rc;
>  
> -	/* we haven't yet read SMU version */
> -	if (!pdev->major) {
> -		rc = amd_pmc_get_smu_version(pdev);
> -		if (rc)
> -			return rc;
> -	}
> +	if (disable_workarounds)
> +		return 0;
>  
> -	if (pdev->major < 64 || (pdev->major == 64 && pdev->minor < 53))
> +	if (!amd_pmc_verify_min_version(pdev, 64, 53))
>  		return 0;
>  
>  	rtc_device = rtc_class_open("rtc0");
> @@ -772,13 +770,14 @@ static void amd_pmc_s2idle_prepare(void)
>  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
>  	amd_pmc_setup_smu_logging(pdev);
>  
> -	/* Activate CZN specific platform bug workarounds */
> -	if (pdev->cpu_id == AMD_CPU_ID_CZN && !disable_workarounds) {
> +	switch (pdev->cpu_id) {
> +	case AMD_CPU_ID_CZN:
>  		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
>  		if (rc) {
>  			dev_err(pdev->dev, "failed to set RTC: %d\n", rc);
>  			return;
>  		}
> +		break;
>  	}
>  
>  	msg = amd_pmc_get_os_hint(pdev);


Patch 2/2 looks good to me.

Should I queue v2 (once posted) up as a fix for 6.3-rc#  ?

Regards,

Hans

