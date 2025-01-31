Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E021B6CE9
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738321777; cv=none; b=FTMH+egkjbBSoG8plMP3+s45vf7Sk2mewG1w2l2AvsoR2aBRPqKAk3HpyWazyKziDlL/VZbix39UUDIpeVcQx12oKPvbXITNTVABRornzkQ30twk7VbQIJfiaOgaodVxkNpSdv1+ZFPnmoZLk4QIzMpU40tEVEzS8O2/iZAhdtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738321777; c=relaxed/simple;
	bh=x9d1xGmPkE+oKQpEmBlzYuWtZp+F4evGyoA0lUxS1M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEjgf8kZyKQN2j25fw5Ax65RWh/GAehMg+5c5RUZjXztBceN7VH4K5evqaFSzsEyRrCjmYBEAXOVO0alJQLGDnj2/rU6kU2elrWp4Sb7torKoWQU5eGQRZe799nZvh8wOL7MONY0DGA8kesmtamtkXeWxz//86oP6x79mWbmbWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWajdkI3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWajdkI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738321774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLGYgl8/MWNtyMaIf3eWLayDJUjHN4wgPAgpqGY3uhM=;
	b=BWajdkI3Up7JbDKfjIqjB6PIzRSC4j/KPzX1+CYLRk+7NUkIVW4a7m1xjHJPf4h5XGBtGN
	4KDyNpblSq0YiAzIr9BmF9gqalmJaoHLm2II1ndBfrG3X14bOXn8XR2WsRx9HGMFOuzqlO
	Ur+Jc9cQZkHQ0u6jDaFHyUG8PK40YDQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-RxI5vgezMaGAtKUHCCZGww-1; Fri, 31 Jan 2025 06:09:32 -0500
X-MC-Unique: RxI5vgezMaGAtKUHCCZGww-1
X-Mimecast-MFC-AGG-ID: RxI5vgezMaGAtKUHCCZGww
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab7044083e5so28329266b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 03:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738321771; x=1738926571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLGYgl8/MWNtyMaIf3eWLayDJUjHN4wgPAgpqGY3uhM=;
        b=veeUfLVSU0OpOxoIlPpj34OZIs4QxCzCetOHwmFz8osoSYEQ5WEcWocTWEX++taHww
         x7vrF9IPG7rL1qYKspZe8jzrFuyKhdSYP3ToDdjAvnUP/gPBTsarumNes9jkAIw+FvbL
         WLGqv7qSslleNqjDM2XGkLcRRdyHHcWXZyT/gb+ZzngSyGftNhqvoaEONoZf+O4iSCiY
         hk0orGf7wwxRF6F/Ov2JS74j9uKsBY6pJEhfeWZeklx5mzpY9o6QQbPe0pB152nFo8Rc
         wQpEiAM7zGSrv8fy5Wh9wxancevXuSJUQNR0TjJkAwBd/SvsV9l+XkLARHiVH2f25Mbl
         dUBQ==
X-Gm-Message-State: AOJu0YyI5vf/mmCgFSMC6i1XEluPAnJJwTQUlKx4Q+VqfJVfrwk8pm7G
	wd02r6NnuHqqeu3SBpAzUq00oyd8nR2fWkCuRAva7YdHhU6S0pzE/0ME53keO91HHhaa0g/UD4x
	EURrW8C/4kRyZxSf+Ot7NIrQqQmciCa0wzvsZj0q1e632iAJlbBmHSUECZ6hM3GLy8nttt7M=
X-Gm-Gg: ASbGncsN93GQGNShq8BQ6txLxIyU9MqOqCm2KddCqcK/c6NiynzYHEvmHVqCt5vHnPW
	uSs1t+0R4Y4ax05VtUFQKPrdqvNyg0Wtt/po1/zVs/n8y0N3cHMcDeG3KSPVSYjiTGJ/jdCc7Hb
	UqQXIJeSQDcyWfr4oCuoGSOVfgHOu9lCflhcKWqm2ofZ74/eA339ebcfxUGdiTLmtmfEIwNdLJP
	CaTmKhAtRn1KkzzM/PWXtu83JzEP4H9nwEoBknNHXbiFTEQD1u5zDlHXVe9VgYB6zf4DntfPhuU
	cTTYSc17wZx2Ml6M6/wPD93W8UNU6A+CCVaa6uHO4kHhUABmdnabNgucuyxoeGuZNhUOjR4OuKK
	OXMgzlnLBzPmy5/K+6RbQokBfn/y+suknAWVLiqfx3EigeTmgpLpskug=
X-Received: by 2002:a17:907:2d8f:b0:aaf:117f:1918 with SMTP id a640c23a62f3a-ab6cfcb35a6mr1211236966b.5.1738321771364;
        Fri, 31 Jan 2025 03:09:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzalAugLvSS07+95mifwGHWZWg//I/awY5BJVajKjy5dnpKYF9UERXxhpkWdhLh6kmSqLiUQ==
X-Received: by 2002:a17:907:2d8f:b0:aaf:117f:1918 with SMTP id a640c23a62f3a-ab6cfcb35a6mr1211233466b.5.1738321770938;
        Fri, 31 Jan 2025 03:09:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a320e0sm276552366b.151.2025.01.31.03.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 03:09:30 -0800 (PST)
Message-ID: <518d9963-4427-449e-a07a-e1f9dffe4721@redhat.com>
Date: Fri, 31 Jan 2025 12:09:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Do not include <linux/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20250131095235.125533-1-tzimmermann@suse.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250131095235.125533-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Jan-25 10:51 AM, Thomas Zimmermann wrote:
> These two drivers include <linux/fb.h>, presumably for backlight
> support. It's no longer need, so remove the include statement.
> 
> Thomas Zimmermann (2):
>   platform/x86: compal-laptop: Do not include <linux/fb.h>
>   platform/x86: thinkpad-acpi: Do not include <linux/fb.h>

Thanks, series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

