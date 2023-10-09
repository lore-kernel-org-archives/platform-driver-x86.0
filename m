Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4B9E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 11:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346386AbjJIL6a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346376AbjJIL63 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 07:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B314694
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696852661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VxQT/cgg1GvFZXj3fHxBel0czN1R2ZBMT4WhuK5nkAg=;
        b=eHK6XBmAB3yyXHMtdjwCU0J6jIRP8tYnMKBTq5KBiUNfZn+Jp/NdFEvyeQ2L9Z18TLkoCv
        vL/eSvlEVpYuJ+Fnthd0l6mx++T550nYhXkEWijmLD0XgstnqhBXJfdokWT1a+WdSfFKIX
        Y/RJ1Wlun54d/N6sf6OOuR3MMfPKel0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-ZmPS6V87M_-5l715ZWQuUA-1; Mon, 09 Oct 2023 07:57:40 -0400
X-MC-Unique: ZmPS6V87M_-5l715ZWQuUA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9b98bbf130cso346300066b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Oct 2023 04:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696852659; x=1697457459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxQT/cgg1GvFZXj3fHxBel0czN1R2ZBMT4WhuK5nkAg=;
        b=PtmyJMDh54YAqep1CDMDAoLbxw/hG2Gr8N8AoR+FkKjTBx9oyfZ1YRuuR35Kz06mhJ
         HcFwkHbGWI/93JMA9VS06Y6ljHgqwVfsaHAc2cbaqNcL0c353ymAdaX6XaCrJkTG324e
         yiZnLrUJdYpgtiYAf1UFjiIi42UQkp6OT/og0uc+3GVH8cSBAPSD+sB5nG4dNREFrFpW
         Z4yNZYW7fv4Ofogs+HE7WM44xWWPfMLSF64oQcUCYEtGzig6/lDGq1M5xKFiAH+nlQMN
         fm5WgXfSOqes3Qu5ibDaMhEH30F6X9SAuy+jIM+TF1P8FAbULedsXgO1rPqvdM6etcZ4
         sZWw==
X-Gm-Message-State: AOJu0YxVlTQt2tTYGfOlJ4mnP9ALOLLAs+4hlmoUC9ORNAXCsiv1Un2S
        ZkM6TDodUgKR3vxY+OrsBdYCMt+jYA269JBZrskwGartIQIbpsZ0fCRL0tit2g6lxcgZFJsGSn+
        VlZlneNziI0/yonnYJXLal9CSdwEFRhKKZA==
X-Received: by 2002:a17:906:14e:b0:9ae:74d1:4b42 with SMTP id 14-20020a170906014e00b009ae74d14b42mr14021345ejh.76.1696852659301;
        Mon, 09 Oct 2023 04:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg2ddK4E7dgW0tFoKobfGbXoRT3XPzJGINbhdBkCHn7luNSiM3r5WEKOT6vR5uNTKr5KN/+w==
X-Received: by 2002:a17:906:14e:b0:9ae:74d1:4b42 with SMTP id 14-20020a170906014e00b009ae74d14b42mr14021332ejh.76.1696852658994;
        Mon, 09 Oct 2023 04:57:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090616c800b009a1be9c29d7sm6761991ejd.179.2023.10.09.04.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:57:38 -0700 (PDT)
Message-ID: <d15fcb9b-0d4f-b874-7066-03aae78e160c@redhat.com>
Date:   Mon, 9 Oct 2023 13:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] platform/x86: msi-ec: Add more EC configs
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231006175352.1753017-3-teackot@gmail.com>
 <20231006175352.1753017-9-teackot@gmail.com>
 <4e788e51-ec7b-4dc2-ed66-419e94514aa9@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4e788e51-ec7b-4dc2-ed66-419e94514aa9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 10/9/23 13:40, Ilpo Järvinen wrote:
