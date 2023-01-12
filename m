Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB46DC54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjALT1D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjALT0e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08556C33
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 11:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673551056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3zrO0MhvjfxNfy/rQQheAEOMwtegzNmHoe3wimSn828=;
        b=XGZHJ6mXvM9po2l5fNZTvk6WDZWqx7m7iHQ7DEhJIPpvBv6Lg93LgevOMIAyQv03D8mEKt
        f36Tnb+j5SAPYvV3RGsAhB9B6/O0YfWLfA6riXKuMlGD5Qmz0ZKpG44gMF8a0UhOCGfSr5
        KF4A4Yye0pk+uJOss27yaRW6vUPuGFA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-8qsaRIYpOrqLQrHiIKvjXw-1; Thu, 12 Jan 2023 14:17:34 -0500
X-MC-Unique: 8qsaRIYpOrqLQrHiIKvjXw-1
Received: by mail-ed1-f70.google.com with SMTP id b15-20020a056402350f00b0048477a5114bso12786059edd.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 11:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zrO0MhvjfxNfy/rQQheAEOMwtegzNmHoe3wimSn828=;
        b=44zBQKQJazuHfJr2hHdJHyNFZipkkp4U/3GmnF31UHRD30MXCXGmxwY5p0MpHXJRi3
         Pdzz5vWaKQar6h2xf0++7Yez+P2SG5lNOVFgF30TbZO+QXLtptZQWfBtWiodGAqY7xkJ
         VYiqCWoVRsmev1M2CfxDLZelq7gyn3lOFe5o1DG79/xQ0XQI6PQzVtx17mBsmZiBKEaC
         GJkei6MrKarP54XbaOSf/Kk/CDzuRXfJqPKtG4kN9j/mh/q0sxDBJZPCBOVKw4tXW2Al
         6X6lcf0KcdeOKks1xVVKU8CQJUjQgMDH6cqA1k7Gfg/4YR+PhJ7YNmHeEvD6mK+q/Wxh
         +9GA==
X-Gm-Message-State: AFqh2kr5vsrdKeasW0/zx67vUYdwQJ+yOr50+vCr9WWFZPv/r4VzYf+2
        dUOEaKrC+MLqQPFrrpqRWddP356NjxOcvJrCsGTZiy8nWkNMCr+vaRCY7NzicMVac+yu+yurTLK
        HeG5pV7hs0+eKIStaTatJKyKcxoKfOMyXuQ==
X-Received: by 2002:a17:906:944a:b0:7c1:23f2:5b51 with SMTP id z10-20020a170906944a00b007c123f25b51mr431971ejx.60.1673551053420;
        Thu, 12 Jan 2023 11:17:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqs2TxvjJdh1PhlUR1SoSIXBXthjZcKNsU2vDHK9zf7j7tMMGJuM/Xb11ZLayCGR8SFW3G0Q==
X-Received: by 2002:a17:906:944a:b0:7c1:23f2:5b51 with SMTP id z10-20020a170906944a00b007c123f25b51mr431964ejx.60.1673551053228;
        Thu, 12 Jan 2023 11:17:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jv21-20020a170907769500b0077a201f6d1esm7672557ejc.87.2023.01.12.11.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 11:17:32 -0800 (PST)
Message-ID: <31194c75-b366-2b8e-5836-8b2c60c9690e@redhat.com>
Date:   Thu, 12 Jan 2023 20:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        Ike Panhc <ike.pan@canonical.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <a4cd28eb-2dc3-4cdc-bea4-5abed60ae108@app.fastmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a4cd28eb-2dc3-4cdc-bea4-5abed60ae108@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/23 17:38, Jiaxun Yang wrote:
> 
> 
> 在2022年11月9日十一月 下午8:59，Hans de Goede写道：
>> Hi All,
>>
>> I'm emailing you all because you have written patches or
>> reported bugs related to the ideapad-laptop touchpad
>> handling the past.
> 
> Hi all,
> 
> Sorry for chime in this old thread, but I'm able to get some input from a
> Lenovo engineer.
> 
> Quoting him:
> 
> "For newer Lenovo laptops we use TPRD/TPWR methods under touchpad's ACPI I2C HID
> device to sync touchpad state with EC. TPRD will return current touchpad state known
> by EC and OS can use TPWR to switch EC's touchpad state. This state will be used by EC
> to control LEDs and touchpad power saving signals."
> 
> According to my understanding we only need replace read write to VPCCMD_R_TOUCHPAD
> with calling TPRD/TPWR methods to get all new ideapads work.
> 
> As per my reverse engineering on ASLs this method actually reads a flag from EC's
> LPC memory space and it do work on some early ideapads (The earliest one I can
> trace is Ideapad 320-15ISK which is released on 2018).
> 
> I'm going to try to implement it in kernel. Though I haven't decide which part of
> driver should handle this, as those methods are under ACPI I2C HID device perhaps
> we should put this function under i2c-hid-acpi driver. However as the method is very
> ideated specific, putting in ideapad-acpi seems more reasonable... Any thoughts?

This really should be handled in ideapad-acpi, but that means figuring out a way
to find the touchpad device in ideapad-apci. For starters you can search for
ACPI devs which match:

static const struct acpi_device_id i2c_hid_acpi_match[] = {
        {"ACPI0C50", 0 },
        {"PNP0C50", 0 },
        { },
};

And then check if they have the TPRD/TPWR methods. This does risk piking
another device then the actual touchpad though, most likely a touchscreen
(in case where the ACPI tables accidentally also have TPRD/TPWR methods
on the touchscreen).

Once you have find the right ACPI device, we can call the methods
(when found) from:

ideapad_sync_touchpad_state()

Note that only ever reads the touchpad state... 

> He also told me how to get VPC2004 device's BIOS interface version, though the
> differences between versions remains unclear to me. I think we can expose it
> in dmesg and debugfs to help with future debugging and hopefully reduce the amount
> of DMI quirks.

Yes reading + logging (in dmesg) the BIOS interface version would be good.

Thank you for all your work on this!

Regards,

Hans



