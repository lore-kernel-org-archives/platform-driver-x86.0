Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D55E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346512AbjJIOBW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346443AbjJIOBV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D8B94
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696860029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xoYu2Ebu9s7k/ajtoJDHuXJ0cucCWZAR2d/KGxaoJC4=;
        b=Qbb01l3OFNF44w3uchuKhDEP8RlbMMBdGBGx+aq+Fv0X7bZthJYo1QAtn1yanKRx82JJjG
        Pbstla2iHAoV55XUNMek450hQEcMImSV2cj5cr09eGVtFqdbd+B9EK3VK0JTGMtpyfO4Pv
        vlf5zbRa+SWekhQ3vCjDmFIbXd0he8E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-F_8ZsI4qP5SDSJhkkIttTA-1; Mon, 09 Oct 2023 10:00:28 -0400
X-MC-Unique: F_8ZsI4qP5SDSJhkkIttTA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-326f05ed8f9so3377998f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 07:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860026; x=1697464826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoYu2Ebu9s7k/ajtoJDHuXJ0cucCWZAR2d/KGxaoJC4=;
        b=L5zF7BbHVt11ZyC/sbrc3Q1LQe2dz9MWrTqLD/c1MHUeAE4BFrHk7JGQxdBXbgSn3D
         9BhsVDReAH1XctfbbtWqRivR+DuUE58nBwMX53iz2yKejAs/0w/3Sx+czy+eI9CX6Ao9
         V7IM/UkixQVZt4XL4NK5mqQ0ty4Wxe+4+hzXZySuYtfp3VwFhdxSFIMq6VkrbL0Ww+T6
         mJ92vPkkwTZBXebN6q+3VkzVCb3Tv0TqFgrCJvwrlA08DdXbkzQ61hkC+GkL/H4XgNSk
         oi3Mqn3YERLzGU7YQLCvKpDyK4b8mAVgf7QbBhUwscCZQ/6miTIixCR5XWhiujMtC+SM
         +ppA==
X-Gm-Message-State: AOJu0YxmCb1wc2vqAB4smw3qZiS3B+CagkcW+hlz+2kSQxWvjVJ3kq3o
        4J6x7oxdVlaCU8Y4Y8Q4ET7MuGZfJOkxYSG1rM4h2ox1QFK4kIEhJXv2wOwIMwhEb4xASKUDoNY
        kN+7JZ8zFo/d9VpUClyKtG8IMSlK8MkM+2NcQs+bg4A==
X-Received: by 2002:a5d:4e49:0:b0:322:5d58:99c1 with SMTP id r9-20020a5d4e49000000b003225d5899c1mr13470805wrt.10.1696860026033;
        Mon, 09 Oct 2023 07:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8VUHVZ5EBiMOCuq/2fk+hTU3dgSCUVp/b+e92XS9w0Kg8RmTFtr31VWpIHzrjdx2WF/KtvA==
X-Received: by 2002:a5d:4e49:0:b0:322:5d58:99c1 with SMTP id r9-20020a5d4e49000000b003225d5899c1mr13470784wrt.10.1696860025684;
        Mon, 09 Oct 2023 07:00:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f13-20020a05640214cd00b0053821dbd4dasm6042631edx.22.2023.10.09.07.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:00:25 -0700 (PDT)
Message-ID: <b076d3cf-66be-ec99-941a-f450234f5093@redhat.com>
Date:   Mon, 9 Oct 2023 16:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 2/3] platform/x86/amd/pmc: Handle overflow cases where
 the num_samples range is higher
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
 <20231009134307.21001-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231009134307.21001-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/23 15:43, Shyam Sundar S K wrote:
> In amd_pmc_stb_debugfs_open_v2(), the stb buffer is created based on the
> num_samples and the read/write pointer offset. This holds good when the
> num_samples reported by PMFW is less than S2D_TELEMETRY_BYTES_MAX; where
> the stb buffer gets filled from 0th position until
> S2D_TELEMETRY_BYTES_MAX - 1 based on the read/write pointer offset.
> 
> But when the num_samples exceeds the S2D_TELEMETRY_BYTES_MAX, the current
> code does not handle it well as it does not account for the cases where
> the stb buffer has to filled up as a circular buffer.
> 
> Handle this scenario into two cases, where first memcpy will have the
> samples from location:
> (num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
> and next memcpy will have the newest ones i.e.
> 0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v5->v6:
>  - Make changes as per Hans on v5
>  - based on review-ilpo branch


Thanks, patch looks good to me now:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> 
> v4->v5:
>  - Fix exisiting code problems when reading stb buffer as a circular data
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
>  drivers/platform/x86/amd/pmc/pmc.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index fdc1e104c437..e0b5d9de473a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -276,16 +276,23 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  
>  	flex_arr->size = fsize;
>  
> -	/* Start capturing data from the last push location */
> +	/*
> +	 * Start capturing data from the last push location.
> +	 * This is for general cases, where the stb limits
> +	 * are meant for standard usage.
> +	 */
>  	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> -		stb_rdptr_offset = num_samples - fsize;
> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> +
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +		/* Second copy the newer samples from offset 0 - last write */
> +		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>  	} else {
> -		fsize = num_samples;
> -		stb_rdptr_offset = 0;
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
>  	}
>  
> -	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>  	filp->private_data = flex_arr;
>  
>  	return 0;

