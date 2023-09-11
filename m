Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2972CA0EC3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355880AbjIKWCP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbjIKL14 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E228FCE5
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694431627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8XU8RLh7grKPuWPmu4OmjyaOM+2R9QefqTD05IQ9xwE=;
        b=iR0ezwhBeto/eQGsJ6BZgjHeQhygXy6YjrSA9mQr1CWL6esKM2kXZZPETnyT7v8ugLCbmO
        we7hGnuV65ENcoxg7vPSq5LU2hXpEbbItod5hmVNgcEoZgQD5dU4us3tBfu9vH71aqnF/w
        3/Qgk4LiD5UlcDL5BGMRLk2hzi0r64c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-dMdnUrJeP-Wc1VEHtRfttg-1; Mon, 11 Sep 2023 07:27:03 -0400
X-MC-Unique: dMdnUrJeP-Wc1VEHtRfttg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9ad73eb9668so30494866b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694431623; x=1695036423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XU8RLh7grKPuWPmu4OmjyaOM+2R9QefqTD05IQ9xwE=;
        b=NhBrCsCPpgLAyffu1ZOzi1DWQhIC3ZGuEJk7EnrOlILCKoGX5JSKbPlb7PMTBXRoo1
         9pSdLRqf3++fq7c09c/LApMdsT/N3SeNf/WGXSscAyg8o8CXe2FYpHGebtphhEC/DRD3
         Tx79gCTaORMr5q7gMo6PI7V9QEzDKONc1G7ISHjRUqQDdwchNvAfZhKjLWpSk/P4P4Qo
         LukVzmKHy7+hX5hyrjsFykss1mf7oEZYgo7raqRYtjgff1htIVjta7sw0pM6OLJFXqZ/
         lDLuuFjOTINV6RaR6qFVEm9tNHVKchgWoxlvFOgxOX67NzvmSGu9QEaCOwBVD6H9nP0e
         Skpw==
X-Gm-Message-State: AOJu0YzNQjEa0pqFVEH6DLE9R69/0HRWSThA8iAJdfW+b6eyPAJ7cQUf
        hBKlV+CxuHQ8uVlxRQfMiBD4kQSoBfu9Z8BeBpQoMQO9amAAt3qX797o1s8Whmfuc74NxVGA10d
        O4nMYT/8i5nFbPtAMmTol4qJQBSM4XPMlrw==
X-Received: by 2002:a17:907:9724:b0:9a5:962c:cb6c with SMTP id jg36-20020a170907972400b009a5962ccb6cmr17846764ejc.31.1694431622919;
        Mon, 11 Sep 2023 04:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ/AHu7nLmYgByLaPLMmYUvX4ccy5bwEbWpR+GUk2r/aBtLdPjo047ti0Vrwz7SNb+Q3eH2A==
X-Received: by 2002:a17:907:9724:b0:9a5:962c:cb6c with SMTP id jg36-20020a170907972400b009a5962ccb6cmr17846740ejc.31.1694431622681;
        Mon, 11 Sep 2023 04:27:02 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906941800b0098921e1b064sm5185543ejx.181.2023.09.11.04.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:27:02 -0700 (PDT)
Message-ID: <aa427e7e-374d-facb-883f-0b9b69ce00c0@redhat.com>
Date:   Mon, 11 Sep 2023 13:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: asus-wmi: Support 2023 ROG X16 tablet mode
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, markgross@kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230905082813.13470-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230905082813.13470-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/5/23 10:28, Luke D. Jones wrote:
> Add quirk for ASUS ROG X16 (GV601V, 2023 versions) Flow 2-in-1
> to enable tablet mode with lid flip (all screen rotations).
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index fdf7da06af30..d85d895fee89 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -478,6 +478,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_tablet_mode,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS ROG FLOW X16",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GV601V"),
> +		},
> +		.driver_data = &quirk_asus_tablet_mode,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "ASUS VivoBook E410MA",

