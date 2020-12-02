Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055DAC64E8A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F64221FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbgLBMMC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 07:12:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35171 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbgLBMMB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 07:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606911035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5N+zpqM0Bd2uVv1puBq2zufMVNGiJJU/vrLLenJ+x9U=;
        b=CrfxSz6FcdDEZj3tXnPgKIOB0Qqx8BLV1H8boY3J5qaESi2DsiBvJn4khqoFqrI2rT1s6Q
        CQksmlDp0jICKrd92FZnKO21boJdXxSBpzgL38+PADTlkz9bZ+zVo44HrDK8dDQnicOWn7
        nhoUypHr9fntx82bIGf0nJJ98VgHcEs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-9LrDAs_7Pe2BzvWi89Ir8A-1; Wed, 02 Dec 2020 07:10:33 -0500
X-MC-Unique: 9LrDAs_7Pe2BzvWi89Ir8A-1
Received: by mail-ej1-f70.google.com with SMTP id 2so2906836ejv.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Dec 2020 04:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5N+zpqM0Bd2uVv1puBq2zufMVNGiJJU/vrLLenJ+x9U=;
        b=LuuEBcOsT61QeIg1VryR0am8INfMmeFVazwGy+g++Z66r+k3UyCOlvLX5ko1x6sM+w
         K+RQyYes2Gu2QIFvPxby36gmgoXGG6nHltNq7Ksi4LoNKt//CtHjr4j9bvsQwH/53Kia
         fDfdP6i+hBeV7I+G4+Ua2bpz6E6CE+xXsgpF5G3EEWSb/xuvFZjxtphrvSPjuUwRQMlh
         I90lMRD7sN4Z3xH5uRWBafTpz8EtM8tx4FO6fboT4lZP4OWbVdkzI9g1uuOAMGWLU7Ix
         MBa+dVgL8HPXv6lb5upR/KyD8nwxi6AcPceELLLYGmLFsicXqsgPw9u1ZtbxBE+Lvlka
         8GkQ==
X-Gm-Message-State: AOAM530FKZ5oZQAfYCpgYd+IBix0bDe5Ykw7r0HvmAgc8IbKvgAU/zOk
        iwZTxpAOH1fmY2JLO2nnM//WyTLnhuXjos4yalwoobtMdjKMkUdwB2ar+BrJdedpUWOrPkTc6yY
        cX+2BW5wgONctfgQnPwzbO689VqlAlssUBjpedaM/KtXBA6y42sE3Clc9LIdrH13X6d+ZUM1fVg
        vngC25ibfI3g==
X-Received: by 2002:a05:6402:388:: with SMTP id o8mr2145908edv.359.1606911031949;
        Wed, 02 Dec 2020 04:10:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD53It4Rd87Q20T+MeZh8IUtzgXqPHDKlxZhXR0XX9WEgIcaNyCDQA/XrLCvf6R9nkLJ8i7Q==
X-Received: by 2002:a05:6402:388:: with SMTP id o8mr2145892edv.359.1606911031775;
        Wed, 02 Dec 2020 04:10:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id b17sm1039436eju.76.2020.12.02.04.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 04:10:31 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Allow switch events on Acer
 Switch Alpha 12
To:     Carlos Garnacho <carlosg@gnome.org>,
        platform-driver-x86@vger.kernel.org
References: <20201201135727.212917-1-carlosg@gnome.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <63caa71f-bd5b-6e9f-ce79-8965f353d84f@redhat.com>
Date:   Wed, 2 Dec 2020 13:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201135727.212917-1-carlosg@gnome.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/1/20 2:57 PM, Carlos Garnacho wrote:
> This 2-in-1 model (Product name: Switch SA5-271) features a SW_TABLET_MODE
> that works as it would be expected, both when detaching the keyboard and
> when folding it behind the tablet body.
> 
> It used to work until the introduction of the allow list at commit
> 8169bd3e6e193 ("platform/x86: intel-vbtn: Switch to an allow-list for
> SW_TABLET_MODE reporting"). Add this model to it, so the Virtual Buttons
> device announces the EV_SW features again.
> 
> Signed-off-by: Carlos Garnacho <carlosg@gnome.org>

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
>  drivers/platform/x86/intel-vbtn.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index f5901b0b07cd..d8114983498b 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -206,6 +206,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Switch SA5-271"),
> +		},
> +	},
>  	{} /* Array terminator */
>  };
>  
> 

