Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758A6C05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 19:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbjBJTeT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 14:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbjBJTeT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 14:34:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD01C7164E
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676057610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lgPGguAIupQ40Gj3yYs0g6D0wN93UBUjTZwAvya27/Q=;
        b=U15vAh0avJ/LQr6db79Q+IxZfcnJ8O/qnBG8XjQd6JpHRQmkOZXWIkHzMQPMDHQq8NmaMN
        NQl05tje4pOr0SuHwRd+rNcMn5aqRKWP2KJUhHAokdyw5EquMY6/MvKk3cKq4hzqOyPJ3n
        6Z/svYc1hATwZ9t9W39oyZC9Ihqca3I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-jze5HaJeOKaSMwRbgHVJ9w-1; Fri, 10 Feb 2023 14:33:29 -0500
X-MC-Unique: jze5HaJeOKaSMwRbgHVJ9w-1
Received: by mail-ej1-f71.google.com with SMTP id ti11-20020a170907c20b00b00886244203fcso4097167ejc.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 11:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgPGguAIupQ40Gj3yYs0g6D0wN93UBUjTZwAvya27/Q=;
        b=zzQ9bBiMif8TBjMrvHKtz1hyWdjzy6oJvHStwGILNnO3Uki8PZRkzX261uLtqm3JeG
         0d0Dz1rZnfq/kjYgzBAoC+xmk4xq86U7p+/VwgIkiZjCUGu4o8kb2x/cZVGoDDHr4Doa
         2HUlKG+3IVdiwyVRzwcXxev/yl2jYwZrOoKAUAPoDHceMeejueWG/6Ft7HqZArLfPhQr
         Fchc7MVBb+owyWgHheHbCRFuf+oQCEBdEr1tFv5INLf3ML0sf7cEeIpcmLQAxI5+hU05
         /L8zKq154b56Ue6r5MT285gZtnYyHlEempVtgzkSDib5A6PK4UYek5OcZrT/uYGzRfkS
         fr+A==
X-Gm-Message-State: AO0yUKW7W3gJVoaOmahMY7lP55y5iN6QKiFIp1DTU3XAtnwuFMtz7BQO
        DCdr1GFThVOwt1PUorwb53FauoEUnwRdrp8nnqdRHGfIV0ICeFLz4WkRJvZBhi4vqiS12PoV+gY
        EJuxcLcuwXR2diU/tlxnRsxw/LWHgegt8/A==
X-Received: by 2002:a50:a45a:0:b0:472:1436:73ab with SMTP id v26-20020a50a45a000000b00472143673abmr17550404edb.28.1676057608631;
        Fri, 10 Feb 2023 11:33:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9lIWI+15QivdoTZK+NEIYP5AV1VIY+nIPcZiME3QwhYRDhgoA8GEIQ9OR9X+Zok/bVlZR+qw==
X-Received: by 2002:a50:a45a:0:b0:472:1436:73ab with SMTP id v26-20020a50a45a000000b00472143673abmr17550370edb.28.1676057608402;
        Fri, 10 Feb 2023 11:33:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b2-20020a50b402000000b004a245d70f17sm2701859edh.54.2023.02.10.11.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:33:27 -0800 (PST)
Message-ID: <990b254c-b55f-539d-d6b5-fa4499078527@redhat.com>
Date:   Fri, 10 Feb 2023 20:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 1/9] apple-gmux: use cpu_to_be32 instead of manual
 reorder
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>,
        platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Gross <markgross@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        YiPeng Chai <YiPeng.Chai@amd.com>,
        Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Bokun Zhang <Bokun.Zhang@amd.com>,
        Jack Xiao <Jack.Xiao@amd.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Rander Wang <rander.wang@intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>, Evan Quan <evan.quan@amd.com>,
        Kerem Karabay <kekrby@gmail.com>,
        Aditya Garg <gargaditya08@live.com>,
        Aun-Ali Zaidi <admin@kodeit.net>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-2-orlandoch.dev@gmail.com>
 <3af65b5e-1f52-79f6-4130-03901ce76d2f@redhat.com>
In-Reply-To: <3af65b5e-1f52-79f6-4130-03901ce76d2f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/10/23 20:09, Hans de Goede wrote:
> Hi,
> 
> On 2/10/23 05:48, Orlando Chamberlain wrote:
>> Currently it manually flips the byte order, but we can instead use
>> cpu_to_be32(val) for this.
>>
>> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
>> ---
>>  drivers/platform/x86/apple-gmux.c | 18 ++----------------
>>  1 file changed, 2 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
>> index 9333f82cfa8a..e8cb084cb81f 100644
>> --- a/drivers/platform/x86/apple-gmux.c
>> +++ b/drivers/platform/x86/apple-gmux.c
>> @@ -94,13 +94,7 @@ static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
>>  static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
>>  			     u32 val)
>>  {
>> -	int i;
>> -	u8 tmpval;
>> -
>> -	for (i = 0; i < 4; i++) {
>> -		tmpval = (val >> (i * 8)) & 0xff;
>> -		outb(tmpval, gmux_data->iostart + port + i);
>> -	}
>> +	outl(cpu_to_be32(val), gmux_data->iostart + port);
>>  }
>>  
>>  static int gmux_index_wait_ready(struct apple_gmux_data *gmux_data)
> 
> The ioport / indexed-ioport accessed apple_gmux-es likely are (part of?)
> LPC bus devices . Looking at the bus level you are now changing 4 io
> accesses with a size of 1 byte, to 1 32 bit io-access.

Correction to myself, re-reading the LPC specification, then
if I'm right and this is a LPC device then all IO in/out accesses
are always 1 byte accesses. Since the LPC bus only supports 16 / 32
bit accesses for DMA cycles.

So presumably the outl() would get split into 4 separate 8 bit
(port) IO accesses.

Regards,

Hans





>> @@ -177,16 +171,8 @@ static u32 gmux_index_read32(struct apple_gmux_data *gmux_data, int port)
>>  static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
>>  			       u32 val)
>>  {
>> -	int i;
>> -	u8 tmpval;
>> -
>>  	mutex_lock(&gmux_data->index_lock);
>> -
>> -	for (i = 0; i < 4; i++) {
>> -		tmpval = (val >> (i * 8)) & 0xff;
>> -		outb(tmpval, gmux_data->iostart + GMUX_PORT_VALUE + i);
>> -	}
>> -
>> +	outl(cpu_to_be32(val), gmux_data->iostart + GMUX_PORT_VALUE);
>>  	gmux_index_wait_ready(gmux_data);
>>  	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
>>  	gmux_index_wait_complete(gmux_data);
> 

