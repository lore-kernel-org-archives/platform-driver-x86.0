Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0AAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 10:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbiBXK6X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 05:58:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbiBXK6W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 05:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2852E276D5B
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645700272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9Mkz8zmIHIpbM7LPm4IzuYzEEoKY0EwAI6sUUI/efKk=;
        b=XDf6enQH9dNp3E1CXwaYsRelIutEHGfup5BU+Qx1fQs/wwD/VCnOS7jnqMnbB28U1IeUMU
        E2w2n3thph3Fuq+6YK9xPeNwGfQ2o4W/yuRsfp6R94rsBHR2NnuK5+DsrHX1Bcx6HUxrX7
        19jx44oKXAmTn4URBrPIgNrFWey1qD4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-qKm7_pKPOdysxVLFuHgDRw-1; Thu, 24 Feb 2022 05:57:51 -0500
X-MC-Unique: qKm7_pKPOdysxVLFuHgDRw-1
Received: by mail-ej1-f72.google.com with SMTP id qa30-20020a170907869e00b006cee5e080easo1041114ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9Mkz8zmIHIpbM7LPm4IzuYzEEoKY0EwAI6sUUI/efKk=;
        b=rr0pSJa+upOrtR/HnZ7zdRGIDQXG4o8Zv7xDMxbrD3ToK9kFH8rL0SM4ltvcmxrnyG
         CVapPZ7xk2locnHBJyHvag0iInUiJWuQOZUcG7SghGVijb2v28w/BAJqHkewuI8xiJyl
         TEb/m4XRKRluxZQs5oFc+y8uPJ1XdxtFHbkflGzMAkHqsqlQjt1pckdgAIimSF2LIsW9
         JlKpbEyx+GRikT3E8kZlJacc9nx8NiCYB2nbN0IBXrwYZSK+JLRAJg+iin0RQL37eUk8
         kwYPv3zPv7PkxcT1cTvao5EmS874/z45r4wNpM2dmwLp5vGAqz9foEjrYyGqURJeO9Kn
         2UpQ==
X-Gm-Message-State: AOAM533APBMwEYFkboSGUwr3bMxfRqm+lPC9chZ+UjinYLDGDYUXgQA3
        RYvEdzokuo35w1GrsVnpkMVbVWIadCuruM1rdVULbFQGWts5ImCX1F56w/+QBghQLId0tiFrVlB
        oo6lQIVyO1T/vQ0j2Nh8LBdquiIhzv53jBw==
X-Received: by 2002:a05:6402:148d:b0:410:b099:86f1 with SMTP id e13-20020a056402148d00b00410b09986f1mr1774756edv.273.1645700269845;
        Thu, 24 Feb 2022 02:57:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya7K2xOEPP5d02ks7z9A4o95LmY4aHPDMvgsVWPHTIINnzEc0UtuUyGo/iSHm7ZEKp+M/neQ==
X-Received: by 2002:a05:6402:148d:b0:410:b099:86f1 with SMTP id e13-20020a056402148d00b00410b09986f1mr1774740edv.273.1645700269651;
        Thu, 24 Feb 2022 02:57:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b3sm1170925ejl.67.2022.02.24.02.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 02:57:49 -0800 (PST)
Message-ID: <a6968627-687c-9627-acdb-bc2ff4841b76@redhat.com>
Date:   Thu, 24 Feb 2022 11:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220224101848.7219-1-hdegoede@redhat.com>
 <CAO-hwJ+MAjqnBXOWruEoEduxMwoTkJtDFoBc9FRsmZoG+WZfiQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAO-hwJ+MAjqnBXOWruEoEduxMwoTkJtDFoBc9FRsmZoG+WZfiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/24/22 11:55, Benjamin Tissoires wrote:
> On Thu, Feb 24, 2022 at 11:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
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
>>
>> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> LGTM, (and scratching this off my list):

Ah, so I guess this was already a known issue also hit by others ?

Do you have a buglink which I can add to the commit message ?


> Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks.

Regards,

Hans


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