> On Fri, 6 Oct 2023, Nikita Kravets wrote:
> 
>> This patch adds configurations for new EC firmware from the downstream
>> version of the driver.
>>
>> Cc: Aakash Singh <mail@singhaakash.dev>
>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
>> ---
>>  drivers/platform/x86/msi-ec.c | 467 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 467 insertions(+)
>>
>> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
>> index 3074aee878c1..f19504dbf164 100644
>> --- a/drivers/platform/x86/msi-ec.c
>> +++ b/drivers/platform/x86/msi-ec.c
>> @@ -667,6 +667,467 @@ static struct msi_ec_conf CONF7 __initdata = {
>>  	},
>>  };
>>  
>> +static const char * const ALLOWED_FW_8[] __initconst = {
>> +	"14F1EMS1.115",
>> +	NULL
>> +};
>> +
>> +static struct msi_ec_conf CONF8 __initdata = {
>> +	.allowed_fw = ALLOWED_FW_8,
>> +	.charge_control = {
>> +		.address      = 0xd7,
>> +		.offset_start = 0x8a,
>> +		.offset_end   = 0x80,
>> +		.range_min    = 0x8a,
>> +		.range_max    = 0xe4,
>> +	},
>> +	.webcam = {
>> +		.address       = 0x2e,
>> +		.block_address = MSI_EC_ADDR_UNSUPP,
>> +		.bit           = 1,
>> +	},
>> +	.fn_win_swap = {
>> +		.address = 0xe8,
>> +		.bit     = 4,
>> +	},
>> +	.cooler_boost = {
>> +		.address = 0x98,
>> +		.bit     = 7,
>> +	},
>> +	.shift_mode = {
>> +		.address = 0xd2,
>> +		.modes = {
>> +			{ SM_ECO_NAME,     0xc2 },
>> +			{ SM_COMFORT_NAME, 0xc1 },
>> +			{ SM_SPORT_NAME,   0xc0 },
>> +			MSI_EC_MODE_NULL
>> +		},
>> +	},
>> +	.super_battery = {
>> +		.address = 0xeb,
>> +		.mask    = 0x0f,
>> +	},
>> +	.fan_mode = {
>> +		.address = 0xd4,
>> +		.modes = {
>> +			{ FM_AUTO_NAME,     0x0d },
>> +			{ FM_SILENT_NAME,   0x1d },
>> +			{ FM_BASIC_NAME,    0x4d },
>> +			MSI_EC_MODE_NULL
>> +		},
>> +	},
>> +	.cpu = {
>> +		.rt_temp_address       = 0x68,
>> +		.rt_fan_speed_address  = 0x71,
>> +		.rt_fan_speed_base_min = 0x19,
>> +		.rt_fan_speed_base_max = 0x37,
>> +		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
>> +		.bs_fan_speed_base_min = 0x00,
>> +		.bs_fan_speed_base_max = 0x0f,
>> +	},
>> +	.gpu = {
>> +		.rt_temp_address      = MSI_EC_ADDR_UNKNOWN,
>> +		.rt_fan_speed_address = MSI_EC_ADDR_UNKNOWN,
>> +	},
>> +	.leds = {
>> +		.micmute_led_address = MSI_EC_ADDR_UNSUPP,
>> +		.mute_led_address    = 0x2d,
>> +		.bit                 = 1,
>> +	},
>> +	.kbd_bl = {
>> +		.bl_mode_address  = MSI_EC_ADDR_UNKNOWN, // ?
>> +		.bl_modes         = { 0x00, 0x08 }, // ?
>> +		.max_mode         = 1, // ?
>> +		.bl_state_address = MSI_EC_ADDR_UNSUPP, // not functional
> 
> I only too patch 2/3 becase there seems to be some configuration option 
> which causes // comments to trigger warning (that can be made errors 
> with another config option) so please use only /* */ comments.

Hmm, that is very weird all the:

// SPDX-License-Identifier ...

comments at the top of many of our .c files are c++ style comments.

Regards,

Hans


