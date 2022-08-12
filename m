Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0F3C00140
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Aug 2022 08:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237523AbiHLIpL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Aug 2022 04:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbiHLIpC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Aug 2022 04:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86BE9A8CCE
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Aug 2022 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660293900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wxoycUTdX5EPODZXQ/28haLXP8FulwP/RdMCFThGP5k=;
        b=At91W78CjkCIbk8AEzJQ2kKrmflI9FuQNtl9qpx6+4oP5oELRvarRdO3oOkI+ZZrErlV3b
        kasOuuF7R1x/wabqrhMY3IyGs8/bTx3Zub8TsGuC25BXoZ+GWLTUCW31g5qnGEs5rqlboG
        g9qf5L4+1hJp+S/g6wBi6fVgldjXI9A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-Hr_hqEzfN7OKn3Ytu9vNiw-1; Fri, 12 Aug 2022 04:44:59 -0400
X-MC-Unique: Hr_hqEzfN7OKn3Ytu9vNiw-1
Received: by mail-ej1-f70.google.com with SMTP id qf23-20020a1709077f1700b007308a195618so189283ejc.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Aug 2022 01:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wxoycUTdX5EPODZXQ/28haLXP8FulwP/RdMCFThGP5k=;
        b=5+cpsF5vWKXj9TPW8X0Slg7zS1uLqXfZ21vm2Sel8RawdSfzm/O7KyNsXsdqpLRWoX
         XdhPW7R+afXGXi5jG/zrNrCMslgbcvemJetYjKIT7iyRWMosnCaSIYN/y5yhNO7u8cDj
         f+2JMEH21plrBRmSpiRyLg4WcW+WVUjViUiyOX3BluNq4+09aTRURgE37vhu2UheEXIf
         5MKPzIqH7nPbytTVLi/u57QOqpX8Vx+RuuZQiHiv1ODCHqYU9TdfWGdc8SIpdAguVNx5
         USf3lYa+IhrdDbl39Wap5WjlzkheRV4fNMMfiOV5yG1cYw2lksvOwI7xFkXtc80VZTT0
         Xk5A==
X-Gm-Message-State: ACgBeo2w7G8IwWGRD21rSls69wWrRFLoxtUnzrItkFbpxTGe0LkhZWQY
        fVUezir44FVFInwQ/zVmnZUKtJmVimxiQrVzD9wf1Rw42leVcQraU9tlfm83teMn7QipW3J7Eqw
        /ALjfZYMHmlrWtOekC6T0UdV0in031ZbdSQ==
X-Received: by 2002:a05:6402:b1b:b0:442:8cee:177d with SMTP id bm27-20020a0564020b1b00b004428cee177dmr2605044edb.318.1660293897724;
        Fri, 12 Aug 2022 01:44:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4faCKb3OVGqQbsXrDmbmSTRFWZL9S/wtfh7PDkDMvgkKLZysKH6klOEkjyTQwgLnIp49JfNA==
X-Received: by 2002:a05:6402:b1b:b0:442:8cee:177d with SMTP id bm27-20020a0564020b1b00b004428cee177dmr2604927edb.318.1660293895418;
        Fri, 12 Aug 2022 01:44:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709061e8600b006fec4ee28d0sm536426ejj.189.2022.08.12.01.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 01:44:54 -0700 (PDT)
Message-ID: <c3bb0989-78d9-c513-1669-75407b2acbac@redhat.com>
Date:   Fri, 12 Aug 2022 10:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 6/6] asus-wmi: Support the hardware GPU MUX on some
 laptops
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Cc:     Luke Jones <luke@ljones.dev>, andy.shevchenko@gmail.com,
        pobrn@protonmail.com, pavel@ucw.cz,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220809025054.1626339-1-luke@ljones.dev>
 <20220809025054.1626339-7-luke@ljones.dev>
 <7365d41a-1475-118c-96a8-6ab927bda5b7@redhat.com>
 <9ed62983bd03ed26cdb4399dd69b4096e8711fa9.camel@ljones.dev>
 <b287e98a-7880-5979-94a4-38715d448de4@redhat.com>
 <0239b3bb-d9cb-4549-9e9e-006923b61634@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0239b3bb-d9cb-4549-9e9e-006923b61634@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/12/22 10:31, Thomas Weißschuh wrote:
