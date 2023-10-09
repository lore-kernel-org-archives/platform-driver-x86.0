Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858FDE95A96
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 10:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346048AbjJIKGW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 06:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346055AbjJIKGU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49D299
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696845932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZlruCrAmCUz1MS5mElyDH3lT+JbQ5MQ5185r6ollc04=;
        b=QV5/e9lAlZVjhy3CtossNk9E7rNru7NxXR7FVj3u2Q4L8bbmPKsz9ZvEgf0K/1giX3TYU8
        OoHv9VePlRScGicLr7nQOBdgc6GJ27PKTe/qbqiPp+IczMzNMFWoVFbME7mzo21lCRsXxf
        Dc+Dln1Ybnqcyt416++k+5ZgE8xxuAA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-fpVSa7DXNFSlCQWOdr7LMQ-1; Mon, 09 Oct 2023 06:05:30 -0400
X-MC-Unique: fpVSa7DXNFSlCQWOdr7LMQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9b274cc9636so355610966b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 03:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845929; x=1697450729;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlruCrAmCUz1MS5mElyDH3lT+JbQ5MQ5185r6ollc04=;
        b=IRX9p+XZa/BMjWvHTl2vBFntx5+C+7dV0gkOt1YDdAYlUmINQT2kwFwqE9LvN82Ndh
         zPU5K6AAVOioHHh6Q1AYHQvncyJrhje4Bt8Dpx/NNQcNwiE1+1LG6w/HJY6Ldmja7465
         CnzXncrpVP/pqq5XDm0ZKa3rT4+jujSz7nxI8yUM3ro+ZDXqVTsVwhxdFDZM2Xqik7Wf
         Io+hQrEy2bVP8fa2iPvKbQbqnhaiQTuIHbOLUa407MJ/rMGKMALnSB+LVpd4QwetH+yu
         fyzs5A6xdpCr3jfbmAKq4tco2xWVsu40wruZkCYTKHTw645kmvTNe+dCaXOhOlAyNtnG
         BNmA==
X-Gm-Message-State: AOJu0YxOq4XobQSfuhgyk2beIYRCw7QOMbKOsjUhOHhZ/LapTsuZ1DBY
        NY3tO+VLjObczTFZ2zkpYq2ZY/+6pSBWme2wI5XZpsy2xIJXKk9HQXwCVHdPbQ6/9hU9f5279Da
        VoUVysrJtlACvHTsl/063kRWiDsHyw7JJHvolUh9KUw==
X-Received: by 2002:a17:906:2250:b0:9ae:69c4:5b4f with SMTP id 16-20020a170906225000b009ae69c45b4fmr14216681ejr.19.1696845929287;
        Mon, 09 Oct 2023 03:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk6DtZFNxxhbb1z9jEx8Dsygis77fcdrh/E+Y2v2c5itqtzhHuRW9ZcL/jJd317mCTEoYPXA==
X-Received: by 2002:a17:906:2250:b0:9ae:69c4:5b4f with SMTP id 16-20020a170906225000b009ae69c45b4fmr14216663ejr.19.1696845928972;
        Mon, 09 Oct 2023 03:05:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906b08600b009a19701e7b5sm6553199ejy.96.2023.10.09.03.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:05:28 -0700 (PDT)
Message-ID: <2c688f8b-36b6-408c-8768-8c9d1f5797d7@redhat.com>
Date:   Mon, 9 Oct 2023 12:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/4] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
 <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
In-Reply-To: <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 10/9/23 11:51, Hans de Goede wrote:
> Hi Shyam,
> 
> On 10/9/23 11:45, Shyam Sundar S K wrote:
>> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
>> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
>> a process holding open another fd. This could change "fsize" to a
>> bigger size causing an out of bounds read.
>>
>> Instead create a struct with a flexarray to solve this.
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v5:
>>  - new patch based on comments in v4 from Hans.
>>  - based on review-ilpo branch
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index c92dd5077a16..e00d69801369 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -122,6 +122,11 @@ enum s2d_arg {
>>  	S2D_DRAM_SIZE,
>>  };
>>  
>> +struct amd_pmc_stb_v2_data {
>> +	size_t size;
>> +	u8 data[] __counted_by(size);
>> +};
>> +
>>  struct amd_pmc_bit_map {
>>  	const char *name;
>>  	u32 bit_mask;
>> @@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  {
>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	struct amd_pmc_stb_v2_data *flex_arr;
>>  	int ret;
>>  
>>  	/* Write dummy postcode while reading the STB buffer */
>> @@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	if (ret)
>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>  
>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>> -	if (!buf)
>> -		return -ENOMEM;
>> -
>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>  	dev->msg_port = 1;
>>  
>> @@ -264,7 +266,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	dev->msg_port = 0;
>>  	if (ret) {
>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> -		kfree(buf);
>>  		return ret;
>>  	}
>>  
>> @@ -277,8 +278,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  		stb_rdptr_offset = 0;
>>  	}
>>  
>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> -	filp->private_data = buf;
>> +	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
>> +	if (!flex_arr)
>> +		return -ENOMEM;
>> +
>> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> +	flex_arr->size = fsize;
>> +	filp->private_data = flex_arr->data;

So I just notices this, this means that amd_pmc_stb_debugfs_read_v2() 
will still start with sending the data and won't prefix it with the
size as I initially thought. I really expected this to read:

	filp->private_data = flex_arr;

Note that although this fixes the prefixing with size issue,
it still leaves the amd_pmc_stb_debugfs_read_v2() returning
S2D_TELEMETRY_BYTES_MAX bytes which overruns the buffer issue.

And it makes amd_pmc_stb_debugfs_release_v2() now call kfree()
on a pointer which was not returned by kmalloc, since
you are now calling kfree(&(flex_arr->data[0]), which
is sizeof(size_t) bytes after the pointer returned by
the kzalloc.

So things are still broken here, you really should set:

	filp->private_data = flex_arr;

So that amd_pmc_stb_debugfs_release_v2() frees the correct
pointer and then change amd_pmc_stb_debugfs_read_v2() to:

static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
                                           loff_t *pos)
{
	struct amd_pmc_stb_v2_data *data = filp->private_data;

        return simple_read_from_buffer(buf, size, pos, data->data, data->size);
}

Regards,

Hans



>>  
>>  	return 0;
>>  }
> 
> 
> You are not adjusting amd_pmc_stb_debugfs_read_v2() to match it will still
> return S2D_TELEMETRY_BYTES_MAX, likely overflowing the array!
> 
> And it will now return the contents of the size_t prefixing the buffer to
> userspace.
> 
> So this is obviously broken, nack.
> 
> Regards,
> 
> Hans
> 
> 

