Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1842CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 10:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236052AbiAQKIh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 05:08:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52421 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236048AbiAQKIh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 05:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642414116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NigNEBy9iY9q5B01WlMJ2ovobrWbqOLm5A4N7hXG/S4=;
        b=TUFaJwgmsv9SqudpzQ7t0ZFmcT72+3uMrJUcaGs9sAdjc7304BDZMN0/vuSSEXWFOKHZ/v
        KhkuHYJ+l+w4EP35Ml9Gdy2v4osS2DeIclyBKXCn1FlIDvcoobT7cFZvnk7w+r49xYSLeg
        O/AWzqMb8kPuQfMVQRtFhJSAFsUI5qk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668--0eHJJvwOaG_FMBFkt0xzA-1; Mon, 17 Jan 2022 05:08:35 -0500
X-MC-Unique: -0eHJJvwOaG_FMBFkt0xzA-1
Received: by mail-ed1-f71.google.com with SMTP id a8-20020a056402168800b004022fcdeb25so3037853edv.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 02:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NigNEBy9iY9q5B01WlMJ2ovobrWbqOLm5A4N7hXG/S4=;
        b=h4WIlA/v8GW1KpStOR8NAPnDPvJVy+lUvRtCgrZjGowfZO5p0fYohDnhayIEYMB/ST
         XR4Mh0O6aMYvcL7sLVueQ2nWDttdBsIVqybLrL4SvGcvYPS7OaiX9+w6dLmEpcC+xc+x
         SwTEqnpXdNApYbLLJEZ8P62jpU+zJvqkOmr39UYbRoigseko6zy5PhU4bb2L31CNFA2k
         kdMST5jhrnqYU8EwhUcu5U9nL8Kb37GCU8emRZwUyRCrb/tYDYCGNZcUGMEyzXL6yNgF
         BA4jvkZrAHf5DoDlxXezvPByx7a3gSkdNAd99NTaXCGqab9JR3B8kwsiy2dxvniR5OJS
         m0ag==
X-Gm-Message-State: AOAM533dUBUnQyV9apn1MQk+hmi6o2LcQd/0C8RHbPMAl1JO/amCgu/2
        aMaDKsHgj/Iquq8pc9fnALTkzMtMC1q4y/YHxoliELd/toEXWeSYhqjtQXnbMkaJYfVH1CiDF7U
        xYkcWFQIIcCNG1QTxulX/8Z/vz2YrhZmIgg==
X-Received: by 2002:a17:907:720f:: with SMTP id dr15mr15838759ejc.729.1642414113846;
        Mon, 17 Jan 2022 02:08:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhww+1uTE5CXxnKlFKSY6oc9/jiSKUJ32I2FIY6C8REfBfTGhPWmpHWo3V1a0qC+ihYGLQJA==
X-Received: by 2002:a17:907:720f:: with SMTP id dr15mr15838744ejc.729.1642414113598;
        Mon, 17 Jan 2022 02:08:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id z16sm5911424edm.49.2022.01.17.02.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 02:08:33 -0800 (PST)
Message-ID: <25e931a1-a065-583d-8e3b-3b176492c266@redhat.com>
Date:   Mon, 17 Jan 2022 11:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add quirk for ThinkPads
 without a fan
Content-Language: en-US
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        ibm-acpi-devel@lists.sourceforge.net,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>
References: <12d4b825-a2b9-8cb7-6ed3-db4d66f46a60@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <12d4b825-a2b9-8cb7-6ed3-db4d66f46a60@a-kobel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/12/22 12:18, Alexander Kobel wrote:
> Some ThinkPad models, like the X1 Tablet 1st and 2nd Gen, are passively
> cooled without any fan.  Currently, an entry in /proc/acpi/ibm/fan is
> nevertheless created, and misleadingly shows
> 	status:		enabled
> 	speed:		65535
> 	level:		auto
> 
> This patch adds a TPACPI_FAN_NOFAN quirk definition and corresponding
> handling to not initialize a fan interface at all.
> 
> For the time being, the quirk is only applied for X1 Tablet 2nd Gen
> (types 20JB, 20JC; EC N1O...); further models (such as Gen1, types 20GG
> and 20GH) can be added easily once tested.
> 
> Tested on a 20JCS00C00, BIOS N1OET58W (1.43), EC N1OHT34W.
> 
> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I expect Mark possibly coming-up with a better way to detect the number
of fans in a ThinkPad to take quite a while, so I've merged this for now
and then eventually we can replace it with a better fix if one shows up:

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
>  drivers/platform/x86/thinkpad_acpi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e03df2881dc6..7dbe4061bc8a 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8767,9 +8767,10 @@ static const struct attribute_group fan_attr_group = {
>  	.attrs = fan_attributes,
>  };
>  
> -#define TPACPI_FAN_Q1	0x0001		/* Unitialized HFSP */
> -#define TPACPI_FAN_2FAN	0x0002		/* EC 0x31 bit 0 selects fan2 */
> -#define TPACPI_FAN_2CTL	0x0004		/* selects fan2 control */
> +#define TPACPI_FAN_Q1		0x0001		/* Uninitialized HFSP */
> +#define TPACPI_FAN_2FAN		0x0002		/* EC 0x31 bit 0 selects fan2 */
> +#define TPACPI_FAN_2CTL		0x0004		/* selects fan2 control */
> +#define TPACPI_FAN_NOFAN	0x0008		/* no fan available */
>  
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8787,6 +8788,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>  	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
>  	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
> +	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
>  };
>  
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8816,6 +8818,11 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  	quirks = tpacpi_check_quirks(fan_quirk_table,
>  				     ARRAY_SIZE(fan_quirk_table));
>  
> +	if (quirks & TPACPI_FAN_NOFAN) {
> +		pr_info("No integrated ThinkPad fan available\n");
> +		return 1;
> +	}
> +
>  	if (gfan_handle) {
>  		/* 570, 600e/x, 770e, 770x */
>  		fan_status_access_mode = TPACPI_FAN_RD_ACPI_GFAN;
> 

