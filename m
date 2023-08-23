Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52321EE49A0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Aug 2023 15:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbjHWP2c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Aug 2023 11:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237225AbjHWP2c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Aug 2023 11:28:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03C4CD9
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692804466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u/vTJVl2yBUOy4ud3X79g3alDZ9q6nVELMwoDqYASdc=;
        b=WIZiFL78Nafwx/D5W6yNv1E4Am2VFJcZTLTSmZYWVWeLs0IdlAuGzlQwOhK+tRCiGRcMxl
        rVE3OtyAaaFdLPAMjhl0nMbXYvb9Nx/btEgAPlZEkmChAVIfHX2/TttHGeuqk9FiR1S79w
        1XykbL+oNdlRWm56i8fIzhnYIIuguVU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-iugsYEeOO5-E2dqOv0Pl5Q-1; Wed, 23 Aug 2023 11:27:44 -0400
X-MC-Unique: iugsYEeOO5-E2dqOv0Pl5Q-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-313c930ee0eso3712778f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 08:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692804462; x=1693409262;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/vTJVl2yBUOy4ud3X79g3alDZ9q6nVELMwoDqYASdc=;
        b=Jb+rcNSOgpRxP+YSkcpe1bfgzNCFIvu0t5f6oMwX3Uqo2N39lkeDYXKEzqSPNZCeQW
         jUdCjzXXLCaZVWvxclJqfzK5b7NYl/JES5a8pejQT6Ju9cmLaJPb1TnAQX+oQIz2hzYP
         IM2eUcjfpKwbwNA7W4qFvhxK02Ym9kfKYIx58yQwqQ4C2zO3u4zjXcz4ZPEPtfkESbw9
         CuOrrL/RUd5JvX7tz+QXRjnKf+FmqnZcw4CKGIwwllPkOgatNBhsuRyVMpVZOoT/jvpt
         jiQt80aDeAgIN3T6HxyAqSUIOJ2jV2KsoPZYiu+2KktyemUhPk3Mv9BMHNNIhThSOwEa
         PCmA==
X-Gm-Message-State: AOJu0Yw5oGgF5CIdusQJ3rKxSvEoBryPp9r23xr3hiPEDK8HxrxbNoC7
        ok3eXawFRaKe7LkfS5+rktXdrfpnuZfx1oVQmKMRLC7DvD9ApnP6ZPrVyTQGJ2XAapwbcooFU9w
        7IWM/xYuiiwVY89CgMhW0+Py5/2Q3n3vjnz6Z9m8E9w==
X-Received: by 2002:a5d:63d2:0:b0:317:5b1b:1a40 with SMTP id c18-20020a5d63d2000000b003175b1b1a40mr9407621wrw.49.1692804462513;
        Wed, 23 Aug 2023 08:27:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM2nklribgJRlKWO0HvhFsp+j8+1GqYfEQj2T9CWsoexgiUKZmVlZJXbPqM+etjRd79Z2+9g==
X-Received: by 2002:aa7:d058:0:b0:522:1d23:a1f8 with SMTP id n24-20020aa7d058000000b005221d23a1f8mr10014568edo.26.1692804441839;
        Wed, 23 Aug 2023 08:27:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p6-20020aa7d306000000b0052574ef0da1sm9292680edq.28.2023.08.23.08.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 08:27:21 -0700 (PDT)
Message-ID: <304cf929-ea79-e7c1-aab0-d4d022233868@redhat.com>
Date:   Wed, 23 Aug 2023 17:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next 1/1] platform/x86: mlx-platform: Fix 0-DAY
 CI warning
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20230823075038.7129-1-vadimp@nvidia.com>
 <e2b3e6f1-8093-ee35-3694-6041ece318e7@redhat.com>
In-Reply-To: <e2b3e6f1-8093-ee35-3694-6041ece318e7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/23 13:13, Hans de Goede wrote:
> Hi,
> 
> On 8/23/23 09:50, Vadim Pasternak wrote:
>> Fix 0-DAY CI warning: unused variable 'mlxplat_acpi_table'.
>>
>> Add dependency on "ACPI" to Kconfig file.
>> Remove "ACPI_PTR", use plain assignment to 'mlxplat_acpi_table'.
>>
>> Fixes: e2185e8f37ef ("platform: mellanox: mlx-platform: Introduce ACPI init flow")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202308231011.pa9xg8sF-lkp@intel.com/
>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> 
> Thank you for your patch, I've applied this patch to my review-hans 
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

Note I have to do a forced push to my review-hans branch due to
an author vs s-o-b mismatch which I missed earlier.

As part of that I'm going to squash this fix into the original
e2185e8f37ef ("platform: mellanox: mlx-platform: Introduce ACPI
init flow") commit.

Regards,

Hans





>> ---
>>  drivers/platform/x86/Kconfig        | 1 +
>>  drivers/platform/x86/mlx-platform.c | 2 +-
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 06b9a5ae5a63..a43db6731f34 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -965,6 +965,7 @@ config SERIAL_MULTI_INSTANTIATE
>>  
>>  config MLX_PLATFORM
>>  	tristate "Mellanox Technologies platform support"
>> +	depends on ACPI
>>  	depends on I2C
>>  	select REGMAP
>>  	help
>> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
>> index 44f107965832..3d96dbf79a72 100644
>> --- a/drivers/platform/x86/mlx-platform.c
>> +++ b/drivers/platform/x86/mlx-platform.c
>> @@ -6629,7 +6629,7 @@ MODULE_DEVICE_TABLE(acpi, mlxplat_acpi_table);
>>  static struct platform_driver mlxplat_driver = {
>>  	.driver		= {
>>  		.name	= "mlxplat",
>> -		.acpi_match_table = ACPI_PTR(mlxplat_acpi_table),
>> +		.acpi_match_table = mlxplat_acpi_table,
>>  		.probe_type = PROBE_FORCE_SYNCHRONOUS,
>>  	},
>>  	.probe		= mlxplat_probe,
> 

