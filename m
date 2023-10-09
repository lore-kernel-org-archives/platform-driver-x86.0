Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D09E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 10:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346061AbjJIKJz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 06:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346056AbjJIKJz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E420E9F
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 03:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696846150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kBYY5GydSfe5a57Y/8zagJV0quDOQhqhSPp4eYmUdYQ=;
        b=WG77KibwmWesu+ILwUMVATASqs7bXe8eY0kHX8ltRAnSTPqClD5OdUYMZl/fkL638Hw9tP
        nt2T5wp3cWxmdnZPOJ3ityh4CoD5Hc5Iv1SmOspqlXpclulkywvDjCvy1Nq63KcJHnVvIF
        KjWiQxxiJOkH8rhlYfjC8woA+feGJqI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-HsKs9RK4O_i4zgWpWwB0RA-1; Mon, 09 Oct 2023 06:09:06 -0400
X-MC-Unique: HsKs9RK4O_i4zgWpWwB0RA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-531373ea109so985742a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 03:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696846145; x=1697450945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBYY5GydSfe5a57Y/8zagJV0quDOQhqhSPp4eYmUdYQ=;
        b=EWDWxO3VdfbqK9r2jiyKOxs6qfJgkH/3P23M2QmLRE7/crq1d56BQydShD0qr90Av2
         YSpy1lNSM7LpgZsyzWNXBGYgf+4kg/nCCl/nOOLpWI37i+bDyqRDZ7uNOpnEC6RKnq91
         dvdmvyvFvjPIIm3HGPpxpe2/1uRRVGkwz37lZ/mJgjZFqlE/kbAZpvaeyxUCiA3SQPYa
         Hlqgv+aAeFHm6trxKBbt068lBi7wVne4vsQT2/ZK6gISOB0ok38cyxf0csFud7AZXtqi
         qzjmQyGlRE7NqkOG7Cfq0zJrg6sYIWpQ0DWfJMp+SOa5XGlCxWYKF9rMbz59QbywNeI6
         99Iw==
X-Gm-Message-State: AOJu0YygmwerduzQAgeqn0yhYeSew0ycNUAsfM5uE9vYfPpFQ9ZETukP
        x/I6ibXqbsjgz3gfbLQAhEKdYBlV+DmDf8YCWj3svfvQYbH6TknfpcrN4jBPbHrhMTTCoxRB1No
        HZsan81Oj//9YEVrMah1jBfv/bwnRD5mn/d4qTtWmug==
X-Received: by 2002:aa7:da84:0:b0:536:2b33:83ed with SMTP id q4-20020aa7da84000000b005362b3383edmr15242557eds.24.1696846145172;
        Mon, 09 Oct 2023 03:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtJU+/bahvJsjKFLYmCXnpJC3IId45w5bCQgOLCVDS5iKMG4i3jVsEWKHBwzbQRYF4w445qg==
X-Received: by 2002:aa7:da84:0:b0:536:2b33:83ed with SMTP id q4-20020aa7da84000000b005362b3383edmr15242541eds.24.1696846144852;
        Mon, 09 Oct 2023 03:09:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id by1-20020a0564021b0100b005224f840130sm5872587edb.60.2023.10.09.03.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:09:04 -0700 (PDT)
Message-ID: <2dbcdb1e-2a1a-2763-6084-8215ecb89ce1@redhat.com>
Date:   Mon, 9 Oct 2023 12:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/4] platform/x86/amd/pmc: move some variables to
 struct amd_pmc_dev
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
 <20231009094539.6746-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231009094539.6746-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 10/9/23 11:45, Shyam Sundar S K wrote:
> Move fsize, stb_rdptr_offset, num_samples to struct amd_pmc_dev so
> that these variables are accessible across functions.
> 
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

These variables are only valid temporarily, they can change over
possibly multiple read calls racing. Therefor these MUST NOT
be stored in a global data struct like this.

If you need access to some of these in the new
amd_pmc_stb_handle_efr() introduced in patch 4/4 then please
just pass them as function parameters.

As for accessing the buffer size in amd_pmc_stb_debugfs_read_v2()
I have explained how to do that properly in my review of patch 1/4.

Regards,

Hans


> ---
> v5:
> - new patch based on comments in v4 from Hans.
> - based on review-ilpo branch
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++++-----------
>  drivers/platform/x86/amd/pmc/pmc.h |  3 +++
>  2 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 67daa655cc6a..071d92b7fbde 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -244,8 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>  	struct amd_pmc_stb_v2_data *flex_arr;
> +	u32 val;
>  	int ret;
>  
>  	/* Write dummy postcode while reading the STB buffer */
> @@ -261,7 +261,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		dev_warn_once(dev->dev, "S2D force flush not supported\n");
>  
>  	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &dev->num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  	if (ret) {
> @@ -270,29 +270,31 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	}
>  
>  	/* Start capturing data from the last push location */
> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> +	if (dev->num_samples > S2D_TELEMETRY_BYTES_MAX) {
>  		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> -		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> -		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> +		dev->stb_rdptr_offset = dev->num_samples % S2D_TELEMETRY_BYTES_MAX;
> +		dev->fsize = S2D_TELEMETRY_BYTES_MAX - dev->stb_rdptr_offset;
>  
>  		flex_arr = kzalloc(struct_size(flex_arr, data, S2D_TELEMETRY_BYTES_MAX),
>  				   GFP_KERNEL);
>  		if (!flex_arr)
>  			return -ENOMEM;
>  
> -		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + dev->stb_rdptr_offset,
> +			      dev->fsize);
>  		/* Second copy the newer samples from offset 0 - last write */
> -		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
> +		memcpy_fromio(flex_arr->data + dev->fsize, dev->stb_virt_addr,
> +			      dev->stb_rdptr_offset);
>  	} else {
> -		fsize = num_samples;
> -		flex_arr = kzalloc(struct_size(flex_arr, data, num_samples), GFP_KERNEL);
> +		dev->fsize = dev->num_samples;
> +		flex_arr = kzalloc(struct_size(flex_arr, data, dev->num_samples), GFP_KERNEL);
>  		if (!flex_arr)
>  			return -ENOMEM;
>  
> -		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, num_samples);
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, dev->num_samples);
>  	}
>  
> -	flex_arr->size = fsize;
> +	flex_arr->size = dev->fsize;
>  	filp->private_data = flex_arr->data;
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index c27bd6a5642f..12728eedecda 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -26,6 +26,9 @@ struct amd_pmc_dev {
>  	u32 dram_size;
>  	u32 num_ips;
>  	u32 s2d_msg_id;
> +	u32 fsize;
> +	u32 num_samples;
> +	u32 stb_rdptr_offset;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;

