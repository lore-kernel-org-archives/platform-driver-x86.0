Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5099CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 18:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239796AbhKWSjJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 13:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43047 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239576AbhKWSjI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 13:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637692559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z5k6zTG4KRWbGgN3rihRDKhTPbVU4ZF9XdZlS05EGq0=;
        b=aQAZW5zA6OHiEl7dd6b9+G+ofroVUUWkmAcMse4gfC4U6hPzMPTPkTkM4F6muoPGiXkU9t
        mHbzOZmyDtX4ZcnQg665GhrR/bu4sKs4gdCqvEtj4bD+IWKMlnZIYHvdVAMUfkGQ09DM6f
        Cs3udlyOhuOfsaHPDZ3NJSEh6cerPPQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-1qbh-nCzMoatDTt002OotA-1; Tue, 23 Nov 2021 13:35:58 -0500
X-MC-Unique: 1qbh-nCzMoatDTt002OotA-1
Received: by mail-ed1-f70.google.com with SMTP id l15-20020a056402124f00b003e57269ab87so18637680edw.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Nov 2021 10:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z5k6zTG4KRWbGgN3rihRDKhTPbVU4ZF9XdZlS05EGq0=;
        b=BaHhCqr6rgtr7lWyVBYm3ZYsCFgRcXVMPdVTDJ04pK/vsUlKnUtqdKpaWKhP7AdpI/
         +OaBn4uvxNUfbHMhTv1ZfjXgfW2HafLf6ZbYFXZyyV4h5oj01zcFEoXb78xYZK0Hthyp
         Zk3TB/3bK98xbui7f0M8DbE6C9h43cjz00fN0gX0ZAK9oPaHUJSKgMeektCkIwkNKLXZ
         dSkrvB2r0A+KvUIgJ9G/145hh/idy1V46xiPo+R9M/Pjvjml344gwv+DahVWfXctbBbX
         sCTB+tzYW8EbiA5Bro6C4p9g15anIYwGaq1SzxySV4XBfPrEiAcENelRpg80Le15k48a
         T+Xw==
X-Gm-Message-State: AOAM533anNiDz8APO3d6Zgo9lXqGAIKvFlhTiI7m9K7Y7C3lbtA3eDFc
        xA1/Fd1y75A4Hu4bj7yM1atSaTFc15iErwj/2RjUT/+MCTcXZyr/jKW/H+axkwoj1bmuVva281D
        V1fdNIRDSTa44avHOYtl0O1+xSgAm3/dFjg==
X-Received: by 2002:a50:c446:: with SMTP id w6mr12781961edf.137.1637692557254;
        Tue, 23 Nov 2021 10:35:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUEZ9mmoxlVEliHny2DZXCv4YHhMo0Z9nYbdF9XbP1qCPsXkZcVzsMr3MWrgS3oizeCWcDog==
X-Received: by 2002:a50:c446:: with SMTP id w6mr12781899edf.137.1637692557030;
        Tue, 23 Nov 2021 10:35:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id yd13sm5601817ejb.39.2021.11.23.10.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 10:35:56 -0800 (PST)
Message-ID: <1605be8d-0913-4b52-32e2-8076fff01d30@redhat.com>
Date:   Tue, 23 Nov 2021 19:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/11] ACPI / scan: Create platform device for CLSA0100
 ACPI nodes
Content-Language: en-US
To:     Lucas tanure <tanureal@opensource.cirrus.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Kailang Yang <kailang@realtek.com>,
        Shuming Fan <shumingf@realtek.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc:     Jeremy Szu <jeremy.szu@canonical.com>,
        Hui Wang <hui.wang@canonical.com>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        Cameron Berkenpas <cam@neo-zeon.de>,
        Sami Loone <sami@loone.fi>, Elia Devito <eliadevito@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jack Yu <jack.yu@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        alsa-devel@alsa-project.org, linux-acpi@vger.kernel.org,
        patches@opensource.cirrus.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
 <87af37a2-dc02-2ae0-a621-b82c8601c16c@redhat.com>
 <756f813c-cc3e-7ddf-e5db-cf6c874f907e@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <756f813c-cc3e-7ddf-e5db-cf6c874f907e@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/23/21 18:11, Lucas tanure wrote:
> On 11/23/21 17:05, Hans de Goede wrote:
>> Hi Lucas,
>>
>> On 11/23/21 17:31, Lucas Tanure wrote:
>>> The ACPI device with CLSA0100 is a sound card with multiple
>>> instances of CS35L41.
>>>
>>> We add an ID to the I2C multi instantiate list to enumerate
>>> all I2C slaves correctly.
>>>
>>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>>> ---
>>>   drivers/acpi/scan.c                          | 1 +
>>>   drivers/platform/x86/i2c-multi-instantiate.c | 7 +++++++
>>>   2 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>> index 2c80765670bc..16827a33e93b 100644
>>> --- a/drivers/acpi/scan.c
>>> +++ b/drivers/acpi/scan.c
>>> @@ -1708,6 +1708,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>>>           {"BSG2150", },
>>>           {"INT33FE", },
>>>           {"INT3515", },
>>> +        {"CLSA0100", },
>>>           {}
>>>       };
>>>   diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
>>> index 4956a1df5b90..ed25a0adc656 100644
>>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>>> @@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
>>>       {}
>>>   };
>>>   +static const struct i2c_inst_data clsa0100_data[]  = {
>>> +    { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>> +    { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>
>> This suggests that both amplifiers are using the same GPIO pin as shared
>> IRQ, is that correct ? Can you share an acpidump of the laptop's DSDT tables ?
>>
>> Regards,
>>
>> Hans
>>
> 
> DSDT attached.
> Yes, both amps share the same IRQ gpio.

Thanks, this patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
>>
>>
>>
>>> +    {}
>>> +};
>>> +
>>>   /*
>>>    * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>>>    * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>>> @@ -155,6 +161,7 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>>>       { "BSG1160", (unsigned long)bsg1160_data },
>>>       { "BSG2150", (unsigned long)bsg2150_data },
>>>       { "INT3515", (unsigned long)int3515_data },
>>> +    { "CLSA0100", (unsigned long)clsa0100_data },
>>>       { }
>>>   };
>>>   MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
>>>
>>

