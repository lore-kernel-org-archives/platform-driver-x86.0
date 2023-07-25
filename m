Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A13DC001DF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 13:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjGYNaO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 09:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjGYNaJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 09:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118FF10E5
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690291760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YzaB62IfAWaKjr40MIeUKzOgDRHbKPqjxnRlUir3NLA=;
        b=fSI21d1KDwtRpn/frJm6PunJhxk6MTmcjri6IySwAXuvsHFe0XGuFt0CqzGKgw1a8bPLV/
        j1/9anjOz2TjDNzJ+v67+P04vHJku5rF5WwyJ4ZQXbzwShkdp8zYFdL9QrABRf1p+9pu7o
        wGPfLh06sypfv/MyFk5ezla+smNBPIM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-HfQ-cbcnN6ClERzKeH-Ajg-1; Tue, 25 Jul 2023 09:29:18 -0400
X-MC-Unique: HfQ-cbcnN6ClERzKeH-Ajg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4f76712f950so4808576e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291756; x=1690896556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzaB62IfAWaKjr40MIeUKzOgDRHbKPqjxnRlUir3NLA=;
        b=WQM1v7wwB4FKQ2v/qLgr8Q4JtLEYECv+8uP+PQHoj705T+q6UZWyt8QyGh70uA5x9S
         S7KT+kFVi1pZSjZqeLajdDHPrE8lb2HsxtZlHn0h0oO7T+VJkXIw4mlUR3VDewIQBHOf
         hAWSKVGShIZ18nC2mx8ahSnKzDe+4NZxjKQlu9j9fFWSGCEDoE+XtrnHYPAzDq9GcJJW
         l7FkfGsX+u4oMlrVQsNqkSLs1fZem8/Mc/aSIEL61mC8Kxuf6QrUAPbiM1zseERmsL/q
         LrGXgffc3Y0hdVLi2qG3r8vHcbtWIXnN2/BcbJWCyFZx+u0Z2xbMSDltvSgQjpnLoXVD
         gcFg==
X-Gm-Message-State: ABy/qLbOapqJ/mO7yC3XCqzt6XuJV8SN2GNuP7YbkLGhV6ZFPk6liwLf
        GUOv4Jrjpw7XKKusN2czpw2UlZlAS/hpPfLJFhSJJy20QU1e54ZHK1ktlSKpxpT75QD6Bromzbm
        k3zril5cjMBvKlYokv2XiLhALAMSIuTRCvg==
X-Received: by 2002:a19:6755:0:b0:4f8:5bf7:db05 with SMTP id e21-20020a196755000000b004f85bf7db05mr7629945lfj.27.1690291756660;
        Tue, 25 Jul 2023 06:29:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGw2c86Cn66zy4bQqoIKumKm0BfA80x2pk+JYd9dSrQcwOhbJEgPVS2pMMZ19DB8JETCR0Yig==
X-Received: by 2002:a19:6755:0:b0:4f8:5bf7:db05 with SMTP id e21-20020a196755000000b004f85bf7db05mr7629939lfj.27.1690291756351;
        Tue, 25 Jul 2023 06:29:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7ce0f000000b0052238bc70ccsm2145750edv.89.2023.07.25.06.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:29:15 -0700 (PDT)
Message-ID: <1a018895-6bc6-2816-8cc9-cc6a7106ebc1@redhat.com>
Date:   Tue, 25 Jul 2023 15:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] platform/x86/intel/hid: Add HP Dragonfly G2 to VGBS
 DMI quirks
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        Alex Hung <alexhung@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230716183213.64173-1-maxtram95@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230716183213.64173-1-maxtram95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/16/23 20:32, Maxim Mikityanskiy wrote:
> HP Elite Dragonfly G2 (a convertible laptop/tablet) has a reliable VGBS
> method. If VGBS is not called on boot, the firmware sends an initial
> 0xcd event shortly after calling the BTNL method, but only if the device
> is booted in the laptop mode. However, if the device is booted in the
> tablet mode and VGBS is not called, there is no initial 0xcc event, and
> the input device for SW_TABLET_MODE is not registered up until the user
> turns the device into the laptop mode.
> 
> Call VGBS on boot on this device to get the initial state of
> SW_TABLET_MODE in a reliable way.
> 
> Tested with BIOS 1.13.1.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/hid.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 5632bd3c534a..afa16520b363 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -150,6 +150,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Elite Dragonfly G2 Notebook PC"),
> +		},
> +	},
>  	{ }
>  };
>  

