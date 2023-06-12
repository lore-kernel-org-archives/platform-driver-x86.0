Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980F0C7EE43
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 11:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237639AbjFLLG0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237644AbjFLLFl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 07:05:41 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346D3A5F2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 03:53:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-973bf581759so743546366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686567228; x=1689159228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeQ74c0YOMxY7A99ypxRKDeJFjSoYiwzirFYKv6Fmv0=;
        b=ZSFZbe2OLPlegmAcTsmfykEBv47y9qj0W34tFz2jkUQU8aSO+EzxcQY2WnGnzVOnrm
         nt1GixT1kcNH7B0KXUxLPUfihlUEkUEn39pDnQe4xqa9bU2q53n6DC+XzDmwtcFB0ZbI
         WiVRG9xn1pL8fyr4WQOOmQCCZ0hnDmQziKjntBTUMWXxqKGQzhLGpCzMoh2Ff6elAeaj
         5fXZyOTORtg1vMrxMAOs7dZq1HphzpKOnjE6tGpLcgupW0DDMC6P4mgoZA8hZ8aA/jk8
         VWBWVbHJMpsMqe89Zp2KwroKK0beIYz3VEVu/a5aSj83jO8jvMS09WFe8QJnYoc6HRV6
         jbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567228; x=1689159228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeQ74c0YOMxY7A99ypxRKDeJFjSoYiwzirFYKv6Fmv0=;
        b=ULxtQaehGqC3+JCx1sXcJ3OL9p1A/0TRKxAtlufBN4pWlXrJKyFb9vHEoVwZomqEcG
         KVfI3OaCIYy6k7juyCAcz7WKhfZLatffm+4192BLcsjY4VQwZzcxt0DarIYJLE9sYQgf
         KVmbL+tgD6ZaSu2heQvI5geN9msRdflQAn+VH8/adauLGr6SGQfAQ5dwhTZt3FK/K8u8
         vqVahRycmUM+44kFwsiqQyUDYmnM6UC5EYnlqokvfNXxCId0sMjI3D1r9yZfKHlpGLmb
         MycxfpplBK52xbOkjOxaO9rEuqOJKtwhfsuq1y25NfaYWzK0xbs0c6GQyxL1FC1jpj4/
         +WBQ==
X-Gm-Message-State: AC+VfDwei0K8hBqfnLOV2roKPRJlhEmyparl+arWsRdwnqtOEKC8XhtF
        G0E2Z42K1a38Cunb9xc+7hQ=
X-Google-Smtp-Source: ACHHUZ6g3pnA3dEdOW78X3pTjk/qftCw6VJ3V0YhOU/O9huci2fbKFj2ZqW6RZHnIH0ER1pd4vDCpQ==
X-Received: by 2002:a17:906:eec8:b0:957:943e:7416 with SMTP id wu8-20020a170906eec800b00957943e7416mr10470769ejb.15.1686567228259;
        Mon, 12 Jun 2023 03:53:48 -0700 (PDT)
Received: from [10.27.0.2] ([37.120.217.170])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b0096f738bc2f7sm5079835ejv.60.2023.06.12.03.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:53:47 -0700 (PDT)
Message-ID: <12b4bfb2-54a6-74b5-ee3c-3ddad6c57f37@gmail.com>
Date:   Mon, 12 Jun 2023 12:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] surface: surface3_power: Switch back to use struct
 i2c_driver's .probe()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20230612073902.840435-1-u.kleine-koenig@pengutronix.de>
 <20230612073902.840435-2-u.kleine-koenig@pengutronix.de>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230612073902.840435-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/12/23 09:39, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks!

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
>   drivers/platform/surface/surface3_power.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index 73961a24c849..4c0f92562a79 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -573,7 +573,7 @@ static const struct acpi_device_id mshw0011_acpi_match[] = {
>   MODULE_DEVICE_TABLE(acpi, mshw0011_acpi_match);
>   
>   static struct i2c_driver mshw0011_driver = {
> -	.probe_new = mshw0011_probe,
> +	.probe = mshw0011_probe,
>   	.remove = mshw0011_remove,
>   	.driver = {
>   		.name = "mshw0011",
