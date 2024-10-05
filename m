Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420CB18E1F
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728164042; cv=none; b=MC9Rbw5KDWpMrFUO0DZoQrBstr0P1Kr3D+wmbyHKlqm1DplY+Qqq/NfyzoGvSDlNwk39U4JUk+jz3AEsqpLFOj9Ot7JNBlDLH7l5diQ4MfvQNc+prUVAICf0uRskFuZsJFj7OduHxK8sgj9MYegf37dc7drP3XKgyq55aPUk1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728164042; c=relaxed/simple;
	bh=CayH1T2zeNlJxzLMzr31a5iHie8N/GAbZI3uoiRPhiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sGnSJ8POPsnVq9HJHTOLVUZLBuBktkSxjcdxOLsrr+4RRJcEhtlTTplx+XyPNHc4nYwE4vkknhCQdcg9KqZi5zNRJa6csRb0rr4RQv2oSSWJ+9dKMXbhDwGWfgLwBbWzGnlYD9RAE3Oe+WuVIc13BrXNG2ORTdoe2up8IyOTk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTFIaG3O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTFIaG3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728164038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XBg77PeCUq/Rx9J+4gYUVfPWAWbX2f9OKNFPezDePY=;
	b=YTFIaG3O5LxvXYqCh0xZirgfE8butqXB+U7SI06sTCtSAiXIv2jJMtLdN513Hv4bUfiJgh
	ipMmJWadJaozZ/DCznE0Q0Z/i21aM7/p0afyUTyq4skqaASxTs2VTnSlyjn8sxO3ngzcQ/
	Ik3T8cEPbXdqR+ocff4DvIgX3ndbaFI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-EcvVs5pgOYGkU3gpWN9eGA-1; Sat, 05 Oct 2024 17:33:56 -0400
X-MC-Unique: EcvVs5pgOYGkU3gpWN9eGA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8a8d9a2a12so310737766b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2024 14:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728164035; x=1728768835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XBg77PeCUq/Rx9J+4gYUVfPWAWbX2f9OKNFPezDePY=;
        b=f2fgGQdK4Fu9LhCRziFQBFddp10i4xlBa0GG+32R0T/YdBeO/xeQaFtiktpx5TtmbJ
         FJ2zMGMUV5J1WQWl87XTdLnE12xKDDZ7s/vadBZp3KA8aBxVybx2EiY0KHc+CygNaxAV
         3dHAD3tyRhHZi7Nm9fKEld1i4D6Qy6niBBHui9xMxiw+BqEWASSC+NZrWplNqmaGyp8X
         k5MygkF7M/EElPQ592i4ODZVqAphGyftv4p/YQBq3Ig1c6XQYz0Xk14/3nUuyWViPTkH
         APaFaUjkMB9Wn1G4tp9kz7pdS8hTO0ihMx8BQrafd7bw1z7CRyRYs88S/9QzOpKZhVn7
         bYOA==
X-Forwarded-Encrypted: i=1; AJvYcCVorGHOqTyPON0gaLl4FQDBy08i9/YpOKqaJYcKgwqWT0Mw20fGj5EZufEBbGm/AFhWaaiVB+TEmh2d6tj6uv5T8ZUk@vger.kernel.org
X-Gm-Message-State: AOJu0YzuV2e73gQ6Y5LHBaLfPwooSmyMhJh2Tl8XWOnlx8dCuA/pJxVg
	XnNqYfDpUl2eqkkxPYjNWwIYts3OQUTxNq0spzsWsFrD/T4RsV4+mbJBhuPSL0U5uml5IBPFnhV
	QME+33QNbWJYnyIdjJMudVfplSVo8VhcJIHq/WyFJRD+BQ7+FP+t33iqhU77esbImz2rS+sI=
X-Received: by 2002:a17:907:3fa9:b0:a8a:87d5:2f5e with SMTP id a640c23a62f3a-a991bd7a1c2mr772882066b.34.1728164035456;
        Sat, 05 Oct 2024 14:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC5eR1SOxMQH2ebvmH6i5G/us+KTbVgOj85h2qnyx8BHsBn4t0VBfM6rzSHFGmwGgcduSlKQ==