> Hi,
> 
> On 2022-08-12 09:59+0200, Hans de Goede wrote:
>> Date: Fri, 12 Aug 2022 09:59:29 +0200
>> From: Hans de Goede <hdegoede@redhat.com>
>> To: Luke Jones <luke@ljones.dev>
>> Cc: andy.shevchenko@gmail.com, pobrn@protonmail.com, pavel@ucw.cz,
>>  platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v3 6/6] asus-wmi: Support the hardware GPU MUX on some
>>  laptops
>> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
>>  Thunderbird/91.12.0
>>
>> Hi,
>>
>> On 8/12/22 00:01, Luke Jones wrote:
>>> Hi Hans,
>>>
>>> On Thu, 2022-08-11 at 15:53 +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 8/9/22 04:50, Luke D. Jones wrote:
>>>>> Support the hardware GPU MUX switch available on some models. This
>>>>> switch can toggle the MUX between:
>>>>>
>>>>> - 0, Dedicated mode
>>>>> - 1, Optimus mode
>>>>>
>>>>> Optimus mode is the regular iGPU + dGPU available, while dedicated
>>>>> mode switches the system to have only the dGPU available.
>>>>>
>>>>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>>>
>>>> I see that you have replied to this that it needs more work.
>>>>
>>>> Besides it needing more work, ideally this should hook into
>>>> the existing vga-switcheroo mechanism for this. Can you take
>>>> a look at that please?
>>>>
>>>> I think this might be the first non GPU driver doing vga-
>>>> switcheroo stuff. So this may be something to discuss
>>>> on the dri-devel list.
>>>
>>> I'm not sure how this would work. In typical ASUS fashion they do non-
>>> standard stuff. This switch is a basic toggle that requires a reboot to
>>> enable after writing to the ACPI method, after reboot the dGPU becomes
>>> the only visible GPU on the system and (this GPU) can not be suspended.
>>>
>>> In short: it toggles the laptop from discrete-only mode, and optimus
>>> mode, requiring a reboot to switch.
>>>
>>> From what I understand of switcheroo it is more to manage having dual
>>> (or more) GPU available during runtime, and manage the power states,
>>> offload etc.
>>
>> Right, I did not realize this requires a reboot, that would be
>> something to mention in the Documentation bits accompanying the patch.
>>
>> This is also a reason why it is good to have the docs update in
>> the same patch as adding the functionality, because the docs may
>> help with reviewing.
>>
>> Anyways I agree that if this requires a reboot then using
>> the vga switcheroo stuff is not applicable. So we can just go with
>> a simple(ish) asus-wmi sysfs attribute.
> 
> Would this not fit the existing "firmware-attributes" class?
> It even has a flag to signal that a reboot is required after an attribute has
> been changed.

Yes it sounds like a BIOS setting is being toggled from within
Linux, which would normally be done through the
"firmware-attributes" class, but all existing "firmware-attributes"
class drivers allow changing all BIOS setting not just a single
setting, so using the  "firmware-attributes" class here is not really
appropriate.

> Maybe it is overkill to use it only for this, though.

Right :)

Regards,

Hans


>>> I have a vastly improved patch for this prepared now. Because of how
>>> the actual feature works (and the above explanation) it must be under
>>> the asus-nb-wmi sysfs (next to the dgpu_disable and egpu_enable toggles
>>> which are also unusual and non-standard work-arounds of Windows
>>> issues).
>>
>> Ack, sounds good.
> 
> Thomas
> 

