Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98A0ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 12:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiISM4S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiISM4R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 08:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AE4E096
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663592173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aURQnqb/AGxaO5pU8WGqAj7kiKkM6zkjukq5URyOsjE=;
        b=Cf9Fml3bOHmAF66RhafXuy1iWd5kz5CNTSrhApiz9Y/QDiZefaJ6bb25+BVvgvclr1q39B
        6SOvYtlhG1kRfAw5Lx4vP/jlNRAJBSWefV7P7Q1rKrWgixobbZvUFwuai7hISrdtti6Vfa
        BwTBOMwCIyU/v+JcdvGx9swZS6YX7jc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-1MQfF8CiO1idjsGoUpGkpw-1; Mon, 19 Sep 2022 08:56:12 -0400
X-MC-Unique: 1MQfF8CiO1idjsGoUpGkpw-1
Received: by mail-ed1-f71.google.com with SMTP id s17-20020a056402521100b004511c8d59e3so19889885edd.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aURQnqb/AGxaO5pU8WGqAj7kiKkM6zkjukq5URyOsjE=;
        b=63aMOvUQ47NQCBXpLCd0pB2ayfvew1SKjO1+EqCxNcBJyMDlYodQL3bFa/99jXTyT3
         La9EKRRqgBcaV5xtKZ1yPTOR9XPiO641mHnThsLdsre3aDhH0f3O9yzH/WRJgkqwkYYA
         B8lhx+shFH1KACmgDDzNClkF9LDJUaTP2hMsxRaZLltc37OTuWed4nE1J/B1t+DrdyyH
         GYq6gEQtsMy3Yj5vUuDaxXBSzjDN63LNPBVoccPXHYHrdPpxXviVhGPM2aIqt4reKSBf
         Lvq/Iy+HTeHR+Tm7E/sSEzPizgI/0vGhFgI5fAkPAzd9TQc17Sg3jbH+wvONfBN/DRsR
         555w==
X-Gm-Message-State: ACrzQf0ZQKCFxxdkyljh7ESFbvem+Gnm0kxg/BDbX+zkLzDXmutxcDGX
        DT6mwvcEZk8/oNWgLF0vIuXMR2prbzw+LcehnXkka505ykHeDFlb//DeXlA08pErYPS1LweSZ8b
        j60+sc2ZgBNwBUXK2XUyOOTf0nmmJ6yVo0g==
X-Received: by 2002:a17:907:2c4f:b0:77e:ac5:a734 with SMTP id hf15-20020a1709072c4f00b0077e0ac5a734mr12728491ejc.597.1663592170927;
        Mon, 19 Sep 2022 05:56:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CZkBD5rWW1lve0r1EuILUNr6US9JC8NljjSn/dJVgWVvvfNas/FC3POjXO2/j9gnZ+/bjbw==
X-Received: by 2002:a17:907:2c4f:b0:77e:ac5:a734 with SMTP id hf15-20020a1709072c4f00b0077e0ac5a734mr12728475ejc.597.1663592170673;
        Mon, 19 Sep 2022 05:56:10 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906539600b0076fa6d9d891sm15441911ejo.46.2022.09.19.05.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:56:09 -0700 (PDT)
Message-ID: <20eb8b7e-6f0e-c567-882a-cb8b23830f90@redhat.com>
Date:   Mon, 19 Sep 2022 13:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: msi-laptop: Change DMI match / alias
 strings to fix module autoloading
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220917210407.647432-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220917210407.647432-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/22 22:04, Hans de Goede wrote:
> On a MSI S270 with Fedora 37 x86_64 / systemd-251.4 the module does not
> properly autoload.
> 
> This is likely caused by issues with how systemd-udevd handles the single
> quote char (') which is part of the sys_vendor / chassis_vendor strings
> on this laptop. As a workaround remove the single quote char + everything
> behind it from the sys_vendor + chassis_vendor matches. This fixes
> the module not autoloading.
> 
> Link: https://github.com/systemd/systemd/issues/24715
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have added this to my review-hans branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/msi-laptop.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
> index 1c29678e5727..2f850396e9a7 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -602,11 +602,10 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
>  	{
>  		.ident = "MSI S270",
>  		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT'L CO.,LTD"),
> +			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "MS-1013"),
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "0131"),
> -			DMI_MATCH(DMI_CHASSIS_VENDOR,
> -				  "MICRO-STAR INT'L CO.,LTD")
> +			DMI_MATCH(DMI_CHASSIS_VENDOR, "MICRO-STAR INT")
>  		},
>  		.driver_data = &quirk_old_ec_model,
>  		.callback = dmi_check_cb
> @@ -639,8 +638,7 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "NOTEBOOK"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "SAM2000"),
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "0131"),
> -			DMI_MATCH(DMI_CHASSIS_VENDOR,
> -				  "MICRO-STAR INT'L CO.,LTD")
> +			DMI_MATCH(DMI_CHASSIS_VENDOR, "MICRO-STAR INT")
>  		},
>  		.driver_data = &quirk_old_ec_model,
>  		.callback = dmi_check_cb

