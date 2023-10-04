Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C6CE776F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 09:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241983AbjJDJPm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241993AbjJDJPl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 05:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC20DA6
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696410897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bunlCVjtxyDqkX/kNpApD0Ftthh4uZzQ4eVN7yChhkY=;
        b=P0xYNJNTIVEngN8fjbyfj9HRHRstnzKkfbuk2vFlxdEazPKzw41iEIz4mqZ01CtYaITszS
        ctIP+lGspsBTDBRPTpyjeR7LMOc59jiuq3VQqlfj+STT7EFi9HJzUhKzSzUPykDd9ilTJy
        /jXSE8tc1NpYR3JEod3zHY7Be2cGjkc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-Nh0atumqMNKiuw4x7SB0vA-1; Wed, 04 Oct 2023 05:14:56 -0400
X-MC-Unique: Nh0atumqMNKiuw4x7SB0vA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b2e3f315d5so85784466b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 02:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696410895; x=1697015695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bunlCVjtxyDqkX/kNpApD0Ftthh4uZzQ4eVN7yChhkY=;
        b=KGX7Pb+iMWC/aNNQQVekOjI3yMPOKlYAIJPOyZKkemtliRUrtM4hVjZk2mUHvMRFvq
         jNzlQUjwalDwOBStaM/JGUlaqntIUikEHAPwlcu3CP5i+hV2OnOFXE2+pvKBFRZl+xqg
         ZBVoy4eJAyKBVzwVcQDAwoATJBB05f1WOaJD4g3r4x4OCoh4U/T/i925X9+G6DsEnuE6
         PLLgFHucth5UrAIfh5HJZyKYHEDfGnAiJLAp7ICKAP6iypbe4ZGTyl+5ptecD7Fom9ns
         MFxjmY+tuoF2eM86stN3npJCzoTum5B5R0WfG4XQiy8r2dx+MsXxU8zQ0nu8EjaumJ6k
         Gu+Q==
X-Gm-Message-State: AOJu0YwZnYUty7aeW+JBR4L8485G54Ya5WGlnPFX/NRzihcIjhYnOSO5
        i3y01jAohf77zkQcKTbw7ATxFJB1+kJHfB7bU1QKIX4VtrcuMoa9rDFy7EHCFwnLyDd+ZHrW0gh
        oEBGW5F2uByKJ0GPqYohW5KMOmy2YfKMoqg==
X-Received: by 2002:a17:907:2da8:b0:9a5:794f:f3c5 with SMTP id gt40-20020a1709072da800b009a5794ff3c5mr4786291ejc.6.1696410894823;
        Wed, 04 Oct 2023 02:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETrTrRKY7A2zGNFwKAMBXaOI2iNGL5Pu32nFgRzqoUpiRc2Kiy0rDHRz3GFNFhpGA1wRzWhQ==
X-Received: by 2002:a17:907:2da8:b0:9a5:794f:f3c5 with SMTP id gt40-20020a1709072da800b009a5794ff3c5mr4786270ejc.6.1696410894364;
        Wed, 04 Oct 2023 02:14:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n10-20020a170906118a00b009a19701e7b5sm2406776eja.96.2023.10.04.02.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:14:53 -0700 (PDT)
Message-ID: <5c6625ba-c2f0-6510-c1ea-3005a9c16e14@redhat.com>
Date:   Wed, 4 Oct 2023 11:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
 <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
 <b3e4acdc-c031-cf00-b972-bc11e3933799@redhat.com>
 <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ac5a328e-48ab-4e21-ad8a-72518d0952cb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 9/25/23 12:48, Shyam Sundar S K wrote:
> Hi Hans,
> 
> Apologies for the long delay.

No problem and sorry for being slow with replying
myself too.

