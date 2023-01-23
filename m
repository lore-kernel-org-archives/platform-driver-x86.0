Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEFFC38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjAWNny (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjAWNnx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1ABEFB9
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674481385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0Yi/n8hbn9P/kqhcS9F0MG64XXs/fsBE/t7/0S1mqFI=;
        b=VqByMUjcTyuIZbqo8GyLOS2Q8PWI5eh4tQOuE96/+/cLKKuqKC/coH8JO1Vu9LFuQY1xa8
        TqdmAnVaxpVSd7KelTJB1FbI0SA9yuEAEGd4nE4ZaCWxMd1DNZUYaExaKHuBZK8nRWpWSf
        Vgy+jLt5L0PH6DIRJbN4DW/8SI6odMY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-9wgzCBKGM-23fP6L0SzEng-1; Mon, 23 Jan 2023 08:43:03 -0500
X-MC-Unique: 9wgzCBKGM-23fP6L0SzEng-1
Received: by mail-ed1-f72.google.com with SMTP id j10-20020a05640211ca00b0049e385d5830so8621976edw.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yi/n8hbn9P/kqhcS9F0MG64XXs/fsBE/t7/0S1mqFI=;
        b=6yxo45qeyXzDsIbaQBcY6WarSOpS/5o+rt1cRMnHKViTXJwbOfrhSie3yUE/wOuSOr
         74W62M9b4o/utKpzrevJPvBf9RRoqPLbklb5NF/qYgVSArvJ4NeD6fgdnJSDdwOuxCH8
         mjCdkkVq3bszAnOj6FMDYaMd38lueMMApO4D/7LwFIYiJ54r17pijkQ+ej9Nt4W9GpnH
         oSQKbAg7+yaqahKOqXDMB3aZ/gPA5ri1n8UPvye5Qh40SluudFo0Rg/9Nd3UJE2IP5Wl
         qIZN8IxdcG1A4XbUi18TK9cGjkSU5Xb8ihX0oBObUNfS9x43qAOYwTvVt7y5R4kjUImk
         Mbsg==
X-Gm-Message-State: AFqh2kqfG7m1dzRmSGSjAVFEDqUG/k2jv4wRPgn755UB4ffAp6cM3mop
        MBdC9MTMAtp1oFiXkiamk7bC99tV5cb0UL9gm8suysm2nLDkEH6g7GzHFquskbT7hhUwwqD7UYS
        xYa4wEYT5BNxuI/uRQyaI2/I017M0kwwDSg==
X-Received: by 2002:a17:906:5fc5:b0:7c0:f9ef:23a2 with SMTP id k5-20020a1709065fc500b007c0f9ef23a2mr27652199ejv.30.1674481382363;
        Mon, 23 Jan 2023 05:43:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtxac8hmNUkdQe7dGsTC0DMwQNOJAWJdLA2ObT27M9tIdmi3eOow90G7s3J/LH1AKXPteWPog==
X-Received: by 2002:a17:906:5fc5:b0:7c0:f9ef:23a2 with SMTP id k5-20020a1709065fc500b007c0f9ef23a2mr27652185ejv.30.1674481382164;
        Mon, 23 Jan 2023 05:43:02 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id fs37-20020a170907602500b0086ffe3a99f9sm11858335ejc.82.2023.01.23.05.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:43:01 -0800 (PST)
Message-ID: <53349ebc-7b47-de8a-e511-c8069a1bf315@redhat.com>
Date:   Mon, 23 Jan 2023 14:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Handle Omen Key event
Content-Language: en-US
To:     Rishit Bansal <rishitbansal0@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230120221214.24426-1-rishitbansal0@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230120221214.24426-1-rishitbansal0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/20/23 23:12, Rishit Bansal wrote:
> Add support to map the "HP Omen Key" to KEY_PROG2. Laptops in the HP
> Omen Series open the HP Omen Command Center application on windows. But,
> on linux it fails with the following message from the hp-wmi driver:
> 
> [ 5143.415714] hp_wmi: Unknown event_id - 29 - 0x21a5
> 
> Also adds support to map Fn+Esc to KEY_FN_ESC. This currently throws the
> following message on the hp-wmi driver:
> 
> [ 6082.143785] hp_wmi: Unknown key code - 0x21a7
> 
> There is also a "Win-Lock" key on HP Omen Laptops which supports
> Enabling and Disabling the Windows key, which trigger commands 0x21a4
> and 0x121a4 respectively, but I wasn't able to find any KEY in input.h
> to map this to.

We could add KE_IGNORE mappings to hp_wmi_keymap for those,
doing so should silence the warnings about unknown codes.

If you think this is useful please provide a separate follow-up
patch for this.

> Signed-off-by: Rishit Bansal <rishitbansal0@gmail.com>

I have merged this v2 now, but with some coding style changes,
for your next patches please try to keep the indentation
and sorting of things correct.

> ---
> Changes since v1:
>  - Add support for FN+Esc Key
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0a99058be813..ab858db551fb 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -91,6 +91,7 @@ enum hp_wmi_event_ids {
>  	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
>  	HPWMI_SANITIZATION_MODE		= 0x17,
>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
> +	HPWMI_OMEN_KEY				= 0x1D,

There is one <tab> too much before the '= 0x1D' and 0x1D should
be between the 0x17 and 0x21 lines.

>  };
>  
>  /*
> @@ -219,6 +220,8 @@ static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
>  	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
>  	{ KE_KEY, 0x231b,  { KEY_HELP } },
> +	{ KE_KEY, 0x21a5,  { KEY_PROG2 }}, /* HP Omen Key */
> +	{ KE_KEY, 0x21a7, { KEY_FN_ESC }},

These need to be above the 0x21a9 line, so sorted by base event code
(lower 16 bits) Also you are missing a space in the indentation of
the { KEY_FN_ESC } and there should be a space between the 2 }} at
the end like on the other lines.

Regards,

Hans


>  	{ KE_END, 0 }
>  };
>  
> @@ -810,6 +813,7 @@ static void hp_wmi_notify(u32 value, void *context)
>  	case HPWMI_SMART_ADAPTER:
>  		break;
>  	case HPWMI_BEZEL_BUTTON:
> +	case HPWMI_OMEN_KEY:
>  		key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
>  		if (key_code < 0)
>  			break;

