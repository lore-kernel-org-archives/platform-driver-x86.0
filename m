Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE93C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 14:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbiF0ONw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 10:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbiF0ONv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 10:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0E8513EAB
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656339229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PaBchH00/cLTwlFioUfw/jt6my8axMDb4JnaGlug/JM=;
        b=HBxzSWLiyKVj1YIqyANMimF7dVo70ZHqd3lS5nD3kasmAruDq6xXHLM6q0q6vL5bOl6ozf
        CxTN27z67l3g6LDn0FUXBMUXoWtYBcpJZiUkIm5r0p4mAvYng6dDuXJnrg7D0Wkx2HtnLC
        +fjVdr2xJA4+wly5QCirszLXLRQ4enk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-IXxc4SyJOtq7eJlZy1k5kw-1; Mon, 27 Jun 2022 10:13:47 -0400
X-MC-Unique: IXxc4SyJOtq7eJlZy1k5kw-1
Received: by mail-ej1-f69.google.com with SMTP id hq41-20020a1709073f2900b00722e5ad076cso2493042ejc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PaBchH00/cLTwlFioUfw/jt6my8axMDb4JnaGlug/JM=;
        b=lXZ/Wm0Flw99FMKxa4AiZ177j3hn9RAC3hR9VscXEwNgI/qFksdPilZ0N2WNoG35ub
         MjqhnARB/bD6bCcaiz32G3VQnMCVpPYgMU6GatfpiYUP4iFIsvgHdKOz9F0nbve9xYQK
         Wjw1fK4YR6p54qKjlHd0cJarz+dzlrFO70zgnXVDbyUTJWN/aMmeXANEvznva13dmxu8
         UM/WPiymAqwpMEIZPrscRK6sgekuWcOZQ7Jq6Ces0i9zYKS0UUNrUnMDBepk+fBSwvYx
         XBSof7E805vmbR+KtQGfen1Z16gThCCiCfFrI3ho8EQ1CyPOZFsIYpOLF2rvNkcQ67dE
         q/bQ==
X-Gm-Message-State: AJIora/MY+J0BQOhjotR44ggmwMM37gdVomPJlKSN2m+yP11jZL18l8V
        3qLOgFKLN9IZEvWYIRjHbmVR5atLN8go8J9uw5ZyV+JHqiEmBNl9Tda646RmiBY70XZpuTVXJpK
        ntZAU8Pg6LVZqpqEJZBBe/krr/ZRxM/rhUA==
X-Received: by 2002:a50:fb13:0:b0:435:90d1:19ca with SMTP id d19-20020a50fb13000000b0043590d119camr17096508edq.159.1656339225178;
        Mon, 27 Jun 2022 07:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXpSBSnnMN1aRdOuqu4lYaagT+7DB/EaNPUVgUryz82H3cqCybLeL6v5W/xUURV0v9dvjV3Q==
X-Received: by 2002:a50:fb13:0:b0:435:90d1:19ca with SMTP id d19-20020a50fb13000000b0043590d119camr17096488edq.159.1656339224985;
        Mon, 27 Jun 2022 07:13:44 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709061b5700b0070e3f58ed5csm5111626ejg.48.2022.06.27.07.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:13:44 -0700 (PDT)
Message-ID: <19243ae0-241a-f8ad-0782-34fc5730ffd2@redhat.com>
Date:   Mon, 27 Jun 2022 16:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] platform: x86: ideapad-laptop: Add Ideapad 5 15ITL05 to
 ideapad_dytc_v4_allow_table[]
Content-Language: en-US
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20220627130850.313537-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220627130850.313537-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/27/22 15:08, Hans de Goede wrote:
> The Ideapad 5 15ITL05 uses DYTC version 4 for platform-profile
> control. This has been tested successfully with the ideapad-laptop
> DYTC version 5 code; Add the Ideapad 5 15ITL05 to the
> ideapad_dytc_v4_allow_table[].
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to my review-hans branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/ideapad-laptop.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 3ccb7b71dfb1..6b472fd431d0 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -871,12 +871,18 @@ static void dytc_profile_refresh(struct ideapad_private *priv)
>  static const struct dmi_system_id ideapad_dytc_v4_allow_table[] = {
>  	{
>  		/* Ideapad 5 Pro 16ACH6 */
> -		.ident = "LENOVO 82L5",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "82L5")
>  		}
>  	},
> +	{
> +		/* Ideapad 5 15ITL05 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad 5 15ITL05")
> +		}
> +	},
>  	{}
>  };
>  

