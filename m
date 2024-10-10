Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9219F41D
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553252; cv=none; b=Ld5OIny/H7dRjMZXTfoX6PXyPUnYf8LFD3mgcESzKkkxqO+B7RCuN051gD636lcui1ceH2CtW2x59zfUbnOHljLgfMWWoIDU8RyVR6khF0KZBg2R3VtO1Ayhs+g6s3Je+VBuqRwxLvX8/P0p/G5rVAnjDAm0v/Tigm1tnfra/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553252; c=relaxed/simple;
	bh=e8R74kM4mPG1ed1AIErXucQF2cYAg0bgQggJFQ4Numg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX2p12GXFAC+N7HxKa2W3Sw7lVaDCgObkp/Yqw87AD/j1a2alqlzrPsYISZTov3q3ul0S/SfDIga79bm5gAOakDka/Nt3MBK9yyZZMFzt6l+rD/IqklHFB4+ut1jiIlO7WjkCPlbQY3RgQHVt/8j0iEKa6yAJDu9MuX6IDQZNdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hY3vnkI0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hY3vnkI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728553249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eXMNh8HkQHbT6f1Sbmj7JQ1SELTwJXctNZOXP79wsf0=;
	b=hY3vnkI0q1XSd1NMQO0F5PbdAhM/wZUzUqOWyCuo7kKF/A/FIWJTaOtbXqMAvyJB/sL9dg
	zGN40HlnwyJTgEDflT9hpQi9ElLZocu7lgxnDJmXri7tyHv+sRs/7o9ID7BxDnUPS75r8G
	/I0CeCjO5jmsiELYjNFYhls9HKLiE8c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-nw08SQ8iMQu4bPoWD_c6rQ-1; Thu, 10 Oct 2024 05:40:48 -0400
X-MC-Unique: nw08SQ8iMQu4bPoWD_c6rQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a994fb94446so85847766b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 02:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553247; x=1729158047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXMNh8HkQHbT6f1Sbmj7JQ1SELTwJXctNZOXP79wsf0=;
        b=FprlrxhpcoxHjaCVBjAWXJE2kr3aMM9O6X5UZKGZjq0H6u+jYbgA4/aMeGujC4JaBe
         kImFyylq7cvF1X7v+2v5O59MYcuZmd+7toiXMaZxC6zzkItnLWPYjeuz2X9Uq0/CyJ+6
         /uZSP9dF63i6JieDNc1GCoZnzCFaUHX/Q6AMR12Nvb3DjTM+gaxTLWNp7bFxrS1NJknC
         mBsOui0ZMIBbWARLF49LgIbj6tRog/UGw7QpICcly9RgIuouE4MvZQjUDx9IgHEUmgix
         2fnHSvNHqGGP6AKSZtIf3i+YtrMjeV7qitsTCwCEenr/mQNrSlfr3eT6ESKMgfKmZsdg
         +7ug==
X-Gm-Message-State: AOJu0YyjegquTxpWHOGgwGa14kHwW4FNmPRrTt1NqVhAT+1Ye5fALXXK
	qLkB9HmaNaH7EkTavfE3CLRboCHVQY8QFQaUy8VmwceauxRnvODIo5ZTJePxA+TCOZ10vM68lTp
	b9f9fimAzHjUQw+iycujBPm3wBTrfCjiz4roHYTIYG7EQZ19fazPDVa+GEI3ZENyNqscCIMo=
X-Received: by 2002:a17:907:d0c:b0:a98:f44d:a198 with SMTP id a640c23a62f3a-a99a0ebe7eemr258244966b.1.1728553246779;
        Thu, 10 Oct 2024 02:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyPVLsovtIuKX040BgGyYevVIq+FVcn4t9AAjJD1tbqlLyZN1eCnrRWTnDDqHb+AmRsjeCFg==
X-Received: by 2002:a17:907:d0c:b0:a98:f44d:a198 with SMTP id a640c23a62f3a-a99a0ebe7eemr258239666b.1.1728553246047;
        Thu, 10 Oct 2024 02:40:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f27f05sm63046466b.83.2024.10.10.02.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:40:45 -0700 (PDT)
Message-ID: <d49c5a2d-3715-447f-9936-fadba12bb225@redhat.com>
Date: Thu, 10 Oct 2024 11:40:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asus-laptop: prefer strscpy() over strcpy()
To: Abdul Rahim <abdul.rahim@myyahoo.com>, corentin.chary@gmail.com,
 luke@ljones.dev, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241009230558.51892-1-abdul.rahim.ref@myyahoo.com>
 <20241009230558.51892-1-abdul.rahim@myyahoo.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241009230558.51892-1-abdul.rahim@myyahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Oct-24 1:05 AM, Abdul Rahim wrote:
> The function strcpy() is depreciated and potentially unsafe. It performs
> no bounds checking on the destination buffer. This could result in
> linear overflows beyond the end of the buffer, leading to all kinds of
> misbehaviors. The safe replacement is strscpy() [1].
> 
> this fixes checkpatch warning:
>     WARNING: Prefer strscpy over strcpy
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/asus-laptop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index 9d7e6b712abf..d460dd194f19 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1832,8 +1832,8 @@ static int asus_acpi_add(struct acpi_device *device)
>  	if (!asus)
>  		return -ENOMEM;
>  	asus->handle = device->handle;
> -	strcpy(acpi_device_name(device), ASUS_LAPTOP_DEVICE_NAME);
> -	strcpy(acpi_device_class(device), ASUS_LAPTOP_CLASS);
> +	strscpy(acpi_device_name(device), ASUS_LAPTOP_DEVICE_NAME);
> +	strscpy(acpi_device_class(device), ASUS_LAPTOP_CLASS);
>  	device->driver_data = asus;
>  	asus->device = device;
>  

