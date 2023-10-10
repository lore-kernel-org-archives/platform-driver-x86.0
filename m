Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3588CD68FC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 08:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbjJJIGx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 04:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234666AbjJJIGv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 04:06:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CB4A4
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696925164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oAoZNnsMqf6ibxM9UKgZuYsgwg5xu1HQ4/dUYo68IBU=;
        b=HIdJBSFAH1bJlEixjp6LVsoHp2pEBoINxtuSWBBM/JeqYrW2cEbra5M+m0gPc59NMxXGnT
        aYD7RRnE31CyB6iYrMLuu6eArEMlG+cFjq4ukoJ7CPMxdoEpV4Ltk6NhioneQRlsCOzsYf
        EX1KxsPWbeWVFc0nTUGJh+XtvNXOGWY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-oz_6x5qVMHSnPRIYewffrw-1; Tue, 10 Oct 2023 04:05:53 -0400
X-MC-Unique: oz_6x5qVMHSnPRIYewffrw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940so4158221a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 01:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696925152; x=1697529952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAoZNnsMqf6ibxM9UKgZuYsgwg5xu1HQ4/dUYo68IBU=;
        b=ddu6K5HEmuryjgbjHiVwYtx8CsRkIgjU1PdPmUE40etKmwcB3fSB1nuZFVJdrsSC3d
         iroIHUSisjxX5DHVZJ4HDustXUT2y3g2IrNbhhT6imKuwSxoAPI9zo+Bly98qVNOsqIl
         mxVct/DcTrywzAnjmJuqk4OLFUxX14k/jRicqzNCYzDVX6AFeKdbE1T2dYsfNb7cibSD
         NycbHGbJbOpSAbeJv5146mAAd634Q4uqXWM6o6Px6puZ8UJhVNPG/nurXStFapAyPuG7
         Q1aBqGCHAiesxlRVR9gh8T8cykwsxJX/PFmnnoGx6Y8savYMWrw5tNeneCb+PGRjVRNR
         7m2A==
X-Gm-Message-State: AOJu0YxX7Wm7SSj1JadgxbRKw7qie9DXmIhAQslmaO+CjublYRXeSVxP
        iFMMQr9iyfPikJ5VIYNqiEfa85lweN7cYTTH2g1RHH8N3Xvb+jGn0JtP18TtyRQYXd4msNDlWOy
        RGzJNuHTZr5jpNy4AVpBJXhK5ETmPgZCBsg==
X-Received: by 2002:aa7:c695:0:b0:523:4acb:7f41 with SMTP id n21-20020aa7c695000000b005234acb7f41mr15780534edq.14.1696925152339;
        Tue, 10 Oct 2023 01:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyz82T3KxCKYgiZWNJGywJFDer5OqpoNQK67Hr3i4D+6vucMVSywNntIrm8HfPL0P3IjQ9Yg==
X-Received: by 2002:aa7:c695:0:b0:523:4acb:7f41 with SMTP id n21-20020aa7c695000000b005234acb7f41mr15780515edq.14.1696925151981;
        Tue, 10 Oct 2023 01:05:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l16-20020a056402125000b00536159c6c45sm7141882edw.15.2023.10.10.01.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 01:05:51 -0700 (PDT)
Message-ID: <81fb9a8a-0cb4-7799-7f47-603d88e08659@redhat.com>
Date:   Tue, 10 Oct 2023 10:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-tmfifo: Fix a warning
 message
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <bb8bc77e6ecc2287fc9110cfa08caa48eb2a0385.1696508228.git.limings@nvidia.com>
 <35467b21-941f-c829-1ad8-b4e7319dbc04@redhat.com>
 <BN9PR12MB50687C00EDAFC2B1A058E1E3D3C9A@BN9PR12MB5068.namprd12.prod.outlook.com>
 <4d40eacb-382a-f0e9-2dcd-9f9e8c7ca9fd@redhat.com>
 <BN9PR12MB5068173E789479AA99FDF725D3CEA@BN9PR12MB5068.namprd12.prod.outlook.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BN9PR12MB5068173E789479AA99FDF725D3CEA@BN9PR12MB5068.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/23 21:28, Liming Sun wrote:
