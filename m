Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F336EC77B72
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 10:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjDQKo5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 06:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjDQKo4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 06:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8153459FE
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681728078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yVioH6reqYXkNBcqXGMdOnvI7hBw/T3Pe2Em6Jl/kA8=;
        b=Y/XhLDMJ+7ShmNk0fRwY5taYPHR09roBEYKYMZVqo3J6fnOvM+XA6q9B+GNvaZ4xDHf/xU
        EwPST0d1dF8NSwHX66SCKh04RC8+rvxp8w9KKlDMfwPUUOw2ZtSz+tcTaiV1JhV/718P1g
        JEdX31yBci0KcFaNjmLw8yeAs54isqo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-TMQYeXzdOfmv3RMZt10hNA-1; Mon, 17 Apr 2023 06:19:21 -0400
X-MC-Unique: TMQYeXzdOfmv3RMZt10hNA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a356c74e0so302322466b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 03:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726760; x=1684318760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVioH6reqYXkNBcqXGMdOnvI7hBw/T3Pe2Em6Jl/kA8=;
        b=jZNxMjVFk1fnW6qR1na1OFDYk+BhTpaXw05YnuBQYzfuSxZtfJEzJH4LS7EHI3X2J/
         umbP0MrA4Jxhf/oPoOEhWuiAhqaoMNuOg4NfzwLVAbgUh5k33oidiPR8mctS+v6X8Pqx
         pyWlDelhWWGuQaxZd4ELjyYKPIcqgrCZinvuRPdhR7qhwJx+J9j1EBIRWhNax/3VI9Ag
         HKsvPeXvq4g+rPftZl8FZIgXp2NDphTSnlBoe9gBVmnnhRy3OZBS8ghfSs1fxMoA2ytQ
         CFleWd2flspZaCZn+mNazLTa5ExMdf6Qq60vPxn2ZnFjE8Hn1SGd/F9neEz/dy14O7Dy
         Ihqw==
X-Gm-Message-State: AAQBX9e/isKrZCTXLcsiahQT582ECCNC2vi55bcEAvqlyGu063GWrCpA
        bAbUJtRbJ0k7snzlJacDNkDRMTiSuKPZAwA7GaTb8H7LT8Doi5WD4JYPh8jB5V3fKA2o3R7/YJY
        kLvJKZeYFWUcFY9sHm35/Yr9UXciLw82suw==
X-Received: by 2002:aa7:c403:0:b0:506:8eb1:a266 with SMTP id j3-20020aa7c403000000b005068eb1a266mr6313318edq.33.1681726760045;
        Mon, 17 Apr 2023 03:19:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1Z9gl4TiEW7hbJoOhucFOdrVflwjbt8FRuMTvOCqZE2CTvNgpWXLsXcH9O5QkjfafZ9TE5w==
X-Received: by 2002:aa7:c403:0:b0:506:8eb1:a266 with SMTP id j3-20020aa7c403000000b005068eb1a266mr6313302edq.33.1681726759721;
        Mon, 17 Apr 2023 03:19:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v3-20020aa7d9c3000000b00506943f60adsm2834654eds.90.2023.04.17.03.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:19:19 -0700 (PDT)
Message-ID: <dd07686f-dd03-4efc-3dfe-5b568c6c854d@redhat.com>
Date:   Mon, 17 Apr 2023 12:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller
 access on X380 Yoga
Content-Language: en-US, nl
To:     Daniel Bertalan <dani@danielbertalan.dev>
Cc:     Liav Albani <liavalb@gmail.com>, Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20230414180034.63914-1-dani@danielbertalan.dev>
 <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com>
 <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com>
 <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
 <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/15/23 16:22, Daniel Bertalan wrote:
