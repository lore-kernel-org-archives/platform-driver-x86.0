Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE47C77B73
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jun 2023 17:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjFDRJ1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Jun 2023 13:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFDRJZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Jun 2023 13:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21332CF
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Jun 2023 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685898516;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PdD6fLCgV2aQnBd7dmmJ3kgTXzpNFEeCf0r/5R17D2M=;
        b=GcigC972vpXjsLcfGwjKVD955u9F0ZdS5VI8wK4E45bTslZ2/RMSAyg4JZEB2losNQUPfs
        jhU8sv27pZCBcEp7N59FZQiOmHReH1GgA7dHarH4XwwJxBg0tzrhG1l2W+GInLWCTZUpRQ
        AnLW9T34xOLWyU5Y3yBUmLepNnsRcYo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-fzmR_j9wN_mZEDai0WZbTw-1; Sun, 04 Jun 2023 13:08:35 -0400
X-MC-Unique: fzmR_j9wN_mZEDai0WZbTw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9715654ab36so284044666b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Jun 2023 10:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685898514; x=1688490514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdD6fLCgV2aQnBd7dmmJ3kgTXzpNFEeCf0r/5R17D2M=;
        b=grry4DVOVGm0vY4F3pNe2+FzNf63OerKr2y3HijlN7uHvvjqm90YM8JHZ5axY1umdu
         fgJ7Vsf40l9Cpa1xlamN5D/0QFmAH75ZxFETp5ksoJ5TnTZ+f2+7HSHmrso2NfESWsuC
         Huvq6gOP6UG82yK+RVOAzoM+RW9aMuUMqUjyo6aDfdO3IXuX/qcsRhMc41IaOYBPAGs4
         +mtFpNKd5FRLH4VdQNSYQ8wtiG08GUsh+KEBbnbX0TCC/cP8rjXIZELKlRKX0kzFFE8t
         Gyw3B3/8w4gFaLuYBQi7WLn8AsX2obrEW7SpP803WYrM+23xP06cZVipNbnRVwAo3f/Q
         aYmA==
X-Gm-Message-State: AC+VfDzkQfJsGK7qea+9LvHcYALZx5RNFchJExYPQbplhZ//gSwesnra
        QZTM5/0+YsB1hlEdnvZULfUevDi7PB1ZYKFawdbuqYsN1394KtMK0Y8l25Jer6Ui3totMgYKzKF
        QuuhSoNdFDMMHQqoWn1TUW0QsdjmCB3GWGQ==
X-Received: by 2002:a17:907:168a:b0:967:21:5887 with SMTP id hc10-20020a170907168a00b0096700215887mr4095489ejc.40.1685898513854;
        Sun, 04 Jun 2023 10:08:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4TPZilX3j01WIYfIYhahPcl8kTB8RkUD2ANGHMSpVRbwGGQb9vu22ijVQ0bzecqOBy+9DBTQ==
X-Received: by 2002:a17:907:168a:b0:967:21:5887 with SMTP id hc10-20020a170907168a00b0096700215887mr4095470ejc.40.1685898513516;
        Sun, 04 Jun 2023 10:08:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j24-20020a170906095800b009659fa6eeddsm3269450ejd.196.2023.06.04.10.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 10:08:32 -0700 (PDT)
Message-ID: <48a267c4-15c5-4ab6-7704-f7ee41e2fb90@redhat.com>
Date:   Sun, 4 Jun 2023 19:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 4/4] platform/x86/amd: pmc: Use pm_pr_dbg() for suspend
 related messages
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Rafael Wysocki <rafael@kernel.org>, linus.walleij@linaro.org
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com
References: <20230602073025.22884-1-mario.limonciello@amd.com>
 <20230602073025.22884-4-mario.limonciello@amd.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230602073025.22884-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/2/23 09:30, Mario Limonciello wrote:
> Using pm_pr_dbg() allows users to toggle `/sys/power/pm_debug_messages`
> as a single knob to turn on messages that amd-pmc can emit to aid in
> any s2idle debugging.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me.

Here is my ack for merging this through the linux-pm tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/platform/x86/amd/pmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 427905714f79..1304cd6f13f6 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -543,7 +543,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  	}
>  
>  	if (dev)
> -		dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
> +		pm_pr_dbg("SMU idlemask s0i3: 0x%x\n", val);
>  
>  	if (s)
>  		seq_printf(s, "SMU idlemask : 0x%x\n", val);
> @@ -769,7 +769,7 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  
>  	*arg |= (duration << 16);
>  	rc = rtc_alarm_irq_enable(rtc_device, 0);
> -	dev_dbg(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
> +	pm_pr_dbg("wakeup timer programmed for %lld seconds\n", duration);
>  
>  	return rc;
>  }