> On 9/18/2023 5:57 PM, Hans de Goede wrote:
>> Hi Shyam,
>>
>> On 9/10/23 16:20, Shyam Sundar S K wrote:
>>> There have been instances when the default size (1M) of the STB is not
>>> sufficient to get the complete traces of the failure. In such scenarios
>>> we can use a module_param to enable full trace that shall contain more
>>> debugging data. This is not a regular case and hence not enabling this
>>> capability by default.
>>>
>>> With this change, there will be two cases on how the driver fetches the
>>> stb data:
>>> 1) A special case (proposed now) - which is required only for certain
>>> platforms. Here, a new module param will be supplied to the driver that
>>> will have a special PMFW supporting enhanced dram sizes for getting
>>> the stb data. Without the special PMFW support, just setting the module
>>> param will not help to get the enhanced stb data.
>>>
>>> 2) Current code branch which fetches the stb data based on the parameters
>>> like the num_samples, fsize and the r/w pointer.
>>>
>>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>> v3->v4:
>>>  - Update code branches and commit-msg as per Ilpo's remark.
>>>
>>> v2->v3:
>>>  - no change
>>>
>>> v1->v2:
>>>  - rebase to 'review-hans' branch
>>>  - drop 2/4 of v1
>>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>>
>>>  drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++---------
>>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>>  2 files changed, 32 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>> index 443bb78ea5f4..7e907cb50787 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -53,6 +53,7 @@
>>>  
>>>  /* STB Spill to DRAM Parameters */
>>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
>>> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>>>  
>>>  /* STB Spill to DRAM Message Definition */
>>> @@ -160,6 +161,10 @@ static bool disable_workarounds;
>>>  module_param(disable_workarounds, bool, 0644);
>>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>>  
>>> +static bool dump_custom_stb;
>>> +module_param(dump_custom_stb, bool, 0644);
>>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>>> +
>>>  static struct amd_pmc_dev pmc;
>>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  {
>>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>>> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>>>  	int ret;
>>>  
>>>  	/* Write dummy postcode while reading the STB buffer */
>>> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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
>>> @@ -264,20 +265,36 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  	dev->msg_port = 0;
>>>  	if (ret) {
>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>> -		kfree(buf);
>>>  		return ret;
>>>  	}
>>>  
>>>  	/* Start capturing data from the last push location */
>>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
>>> -		stb_rdptr_offset = num_samples - fsize;
>>> +	if (dump_custom_stb &&
>>> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
>>> +		/*
>>> +		 * we have a custom stb size and the PMFW is supposed to give
>>> +		 * the enhanced dram size. Note that we land here only for the
>>> +		 * platforms that support enhanced dram size reporting.
>>> +		 */
>>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>> +		stb_rdptr_offset = 0;
>>
>> I don't understand this part. Why is num_samples not taken into account
>> anymore ?  and why substract S2D_TELEMETRY_BYTES_MAX from dram_size ?
> 
> Like I tried to capture this information in the commit-msg; this is a
> special case where the standard STB size reported by the SMU FW will
> not be useful to debug the failures. In those identified platforms,
> there be a custom SMU FW running and it will have the enhanced FW
> reporting capability.

Right that I understand.

> So, in those "identified" platforms, we don't need to look at the
> num_samples. That's an agreed protocol between the driver and FW for
> this case.

Ok, I find that a bit weird, I understand the special firmware has
a bigger buffer. But you do still read num_samples:

        ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);

Even in the special firmware case. If the protocol for the special
firmware is always dump the whole buffer, then why still read
num_samples at all.

And even with the bigger buffer it might not be entirely filled
with info. So assuming num_samples is still valid would it not
make more sense to then still only return the actual part of
the buffer filled with samples ?

> not the entire DRAM size reported by the FW is usable, it has a
> reserved space of 1M. Hence we have to subtract that while accouting
> the dev->fsize here.

Ok, but surely that reserved space has nothing to do with
S2D_TELEMETRY_BYTES_MAX, just because S2D_TELEMETRY_BYTES_MAX happens
to have the same value as the amount of reserved space, it seems weird
to use that define there. If there is 1M of reserved space please
just add a RESERVED_RAM_SIZE define for this.

And why is the size:

 (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)

check there at all, what if future hw has a bigger size ?

You already make the size of the malloc of the buffer to read
the samples into dynamic in this patch, so why have this weird
arbitrary limit?

And for that matter what if dev->dram_size is smaller then
S2D_TELEMETRY_BYTES_MAX/RESERVED_RAM_SIZE ?




>>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>> +		/*
>>> +		 * This is for general cases, where the stb limits are meant for
>>> +		 * standard usage
>>> +		 */
>>> +		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;
>>> +		stb_rdptr_offset = num_samples - dev->fsize;
>>
>> This assumes that num_samples is in the S2D_TELEMETRY_BYTES_MAX+1 .. 2*S2D_TELEMETRY_BYTES_MAX
>> rang, what if it is more ?
>>
>> I think that what you want here is:
>>
>> 		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> No, this does not work.
> 
> Let's take an example:
> 
> dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
> num_samples = 0x8218b8
> 
> existing:
> stb_rdptr_offset = num_samples - dev->fsize;
> we will get => 0x7218b8

Right, but I assume that dev->stb_virt_addr is a ring-buffer
which contains at most the last max 0 - S2D_TELEMETRY_BYTES_MAX
bytes, IOW  valid addresses to read from are:

(dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)

So valid range for stb_rdptr_offset is:

(0) - (S2D_TELEMETRY_BYTES_MAX - 1)

And 0x7218b8 falls out side of that valid range.

> but if we do:
> stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> we will get => 0x21ea8

Yes my proposal changes stb_rdptr_offset, that is basically
the entire goal of my proposal, to make sure that
stb_rdptr_offset is within:

(0) - (S2D_TELEMETRY_BYTES_MAX - 1)

This also makes me realize that the existing code
really should split the read in 2 when 
(num_samples > S2D_TELEMETRY_BYTES_MAX)

First read the oldest samples which are at location
of (num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
and then read the newer samples from location 0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)

Note this is a problem with the current code which I'm just noticing
now unrelated to the new dump_custom_stb module parameter.

I believe that the current code should look like this:

        /* Start capturing data from the last push location */
        if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
		/* First read oldest data starting 1 behind last write till end of ringbuffer */
                stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
		memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
		/* Second copy the newer samples from offset 0 - last write */
		memcpy_fromio(buf + fsize, dev->stb_virt_addr, stb_rdptr_offset);
        } else {
		memcpy_fromio(buf, dev->stb_virt_addr , num_samples);
        }

