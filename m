Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABC0ECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  3 Sep 2022 11:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiICLMi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 3 Sep 2022 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiICLMh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Sep 2022 07:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA086BD74
        for <platform-driver-x86@vger.kernel.org>; Sat,  3 Sep 2022 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662203555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5IrOfp9puY1TEMIMWVabBtxJr8/+Tn4f9nR5sBX7gVk=;
        b=V5r/XmkhUeSAIaTQ0wMkLUJU7nQ3HmPW3t1RsychYFuKq90ye/BQ9X3KwGCIFspszQPEI4
        lTyBtOHf2E7EOKsf7GudzAVUlUZp9Ux55+zYNWrZeVx1X6VuIhVecvfF92X2f0k1820yIM
        imbSPMBX8KeQKy9DVo0uTkCnON2b83U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-Z2yoFdOsNYWDGbgo4UxrdQ-1; Sat, 03 Sep 2022 07:12:34 -0400
X-MC-Unique: Z2yoFdOsNYWDGbgo4UxrdQ-1
Received: by mail-ed1-f69.google.com with SMTP id w19-20020a05640234d300b004482dd03feeso2963454edc.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Sep 2022 04:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5IrOfp9puY1TEMIMWVabBtxJr8/+Tn4f9nR5sBX7gVk=;
        b=A1LpQw8YDzmAXFjLXHOwmsebG3ok4s2oYbhfRoCNLQCgZkzZgz9qYxbnv3mf3pwtQ8
         WanrJCKhCw3jeBQ1M68T4beBChtw4LCJmSEjzBPvHlzb139vBJmvp7rPYUXOvRswl0of
         1RQqqR25uJkdW1YvOmKrmSi4KZkNEduG7equ7RIRqJ09yCnTMKSrBCDXYoR7VwoIl/hO
         vMSAeG2a6K3c3/vWr0nCeXbAPLAwFLrksTNHLYbIDKQHvPByauzf8UxpMv+YeGruCVYe
         4Fpc+yrsUtPNiSe/iBbSrc3JmcgvgNOcilzr23/44RE6/O/B8iiP0mUlzNZYJLpwFFot
         vsYQ==
X-Gm-Message-State: ACgBeo11QOXVIDrayuCj8G1wrDZ7GoxFPjWDWgCdrQECi3m5XmhYOl3U
        1A4a3Bftc46RhhpS12FFmP3aqzUwNMJa1gghLyi0oL+fV/So7QSH6ivRr2HSt5ap0WZiJuUml6Q
        eVnpAnHFpYnHBO6q+4zSpHUFe4A8Y0obFzA==
X-Received: by 2002:a17:907:74e:b0:74f:83d4:cf58 with SMTP id xc14-20020a170907074e00b0074f83d4cf58mr5338320ejb.178.1662203552843;
        Sat, 03 Sep 2022 04:12:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6zDs4lYW9Hm1WbO9PCWqUvNoagEH3Orok7R1GTo5J0ZffsXhhHyi2wrtS4MHcdhAMjyftl/w==
X-Received: by 2002:a17:907:74e:b0:74f:83d4:cf58 with SMTP id xc14-20020a170907074e00b0074f83d4cf58mr5338312ejb.178.1662203552662;
        Sat, 03 Sep 2022 04:12:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7d48d000000b00445d760fc69sm3121347edr.50.2022.09.03.04.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 04:12:32 -0700 (PDT)
Message-ID: <0033b40f-f583-c3a4-ce87-73cbb362537b@redhat.com>
Date:   Sat, 3 Sep 2022 13:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] platform/x86: wmi: Allow duplicate GUIDs for drivers
 that use struct wmi_driver
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220829201500.6341-1-mario.limonciello@amd.com>
 <CAHp75Vc3v4a6=ZJnOYYFGHEomExxopuUy8axDL=M2tbxHqtXqQ@mail.gmail.com>
 <MN0PR12MB6101441AA29CE815DCAD26AEE27B9@MN0PR12MB6101.namprd12.prod.outlook.com>
 <3df6405a-924a-b0e6-c879-05b9151011e3@redhat.com>
 <168cb996-513e-77a8-b895-ef0fdd0c1793@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <168cb996-513e-77a8-b895-ef0fdd0c1793@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/2/22 14:19, Mario Limonciello wrote:
