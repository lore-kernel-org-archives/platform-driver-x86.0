Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19A3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 10:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbiBXK5k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 05:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbiBXK5h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 05:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9097A41BC
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645700222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hW3TA6djQsb2cqUND0WE9P/OTpeJFE24kabC4SPEwrQ=;
        b=EGtOmN/C+JdCOIcHMx88UJWk2V6QoPoI+y6e1AvrrsrGBrbXS0nuoJNrNxU+YtGDlPTWAG
        tOXZ/+7tTz1mEodpB6sVbpjEiFSmG7NyK5HHIBmZ3iUk5+B7Fy+tmSHQbHT5F6wI32YVTM
        21mB65/nfA1IdZ9XO74e+LObrErHK94=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-ioMeDT4gM0KQ2Os8BzJNTA-1; Thu, 24 Feb 2022 05:57:00 -0500
X-MC-Unique: ioMeDT4gM0KQ2Os8BzJNTA-1
Received: by mail-ed1-f72.google.com with SMTP id n7-20020a05640205c700b0040b7be76147so569224edx.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hW3TA6djQsb2cqUND0WE9P/OTpeJFE24kabC4SPEwrQ=;
        b=c1CQ8cxZdIp0vq6on8/PLwkL0G34OB7moYh616kLdAy4Gc10GwJC5rZvDpq7DHvHbA
         I5sBrf2wV+JCQ1HgWO8wZsQ73oUcOcIx0HL33M0Oo43LuEQKgb8RT1f8b/YHTfghPkrL
         OB35v31FY6ePFQ3q81fzYsPu77sCFRYBGYB1hBt/N27DT3M/SAJClgbu5BIosBB2Vs53
         cGY9dlexilkQfElVOHSCDLY6mfasKpjqOd3rdoc592hAawOjYtj8zHUoIVevcKd2Ri92
         HP2qL5wZSmhvrqOBikz4u55eIGQmQdIeRVJhEpYlenG10J9Ryi4ahXLfJ+29KEnnXfHR
         tyZQ==
X-Gm-Message-State: AOAM531DEif0m3VdNySH4Q9wuXpow2WjWuWra/ouosoXzH/Sj8H6uviq
        G2vi19UA9knK5vohwkpFWmh69yj6q+xUzSPrigk46kl80tcLBXYQr3DwLtNSAM1X/J2BHr0lSui
        uRez6qm79pcg71b1h+lJdt78CQm86T4dEhw==
X-Received: by 2002:a05:6402:1d8d:b0:408:4a31:9790 with SMTP id dk13-20020a0564021d8d00b004084a319790mr1758948edb.92.1645700219674;
        Thu, 24 Feb 2022 02:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/qJHJct3E3mt0u8HJsgqEbxvjR9WPRHBM36OqSnuEU/GihFRSYi4bv3CLAsuVRR6fvG9bBg==
X-Received: by 2002:a05:6402:1d8d:b0:408:4a31:9790 with SMTP id dk13-20020a0564021d8d00b004084a319790mr1758929edb.92.1645700219435;
        Thu, 24 Feb 2022 02:56:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c5sm1163479edk.43.2022.02.24.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 02:56:58 -0800 (PST)
Message-ID: <989a9909-53ac-f7c2-9b7c-4525a2b73df3@redhat.com>
Date:   Thu, 24 Feb 2022 11:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220224101848.7219-1-hdegoede@redhat.com>
 <CAHp75VcsRd=cMK_cS0zcJTsqsi9sqiBnKH7d8c=25SjbgRvzVw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcsRd=cMK_cS0zcJTsqsi9sqiBnKH7d8c=25SjbgRvzVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/24/22 11:55, Andy Shevchenko wrote:
> On Thu, Feb 24, 2022 at 12:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The battery on the 2nd hand Surface 3 which I recently bought appears to
>> not have a serial no programmed in. This results in any I2C reads from
>> the registers containing the serial no failing with an I2C NACK.
>>
>> This was causing mshw0011_bix() to fail causing the battery readings to
>> not work at all.
>>
>> Ignore EREMOTEIO (I2C NACK) errors when retrieving the serial no and
>> continue with an empty serial no to fix this.
> 
> Maybe in all cases
> 
> serial no --> Serial Number
> 
> ? This "no" requires to re-read again.

Ack, will fix before merging.

>> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/surface/surface3_power.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
>> index abac3eec565e..b283bc9bb5fd 100644
>> --- a/drivers/platform/surface/surface3_power.c
>> +++ b/drivers/platform/surface/surface3_power.c
>> @@ -232,14 +232,21 @@ static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
>>         }
>>         bix->last_full_charg_capacity = ret;
>>
>> -       /* get serial number */
>> +       /*
>> +        * get serial number, on some devices (with unofficial replacement
> 
> Get

Ack.

> 
>> +        * battery?) reading any of the serial no range addresses gets nacked
>> +        * in this case just leave the serial no empty.
>> +        */
>>         ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
>>                                             sizeof(buf), buf);
>> -       if (ret != sizeof(buf)) {
>> +       if (ret == -EREMOTEIO) {
>> +               /* no serial number available */
>> +       } else if (ret != sizeof(buf)) {
>>                 dev_err(&client->dev, "Error reading serial no: %d\n", ret);
>>                 return ret;
>> +       } else {
>> +               snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>>         }
>> -       snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>>
>>         /* get cycle count */
>>         ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
>> --
>> 2.35.1
>>
> 
> 

Regards,

Hans

