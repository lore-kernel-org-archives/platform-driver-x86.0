Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2525DC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 08:34:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBF6E611AD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 08:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbhDOIe2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 04:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231266AbhDOIe2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 04:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618475645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4IU2ZHdHyAlwy7jgaUpMwL4lw/SF5EP9tOcVGDgB2rQ=;
        b=UaoIoGQulPjAso6khLvNvPxyQx0vO2e1/HFc5bDadclG+rrZnqKnbFBXRZNSt/C8fLbsFV
        pQBJfHFD8rcVdSQpAvOgML0NxnFF/Yy8S7+YLwwraeaa9CepjZ3VFGdjPdUVzqCPMJ4eBR
        JniOc+1ws1SFfetMm4Z/nWZhqY7oZ8s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-s3oiAtluN8Wuc0R_qCFrFw-1; Thu, 15 Apr 2021 04:34:02 -0400
X-MC-Unique: s3oiAtluN8Wuc0R_qCFrFw-1
Received: by mail-ej1-f72.google.com with SMTP id x21-20020a1709064bd5b029037c44cb861cso663622ejv.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 01:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4IU2ZHdHyAlwy7jgaUpMwL4lw/SF5EP9tOcVGDgB2rQ=;
        b=TQbK/WDfZaxuyASrGuesVJp1bGcetJ0AlhMZ6L4MsKCpBJnTCtnETxcVrUuMYgEKyx
         +XirFzYg5YLIoUn6ZDN+sWkar/nJfXS78BRmLRaJrq6h9d7yhWrguVP4ko0iIlZsTQkn
         gS1YXw/Sv59ONiSMpAL8uP88TwV6aGtIQrdJhBuA7Mw/GGMNlMC405luI4rQ5zYd4X04
         t+uRVjNBuTGMyEZyARWsSbRwgRS8XiNGF6siU31XAJd8pp5czZ7nZFJCx9xUfeVjoyXG
         VvzWRtQTt033p9rmQd8omglpc5NIB3u48fhYGTf38aLB3M6nrk2kEq1t87TwwnCx831v
         rsng==
X-Gm-Message-State: AOAM5336CJUX2VJLPKDjcuRYypm1w2DKxj2YT75BsIxstqnNn0iqxCKu
        hGqvIadjbYsR1nF4ldDnIM1eosiKyivZxkFjBY71SddQJ2vnnNZIvS3JAWtcUNPEKd8M9+hcA9Q
        MSAr3LZwLrmEyuIzzfNHr/Y619+4QfZfs/g==
X-Received: by 2002:a05:6402:3487:: with SMTP id v7mr2745337edc.302.1618475641168;
        Thu, 15 Apr 2021 01:34:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU3zWqo1aaAa7dBwS22kMOgGalKNKbOLYkMY7ecNMcF/yuFEPdbtPA6/vcuJ0NQP1DQjWGow==
X-Received: by 2002:a05:6402:3487:: with SMTP id v7mr2745326edc.302.1618475640997;
        Thu, 15 Apr 2021 01:34:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s13sm1340551ejz.110.2021.04.15.01.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 01:34:00 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add X570 AORUS ELITE
To:     Julian Labus <julian@labus-online.de>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>
References: <20210415074526.1782-1-julian@labus-online.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b32beea3-2856-3313-c6a1-37f19990e0e2@redhat.com>
Date:   Thu, 15 Apr 2021 10:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415074526.1782-1-julian@labus-online.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Julian,

Thank you for your patch.

As indicated in the MAINTAINERS file the gigabyte-wmi driver
is maintained by Thomas Weißschuh (added to the Cc), so you should
have Cc-ed Thomas on this submission.

Thomas can you review/ack this please ?

(the patch looks fine to me but I want to give you a chance to comment
on it before merging it)

Regards,

Hans




On 4/15/21 9:45 AM, Julian Labus wrote:
> Add the X570 AORUS ELITE to gigabyte_wmi_known_working_platforms
> 
> Signed-off-by: Julian Labus <julian@labus-online.de>
> ---
> 
> I read on phoronix.com that a driver for Gigabyte WMI will be added.
> I gave it a try on my Gigabyte X570 AORUS ELITE with force_load=1 and
> it seem to work fine. lm_sensors shows 6 sensors with reasonable values.
> 
> gigabyte_wmi-virtual-0
> Adapter: Virtual device
> temp1:        +26.0°C  
> temp2:        +30.0°C  
> temp3:        +27.0°C  
> temp4:        +34.0°C  
> temp5:        +29.0°C  
> temp6:        +43.0°C  
> 
> The patch was created against the for-next branch of platform-drivers-x86.git
> 
>  drivers/platform/x86/gigabyte-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index bb1b0b205fa7..e127a2077bbc 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -146,6 +146,10 @@ static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
>  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "Z390 I AORUS PRO WIFI-CF"),
>  	}},
> +	{ .matches = {
> +		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
> +		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 AORUS ELITE"),
> +	}},
>  	{ .matches = {
>  		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."),
>  		DMI_EXACT_MATCH(DMI_BOARD_NAME, "X570 I AORUS PRO WIFI"),
> 