> 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Friday, October 6, 2023 1:07 PM
>> To: Liming Sun <limings@nvidia.com>; Vadim Pasternak
>> <vadimp@nvidia.com>; David Thompson <davthompson@nvidia.com>; Mark
>> Gross <markgross@kernel.org>; Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-tmfifo: Fix a warning
>> message
>>
>> Hi Liming,
>>
>> On 10/6/23 17:50, Liming Sun wrote:
>>> Thanks Hans.
>>>
>>> Below is the logic:
>>>
>>> IS_VRING_DROP() is ONLY set to TRUE for Rx, which is done in two places:
>>> Line 696:  *desc = &vring->drop_desc;
>>> Line 742: desc = &vring->drop_desc;
>>>
>>> So line 634 below will never happen when IS_VRING_DROP() is TRUE due the
>> checking of line 633.
>>> 633         if (!is_rx)
>>>  634                 writeq(data, fifo->tx.data);
>>>
>>> Please correct me if it's my misunderstanding.
>>
>> If IS_VRING_DROP() is ONLY set to TRUE for Rx, then it
>> should simply *not* be checked *at all* in the tx paths.
> 
> IS_VRING_DROP() itself is actually not checked in the Tx path.  It is the "! IS_VRING_DROP()" that checks the Rx/Tx, something like:
> 
> if (!IS_VRING_DROP(vring)) {
> 	if (is_rx)
> 		...
> 	else
> 		...
> }
> 
> The reason is that I thought we might reuse the ' IS_VRING_DROP' for Tx later.
> 
> However, if the logic looks confusing, I could revise it to something like:
> 
> if (is_rx) {
> 	if (!IS_VRING_DROP(vring)) 
> 		...
> } else {
> 		...
> }

Yes please revise the log to look like this, this should also
fix the warning without needing to initialize data to 0.

Since now in the tx path you are guaranteed to first fill
data before sending it.

Regards,

Hans



>>>> -----Original Message-----
>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>> Sent: Friday, October 6, 2023 8:54 AM
>>>> To: Liming Sun <limings@nvidia.com>; Vadim Pasternak
>>>> <vadimp@nvidia.com>; David Thompson <davthompson@nvidia.com>;
>> Mark
>>>> Gross <markgross@kernel.org>; Dan Carpenter <dan.carpenter@linaro.org>
>>>> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
>>>> Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-tmfifo: Fix a warning
>>>> message
>>>>
>>>> Hi Liming,
>>>>
>>>> On 10/5/23 14:18, Liming Sun wrote:
>>>>> This commit fixes the smatch static checker warning in
>>>>> mlxbf_tmfifo_rxtx_word() which complains data not initialized at
>>>>> line 634 when IS_VRING_DROP() is TRUE. This is not a real bug since
>>>>> line 634 is for Tx while IS_VRING_DROP() is only set for Rx. So there
>>>>> is no case that line 634 is executed when IS_VRING_DROP() is TRUE.
>>>>>
>>>>> This commit initializes the local data variable to avoid unnecessary
>>>>> confusion to those static analyzing tools.
>>>>>
>>>>> Signed-off-by: Liming Sun <limings@nvidia.com>
>>>>> ---
>>>>>  drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c
>>>> b/drivers/platform/mellanox/mlxbf-tmfifo.c
>>>>> index f3696a54a2bd..ccc4b51d3379 100644
>>>>> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
>>>>> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
>>>>> @@ -595,8 +595,8 @@ static void mlxbf_tmfifo_rxtx_word(struct
>>>> mlxbf_tmfifo_vring *vring,
>>>>>  {
>>>>>  	struct virtio_device *vdev = vring->vq->vdev;
>>>>>  	struct mlxbf_tmfifo *fifo = vring->fifo;
>>>>> +	u64 data = 0;
>>>>>  	void *addr;
>>>>> -	u64 data;
>>>>>
>>>>>  	/* Get the buffer address of this desc. */
>>>>>  	addr = phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
>>>>
>>>>
>>>> This will fix the warning but not the issue at hand. As Dan pointed
>>>> out in his original bug report, the issue is that after:
>>>>
>>>> 78034cbece79 ("platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no
>>>> descriptors")
>>>>
>>>> We now have this IS_VRING_DROP() check in the path, which despite
>>>> the subject writeq(data, fifo->tx.data);is currently being applied to both rx
>> and
>>>> tx vring-s
>>>> and when this returns true the memcpy from the ring to &data
>>>> will not happen, but the code will still do:
>>>>
>>>> writeq(data, fifo->tx.data);
>>>>
>>>> So you may have silenced the warning now, but you will still write
>>>> data not coming from the vring to transmit. The only difference
>>>> is you are now guaranteed to write all zeroes.
>>>>
>>>> Note another older issue is that if you hit the not enough space
>>>> path:
>>>>
>>>>        } else {
>>>>                 /* Leftover bytes. */
>>>>                 if (!IS_VRING_DROP(vring)) {
>>>>                         if (is_rx)
>>>>                                 memcpy(addr + vring->cur_len, &data,
>>>>                                        len - vring->cur_len);
>>>>                         else
>>>>                                 memcpy(&data, addr + vring->cur_len,
>>>>                                        len - vring->cur_len);
>>>>                 }
>>>>                 vring->cur_len = len;
>>>>         }
>>>>
>>>> Then even if IS_VRING_DROP() returns true you are only initializing some
>> bytes
>>>> of the 8 bytes data variable and the other bytes will stay at whatever
>> random
>>>> value they had before and you end up writing this random bytes when
>> doing:
>>>>
>>>> writeq(data, fifo->tx.data);
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>
> 

