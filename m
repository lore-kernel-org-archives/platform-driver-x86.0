Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A53C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 06:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CACB76103D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 06:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhDMG3X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 02:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53152 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230418AbhDMG3W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 02:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618295342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CTXSZmkNfjaf0xWxM21AWpCuBVEjIv9eTZQXwZhH5lk=;
        b=DtT84BNJiVry2ykXqY3ktMjkWh/Q2ovxG+LK6pYOoO+C19uVaTA57JIbYqrWd7V3tXKyI3
        jHZdA8DRNBannLhQrPWm9nwyni9WaxS19P68pVkx02TutjAbb8CvTYH+pUubfUjZGLDoW6
        7r8JJwBt/ahqoM+CRgSKgpIu5l058YA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-XfUdGvkGNTyRtqZJ3VOjEQ-1; Tue, 13 Apr 2021 02:28:59 -0400
X-MC-Unique: XfUdGvkGNTyRtqZJ3VOjEQ-1
Received: by mail-ed1-f72.google.com with SMTP id f7-20020a0564021507b0290378b2cf7ff4so715210edw.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Apr 2021 23:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CTXSZmkNfjaf0xWxM21AWpCuBVEjIv9eTZQXwZhH5lk=;
        b=sO0FrODf4vVB4n0mbAwG1aZfuGkTveZmQShGxvfL4PFJLMYmn7fTbf124Rl0YyzMRU
         JOHFIipljPM5RQoDKACSOsMRxDkGFYdoYYgHk0k+K0SMMxsY3CG4Zq+sVyAtTznpIPVl
         GU7FSSxNzUHDwj0fGmDBtGM7RORIzevlalP+TdyZEIibURB3snG6H0KUDc5ejqkuk8+b
         B9efURWwyw11abQ/JQSVzpqjM1sSzA/OUcPCVbTfDTS4BbV5naivm2P1KkvN2w3D+pDh
         v4AAqzKbiaPleznA0ZPFiNAXpfnfMXD62WXpQZsdcBZlI4xh2WGhrZhuetebb78SqOPK
         f6Hw==
X-Gm-Message-State: AOAM53268JjxjWlRJ6Hn8jv9Hus8blYSkERk3CcqpMUu1XysF+O4/3FX
        AdIeBUZ4W3YVNvsSO/j8nYKtyJbgz8iLAtQL9krc022vIm4vN73jzJQiPbgVZ5mc9IQJWy2D0hq
        k3kVSWbQYSjRDEgCkZOscQGCcb/fTlXc25L718f6uCzaL7kXAGc/hyeFQyONmDYOp9W7xKE1Xo6
        B6LjTuev/KQA==
X-Received: by 2002:a17:906:4ed0:: with SMTP id i16mr2813109ejv.96.1618295338537;
        Mon, 12 Apr 2021 23:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI+uo6EWgncooGAexFtaWxmVLueJLUGfZwDrvQELpD9uKwY4r4AhqhaQQmOZEwlpcZE0eChA==
X-Received: by 2002:a17:906:4ed0:: with SMTP id i16mr2813091ejv.96.1618295338294;
        Mon, 12 Apr 2021 23:28:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t7sm3581454ejo.120.2021.04.12.23.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 23:28:57 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Correct thermal sensor
 allocation
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210407212015.298222-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1f0e16b9-ab78-881b-1918-7b8cf61bc546@redhat.com>
Date:   Tue, 13 Apr 2021 08:28:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407212015.298222-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/7/21 11:20 PM, Mark Pearson wrote:
> On recent Thinkpad platforms it was reported that temp sensor 11 was
> always incorrectly displaying 66C. It turns out the reason for this is
> that this location in EC RAM is not a temperature sensor but is the
> power supply ID (offset 0xC2).
> 
> Based on feedback from the Lenovo firmware team the EC RAM version can
> be determined and for the current version (3) only the 0x78 to 0x7F
> range is used for temp sensors. I don't have any details for earlier
> versions so I have left the implementation unaltered there.
> 
> Note - in this block only 0x78 and 0x79 are officially designated (CPU &
> GPU sensors). The use of the other locations in the block will vary from
> platform to platform; but the existing logic to detect a sensor presence
> holds.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

I've merged this, note I've added one small fixup to initialize ver to
0 when it is declared, also see a remark inline below.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 31 ++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 07de21941..8fbe4d3d9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6260,6 +6260,7 @@ enum thermal_access_mode {
>  enum { /* TPACPI_THERMAL_TPEC_* */
>  	TP_EC_THERMAL_TMP0 = 0x78,	/* ACPI EC regs TMP 0..7 */
>  	TP_EC_THERMAL_TMP8 = 0xC0,	/* ACPI EC regs TMP 8..15 */
> +	TP_EC_FUNCREV      = 0xEF,      /* ACPI EC Functional revision */
>  	TP_EC_THERMAL_TMP_NA = -128,	/* ACPI EC sensor not available */
>  
>  	TPACPI_THERMAL_SENSOR_NA = -128000, /* Sensor not available */
> @@ -6458,7 +6459,7 @@ static const struct attribute_group thermal_temp_input8_group = {
>  
>  static int __init thermal_init(struct ibm_init_struct *iibm)
>  {
> -	u8 t, ta1, ta2;
> +	u8 t, ta1, ta2, ver;
>  	int i;
>  	int acpi_tmp7;
>  	int res;
> @@ -6473,7 +6474,14 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  		 * 0x78-0x7F, 0xC0-0xC7.  Registers return 0x00 for
>  		 * non-implemented, thermal sensors return 0x80 when
>  		 * not available
> +		 * The above rule is unfortunately flawed. This has been seen with
> +		 * 0xC2 (power supply ID) causing thermal control problems.
> +		 * The EC version can be determined by offset 0xEF and at least for
> +		 * version 3 the Lenovo firmware team confirmed that registers 0xC0-0xC7
> +		 * are not thermal registers.
>  		 */
> +		if (!acpi_ec_read(TP_EC_FUNCREV, &ver))
> +			pr_warn("Thinkpad ACPI EC unable to access EC version\n");

So what happens with ver in case the pr_warn here triggers?

As said above I've added a small change to initialize ver to 0 when declared,
so that we keep the old behavior when this pr_warn triggers.

>  
>  		ta1 = ta2 = 0;
>  		for (i = 0; i < 8; i++) {
> @@ -6483,11 +6491,13 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  				ta1 = 0;
>  				break;
>  			}
> -			if (acpi_ec_read(TP_EC_THERMAL_TMP8 + i, &t)) {
> -				ta2 |= t;
> -			} else {
> -				ta1 = 0;
> -				break;
> +			if (ver < 3) {
> +				if (acpi_ec_read(TP_EC_THERMAL_TMP8 + i, &t)) {
> +					ta2 |= t;
> +				} else {
> +					ta1 = 0;
> +					break;
> +				}
>  			}
>  		}
>  		if (ta1 == 0) {
> @@ -6500,9 +6510,12 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>  				thermal_read_mode = TPACPI_THERMAL_NONE;
>  			}
>  		} else {
> -			thermal_read_mode =
> -			    (ta2 != 0) ?
> -			    TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
> +			if (ver >= 3)
> +				thermal_read_mode = TPACPI_THERMAL_TPEC_8;
> +			else
> +				thermal_read_mode =
> +					(ta2 != 0) ?
> +					TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
>  		}
>  	} else if (acpi_tmp7) {
>  		if (tpacpi_is_ibm() &&
> 

Regards,

Hans

