Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ADCE95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 10:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346067AbjJIKNs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 06:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346048AbjJIKNr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE93C6
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 03:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696846379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/xrX/4cbHFmSf8w7D+9kjedeo7e5bx9y6YtVgcalRPs=;
        b=hn9SrianSHfwuHlODQk3SuLcsetbWw/WhmefbFGMqyzaU4r7oCb7+u2FI0826gG9v/lULo
        uJhXHO+PgSrba8oPjkk9CpZEJMqoYJBrdmSD7ggLmGH3L4qBlz9e5L7OitoFI/y2tQQHvj
        Ut3MxsC24MpyBkYsbFaQDmf35Ah3hhI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-hDg9KrWbPZKDxi5CdJ_h6A-1; Mon, 09 Oct 2023 06:12:58 -0400
X-MC-Unique: hDg9KrWbPZKDxi5CdJ_h6A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5362b33e8ffso3537338a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 03:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696846377; x=1697451177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xrX/4cbHFmSf8w7D+9kjedeo7e5bx9y6YtVgcalRPs=;
        b=Vne1yoyEcqlLy6D5NHiH+J0Y6W6peT7leIu9/msNcbUTb1B9Ka2WgaykfVdbMbA6GY
         FA6zTRkkgQVCepK205w41Ki0ZoAcUfl8eaCbd67NDfUI/lYzNetPG/S3ux0Hwp2lKqpX
         CmaY6C1Q0ypCkNItIlsq5NQxUeIxN/yJQXNOuCge020upAACZoTo0S5b8swI8CzDAADL
         wvNStW3cSaB2BG7ZzNirnKxxtKBiGAHD6A7tsYLwM8H3ksBXWhAo/GzfImT8kxi8c21K
         ZI660NH0Y6NT9naqUfHNkMaVNnY+aAcCgaGeBcTn9AdHyQh81AP0tEszzx7XsTpOoxKQ
         9Z/g==
X-Gm-Message-State: AOJu0Yyib5GOtddBBevzWEnkY7lOA2Vb/8+OpMEqWzUql4B+mT36LgJP
        TS6g3yuxuJFw8WqivhRS0aO1RlvPW/tEbfUgp5jHtGYS+xgYFS6SvDNvZDttJdnLZ6OL/rlXoeU
        6CK209P6rdndLUqoz7brTPCuGqBaTE6+/vg==
X-Received: by 2002:a05:6402:180c:b0:51e:5251:8f45 with SMTP id g12-20020a056402180c00b0051e52518f45mr13318763edy.4.1696846377663;
        Mon, 09 Oct 2023 03:12:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjzLRnn7ItZ4Z4I/e8K3Pmx3SXqUbIOgRSrNt0wFR5IvJnsvQkpF3DYpgLGZpmEyLItNUG4Q==
X-Received: by 2002:a05:6402:180c:b0:51e:5251:8f45 with SMTP id g12-20020a056402180c00b0051e52518f45mr13318752edy.4.1696846377326;
        Mon, 09 Oct 2023 03:12:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c6-20020aa7c746000000b00537f5e85ea0sm5890689eds.13.2023.10.09.03.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:12:56 -0700 (PDT)
Message-ID: <ae18b0bb-b7e2-29a6-0260-b817fffbe171@redhat.com>
Date:   Mon, 9 Oct 2023 12:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/4] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
 <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
 <422424d2-c38d-406b-b4a3-6d48027a81d5@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <422424d2-c38d-406b-b4a3-6d48027a81d5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 10/9/23 12:09, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 10/9/2023 3:21 PM, Hans de Goede wrote:
>> Hi Shyam,
>>
>> On 10/9/23 11:45, Shyam Sundar S K wrote:
>>> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
>>> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
>>> a process holding open another fd. This could change "fsize" to a
>>> bigger size causing an out of bounds read.
>>>
>>> Instead create a struct with a flexarray to solve this.
>>>
>>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>> v5:
>>>  - new patch based on comments in v4 from Hans.
>>>  - based on review-ilpo branch
>>>
>>>  drivers/platform/x86/amd/pmc/pmc.c | 22 ++++++++++++++--------
>>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>> index c92dd5077a16..e00d69801369 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -122,6 +122,11 @@ enum s2d_arg {
>>>  	S2D_DRAM_SIZE,
>>>  };
>>>  
>>> +struct amd_pmc_stb_v2_data {
>>> +	size_t size;
>>> +	u8 data[] __counted_by(size);
>>> +};
>>> +
>>>  struct amd_pmc_bit_map {
>>>  	const char *name;
>>>  	u32 bit_mask;
>>> @@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  {
>>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>>> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>>> +	struct amd_pmc_stb_v2_data *flex_arr;
>>>  	int ret;
>>>  
>>>  	/* Write dummy postcode while reading the STB buffer */
>>> @@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  	if (ret)
>>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>>  
>>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>> -	if (!buf)
>>> -		return -ENOMEM;
>>> -
>>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>>  	dev->msg_port = 1;
>>>  
>>> @@ -264,7 +266,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  	dev->msg_port = 0;
>>>  	if (ret) {
>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>> -		kfree(buf);
>>>  		return ret;
>>>  	}
>>>  
>>> @@ -277,8 +278,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  		stb_rdptr_offset = 0;
>>>  	}
>>>  
>>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>>> -	filp->private_data = buf;
>>> +	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
>>> +	if (!flex_arr)
>>> +		return -ENOMEM;
>>> +
>>> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>>> +	flex_arr->size = fsize;
>>> +	filp->private_data = flex_arr->data;
>>>  
>>>  	return 0;
>>>  }
>>
>>
>> You are not adjusting amd_pmc_stb_debugfs_read_v2() to match it will still
>> return S2D_TELEMETRY_BYTES_MAX, likely overflowing the array!
>>
>> And it will now return the contents of the size_t prefixing the buffer to
>> userspace.
>>
>> So this is obviously broken, nack.
> 
> I think it was taken care in v5 4/4. Can you please take a look at it
> and see if something is really missing?

Please see my other emails in the thread, this really is broken, by
still using a size variable in the global data struct you are
not fixing the race of 2 amd_pmc_stb_debugfs_open_v2() being
made shortly behind each other and
by storing:

	filp->private_data = flex_arr->data;

instead of:

	filp->private_data = flex_arr;

You are causing a pointer not returned by kmalloc to get
passed to kfree() in release().

Regards,

Hans






> 
>         return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -                                       S2D_TELEMETRY_BYTES_MAX);
> +                                        dev->fsize);
> 
> 
> Thanks,
> Shyam
> 
>>
>> Regards,
>>
>> Hans
>>
>>
> 

