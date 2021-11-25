Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDD7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 15:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbhKYPmD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 10:42:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38548 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356033AbhKYPkC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 10:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637854610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zhoqtGGJ09UEKMxUuZ/JlaIlSckIylowivN8r0i0DTk=;
        b=CRwXy+nWaT0XZKxuPsCVS6yE1rVOEjznuNtg+xb6lZYCbi+pDf1xvbRiK4iZNLocZIZAeG
        MeKNGGlCoAvo5vHHD5WhNqMoE8pCO9qtSnHAan3dH1V8YocVcsdbLcXw7xQoCZH47+qvTk
        rIBOkGPzekmqKFjhp2T99LFBLb/+DrY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-EPubHNCfNgOL_qvPJ-Wu8Q-1; Thu, 25 Nov 2021 10:36:49 -0500
X-MC-Unique: EPubHNCfNgOL_qvPJ-Wu8Q-1
Received: by mail-ed1-f72.google.com with SMTP id y9-20020aa7c249000000b003e7bf7a1579so5776287edo.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 07:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zhoqtGGJ09UEKMxUuZ/JlaIlSckIylowivN8r0i0DTk=;
        b=PTAL2AReQz+Q6TX/q2l+wTTDH+vc5xsJ6odu1knFY+LKvSXrEIubNVJ/uOPdsTjTeq
         Y6bDjQcOn6Ssd/eUxQFYIXMlu+Xs21+VEfdNLOob7L+/0UALsEVaBdKfG4fgTR64vR+T
         nlia4SEuW2IHanlOpqTeIx63o1ASWGMHFxbWiT5UTZ9Fx/y0mOb4T+VywJL/dDCL8uSU
         XlowwzF2OmN9E2H03yXyNw4bYZR4L1/uA7hvlRlcLrs6KtXTOJGWdQrlElNHTz2VBU23
         fHcQA8I9jPSnf15QuekM981iiEGdHpsDUQkRvd17gcolDph9SpS9YhXcNndHme4aQzyX
         4sug==
X-Gm-Message-State: AOAM532+rh3Aa4ew9dP0vsXB5GAfThhMOZ82MR+P7TY9EaD/cAztIMZd
        mlAJ2KMrMwdrtrH0h7Cm3awqlCnnH9RtkpLGW93d6ZYx28RYDgBd4+/FKa5TEtjyrFYMBTuRlmP
        q0LhhGKX6cFv+fMBkn7NoKC8fXN6y88kX6g==
X-Received: by 2002:a17:907:7f25:: with SMTP id qf37mr32108249ejc.147.1637854608114;
        Thu, 25 Nov 2021 07:36:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHJNsp+/+cVgjH8UqIQztOqPUmDMQU/Vb4C/adM12WJ6PBqEQVAGnSYgBq2rS1uh8BYFOu4g==
X-Received: by 2002:a17:907:7f25:: with SMTP id qf37mr32108226ejc.147.1637854607935;
        Thu, 25 Nov 2021 07:36:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ga37sm1723794ejc.65.2021.11.25.07.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 07:36:47 -0800 (PST)
Message-ID: <db4c1343-a13c-8690-4903-8d7d97b51e7a@redhat.com>
Date:   Thu, 25 Nov 2021 16:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add TrekStor SurfTab duo
 W1 touchscreen info
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211124175125.250329-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211124175125.250329-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/21 18:51, Hans de Goede wrote:
> The TrekStor SurfTab duo W1 (ST10432-10b) has a Goodix touchscreen which
> has its x-axis mirrored.
> 
> Add a quirk to fix this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this patch to my review-hans branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/touchscreen_dmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 8e7d42df02da..1c3d2dca420d 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -914,6 +914,16 @@ static const struct ts_dmi_data trekstor_primetab_t13b_data = {
>  	.properties = trekstor_primetab_t13b_props,
>  };
>  
> +static const struct property_entry trekstor_surftab_duo_w1_props[] = {
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data trekstor_surftab_duo_w1_data = {
> +	.acpi_name	= "GDIX1001:00",
> +	.properties	= trekstor_surftab_duo_w1_props,
> +};
> +
>  static const struct property_entry trekstor_surftab_twin_10_1_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 0),
> @@ -1511,6 +1521,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Primetab T13B"),
>  		},
>  	},
> +	{
> +		/* TrekStor SurfTab duo W1 10.1 ST10432-10b */
> +		.driver_data = (void *)&trekstor_surftab_duo_w1_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab duo W1 10.1 (VT4)"),
> +		},
> +	},
>  	{
>  		/* TrekStor SurfTab twin 10.1 ST10432-8 */
>  		.driver_data = (void *)&trekstor_surftab_twin_10_1_data,
> 

