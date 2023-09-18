Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53CFC46CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 15:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjIRPYq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 11:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241385AbjIRPYp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 11:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DB01738
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695050409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jZcw24QCuQMXb/c4Rnr0TGPs2LNccYyusLrFb0dmUGY=;
        b=DWfiv7gceNkk2Y2zZAmfchUJvWIUGu8bYSW0Z75tCo19VxbNIxDE6pT548wXr5+CR0zkKB
        3o3m/VYYQ8QPQzF/ScakIBKJAQO7QBa5h2zJU/1AgWSUqmd/Zs4ienrvQp0eqjD1NJqTU8
        CyC8pguoqNiMzSJUgj9nUFV8tDFpzWo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-qc37GLUrNTK-79TwiLME8A-1; Mon, 18 Sep 2023 09:19:20 -0400
X-MC-Unique: qc37GLUrNTK-79TwiLME8A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a355cf318so329799566b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 06:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695043158; x=1695647958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZcw24QCuQMXb/c4Rnr0TGPs2LNccYyusLrFb0dmUGY=;
        b=d5apE9yTet/APKfYXAC/g8FnhVC81OiYf3Xu1OmSoI9iZEiKtQxfOca4TwTLXOyz4G
         7iLAa4esRgb46AkBHa/VfeDbDsMOSnb/bkdjAmc3fPT6Yyg2MtLvrxeCCn0RQ9/5w1Aq
         1N8ER+YwutGsWarsR+pv6nrLaRg/o8QZORzwPnJTVVypo8jVlwI5h1mVKCtaHNqxIYok
         SQxLWGvkj7fbEVI8XOuPI9jLNXM1naszIT5YOhkw+MeCYev/yRNBuye7+jlWjWalr5t6
         rhawuGL1o6x2O2HmBi01e9F0urjGxyc+8oLoFH0N81cut9y33TX6shbSOgA0JblUWPxB
         TKuQ==
X-Gm-Message-State: AOJu0YwRNvPRAwkXYB8AVCm4x1XDJVFU4MCP0W2C90wvKy8MLawxvamr
        NXgacRe/1rbJLV7aYJk9TAQYB09A+tgpiXOummcjZarHBSsZJWLsascBHA+V15A780+jVWvc5wz
        aHQJ0LgW4AvI3VZxpt38AQYJfQbIADVqLE6NnrUp34w==
X-Received: by 2002:a17:906:768f:b0:9ad:fb23:21cf with SMTP id o15-20020a170906768f00b009adfb2321cfmr4324079ejm.15.1695043158332;
        Mon, 18 Sep 2023 06:19:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhi8aWcEBFbpdG7gGdedS12c+zgnSo2kuVB2V7Z1qWQ1Zc5ciYxnbAAXragmKcsTQcaF6PRA==
X-Received: by 2002:a17:906:768f:b0:9ad:fb23:21cf with SMTP id o15-20020a170906768f00b009adfb2321cfmr4324060ejm.15.1695043157978;
        Mon, 18 Sep 2023 06:19:17 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906365400b0099bd1a78ef5sm6433713ejb.74.2023.09.18.06.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 06:19:17 -0700 (PDT)
Message-ID: <39b7e126-a01d-4c8f-a44c-8f72c292adbe@redhat.com>
Date:   Mon, 18 Sep 2023 15:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: Take mutex in
 hotkey_resume
Content-Language: en-US
To:     Dennis Bonke <admin@dennisbonke.com>,
        platform-driver-x86@vger.kernel.org
Cc:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <20230913231829.192842-1-admin@dennisbonke.com>
 <20230914130356.235912-1-admin@dennisbonke.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230914130356.235912-1-admin@dennisbonke.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dennis,

On 9/14/23 15:03, Dennis Bonke wrote:
> hotkey_status_set expects the hotkey_mutex to be held.
> It seems like it was missed here and that gives lockdep
> warnings while resuming.
> 
> Fixes: 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep annotations")
> Cc: stable@vger.kernel.org
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Dennis Bonke <admin@dennisbonke.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note I have dropped the "Cc: stable@..." tag, because the patch this fixes
is not in the last stable release (6.5) so Cc: stable is not necessary.
 
I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index d70c89d32534..41584427dc32 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4116,9 +4116,11 @@ static void hotkey_resume(void)
>  {
>  	tpacpi_disable_brightness_delay();
>  
> +	mutex_lock(&hotkey_mutex);
>  	if (hotkey_status_set(true) < 0 ||
>  	    hotkey_mask_set(hotkey_acpi_mask) < 0)
>  		pr_err("error while attempting to reset the event firmware interface\n");
> +	mutex_unlock(&hotkey_mutex);
>  
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();

