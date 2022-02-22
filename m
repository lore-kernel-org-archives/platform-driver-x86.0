Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F03FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 16:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiBVQOU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 11:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiBVQOU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 11:14:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 61B931662CD
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 08:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645546433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jV5twxVz9/AezrmuSl10frNEHAKL0eRhNoZ4DlEO800=;
        b=XZIdT+l4Zt34D5nlICbn/f+ibq0jR3g1ptHK+eomMeps8fyL6CB+NJ8EN7FjkYHDcZnj+O
        XJh4sCMKaXhmXS/F7reCc2fj69PtiW3RRyA+c4vNfWvnc9OAwndrh6GZvwUIQY+Qav2I+H
        DpXm3jT+MqcfceXNJTFsPgWriOBFsxE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-DGuknR6jPGWnUiK8Cu8eXQ-1; Tue, 22 Feb 2022 11:13:51 -0500
X-MC-Unique: DGuknR6jPGWnUiK8Cu8eXQ-1
Received: by mail-ej1-f70.google.com with SMTP id kw5-20020a170907770500b006ba314a753eso5948247ejc.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 08:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jV5twxVz9/AezrmuSl10frNEHAKL0eRhNoZ4DlEO800=;
        b=riD8+rBRy5H26sNT/jL7ApP/fauAJ7DA6YWx/sx2YXElSZMoQKnbGEIZGdOl6CY5d2
         9RGFPEOnUrDZ1ZUP4UJti0pma9KY4gWtLis7iB5fpyudhUTrmzjyjGVyULNRlJDoLe52
         p/Qqj3bm1Asvo53dp7YET867amTo/WIouRvBvJH3T3wYDSRwfOl93nLqInrTMIcu16JY
         xteT/4Iy3SMvdQ+3fplJD/bagPvyjPvnWqE9H8yUr2GlXhXJwc2uzk/EMdmYf3Eh4iXG
         cKATakchFzlYL5eJs+oDQpxy2KcqDhh9Wdn1bktqYbn7zBoeCeNA3AZPOJKSPiBMPeUN
         Wx+Q==
X-Gm-Message-State: AOAM530ElI9CDVt69kuQnx0cNe6welaRA63e/UWtyOyBA6Z2ff1Isw5G
        3wRdxeNG4A0iKxiSTBnZm3o50CoN4mSJN9vrCzCYe4wXkWEkiFGRs81IVAAdA3R625E9eQ2mx0a
        ta12lPpIOAXiTnevsC/0rtMKftTcR7d08yA==
X-Received: by 2002:a05:6402:148d:b0:410:b099:86f1 with SMTP id e13-20020a056402148d00b00410b09986f1mr27916496edv.273.1645546430428;
        Tue, 22 Feb 2022 08:13:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK3X0frG6EYvjIRQTAl06GNH4yMEBmTGpGqrXs0GHxqTZXlrMvXq7ht/ckUr9tjG41HswO3w==
X-Received: by 2002:a05:6402:148d:b0:410:b099:86f1 with SMTP id e13-20020a056402148d00b00410b09986f1mr27916466edv.273.1645546430090;
        Tue, 22 Feb 2022 08:13:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id k13sm6497538edh.30.2022.02.22.08.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 08:13:49 -0800 (PST)
Message-ID: <8b162817-f141-6974-7559-230879ea7ada@redhat.com>
Date:   Tue, 22 Feb 2022 17:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] Fix SW_TABLET_MODE detection method
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220218160907.3422-1-jorge.lopez2@hp.com>
 <20220218160907.3422-2-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220218160907.3422-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 2/18/22 17:09, Jorge Lopez wrote:
> The purpose of this patch is to introduce a fix and removal
> of the current hack when determining tablet mode status.
> 
> Determining the tablet mode status requires reading Byte 0 bit 2 and 3
> as reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
> failure was rooted in two areas; HPWMI_HARDWARE_QUERY failure (0x05)
> and reading Byte 0, bit 2 only to determine the table mode status.
> HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value invalid.
> 
> All changes were validated on a ZBook Workstation notebook.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 48a46466f086..544fce906ce7 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -35,9 +35,6 @@ MODULE_LICENSE("GPL");
>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>  
> -static int enable_tablet_mode_sw = -1;
> -module_param(enable_tablet_mode_sw, int, 0444);
> -MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
>  
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> @@ -127,6 +124,7 @@ enum hp_wmi_command {
>  enum hp_wmi_hardware_mask {
>  	HPWMI_DOCK_MASK		= 0x01,
>  	HPWMI_TABLET_MASK	= 0x04,
> +	HPWMI_DETACHABLE_MASK	= 0x08,
>  };
>  
>  struct bios_return {
> @@ -347,12 +345,19 @@ static int hp_wmi_read_int(int query)
>  
>  static int hp_wmi_hw_state(int mask)
>  {
> -	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
> +	int state = 0, ret;
>  
> -	if (state < 0)
> -		return state;
> +	ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
> +				   0, sizeof(state));
>  
> -	return !!(state & mask);
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	/* determine if Detachable mode is enabled */
> +	if (HPWMI_TABLET_MASK == mask)
> +		state = (state & HPWMI_DETACHABLE_MASK );

If you do: "state &= 0x08" as you do here
then after that "state & HPWMI_TABLET_MASK" aka
"state & 0x04" as done below will always be 0
since you have masked out the 0x04 bit when applying
the 0x08 mask.

I think you probably want something like this instead:

	if (HPWMI_TABLET_MASK == mask)
		if (!(state & HPWMI_DETACHABLE_MASK))
			return 0;

So when asked to check the HPWMI_TABLET_MASK then if
the device is not a detachable always return 0,
does that sound right ?

Note it is probable better to just makes this a generic
helper which no longer takes the mask and let the caller
handle all this. Or maybe just remove this function all
together since if you remove the masking I don't think
there will be much left of it.





> +
> +	return (state & mask);
>  }
>  
>  static int omen_thermal_profile_set(int mode)
> @@ -781,18 +786,16 @@ static int __init hp_wmi_input_setup(void)
>  
>  	/* Dock */
>  	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
> -	if (!(val < 0)) {
> +	if (val > 0) {
>  		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
>  		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
>  	}

I'm not sure why you made this change here, the original code here
actually is correct. This:

		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);

tells userspace that the input-device has a SW_DOCK switch,
where as this:

  		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);

Set the initial value of the dock-switch.

After your change we will not only do this bit:

		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);

When the machine is docked at boot, which means that if it
gets docked later we will not report it since SW_DOCK is
never set in hp_wmi_input_dev->swbit in that case
(swbit must be initialized before registering the input-device).


>  
>  	/* Tablet mode */
> -	if (enable_tablet_mode_sw > 0) {
> -		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> -		if (val >= 0) {
> -			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> +	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> +	if (val > 0) {
> +		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
>  			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
> -		}
>  	}

Dropping the module option is fine, but otherwise this needs to be changed.

I think we want something like this here:

	err = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &val, 0, sizeof(val));

	if (!err) {
		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
		input_report_switch(hp_wmi_input_dev, SW_DOCK, (val & HPWMI_DOCK_MASK));
	}

	if (!err && (val & HPWMI_DETACHABLE_MASK)) {
		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, (val & HPWMI_TABLET_MASK));
	}

This also avoids unnecessarily doing the HPWMI_HARDWARE_QUERY twice.

And we probably want something similar in hp_wmi_notify() case HPWMI_DOCK_EVENT:
to also avoid unnecessarily doing the HPWMI_HARDWARE_QUERY twice there.

Regards,

Hans


Reg

