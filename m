Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA05E81E09
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 15:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbjJFPdG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 11:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbjJFPdF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 11:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A828AD
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696606340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o4MSm45CD+B8Ts8r+zCzgFvGdfeJ47qZ1DiMag7ZlFs=;
        b=YOeT80ei/zm4BeJnf1MtLu2darqoQQPE1J91EPpnqMCDSSelcGy6VD/ytAdisEUCT4ABBj
        8nUye7TEUSIoAUQGf7BOdGX/vi3ljGMIIq22AZ3brpI8ogKJWFe+jxfqgawgth2roZhI92
        muOKzUF/NhX0lpDBba8ogig8kPHO3Tc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-xFasrIAXNFKlblmcpPpUHA-1; Fri, 06 Oct 2023 11:32:13 -0400
X-MC-Unique: xFasrIAXNFKlblmcpPpUHA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5219ceead33so2042919a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 08:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696606332; x=1697211132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4MSm45CD+B8Ts8r+zCzgFvGdfeJ47qZ1DiMag7ZlFs=;
        b=jffzu5kg6sasdZmpyGOxC8zGVtVo2+7nhnJ1rYSt+Qn5gmCoGJlvjky7ZPqf7shkDw
         k9rBOItNaLxtRg9OK4HE0e9clx3n4ooYXSjM+oz/f2k9QgdzVvCfrq4Pt86991uLiXr0
         D73UHJX4aIOJPZEkKe1qrV82cWOcd1hXNutBZU8eyzib7ouugM8aRIekVOg81QxTOkjV
         yeRA4deo3Ho263nU9cyb1gnnxCdPeVHeAy4woeAtmfhT4RkKZpPMrNiDsO4meq7clYmG
         e3NBNQ1nk2vAKTZNZnmH3/0ClJ3IPNzsaMc34HDCGtYB0EuDmNCoXPMWaET4pRHR2Qdq
         gpDg==
X-Gm-Message-State: AOJu0YzIu4ysdmz7pcs+ue4FoxyDwyER8frnt1Y4deJ5tj8aVzAgXgKy
        xd4hMDZDM+zRDPRRMndTGNS82UqNmy1YrnwcMWm3HMJSN64SNsyk9Ub1M+WlxNis9iSBj1NWgRg
        75igEaukTI2bsF/PreSshMwxqcKH4sNLtJ/df6XDBXw==
X-Received: by 2002:a05:6402:160b:b0:530:bad5:248e with SMTP id f11-20020a056402160b00b00530bad5248emr7836041edv.3.1696606332341;
        Fri, 06 Oct 2023 08:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpviVAJbQGnfe0nVTVD5V7XvPwwyBgdlKmAXW0GbRgo33Ry60JGCnaiAZ0u1wNWfUkHrKjYA==
X-Received: by 2002:a05:6402:160b:b0:530:bad5:248e with SMTP id f11-20020a056402160b00b00530bad5248emr7836018edv.3.1696606332058;
        Fri, 06 Oct 2023 08:32:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7dcd6000000b00536e03f62bcsm2750081edu.59.2023.10.06.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 08:32:11 -0700 (PDT)
Message-ID: <9ebb5ae0-2ec0-198c-3843-e44ce84493d2@redhat.com>
Date:   Fri, 6 Oct 2023 17:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wireless: Replace open coded
 acpi_match_device()
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
References: <20231006152739.3495671-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231006152739.3495671-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/23 17:27, Andy Shevchenko wrote:
> Replace open coded acpi_match_device() in asus_wireless_add().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed compilation error
>  drivers/platform/x86/asus-wireless.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
> index abf01e00b799..8b9a0dde34e3 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -148,13 +148,9 @@ static int asus_wireless_add(struct acpi_device *adev)
>  	if (err)
>  		return err;
>  
> -	for (id = device_ids; id->id[0]; id++) {
> -		if (!strcmp((char *) id->id, acpi_device_hid(adev))) {
> -			data->hswc_params =
> -				(const struct hswc_params *)id->driver_data;
> -			break;
> -		}
> -	}
> +	id = acpi_match_device(device_ids, adev);
> +	if (id)
> +		data->hswc_params = (const struct hswc_params *)id->driver_data;
>  	if (!data->hswc_params)
>  		return 0;

Thanks, but the error checking looks a bit weird now. How about:

	id = acpi_match_device(device_ids, adev);
	if (!id)
 		return 0;

	data->hswc_params = (const struct hswc_params *)id->driver_data;

That seems to better convey what the code's intention is.

Regards,

Hans

p.s.

This driver really should be converted to not be an acpi_driver
instead it should bind to the instantiated platform_device
for the adev, but that would require someone with actual
hw access to test the conversion ...



