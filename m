Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9985BC636D4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 19:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbjBJTUS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 14:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbjBJTUS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 14:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC627CCBF
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 11:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676056772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gwSrY4DltmA/yFlYQvFrP0zXeruXNly6+GpVcGdaJm4=;
        b=MytzUYK1MHFOGQODOOdSLgxsWmryjJuDBx13OjEHqYKBED0wdq7IYuxGk9++AaaoFlxZuU
        49TdR53h6OJEQCTGyc5B0U1zOE3/eWVSMrXhblocsDYNcdM5cJI/x07jkVHJaHul75Pymh
        j2hr+YefNzbCrh5XFWut6kVwBojiC8w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-jhTHaQu7OlOvCPgfJLSDDw-1; Fri, 10 Feb 2023 14:19:31 -0500
X-MC-Unique: jhTHaQu7OlOvCPgfJLSDDw-1
Received: by mail-ed1-f71.google.com with SMTP id o21-20020aa7dd55000000b004a245f58006so4189810edw.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 11:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwSrY4DltmA/yFlYQvFrP0zXeruXNly6+GpVcGdaJm4=;
        b=SO/cSEx+OOnweZFxWQkmhTRADHxgk0SMs24/uamwIw1VyUX5M8g7HLDK2+BD4CiQHP
         Y/2XGyy3EXi3n1NcC1UqFjMGehOBkrYU4KDUNfyp29FYDjIQQlsv1Gs5xg/GzKZ48Z/0
         DRGOU+oGbmqWhSJfV/3q/40phBWOQ8cjBD44lH6U821BI4CZjv4LhtSdT2xWP04nXaDP
         nbsx1UesB81OqJ4eLFfiln5XWaqrYoU5Sk+xKQ23LSd6Z1i92qbVqmYoG0+fehjB6+rI
         z8qzGP5hbEVsRh4g9Y0e9iK5fhMfTgvIaGLBydxljetZfAq7wpKE3hdgRFV89e3+uoj1
         g1jg==
X-Gm-Message-State: AO0yUKXapGo5YUHXjvX5UMffNGeJIV50lywbAuhBXqZlSjjQZ75HcGzg
        M40Le5bhHEcDWnGt0a6s3eCjj2upt99fGjF6bONYA/3AzaBHCOxG9hko/IBKu2/wVonyN/V0cZu
        HRnkkw6qiwrIwLMQTT/x+GX6vZunuY3WdlTwwPuk=
X-Received: by 2002:a17:906:308e:b0:88a:da35:dd51 with SMTP id 14-20020a170906308e00b0088ada35dd51mr16539092ejv.14.1676056769342;
        Fri, 10 Feb 2023 11:19:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/LjslSqRW4K+lvECJSA5kEr2lyEGJrPcE6CF5MmtIxPBIdllG3b8htAgAt5ndbUDTe3go1qA==
X-Received: by 2002:a17:906:308e:b0:88a:da35:dd51 with SMTP id 14-20020a170906308e00b0088ada35dd51mr16539083ejv.14.1676056769183;
        Fri, 10 Feb 2023 11:19:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h14-20020a17090634ce00b00877e1bb54b0sm2770373ejb.53.2023.02.10.11.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:19:28 -0800 (PST)
Message-ID: <74e3c9ae-b1f1-1e7b-4af1-56f918471b36@redhat.com>
Date:   Fri, 10 Feb 2023 20:19:27 +0100
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
> 
> Depending on the decoding hw in the chip this may work fine,
> or this may work not at all.
> 
> I realized that you have asked for more testing, but most surviving
> macbooks from the older apple-gmux era appear to be models without
> a discrete GPU (which are often the first thing to break) and thus
> without a gmux.
> 
> Unless we get a bunch of testers to show up, which I doubt. I would
> prefer slightly bigger / less pretty code and not change the functional
> behavior of the driver on these older models.

A quick follow up on this, I just noticed that only the pio_write32
is doing the one byte at a time thing:

static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
{
        return inl(gmux_data->iostart + port);
}

static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
                             u32 val)
{
        int i;
        u8 tmpval;

        for (i = 0; i < 4; i++) {
                tmpval = (val >> (i * 8)) & 0xff;
                outb(tmpval, gmux_data->iostart + port + i);
        }
}

And if you look closely gmux_pio_write32() is not swapping
the order to be32 at all, it is just taking the bytes
in little-endian memory order, starting with the first
(index 0) byte which is the least significant byte of
the value.

On x86 the original code is no different then doing:

static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
                             u32 val)
{
        u8 *data = (u8 *)&val;
        int i;

        for (i = 0; i < 4; i++)
                outb(data[i], gmux_data->iostart + port + i);
}

So yeah this patch is definitely wrong, it actually swaps
the byte order compared to the original code. Which becomes
clear when you look the weird difference between the read32 and
write32 functions after this patch.

Presumably there is a specific reason why gmux_pio_write32()
is not already doing a single outl(..., val) and byte-ordering
is not the reason.

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

