Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4F1C7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjC0N03 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbjC0N0P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC9B3591
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679923441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w39bnXJeVyzgDP57+ppZRKn38B8WFtfby6VdNZ4p/SU=;
        b=MPh0xI7dCXL3VWyGJchVqEqjzxiHMviDzhJQYCoOvBICRwNL6OPpQMexj3ehQEtRk7h7AD
        zsvGwwUOSWSkkD8xgJbwrTuBmibXswhgMl1sxVKPlsLS41MsmONfq65oZZ9FshXJKsnR7C
        ZAbX/bC7iUzUMFpw5QBro1jDJN6z9ag=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-Tqlfif2ZNum8n8RAp9bgqA-1; Mon, 27 Mar 2023 09:24:00 -0400
X-MC-Unique: Tqlfif2ZNum8n8RAp9bgqA-1
Received: by mail-ed1-f71.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso12840098edh.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w39bnXJeVyzgDP57+ppZRKn38B8WFtfby6VdNZ4p/SU=;
        b=r812416wjxN0aKr1jLFiYFJBwJCWXRjQbcOyx4hN439XLKP2quZ5GXzp9hWUHeXmW5
         58k2v6qAaYTUa+Pbx9yaebyTxBtQ9lee0QJEkuF6wRa5GYGYTIzolHiQd2GQWvpAbNh/
         Zt9IcTpSv5pMJGs8aiAOhvDy6qLK/RpLdmAFLSiper9Ih1BICxwqxn3kq7EA2mD709lo
         wTMpsq0am+55PKDvZAwjYhHWedBK2yTu0ZF4FjZAQjKemZX+zukgaSNUw3BksFr9ZBQf
         UvtZTnpq4e7yc6YG0oqKc/ej0JhGCCOC+qY7YHhQ8R1TnbxoDzOCz1g3YdRkoLTBBrrk
         Jxug==
X-Gm-Message-State: AAQBX9d59SBlttbgZMZr6QI24ydCappn4+5CxOHBKN03y/MP77+iFHzS
        RV5YaMllWfeCqdrO1tWcBZpUiYVbo2JJKWZxzk7YdUHNoeCxu/F1/O0EqG2hJMIoycuINPv04r9
        N2jAabdB6S6/BwSBlgtmEDYA0TvlR0i+xYgzIdY1q8A==
X-Received: by 2002:a17:907:7e8e:b0:932:dae5:2af9 with SMTP id qb14-20020a1709077e8e00b00932dae52af9mr15881175ejc.51.1679923439084;
        Mon, 27 Mar 2023 06:23:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bY8EpS/V4Wu36JRPz4lkwJeJjd0bAQVkVT6lprL+6TUgwZyQF9OHIhQnrVtxzXRcoZizhs0w==
X-Received: by 2002:a17:907:7e8e:b0:932:dae5:2af9 with SMTP id qb14-20020a1709077e8e00b00932dae52af9mr15881139ejc.51.1679923438782;
        Mon, 27 Mar 2023 06:23:58 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906454900b008f89953b761sm14080825ejq.3.2023.03.27.06.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:23:57 -0700 (PDT)
Message-ID: <bb42e715-464d-ec9e-beda-3f420980e169@redhat.com>
Date:   Mon, 27 Mar 2023 15:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/8] leds: tps68470: Support the WLED driver
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        lee@kernel.org, markgross@kernel.org, sboyd@kernel.org,
        hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-7-dan.scally@ideasonboard.com>
 <ZBw2ai0G0XCa1vky@duo.ucw.cz>
 <85997479-374b-f130-29dc-e713000d4348@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <85997479-374b-f130-29dc-e713000d4348@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/23/23 17:25, Dan Scally wrote:
> Hi Pavel, thanks for taking a look
> 
> On 23/03/2023 11:22, Pavel Machek wrote:
>> On Wed 2023-03-22 16:09:24, Daniel Scally wrote:
>>> The TPS68470 PMIC provides a third LED driver in addition to the two
>>> indicator LEDs. Add support for the WLED. To ensure the LED is active
>>> for as long as the kernel instructs it to be we need to re-trigger it
>>> periodically to avoid the IC's internal timeouts.
>> Wow. No!
>>
>> If hardware does not wart you to burn the LED, it is not okay to just
>> work around that. These are not designed for continuous operation.
>>
>>> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
>>> index 44df175d25de..abcd3494b1a8 100644
>> Fun sha1 hash ;-).
> 
> 
> heh yeh
> 
>>
>>> @@ -52,11 +61,33 @@ enum ctrlb_current {
>>>       CTRLB_16MA    = 3,
>>>   };
>>>   +/*
>>> + * The WLED can operate in different modes, including a Flash and Torch mode. In
>>> + * each mode there's a timeout which ranges from a matter of milliseconds to up
>>> + * to 13 seconds. We don't want that timeout to apply though because the LED
>>> + * should be lit until we say that it should no longer be lit, re-trigger the
>>> + * LED periodically to keep it alive.
>>> + */
>> We don't want the LED to overheat. That takes precedence.
>>
>> Find out what are the maximum limits for on time at various current
>> levels. LED framework should be used for torch mode, with current set
>> such that unlimited operation is safe. V4L2 should be used for flash
>> mode.
> 
> 
> I did it this way because this is how the IC operates on my device whilst it's booted to Windows...but I suppose given they don't expose the LED outside of their Hello auth thing they can guarantee it's not being lit for too long - I confess that hadn't occurred to me. Anyway; I'll update this to re-trigger if the IC is in torch mode within the timeout (which the datasheet explicitly says you can do in torch mode; the current is much more heavily limited in that mode) and in the flash mode to update the brightness setting to 0 once the timeout expires so it reflects the actual state of the LED. Does that sound ok?

That sounds reasonable to me.

Regards,

Hans

