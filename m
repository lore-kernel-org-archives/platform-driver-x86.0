Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F63E95A96
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 10:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346141AbjJIKGx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 06:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346108AbjJIKGn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA07D9F
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696845955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n16gOlweDpnRsI1VVcHdmfISHASUaoolcDyKBg8u/Go=;
        b=O8CVEFVfB7enhYublOszUSuW7cJzg/cniVSTkxykqykxe6jkgPdzSw/57E1NGQ8XN/0uQb
        hHAYSP/fUF+tQf2CaZrucuTr1+wx3OPvEgWJyZT5blTC7d6amixR3EraVYJOihoD9rX/PS
        YmG9gB49EHVFtxyj0lTpqi9zLQfTHpc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-mZmOlN9gP2-40R-0X7UlVA-1; Mon, 09 Oct 2023 06:05:42 -0400
X-MC-Unique: mZmOlN9gP2-40R-0X7UlVA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b65c46bca8so338224166b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 03:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845941; x=1697450741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n16gOlweDpnRsI1VVcHdmfISHASUaoolcDyKBg8u/Go=;
        b=SrDGXFS3+NrYjDePLdJAKnvuWRVmodncO9c/lSUhLPC+71AYHkE0/pK8ZOB0OyZ80x
         MLmVlga4wiqNLQAm06C6uWr2vbacIPUd14YBnujgM75ASk8ZPzscL6MiCHUZpw1kk5AD
         FOrQBlhA4x/oI9iwzBFRpEJjFTsvkSMgwn4fJK+PNvYC75awj8M67fuHLTnpZx52oK5Z
         qJf647/1Yi0j2KgrCbnCe1CNkUbJNLYHHHuNOTZOUfjbUlM3EaHC5EqudVaWCnM4cXzF
         aOwtICuz6m05Ux/J25L8ufcjHYPL7WryuxxIM6CyNhw9ZvPECnMS3/5ldX+lRXSTj1m8
         UY8g==
X-Gm-Message-State: AOJu0YwLfybHZPz6uAjnEhSgOy8Yq1n7kqSxi3xfI32Q/g6VKqeFXAeH
        JmKQxSK3yGlyRIShx9s2v/LCck33RGZ5vICJgJV/PGLAITYADe3VkFRapQfvCNE0AZU8DKExrG/
        HMDEMnoxxBx9HXRD3QCR7RJBkKkecdgbsQg==
X-Received: by 2002:a17:906:3f04:b0:9ae:5568:b6a8 with SMTP id c4-20020a1709063f0400b009ae5568b6a8mr14741815ejj.10.1696845941672;
        Mon, 09 Oct 2023 03:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU5MlYkK5wb1W52nM+6UwaBFL5NsEresZOj2YrranwES+0Gio/If4PDgGOmeC0R2QFjhpOLQ==
X-Received: by 2002:a17:906:3f04:b0:9ae:5568:b6a8 with SMTP id c4-20020a1709063f0400b009ae5568b6a8mr14741791ejj.10.1696845940959;
        Mon, 09 Oct 2023 03:05:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u16-20020a1709064ad000b009ae54585aebsm6434964ejt.89.2023.10.09.03.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:05:40 -0700 (PDT)
Message-ID: <c6264a03-41e2-978c-8490-95f9337c28c7@redhat.com>
Date:   Mon, 9 Oct 2023 12:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/4] platform/x86/amd/pmc: Handle overflow cases where
 the num_samples range is higher
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
 <20231009094539.6746-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231009094539.6746-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/23 11:45, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index e00d69801369..67daa655cc6a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -271,18 +271,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)

I would prefer to keep the kzalloc as a single alloc call
above the if, also no need to zero the mem now:

	fsize = (num_samples > S2D_TELEMETRY_BYTES_MAX) ? S2D_TELEMETRY_BYTES_MAX : num_samples;
	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
	if (!flex_arr)
		return -ENOMEM;
	
  	flex_arr->size = fsize;

And then drop the 2 kzalloc calles in the 2 branches of the if ... else ...

>  	/* Start capturing data from the last push location */
>  	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> -		stb_rdptr_offset = num_samples - fsize;
> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> +
> +		flex_arr = kzalloc(struct_size(flex_arr, data, S2D_TELEMETRY_BYTES_MAX),
> +				   GFP_KERNEL);
> +		if (!flex_arr)
> +			return -ENOMEM;
> +
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +		/* Second copy the newer samples from offset 0 - last write */
> +		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
>  	} else {
>  		fsize = num_samples;
> -		stb_rdptr_offset = 0;
> -	}
> +		flex_arr = kzalloc(struct_size(flex_arr, data, num_samples), GFP_KERNEL);
> +		if (!flex_arr)
> +			return -ENOMEM;
>  
> -	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> -	if (!flex_arr)
> -		return -ENOMEM;
> +		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, num_samples);
> +	}
>  
> -	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>  	flex_arr->size = fsize;

This is wrong for the if (num_samples > S2D_TELEMETRY_BYTES_MAX)
code path above since fsize there is used to calculate the size of
the first copy, where as flex_arr->size should be set to
S2D_TELEMETRY_BYTES_MAX. Dong the alloc + assigning flex_arr->size
first as suggested above fixes this.

>  	filp->private_data = flex_arr->data;
>  


Regards,

Hans




