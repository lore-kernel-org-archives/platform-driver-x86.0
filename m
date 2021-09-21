Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D637DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 13:22:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD7C36109E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 13:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhIUNXs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 09:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30849 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231658AbhIUNXo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 09:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632230536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BQB2a7lJjSwroRB9fUA89zDIBa2G0PSJoBIx3o1EdoU=;
        b=E2i1feXafmK92rfXU+PxGnm4vIEhwGl2l7+vSyid3ea7s/jQ1vkNMhZtghgOVGwOUA7p6f
        IE4tdPRXVTijrNgt9/NDMzZI1F2TNizTW4jw9JnHGozmYPDO972/F5veLvsMgd/GZRfQA3
        emSYy1jBnfaWlw1P5UjXEowofUYT5GM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-ktu5TFHMNpa_yr6Fs4-Kgg-1; Tue, 21 Sep 2021 09:22:12 -0400
X-MC-Unique: ktu5TFHMNpa_yr6Fs4-Kgg-1
Received: by mail-ed1-f70.google.com with SMTP id m30-20020a50999e000000b003cdd7680c8cso18984990edb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 06:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BQB2a7lJjSwroRB9fUA89zDIBa2G0PSJoBIx3o1EdoU=;
        b=DGwHYgPIqdAH591XNjbJgxjaISHXxp4lI4vAQsau76ji5G7CwHAOX/seOxkJJcOoNO
         pVS4cCEiIX718cUUwx1GOgFXgUhyjqnymtBzdoRI+IDT5/rKVgqvK+VM7GO5n7TqEbwQ
         PmrAC4JEU+5RhbxJpkhExYnDC0TPMlgygrR4RkoERXqRJtiEH7ZtoUm6U67Pg0UixJE4
         48e33ZcaHusEjrd1mIXPOnvsHvdDDxBfzrgRIb+q9r9JKItsEX2V4rTTwYVloCPDMUCS
         7F3/khALEH7PcsInqBoXm/63t5RO9BDVmNZ8P+SBuBcWW0pY3UrwHCOhiPeVmBtaiwhT
         ia8g==
X-Gm-Message-State: AOAM531Arivqmy7GEdNylJf/GZO0qoRAuNwPHH8BPWEDDU8rRUFS0bZ/
        u4NFn5cVFbgVJKc2l8VOmVkokAMEp9FHoyd/w7KXB/mf5jTwTEOdhz21nvIDCkEALgdMWXvGmRe
        m8KseBlAQ+jur8hmkq8bP6Enxyzx5+8w/0g==
X-Received: by 2002:a17:906:7a09:: with SMTP id d9mr34422150ejo.116.1632230531425;
        Tue, 21 Sep 2021 06:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNnsjWSX8YlbGg6v/3zazntLGs/EUqxx4Olx7695kwJ3/Wf9AJL0WelIWuZKUkua7CEjNQ4w==
X-Received: by 2002:a17:906:7a09:: with SMTP id d9mr34422136ejo.116.1632230531203;
        Tue, 21 Sep 2021 06:22:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r22sm7422418ejj.91.2021.09.21.06.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 06:22:10 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: dell-wmi: Recognise or support new switches
To:     Troy Rollo <linux2021@troy.rollo.name>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210918073131.2966942-1-linux2021@troy.rollo.name>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5e91d488-d6df-a4dc-0ead-bbf542dd0995@redhat.com>
Date:   Tue, 21 Sep 2021 15:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210918073131.2966942-1-linux2021@troy.rollo.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/18/21 9:31 AM, Troy Rollo wrote:
> Adds support for:
> 
> - Dell Inspiron 2in1 tablet mode switch notifications. These are
>   delivered by a type 0x0011 message with code 0xe070, followed by a
>   flag (1 for laptop mode, 0 for tablet mode).
> 
> - Recognising (but not otherwise processing) the Dell Ultra Performance
>   mode request switch. This is delivered by a type 0x0012 message with
>   code 0x000d, followed by a parameter that is either 1 or 2. It is
>   not clear what (if anything) should be done with this notification, so
>   it is ignored.
> 
> Signed-off-by: Troy Rollo <linux2021@troy.rollo.name>

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



