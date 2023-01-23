Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCB2C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjAWN4B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjAWN4A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6C214221
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674482118;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hAfU51i6h1AKqDjTc93qMy/AcUh5PR71ti/ig/qkQVo=;
        b=W09PP4mNIZTpCzzxmzPapLIm1p6P1M1em4wP6RGbLkHlGUFiFPjEPS+D4yft7SDCOM3xWY
        TtOGXlvz/TgFp3YViwSSQ8hyrwY7Z4DLjRq0bBWKzlUukmHcApflx2gk2u9Rikw9RkopFT
        oIwoQp7/YEk+ar0UKFnnoavgPuhJXeA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-YU1k4naqMBSlyZep1J-YdA-1; Mon, 23 Jan 2023 08:55:17 -0500
X-MC-Unique: YU1k4naqMBSlyZep1J-YdA-1
Received: by mail-ej1-f72.google.com with SMTP id sa32-20020a1709076d2000b0084d4593797eso7772704ejc.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAfU51i6h1AKqDjTc93qMy/AcUh5PR71ti/ig/qkQVo=;
        b=qSORkwXJls9SVErrVPEFnc/2kFleKZb5IzdkRJtyBdDUYuu+jhZ4OUmykvz6ST5+1n
         c46r9CNSySKYNiKe7Czw24AxfeK/yXNao2r/Jg4d7Iaxb5AkADz5/eghKQlz81ePE8tL
         yQFThDiPR2gZoa8BWMWo/oMy8Eidgx0/kFpJ6jxHti4aRWdi8iU/OQw7vXANGNQF8gdm
         149jMAPbf9hWdgvRTBz9/WwrCwz/BfeEG5AY0bATZPnwxqtgZEpVXG64RB9c4AqnmcD/
         5CZ2GM0W2eZtnY0MFVwQ5tZJJjnespx0DlYLZZtJIv9lUQw28/fikbZf5b9ywgH1GdQF
         4LZQ==
X-Gm-Message-State: AFqh2koFG4+0ngxwyB/7E5JrRgRi4oHEHaNOu4o4yGIDPWkCJEGlyM8o
        i7Y2nFH0vF92khEASrXXF8bcHwnxadHQy6v7oQVMC9WAkkKrMeN8eNORHGrRkybR80UdThgAuRu
        OZmV9VfhRepM4U1zP/gH/oGA3Cut+h6Ru5w==
X-Received: by 2002:a05:6402:138c:b0:499:b53f:1c56 with SMTP id b12-20020a056402138c00b00499b53f1c56mr24771246edv.38.1674482116437;
        Mon, 23 Jan 2023 05:55:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6Cs76d400bpnW0BaVuJZ3pPDbiiXsD8B9T6K1dY/QrG2pbjBeP06fatkrTTY9bw+L9N0OOg==
X-Received: by 2002:a05:6402:138c:b0:499:b53f:1c56 with SMTP id b12-20020a056402138c00b00499b53f1c56mr24771230edv.38.1674482116206;
        Mon, 23 Jan 2023 05:55:16 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ed6-20020a056402294600b00499e5659988sm16090939edb.68.2023.01.23.05.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:55:15 -0800 (PST)
Message-ID: <3e00de1c-4dc8-3032-b085-824056529b73@redhat.com>
Date:   Mon, 23 Jan 2023 14:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch
 reporting
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20230120143441.527334-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230120143441.527334-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/20/23 15:34, Hans de Goede wrote:
> Commit 1ea0d3b46798 ("platform/x86: asus-wmi: Simplify tablet-mode-switch
> handling") unified the asus-wmi tablet-switch handling, but it did not take
> into account that the value returned for the kbd_dock_devid WMI method is
> inverted where as the other ones are not inverted.
> 
> This causes asus-wmi to report an inverted tablet-switch state for devices
> which use the kbd_dock_devid, which causes libinput to ignore touchpad
> events while the affected T10x model 2-in-1s are docked.
> 
> Add inverting of the return value in the kbd_dock_devid case to fix this.
> 
> Fixes: 1ea0d3b46798 ("platform/x86: asus-wmi: Simplify tablet-mode-switch handling")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have added this to my review-hans branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 104188d70988..1038dfdcdd32 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -225,6 +225,7 @@ struct asus_wmi {
>  
>  	int tablet_switch_event_code;
>  	u32 tablet_switch_dev_id;
> +	bool tablet_switch_inverted;
>  
>  	enum fan_type fan_type;
>  	enum fan_type gpu_fan_type;
> @@ -493,6 +494,13 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>  }
>  
>  /* Input **********************************************************************/
> +static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
> +{
> +	input_report_switch(asus->inputdev, SW_TABLET_MODE,
> +			    asus->tablet_switch_inverted ? !value : value);
> +	input_sync(asus->inputdev);
> +}
> +
>  static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
>  {
>  	struct device *dev = &asus->platform_device->dev;
> @@ -501,7 +509,7 @@ static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event
>  	result = asus_wmi_get_devstate_simple(asus, dev_id);
>  	if (result >= 0) {
>  		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> -		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> +		asus_wmi_tablet_sw_report(asus, result);
>  		asus->tablet_switch_dev_id = dev_id;
>  		asus->tablet_switch_event_code = event_code;
>  	} else if (result == -ENODEV) {
> @@ -534,6 +542,7 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>  	case asus_wmi_no_tablet_switch:
>  		break;
>  	case asus_wmi_kbd_dock_devid:
> +		asus->tablet_switch_inverted = true;
>  		asus_wmi_tablet_sw_init(asus, ASUS_WMI_DEVID_KBD_DOCK, NOTIFY_KBD_DOCK_CHANGE);
>  		break;
>  	case asus_wmi_lid_flip_devid:
> @@ -573,10 +582,8 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>  		return;
>  
>  	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
> -	if (result >= 0) {
> -		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> -		input_sync(asus->inputdev);
> -	}
> +	if (result >= 0)
> +		asus_wmi_tablet_sw_report(asus, result);
>  }
>  
>  /* dGPU ********************************************************************/

