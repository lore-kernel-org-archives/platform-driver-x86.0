Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73F0C46CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 12:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240402AbjIRM3C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 08:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242017AbjIRM2m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 08:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4927013E
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695040055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m7pfCopGaHhhhNc+2nnSuOUgwfdcAnAmS371j+4b804=;
        b=iZPdgTPX63ZVekRFPEp8LhScPTtghp2RzXehOVtIldyyk2VL7ljzsekIZhfbQcQq61ey3/
        OZFVIus8XrXrtVimy3K7lNO8Gaq9RzfqViUE58y4gRB48oupSHvgw8y1sNxxW8BWhIttwu
        eCrE9W4dVnqNoCVkbp2b3O4kmwnhqWk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-q--WK6_KP0qYrU_2E42JLw-1; Mon, 18 Sep 2023 08:27:33 -0400
X-MC-Unique: q--WK6_KP0qYrU_2E42JLw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a647551b7dso679096066b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 05:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695040050; x=1695644850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7pfCopGaHhhhNc+2nnSuOUgwfdcAnAmS371j+4b804=;
        b=MznosNcSPfUxHk4ldCZDTBTwxIozQb6yDOlJ/pCwwStC6B+3qgAcHHxefcLd/4uNWj
         +OelU5rNC89yBZgNX5cf4KpSt8Cd3LKozoytBwy7uX6TC85km3B7GAdcgdwkbUZ8af1a
         LYbKyrBA3wSXmCZIMcDylufiBf8/aienLcZYpWhpHgpJaqKe7xpFa/OaEtOvGTRevZnj
         opUrKoTKneC9/4h64NI3LYJVtW18OrIZZWiYV3kc9kL2JOmCvszBDcLUbjKHLvg2SSgP
         DZOD2V2YbHeSGgkfHk0LBVYNIq0wYd/9/aQJRQwtnHz1NTV9x8n0OJocWA/2+FXN9eLh
         xaUA==
X-Gm-Message-State: AOJu0YxfhsxU2nFNbEugndvb8jdfEim4FWrf1gMKjganD1AUuFJIocyD
        HaxS4xkzUUVa7tDazv3kCd16agUedJdT8EHDjG2294hMZcJPCwL3n+bTSQQ214haMnTy1nIpk5l
        O5T6DJUvUjZu6KSLLZV7CbxjeJ1z+CxO+tw==
X-Received: by 2002:a17:907:1c8b:b0:9a9:f6e7:43fe with SMTP id nb11-20020a1709071c8b00b009a9f6e743femr18687047ejc.24.1695040050548;
        Mon, 18 Sep 2023 05:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMnUzWOszCTHV49zQ45XwpD+IRTwF+6GXVTQgmDaQY2HxFtAHfuV3fFYGpvA6JSWKIabTxrw==
X-Received: by 2002:a17:907:1c8b:b0:9a9:f6e7:43fe with SMTP id nb11-20020a1709071c8b00b009a9f6e743femr18687027ejc.24.1695040050226;
        Mon, 18 Sep 2023 05:27:30 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cn10-20020a0564020caa00b00530be302f08sm3368464edb.49.2023.09.18.05.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:27:29 -0700 (PDT)
Message-ID: <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
Date:   Mon, 18 Sep 2023 14:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
 <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 9/10/23 16:20, Shyam Sundar S K wrote:
> There have been instances when the default size (1M) of the STB is not
> sufficient to get the complete traces of the failure. In such scenarios
> we can use a module_param to enable full trace that shall contain more
> debugging data. This is not a regular case and hence not enabling this
> capability by default.
> 
> With this change, there will be two cases on how the driver fetches the
> stb data:
> 1) A special case (proposed now) - which is required only for certain
> platforms. Here, a new module param will be supplied to the driver that
> will have a special PMFW supporting enhanced dram sizes for getting
> the stb data. Without the special PMFW support, just setting the module
> param will not help to get the enhanced stb data.
> 
> 2) Current code branch which fetches the stb data based on the parameters
> like the num_samples, fsize and the r/w pointer.
> 
> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3->v4:
>  - Update code branches and commit-msg as per Ilpo's remark.
> 
> v2->v3:
>  - no change
> 
> v1->v2:
>  - rebase to 'review-hans' branch
>  - drop 2/4 of v1
>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++---------
>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>  2 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 443bb78ea5f4..7e907cb50787 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -53,6 +53,7 @@
>  
>  /* STB Spill to DRAM Parameters */
>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>  
>  /* STB Spill to DRAM Message Definition */
> @@ -160,6 +161,10 @@ static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>  
> +static bool dump_custom_stb;
> +module_param(dump_custom_stb, bool, 0644);
> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> +
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>  	int ret;
>  
>  	/* Write dummy postcode while reading the STB buffer */
> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	if (ret)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
>  	/* Spill to DRAM num_samples uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> @@ -264,20 +265,36 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 0;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		kfree(buf);
>  		return ret;
>  	}
>  
>  	/* Start capturing data from the last push location */
> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> -		stb_rdptr_offset = num_samples - fsize;
> +	if (dump_custom_stb &&
> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
> +		/*
> +		 * we have a custom stb size and the PMFW is supposed to give
> +		 * the enhanced dram size. Note that we land here only for the
> +		 * platforms that support enhanced dram size reporting.
> +		 */
> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> +		stb_rdptr_offset = 0;

I don't understand this part. Why is num_samples not taken into account
anymore ?  and why substract S2D_TELEMETRY_BYTES_MAX from dram_size ?



> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> +		/*
> +		 * This is for general cases, where the stb limits are meant for
> +		 * standard usage
> +		 */
> +		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;
> +		stb_rdptr_offset = num_samples - dev->fsize;

This assumes that num_samples is in the S2D_TELEMETRY_BYTES_MAX+1 .. 2*S2D_TELEMETRY_BYTES_MAX
rang, what if it is more ?

I think that what you want here is:

		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;

Note this is a pre-existing problem but I just noticed this now.

Regards,

Hans

>  	} else {
> -		fsize = num_samples;
> +		dev->fsize = num_samples;
>  		stb_rdptr_offset = 0;
>  	}
>  
> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +	buf = kzalloc(dev->fsize, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, dev->fsize);
>  	filp->private_data = buf;
>  
>  	return 0;
> @@ -286,11 +303,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>  					   loff_t *pos)
>  {
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +
>  	if (!filp->private_data)
>  		return -EINVAL;
>  
>  	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -					S2D_TELEMETRY_BYTES_MAX);
> +					dev->fsize);
>  }
>  
>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index c27bd6a5642f..f73d265430b8 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -26,6 +26,7 @@ struct amd_pmc_dev {
>  	u32 dram_size;
>  	u32 num_ips;
>  	u32 s2d_msg_id;
> +	u32 fsize;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;

