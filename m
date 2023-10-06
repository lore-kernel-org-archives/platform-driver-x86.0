Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8654AE81E1D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 17:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbjJFRHg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 13:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbjJFRHf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 13:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB191AD
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696612006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QnlDtjxOkF0rM7zIuBEIhztTIzHhCHt7pEN9j5SC+FI=;
        b=WK5G4ObCyD4c5CEo98PgYKtu7Im2kNd7Rol0Q6a8vggsxPF/ADL1DhFyuCHBL5DLUa/1HK
        L0D8WlM7D9vwdchJuzlUfg99Nx2OVgzMVsESLuQzX4je85vnCitm/oJfl7VRW/D9JONOpQ
        zjBUmKvydMuqeVjkiCOVMcfvCI64A54=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-BXJxknDdPVOvGoy7X2K3Hg-1; Fri, 06 Oct 2023 13:06:44 -0400
X-MC-Unique: BXJxknDdPVOvGoy7X2K3Hg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-521da4c99d4so2130171a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 10:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696612003; x=1697216803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnlDtjxOkF0rM7zIuBEIhztTIzHhCHt7pEN9j5SC+FI=;
        b=i7c8dqECEvgRwYaHkxpkefet0OVIT77eeZF0vZbcL1CPh/0O8f7KaQovws3oZaBOCs
         cCIl1w5PgnZXe3A3HgLCwH7HY9C5+m7lvH2BkCBe08lvUYaMcHUhAsGbaKdqjDxWy/dF
         g5fb9uNaN0TRdjUbraS85JtaqvzoeXa7wss8p03NohbWXn9zOUDCRXwbOb7/oVJumFIR
         fuKuYlt2a9PFWc/4B6rGHUhhBLKrZLp2f982xWE8ixdeZWGWx6bF4q8J4F2IgDA332YO
         axeRSV7OU0fJMtLFL9TX40fddhBSAejJdDK4cDPgghMJtam/h4p6nuOOSk5KDMZdBRb/
         vkVg==
X-Gm-Message-State: AOJu0YxVHSqIkufFWMXk80tG3V0JlRurQUWECAXmIbyG00R5qNQzCqCe
        shVSGiXXdqFWa8rN/F9eFdl5ZBy2iGwodNxolEuR9sQYdA9qKAY6Wy7DODCJMkftnHzXynsCUol
        0X7wT3zTtDj00lJgstNOkMcV+7c+N27Cwcg==
X-Received: by 2002:a50:ef0d:0:b0:522:2782:537 with SMTP id m13-20020a50ef0d000000b0052227820537mr7746166eds.15.1696612003041;
        Fri, 06 Oct 2023 10:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJi2TjQZGuwCMHyUNPmVGzrtpHEXx9T9nMAii2SI16nP5s8GwPAYDd1/MT5mpHqLqLtxd4eA==
X-Received: by 2002:a50:ef0d:0:b0:522:2782:537 with SMTP id m13-20020a50ef0d000000b0052227820537mr7746148eds.15.1696612002793;
        Fri, 06 Oct 2023 10:06:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0053331f9094dsm2841348edo.52.2023.10.06.10.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 10:06:42 -0700 (PDT)
Message-ID: <4d40eacb-382a-f0e9-2dcd-9f9e8c7ca9fd@redhat.com>
Date:   Fri, 6 Oct 2023 19:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-tmfifo: Fix a warning
 message
Content-Language: en-US, nl
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BN9PR12MB50687C00EDAFC2B1A058E1E3D3C9A@BN9PR12MB5068.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Liming,

On 10/6/23 17:50, Liming Sun wrote:
> Thanks Hans.
> 
> Below is the logic:
> 
> IS_VRING_DROP() is ONLY set to TRUE for Rx, which is done in two places:
> Line 696:  *desc = &vring->drop_desc;
> Line 742: desc = &vring->drop_desc;
> 
> So line 634 below will never happen when IS_VRING_DROP() is TRUE due the checking of line 633.
> 633         if (!is_rx)
>  634                 writeq(data, fifo->tx.data);
> 
> Please correct me if it's my misunderstanding.

If IS_VRING_DROP() is ONLY set to TRUE for Rx, then it
should simply *not* be checked *at all* in the tx paths.

Just setting data = 0 is simply papering over the warning
without actually fixing anything.

Regards,

Hans




>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Friday, October 6, 2023 8:54 AM
>> To: Liming Sun <limings@nvidia.com>; Vadim Pasternak
>> <vadimp@nvidia.com>; David Thompson <davthompson@nvidia.com>; Mark
>> Gross <markgross@kernel.org>; Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-tmfifo: Fix a warning
>> message
>>
>> Hi Liming,
>>
>> On 10/5/23 14:18, Liming Sun wrote:
>>> This commit fixes the smatch static checker warning in
>>> mlxbf_tmfifo_rxtx_word() which complains data not initialized at
>>> line 634 when IS_VRING_DROP() is TRUE. This is not a real bug since
>>> line 634 is for Tx while IS_VRING_DROP() is only set for Rx. So there
>>> is no case that line 634 is executed when IS_VRING_DROP() is TRUE.
>>>
>>> This commit initializes the local data variable to avoid unnecessary
>>> confusion to those static analyzing tools.
>>>
>>> Signed-off-by: Liming Sun <limings@nvidia.com>
>>> ---
>>>  drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c
>> b/drivers/platform/mellanox/mlxbf-tmfifo.c
>>> index f3696a54a2bd..ccc4b51d3379 100644
>>> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
>>> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
>>> @@ -595,8 +595,8 @@ static void mlxbf_tmfifo_rxtx_word(struct
>> mlxbf_tmfifo_vring *vring,
>>>  {
>>>  	struct virtio_device *vdev = vring->vq->vdev;
>>>  	struct mlxbf_tmfifo *fifo = vring->fifo;
>>> +	u64 data = 0;
>>>  	void *addr;
>>> -	u64 data;
>>>
>>>  	/* Get the buffer address of this desc. */
>>>  	addr = phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
>>
>>
>> This will fix the warning but not the issue at hand. As Dan pointed
>> out in his original bug report, the issue is that after:
>>
>> 78034cbece79 ("platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no
>> descriptors")
>>
>> We now have this IS_VRING_DROP() check in the path, which despite
>> the subject writeq(data, fifo->tx.data);is currently being applied to both rx and
>> tx vring-s
>> and when this returns true the memcpy from the ring to &data
>> will not happen, but the code will still do:
>>
>> writeq(data, fifo->tx.data);
>>
>> So you may have silenced the warning now, but you will still write
>> data not coming from the vring to transmit. The only difference
>> is you are now guaranteed to write all zeroes.
>>
>> Note another older issue is that if you hit the not enough space
>> path:
>>
>>        } else {
>>                 /* Leftover bytes. */
>>                 if (!IS_VRING_DROP(vring)) {
>>                         if (is_rx)
>>                                 memcpy(addr + vring->cur_len, &data,
>>                                        len - vring->cur_len);
>>                         else
>>                                 memcpy(&data, addr + vring->cur_len,
>>                                        len - vring->cur_len);
>>                 }
>>                 vring->cur_len = len;
>>         }
>>
>> Then even if IS_VRING_DROP() returns true you are only initializing some bytes
>> of the 8 bytes data variable and the other bytes will stay at whatever random
>> value they had before and you end up writing this random bytes when doing:
>>
>> writeq(data, fifo->tx.data);
>>
>> Regards,
>>
>> Hans
>>
>>
>>
> 

