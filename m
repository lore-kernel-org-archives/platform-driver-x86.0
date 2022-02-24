Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C977AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 12:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbiBXMux (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiBXMuv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 07:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 06C231E2FED
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645707021;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UdTthKmnlK1rDmwQpAmTElMf89Qxn2xqPgMJjlpS7T0=;
        b=BNPXxqhMtfgZ78dSd17urS9Wkq+Ckbhj4GPUlH7CNWm+Chb5uAEnbsTcS6kXs6IJbh0sEd
        9+B6gZfLPavkFoB9HqV2hog+RyaRv4gBP67HrS6B+NCCjUL7pSdw6XFuUlEj2Gc7URMjFf
        w2MooE1FifMfWqS493orstv8PhopRdA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-dw0w1b10PBKTYTr7s-TP8g-1; Thu, 24 Feb 2022 07:50:19 -0500
X-MC-Unique: dw0w1b10PBKTYTr7s-TP8g-1
Received: by mail-ej1-f70.google.com with SMTP id sa7-20020a170906eda700b006d1b130d65bso1152403ejb.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 04:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UdTthKmnlK1rDmwQpAmTElMf89Qxn2xqPgMJjlpS7T0=;
        b=MTu4eUFZOt2aA+Bqh+RQ9mvx1A1vNGmu4LzPawbUb0a2tYoFkqraRrpjWcDcCkzSe+
         leEPnKjXD/l/NOkI/aNNasjTsJ2TFibktP2Dx9n4jbkn9FRtHF2sT8Zpkuc1QGNW00PA
         ZmkDLXGz86IEjQ26HUiwFdFCJKTZzJSPL2lTMsOcVSCyRe6gI/cozVOil/UX1vQ3uw+T
         TE+bU4NJf7keiqOsMfLB20JmHtCobYXBtPC88cyl/V2m6XO0z4m0nJb5gmTJ11qNCMTM
         HBLPB1DsHz5cNnccXwDKf5uM6vAPg7M8+Aj/2fHP83s0SXqwDvJEVEwv0w5SPATWbzsx
         bcwA==
X-Gm-Message-State: AOAM532zZmi5voM/uBpmT7fn6mvVX71bWqp5IqKc1sQJSwUSFEI7gnRr
        aqET8gb154Yl5wXB9fvmZxEt91AS62U0r3lbHcu67N4g5rOkKo3dZC3NaTRKH75eyt5p6w9ljkZ
        y9Mfl+Px73pfDkxJrMVzGNWOXWwz5FC3ARA==
X-Received: by 2002:a17:906:858e:b0:6cf:d198:37a1 with SMTP id v14-20020a170906858e00b006cfd19837a1mr2005472ejx.545.1645707018683;
        Thu, 24 Feb 2022 04:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykk2WOpHooRoGjrpiMSdDsBIllHAKmVcWBWHg+nq7M0XXeJUnRVsYIpGE3bdYJKP/BW2q98g==
X-Received: by 2002:a17:906:858e:b0:6cf:d198:37a1 with SMTP id v14-20020a170906858e00b006cfd19837a1mr2005464ejx.545.1645707018469;
        Thu, 24 Feb 2022 04:50:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id j1sm1285623ejx.123.2022.02.24.04.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 04:50:18 -0800 (PST)
Message-ID: <5dec7bba-4672-4e03-c8fd-a0e895dd12cb@redhat.com>
Date:   Thu, 24 Feb 2022 13:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220224101848.7219-1-hdegoede@redhat.com>
 <10442635-6629-cfd1-1c09-e4388a194bec@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <10442635-6629-cfd1-1c09-e4388a194bec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/24/22 13:35, Maximilian Luz wrote:
> On 2/24/22 11:18, Hans de Goede wrote:
>> The battery on the 2nd hand Surface 3 which I recently bought appears to
>> not have a serial no programmed in. This results in any I2C reads from
>> the registers containing the serial no failing with an I2C NACK.
>>
>> This was causing mshw0011_bix() to fail causing the battery readings to
>> not work at all.
>>
>> Ignore EREMOTEIO (I2C NACK) errors when retrieving the serial no and
>> continue with an empty serial no to fix this.
>>
>> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks for fixing this! This has been bugging us over at
> https://github.com/linux-surface/linux-surface/issues/608.
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you, I have merged this into the pdx86/review-hans and /fixes
branches now. I've also added a buglink to the commit message.

I'll also take a look at some of the other bugs from:

https://github.com/linux-surface/linux-surface/labels/D%3A%20Surface%203

when I can make some time for this.

Regards,

Hans


> 
>> ---
>>   drivers/platform/surface/surface3_power.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
>> index abac3eec565e..b283bc9bb5fd 100644
>> --- a/drivers/platform/surface/surface3_power.c
>> +++ b/drivers/platform/surface/surface3_power.c
>> @@ -232,14 +232,21 @@ static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
>>       }
>>       bix->last_full_charg_capacity = ret;
>>   -    /* get serial number */
>> +    /*
>> +     * get serial number, on some devices (with unofficial replacement
>> +     * battery?) reading any of the serial no range addresses gets nacked
>> +     * in this case just leave the serial no empty.
>> +     */
>>       ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
>>                           sizeof(buf), buf);
>> -    if (ret != sizeof(buf)) {
>> +    if (ret == -EREMOTEIO) {
>> +        /* no serial number available */
>> +    } else if (ret != sizeof(buf)) {
>>           dev_err(&client->dev, "Error reading serial no: %d\n", ret);
>>           return ret;
>> +    } else {
>> +        snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>>       }
>> -    snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>>         /* get cycle count */
>>       ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
> 