> Hi,
> 
> On Saturday, April 15th, 2023 at 15:30, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 4/15/23 15:24, Liav Albani wrote:
>>
>>> On 4/15/23 13:12, Hans de Goede wrote:
>>>
>>>> Hi,
>>>>
>>>> On 4/14/23 20:02, Daniel Bertalan wrote:
>>>>
>>>>> On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
>>>>> accessing the Embedded Controller: instead of a method that reads from
>>>>> the EC's memory, `ECRD` is the name of a location in high memory. This
>>>>> meant that trying to call them would fail with the following message:
>>>>>
>>>>> ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
>>>>> ACPI object (RegionField)
>>>>>
>>>>> With this commit, it is now possible to access the EC and read
>>>>> temperature and fan speed information. Note that while writes to the
>>>>> HFSP register do go through (as indicated by subsequent reads showing
>>>>> the new value), the fan does not actually change its speed.
>>>>>
>>>>> Signed-off-by: Daniel Bertalan dani@danielbertalan.dev
>>>>> Interestig, this looks like a pretty clean solution to me.
>>>
>>> Daniel and I have looked in the DSDT ASL code and found a bunch of registers in high physical memory location (which is an ACPI OpRegion),
>>> and one of the registers had a bit called ECRD.
>>> However, there were many other registers that might be interesting as well, the problem is the short names in the ASL code (so we only see abbreviations essentially).
>>>
>>> While I do agree that adding this code is indeed a clean solution, if you (people that are dealing with Thinkpad laptops) know about cleaner way to access the embedded controller, I think it's preferable, because this way Daniel might be able to trigger the fan on that laptop so it will actually spin and will dissipate-out heat from the system, without the relying on the embedded controller to get into some sort of thermal state and then to trigger the fan.
>>
>>
>> Have you tried falling back to the ec_read() and ec_write() helpers
>> exported by the ACPI EC code ?
>>
>> The "first_ec" pointer used by these functions is exported too,
>> so you could try modifying thinkpad_acpi to use ec_read() and
>> ec_write() as fallback when first_ec is set (and the quirk
>> added by this patch triggers).
> 
> This is basically what my patch does. If the ECRD/ECWR method handles
> are NULL, thinkpad_acpi's acpi_ec_{read,write} functions fall back to
> the regular ACPI EC helpers you mentioned.

Ah I did not realize that. Ok that sounds good to me.

I'll go and apply the patch then. To be on the save side I'm going
to only add this to -next, so that it gets some testing before
showing up in stable series. Once 6.4-rc1 is out you can then
send it to stable@vger.kernel.org to get it backported.

> Speaking of which, does anyone know why these private helper functions
> exist in the first place? The code seems to use them interchangeably.
> Even in the fan control code, there are places where the regular EC
> helpers are called directly. Can we get away with always doing that?

I assume that on some older models there is no standard ACPI EC device
in the ACPI tables, so there only ECRD/ECWR work. I guess that code-paths
which directly call ec_read() / ec_write() are only used on newer
models. But this does indeed seem inconsistent.

> Back to the issue at hand, is there someone we could ask if the X380Y
> even supports manual fan control in the first place? My debugging
> efforts are starting to look like a wild goose chase.
> 
> The thermal sensors and fan PWM readings now work, which is better
> than nothing, but it would be good to get to the bottom of this.

Mark Pearson from Lenovo can hopefully help answer this, but I know
that he is quite busy atm. Hopefully Mark will get back to you when
he has some more bandwidth.

Regards,

Hans



>>>>> ---
>>>>> drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
>>>>> 1 file changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>>> index 7191ff2625b1..6fe82f805ea8 100644
>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>> @@ -11699,6 +11699,7 @@ static int __init thinkpad_acpi_module_init(void)
>>>>> {
>>>>> const struct dmi_system_id *dmi_id;
>>>>> int ret, i;
>>>>> + acpi_object_type obj_type;
>>>>>
>>>>> tpacpi_lifecycle = TPACPI_LIFE_INIT;
>>>>>
>>>>> @@ -11724,6 +11725,21 @@ static int __init thinkpad_acpi_module_init(void)
>>>>> TPACPI_ACPIHANDLE_INIT(ecrd);
>>>>> TPACPI_ACPIHANDLE_INIT(ecwr);
>>>>>
>>>>> + /*
>>>>> + * Quirk: in some models (e.g. X380 Yoga), an object named ECRD
>>>>> + * exists, but it is a register, not a method.
>>>>> + */
>>>>> + if (ecrd_handle) {
>>>>> + acpi_get_type(ecrd_handle, &obj_type);
>>>>> + if (obj_type != ACPI_TYPE_METHOD)
>>>>> + ecrd_handle = NULL;
>>>>> + }
>>>>> + if (ecwr_handle) {
>>>>> + acpi_get_type(ecwr_handle, &obj_type);
>>>>> + if (obj_type != ACPI_TYPE_METHOD)
>>>>> + ecwr_handle = NULL;
>>>>> + }
>>>>> +
>>>>> tpacpi_wq = create_singlethread_workqueue(TPACPI_WORKQUEUE_NAME);
>>>>> if (!tpacpi_wq) {
>>>>> thinkpad_acpi_module_exit();
> 

