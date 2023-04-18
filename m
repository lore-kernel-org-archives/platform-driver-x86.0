Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3998C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Apr 2023 13:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjDRNYH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Apr 2023 09:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjDRNYA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Apr 2023 09:24:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4194113849
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Apr 2023 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681824193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jtc3nZAFND4an9RKQCf6WUjcLwPZiFyLQ4c7U5Vc9Ig=;
        b=jC0dPdbFuKQr4GFSLY5ySexpzitg7f7btC9tHSUVOAnmxWvHoHZP6enz+L1nrGA353y6nG
        MdKPm2fceo4ZrXioyCFywTcKlFY9XwVsk0mSIl+kQZJW7ROaSSBfD25QzGE4jMFPe+A+YZ
        3w2+70F2lBxSEnTQh7AigzkV3WyfGvQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-RVOro3luMne7mL7-pC34fg-1; Tue, 18 Apr 2023 09:23:12 -0400
X-MC-Unique: RVOro3luMne7mL7-pC34fg-1
Received: by mail-ed1-f70.google.com with SMTP id i17-20020a50d751000000b005045c08ca6dso18300740edj.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Apr 2023 06:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681824190; x=1684416190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jtc3nZAFND4an9RKQCf6WUjcLwPZiFyLQ4c7U5Vc9Ig=;
        b=C7L90RzNk3Pses5bkuOyrG9P6X7ok59JKm9emz4z2WyCkZpf2QZcPGcQu+W8f4Ipli
         Ov8XwhZdUnsvbxhiMdXXo0p+VQCyFcHImSGNkGitKOTigx1de/KU3Mzijv1vxkf1MXpz
         R4t5+N/iEzJCVC67JJZ/gUFjCNeJGTC4KVe/OB1jOLN7keAp+O95oEctpitYuUE2dHsJ
         woLVPxE1x9Z89vIOB7QSTCugQQlKCj65AvBf1lxp/1IOCYQRdpI2T2g/OcK7DCI5TmNE
         TUflVQenw4bn0m5HnOqDQzVcp9njTkJV8xp9QF0KgPDo3VtQ/BZt5ZZ0cmRmuuQOEGDa
         DylA==
X-Gm-Message-State: AAQBX9dUt8H6FGo8CiAP840Q0qqBExHMwAD/9gW14jS8Uen0wmVwMp+s
        Zc6d6hsOwFs4ztj8UlywjluIMoXgqMahF9xxD0LEhPCxl0dn0aZit76u2DwPJz9vVOEPBLkxjVC
        uK7mtCstlZSA5RyFm+6mXL5zcwLz1fMP4oiiL3WxPkQ==
X-Received: by 2002:a17:906:960e:b0:94f:12c0:4c8f with SMTP id s14-20020a170906960e00b0094f12c04c8fmr10554135ejx.50.1681824190473;
        Tue, 18 Apr 2023 06:23:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZWhECLdD7gDfCcaJ0EnJEvlzniIBvYBElbDokcD2L4G4tBcqixe526x0PefHD4QbmGIShW7A==
X-Received: by 2002:a17:906:960e:b0:94f:12c0:4c8f with SMTP id s14-20020a170906960e00b0094f12c04c8fmr10554105ejx.50.1681824190093;
        Tue, 18 Apr 2023 06:23:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fl3-20020a1709072a8300b0094f396c7a7asm4348535ejc.214.2023.04.18.06.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 06:23:09 -0700 (PDT)
Message-ID: <831fe8e5-2fe2-7188-227d-2a6932313eb1@redhat.com>
Date:   Tue, 18 Apr 2023 15:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [ibm-acpi-devel] [PATCH] platform/x86: thinkpad_acpi: Fix
 Embedded Controller access on X380 Yoga
Content-Language: en-US, nl
To:     Mark Pearson <mpearson-lenovo@squebb.ca>,
        Daniel Bertalan <dani@danielbertalan.dev>
Cc:     Liav Albani <liavalb@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        "Mark Gross>" <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        "Henrique de Moraes Holschuh>" <hmh@hmh.eng.br>
References: <20230414180034.63914-1-dani@danielbertalan.dev>
 <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com>
 <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com>
 <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
 <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev>
 <dd07686f-dd03-4efc-3dfe-5b568c6c854d@redhat.com>
 <TYZPR03MB59945171347BC248412EBEE6BD9D9@TYZPR03MB5994.apcprd03.prod.outlook.com>
 <ca210db5-2a2b-4962-8c28-e9b7d8cf6a59@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ca210db5-2a2b-4962-8c28-e9b7d8cf6a59@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/18/23 15:16, Mark Pearson wrote:
