Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE38C54EBC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 16:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjALQc1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 11:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237845AbjALQbq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 11:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6223FD2EE
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 08:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673540987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O0OH3WoUZtlJWytNVkd+7kJbIE1e1QffDyVbRGw3YjM=;
        b=TIpetVI+zXtnq8Qeg4pqm/aFuQhLjt3CaPX8idvBqrPEYaQHSmXhYhzYJe050L0QV7b/2Y
        kUIvUGs2hKKEKC4KLYAKso2rMB++uxA/iiOh+SKZccD4tLi2Z4ogriXg0afR6PwqXbwrQ0
        pGZ3FMDA2aRzJA4WVh57blfhRzD+aLw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-pidnfAaDM-CtQg96-2WoGQ-1; Thu, 12 Jan 2023 11:29:46 -0500
X-MC-Unique: pidnfAaDM-CtQg96-2WoGQ-1
Received: by mail-ej1-f70.google.com with SMTP id dn11-20020a17090794cb00b007c14ea70afcso12923365ejc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 08:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0OH3WoUZtlJWytNVkd+7kJbIE1e1QffDyVbRGw3YjM=;
        b=neHfPsovJtmIIa/oI2tGr1zpxBp45k3dkPio1QKx06o50eXkMVsJAWQZyvfnmWvSO8
         B4mRbpwL09jh+tGzKV87Z/HnXErfCY4w76mAmlxUJv8FUoKCjR2tmvLl6WYY6474/Isf
         BpIxmY1NljWFluSIeNqdIECqqeMj7uTR4ScxYUHgo2XyZYSNMyRvCZ3DBCO2GLhuItnX
         HCLz8A3R+gXVj4LmqHPkbK74j3g1LXM4GOB9S7UEiNvXgI4GQoe87jXtzpK1aT+/2+tj
         MM3fmpLyTQpZgU1iezPQDBieZ5a7b4SdNs31c+9JnoemazTQDiokGwUlwgxnr5BWttOa
         k5Jg==
X-Gm-Message-State: AFqh2krNGQsNn/BNyOh8ac5sStOXHMjfP9yFRdrgjcrFtJQKf7tJeIR2
        LlEpYPXpnEbKnWkl3KafpWELIXyaa/EfxOnk0vpSUiznv82Ih9eYp9bZpbhduqmPQIad6/24hXP
        jGTuo3s+oURixATX2rsZcRHDkVOVsviHHbg==
X-Received: by 2002:a17:906:a1d2:b0:7c0:fd1a:79ef with SMTP id bx18-20020a170906a1d200b007c0fd1a79efmr66227520ejb.48.1673540985145;
        Thu, 12 Jan 2023 08:29:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQ4ZXFWvcoEj2hK4aWM3SbXAUWPTDXp9jOxEeG4uSFM7t11bZA0bc+NQBNKneKjKfdZbf+SA==
X-Received: by 2002:a17:906:a1d2:b0:7c0:fd1a:79ef with SMTP id bx18-20020a170906a1d200b007c0fd1a79efmr66227512ejb.48.1673540984972;
        Thu, 12 Jan 2023 08:29:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm7289228ejm.8.2023.01.12.08.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 08:29:44 -0800 (PST)
Message-ID: <86becd6f-71c9-8a68-0332-ce799d20eadb@redhat.com>
Date:   Thu, 12 Jan 2023 17:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Legion 5 15ARH05 DMI id
 to set_fn_lock_led_list[]
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ike Panhc <ike.pan@canonical.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221215154357.123876-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221215154357.123876-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/15/22 16:43, Hans de Goede wrote:
> The Lenovo Legion 5 15ARH05 needs ideapad-laptop to call SALS_FNLOCK_ON /
> SALS_FNLOCK_OFF on Fn-lock state change to get the LED in the Fn key to
> correctly reflect the Fn-lock state.
> 
> Add a DMI match for the Legion 5 15ARH05 to the set_fn_lock_led_list[]
> table for this.
> 
> Fixes: 81a5603a0f50 ("platform/x86: ideapad-laptop: Fix interrupt storm on fn-lock toggle on some Yoga laptops")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/ideapad-laptop.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 435d2d3d903b..0eb5bfdd823a 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1621,6 +1621,12 @@ static const struct dmi_system_id set_fn_lock_led_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Legion R7000P2020H"),
>  		}
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Legion 5 15ARH05"),
> +		}
> +	},
>  	{}
>  };
>  

