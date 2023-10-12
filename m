Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2A8CDB46E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Oct 2023 12:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343875AbjJLMmR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Oct 2023 08:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343872AbjJLMmQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2023 08:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08C9B8
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697114491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YGl58q3UEnCPfW8dsB9yop127yMKcVctRgxIbEImnc0=;
        b=GsAirY7imEAHv5WZgQUMwSNGShZxjfwD61D5u/qq6N3/TqC6bDAadl5N9dAywO+TM1JMHy
        /UwUNSl4sAPbPpTuZ3M2vytzbwXP4/IRUIF5ZjgSOQ4JEd0izCcmx2WDmhdFsmy0HcoUa9
        5as1m29cTZHs+X0gt81hr1/d+2MVB3c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-HU1qfl__MeOVY_8Lx5NYhA-1; Thu, 12 Oct 2023 08:41:19 -0400
X-MC-Unique: HU1qfl__MeOVY_8Lx5NYhA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9b9ecd8c351so61965266b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 05:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114478; x=1697719278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGl58q3UEnCPfW8dsB9yop127yMKcVctRgxIbEImnc0=;
        b=Nc1GdvbUhfeRD+2wqsubffx3yM5xXd/lcjtCgM3L56hkhZveSmB0YljrBMnaue6VvJ
         xTNANT0MDqRGUcckznCs31jhX0xuI+GF/L+TVtQi5/lgjkIeZl4pooaw+2DiPtWbira0
         QMD4bKyF7dFNwJrwB/RhAVvKc+zBNGiU6AYe5o7sT2a5bIzNKZe7t5XhQ9XUo+kN2Iyi
         R7jWXT8ho6ZDciqsAj8QzxNI0/inMgJCM+DoapnrLUe6+QF7UK7ScZrCCkyLuvCo7+sA
         u0maDXkv/e3c3oD5aQAn0hyK/tAYpbbf7JbKeLsvLOGUgI5DJ7urFeZGLIRMRRWbP101
         uRgA==
X-Gm-Message-State: AOJu0YxJYGbGElzubmKs6vcttghTvaIHOVISJkr+i8zbEuJWG+pr8QHP
        2+tT6ljd9gEy32f+mTBw3mmzA9R8cxY3WzQb4WGf+HEw8/oSAArUUl39pY5xq/pICn8Umwryasp
        mViARJAhJ6v/tOhcPQOLor+ojHxr2gxloFw==
X-Received: by 2002:a17:907:2cf6:b0:9ba:1d08:ad4a with SMTP id hz22-20020a1709072cf600b009ba1d08ad4amr9897994ejc.29.1697114478375;
        Thu, 12 Oct 2023 05:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsBgJUEeFfNxKIa5OU+PcicP1GniR8piru1Cysi5CziZMOurCh3+y10XJt+h2omLnUt95xg==
X-Received: by 2002:a17:907:2cf6:b0:9ba:1d08:ad4a with SMTP id hz22-20020a1709072cf600b009ba1d08ad4amr9897982ejc.29.1697114478034;
        Thu, 12 Oct 2023 05:41:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qb40-20020a1709077ea800b009b9af27d98csm9622653ejc.132.2023.10.12.05.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:41:17 -0700 (PDT)
Message-ID: <894d40dc-4a7b-4cdd-759f-e96112e6a395@redhat.com>
Date:   Thu, 12 Oct 2023 14:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] platform/x86: msi-ec: Add EC bit operation functions
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231010172037.611063-3-teackot@gmail.com>
 <20231010172037.611063-11-teackot@gmail.com>
 <9ea4b836-38d8-8abd-4222-3acb22ee287@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9ea4b836-38d8-8abd-4222-3acb22ee287@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/11/23 14:59, Ilpo Järvinen wrote:
> On Tue, 10 Oct 2023, Nikita Kravets wrote:
> 
>> The EC of MSI laptops supports several features represented by a single
>> bit. Add ec_set_bit and ec_check_bit functions to operate on these bits.
>>
>> Cc: Aakash Singh <mail@singhaakash.dev>
>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
>> ---
>>  drivers/platform/x86/msi-ec.c | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
>> index 09472b21e093..ae73dcf01d09 100644
>> --- a/drivers/platform/x86/msi-ec.c
>> +++ b/drivers/platform/x86/msi-ec.c
>> @@ -699,6 +699,34 @@ static int ec_read_seq(u8 addr, u8 *buf, u8 len)
>>  	return 0;
>>  }
>>  
>> +static int ec_set_bit(u8 addr, u8 bit, bool value)
>> +{
>> +	int result;
>> +	u8 stored;
>> +
>> +	result = ec_read(addr, &stored);
>> +	if (result < 0)
>> +		return result;
>> +
>> +	stored ^= (-(u8) value ^ stored) & (1 << bit);
> 
> So first you case bool to u8 and then take negation of that unsigned 
> number? ...My head is already hurting even without all the other logic.
> 
> This has to be rewritten to something that mere mortals can understand 
> which doesn't explore all those odd corners of C spec. :-)
> 
> I didn't try to parse that logic through but I assuming it's the usual 
> construct perhaps this could be simplified with (please be sure to check 
> this throughoutly as I didn't try to understand what the original really 
> does):
> 
> 	bit = 1 << bit;
> 	stored &= ~bit;
> 	stored |= value ? bit : 0;

Right instead of using a bit variable I would suggest
using the BIT(x) macro here:

 	stored &= ~BIT(bit);
 	stored |= value ? BIT(bit) : 0;

Also since you are exposing multiple userspace
entry points into the kernel this function may
race with itself, so I think you need to add
a mutex and lock this while doing the
read-modify-write to avoid 2 read-modify-write
cycles from racing with each other.

Regards,

Hans






> 
>> +
>> +	return ec_write(addr, stored);
>> +}
>> +
>> +static int ec_check_bit(u8 addr, u8 bit, bool *output)
>> +{
>> +	int result;
>> +	u8 stored;
>> +
>> +	result = ec_read(addr, &stored);
>> +	if (result < 0)
>> +		return result;
>> +
>> +	*output = (stored >> bit) & 1;
>> +
>> +	return 0;
>> +}
>> +
>>  static int ec_get_firmware_version(u8 buf[MSI_EC_FW_VERSION_LENGTH + 1])
>>  {
>>  	int result;
>>
> 

