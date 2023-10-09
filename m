Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E90CE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 12:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376561AbjJIM6i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 08:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376530AbjJIM6i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 08:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E34091
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696856272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QGeSuA8JBMlWpsNawvHvblnKsqXklUb2oruVthvOx/I=;
        b=FdARyXNlpOrBKeR4Q08zxDU5NCBObPd9BrjZb4CJFMI3ZPpLtvulqXzopgg6yaVDrpn9aS
        1vw/9y7SRKwFp+mR6vmzshuywFmvPP7Jffi3hfyYfXrX56Yyexf+xCV6HVBUdu4J3MSe9F
        akau4b2HTAUOhxf5L7wl9xRRihM4nT8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-J7-voCdQMnOTrqN4OxFrBg-1; Mon, 09 Oct 2023 08:57:51 -0400
X-MC-Unique: J7-voCdQMnOTrqN4OxFrBg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a681c3470fso366108766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 05:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856270; x=1697461070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QGeSuA8JBMlWpsNawvHvblnKsqXklUb2oruVthvOx/I=;
        b=JQUBjxTNDKpR2CwR6K1mWwVL1Oc3nLxcAJOXEh98L5rA+6IwRdP6lbswR0qPYGWzl7
         nCxjZcoB1NTYJCFo4AHxaVIZ54z8a4Po0Czu6Oix75Olct8ZnKFL00fDBZgI5rtrCEEa
         wLnkcZ3biECOuPTbfuAC8ixslfLo528BbDjqpu4449WgXeRBFt3FYsldH1QruPrWwR0r
         2v3mwe7zHKlM2qjqabfgNeSmcw2H2qhKZf7fAJuurxQ19xr6u8lALkFeuUGWj+BR/fZj
         TxNMWwXNpLaEVS4RvYp9hpMs9G0n5V0z+XWldUgjZiI7x5TAQ3jfxjB5cGBKFspDEN1d
         Gj+A==
X-Gm-Message-State: AOJu0YwYHsTUGGjgiXJPBN1T+Tt3H6uKV2FRsRt8ljQmZrdl/WIB/yrc
        3I50T7Ox52PZ6oMxDUuwLBCt7R6q10NiXpGPOnI0NdlZbsupbCFTCkKN9yjoLiqC7pqK2K/mMFg
        B2ZXdO/18E5ft2P6jf8kjtxtyzfAh5VOTRQ==
X-Received: by 2002:a17:906:74c3:b0:9b7:292:85f6 with SMTP id z3-20020a17090674c300b009b7029285f6mr12449891ejl.12.1696856270297;
        Mon, 09 Oct 2023 05:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfILfRHIpRe2nnmwKpuLFJw+W4lj+RgRR+36gJpWf6nX6DsZMsLRzGgouRwZj0WnDoyC0FwQ==
X-Received: by 2002:a17:906:74c3:b0:9b7:292:85f6 with SMTP id z3-20020a17090674c300b009b7029285f6mr12449873ejl.12.1696856269942;
        Mon, 09 Oct 2023 05:57:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oz10-20020a170906cd0a00b0099b5a71b0bfsm6692680ejb.94.2023.10.09.05.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:57:49 -0700 (PDT)
Message-ID: <51dfe28c-fc47-9f52-6952-3ab2f9a1e668@redhat.com>
Date:   Mon, 9 Oct 2023 14:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] platform/x86: msi-ec: Add more EC configs
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Nikita Kravets <teackot@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231006175352.1753017-3-teackot@gmail.com>
 <20231006175352.1753017-9-teackot@gmail.com>
 <4e788e51-ec7b-4dc2-ed66-419e94514aa9@linux.intel.com>
 <d15fcb9b-0d4f-b874-7066-03aae78e160c@redhat.com>
 <5635e2f-e169-9858-1034-5607d9cfde@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5635e2f-e169-9858-1034-5607d9cfde@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/23 14:34, Ilpo Järvinen wrote:
