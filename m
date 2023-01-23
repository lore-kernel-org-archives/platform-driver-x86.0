Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F129C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjAWNde (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjAWNde (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0B3F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674480763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4eVcLiMRTNGc9RZrnMABtj5RnG9xY1jbpv8mppSmEp0=;
        b=JTEhtBTIUnPLwc/+l6QGdIU3yiHCMpL4c3sW2yvqn5C15sBtyxUH+XPV6O6xnj8IwPuMWs
        NeOa5zWoWV0bM3vrULKcPVPA334FHzj3xmWHXSm+ubolYzX5QHSHC0Xs4IciW6X8FYEIVl
        GqH/yBNaTOU/hQaTrwTvzNDsKeDayTM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-ZqpBzPguM4mbrTYwqNxWsg-1; Mon, 23 Jan 2023 08:32:42 -0500
X-MC-Unique: ZqpBzPguM4mbrTYwqNxWsg-1
Received: by mail-ej1-f70.google.com with SMTP id fx8-20020a170906b74800b00877a89f965aso4154324ejb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eVcLiMRTNGc9RZrnMABtj5RnG9xY1jbpv8mppSmEp0=;
        b=vA63F/ZwziTU78HS25bMcRQKT6slVK9TJ6Xzt5U4izY/d2+aoyBacz55n2YBf/vp4x
         ODzbBTqn4bLkyJeBMYfODuQQdEjHVa3ngGre/q8an3qKwrg7q46AYKw+w9sAad6m9XZj
         cHAlv8+htI4awg61D4GsN0hkaaugt9G7+Dnhv7xL4GZ+4rSxx/ENcIz0M3Pg2TUZsmvW
         bZ9A3j62cFzVjggLLdLT100X1OF/zCmbcxqR72+L1BrHO3rBwU29MjAh9LJetIRak5Ke
         x3tAZVXGnJKjeCRbJGJPKwLAm8GnR6Aa9ufwO3yAwXty90sHosyJ8Pvdqh0WJVesAODc
         OC8g==
X-Gm-Message-State: AFqh2kprR+Ks5V+ZRiJcWgDhcC638ij6TjPu7kD/MtCPN32lXAA+4iv0
        BOnmrN8OWvzm3mIv4syn55RXCQYtFdNQEx3eHqjMD/kLEW5UPbJgcV0jwunm43VwDYXigFAAJHR
        YrZzP4hPEDTdIxvB5b/7C2Js+4q8XRX8Y0g==
X-Received: by 2002:a17:906:4d89:b0:86f:57d3:e3a7 with SMTP id s9-20020a1709064d8900b0086f57d3e3a7mr24278227eju.48.1674480759703;
        Mon, 23 Jan 2023 05:32:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvC81R9tZpJ65aMGdZeENwiF1nbY/W2/d3f2eyACNqxIKpMZHfiN5hh5bwE8Q7La81dShIf8g==
X-Received: by 2002:a17:906:4d89:b0:86f:57d3:e3a7 with SMTP id s9-20020a1709064d8900b0086f57d3e3a7mr24278218eju.48.1674480759466;
        Mon, 23 Jan 2023 05:32:39 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b0084c4b87a69csm22111132ejc.153.2023.01.23.05.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:32:38 -0800 (PST)
Message-ID: <919e1992-e1ca-cc7f-fcc1-23a01993b4b8@redhat.com>
Date:   Mon, 23 Jan 2023 14:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: hp-wmi: Handle Omen Key event
Content-Language: en-US
To:     Rishit Bansal <rishitbansal0@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Y8cjgu1ql+5+/NST@rishit-OMEN-Laptop-15-en0xxx>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8cjgu1ql+5+/NST@rishit-OMEN-Laptop-15-en0xxx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/17/23 23:38, Rishit Bansal wrote:
> Add support to map the "HP Omen Key" to KEY_PROG2. Laptops in the HP
> Omen Series open the HP Omen Command Center application on windows. But,
> on linux it fails with the following message from the hp-wmi driver:
> 
> [ 5143.415714] hp_wmi: Unknown event_id - 29 - 0x21a5
> 
> Signed-off-by: Rishit Bansal <rishitbansal0@gmail.com>

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
>  drivers/platform/x86/hp/hp-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0a99058be813..d8ba3c483901 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -91,6 +91,7 @@ enum hp_wmi_event_ids {
>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>  	HPWMI_SANITIZATION_MODE		= 0x17,
>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
> +	HPWMI_OMEN_KEY				= 0x1D,
>  };
>  
>  /*
> @@ -219,6 +220,7 @@ static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
>  	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
>  	{ KE_KEY, 0x231b,  { KEY_HELP } },
> +	{ KE_KEY, 0x21a5,  { KEY_PROG2 }}, /* HP Omen Key */
>  	{ KE_END, 0 }
>  };
>  
> @@ -810,6 +812,7 @@ static void hp_wmi_notify(u32 value, void *context)
>  	case HPWMI_SMART_ADAPTER:
>  		break;
>  	case HPWMI_BEZEL_BUTTON:
> +	case HPWMI_OMEN_KEY:
>  		key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
>  		if (key_code < 0)
>  			break;

