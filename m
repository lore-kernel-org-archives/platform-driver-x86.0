Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54B6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 10:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiKUKUO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiKUKUN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 05:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD1A8CF0D
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669025950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+190EvLFQt36QwwjQnDgJqhbzPJQqNgXZwpiS/bb6is=;
        b=WT/eRjSRZYpAH55JtFboCmDGWPcMU5Qp3GymRJTbbrZF7tBp3bJevu5NDcS2RI2RwjNp6Q
        O5EOlYtPWIxuIT0CEeWSP9gAWWCZ3C+VSukN+159YJXdpMeL87hbUALx2HMtAAMqxXk0tz
        X1XHAYdY6Y5gw4aePfanXfdwguIAaRc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-us4clnprN7u_teMfBy11Ig-1; Mon, 21 Nov 2022 05:19:06 -0500
X-MC-Unique: us4clnprN7u_teMfBy11Ig-1
Received: by mail-ed1-f72.google.com with SMTP id g14-20020a056402090e00b0046790cd9082so6603730edz.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+190EvLFQt36QwwjQnDgJqhbzPJQqNgXZwpiS/bb6is=;
        b=p3Nm2o9kv6xYmDqXBJw2sYbfL7wT9VMpO7kK+D818wAf7GPskXybVx+pDZFBs/n27i
         WDQQ8IdGCIi2G5L8SLPCkvOur+9VFU/VHgxCkJIK7V3i0OhlYGoW2oofp2pNFxkODf5t
         qRGPqTrYOOzkdbN2hSSJQEYVQKaha5AyS4QbbPd31R61Iva0h3I3tx3lONmtTcbYNT9h
         gx0ITg08qu+jpsSqYGR1AZ05SJwj16Bn5EoqfmwJR+hhGdkBUaOPKKzwwWTCXfaM5v+M
         v2vlKvUzI0khkDfLaJYe6WHFyfJSCCKo+bf/c2JzoIk/dtNWKthIYvx2yLKj2RafKU3b
         z8DQ==
X-Gm-Message-State: ANoB5pl4+ZoIqTmieBpxQRzklsSpi8mSKQTd2xI1hKYzxfQEugV8z5Hv
        lT7qmN1SoQ1Q/jORmJo3im5qm9VgZVn0cCU2KMx2k2VHV6AWyhi7uagX+lRYqYgaqsTRS3AQei2
        c/vjZb8YiNrZV9EAevQQCLOsvNGL2zpDQPg==
X-Received: by 2002:a05:6402:28a9:b0:461:f5ce:a478 with SMTP id eg41-20020a05640228a900b00461f5cea478mr15511121edb.304.1669025945000;
        Mon, 21 Nov 2022 02:19:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7arJakm1YhvDrKOiofiBKpK2u7KzFGl+QYDL0V5eGdTzyj4035YlKY5iT/sLNAzI62KOIEWg==
X-Received: by 2002:a05:6402:28a9:b0:461:f5ce:a478 with SMTP id eg41-20020a05640228a900b00461f5cea478mr15511106edb.304.1669025944705;
        Mon, 21 Nov 2022 02:19:04 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v27-20020a17090606db00b0078175601630sm4841846ejb.79.2022.11.21.02.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:19:04 -0800 (PST)
