Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B81C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 May 2023 13:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242068AbjEONAr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 May 2023 09:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242063AbjEONAQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2023 09:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F5C1989
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2023 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684155563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vqEBUzcqW2zaL08JJXg8yT6HJLVMPb5pkFmhkM5O93I=;
        b=AEIbooCNLxGokXKgaJCR6GX0dUY4zA+W/fgsYnB15h1a3mvVlic7j/YehRPQr2RqOM1XaK
        5GIGBOfzA9MA/R3qVhnsijbWNZQSyQ/qv2zdoyZkXSm1sPJ28dFLL4Xc/8MNCXanDuU0rZ
        Kwp0KG+SHejtOqUQnNqxVWQsTVXE8hU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-s2D-OmWKMMibFrsStrB2ow-1; Mon, 15 May 2023 08:59:22 -0400
X-MC-Unique: s2D-OmWKMMibFrsStrB2ow-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355cf318so1493458966b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2023 05:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155561; x=1686747561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqEBUzcqW2zaL08JJXg8yT6HJLVMPb5pkFmhkM5O93I=;
        b=OTjdAWFOSqX9fX4jmA1y2umpR8JPDsAy4Op53sc3JjSvgdu8Qek1TUMREHl2VUqG6f
         mowb3PnZA3a+9hTGthyZsZVdFe7ZFYSeC7LgRHHcnyj5d5SF+TYJMby+uGW97m2xMqXY
         EqianY55Fu4ic7/+hOvY5626//7GzF1+D4vXU8nMmf31mS1VfF2bEMiqCLONZPDbSTWa
         P3600/w/cZ86SLvQiXv31RndjHFT2rYlx2zNYCngGOOn283tqj6ZqCRTZKt6u8i+69zx
         aWbIoq7tIgl187H+9fvMyVM1hoHmO0YvjngQK4XzewWISgw8/n9dRfZJrjFeenxFMPQr
         /7UA==
X-Gm-Message-State: AC+VfDyeSOivgBXN78m00j6RfeunCKWLTV9DSZ2SsfA1UqjZTM9pkW8F
        f9jragOPaSy98ZHjiQoc6L0cDwBCOomCCY1Y3D/6a9A9h/hl51Qb+e0PGe74wcWN0OxfS4KzxvG
        UmOinPHfe3RjfqkgAPS76mCg7uZTz5c43rA==
X-Received: by 2002:a17:907:628c:b0:94f:2a13:4e01 with SMTP id nd12-20020a170907628c00b0094f2a134e01mr30980278ejc.74.1684155560938;
        Mon, 15 May 2023 05:59:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nFh/l7mmNHU1QDXBRWAkGROxLSEb79749jtLAmfe6bPdMOixZYCIAnqULU6abqrbSrn0SEg==
X-Received: by 2002:a17:907:628c:b0:94f:2a13:4e01 with SMTP id nd12-20020a170907628c00b0094f2a134e01mr30980261ejc.74.1684155560652;
        Mon, 15 May 2023 05:59:20 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y24-20020aa7ccd8000000b0050da1edb2e4sm7207370edt.31.2023.05.15.05.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:59:20 -0700 (PDT)
Message-ID: <fa49c7df-2f07-e8de-74e1-272a5d70ec47@redhat.com>
Date:   Mon, 15 May 2023 14:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/mellanox: mlxbf-pmc: fix sscanf() error checking
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Shravan Kumar Ramani <shravankr@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <4ccdfd28-099b-40bf-8d77-ad4ea2e76b93@kili.mountain>
 <b1187d38-a390-4934-1d30-f069a1a4a730@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b1187d38-a390-4934-1d30-f069a1a4a730@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/15/23 14:37, Ilpo Järvinen wrote:
> On Mon, 15 May 2023, Dan Carpenter wrote:
> 
>> The sscanf() function never returns negatives.  It returns the number of
>> items successfully read.
>>
>> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>  drivers/platform/mellanox/mlxbf-pmc.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
>> index c2c9b0d3244c..be967d797c28 100644
>> --- a/drivers/platform/mellanox/mlxbf-pmc.c
>> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
>> @@ -1348,9 +1348,8 @@ static int mlxbf_pmc_map_counters(struct device *dev)
>>  
>>  	for (i = 0; i < pmc->total_blocks; ++i) {
>>  		if (strstr(pmc->block_name[i], "tile")) {
>> -			ret = sscanf(pmc->block_name[i], "tile%d", &tile_num);
>> -			if (ret < 0)
>> -				return ret;
>> +			if (sscanf(pmc->block_name[i], "tile%d", &tile_num) != 1)
>> +				return -EINVAL;
>>  
>>  			if (tile_num >= pmc->tile_count)
>>  				continue;
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


