Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54740C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 18:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BA7460D07
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 18:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhJUShe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25753 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230020AbhJUShe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Oct 2021 14:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634841317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VY72/zioLwo229ucDRByi7Sny6imLoIUOLa3TsKm+Pw=;
        b=QwRq2bKBKB7aOf1iTsuYoKgdlBYn4xetYNrDT2hhhhs5nT/I+YSqqRyq5CPmM3sFaK8/13
        uzkaTgMIeanTa2EhJ6GblGY7W7kwCycVam1zpujVxVrPTb48P+iystoTm/llBH+JsxqjwB
        7oYFppC9zJ/E1CzYwW22pajtZooPyQo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-mrHnMn0cNZC2Fy9h61gYPw-1; Thu, 21 Oct 2021 14:35:16 -0400
X-MC-Unique: mrHnMn0cNZC2Fy9h61gYPw-1
Received: by mail-ed1-f72.google.com with SMTP id z1-20020a05640235c100b003dcf0fbfbd8so1280965edc.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2021 11:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VY72/zioLwo229ucDRByi7Sny6imLoIUOLa3TsKm+Pw=;
        b=H/Wd+w7XWKzBzVVcpO4IUQTlhNSwBH7UPXdDBGvA6KQmCNi2lfJuGQfEsCnGEVhL/8
         L/iwSDKvg23hIklxWJGJVmM19j6l76kmO8TwCEBWxsWO7H93JKp2wNmHF1sYYQrPS3Fa
         g2jPRaIwPZd37FJwaPvhJfD0lyIwDo6v1NqQwQFUnkEaV1tzDFnxj273GSl8PBjn6dXl
         hPTi6hmdTvqIk1eXOTo7bFed3mArnTEAjjlPyOJecDAX+EkkdCgOYdwOz5qgRfMLzOkT
         hqiWhFlhHpj3I9BOMydUGgUfg91f5aDdbHmCiQQPMyypxCSBV7Vng7ZAW99O6AqS8sZp
         boQA==
X-Gm-Message-State: AOAM532SL54C5J6a+OIgh5lOO5iPp6tWm4hfwt8pKPjLCXI+9idMUzNi
        5vrGoapPBA+vwCE4txTnJGOFVkwRIYw3mknHKw4bbvV1nwrQJtmdcaqTobA/PLh3MiwdkTHqgQr
        3xwd9RyVsg+ykrhAyvIKGOMG1x6OH4dsGuA==
X-Received: by 2002:a50:e14c:: with SMTP id i12mr9742516edl.125.1634841315484;
        Thu, 21 Oct 2021 11:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzus+Pa1uEbNm/1K6ltJX3xyFiA3u/6fmOL9ukx0s2u6oOPvQPdd4IRFySNl65vXUno9weQPA==
X-Received: by 2002:a50:e14c:: with SMTP id i12mr9742493edl.125.1634841315299;
        Thu, 21 Oct 2021 11:35:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w7sm3350748ede.8.2021.10.21.11.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 11:35:14 -0700 (PDT)
Message-ID: <ad6f6136-2d1c-0370-e9c8-2b28f30f73fa@redhat.com>
Date:   Thu, 21 Oct 2021 20:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: wmi: change notification handler type
Content-Language: en-US
To:     Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20211015191322.73388-1-nikolay.romanovich.00@gmail.com>
 <2deb56e0-24a6-6615-d95e-e0efb7f86db2@redhat.com>
 <YXGild+Pr90PMBe2@mikalai-laptop>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YXGild+Pr90PMBe2@mikalai-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/21/21 19:25, Mikalai Ramanovich wrote:
> Hi, 
> thank you for your reply.
> 
> On Tue, Oct 19, 2021 at 05:11:51PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/15/21 21:13, Mikalai Ramanovich wrote:
>>> Since AML code on some Xiaomi laptops notifies the WMI hotkey with
>>> 0x20 event, we need ACPI_ALL_NOTIFY here to be able to handle it.
>>>
>>> Signed-off-by: Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
>>
>> Hmm, this is a rather unusual change and I'm worried that it may have
>> some bad side-effects.
> 
> I think it can't lead to bad side effects: this driver ignores events 
> which are not described in the _WDG section (doesn't have GUID assiciated).
> 
> But if it's described it should be handled by this driver even if it
> is less than 0x80. But this driver handles only 0x80-0xFF events.

Ah right, I forgot about the notify_id check in acpi_wmi_notify_handler(),
so since we have that check this should indeed not lead to wmi drivers
getting new unexpected events.

So I've now applied this patch as is:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> 
>> Can you provide the model-number and an acpidump for the laptop where
>> you need this ? And maybe also point out which bit (which lines after
>> disassembling) of the DSDT needs this ?
> 
> It's Xiaomi Mi Notebook Pro 14 2021. (TIMI A34 by DMI).
> 
> Here is a dump of interesting files: 
> https://gist.github.com/MikalaiR/eee783cc0b1efdbe2aab158653e84935
> (sorry for the link, i don't know it's good to attach files here or not).
> 
> The most interesting part is ssdt8.dsl file which contains only one
> WMI device. Method \_SB.PC00.LPCB.EC0.XWEV (in ssdt10.dsl, line 2495) 
> generates events for this device.
> 
> And this is a part of decompiled BMOF from this device:
> 
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), 
>  Description("Root/WMI/HID_EVENT20"), 
>  guid("{46c93e13-ee9b-4262-8488-563bca757fef}")]
> class HID_EVENT20 : WmiEvent {
>   [key, read] string InstanceName;
>   [read] boolean Active;
>   [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
> };
> 
> ACPI event 0x20 associated with GUID 46c93e13-ee9b-4262-8488-563bca757fef.
> 
>> ATM I'm thinking that it might be best to do something like this:
>>
>> static u32 acpi_wmi_get_handler_type(void)
>> {
>> 	if (dmi_name_in_vendors("XIAOMI"))
>> 		return ACPI_ALL_NOTIFY;
>> 	else
>> 		return ACPI_DEVICE_NOTIFY;
>> }
>>
>> 	status = acpi_install_notify_handler(acpi_device->handle,
>> 					     acpi_wmi_get_handler_type(),
>> 					     acpi_wmi_notify_handler,
>> 					     NULL);
>>
>> (and the same for the remove)
>>
>> So that we limit this behavior to the Xiaomi case.
> 
> In general i don't think it's a good idea, but if it's the only 
> acceptable solution, why not.
> 
> 
> Regards, 
> 
> Mikalai
> 

