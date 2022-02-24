Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC81EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 12:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbiBXMgY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbiBXMgX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 07:36:23 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5AC27DF2D
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 04:35:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id i19so1012168wmq.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C7NQnYo2I1bu6ZKbCSiPu/hawbGcjV7VyXVe1b8Z0xo=;
        b=TSQ7zKJcEWfsKj113zbPy0KjJtNWbzWXV6fODjwKtKLR5zyzSk6GnAXs0ZhM4ucJAE
         3ZxOV7E9QKSgh4eP+ebUqluGpTCOFft1heBXCfTC8oJgjO55aFzXcJa9mt1nCfMdwABY
         Cd1S0hW+/CqNfjML7SOA+KcHGI+k3VL7RzkcvHVguhOx5DbRI+Amwto0UHQVOvjbw98m
         6p1d2tSGrCegJwK9lwh+sVTL4mzO59YIRjgCIZVPAo3Otpy+PmQorJ9vp5PFRJ6wjNRt
         +7g/qEd+MjJ7TCNqcXJ9T7UsGG2LnmyhGwO7dzBhEbmzQevYfAQuJ99KzPIumDJUsEq/
         GWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C7NQnYo2I1bu6ZKbCSiPu/hawbGcjV7VyXVe1b8Z0xo=;
        b=DKpMAaSfImTXZwvMrpvPkV5f4pW2n7WF5TlMHaH8EYWBDLM+jnpkRbx5c+k1dTAk3q
         xT8+EC1Nv3DAmQ1p5kJ+ypfcU6EJY2pPlEJbi9yAJHqYS2yGqQopc6OWlnE6tTXCsYIg
         8uLzXG9dpfaucQp7RUIb1ph6NsSLbmsUiexfHgYbhzfrb8L2jcxpSP8I3d+Gpv38He9y
         drfq7P78svRg2VgW/tPdbrvHPthg9xPUWgfKEP/xZgmCI8F+e61rY7pUxVcKk+KET2iq
         LT/B/bwx0SlDXWOvAybiErzb1IOI3qaW4ldEj0VLbeDbIwK72jbYI3E44ylgQOYMQRqx
         qTCQ==
X-Gm-Message-State: AOAM531F83xQStFg6hsNy/VYHDuUn1ifJZ2lMlv52tzUikdAjdu6e5mf
        ewKeRutWgznzdy/xGkv78QOd6903RNNmng==
X-Google-Smtp-Source: ABdhPJxhU0h6gjD+XjaIIOVoD/BLojeAtBtPcazxB2TwKfRfmT4pTVf7hcC6C0Uu+ePNaY1aNqUq+Q==
X-Received: by 2002:a7b:ce8f:0:b0:380:f8b9:4413 with SMTP id q15-20020a7bce8f000000b00380f8b94413mr2101790wmj.112.1645706151848;
        Thu, 24 Feb 2022 04:35:51 -0800 (PST)
Received: from [10.16.0.7] ([194.126.177.11])
        by smtp.gmail.com with ESMTPSA id n11sm2464495wms.13.2022.02.24.04.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 04:35:51 -0800 (PST)
Message-ID: <10442635-6629-cfd1-1c09-e4388a194bec@gmail.com>
Date:   Thu, 24 Feb 2022 13:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220224101848.7219-1-hdegoede@redhat.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220224101848.7219-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/24/22 11:18, Hans de Goede wrote:
> The battery on the 2nd hand Surface 3 which I recently bought appears to
> not have a serial no programmed in. This results in any I2C reads from
> the registers containing the serial no failing with an I2C NACK.
> 
> This was causing mshw0011_bix() to fail causing the battery readings to
> not work at all.
> 
> Ignore EREMOTEIO (I2C NACK) errors when retrieving the serial no and
> continue with an empty serial no to fix this.
> 
> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks for fixing this! This has been bugging us over at
https://github.com/linux-surface/linux-surface/issues/608.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
>   drivers/platform/surface/surface3_power.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index abac3eec565e..b283bc9bb5fd 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -232,14 +232,21 @@ static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
>   	}
>   	bix->last_full_charg_capacity = ret;
>   
> -	/* get serial number */
> +	/*
> +	 * get serial number, on some devices (with unofficial replacement
> +	 * battery?) reading any of the serial no range addresses gets nacked
> +	 * in this case just leave the serial no empty.
> +	 */
>   	ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
>   					    sizeof(buf), buf);
> -	if (ret != sizeof(buf)) {
> +	if (ret == -EREMOTEIO) {
> +		/* no serial number available */
> +	} else if (ret != sizeof(buf)) {
>   		dev_err(&client->dev, "Error reading serial no: %d\n", ret);
>   		return ret;
> +	} else {
> +		snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>   	}
> -	snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>   
>   	/* get cycle count */
>   	ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
