Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17692C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 09:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234584AbjEIJ5b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 05:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbjEIJ5a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 05:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9386A1703
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683626205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oaTOQ0K27eQKF5yA9KfJtjHQBDHHdEjUJFt7kiZHIPo=;
        b=I3sKkdCD8osJ8NLuuJXLtMYrheSYx4tyF9a72IVcnPXV7Cz4Y+ON9K8iVaE2WZb28Th1FT
        DsMAo07XbOmz+uEW9T2cTIWAxYf+k3IhANCmxeKPwydvpGa7NeHltuoaF2IZXHY/nanZ0a
        LnTJRYqx21/tLzlDFHzv7fym3L7pehg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-XX0IdwbNOHmpeK86SZQmow-1; Tue, 09 May 2023 05:56:44 -0400
X-MC-Unique: XX0IdwbNOHmpeK86SZQmow-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-506b0b75731so5337077a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 02:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683626202; x=1686218202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaTOQ0K27eQKF5yA9KfJtjHQBDHHdEjUJFt7kiZHIPo=;
        b=Essl5cgZQptmuxd8vwelqWKwXiBZLhp0rh1xijkmLeXtFPwFDKxJXkiWxAeSzkKtpI
         Qt6Z2lJ4aW7eniX3O5+NEuEkH+NzIgtX61BNUgClFZMlEtGzdJRIgln5z3sohgdFuqzA
         fEV1KNf4iqNQ6ryFeLtR49+kK1wuNVCYhpJdP+AyJOn0MwWYbjHlGQKAW9aNEDK8ewah
         hoZ5fEHjhOQM6v5xTJMfTLqXxEZq5dvrJXveOotMaUNeztAOlxFK759tx0nY5oa4fB0v
         QDwhMBX8aG3YsGxvER3YJ/XLCtrJbQmTw8OqGdO+HumRTixLRhsQs1288OrdyIN15JyC
         sqQw==
X-Gm-Message-State: AC+VfDzvc9uCo1nIYwPTvbrPXbkiuyzW0atA5trMOhPLHs7bnX0SLU7L
        dd3YxXvQtkFqPeZtr04m57QFRcY1mkH95yOlKlpkK3tTofYd0NKWQjRgqT6/JJrc1g74XL8y1Ub
        GdYq9jVEguw6/Ju6rpCiMhvhz6d2EPhtsjg==
X-Received: by 2002:a17:907:2d12:b0:969:98eb:3fdd with SMTP id gs18-20020a1709072d1200b0096998eb3fddmr3682169ejc.3.1683626202557;
        Tue, 09 May 2023 02:56:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4pX3yMA1Jb7LATaSK68YRIv0ateTECpkbTpTf2fAXJwsPe5XwUK84/dvwoM1fY/s2nzL6R5w==
X-Received: by 2002:a17:907:2d12:b0:969:98eb:3fdd with SMTP id gs18-20020a1709072d1200b0096998eb3fddmr3682154ejc.3.1683626202221;
        Tue, 09 May 2023 02:56:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j16-20020a1709062a1000b0094ed3abc937sm1106953eje.82.2023.05.09.02.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:56:41 -0700 (PDT)
Message-ID: <4a2a701c-f764-8b98-015f-0aee776d921f@redhat.com>
Date:   Tue, 9 May 2023 11:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] platform/mellanox: fix potential race in
 mlxbf-tmfifo driver
Content-Language: en-US, nl
To:     Vadim Pasternak <vadimp@nvidia.com>,
        Liming Sun <limings@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b98c0ab61d644ba38fa9b3fd1607b138b0dd820b.1682518748.git.limings@nvidia.com>
 <BN9PR12MB5381316B1E76612838BBB762AF769@BN9PR12MB5381.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BN9PR12MB5381316B1E76612838BBB762AF769@BN9PR12MB5381.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/9/23 11:35, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Liming Sun <limings@nvidia.com>
>> Sent: Wednesday, 26 April 2023 17:24
>> To: Vadim Pasternak <vadimp@nvidia.com>; David Thompson
>> <davthompson@nvidia.com>; Hans de Goede <hdegoede@redhat.com>;
>> Mark Gross <markgross@kernel.org>
>> Cc: Liming Sun <limings@nvidia.com>; platform-driver-x86@vger.kernel.org;
>> linux-kernel@vger.kernel.org
>> Subject: [PATCH v1 1/1] platform/mellanox: fix potential race in mlxbf-tmfifo
>> driver
>>
>> This commit adds memory barrier for the 'vq' update in function
>> mlxbf_tmfifo_virtio_find_vqs() to avoid potential race due to out-of-order
>> memory write. It also adds barrier for the 'is_ready'
>> flag to make sure the initializations are visible before this flag is checked.
>>
>> Signed-off-by: Liming Sun <limings@nvidia.com>
> 
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



>> ---
>>  drivers/platform/mellanox/mlxbf-tmfifo.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c
>> b/drivers/platform/mellanox/mlxbf-tmfifo.c
>> index 91a077c35b8b..a79318e90a13 100644
>> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
>> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
>> @@ -784,7 +784,7 @@ static void mlxbf_tmfifo_rxtx(struct
>> mlxbf_tmfifo_vring *vring, bool is_rx)
>>  	fifo = vring->fifo;
>>
>>  	/* Return if vdev is not ready. */
>> -	if (!fifo->vdev[devid])
>> +	if (!fifo || !fifo->vdev[devid])
>>  		return;
>>
>>  	/* Return if another vring is running. */ @@ -980,9 +980,13 @@
>> static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
>>
>>  		vq->num_max = vring->num;
>>
>> +		vq->priv = vring;
>> +
>> +		/* Make vq update visible before using it. */
>> +		virtio_mb(false);
>> +
>>  		vqs[i] = vq;
>>  		vring->vq = vq;
>> -		vq->priv = vring;
>>  	}
>>
>>  	return 0;
>> @@ -1302,6 +1306,9 @@ static int mlxbf_tmfifo_probe(struct
>> platform_device *pdev)
>>
>>  	mod_timer(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
>>
>> +	/* Make all updates visible before setting the 'is_ready' flag. */
>> +	virtio_mb(false);
>> +
>>  	fifo->is_ready = true;
>>  	return 0;
>>
>> --
>> 2.30.1
> 

