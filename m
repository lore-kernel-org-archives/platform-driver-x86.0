Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEB0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D93061029
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 12:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbhIMMuG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 08:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45419 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232112AbhIMMuF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 08:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631537329;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/+YPq9DDWXh7H6lgKwZD0yJILIrB9KSPkJ+jCnMfKqo=;
        b=SyeQ70+x5sjtADB/aVtLDjKbdFYlEPQLiqWPj18owEY841yE0VO3h2gqkm3UuuO1fKL5ZM
        9Sx/jMaNwEXcs0ERmqxDVAfhlTvsf42/ZfnRWwsi28QbUXY5nJ+AJv0abGRlkZ+f6Iw7XG
        jnziUUc6nCiIy+iWY4FzJdtvqqCT+pk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-bB-s-ZtEOJmVBrViB8uz3Q-1; Mon, 13 Sep 2021 08:48:48 -0400
X-MC-Unique: bB-s-ZtEOJmVBrViB8uz3Q-1
Received: by mail-ej1-f72.google.com with SMTP id cf17-20020a170906b2d100b005d42490f86bso3645356ejb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 05:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/+YPq9DDWXh7H6lgKwZD0yJILIrB9KSPkJ+jCnMfKqo=;
        b=HMfQr4QIWR0iARwyI8hdQUQ7Xk1rcU1bnc+tKyBQzsUoKR9Oc1SGKZExFT5gZc1cFh
         r9wQKbpgHC+EcVMZA+mvlR38+/zKWtAYeJhxgvCrZcHjRzOhQ//GYsub8v0NMBBVww9f
         dSMtUM8Bgmnq2wDG+hWvtyf9U08mIhDs6O3V8qHMttSUFs7uJvLsZORU80u4x7+xFKPw
         6F7QE8wN9AiFvQMvXSJPuaTu1nQLBTu/MpfgmbOZhoCQQmHMszuu7I1RNVAiuTDdElXy
         PWrOrAyfLoMGPEJfURKxuftzrRvwLdx0xlh4M9OExrXCXuWbgTCP4tjIT5BAUkWTyP/5
         bJpw==
X-Gm-Message-State: AOAM530EouMs3EkAxV/wW69VCCLQQ7jI3BEoOql9nGLPTUeufHm66qog
        2gg+zyKlX6p6bS+AW1V+zkhxwo6ItePu/Ctl0F2SSCxTNheAJSJ9xbjzfSyusU1+ZBHaEHuCxhK
        +GNCqq4JWRBhPUAoaJZanYGQxNvsJTGmJPQ==
X-Received: by 2002:a05:6402:229c:: with SMTP id cw28mr9684647edb.356.1631537327486;
        Mon, 13 Sep 2021 05:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhcNXLU3ZDliCJFsc3cNNGslwjvbStH/s2UTqrQi41ZJLQVO9a8+kG4ie15sqA/r0xEucQ+w==
X-Received: by 2002:a05:6402:229c:: with SMTP id cw28mr9684626edb.356.1631537327216;
        Mon, 13 Sep 2021 05:48:47 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id q19sm3913862edc.74.2021.09.13.05.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 05:48:46 -0700 (PDT)
Subject: Re: [PATCH] Process tablet mode events on Dell Inspiron 2n1
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Troy Rollo <linux2021@troy.rollo.name>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210909033502.1994749-1-linux2021@troy.rollo.name>
 <776ba42d-1d87-81e9-ed36-3ef860869d93@redhat.com>
 <20210913124448.jnkpbya2eyq2mcqb@pali>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <063cf992-0f78-1d6e-cb4b-2545b4b740d5@redhat.com>
