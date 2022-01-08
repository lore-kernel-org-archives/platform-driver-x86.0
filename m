Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C262C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 Jan 2022 15:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiAHP6R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 Jan 2022 10:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49094 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229521AbiAHP6Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Jan 2022 10:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641657495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rNbUDMs/nU0pK6hRZTA0pniGuuhHtut4pZqHhyROkQ=;
        b=W12RWn32PHYkgkCotYuzN9dY0VWkiudKonDBqGOiNZR94HGzjgxwNHon1ktm/7U25nqVid
        vnj40v1It4g1dtjMXGLdE2MenaxL+UmNt+PwLbwsdIc3rNy4TmriIkPe5YO9xIUqq6AgvC
        xaNJVRKm9rVD7mDHRYADgDr96oj1o9A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-jgagFZaGOZKkVrOIJwNZ8A-1; Sat, 08 Jan 2022 10:58:12 -0500
X-MC-Unique: jgagFZaGOZKkVrOIJwNZ8A-1
Received: by mail-ed1-f72.google.com with SMTP id i5-20020a05640242c500b003f84839a8c3so6973804edc.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Jan 2022 07:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4rNbUDMs/nU0pK6hRZTA0pniGuuhHtut4pZqHhyROkQ=;
        b=veEIVJbAV/rrHxOw6Bq5rDzKwphCwWGvVBZK246rO9xLXyQ1tXdx9NpwTgie+OhMrM
         /rC3RV0RYIPdepG/Xs3BoqoBJkzyCe5gIq7KNMKBQ7VCQcD4TGfRJCK+s78M3OQAOriw
         TGYn0q7AchvS9TViEh6NVx3yShyBZN0Q3W3T1D596VBqSFEGm2nBB5WS8+ggUpW9EvlX
         vwFKGtv+WwWwu+0jD1FTF3BcSWSYaQpei7xmB5jYn4a1L8NrkP/hfoF5HUZK7gCYuYkw
         v1sgGBcdwnc9JE5OJepMgBXespa1QUQKi0Vh4MzTQZhDnyULkuc0anvQhBu9quxJK9KD
         SG+g==
X-Gm-Message-State: AOAM532k/T8+XGQS4VCPH/R3fS9w9QAjdxh7thzhNkul4XvLfZL65nzk
        TplHo35XUsIt2UvVqgIRO9iJptgJSmwlt90LQtnYHaY0rjmECqBxvG7ukTjpbCF7DHJxquBv4wZ
        fB4EBGnKOS5C9PgD9x6v0jzVKDJQzmu+vMA==
X-Received: by 2002:a05:6402:1112:: with SMTP id u18mr2921014edv.150.1641657491306;
        Sat, 08 Jan 2022 07:58:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkVniCuztAIwuQofyO6kjJmJv0k62jmMj1IxPSHgF/bsHr5EijLhI8eC3roCTS6pVRluW6ww==
X-Received: by 2002:a05:6402:1112:: with SMTP id u18mr2921004edv.150.1641657491156;
        Sat, 08 Jan 2022 07:58:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b4sm603378ejl.206.2022.01.08.07.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 07:58:10 -0800 (PST)
Message-ID: <1e7984c0-15e1-d9ad-9f67-243a8ea641f8@redhat.com>
Date:   Sat, 8 Jan 2022 16:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: int3472: Add board data for Surface Go 3
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     markgross@kernel.org
References: <20220106232045.41291-1-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220106232045.41291-1-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/7/22 00:20, Daniel Scally wrote:
> The Surface Go 3 needs some board data in order to configure the
> TPS68470 PMIC - add entries to the tables in tps68470_board_data.c
> that define the configuration that's needed.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

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
> 
> Hans - I based this onto the platform-drivers-x86-int3472 branch, hope that's
> right. Let me know if it needs to be rebased.
> 
>  .../x86/intel/int3472/tps68470_board_data.c         | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index faa5570f6e6b..f93d437fd192 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -110,6 +110,12 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
>  };
>  
> +static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:01",
> +	.tps68470_gpio_lookup_table = &surface_go_tps68470_gpios,
> +	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -125,6 +131,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&surface_go_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
> +		},
> +		.driver_data = (void *)&surface_go3_tps68470_board_data,
> +	},
>  	{ }
>  };
>  
> 

