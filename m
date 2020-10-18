Return-Path: <SRS0=yilX=DZ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B478C433E7
	for <platform-driver-x86@archiver.kernel.org>; Sun, 18 Oct 2020 09:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C2021D41
	for <platform-driver-x86@archiver.kernel.org>; Sun, 18 Oct 2020 09:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y55q5pjY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgJRJ0f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 18 Oct 2020 05:26:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57064 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgJRJ0e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Oct 2020 05:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603013192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CRDnYE15IB4q0SYxgNUzKlhB4YvukDndah4GcH9LHQc=;
        b=Y55q5pjYqxFXRr1dOSYeeVsliZy2sMz/slRnVmjlVZw2lgdMsanyoGbM56jgfFTYHw/sgj
        UBo6YboVTMTgzrPrYiFmkzy3bQZ4/iAOLHPqnE3WETaJPqtL407KF0rxsRWLqHF3EzmiCN
        SKFxHMAINHEGybhuV8GAtOQ+DecWWlI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-394rGZYGMtelcknHkkw51g-1; Sun, 18 Oct 2020 05:26:30 -0400
X-MC-Unique: 394rGZYGMtelcknHkkw51g-1
Received: by mail-ej1-f70.google.com with SMTP id ga21so3548045ejb.14
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2020 02:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CRDnYE15IB4q0SYxgNUzKlhB4YvukDndah4GcH9LHQc=;
        b=sP6k98C+ZeKDFijA/sOC07d1bM61ElHlQ9TAfxNzmm3PfoSTVIPF57jrwbft81l+m9
         ZVfN6R3ACB4F1b15zmP6nvzaA014HY50+sze21ZnyPlIS1B0EQ0Jwu+Zria0jO38dZby
         kAS+jTZmuLyE6EZpJqSnwKAs2HdPZ/VvxKDmDCf/4bJdl9kuvu0xuaiZT5w9rnCgGePj
         /5AtVUelOk9xs4cXXBaM0GJ61OKGgrFwztxs8oX3IqIVzyQR+f2eqAR80oM+hSxHBxvY
         3vncp2RY1yj0yO8GW7K/47L5/1NHsmCFRAxsfePXqcPy/ZRbCcD1pqNJ3vdh49gs2ZCM
         1H1g==
X-Gm-Message-State: AOAM5319Jnf39VOm6oufKF52KBZ75b3UTlFB3ZoQ/b9RBJsz/YQuzeBs
        VLjnLa++xNLYBGyxTzAZ/XLjp4Wh+/MUFQ5sajdOZKPYG0ZHJhcGwnaN0cv3zzRwmCzAGGdt79c
        dUIt7UOU6JcTfOaKun56ugHwuFLUSyu7zcA==
X-Received: by 2002:a17:906:68c4:: with SMTP id y4mr12322253ejr.197.1603013189082;
        Sun, 18 Oct 2020 02:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1jkgbLvFZF84uXqRmRP2IVw7VwXbBkfLP+flYyxtqndsXvhsA9xOove3V8jKPkUOxj9JyYw==
X-Received: by 2002:a17:906:68c4:: with SMTP id y4mr12322240ejr.197.1603013188794;
        Sun, 18 Oct 2020 02:26:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id i20sm6828587edv.96.2020.10.18.02.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2020 02:26:28 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Add support for SW_TABLET_MODE
 on UX360
To:     =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200917133425.168310-1-samuel@cavoj.net>
 <20201017233339.v4th6wyej3a25ved@fastboi.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <be5ea0b1-1a29-609e-d1a1-933344653f76@redhat.com>
Date:   Sun, 18 Oct 2020 11:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201017233339.v4th6wyej3a25ved@fastboi.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/18/20 1:33 AM, Samuel Čavoj wrote:
> Hello everyone.
> 
> On 17.09.2020 15:34, Samuel Čavoj wrote:
>> The UX360CA has a WMI device id 0x00060062, which reports whether the
>> lid is flipped in tablet mode (1) or in normal laptop mode (0).
>>
>> This commit adds a quirk (quirk_asus_use_lid_flip_devid) for devices on
>> which this WMI device should be used to figure out the SW_TABLET_MODE
>> state, as opposed to the quirk_asus_use_kbd_dock_devid.
>>
>> It is assumed other UX360* models have the same WMI device. As such, the
>> quirk is applied to devices with DMI_MATCH(DMI_PRODUCT_NAME, "UX360").
>> More devices with this feature need to be tested and added accordingly.
>>
>> The reason for using a whitelist via the quirk mechanism is that the new
>> WMI device (0x00060062) is also present on some models which do not have
>> a 360 degree hinge (at least FX503VD and GL503VD from Hans' DSTS
>> collection) and therefore its presence cannot be relied on.
>>
>> This patch is a followup to "platform/x86: asus-wmi: Fix SW_TABLET_MODE
>> always reporting 1 on many different models" by Hans de Goede.
>>
>> Signed-off-by: Samuel Čavoj <samuel@cavoj.net>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> ---
>>
>> v1 -> v2:
>>   - inherit wmi_backlight_set_devstate from default quirk
> 
> I have realised that one shortcoming still remains: If the laptop is
> suspended while in tablet mode, flipped to normal mode during sleep and
> then awoken, no event is generated by the firmware. The SW_TABLET_MODE
> switch then stays enabled, with inputs not working until the user tries
> flipping it once again.
> 
> I suppose a simple check on resume would suffice. However, I am not sure
> if this is worth implementing as an update to this patch (i would like
> it to make the 5.10 merge window after all) or as a separate patch, if
> at all.