X-Received: by 2002:a17:907:3fa9:b0:a8a:87d5:2f5e with SMTP id a640c23a62f3a-a991bd7a1c2mr772879466b.34.1728164034561;
        Sat, 05 Oct 2024 14:33:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9936e62450sm145836266b.46.2024.10.05.14.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 14:33:54 -0700 (PDT)
Message-ID: <660944cf-d239-4da8-aa29-fdcad82614e0@redhat.com>
Date: Sat, 5 Oct 2024 23:33:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix Asus B2402FBA internal keyboard and track point
To: Stefan Blum <stefanblum2004@gmail.com>,
 platform-driver-x86@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <a983e6d5-c7ab-4758-be9b-7dcfc1b44ed3@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a983e6d5-c7ab-4758-be9b-7dcfc1b44ed3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for your patch.

Note you got the model wrong in the subject of this thread,
I'm pretty sure you meant to put "B2402FVA" in the subject.

On 28-Sep-24 6:17 PM, Stefan Blum wrote:
> By default the internal keyboard and track point on the Asus Expertbook
> B2 Flip B2402FVA are not functional.
> 
> Similar to the Asus board B2402FBA, on the B2402FVA the internal keyboard
> is only functional by adding it to the irq1_level_low_skip_override array.
> 
> For the internal elan track point, i have found out that setting the class to
> MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSM makes the track point function as expected.
> 
> Signed-off-by: Stefan Blum <stefan.blum@gmail.com>

Currently this patch touches 2 completely unrelated files. Please
submit a v2 patch series breaking this into 2 patches each for one file.

For adding the "B2402FVA" to drivers/acpi/resource.c we already have
"B2402CBA" (12th gen intel non flip) and "B2402FBA" (12th gen intel flip)
listed. Your "B2402FVA" is the (13th gen intel flip) and there
also exists a "B2402CVA" which is the 13th gen non flip.

So I think it would be best to just fold the 2 existing entries
into 1 entry covering all 4 matching on just "B2402".

Actually writing this has made me take a closer look at all the existing
Asus quirks and I have just posted a series which simplifies the quirks,
dropping 8 quirk table entries while adding support for 3 more Asus
models including your "B2402FVA" model, see:

https://lore.kernel.org/linux-acpi/20241005212819.354681-1-hdegoede@redhat.com/

So there is no need to include the drivers/acpi/resource.c bits in
your v2.

Please do send a v2 for the drivers/hid/hid-multitouch.c change and
please make sure to use the right subject-prefix for that, e.g.
use this as subject:

HID: multitouch: Add support for B2402FBA touchpad

and send that patch to the HID maintainers:

[hans@shalem linux]$ scripts/get_maintainer.pl -f drivers/hid/hid-multitouch.c
Jiri Kosina <jikos@kernel.org> (maintainer:HID CORE LAYER)
Benjamin Tissoires <bentiss@kernel.org> (maintainer:HID CORE LAYER)
linux-input@vger.kernel.org (open list:HID CORE LAYER)

Regards,

Hans





> 
> ---
>  drivers/acpi/resource.c      | 8 ++++++++
>  drivers/hid/hid-multitouch.c | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
> index df5d5a554..c29e71401 100644
> --- a/drivers/acpi/resource.c
> +++ b/drivers/acpi/resource.c
> @@ -489,6 +489,14 @@ static const struct dmi_system_id irq1_level_low_skip_override[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "B2402FBA"),
>  		},
>  	},
> +	{
> +		/* Asus ExpertBook B2402FVA */
> +		.ident = "Asus ExpertBook B2402FVA",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_BOARD_NAME, "B2402FVA"),
> +		},
> +	},
>  	{
>  		/* Asus ExpertBook B2502 */
>  		.matches = {
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 56fc78841..3f93c5ef6 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1992,6 +1992,10 @@ static const struct hid_device_id mt_devices[] = {
>  		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>  			USB_VENDOR_ID_ELAN, 0x3148) },
>  
> +	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
> +		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +			USB_VENDOR_ID_ELAN, 0x32ae) },
> +
>  	/* Elitegroup panel */
>  	{ .driver_data = MT_CLS_SERIAL,
>  		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,

