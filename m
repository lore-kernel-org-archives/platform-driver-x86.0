Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A18BC388F7
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Nov 2020 09:34:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C1E620780
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Nov 2020 09:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z16d3ZM0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgKJJeX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Nov 2020 04:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36541 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726721AbgKJJeW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Nov 2020 04:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605000860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JzzCxlKJHdPFcZr+tDeKtUKZaE4UFvEWpixfCQd55lg=;
        b=Z16d3ZM0AWCLDTs6e9CiiDoM6gDlRt9nA5tgpcpv7t94xfGfPTXDsYO3HePbJ43UdvH4xK
        LnIyeb9ZaDZ5KSUDLMyeNVcRaPP6n6rT+nZ5z7RfPtfqaAkHhRk6SGyvwVm2lDGj8jVCeP
        3VnFK6pXCI0U76aRokO3OU52xMSwbNs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-VLVzc133Pae_Y_AZFzhkpQ-1; Tue, 10 Nov 2020 04:34:19 -0500
X-MC-Unique: VLVzc133Pae_Y_AZFzhkpQ-1
Received: by mail-ej1-f72.google.com with SMTP id z18so4533080eji.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2020 01:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JzzCxlKJHdPFcZr+tDeKtUKZaE4UFvEWpixfCQd55lg=;
        b=bmuRaz+IffoHfno7TyjsKcmE8CwbIRFgDI1+cXyqGRcjT98Rovsqff5olILK53egbY
         1ucubc5VNv7HzhKh6M0xu6E1lDXW8HCOXilD5+6HlQHHmqK8MknUDo9jA/njpZeJ9gs2
         WZayi3eurbxUtbNyicxtLu7QwrbCPXj0PgKrXifdEkV0mr+k2W9RcRmRD7IJwxaeTY6H
         +huzKncM+IG2GYh5ZCl6PPlLcHhd3iKWUjp5bCL9QZc6S4meGgrMsLSm+5aLlzc0EDwj
         CXRbySS2AzEXiv8KyslsnzyO6HTyes3vlSALdM9FcCkuJJSwQiCKSHzJVmjPAbdT3rbM
         ni8Q==
X-Gm-Message-State: AOAM532ksUMHyXgeBL74LXCz/ga96xzs4V3KCQSH1rzmkrWQhtJ3JhsZ
        4Ke6wOcSY/5gtPbbEvv1edHrzCnX5pVnoc6nhFhMn0MMIj8RcdHis5WL2AM0M+ARvwJydOfEoYc
        ASfm2kYlfXPlwB8l1iZSv0my340Wh0Q9RDQ==
X-Received: by 2002:a50:9fe6:: with SMTP id c93mr19768532edf.30.1605000857754;
        Tue, 10 Nov 2020 01:34:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp8JGIc02tnkZuRjGa+y4xY7BKIRPDyIZkJO70wC5Gmq8lIgN8NbgadlL++aqKqHE6qXmnMw==
X-Received: by 2002:a50:9fe6:: with SMTP id c93mr19768510edf.30.1605000857445;
        Tue, 10 Nov 2020 01:34:17 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id u25sm9919437eje.99.2020.11.10.01.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:34:16 -0800 (PST)
Subject: Re: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when
 no GUID is found
To:     Daniel Dadap <ddadap@nvidia.com>,
        platform-driver-x86@vger.kernel.org, mario.limonciello@dell.com,
        pobrn@protonmail.com
Cc:     andy@infradead.org, dvhart@infradead.org, aplattner@nvidia.com
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
 <20200731202154.11382-2-ddadap@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
Date:   Tue, 10 Nov 2020 10:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200731202154.11382-2-ddadap@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/31/20 10:21 PM, Daniel Dadap wrote:
> If a driver registers with WMI, and none of the GUIDs in its ID table
> is present on the system, then that driver will not be probed and
> automatically loaded. However, it is still possible to load such a
> driver explicitly on a system which doesn't include the relevant
> hardware.
> 
> Update wmi_driver_register to test for the presence of at least one
> GUID from the driver's ID table at driver registration time, and
> fail registration if none are found.

This would make the WMI bus different from all the other kernel
bus subsystems where one can happily load drivers even if there
is no hardware using them.

And this would also break being able to manually bind a different
(hopefully compatible but different) guid device through
/sys/bus/wmi/drivers/foo/bind

So NACK to this one from me.

Note please do send a new version of patch 1/2 of this sets addressing
Andy's remarks to the other similar patch you did.

Regards,

Hans





> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  drivers/platform/x86/wmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 941739db7199..19aa23d1cf8e 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, struct wmi_block **out)
>  	return false;
>  }
>  
> +static bool find_driver_guid(const struct wmi_driver *wdriver)
> +{
> +	const struct wmi_device_id *id;
> +
> +	if (wdriver == NULL)
> +		return false;
> +
> +	for (id = wdriver->id_table; *id->guid_string; id++) {
> +		if (find_guid(id->guid_string, NULL))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static const void *find_guid_context(struct wmi_block *wblock,
>  				      struct wmi_driver *wdriver)
>  {
> @@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device *device)
>  int __must_check __wmi_driver_register(struct wmi_driver *driver,
>  				       struct module *owner)
>  {
> +	if (!find_driver_guid(driver))
> +		return -ENODEV;
> +
>  	driver->driver.owner = owner;
>  	driver->driver.bus = &wmi_bus_type;
>  
> 

