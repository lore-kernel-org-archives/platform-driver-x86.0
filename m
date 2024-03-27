Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B89A14F102
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711570599; cv=none; b=E+S+CNvtUgJRJpQf7GRsUftQ4XdzOK+d0UVySyMQha0WjOcZmL31HnWOuu0sjM5pMhWU6uPFusg7dMiXWu28C9UuHb6UzvCjoDg7jFGKKxkcEqhP2H9uYO94j2OUweCnIF8s058TaOulDZhMirmyuIB1rC7hg/5e8ZVPBCoRtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711570599; c=relaxed/simple;
	bh=YrO2w4MQtMGQJl+C4zezHdk+MgMTRx1IBjbjBm7MeS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcLzGtVhf1KGftSaW+31AziZZ2T7AUniIvUM8zXwLdUw1cWwoYM7JfenjSorPl8C5L1zBtG1SptvRsMI4WqsLP/mP28e07L+3gwhlDpiuE+hRh01l5wjFk6Y3SecTZzRmH7bE2LGryon5ONZ2hq54cSDHT+Dr9sniwBLAurwr4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UqAqvQnY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UqAqvQnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711570597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwEBfTVIpv7XvJsh9BUgL+PZXfXZtA0LjRzNOY4muX0=;
	b=UqAqvQnYc2s6lYyD8iLuWQ1JbRMpEloRB1Xu1FskpyTv+tEqL/Ya6mX1oMK5slg5E0jlnY
	+ZuVldG23Qn6kRQdm7OUu6HsdU/D6A5cOX4PNLzD1h2BL8GLCiFxXtujZsh8YlJdY6PEGD
	wX3lTKmA0DLvxxak2wNmOaipcPC72yQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-F1gKjxJLMJ2IvPBTP_nykw-1; Wed, 27 Mar 2024 16:16:34 -0400
X-MC-Unique: F1gKjxJLMJ2IvPBTP_nykw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a473769f8d0so11609966b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 13:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711570593; x=1712175393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwEBfTVIpv7XvJsh9BUgL+PZXfXZtA0LjRzNOY4muX0=;
        b=khJmVCrn+3Zw1D5DdVoP1z6RzMZ4RF1nVxw1bGb2Ym5guY9RuZBolm2AxqzswTdiDy
         uL0qHzzch0lkufngnP6S2jJRF3J2aLfHIXkF0rxscizK/h9P84MmBSFqS3NlpQATUTLx
         tvlVbW3Q6xoFK67bS397zOEIl7wvb6zHq+STyHhvPrLk7LqO/IfxqpM2aF/unnk1k0xH
         NeVYcIOmK0X+fKU7NPD7YFs/4ZQvUC2KbhW6rL5dGGqKV8SmO9H7pIc8JIjSAkxeoSU2
         gHI+0G7E0St0kgtBCfjHfa0mKrHbdPoCa8scRmvGAnv4hxyHOCEJ6gds893kmQvsULpr
         6SYg==
X-Forwarded-Encrypted: i=1; AJvYcCUgdLOQC5o9l1ojYrQTjQ2eFvbLKHrOwQGRmzzqb41LdxEQ+4N51GJTvEJi5VbSJONU9QGAhWWsuwSA6tm+69y1P1r4jvtqKoF6YpAvK/k+GYkzCA==
X-Gm-Message-State: AOJu0YwV8f/6Y65Y9+0BAwA3CsNdPpp89BtTAekHqUMv8s5fLYhUep1N
	R7CsHoGf3jJ4oh1zB1aZ9qNbLYLQ9PJpVdI9LvD4c2S1x+uvKiafundMRjNIsYiTmkxVpu1ETQV
	0P/r3I65Hki4vBsIIHfUxnhuCL/AIHG4TR7IvpPXa0AtWjp2n6phvZb7EgbPkeHlzvUNlbZg=
X-Received: by 2002:a17:906:2a0c:b0:a47:3c66:b396 with SMTP id j12-20020a1709062a0c00b00a473c66b396mr331867eje.64.1711570593716;
        Wed, 27 Mar 2024 13:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB2nm6eBBuF/WUHUby6mr03fr0aGqm1maYoTObj3UaeHRr4EMZRSIjy7oYDqKHSbXactVRkQ==
X-Received: by 2002:a17:906:2a0c:b0:a47:3c66:b396 with SMTP id j12-20020a1709062a0c00b00a473c66b396mr331858eje.64.1711570593466;
        Wed, 27 Mar 2024 13:16:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4df3ea61a9sm2305759ejb.57.2024.03.27.13.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:16:33 -0700 (PDT)
Message-ID: <a337c02c-4e85-44a4-acf8-dd1b47e108d5@redhat.com>
Date: Wed, 27 Mar 2024 21:16:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, dennisn@dennisn.mooo.com, lkml@vorpal.se,
 ilpo.jarvinen@linux.intel.com
Cc: coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240131111641.4418-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240131111641.4418-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/31/24 12:16 PM, Armin Wolf wrote:
> This patch series adds support for the ACPI PNP0C32 device as
> proposed in 2022 by Arvid Norlander. The first patch adds support
> for the device itself, while the second patch was taken from the
> original series.
> 
> Both patches are compile-tested only.

Not anymore :)


Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






> 
> Armin Wolf (1):
>   platform/x86: Add ACPI quickstart button (PNP0C32) driver
> 
> Arvid Norlander (1):
>   platform/x86: toshiba_acpi: Add quirk for buttons on Z830
> 
>  MAINTAINERS                         |   6 +
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/quickstart.c   | 225 ++++++++++++++++++++++++++++
>  drivers/platform/x86/toshiba_acpi.c |  36 ++++-
>  5 files changed, 280 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/platform/x86/quickstart.c
> 
> --
> 2.39.2
> 

