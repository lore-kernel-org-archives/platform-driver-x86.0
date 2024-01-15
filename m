Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5D2919
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jL3DD1Am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705322605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTCr4O0cnEB6887SnyQ20ITMATSe+ONjXKbD6utEnOE=;
	b=jL3DD1AmMwfvj3QcGSQCwQ8qpLoX2winDHEuR+1hvSG+pGKZQe5b+W2YYFj3+6vDQ1vo4n
	ha5wICEbo6BFdPNfbXgdYKvsctHsSId0LRza/wHCSr1M1AA/t93GBYnO+dYRaIJki+decn
	RGo9lLePnW+9zJnEwpI+KBGs6i4PM9k=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-MqIm0vmZO1-JEIITnk-g6w-1; Mon, 15 Jan 2024 07:43:24 -0500
X-MC-Unique: MqIm0vmZO1-JEIITnk-g6w-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50e9e5c8f49so6575675e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 04:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705322602; x=1705927402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTCr4O0cnEB6887SnyQ20ITMATSe+ONjXKbD6utEnOE=;
        b=FP8B8LDGvfM9eECgKgZXoz2nFFtPeO3bCb+SMLxx9vDFQePVE+7iyx+jH5stfosAX7
         5fZlKPVH7/dYflQIRxsmhUkD9FUE65vn8gRAcnTybZ6QOcIQ6E+JYqHQV0wfSX83iw5/
         46VEyoPTYdM5E/C+n1AwE45rNR/jE/IXE5fUIJCBZM765GwxFa/bhK/hg/JdwnMhuiOe
         h25qAtB+23eK9iPgX/X/0X0EkFMX/HULdnM/ACiZQS/FzdDp1MsWovyjebXoChFdLeYV
         RcPiVmr0re1uPh4I3HduS1waDYcJNcoxjqNhSUwWJrcpJZbkuXUr2wcbTKFn6ew+Gn/r
         2F/g==
X-Gm-Message-State: AOJu0YyuG6WzUqjrDOtUBlNs6cg55v4pxYnUnr2htR/MdM1z6s66nOWF
	kJWmsi7LJnhQGzW5GdxG4tUVT3lIB5404qeIx7d6ns3WQOXCp64PIXdebdeFHe2BeemoP93SVqP
	JSzFRecEX/oh3jVoW1f1SpRyVBw10tNLM5JOMBmbozQ==
X-Received: by 2002:ac2:4346:0:b0:50e:9367:f0ad with SMTP id o6-20020ac24346000000b0050e9367f0admr1433683lfl.58.1705322602760;
        Mon, 15 Jan 2024 04:43:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt5ODxJk/7deNQoXY1A6TUsxLRCuO3RR8sQ+FaJ6DTLpcT/hiS8qev67rZs6S+Xtx6vrnOMA==
X-Received: by 2002:ac2:4346:0:b0:50e:9367:f0ad with SMTP id o6-20020ac24346000000b0050e9367f0admr1433680lfl.58.1705322602450;
        Mon, 15 Jan 2024 04:43:22 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id n7-20020a056402434700b0055915dc8e74sm2574816edc.81.2024.01.15.04.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 04:43:21 -0800 (PST)
Message-ID: <2124765c-a55a-4c46-8473-6cd83718efaf@redhat.com>
Date: Mon, 15 Jan 2024 13:43:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Perry Yuan as DELL WMI HARDWARE
 PRIVACY SUPPORT maintainer
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Dell.Client.Kernel@dell.com,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <c9757d0a-2046-464b-93e1-a2d9ab0ce36b@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c9757d0a-2046-464b-93e1-a2d9ab0ce36b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/14/24 17:53, Heiner Kallweit wrote:
> Recent mails to his Dell address bounced with "user unknown".
> So remove him as maintainer.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcacd665f..8f6b09a02 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5954,7 +5954,6 @@ S:	Maintained
>  F:	drivers/platform/x86/dell/dell-wmi-descriptor.c
>  
>  DELL WMI HARDWARE PRIVACY SUPPORT
> -M:	Perry Yuan <Perry.Yuan@dell.com>
>  L:	Dell.Client.Kernel@dell.com
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained

