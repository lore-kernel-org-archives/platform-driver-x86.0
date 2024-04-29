Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6515383BA
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387949; cv=none; b=aS6ZFHCtg3OOK80o0+y/hToqcBAM18JJMp7JePBS4uEd8IOV1gG6mXtrLiCesyBYfF2odTdOWrvGOFC7fikWrojWxCGOG1y/+rtvZA5Fci33ihWIzTI7GxrPuxVyepDkQPNOwsfB9SMLAsuWZU+DsVgIurpu6ALCRCkewQtAJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387949; c=relaxed/simple;
	bh=bbxnpi/NaXr0e5sWNyBNj5+TVIxN+ODPhN6bNk2paHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVWOfzolRJJF0FqrKwA3fm4P6QBQLFCEgl3MUpn1ACQyQvGh/C6KKX2d96E3ADKindovn3nZz+M7uyiBYeKvTCN33XmnAuN3uNZ4Ginp+YAYCJXySTdyECBhGoKuQEWShq5rJ7Z2lwgFtnCP5cr6//GhnihvDLVz/HUNB0s9gTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FbD/5QcA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FbD/5QcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714387946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWr2wFFYDefmCv3FctymID7mRGnXleZS4K7sde3WKUs=;
	b=FbD/5QcAlw6oEqjGruXUUfimIT0O6prSuHC0y3Hz/VBxtux4K9I6ipYRsmm4Wedse04O89
	3p/Ind9tAxz9OEoNQbQSQCID6J26CpX7kr0ymEjGGRA+gJUPZYKQFhqJhWo1hRDGAXr/7p
	USchyQ6Au07ebiWdHJXQgx5W5DH1Qv8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-yXzsRF5QP7K3MPPsvHf5EQ-1; Mon, 29 Apr 2024 06:52:24 -0400
X-MC-Unique: yXzsRF5QP7K3MPPsvHf5EQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a58ccd0639bso198278666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 03:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387943; x=1714992743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWr2wFFYDefmCv3FctymID7mRGnXleZS4K7sde3WKUs=;
        b=maTuZSiSTliU7HzJntQC3M7cdMxKkes9QyUPk8LBSDROrZppjXCzR3J9Bo/Rki8slv
         KCYfA6ItPOIiQMab0yilted5Hf0Rb+0ZGmOJt8PmalzUwRerh85N2+3mAtOYVTO8TASi
         s6keqykgEjHehRucl1FZIIldLTfZo+iDibpzGfycU07+hCk5ZGrlUokH1nh6GdYt1ap4
         UfU33KfjlAjaAW9NiKqqmiPyRfgej3i26vaAkwunkimKmyQPcDEIKZdfiE6jQLLjZvBA
         7HUqI1Sw+zuRzyjXl8zIrx7j3I632rir5mJhyBkh7Mib1ceaXFQnez7rIZqVP/wmEsnL
         fkpg==
X-Forwarded-Encrypted: i=1; AJvYcCX42nTGqzdVFwWXiJ41DJMUWTYmGc9qNTVY3oWZp2dPRZyIyF/bGThH60ZI9SdXeuBUZP3fHZLN0mfi2ryKOAbsFuVBY/tk8as2ESMIXy2JFvm76A==
X-Gm-Message-State: AOJu0YxewtygFKXoUJa0FP+ocgr12BZYcuk7UCxzVTYY1ZgSCM0eqLCv
	EbvbYoupd4CcJqZUWZv0jm4jEva3gmzNtNcEKvjpzxF+fVTTs5l7nSUUFPUtAfw7ujkpYyLkh4T
	Q/vS7R2lAHUltEiR/W+xA4yfqyFncgtMu2WDOxZgKMq8nZ9M+FyQoTWUbo9INN4woJtrXH8U=
X-Received: by 2002:a17:907:7790:b0:a58:7e00:255e with SMTP id ky16-20020a170907779000b00a587e00255emr6364077ejc.30.1714387943499;
        Mon, 29 Apr 2024 03:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExSZaaBtowGRGzWVJrdBhegNqFQKtr6Khu4CbRXHOHx2JpLPwVBuThxMf+b0m0087QT8rDew==
X-Received: by 2002:a17:907:7790:b0:a58:7e00:255e with SMTP id ky16-20020a170907779000b00a587e00255emr6364066ejc.30.1714387943196;
        Mon, 29 Apr 2024 03:52:23 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id j25-20020a170906279900b00a58e170f175sm2972047ejc.63.2024.04.29.03.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:52:22 -0700 (PDT)
Message-ID: <6a87e669-d45e-436a-9570-d07658b5b5e8@redhat.com>
Date: Mon, 29 Apr 2024 12:52:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: classmate-laptop: Add missing
 MODULE_DESCRIPTION()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20240423161108.2636958-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240423161108.2636958-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/23/24 6:09 PM, Andy Shevchenko wrote:
> The modpost script is not happy
> 
>   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/classmate-laptop.o
> 
> because there is a missing module description.
> 
> Add it to the module.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> v2: alinged text with Kconfig entry (Thadeu Lima)
>  drivers/platform/x86/classmate-laptop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index 87462e7c6219..cb6fce655e35 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -13,8 +13,6 @@
>  #include <linux/input.h>
>  #include <linux/rfkill.h>
>  
> -MODULE_LICENSE("GPL");
> -
>  struct cmpc_accel {
>  	int sensitivity;
>  	int g_select;
> @@ -1139,3 +1137,5 @@ static const struct acpi_device_id cmpc_device_ids[] __maybe_unused = {
>  };
>  
>  MODULE_DEVICE_TABLE(acpi, cmpc_device_ids);
> +MODULE_DESCRIPTION("Support for Intel Classmate PC ACPI devices");
> +MODULE_LICENSE("GPL");

