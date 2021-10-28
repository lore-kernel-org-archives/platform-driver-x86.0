Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4EEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 09:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AA8560FC0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 09:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhJ1JxQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Oct 2021 05:53:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42592 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229833AbhJ1JxO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Oct 2021 05:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635414647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KHmPIlPo4TQBX8e1H1w7mrsHKkQlia/t++LcyQ3Sd2Q=;
        b=D3IZoYwGXmDNttyjwRXl/IcbtzSPlNi4Wbktdw54GvWh+JkEkB+ikULvXY0v2zPZe0z9zm
        LCKDxOYs2Xeg362wmTZeYdIDxNrGsOAUxAr8Nshg6cPTcHQBHm6jXGpX2cp8K8ZZt/Tqkt
        t3cJmTBUZszXJOjhMMTP7g9RnniPVHU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-03Pdf2QBP0CrnQmaZ35Yeg-1; Thu, 28 Oct 2021 05:50:46 -0400
X-MC-Unique: 03Pdf2QBP0CrnQmaZ35Yeg-1
Received: by mail-ed1-f71.google.com with SMTP id f4-20020a50e084000000b003db585bc274so5025227edl.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Oct 2021 02:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KHmPIlPo4TQBX8e1H1w7mrsHKkQlia/t++LcyQ3Sd2Q=;
        b=k0xdehLMVvpcOsfEdDD7RXyLbXN4Dr36mX9+7CrBznToXkx7YbQqrTaEdkV2rExPzw
         WKuhO7Ykg7JS0GpW40T9PBYTdwfzrjEFNr7kB3FiqhMlgWxTn/GiAvMd6T2jwZC0L4cm
         GsRqz7/lMSsDAUP9Rcm3+uOfkW9hAQ/hNyN1kKS/Z5h5LtJOuwoAqjM+6A9BNcOaLXcr
         rZm1PCQck+jjZMt3Dc/zfAIInQP3d4axIZepzBv88qlvYEChFaHV2pkG12dVhyT4ONl6
         0axtOi+8YqRF9o4i81JCer7i0gxVZ76VJ18LmZ1IL/My75t9KEorvTyImku8Ek0Fb8ZB
         7+hA==
X-Gm-Message-State: AOAM530+68AQkMUTCOOlNsG1Tudb9Ux7tlNvUlx51lDNENjw62v3eeDs
        13cYg6ZOzX+2td9/UMiidYV6cnjW2tWJIzaTcSDU83EpfCKdg8HNqQRiRGokku2Ji6aTsWuW13d
        y/1cdFGzs/FIVyte+mRqeWzOF25ek326XcA==
X-Received: by 2002:a05:6402:4406:: with SMTP id y6mr4696384eda.140.1635414645076;
        Thu, 28 Oct 2021 02:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhE/Je+U3WWHCCtFnSbqr2ImWnC3Svy76jOJkIH5uGkabvBLwtr+Hpr0YBxLcTzTGBowICeg==
X-Received: by 2002:a05:6402:4406:: with SMTP id y6mr4696372eda.140.1635414644929;
        Thu, 28 Oct 2021 02:50:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id he17sm1135017ejc.58.2021.10.28.02.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 02:50:44 -0700 (PDT)
Message-ID: <325ddfff-1881-1590-f9a0-127545a5b514@redhat.com>
Date:   Thu, 28 Oct 2021 11:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Viglen
 Connect 10 tablet
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Stamp <stamp497@googlemail.com>
References: <20211028094824.84292-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211028094824.84292-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/28/21 11:48, Hans de Goede wrote:
> From: Mark Stamp <stamp497@googlemail.com>
> 
> Add touchscreen info for the Viglen Connect 10 tablet.
> 
> Signed-off-by: Mark Stamp <stamp497@googlemail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans branch now so that it
can be included into the 5.16 pdx86 pull-req.

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 033f797861d8..fa8812039b82 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -938,6 +938,23 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>  	.properties	= trekstor_surftab_wintron70_props,
>  };
>  
> +static const struct property_entry viglen_connect_10_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1890),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +	PROPERTY_ENTRY_U32("touchscreen-fuzz-x", 6),
> +	PROPERTY_ENTRY_U32("touchscreen-fuzz-y", 6),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-viglen-connect-10.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data viglen_connect_10_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= viglen_connect_10_props,
> +};
> +
>  static const struct property_entry vinga_twizzle_j116_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> @@ -1521,6 +1538,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "YOURBOOK C11B"),
>  		},
>  	},
> +	{
> +		/* Viglen Connect 10 */
> +		.driver_data = (void *)&viglen_connect_10_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Viglen Ltd."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Connect 10'' Tablet PC"),
> +		},
> +	},
>  	{
>  		/* Vinga Twizzle J116 */
>  		.driver_data = (void *)&vinga_twizzle_j116_data,
> 

