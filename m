Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F22E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376702AbjJIOCa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376693AbjJIOCa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:02:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF5191
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696860110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=giIg7J3HDEKbJhw9KaTALL7ZGE5QUgk8o10i2N5Hd1M=;
        b=RbGErlQCIMgVxdzaYgwN/SRApN9+BhmtNmAESsvsd8E7IA8Aqjwcwc1nTEvCQHaVZTBfH+
        qJhuaIIUKZ0NcUhMTzvbdAYZLs5ex7HPiuBhGt2fQisBi4xQ9g2GYYUVpuWRvwH194pNNN
        XM2kMtOii92YGm6G7TRkHUwYVciMhlI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-5dWzx_EWODuxHQzdppe7HQ-1; Mon, 09 Oct 2023 10:01:48 -0400
X-MC-Unique: 5dWzx_EWODuxHQzdppe7HQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b98d8f6bafso371639466b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 07:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860107; x=1697464907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=giIg7J3HDEKbJhw9KaTALL7ZGE5QUgk8o10i2N5Hd1M=;
        b=q3EuSTuEbF2GQTUru6cXQ6yDRtlLEwO1cSHfS94CmxEIGRpBhkcYKMERtN+B4ysuoL
         Yn5n125lXwwhNM69U1wG0zq70p6OXfUIdPQ7oHGoAbBOUw+jWV96kWd1U+dfNjeZ9DzY
         yixGfewWmn1zX+WIhPr0xtttBc1c2KHshuwjz4gGH9yaBMesohCnNGc86KNXA/z7LnIo
         NOoRziTH/IntyI8dUUaDd/f1D+aBhhR6QbuEPWnwIymxidWz25sonFafm/+hVVGjycNG
         5euQ8ZJMTP08TqdD1GiBLV+/X3MoqSldkBrcKHIBmyJ0+PmCx/t6WyHXabBF/S02dKg4
         Iq8Q==
X-Gm-Message-State: AOJu0YyavZy8iZTr74B4/LiKn/3Ny7hlmOx9fXZASzICPvJJW94JJytd
        C9G+ncmn43Jyx29tkjryRAOusKdpdFN3Sl+wRluTJcBH/519KBGD11NiZNH1udDrH67o6V3shpt
        laMm0kEN0l1hyil0CGhg/N8YM3hYE61T3CA==
X-Received: by 2002:a17:906:259:b0:9ad:c763:c3fd with SMTP id 25-20020a170906025900b009adc763c3fdmr14083212ejl.28.1696860106930;
        Mon, 09 Oct 2023 07:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdNnk9Ui3D1ZzrIJnkBTGDjErdh33UAjE+Xbpx7P5nsmwf1mCqppGEi2BBK6k0ExaW25+rQ==
X-Received: by 2002:a17:906:259:b0:9ad:c763:c3fd with SMTP id 25-20020a170906025900b009adc763c3fdmr14083133ejl.28.1696860105438;
        Mon, 09 Oct 2023 07:01:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ov19-20020a170906fc1300b009a193a5acffsm6734931ejb.121.2023.10.09.07.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:01:44 -0700 (PDT)
Message-ID: <7908945d-57f8-42bc-ad91-30ab16f860f2@redhat.com>
Date:   Mon, 9 Oct 2023 16:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/3] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
 <20231009134307.21001-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231009134307.21001-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/23 15:43, Shyam Sundar S K wrote:
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
> To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
> handle enhanced firmware reporting mechanism. Note that, since num_samples
> based r/w pointer offset calculation is not required for enhanced firmware
> reporting we will have this mailbox command sent only in case of regular
> STB cases.
> 
> 2) Current code branch which fetches the stb data based on the parameters
> like the num_samples, fsize and the r/w pointer.
> 
> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v5->v6:
> - No change
> 
> v4->v5:
>  - create a new function amd_pmc_stb_handle_efr() to handle enhanced firmware reporting mechanism
>  - based on review-ilpo branch
>  
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
>  drivers/platform/x86/amd/pmc/pmc.c | 34 ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index e0b5d9de473a..fae47854800d 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -53,6 +53,7 @@
>  
>  /* STB Spill to DRAM Parameters */
>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
> +#define S2D_RSVD_RAM_SPACE		0x100000
>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>  
>  /* STB Spill to DRAM Message Definition */
> @@ -165,6 +166,10 @@ static bool disable_workarounds;
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
> @@ -241,6 +246,25 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  	.release = amd_pmc_stb_debugfs_release,
>  };
>  
> +/* Enhanced STB Firmware Reporting Mechanism */
> +static int amd_pmc_stb_handle_efr(struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	struct amd_pmc_stb_v2_data *flex_arr;
> +	u32 fsize;
> +
> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> +	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> +	if (!flex_arr)
> +		return -ENOMEM;
> +
> +	flex_arr->size = fsize;
> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
> +	filp->private_data = flex_arr;
> +
> +	return 0;
> +}
> +
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> @@ -260,6 +284,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	if (ret)
>  		dev_warn_once(dev->dev, "S2D force flush not supported\n");
>  
> +	/*
> +	 * We have a custom stb size and the PMFW is supposed to give
> +	 * the enhanced dram size. Note that we land here only for the
> +	 * platforms that support enhanced dram size reporting.
> +	 */
> +	if (dump_custom_stb) {
> +		ret = amd_pmc_stb_handle_efr(filp);
> +		return ret;
> +	}
> +

This can be shortened to:

	if (dump_custom_stb)
		return amd_pmc_stb_handle_efr(filp);

With that fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





>  	/* Get the num_samples to calculate the last push location */
>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */

