Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44233C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Feb 2022 09:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiBKJw4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Feb 2022 04:52:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348682AbiBKJwz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Feb 2022 04:52:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B6BF8BC4
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 01:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644573173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KbBUR0PowbwgN/h4A1csnWS5DMLp4mb9RHTvdGMRq7Y=;
        b=HhB3tJmuvPCclY37Z2ZZfmvWuU7s6VAdg1djR/7I1npLuexGmIz883ug2r+lNX1kCu7hzC
        UgJ6nHyLw+LeSVeyd5H0nHU8s9YL8ErQzK1QHkuA21BQK0zqRyf/HRND/g1p+O7w6zIv/s
        3Lf/iZcrm16VdalbJX5RtyScW28erH8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-NGDcHqpWOZq3XV4lQinQTA-1; Fri, 11 Feb 2022 04:52:51 -0500
X-MC-Unique: NGDcHqpWOZq3XV4lQinQTA-1
Received: by mail-ej1-f72.google.com with SMTP id qq4-20020a17090720c400b006c6a6c55ed6so3878743ejb.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KbBUR0PowbwgN/h4A1csnWS5DMLp4mb9RHTvdGMRq7Y=;
        b=YghFeidpHgSclrjyiPAdp3FNmgquTelAIH4uHBno6g50C7eLOwJGslM/9to0lmRZZa
         ng1wEeZljaj+x2Jh+O/TQdWw1P1onvpLhl37G0Cp4WvkEu5bgJFpqohJ6rdP467AclZe
         J9KoqUbUUQOltBsT0uL/JsZrCzHEizuY+gs9chmRKGB1/CuQgxoKkoiVfm6SVJqNyrYA
         AJPYJpavLPhU6C85BXg8SP1rm18jBDnPLudiZ8FJ1Snn1eFEZ5BaVOxQLBSCefZwRoqY
         zAiQBYjW/sbzexuXwe2ucN7RFryV4Zf9JQoePNOyPgrTUknBxdzA5iVIqdwHvnDvVNnK
         ISQQ==
X-Gm-Message-State: AOAM531zH173sFVhgEaUB35LHS6DnKx7QpFpc6mqemBSz1Y66tTI2+MC
        VZrlr0Rjqw0mbhvXbMxf64pUJHJu3qTEkO7QECKItSWDY4LxxbdZwbEe2FGpD9N/Ah9hPVnKx98
        8nzMnW4SMAlymG2Xtd6tStvFicIqMbYIH9g==
X-Received: by 2002:a50:9d0d:: with SMTP id v13mr1022027ede.242.1644573170379;
        Fri, 11 Feb 2022 01:52:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv+iM1xwj9I9vCEFOgS6uDPXFF1tuaQoSr2iNk2+YR/1nTcD/TtxOi7lYc8D3LXpYC/K5RWw==
X-Received: by 2002:a50:9d0d:: with SMTP id v13mr1022008ede.242.1644573170179;
        Fri, 11 Feb 2022 01:52:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id dx4sm3657339ejb.144.2022.02.11.01.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 01:52:49 -0800 (PST)
Message-ID: <d1697149-8a01-42ad-6414-d9861104cbd7@redhat.com>
Date:   Fri, 11 Feb 2022 10:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] platform/x86: x86-android-tablets: Minor charger /
 fuel-gauge improvements
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220206220220.88491-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220206220220.88491-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/22 23:02, Hans de Goede wrote:
> Minor charger / fuel-gauge improvements:
> 
> 1. Make some of the names of charger / fuel-gauge related globals more
>    generic in preparation for also using them on other boards.
> 
> 2. Update the dev_name on the Asus ME176C and TF103C to reflect that these
>    are using the bq24297 variant of the bq24190 family.
> 
> 3. During review of the ug3105 driver the "upi,rsns-microohm" property was
>    renamed to "upisemi,rsns-microohm" as "upisemi" is the correct vendor
>    prefix, update the ug3105 properties accordingly.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this seriesto my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets.c | 47 +++++++++++-----------
>  1 file changed, 23 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 838d667126e5..8e6e4f89220f 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -172,8 +172,18 @@ struct x86_dev_info {
>  };
>  
>  /* Generic / shared charger / battery settings */
> -static const char * const bq24190_suppliers[] = { "tusb1211-charger-detect" };
> -static const char * const ug3105_suppliers[] = { "bq24190-charger" };
> +static const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" };
> +static const char * const bq24190_psy[] = { "bq24190-charger" };
> +static const char * const bq25890_psy[] = { "bq25890-charger" };
> +
> +static const struct property_entry fg_bq25890_supply_props[] = {
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_psy),
> +	{ }
> +};
> +
> +static const struct software_node fg_bq25890_supply_node = {
> +	.properties = fg_bq25890_supply_props,
> +};
>  
>  /* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV bat. */
>  static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
> @@ -295,7 +305,7 @@ static const struct software_node asus_me176c_accel_node = {
>  };
>  
>  static const struct property_entry asus_me176c_bq24190_props[] = {
> -	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
>  	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
>  	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
>  	PROPERTY_ENTRY_BOOL("omit-battery-class"),
> @@ -308,9 +318,9 @@ static const struct software_node asus_me176c_bq24190_node = {
>  };
>  
>  static const struct property_entry asus_me176c_ug3105_props[] = {
> -	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", ug3105_suppliers),
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
>  	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
> -	PROPERTY_ENTRY_U32("upi,rsns-microohm", 10000),
> +	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 10000),
>  	{ }
>  };
>  
> @@ -320,11 +330,11 @@ static const struct software_node asus_me176c_ug3105_node = {
>  
>  static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
>  	{
> -		/* bq24190 battery charger */
> +		/* bq24297 battery charger */
>  		.board_info = {
>  			.type = "bq24190",
>  			.addr = 0x6b,
> -			.dev_name = "bq24190",
> +			.dev_name = "bq24297",
>  			.swnode = &asus_me176c_bq24190_node,
>  			.platform_data = &bq24190_pdata,
>  		},
> @@ -463,7 +473,7 @@ static const struct software_node asus_tf103c_battery_node = {
>  };
>  
>  static const struct property_entry asus_tf103c_bq24190_props[] = {
> -	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_suppliers),
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
>  	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
>  	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
>  	PROPERTY_ENTRY_BOOL("omit-battery-class"),
> @@ -476,9 +486,9 @@ static const struct software_node asus_tf103c_bq24190_node = {
>  };
>  
>  static const struct property_entry asus_tf103c_ug3105_props[] = {
> -	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", ug3105_suppliers),
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
>  	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
> -	PROPERTY_ENTRY_U32("upi,rsns-microohm", 5000),
> +	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
>  	{ }
>  };
>  
> @@ -488,11 +498,11 @@ static const struct software_node asus_tf103c_ug3105_node = {
>  
>  static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst = {
>  	{
> -		/* bq24190 battery charger */
> +		/* bq24297 battery charger */
>  		.board_info = {
>  			.type = "bq24190",
>  			.addr = 0x6b,
> -			.dev_name = "bq24190",
> +			.dev_name = "bq24297",
>  			.swnode = &asus_tf103c_bq24190_node,
>  			.platform_data = &bq24190_pdata,
>  		},
> @@ -834,17 +844,6 @@ static const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
>   *
>   * This takes care of instantiating the hidden devices manually.
>   */
> -static const char * const bq27520_suppliers[] = { "bq25890-charger" };
> -
> -static const struct property_entry bq27520_props[] = {
> -	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27520_suppliers),
> -	{ }
> -};
> -
> -static const struct software_node bq27520_node = {
> -	.properties = bq27520_props,
> -};
> -
>  static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst = {
>  	{
>  		/* BQ27520 fuel-gauge */
> @@ -852,7 +851,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
>  			.type = "bq27520",
>  			.addr = 0x55,
>  			.dev_name = "bq27520",
> -			.swnode = &bq27520_node,
> +			.swnode = &fg_bq25890_supply_node,
>  		},
>  		.adapter_path = "\\_SB_.PCI0.I2C1",
>  	}, {
> 

