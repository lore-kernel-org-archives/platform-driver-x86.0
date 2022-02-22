Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F9FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 17:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbiBVRxK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 12:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbiBVRxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 12:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58318C7EA5
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 09:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645552363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wQ/LVO9DJhXqTZzw7gFqkytNSDOBvL251ge3oq6XeEs=;
        b=IugGe3WPKnZOfnwSwh1tXBkthVnGKarwM/dw2ZsC4sMrV7pS5gemqm6UWuiebPAMC/Qvfk
        xwlasEju2BPzP7rB71f7ESwwcDH2tel7Db0T5f1F6Q+WNLuRGz8z1vML1b25rGSPIg3CWt
        JQpJSnnkjKq3yUW7M8IFxn1IGbpVKRc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-lq96c-M7M2qzyRmWTqBRgQ-1; Tue, 22 Feb 2022 12:52:42 -0500
X-MC-Unique: lq96c-M7M2qzyRmWTqBRgQ-1
Received: by mail-ej1-f71.google.com with SMTP id h22-20020a1709060f5600b006b11a2d3dcfso6112611ejj.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 09:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wQ/LVO9DJhXqTZzw7gFqkytNSDOBvL251ge3oq6XeEs=;
        b=XVCBRd5mJrZJP2upf6BKFGqezKlE79Y+645Jjg+1PS1HJs5g3bx6VbTi8yNrdBWR4G
         nvbq8O+hgSIihOsFmym0lA5MUzOm5L8GTwBHDMyddWp1QUh/bm2YQroTGel9YPTJ3Vkl
         2F+brfXcAYrJihQDARjGNcatkeF/4Z7RFAPLnSrSQDq3A41ELO2OkdVHv7kLaOQnO5Vo
         GLu+BWbzUjb6riejwlI7QioTw6ncZBcAiuyoRrdDJc4p1STnYFAIYMTLxgp/nbvEfvoH
         DwAG/sUBPd8rya574atE/axz1pH26ae8PQ5uZkf9gLUiju7Ij+45pfgiDFpra+KT1w13
         htyw==
X-Gm-Message-State: AOAM530eSiZsiHryXPjNkNbyB5nUeOmtiG6TkFYCu2ZNCnJmOvz1hdeN
        1YH2iN872ukHudd3tm0TAqVZx6s7FPZWjLu/2V0fKL9FV2icNjaywd1U/4tJ9kvH+xbwQul7wUG
        D4sOYglfEgDsyz8AqAsTu5WBgOXaNm3kIBQ==
X-Received: by 2002:a05:6402:358f:b0:410:e245:f665 with SMTP id y15-20020a056402358f00b00410e245f665mr27750318edc.212.1645552360677;
        Tue, 22 Feb 2022 09:52:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYu57zGH7FoC0ZsAnB95iaKncOMqWc/rEllHpdQc9rD5Q/AwRNv+vRKgJPskbDcAl9AOsOTQ==
X-Received: by 2002:a05:6402:358f:b0:410:e245:f665 with SMTP id y15-20020a056402358f00b00410e245f665mr27750303edc.212.1645552360523;
        Tue, 22 Feb 2022 09:52:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w25sm216840eje.71.2022.02.22.09.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 09:52:40 -0800 (PST)
Message-ID: <b1cf812d-5e9f-bf9c-a864-b5a3d6217457@redhat.com>
Date:   Tue, 22 Feb 2022 18:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] lg-laptop: Recognize more models correctly
Content-Language: en-US
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <cover.1645278914.git.matan@svgalib.org>
 <c83c1074057eec03595b22cbb671a7fb3ebcf192.1645278914.git.matan@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c83c1074057eec03595b22cbb671a7fb3ebcf192.1645278914.git.matan@svgalib.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/21/21 08:43, Matan Ziv-Av wrote:
> LG uses 5 instead of 0 in the third (second after 2019) digit of
> the year string to indicate newer models in the same year.
> 
> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>

It seems that you accidentally resend this one, it was
already merged quite a while ago...

Regards,

Hans


> ---
>  drivers/platform/x86/lg-laptop.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index ae9293024c77..a91847a551a7 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -657,6 +657,18 @@ static int acpi_add(struct acpi_device *device)
>  	if (product && strlen(product) > 4)
>  		switch (product[4]) {
>  		case '5':
> +			if (strlen(product) > 5)
> +				switch (product[5]) {
> +				case 'N':
> +					year = 2021;
> +					break;
> +				case '0':
> +					year = 2016;
> +					break;
> +				default:
> +					year = 2022;
> +				}
> +			break;
>  		case '6':
>  			year = 2016;
>  			break;