> ---
>  drivers/platform/x86/dell/dell-wmi-base.c | 76 ++++++++++++++++++++---
>  1 file changed, 66 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index 089c125e18f7..e07d3ba85a3f 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
> @@ -40,6 +40,7 @@ static bool wmi_requires_smbios_request;
>  
>  struct dell_wmi_priv {
>  	struct input_dev *input_dev;
> +	struct input_dev *tabletswitch_dev;
>  	u32 interface_version;
>  };
>  
> @@ -309,6 +310,9 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
>   * Keymap for WMI events of type 0x0011
>   */
>  static const struct key_entry dell_wmi_keymap_type_0011[] = {
> +	/* Reflex keyboard switch on 2n1 devices */
> +	{ KE_IGNORE, 0xe070, { KEY_RESERVED } },
> +
>  	/* Battery unplugged */
>  	{ KE_IGNORE, 0xfff0, { KEY_RESERVED } },
>  
> @@ -340,21 +344,55 @@ static const struct key_entry dell_wmi_keymap_type_0011[] = {
>   * They are events with extended data
>   */
>  static const struct key_entry dell_wmi_keymap_type_0012[] = {
> +	/* Ultra-performance mode switch request */
> +	{ KE_IGNORE, 0x000d, { KEY_RESERVED } },
> +
>  	/* Fn-lock button pressed */
>  	{ KE_IGNORE, 0xe035, { KEY_RESERVED } },
>  };
>  
> -static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
> +static void dell_wmi_switch_event(struct input_dev **subdev,
> +				  const char *devname,
> +				  int switchid,
> +				  int value)
> +{
> +	if (!*subdev) {
> +		struct input_dev *dev = input_allocate_device();
> +
> +		if (!dev) {
> +			pr_warn("could not allocate device for %s\n", devname);
> +			return;
> +		}
> +		__set_bit(EV_SW, (dev)->evbit);
> +		__set_bit(switchid, (dev)->swbit);
> +
> +		(dev)->name = devname;
> +		(dev)->id.bustype = BUS_HOST;
> +		if (input_register_device(dev)) {
> +			input_free_device(dev);
> +			pr_warn("could not register device for %s\n", devname);
> +			return;
> +		}
> +		*subdev = dev;
> +	}
> +
> +	input_report_switch(*subdev, switchid, value);
> +	input_sync(*subdev);
> +}
> +
> +static int dell_wmi_process_key(struct wmi_device *wdev, int type, int code, u16 *buffer, int remaining)
>  {
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  	const struct key_entry *key;
> +	int used = 0;
> +	int value = 1;
>  
>  	key = sparse_keymap_entry_from_scancode(priv->input_dev,
>  						(type << 16) | code);
>  	if (!key) {
>  		pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n",
>  			type, code);
> -		return;
> +		return 0;
>  	}
>  
>  	pr_debug("Key with type 0x%04x and code 0x%04x pressed\n", type, code);
> @@ -363,16 +401,27 @@ static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
>  	if ((key->keycode == KEY_BRIGHTNESSUP ||
>  	     key->keycode == KEY_BRIGHTNESSDOWN) &&
>  	    acpi_video_handles_brightness_key_presses())
> -		return;
> +		return 0;
>  
>  	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
> -		return;
> +		return 0;
>  
> -	if (key->keycode == KEY_KBDILLUMTOGGLE)
> +	if (key->keycode == KEY_KBDILLUMTOGGLE) {
>  		dell_laptop_call_notifier(
>  			DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED, NULL);
> +	} else if (type == 0x0011 && code == 0xe070 && remaining > 0) {
> +		dell_wmi_switch_event(&priv->tabletswitch_dev,
> +				      "Dell tablet mode switch",
> +				      SW_TABLET_MODE, !buffer[0]);
> +		return 1;
> +	} else if (type == 0x0012 && code == 0x000d && remaining > 0) {
> +		value = (buffer[2] == 2);
> +		used = 1;
> +	}
>  
> -	sparse_keymap_report_entry(priv->input_dev, key, 1, true);
> +	sparse_keymap_report_entry(priv->input_dev, key, value, true);
> +
> +	return used;
>  }
>  
>  static void dell_wmi_notify(struct wmi_device *wdev,
> @@ -430,21 +479,26 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  		case 0x0000: /* One key pressed or event occurred */
>  			if (len > 2)
>  				dell_wmi_process_key(wdev, buffer_entry[1],
> -						     buffer_entry[2]);
> +						     buffer_entry[2],
> +						     buffer_entry + 3,
> +						     len - 3);
>  			/* Extended data is currently ignored */
>  			break;
>  		case 0x0010: /* Sequence of keys pressed */
>  		case 0x0011: /* Sequence of events occurred */
>  			for (i = 2; i < len; ++i)
> -				dell_wmi_process_key(wdev, buffer_entry[1],
> -						     buffer_entry[i]);
> +				i += dell_wmi_process_key(wdev, buffer_entry[1],
> +							  buffer_entry[i],
> +							  buffer_entry + i,
> +							  len - i - 1);
>  			break;
>  		case 0x0012:
>  			if ((len > 4) && dell_privacy_process_event(buffer_entry[1], buffer_entry[3],
>  								    buffer_entry[4]))
>  				/* dell_privacy_process_event has handled the event */;
>  			else if (len > 2)
> -				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2]);
> +				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2],
> +						     buffer_entry + 3, len - 3);
>  			break;
>  		default: /* Unknown event */
>  			pr_info("Unknown WMI event type 0x%x\n",
> @@ -661,6 +715,8 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
>  	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  
>  	input_unregister_device(priv->input_dev);
> +	if (priv->tabletswitch_dev)
> +		input_unregister_device(priv->tabletswitch_dev);
>  }
>  
>  /*
> 