First, in case you did not know I've taken over PDx86 maintainership
from Andy starting this merge-window.

I'm afraid that it is too late for 5.10 anyways as the merge window for
that is already open and I already sent out the pull-req. I'm sorry
that your patch did not make it, but even though I knew the handover
from Andy to me was coming I still ended up having not a whole lot
of time to deal with the merge window, so some patches did not make it.

> Opinions?

Since this is not going to make 5.10 anyways it would be nice if
you can post a new version which fixes the issue which you have
found, so that we can get this supported (without the issue) in 5.11.
As you point out yourself the correct thing to do here
obviously is to re-check the state on resume.

Regards,

Hans


>> ---
>>  drivers/platform/x86/asus-nb-wmi.c         | 15 +++++++++++++++
>>  drivers/platform/x86/asus-wmi.c            | 22 ++++++++++++++++++++++
>>  drivers/platform/x86/asus-wmi.h            |  1 +
>>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>>  4 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index 345bd224494b..5019b03b2c95 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -119,6 +119,11 @@ static struct quirk_entry quirk_asus_use_kbd_dock_devid = {
>>  	.use_kbd_dock_devid = true,
>>  };
>>  
>> +static struct quirk_entry quirk_asus_use_lid_flip_devid = {
>> +	.wmi_backlight_set_devstate = true,
>> +	.use_lid_flip_devid = true,
>> +};
>> +
>>  static int dmi_matched(const struct dmi_system_id *dmi)
>>  {
>>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
>> @@ -520,6 +525,16 @@ static const struct dmi_system_id asus_quirks[] = {
>>  		},
>>  		.driver_data = &quirk_asus_use_kbd_dock_devid,
>>  	},
>> +	{
>> +		.callback = dmi_matched,
>> +		.ident = "ASUS ZenBook Flip UX360",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			/* Match UX360* */
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "UX360"),
>> +		},
>> +		.driver_data = &quirk_asus_use_lid_flip_devid,
>> +	},
>>  	{},
>>  };
>>  
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index ae6289d37faf..e5066248e83a 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
>>  #define NOTIFY_KBD_BRTTOGGLE		0xc7
>>  #define NOTIFY_KBD_FBM			0x99
>>  #define NOTIFY_KBD_TTP			0xae
>> +#define NOTIFY_LID_FLIP			0xfa
>>  
>>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>>  
>> @@ -375,6 +376,18 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>>  		}
>>  	}
>>  
>> +	if (asus->driver->quirks->use_lid_flip_devid) {
>> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
>> +		if (result >= 0) {
>> +			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>> +			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>> +		} else if (result == -ENODEV) {
>> +			pr_err("This device has lid_flip quirk but got ENODEV checking it. This is a bug.");
>> +		} else {
>> +			pr_err("Error checking for lid-flip: %d\n", result);
>> +		}
>> +	}
>> +
>>  	err = input_register_device(asus->inputdev);
>>  	if (err)
>>  		goto err_free_dev;
>> @@ -2127,6 +2140,15 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>  		return;
>>  	}
>>  
>> +	if (asus->driver->quirks->use_lid_flip_devid && code == NOTIFY_LID_FLIP) {
>> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_LID_FLIP);
>> +		if (result >= 0) {
>> +			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
>> +			input_sync(asus->inputdev);
>> +		}
>> +		return;
>> +	}
>> +
>>  	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
>>  		fan_boost_mode_switch_next(asus);
>>  		return;
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
>> index 1a95c172f94b..b302415bf1d9 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -34,6 +34,7 @@ struct quirk_entry {
>>  	bool wmi_backlight_set_devstate;
>>  	bool wmi_force_als_set;
>>  	bool use_kbd_dock_devid;
>> +	bool use_lid_flip_devid;
>>  	int wapf;
>>  	/*
>>  	 * For machines with AMD graphic chips, it will send out WMI event
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 897b8332a39f..2f274cf52805 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -62,6 +62,7 @@
>>  
>>  /* Misc */
>>  #define ASUS_WMI_DEVID_CAMERA		0x00060013
>> +#define ASUS_WMI_DEVID_LID_FLIP		0x00060062
>>  
>>  /* Storage */
>>  #define ASUS_WMI_DEVID_CARDREADER	0x00080013
>> -- 
>> 2.28.0
>>
> 

