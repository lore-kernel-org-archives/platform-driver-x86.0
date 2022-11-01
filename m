Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6D5FA373D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 09:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiKAJxJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 05:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiKAJxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 05:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CB819031
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667296331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ixoTAvrdki507b7MkiviwG5z9O5rlwU7YLzuBElexw=;
        b=i8lJkmNm5a+8UzZmibks1aJ40kiZ21COAMvMnqVouAZPhRg63HbAQuS4f4u4nap/zE5CMl
        nXoFoA74m41A5rqxecUaOyWAg5AD9Zq6DbPqWMgETYbPXST91jqhA1y4aqfHiKZOTD8v0z
        nHkT7iy0aYQW7IfHDQ5xjnQXYNzw2z8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-QsCXrOuqNPKf5P88nMFDmg-1; Tue, 01 Nov 2022 05:52:06 -0400
X-MC-Unique: QsCXrOuqNPKf5P88nMFDmg-1
Received: by mail-ej1-f69.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso7437442ejb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ixoTAvrdki507b7MkiviwG5z9O5rlwU7YLzuBElexw=;
        b=BySKsvzgvIZyCrk0yN4F0F71DLCKHT1pNdYecD98UFbaknj3LjmvrwsK40xDRmf/4n
         FbtfUvtL4NZZj4DDdqd4U9KnbqehRsZjA8Ef0RG+u5Yqg3i76sbU/9c5xvVye509jtYM
         Ge0lxeLdUN8hdMu9J6J4pDBlAyc2kx7y6LjZx/p1OqlSBj3r5g04U95pvvXT1Dm74GA+
         bJWNn0Vr+Dg5TmePQYxmseNLYWw6jIH/4ycLUa7VA8AWnZo+6D7JR+6SGCF5VmJ0w12r
         tPm10Ysa98REn7vQ3jIbLvb2biVP8oD5eZyoFySUqRSFze0Fetol6Er3y3ukzp6rmUMr
         jmvQ==
X-Gm-Message-State: ACrzQf1LnUIH7ZuORvzKREJx2khDZ7X8k5hCO9U+fb4Tw3HklcTFXS69
        DUYkVQBa0I1DAUIej3wNuCWM3fD0xag6+QHpLpDMDuiJhsSA0SQ+qUpF+jd5OZju/qZKiUiAr5D
        NApdmhYmWxQB+FI7r+ipAliGwqgfisXam8w==
X-Received: by 2002:a17:907:86a0:b0:78d:df8b:4d17 with SMTP id qa32-20020a17090786a000b0078ddf8b4d17mr17020435ejc.254.1667296325428;
        Tue, 01 Nov 2022 02:52:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Nxr23Dm7cVeOT8KLoB8ETNcuodjAJY+jRPBwaaWgsTEG1p5FlB9eMk8hSJB9/ymzw/0sHtQ==
X-Received: by 2002:a17:907:86a0:b0:78d:df8b:4d17 with SMTP id qa32-20020a17090786a000b0078ddf8b4d17mr17020414ejc.254.1667296325187;
        Tue, 01 Nov 2022 02:52:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y34-20020a50bb25000000b00462bd673453sm4381230ede.39.2022.11.01.02.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 02:52:04 -0700 (PDT)
Message-ID: <edb8e436-739d-1c91-d697-142681520e8c@redhat.com>
Date:   Tue, 1 Nov 2022 10:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] ACPI: video: Add backlight=native DMI quirk for Dell G15
 5515
Content-Language: en-US, nl
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20221031212556.401618-1-hdegoede@redhat.com>
 <Y2BHpKxWitLSMFER@lenny>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y2BHpKxWitLSMFER@lenny>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/31/22 23:09, Daniel Dadap wrote:
> Thanks, Hans:
> 
> On Mon, Oct 31, 2022 at 10:25:56PM +0100, Hans de Goede wrote:
>> The Dell G15 5515 has the WMI interface (and WMI call returns) expected
>> by the nvidia-wmi-ec-backlight interface. But the backlight class device
>> registered by the nvidia-wmi-ec-backlight driver does not actually work.
>>
>> The amdgpu_bl0 native GPU backlight class device does actually work,
>> add a backlight=native DMI quirk for this.
> 
> I'm not certain whether you have direct access to the system, but I am
> curious as to what mode the system is in when it exposes a non-working
> WMI backlight interface. The expectation is that the WMI EC backlight
> interface should only be exposed when the system is in dynamic mode
> (different vendors may call this differeint things in the EFI setup
> menus), and the native backlight interfaces for the GPUs, be they
> discrete or integrated, should only be exposed when a mode that keeps
> only one of the GPUs connected to the panel; i.e., in discrete-only mode
> the discrete GPU should have a working native backlight interface, and
> in integrated-only mode, or a hybrid mode which does not allow dynamic
> mux switching, the integrated GPU should have a working native backlight
> interface.
> 
> For this notebook the AMD GPU would be the integrated one, so if the
> system is *not* in dynamic switch mode, and the WMI interface is
> reporting that the backlight should be handled by the EC, then that is
> certainly a bug in the system, and this would be the correct workaround,
> when the system is operating in an iGPU-only or non-dynamic hybrid mode.
> However, if the system is switched to a dynamic mode, then this would
> break the EC backlight, which should be the corect backlight interface
> for that case. Another possible system bug would be if the condition
> described in the change description occurs when the system *is* in a
> dynamic mode, but is routing backlight control to the iGPU anyway. That
> would be a messier bug to deal with, since it would also be necessary to
> determine which backlight interface is functional when the display is
> switched over to the dGPU.
> 
> If it's not too much trouble could you (or the reporter, if you don't
> have the system) check which backlight interfaces are exposed, and which
> of those actually work, for each of the different hybrid GPU modes? I am
> not certain what they would be called on the setup screen, but the
> possible modes should be:
> 
> * Integrated only
> * Discrete only
> * Hybrid, without dynamic switching
> * Hybrid, with dynamic switching
> 
> , or a subset thereof. Usually I would expect the minimal subset to be
> discrete only plus one or both of the hybrid modes. Since we're not sure
> what these are called on the setup screen it is probably best to simply
> report the names of the mode as they are listed in the UI.

Isn't the whole idea behind nvidia-wmi-ec-backlight that the backlight's
pwm input is connected to the EC (it is sorta in the name) and then always
is controlled by the EC independent of the mode ?

At least I was under the impression that that was the whole idea?

I will forward your email to the reporter and ask them to get
in touch with you and then lets see from there.

Regards,

Hans



> 
>> Cc: Daniel Dadap <ddadap@nvidia.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/acpi/video_detect.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>> index 841f6213b4de..88acc09773bb 100644
>> --- a/drivers/acpi/video_detect.c
>> +++ b/drivers/acpi/video_detect.c
>> @@ -645,6 +645,16 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>  		},
>>  	},
>>  
>> +	/* Models which have nvidia-ec-wmi support, but should not use it. */
>> +	{
>> +	 .callback = video_detect_force_native,
>> +	 /* Dell G15 5515 */
>> +	 .matches = {
>> +		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +		DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
>> +		},
>> +	},
>> +
>>  	/*
>>  	 * Desktops which falsely report a backlight and which our heuristics
>>  	 * for this do not catch.
>> -- 
>> 2.37.3
>>
> 