> On 9/2/22 03:07, Hans de Goede wrote:
>> Hi,
>>
>> On 9/1/22 23:39, Limonciello, Mario wrote:
>>> [Public]
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>> Sent: Thursday, September 1, 2022 12:17
>>>> To: Limonciello, Mario <Mario.Limonciello@amd.com>
>>>> Cc: Hans de Goede <hdegoede@redhat.com>; Mark Gross
>>>> <markgross@kernel.org>; Platform Driver <platform-driver-
>>>> x86@vger.kernel.org>; Linux Kernel Mailing List <linux-
>>>> kernel@vger.kernel.org>
>>>> Subject: Re: [PATCH v2] platform/x86: wmi: Allow duplicate GUIDs for drivers
>>>> that use struct wmi_driver
>>>>
>>>> On Mon, Aug 29, 2022 at 11:20 PM Mario Limonciello
>>>> <mario.limonciello@amd.com> wrote:
>>>>>
>>>>> The WMI subsystem in the kernel currently tracks WMI devices by
>>>>> a GUID string not by ACPI device.  The GUID used by the `wmi-bmof`
>>>>> module however is available from many devices on nearly every machine.
>>>>>
>>>>> This originally was though to be a bug, but as it happens on most
>>>>
>>>> thought
>>>>
>>>>> machines it is a design mistake.  It has been fixed by tying an ACPI
>>>>> device to the driver with struct wmi_driver. So drivers that have
>>>>> moved over to struct wmi_driver can actually support multiple
>>>>> instantiations of a GUID without any problem.
>>>>>
>>>>> Add an allow list into wmi.c for GUIDs that the drivers that are known
>>>>> to use struct wmi_driver.  The list is populated with `wmi-bmof` right
>>>>> now. The additional instances of that in sysfs with be suffixed with -%d
>>>>
>>>> ...
>>>>
>>>>> +/* allow duplicate GUIDs as these device drivers use struct wmi_driver */
>>>>> +static const char * const allow_duplicates[] = {
>>>>> +       "05901221-D566-11D1-B2F0-00A0C9062910", /* wmi-bmof */
>>>>> +       NULL,
>>>>
>>>> No comma for the terminator.
>>>>
>>>>> +};
>>>>
>>>> ...
>>>>
>>>>> +static int guid_count(const guid_t *guid)
>>>>> +{
>>>>> +       struct wmi_block *wblock;
>>>>> +       int count = 0;
>>>>> +
>>>>> +       list_for_each_entry(wblock, &wmi_block_list, list) {
>>>>> +               if (guid_equal(&wblock->gblock.guid, guid))
>>>>> +                       count++;
>>>>> +       }
>>>>> +
>>>>> +       return count;
>>>>> +}
>>>>
>>>> I haven't deeply checked the code, but this kind of approach is
>>>> fragile and proven to be error prone as shown in practice. The
>>>> scenario is (again, not sure if it's possible, need a comment in the
>>>> code if it's not possible) removing an entry from the list in the
>>>> middle and trying to add it again. you will see the duplicate count
>>>> values. That's why in the general case we use IDA or similar
>>>> approaches.
>>>
>>> It shouldn't be possible to add/remove from the list, they're fixed
>>> lists that were parsed from _WDG.
>>>
>>> Hans - since you already took this into your review queue, can you
>>> land fixes for the 3 things Andy pointed out before it goes to -next
>>> or do you want me to do a manual follow up for them?
>>
>> I can do a local fix and squash it into the original commit.
>>
>>> 1) Spelling error in commit message
>>> 2) Remove comma on terminator
>>
>> Ack, will fix.
>>
>>> 3) Add a comment why guid_count is safe (if you agree with me it is)
>>
>> I agree it is safe.
>>
>> Can you suggest some wording for the comment please ?
>>
>> Regards,
>>
>> Hans
>>
> 
> Maybe something like "_WDG is a static list that is only parsed at startup, it's safe to count entries without extra protection".

Ok, that works for me. I've added that as a comment as
well as squashed in the other 2 suggestions by Andy.

Regards,

Hans