> On Mon, 9 Oct 2023, Hans de Goede wrote:
>> On 10/9/23 13:40, Ilpo Järvinen wrote:
>>> On Fri, 6 Oct 2023, Nikita Kravets wrote:
>>>
>>>> This patch adds configurations for new EC firmware from the downstream
>>>> version of the driver.
>>>>
>>>> Cc: Aakash Singh <mail@singhaakash.dev>
>>>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
>>>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
>>>> ---
>>>>  drivers/platform/x86/msi-ec.c | 467 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 467 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
>>>> index 3074aee878c1..f19504dbf164 100644
>>>> --- a/drivers/platform/x86/msi-ec.c
>>>> +++ b/drivers/platform/x86/msi-ec.c
>>>> @@ -667,6 +667,467 @@ static struct msi_ec_conf CONF7 __initdata = {
>>>>  	},
>>>>  };
>>>>  
>>>> +static const char * const ALLOWED_FW_8[] __initconst = {
>>>> +	"14F1EMS1.115",
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static struct msi_ec_conf CONF8 __initdata = {
>>>> +	.allowed_fw = ALLOWED_FW_8,
>>>> +	.charge_control = {
>>>> +		.address      = 0xd7,
>>>> +		.offset_start = 0x8a,
>>>> +		.offset_end   = 0x80,
>>>> +		.range_min    = 0x8a,
>>>> +		.range_max    = 0xe4,
>>>> +	},
>>>> +	.webcam = {
>>>> +		.address       = 0x2e,
>>>> +		.block_address = MSI_EC_ADDR_UNSUPP,
>>>> +		.bit           = 1,
>>>> +	},
>>>> +	.fn_win_swap = {
>>>> +		.address = 0xe8,
>>>> +		.bit     = 4,
>>>> +	},
>>>> +	.cooler_boost = {
>>>> +		.address = 0x98,
>>>> +		.bit     = 7,
>>>> +	},
>>>> +	.shift_mode = {
>>>> +		.address = 0xd2,
>>>> +		.modes = {
>>>> +			{ SM_ECO_NAME,     0xc2 },
>>>> +			{ SM_COMFORT_NAME, 0xc1 },
>>>> +			{ SM_SPORT_NAME,   0xc0 },
>>>> +			MSI_EC_MODE_NULL
>>>> +		},
>>>> +	},
>>>> +	.super_battery = {
>>>> +		.address = 0xeb,
>>>> +		.mask    = 0x0f,
>>>> +	},
>>>> +	.fan_mode = {
>>>> +		.address = 0xd4,
>>>> +		.modes = {
>>>> +			{ FM_AUTO_NAME,     0x0d },
>>>> +			{ FM_SILENT_NAME,   0x1d },
>>>> +			{ FM_BASIC_NAME,    0x4d },
>>>> +			MSI_EC_MODE_NULL
>>>> +		},
>>>> +	},
>>>> +	.cpu = {
>>>> +		.rt_temp_address       = 0x68,
>>>> +		.rt_fan_speed_address  = 0x71,
>>>> +		.rt_fan_speed_base_min = 0x19,
>>>> +		.rt_fan_speed_base_max = 0x37,
>>>> +		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
>>>> +		.bs_fan_speed_base_min = 0x00,
>>>> +		.bs_fan_speed_base_max = 0x0f,
>>>> +	},
>>>> +	.gpu = {
>>>> +		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
>>>> +		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
>>>> +	},
>>>> +	.leds = {
>>>> +		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
>>>> +		.mute_led_address    = 0x2d,
>>>> +		.bit                 = 1,
>>>> +	},
>>>> +	.kbd_bl = {
>>>> +		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
>>>> +		.bl_modes         = { 0x00, 0x08 }, // ?
>>>> +		.max_mode         = 1, // ?
>>>> +		.bl_state_address = MSI_EC_ADDR_UNSUPP, // not functional
>>>
>>> I only too patch 2/3 becase there seems to be some configuration option 
>>> which causes // comments to trigger warning (that can be made errors 
>>> with another config option) so please use only /* */ comments.
>>
>> Hmm, that is very weird all the:
>>
>> // SPDX-License-Identifier ...
>>
>> comments at the top of many of our .c files are c++ style comments.
> 
> I know there are those already which is why I didn't think there would 
> have been any problem with them until I got burned.
> 
> If // comments are okay, what's the explanation for this then:
> 
>   https://lore.kernel.org/oe-kbuild-all/202309270535.g9nOUvFb-lkp@intel.com/
> 
> It's from randconfig build so it's a bit hard to know from the report 
> itself which CONFIG combination exactly triggers the issue.
> 
> I can think of two potential ones:
>   a) Only problems for changed lines are reported by LKP
>   b) Header files have different rules than .c files (uapi ones in 
>      particular, I'd guess, if that's the case)

Yes I think that the error you point at is caused by the file in question
being a uapi header. It makes some sense to avoid C++ style comments there
to e.g. avoid problems when userspace code is build with -ansi .

So I think that uapi headers are the exception to the rule that
c++ style comments are ok.

Regards,

Hans


