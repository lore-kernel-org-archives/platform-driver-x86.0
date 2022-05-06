Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFE7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390829AbiEFKPx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345998AbiEFKPw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:15:52 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D2F75930D
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651831928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fh8pcpRHHcD+Jm8SYSaGI56FhdYXwOiPskgf/lnpGGk=;
        b=UgEC307jzL6aFFndjBNisOUsfQYSJWJnMtr+zC5a/nmBJfb606979f72+YScrcPQvi+EP0
        EqSGtmx/X3aQ4oeRxYmsJKSOOnZGBpIvuGAqFGJWYdBFYnEoVJClhNEIdtwE0HjjTRRPgd
        seyaI85YwRbwHFRLO1Yz5ZM6GUK3W1Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-EgmEquNMM12E5njDnlRVTA-1; Fri, 06 May 2022 06:12:07 -0400
X-MC-Unique: EgmEquNMM12E5njDnlRVTA-1
Received: by mail-ej1-f71.google.com with SMTP id qk34-20020a1709077fa200b006f4318d7efdso4104306ejc.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fh8pcpRHHcD+Jm8SYSaGI56FhdYXwOiPskgf/lnpGGk=;
        b=G+x9Qwu4C6LNz6FPIA6NnlnkFS5I5QLtD/CZo+YlQYvhq4wMoNFhTyddQMvqzqcvo3
         GJYga6DLiBU3IoEtwldhMezr6YuWFUj+AxFg49SBO+cSsBJIr5nvcEJMFUGtkpOEgggb
         Q64Ml0L6q7qqKDQpo0bwhX+4Oq3lEYL83I0fobpcHMQajuJmRs6ddjdbvbuN1fAXygv4
         jgIyfKeEq/Jk+0IG7EUivqtDh8bAOvArtP7PUhGfEbLjqKEIpxi2JrOi/kHIK3cecopN
         f+XAcao/hQpRFoR6Fhqv7+/M7ML9xdi9PmHb0q8OCfmKKVHTNLunXwUR/VULc3GtazVd
         AGKg==
X-Gm-Message-State: AOAM531yBJffoNaAfNEACho5ii5s9UcERj5nX8omVAgWdhfXXvfA5Cd4
        7epM8oR+BE7Db9yob0+/B7BSQYzSdDEHoviFG3emCAFsxVFitRJmNfOVYM8Jbz6pZx7bP+Y5Dye
        czGQ+OcEnAG12UGuH7GFIZzOV9+n4zp3zYw==
X-Received: by 2002:a17:907:7207:b0:6f4:43df:abff with SMTP id dr7-20020a170907720700b006f443dfabffmr2191561ejc.681.1651831925959;
        Fri, 06 May 2022 03:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuypM4+wjb8RCEXiKn13/C/jcbMvAb16Y/CKnH+vhFSknF8dWF4Nel0KU0SSXjlm0Y/dgbPw==
X-Received: by 2002:a17:907:7207:b0:6f4:43df:abff with SMTP id dr7-20020a170907720700b006f443dfabffmr2191548ejc.681.1651831925714;
        Fri, 06 May 2022 03:12:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q22-20020a1709066ad600b006f3ef214dcbsm1786804ejs.49.2022.05.06.03.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:12:03 -0700 (PDT)
Message-ID: <f820a98e-8c61-52ad-08f0-e64581930d1a@redhat.com>
Date:   Fri, 6 May 2022 12:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Correct dual fan probe
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        lyude@redhat.com, thomas@t-8ch.de
References: <markpearson@lenovo.com>
 <20220502191200.63470-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220502191200.63470-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/2/22 21:12, Mark Pearson wrote:
> There was an issue with the dual fan probe whereby the probe was
> failing as it assuming that second_fan support was not available.
> 
> Corrected the logic so the probe works correctly. Cleaned up so
> quirks only used if 2nd fan not detected.
> 
> Tested on X1 Carbon 10 (2 fans), X1 Carbon 9 (2 fans) and T490 (1 fan)
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index f385450af864..5eea6651a312 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8862,24 +8862,27 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
>  			if (quirks & TPACPI_FAN_Q1)
>  				fan_quirk1_setup();
> -			if (quirks & TPACPI_FAN_2FAN) {
> -				tp_features.second_fan = 1;
> -				pr_info("secondary fan support enabled\n");
> -			}
> -			if (quirks & TPACPI_FAN_2CTL) {
> -				tp_features.second_fan = 1;
> -				tp_features.second_fan_ctl = 1;
> -				pr_info("secondary fan control enabled\n");
> -			}
>  			/* Try and probe the 2nd fan */
> +			tp_features.second_fan = 1; /* needed for get_speed to work */
>  			res = fan2_get_speed(&speed);
>  			if (res >= 0) {
>  				/* It responded - so let's assume it's there */
>  				tp_features.second_fan = 1;
>  				tp_features.second_fan_ctl = 1;
>  				pr_info("secondary fan control detected & enabled\n");
> +			} else {
> +				/* Fan not auto-detected */
> +				tp_features.second_fan = 0;
> +				if (quirks & TPACPI_FAN_2FAN) {
> +					tp_features.second_fan = 1;
> +					pr_info("secondary fan support enabled\n");
> +				}
> +				if (quirks & TPACPI_FAN_2CTL) {
> +					tp_features.second_fan = 1;
> +					tp_features.second_fan_ctl = 1;
> +					pr_info("secondary fan control enabled\n");
> +				}
>  			}
> -
>  		} else {
>  			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
>  			return -ENODEV;