This will keep all memory accesses within the range of:

(dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)

While as the old code would overflow this range on the high end as soon
as you hit the if (num_samples > S2D_TELEMETRY_BYTES_MAX) {} path.

> You can see that r/w pointer would get corrupted if we do %
> 
> This is only one example and the same holds true for any other
> examples too.
> 
> I spoke to our FW team too to confirm if the driver interpretation is
> as per expectation and their answer was YES.
> 
> So I feel the current code is actually doing the right thing to
> calculate the r/w offset.

I don't think so, your own example:

> dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
> num_samples = 0x8218b8
> 
> existing:
> stb_rdptr_offset = num_samples - dev->fsize;
> we will get => 0x7218b8

Clearly causes memory accesses outside of the:

(dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)

range since 0x7218b8 > S2D_TELEMETRY_BYTES_MAX

But even with an example where we don't need the '%' operator the old code is wrong:

> dev->fsize = S2D_TELEMETRY_BYTES_MAX (i.e. 0x100000)
> num_samples = 0x1218b8

Now after the :

                stb_rdptr_offset = num_samples - fsize;

stb_rdptr_offset will be 0x218b8 and 0x218b8 < S2D_TELEMETRY_BYTES_MAX
so that is good right?

Well yes and no, yes the start of the:

       memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);

Will be within the range of:

(dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)

But the last read will be from

(dev->stb_virt_addr + 0x218b8 + S2D_TELEMETRY_BYTES_MAX - 1)

and the following obviously is true:

(dev->stb_virt_addr + 0x218b8 + S2D_TELEMETRY_BYTES_MAX - 1) >
(dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)

So the old code will cause reads outside of the valid window of:

(dev->stb_virt_addr + 0) - (dev->stb_virt_addr + S2D_TELEMETRY_BYTES_MAX - 1)

even if num_samples only is somewhat larger then S2D_TELEMETRY_BYTES_MAX .

And another potential issue with the *current* code is that for the case
where (num_samples < S2D_TELEMETRY_BYTES_MAX), amd_pmc_stb_debugfs_read_v2()
passes S2D_TELEMETRY_BYTES_MAX as bufsize to simple_read_from_buffer()
while there are only 0s from the kzalloc after the num_samples bytes
of actual data.

One more remark below.


>> Note this is a pre-existing problem but I just noticed this now.
>>
>> Regards,
>>
>> Hans
>>
>>>  	} else {
>>> -		fsize = num_samples;
>>> +		dev->fsize = num_samples;
>>>  		stb_rdptr_offset = 0;
>>>  	}
>>>  
>>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>>> +	buf = kzalloc(dev->fsize, GFP_KERNEL);
>>> +	if (!buf)
>>> +		return -ENOMEM;
>>> +
>>> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, dev->fsize);
>>>  	filp->private_data = buf;
>>>  
>>>  	return 0;
>>> @@ -286,11 +303,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>>>  					   loff_t *pos)
>>>  {
>>> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>> +
>>>  	if (!filp->private_data)
>>>  		return -EINVAL;
>>>  
>>>  	return simple_read_from_buffer(buf, size, pos, filp->private_data,
>>> -					S2D_TELEMETRY_BYTES_MAX);
>>> +					dev->fsize);

You cannot store the size of the buffer in dev->fsize a second call
to amd_pmc_stb_debugfs_open_v2() may race with a process holding
open another fd. This could change fsize to a bigger size causing
an out of bounds read here.

Instead you should create a struct with a flexarray data member:

struct amd_pmc_stb_v2_data {
	size_t size;
	u8 data[] __counted_by(size);
};	

And then kzalloc that struct and store that in filp->private_data so
that the size of the allocation is tied to the filp and we cannot
get races when multiple processes are opening the debugfs file
at the same time.

Regards,

Hans




>>>  }
>>>  
>>>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>>> index c27bd6a5642f..f73d265430b8 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>> @@ -26,6 +26,7 @@ struct amd_pmc_dev {
>>>  	u32 dram_size;
>>>  	u32 num_ips;
>>>  	u32 s2d_msg_id;
>>> +	u32 fsize;
>>>  /* SMU version information */
>>>  	u8 smu_program;
>>>  	u8 major;
>>
> 

