Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65163C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 10:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349745AbiBCKfD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 05:35:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41060 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236669AbiBCKfC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 05:35:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643884502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Iv+HnSVfFRA4dcKTXdg0IkPA/jRlX9Ca4xJ/f2UQXvQ=;
        b=N7v+6Gw5alqS/W8EslrU0itW4Tx4Hv2kLmmOyrGVttidMdbKkKIlnpsFqONzW5dE/Lp3BF
        s7PbjKJjzfxkelo5wcDcIXKuIMi9vVJEFBbuMe3djqTKIIGm2tsBrTnAVc0J3DxHealY5x
        JnNkVezPwwKbD0reuq2eYkxkRB61r0U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-ifJypHLWON6hhSuzL7g8RQ-1; Thu, 03 Feb 2022 05:35:01 -0500
X-MC-Unique: ifJypHLWON6hhSuzL7g8RQ-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a50fd16000000b00405039f2c59so1251935eds.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 02:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Iv+HnSVfFRA4dcKTXdg0IkPA/jRlX9Ca4xJ/f2UQXvQ=;
        b=mbix5wE8UvFDKI5w/3JSHeug/q2+iBpoeFBJgxWPSCuFXaq4dt0N2fBQKpig+q38nL
         RVwZfYftG/rfvjlW5vR1KFhuxSKM42hUmIfb+ZbIGplvIBbKw3Ny5iIMAP8QDVfSQyLk
         1jyns+AKTDR6lNxC5iBfDgodJn8IjOtcO8UK2fSSYX9TVigQuJyBhyxof/AAapWOwsDi
         RKHB6T5gAP2RdM66Tf+GDjgdKc5XFs53thUgqUfnchqA/MNW1LsYxZes8iJ364VZnfeJ
         wWxpI6N+qRHIfs+1oTY0yhJ5JaUhtvNDPkBkPF6Vb11tVcUX0/25SijoSpTpzdha90xG
         oi/A==
X-Gm-Message-State: AOAM532aQ82tFDVVKpq7QL9Cnu/dX0yTqoDD6+YvPDDzKTacsUKQLa+n
        mIRt+z5GZyG2cUIVXlvUi5a76Uy6GWR070m1M0g7HAd287NurwCOVLohUAaWG5JPE7lEkJ4Jkv4
        JhwBhI44voT5ylTKN3Gw7It0BkvDfJA+ijg==
X-Received: by 2002:a17:906:2758:: with SMTP id a24mr27762473ejd.433.1643884499921;
        Thu, 03 Feb 2022 02:34:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvBqnmOh/E+vRcRxjK434t+eEd1ap4zf4ASjBpdYgL9Spvf/LG1G4CstfEkNpCGFwGV/sXUw==
X-Received: by 2002:a17:906:2758:: with SMTP id a24mr27762461ejd.433.1643884499775;
        Thu, 03 Feb 2022 02:34:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id h16sm5634587ejj.56.2022.02.03.02.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 02:34:59 -0800 (PST)
Message-ID: <881a32a6-2a50-d1e3-5b5d-a300eb5841b0@redhat.com>
Date:   Thu, 3 Feb 2022 11:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add dual-fan quirk for T15g
 (2nd gen)
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        David Dreschner <david@dreschner.net>
References: <20220203103302.49401-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220203103302.49401-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 2/3/22 11:33, Hans de Goede wrote:
> The ThinkPad T15g Gen 2 has 2 fan, add a TPACPI_FAN_2CTL quirk entry for
> it to the fan_quirk_table[] so that both fans can be controllerd.
> 
> Reported-and-tested-by: David Dreschner <david@dreschner.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index bd045486b933..3424b080db77 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8703,6 +8703,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
>  	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
>  	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
> +	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
>  };
>  
> 

