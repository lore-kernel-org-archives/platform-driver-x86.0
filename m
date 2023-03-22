Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6308FC6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 17:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjCVRfm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCVRfl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 13:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E581141B7D
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679506492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sEppU8jPGeXwLeP3psOHcjcXbGFbF8/6px5b31EyYAE=;
        b=hM1WWwx3a98KCnZZH1Tw7nZYIWGjvDUEdzMvstPSHy09L1w8yW80VAMfFkqfHT8xlc+YoN
        Jl7mRD+qgeZc7jhYljRlLLT72JCu0d/ThnXrKcB5tR9DAhQglhNL4qX6l+P8MIPiy4ZgBy
        K8+LqYi4sNvLO2ZDjnSJBirS035eskc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-0-dkg2UiOSCLwaHdnqKnfQ-1; Wed, 22 Mar 2023 13:34:51 -0400
X-MC-Unique: 0-dkg2UiOSCLwaHdnqKnfQ-1
Received: by mail-ed1-f69.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso22096456edb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEppU8jPGeXwLeP3psOHcjcXbGFbF8/6px5b31EyYAE=;
        b=IKIlXKfLCTye5y6xOzs0qU9D4H1zkQHsc0G9dfku/x70QSrSITeZDr8Bbi6QBQG9Fn
         B7ed3Dr3mFR185VplA7BSB6qzrdts88wds9OE2IvQfGkmzRERE7j0QYb4TH2W0SbQIfO
         QqocV4MBHjyujRwZkjmqIjZKjMVLMV4NmKaMCeaIsihgo5y+1f4ErCRx47MHlmK7mYfw
         cTFIPj3/e3j/nW7+wAW6AxORD+qU2nttCPGM1KeRo8IFUNjMtvpkOaPrgbQjL5PTXVv7
         WWBKsKoWQTu2nvHy4F4drSEfcGXMyiSxLrm297YSiVMJz2zNRqeZ2Tysb6ae+elX0JE8
         /MUQ==
X-Gm-Message-State: AO0yUKXDaGM0jrhA/u1b9/UQpj9cGYx4Cq7SvPsZJ+ThBj6c9YC8Ngcy
        Abth3/dGIgUnpew6alC09RaayaqV14lHAEnAdy+Pslb5VfM6KKqeJFQf4273rFgtYoIb2d9a3JA
        +Az8+zsBihMbSHybVRy02O11m5Qp33Ar6OarsA99Z6A==
X-Received: by 2002:aa7:d990:0:b0:501:caae:e0de with SMTP id u16-20020aa7d990000000b00501caaee0demr8185465eds.4.1679506489673;
        Wed, 22 Mar 2023 10:34:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set9PgS3kaidYhV9lemzJXhmJzARDYcOeWat02j02f8hyubTMFbtmqu3D884euBElh899ajJvBA==
X-Received: by 2002:aa7:d990:0:b0:501:caae:e0de with SMTP id u16-20020aa7d990000000b00501caaee0demr8185456eds.4.1679506489386;
        Wed, 22 Mar 2023 10:34:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gz4-20020a170907a04400b0090e0a4e1bacsm7453497ejc.159.2023.03.22.10.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:34:48 -0700 (PDT)
Message-ID: <ed161532-1f4b-74b2-1391-95d06e4c8200@redhat.com>
Date:   Wed, 22 Mar 2023 18:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] platform/x86: int3472: Define LED lookup data for MS
 Surface Go
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-9-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-9-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/23 17:09, Daniel Scally wrote:
> Add LED lookup data to tps68470_board_data.c for the Microsoft
> Surface Go line of devices.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 0d46a238b630..e2c53319e112 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -157,10 +157,27 @@ static const struct tps68470_led_platform_data surface_go_tps68470_led_pdata = {
>  	.wledctl_disled2 = false,
>  };
>  
> +static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
> +	.n_lookups = 2,
> +	.lookup_table = {
> +		{
> +			.provider = "tps68470-iled_a::indicator",
> +			.dev_id = "i2c-INT347A:00",
> +			.con_id = "privacy-led",
> +		},
> +		{
> +			.provider = "tps68470-wled::indicator",
> +			.dev_id = "i2c-INT347E:00",
> +			.con_id = "privacy-led",
> +		},

So this feels wrong to me in 2 ways:

1. It is abusing .con_id = "privacy-led" to enable the WLED

2. You are not activating the front privacy LED for the IR projector. I have noticed on IPU6 devices that the _DSM listing GPIOs for the discrete INT3472 device lists a privacy-LED GPIO for the IR sensor too, which I so far have been guessing activates the actual privacy-LED. As I'm typing this I'm wondering if instead this is doing the same hack as you are doing here ?  

Regardless I think it would be best to turn on the front privacy LED when the IR camera is used too, right ?

IMHO this should look like this (with either the media-core or the driver consuming "ir-led"):

static struct tps68470_led_lookups surface_go_tps68470_led_lookups = {
	.n_lookups = 3,
	.lookup_table = {
		{
			.provider = "tps68470-iled_a::indicator",
			.dev_id = "i2c-INT347A:00",
			.con_id = "privacy-led",
		},
		{
			/* Use regular front-sensor privacy LED for ir-sensor too */
			.provider = "INT33BE_00::privacy_led",
			.dev_id = "i2c-INT347E:00",
			.con_id = "privacy-led",
		},
		{
			.provider = "tps68470-wled::indicator",
			.dev_id = "i2c-INT347E:00",
			.con_id = "ir-led",
		},
	}

Regards,

Hans