Message-ID: <83bc07a4-6989-c1c6-276f-d83acbd740c0@redhat.com>
Date:   Mon, 21 Nov 2022 11:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/intel/hid: Add module-params for 5 button
 array + SW_TABLET_MODE reporting
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221120224820.746478-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221120224820.746478-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 11/20/22 23:48, Hans de Goede wrote:
> The driver has DMI-quirk tables for force-enabling 5 button array support
> and for 2 different ways of enabling SW_TABLET_MODE reporting.
> 
> Add module parameters to allow user to enable the driver behavior currently
> only available through DMI quirks.
> 
> This is useful for users to test this in bug-reports and for users to use
> as a workaround while new DMI quirks find their way upstream.
> 
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/822
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have added this to my review-hans branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/intel/hid.c | 36 +++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index b6313ecd190c..b6c06b37862e 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -16,6 +16,25 @@
>  #include <linux/suspend.h>
>  #include "../dual_accel_detect.h"
>  
> +enum intel_hid_tablet_sw_mode {
> +	TABLET_SW_AUTO = -1,
> +	TABLET_SW_OFF  = 0,
> +	TABLET_SW_AT_EVENT,
> +	TABLET_SW_AT_PROBE,
> +};
> +
> +static bool enable_5_button_array;
> +module_param(enable_5_button_array, bool, 0444);
> +MODULE_PARM_DESC(enable_5_button_array,
> +	"Enable 5 Button Array support. "
> +	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
> +
> +static int enable_sw_tablet_mode = TABLET_SW_AUTO;
> +module_param(enable_sw_tablet_mode, int, 0444);
> +MODULE_PARM_DESC(enable_sw_tablet_mode,
> +	"Enable SW_TABLET_MODE reporting -1:auto 0:off 1:at-first-event 2:at-probe. "
> +	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
> +
>  /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
>  #define TABLET_MODE_FLAG BIT(6)
>  
> @@ -157,7 +176,6 @@ struct intel_hid_priv {
>  	struct input_dev *array;
>  	struct input_dev *switches;
>  	bool wakeup_mode;
> -	bool auto_add_switch;
>  };
>  
>  #define HID_EVENT_FILTER_UUID	"eeec56b3-4442-408f-a792-4edd4d758054"
> @@ -487,7 +505,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	 * SW_TABLET_MODE report, in these cases we enable support when receiving
>  	 * the first event instead of during driver setup.
>  	 */
> -	if (!priv->switches && priv->auto_add_switch && (event == 0xcc || event == 0xcd)) {
> +	if (!priv->switches && enable_sw_tablet_mode == TABLET_SW_AT_EVENT &&
> +	    (event == 0xcc || event == 0xcd)) {
>  		dev_info(&device->dev, "switch event received, enable switches supports\n");
>  		err = intel_hid_switches_setup(device);
>  		if (err)
> @@ -592,7 +611,7 @@ static bool button_array_present(struct platform_device *device)
>  			return true;
>  	}
>  
> -	if (dmi_check_system(button_array_table))
> +	if (enable_5_button_array || dmi_check_system(button_array_table))
>  		return true;
>  
>  	return false;
> @@ -629,7 +648,14 @@ static int intel_hid_probe(struct platform_device *device)
>  	dev_set_drvdata(&device->dev, priv);
>  
>  	/* See dual_accel_detect.h for more info on the dual_accel check. */
> -	priv->auto_add_switch = dmi_check_system(dmi_auto_add_switch) && !dual_accel_detect();
> +	if (enable_sw_tablet_mode == TABLET_SW_AUTO) {
> +		if (dmi_check_system(dmi_vgbs_allow_list))
> +			enable_sw_tablet_mode = TABLET_SW_AT_PROBE;
> +		else if (dmi_check_system(dmi_auto_add_switch) && !dual_accel_detect())
> +			enable_sw_tablet_mode = TABLET_SW_AT_EVENT;
> +		else
> +			enable_sw_tablet_mode = TABLET_SW_OFF;
> +	}
>  
>  	err = intel_hid_input_setup(device);
>  	if (err) {
> @@ -646,7 +672,7 @@ static int intel_hid_probe(struct platform_device *device)
>  	}
>  
>  	/* Setup switches for devices that we know VGBS return correctly */
> -	if (dmi_check_system(dmi_vgbs_allow_list)) {
> +	if (enable_sw_tablet_mode == TABLET_SW_AT_PROBE) {
>  		dev_info(&device->dev, "platform supports switches\n");
>  		err = intel_hid_switches_setup(device);
>  		if (err)