Date:   Mon, 13 Sep 2021 14:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913124448.jnkpbya2eyq2mcqb@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/13/21 2:44 PM, Pali Rohár wrote:
> On Monday 13 September 2021 14:40:28 Hans de Goede wrote:
>> Hi,
>>
>> Overall this patch looks good, I have 2 remarks:
>>
>> 1. Your commit message needs some work, the first line (Subject) should
>> briefly describe the change with a subsystem prefix, so something like this:
>>
>> platform/x86: dell-wmi: Add SW_TABLET_MODE support for Dell Inspiron 2in1
>>
>> And then an empty line followed by a "body" with a bit more detailed description.
>>
>> And last but not least you need to add a Signed-off-by line like this:
>>
>> Singed-off-by: Troy Rollo <linux2021@troy.rollo.name>
>>
>> Which indicates that you authored the patch and are submitting it under
>> the standard kernel license, see:
>> https://elinux.org/Developer_Certificate_Of_Origin
>>
>> 2. Also have 1 remark about the code, see below.
>>
>>
>> On 9/9/21 5:35 AM, Troy Rollo wrote:
>>> ---
>>>  drivers/platform/x86/dell/dell-wmi-base.c | 36 ++++++++++++++++-------
>>>  1 file changed, 26 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
>>> index 089c125e18f7..474ca05055ab 100644
>>> --- a/drivers/platform/x86/dell/dell-wmi-base.c
>>> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
>>> @@ -309,6 +309,9 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
>>>   * Keymap for WMI events of type 0x0011
>>>   */
>>>  static const struct key_entry dell_wmi_keymap_type_0011[] = {
>>> +	/* Reflex keyboard switch on 2n1 devices */
>>> +	{ KE_VSW,    0xe070, { .sw  = { SW_TABLET_MODE } } },
>>> +
>>
>> By adding this here, any device loading the dell-wmi driver will now advertise
>> that it supports SW_TABLET_MODE reporting, even when it does not. This will
>> cause e.g. GNOME40 to disable accelerometer based rotation since when
>> SW_TABLET_MODE=0 is being reported then GNOME40 assumes it is running on a
>> 2in1 in laptop mode and thus disable auto-rotation (and also the on-screen-kbd).
>>
>> So advertising a non functional (always reporting 0) SW_TABLET_MODE switch
>> is harmful and this change will do this.
> 
> Good catch. This code needs some rework as based on above gnome
> behavior, this change breaks support for all existing older Dell
> laptops.
> 
> It it problem only with SW_TABLET_MODE? Or with any KE_VSW?

It is a problem for any KE_SW / KE_VSW since unlike keys/buttons which
are always unpressed by default and don't cause userspace to do anything
until a press is reported, switches have a meaning in both their
0 and 1 state, so merely reporting the presence of a switch can cause
userspace to change behavior.

Note I'm not aware of any SW other then SW_TABLET_MODE actually causing
issues, but in theory this is an issue with any SW because of the reason
which I just gave.

Regards,

Hans


> 
>> Since you already have special handling for the tablet-mode WMI events,
>> it would be better to use a separate input-device which just reports
>> SW_TABLET_MODE and which gets dynamically created upon receiving the
>> first 0x0011 0xe070 event. See the
>> drivers/platform/x86/intel/vbtn.c
>> drivers/platform/x86/intel/hid.c
>>
>> Drivers for an example of 2 drivers already doing this.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>  	/* Battery unplugged */
>>>  	{ KE_IGNORE, 0xfff0, { KEY_RESERVED } },
>>>  
>>> @@ -344,17 +347,19 @@ static const struct key_entry dell_wmi_keymap_type_0012[] = {
>>>  	{ KE_IGNORE, 0xe035, { KEY_RESERVED } },
>>>  };
>>>  
>>> -static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
>>> +static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16 *buffer, int remaining)
>>>  {
>>>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>>>  	const struct key_entry *key;
>>> +	int used = 0;
>>> +	int value = 1;
>>>  
>>>  	key = sparse_keymap_entry_from_scancode(priv->input_dev,
>>>  						(type << 16) | code);
>>>  	if (!key) {
>>>  		pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n",
>>>  			type, code);
>>> -		return;
>>> +		return 0;
>>>  	}
>>>  
>>>  	pr_debug("Key with type 0x%04x and code 0x%04x pressed\n", type, code);
>>> @@ -363,16 +368,22 @@ static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
>>>  	if ((key->keycode == KEY_BRIGHTNESSUP ||
>>>  	     key->keycode == KEY_BRIGHTNESSDOWN) &&
>>>  	    acpi_video_handles_brightness_key_presses())
>>> -		return;
>>> +		return 0;
>>>  
>>>  	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
>>> -		return;
>>> +		return 0;
>>>  
>>> -	if (key->keycode == KEY_KBDILLUMTOGGLE)
>>> +	if (key->keycode == KEY_KBDILLUMTOGGLE) {
>>>  		dell_laptop_call_notifier(
>>>  			DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED, NULL);
>>> +	} else if (type == 0x0011 && code == 0xe070 && remaining > 0) {
>>> +		value = !buffer[0];
>>> +		used = 1;
>>> +	}
>>> +
>>> +	sparse_keymap_report_entry(priv->input_dev, key, value, true);
>>>  
>>> -	sparse_keymap_report_entry(priv->input_dev, key, 1, true);
>>> +	return used;
>>>  }
>>>  
>>>  static void dell_wmi_notify(struct wmi_device *wdev,
>>> @@ -430,21 +441,26 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>>  		case 0x0000: /* One key pressed or event occurred */
>>>  			if (len > 2)
>>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>> -						     buffer_entry[2]);
>>> +						     buffer_entry[2],
>>> +						     buffer_entry + 3,
>>> +						     len - 3);
>>>  			/* Extended data is currently ignored */
>>>  			break;
>>>  		case 0x0010: /* Sequence of keys pressed */
>>>  		case 0x0011: /* Sequence of events occurred */
>>>  			for (i = 2; i < len; ++i)
>>> -				dell_wmi_process_key(wdev, buffer_entry[1],
>>> -						     buffer_entry[i]);
>>> +				i += dell_wmi_process_key(wdev, buffer_entry[1],
>>> +							  buffer_entry[i],
>>> +							  buffer_entry + i,
>>> +							  len - i - 1);
>>>  			break;
>>>  		case 0x0012:
>>>  			if ((len > 4) && dell_privacy_process_event(buffer_entry[1], buffer_entry[3],
>>>  								    buffer_entry[4]))
>>>  				/* dell_privacy_process_event has handled the event */;
>>>  			else if (len > 2)
>>> -				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2]);
>>> +				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2],
>>> +						     buffer_entry + 3, len - 3);
>>>  			break;
>>>  		default: /* Unknown event */
>>>  			pr_info("Unknown WMI event type 0x%x\n",
>>>
>>
> 