>> Subject: [External] Re: [ibm-acpi-devel] [PATCH] platform/x86: 
>> thinkpad_acpi: Fix Embedded Controller access on X380 Yoga
>>
>> Hi,
>>
>> On 4/15/23 16:22, Daniel Bertalan wrote:
>>> Hi,
>>>
>>> On Saturday, April 15th, 2023 at 15:30, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> On 4/15/23 15:24, Liav Albani wrote:
>>>>
>>>>> On 4/15/23 13:12, Hans de Goede wrote:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 4/14/23 20:02, Daniel Bertalan wrote:
>>>>>>
>>>>>>> On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
>>>>>>> accessing the Embedded Controller: instead of a method that reads from
>>>>>>> the EC's memory, `ECRD` is the name of a location in high memory. This
>>>>>>> meant that trying to call them would fail with the following message:
>>>>>>>
>>>>>>> ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
>>>>>>> ACPI object (RegionField)
>>>>>>>
>>>>>>> With this commit, it is now possible to access the EC and read
>>>>>>> temperature and fan speed information. Note that while writes to the
>>>>>>> HFSP register do go through (as indicated by subsequent reads showing
>>>>>>> the new value), the fan does not actually change its speed.
>>>>>>>
>>>>>>> Signed-off-by: Daniel Bertalan dani@danielbertalan.dev
>>>>>>> Interestig, this looks like a pretty clean solution to me.
>>>>>
>>>>> Daniel and I have looked in the DSDT ASL code and found a bunch of registers in high physical memory location (which is an ACPI OpRegion),
>>>>> and one of the registers had a bit called ECRD.
>>>>> However, there were many other registers that might be interesting as well, the problem is the short names in the ASL code (so we only see abbreviations essentially).
>>>>>
>>>>> While I do agree that adding this code is indeed a clean solution, if you (people that are dealing with Thinkpad laptops) know about cleaner way to access the embedded controller, I think it's preferable, because this way Daniel might be able to trigger the fan on that laptop so it will actually spin and will dissipate-out heat from the system, without the relying on the embedded controller to get into some sort of thermal state and then to trigger the fan.
>>>>
>>>>
>>>> Have you tried falling back to the ec_read() and ec_write() helpers
>>>> exported by the ACPI EC code ?
>>>>
>>>> The "first_ec" pointer used by these functions is exported too,
>>>> so you could try modifying thinkpad_acpi to use ec_read() and
>>>> ec_write() as fallback when first_ec is set (and the quirk
>>>> added by this patch triggers).
>>>
>>> This is basically what my patch does. If the ECRD/ECWR method handles
>>> are NULL, thinkpad_acpi's acpi_ec_{read,write} functions fall back to
>>> the regular ACPI EC helpers you mentioned.
>>
>> Ah I did not realize that. Ok that sounds good to me.
>>
>> I'll go and apply the patch then. To be on the save side I'm going
>> to only add this to -next, so that it gets some testing before
>> showing up in stable series. Once 6.4-rc1 is out you can then
>> send it to stable@vger.kernel.org to get it backported.
>>
>>> Speaking of which, does anyone know why these private helper functions
>>> exist in the first place? The code seems to use them interchangeably.
>>> Even in the fan control code, there are places where the regular EC
>>> helpers are called directly. Can we get away with always doing that?
>>
>> I assume that on some older models there is no standard ACPI EC device
>> in the ACPI tables, so there only ECRD/ECWR work. I guess that code-paths
>> which directly call ec_read() / ec_write() are only used on newer
>> models. But this does indeed seem inconsistent.
>>
>>> Back to the issue at hand, is there someone we could ask if the X380Y
>>> even supports manual fan control in the first place? My debugging
>>> efforts are starting to look like a wild goose chase.
>>>
>>> The thermal sensors and fan PWM readings now work, which is better
>>> than nothing, but it would be good to get to the bottom of this.
>>
>> Mark Pearson from Lenovo can hopefully help answer this, but I know
>> that he is quite busy atm. Hopefully Mark will get back to you when
>> he has some more bandwidth.
>>
> Sorry for the slow reply on this one.
> 
> I checked with the FW team and they confirmed on the x380 Yoga that the implementation is unique and not using the ECRD/WCWR ACPI methods. They didn't say why...but it's not expected to be something done again.
> 
> I had missed the question about fan control so didn't ask about that. Is there a reason you need to change the fans? It's generally not recommended as it can violate temperature specs and leads to all sorts of issues.
> 
> I don't know if the fact this is a one off makes this a better candidate as a quirk? To reduce the risk of breaking something on other platforms? But the code changes looked sensible to me.
> 
> I'll aim to do some builds with it in and test it on a few platforms - but I'm travelling next week so this week (and almost certainly the week after) are a bit hectic.

I just remembered that making thinkpad_acpi fan-control
actually requires passing a module-parameter, because as
said generally speaking leaving the fan on auto mode is best.

I wonder if that parameter was set when testing on
the X380 ?  I guess it was set since the actual
register was inspected and the changes were visible
there, right ?

Regards,

Hans


