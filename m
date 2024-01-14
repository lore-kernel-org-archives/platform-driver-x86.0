Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2EC5243
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WlrGqimm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705258602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msfG8vr5vipiQiSy1EsmOeAkGJXkRcL076v0jrEaqyM=;
	b=WlrGqimmLhL7L7/m1JGC5Lir3Ro4/CPO+okdsUR5WWfpzN55NNP7m4G10S01vWzExvuSE5
	NIAdjL/67bSgInATn3UgPwB4YJ3NlzRbIK4yU/Tii+Fl+RzWLqdum14P5kKJTek7pOMxyC
	d/RAhG/Znr64Oj9poIUdP8HpeT8yFnY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-DJixdo3lOV2P_Da6-t4Ezg-1; Sun, 14 Jan 2024 13:56:40 -0500
X-MC-Unique: DJixdo3lOV2P_Da6-t4Ezg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a28f6a78b83so503020866b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 10:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705258599; x=1705863399;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msfG8vr5vipiQiSy1EsmOeAkGJXkRcL076v0jrEaqyM=;
        b=tyCaThSYY/8ELbqCQQDswzNIgVKuQAmoyBanmETQdQ5wHID4GFS4bZna7feew8GXyy
         xxTwfBRO+KCRDMaa3ILo/+Gfeb79bqlOTFTBYWLZvIxTh2KF04EAKs8Ql7CqzfWUaAR7
         EDCHPe1tUF+z4RphixNo/cdG/2nKxG/frID2CXHoME9I+oRDHtowKN+MQHRjeWN1jfuk
         WyMnsIsAMcoa5Lk2nF9tuH2vtGPeDAlIh4DOWldh99V2b6oJc1NjcFc4/t2RQbtddpVX
         a6Nz8+xcy92bWDAkOkNu1LKUHzf06QY3NZbOedbBPk2CDdXFSoYunVH88bbfdS074xEb
         g7Ig==
X-Gm-Message-State: AOJu0Yzaoteub/dUgJfQhDbNDLmb09LBPtr8mLWz/4wlT14qO4WOliZ0
	upnWcOmN9U/Dr97adszeuwX7zGc2PPTJ77OkKmHYtL8UvS/McePdIL8Mx9apg5EC8KtpgfV+5JZ
	aIZf1Xc5HSqLofIYj3Oni0TcA2PZLfmHst1Id0yxfVQ==
X-Received: by 2002:a17:907:3a0f:b0:a2b:1fc1:b3b5 with SMTP id fb15-20020a1709073a0f00b00a2b1fc1b3b5mr1694963ejc.99.1705258599234;
        Sun, 14 Jan 2024 10:56:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElaUpu7UBKWiAf1apQuiZL5xwmz2R6PCQR1bA5NBKQYHtF7DQbsHnyvZtd1oSy0eXgYcp8vw==
X-Received: by 2002:a17:907:3a0f:b0:a2b:1fc1:b3b5 with SMTP id fb15-20020a1709073a0f00b00a2b1fc1b3b5mr1694958ejc.99.1705258598981;
        Sun, 14 Jan 2024 10:56:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id st7-20020a170907c08700b00a2cfa8edbcesm2646129ejc.199.2024.01.14.10.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 10:56:38 -0800 (PST)
Message-ID: <9ed3ef14-7bf6-4014-bcea-c2001b948b27@redhat.com>
Date: Sun, 14 Jan 2024 19:56:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Perry Yuan as DELL WMI HARDWARE
 PRIVACY SUPPORT maintainer
Content-Language: en-US, nl
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll merge this into the pdx86/fixes branch tomorrow.

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

