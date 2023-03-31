Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4223C76196
	for <platform-driver-x86@archiver.kernel.org>; Fri, 31 Mar 2023 17:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbjCaRjN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 31 Mar 2023 13:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjCaRjN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Mar 2023 13:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659311EFE4
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680284295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GYDHqdmMfVO2N43YvDMG75Acr8Ym/PPCssHQCbfBDWc=;
        b=XyJFXESiZCLWHHkyaMI+O2tqp5ybgARYDyLA4oYv+FVOOSvMYEmydPFdOVdL/x96Rda7FA
        bqkV9kDjkpO84Hs9BhKvTDzVnlWtrJ87fjMAh54Rc/YWDWfTYQfN8BGTF18RQXT/fj3+je
        qBbTy4mUTsKEnrtGeKMce26YrbHRxzI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-SAQoyXdVM5O9DSFWilCmPw-1; Fri, 31 Mar 2023 13:38:13 -0400
X-MC-Unique: SAQoyXdVM5O9DSFWilCmPw-1
Received: by mail-ed1-f70.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so33288774edc.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Mar 2023 10:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284290;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYDHqdmMfVO2N43YvDMG75Acr8Ym/PPCssHQCbfBDWc=;
        b=HY9C/6CqNq6wgxvFY8LKnZOd3EvrJ6TjnOf+IiIKxVGDybazfy/ZB8jw0nlSTEJ2ia
         Wos+llzjBH4ddBOvCFGTTw6+GXI/g3CkBC6h822M3hMSd1KBLAQXy8IBvYEGhFCEkw+c
         nNdg0VVt43QX5JDtFgwDq6A5BIOWYDHQNBf7uE3T3xJwMkT8arDwp//43Bww9cq8FKGb
         ESk7bobg+FEPmHD+hknHaGFZPqZ5fo4XFPsb5O3tNqwWXeT7MYI+H204bssZPHzEUXiW
         aazp8bh7HeFsiyQPgqdxqDNAfKyQCreiTwREWnug1PH+f12KKikj+88nXCxwWRoolU2p
         yYRw==
X-Gm-Message-State: AAQBX9di+bwm7K4MjpyhhmsIKUsSvOpAqfMXVY+ulblor2yL3tV6OOU+
        jhnjh3nav3xCXl+yqCzBBqYu+lVm/HDEidZV4s4u2WHgmXktrr1PJzNzpdrUW61CC1GjIc3mx5h
        jWKYjAbsqEHO3XPgK5FalNngShvVvlCxj1A==
X-Received: by 2002:a17:907:7701:b0:92f:efdc:610e with SMTP id kw1-20020a170907770100b0092fefdc610emr26616095ejc.66.1680284290012;
        Fri, 31 Mar 2023 10:38:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350bttAblxAzeVcv520ae+I7/Dlz6cMxJmSXfGpZ2P5VuH7+8SybGtIrMlnlsSiHxo/ZcaYrqzA==
X-Received: by 2002:a17:907:7701:b0:92f:efdc:610e with SMTP id kw1-20020a170907770100b0092fefdc610emr26616077ejc.66.1680284289697;
        Fri, 31 Mar 2023 10:38:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906c19300b0093313f4fc3csm1182565ejz.70.2023.03.31.10.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 10:38:09 -0700 (PDT)
Message-ID: <7d386897-76a5-976b-e8ed-6e576f8e3ac9@redhat.com>
Date:   Fri, 31 Mar 2023 19:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop sending
 KEY_TOUCHPAD_TOGGLE
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <20230330194644.64628-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230330194644.64628-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/30/23 21:46, Hans de Goede wrote:
> Commit 5829f8a897e4 ("platform/x86: ideapad-laptop: Send
> KEY_TOUCHPAD_TOGGLE on some models") made ideapad-laptop send
> KEY_TOUCHPAD_TOGGLE when we receive an ACPI notify with VPC event bit 5 set
> and the touchpad-state has not been changed by the EC itself already.
> 
> This was done under the assumption that this would be good to do to make
> the touchpad-toggle hotkey work on newer models where the EC does not
> toggle the touchpad on/off itself (because it is not routed through
> the PS/2 controller, but uses I2C).
> 
> But it turns out that at least some models, e.g. the Yoga 7-15ITL5 the EC
> triggers an ACPI notify with VPC event bit 5 set on resume, which would
> now cause a spurious KEY_TOUCHPAD_TOGGLE on resume to which the desktop
> environment responds by disabling the touchpad in software, breaking
> the touchpad (until manually re-enabled) on resume.
> 
> It was never confirmed that sending KEY_TOUCHPAD_TOGGLE actually improves
> things on new models and at least some new models like the Yoga 7-15ITL5
> don't have a touchpad on/off toggle hotkey at all, while still sending
> ACPI notify events with VPC event bit 5 set.
> 
> So it seems best to revert the change to send KEY_TOUCHPAD_TOGGLE when
> receiving an ACPI notify events with VPC event bit 5 and the touchpad
> state as reported by the EC has not changed.
> 
> Note this is not a full revert the code to cache the last EC touchpad
> state is kept to avoid sending spurious KEY_TOUCHPAD_ON / _OFF events
> on resume.
> 
> Fixes: 5829f8a897e4 ("platform/x86: ideapad-laptop: Send KEY_TOUCHPAD_TOGGLE on some models")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217234
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've applied this patch to my fixes branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/ideapad-laptop.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index b5ef3452da1f..35c63cce0479 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1170,7 +1170,6 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,  65, { KEY_PROG4 } },
>  	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
>  	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
> -	{ KE_KEY,  68, { KEY_TOUCHPAD_TOGGLE } },
>  	{ KE_KEY, 128, { KEY_ESC } },
>  
>  	/*
> @@ -1526,18 +1525,16 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>  	if (priv->features.ctrl_ps2_aux_port)
>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>  
> -	if (send_events) {
> -		/*
> -		 * On older models the EC controls the touchpad and toggles it
> -		 * on/off itself, in this case we report KEY_TOUCHPAD_ON/_OFF.
> -		 * If the EC did not toggle, report KEY_TOUCHPAD_TOGGLE.
> -		 */
> -		if (value != priv->r_touchpad_val) {
> -			ideapad_input_report(priv, value ? 67 : 66);
> -			sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
> -		} else {
> -			ideapad_input_report(priv, 68);
> -		}
> +	/*
> +	 * On older models the EC controls the touchpad and toggles it on/off
> +	 * itself, in this case we report KEY_TOUCHPAD_ON/_OFF. Some models do
> +	 * an acpi-notify with VPC bit 5 set on resume, so this function get
> +	 * called with send_events=true on every resume. Therefor if the EC did
> +	 * not toggle, do nothing to avoid sending spurious KEY_TOUCHPAD_TOGGLE.
> +	 */
> +	if (send_events && value != priv->r_touchpad_val) {
> +		ideapad_input_report(priv, value ? 67 : 66);
> +		sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
>  	}
>  
>  	priv->r_touchpad_val = value;

