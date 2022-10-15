Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32895C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Oct 2022 14:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiJOOWL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Oct 2022 10:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJOOWL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Oct 2022 10:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3064C00D
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Oct 2022 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665843729;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BULXmwyBpRajt2YYWBw/wbmfmv0rGorKo5pkwxjgahs=;
        b=AP7jGoSpohnv12TOppSl1GG2XWIFdnUWJWjYQGL3lyOseInXpD3MJKfCcJV/5N+UkBRZ0+
        GhvGOdHEYvIV7NAKQaYMEfar1GbumqKGqIqYewJdAEuIMFVGNbGky/utp4sYT650q+mB6W
        nzP7Xck5Flp3NqOxtXVXJDPLyDBXD18=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-eKXQyyleME2Tu1iuF2QFkw-1; Sat, 15 Oct 2022 10:22:06 -0400
X-MC-Unique: eKXQyyleME2Tu1iuF2QFkw-1
Received: by mail-ed1-f71.google.com with SMTP id w1-20020a056402268100b0045d06ea5575so4738259edd.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Oct 2022 07:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BULXmwyBpRajt2YYWBw/wbmfmv0rGorKo5pkwxjgahs=;
        b=ySBfbNz3aNfLw/jcVisPQfDq8s9JWTdqKJs2+11mpayJmh0tE/UjL7sp/rZ/OSVnLZ
         wWXTxXqcvGClxlDbRZYuR5LmFl8sb8gPfg/NIfsQI7ddI2GehbaXzrGQhMuBpC8qwS/4
         +3DVMeaL79bks24teXLamwxeOB5nq8oTs/ALBYMGdst9KDEM0Evrw1vbWs4W6NfNaLDb
         93thvhu/6+1s95wsoZew/r2YKQQsXnqKTWr+89z5rvajjWVVBdIXK9lT/V7nkyHFAEM/
         W4oAvm+EsQzyHpgx31u7SyyxrHAQGcmcPCyoazejosAMg1UZiO9Gs2BTXfmhybuf/fu+
         mu1g==
X-Gm-Message-State: ACrzQf0nLo2MN4MJOe8KWnVIHLnkOo3ZysTOkkFWhlkSkZ/j3wX6ZJc3
        u+1Wr/+zSvuU2f1c4xCcRYeuM4ttDDhqisDhyAa+G1Gsgu0zU7J7S8liG3TX7a1JTXqy1TreNuZ
        S0p8UpgV7YkpejDJySWoAR+UfXXUx9gSOLw==
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id r7-20020aa7cb87000000b0043be6506036mr2493984edt.350.1665843724873;
        Sat, 15 Oct 2022 07:22:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7p4pzvraHoGPbqUgfKUk+t2u05yshzeHJhSw8w6BEr/1kqahWIjTVqH4CZu1xsXXpfZ9Rq9A==
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id r7-20020aa7cb87000000b0043be6506036mr2493969edt.350.1665843724669;
        Sat, 15 Oct 2022 07:22:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906311700b00771cb506149sm3214503ejx.59.2022.10.15.07.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 07:22:04 -0700 (PDT)
Message-ID: <5649310a-b91b-986a-3dd3-c4b04f03462e@redhat.com>
Date:   Sat, 15 Oct 2022 16:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/1] platform/x86: thinkpad_acpi: skip invalid fan speed
Content-Language: en-US, nl
To:     Jelle van der Waa <jvanderwaa@redhat.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Mark Pearson <markpearson@lenovo.com>
References: <20221014211709.6322-1-jvanderwaa@redhat.com>
 <20221014211709.6322-2-jvanderwaa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221014211709.6322-2-jvanderwaa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/14/22 23:17, Jelle van der Waa wrote:
> 65535 is most likely an invalid read.

I wonder if it is an invalid read, or if it actually is a reserved value
which means "FAN_NOT_PRESENT"

I'm tempted to add:

#define FAN_NOT_PRESENT		65535

and then change the check to:

			if (res >= 0 && speed != FAN_NOT_PRESENT) {


That would make the code more logical to read.

Jelle, can you make this change for v2 ? Also please Cc: platform-driver-x86@vger.kernel.org
for v2.

Mark, what do you think of this change (and of adding the
FAN_NOT_PRESENT define) ?

Regards,

Hans



> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> 
> ---
> 
> Cc: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 6a823b850a77..7e0f72dc53b7 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8876,7 +8876,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  			/* Try and probe the 2nd fan */
>  			tp_features.second_fan = 1; /* needed for get_speed to work */
>  			res = fan2_get_speed(&speed);
> -			if (res >= 0) {
> +			if (res >= 0 && speed != 65535) {
>  				/* It responded - so let's assume it's there */
>  				tp_features.second_fan = 1;
>  				tp_features.second_fan_ctl = 1;

