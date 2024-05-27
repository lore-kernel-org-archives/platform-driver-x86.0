Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD713A3FD
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802314; cv=none; b=iJeHYOS4O7c0x04uXqNTa5Yl6hchrKfvZWw6XLcgtTwRmvvWzFaFWWDPabYx/kqek7luqX63VbbQ6bMPrtQUyk6ihsyixJ1Avq3VTiwNlG0S+XjiBTmcUAZR8oO7af3QYQ1zDBMR4V0MYGfu33KowcxPkrAfiDraSEdFg/mRITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802314; c=relaxed/simple;
	bh=0Y40vscXA8zyiEaciAXJwfIIClujthuORyaMn6J/Jk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/1afwX8zZJRE9+6br1gLSFZqy9/mkcbDE1928Hr5AFUyK+sj+TVqj5ez9ZHNqMjgF57tKHOZ+22GgQehyfiF0cAsjPgohZHmDfOe47Bdfbhrvy/f4ZHtVUEAQg3+xBaMb2EzS7iaYGdzgV0FUQWXCQa1v232BF1f6185wHFSfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Afm3KjEy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Afm3KjEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716802311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2CcOPoqdig3YSceblW+UAvqqtvVMjenKvenHarS8sw=;
	b=Afm3KjEyvAFZslZjrLann2o07tc+D5/GMQSMVYC+W9d5+I3D4oYumDE+ESp/khXGT9tN3f
	XQ+0qb1IndJ9gVSvocmsmxo+5nYZJJhJDvoU4gIcipME7Uu+RTndD2c2+lhfG1ZP22csER
	y9KB85gyXQZ+QysmDR/ByLd+Jder1i8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-gqNMim85P-CML8SP9B0BOg-1; Mon, 27 May 2024 05:31:49 -0400
X-MC-Unique: gqNMim85P-CML8SP9B0BOg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6265d3cb34so121347766b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 02:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802308; x=1717407108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2CcOPoqdig3YSceblW+UAvqqtvVMjenKvenHarS8sw=;
        b=sf60SA3NSJBfNUG8Hnh8MG4ixbwo7vMhOXe0SCR0EyYrb9ALsUJwSOyaVpxDU9A6fP
         4hmUUet4dku9pYq1eP577KhpQn0pjOS9zqSFkQzxFtEe9kGKaA6AYi2dt5mSRl8YlPVa
         PTaa2J5L8LIfQrzYxjgQ6zTyDKZG0fkQ0VKj/TODEnTSARsiqDl4KYvo4fqsoOs4Kzkg
         Enm8BMUB9Y6uSYPpEsVG3fbsOFVT7ZmtA1iacnDckJa02vOjem068in6nXzU28ye9sVx
         Hi8UDJRdU0J4JKtBVbuTVoZiXKGlNZKTnmBg0YHg6PtYVwJ5rSXXnN21rK9hAapFbrce
         qDhQ==
X-Gm-Message-State: AOJu0YygLdnKoVUfmCPNT7w9Mx+r9TKsoYqp9vb5ZEBXpxYBIJJByXWc
	i+oG6TYQVfJDbPbTmt9TwXlEOUx35lefOXrVAW1btnHFdjhZ9KbMR6RwF34kgo4zCY/VMGrLf6Y
	uct9XxrLZCgjTqKzqgn3LgpGSllWr9Z5zisdQBbHWEuRVnl8kIAi8lTDBuCrAv/e8RxcUHOI=
X-Received: by 2002:a17:906:46d4:b0:a5d:15ec:7793 with SMTP id a640c23a62f3a-a62649bdecamr652882966b.35.1716802308357;
        Mon, 27 May 2024 02:31:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfgM0zAmvnvjtU4SlgWxNJ8nEJyr1KtRmMz0QpB8hPj8W/fQP6opn7VZ6I7rijDoYTa6mrXA==
X-Received: by 2002:a17:906:46d4:b0:a5d:15ec:7793 with SMTP id a640c23a62f3a-a62649bdecamr652881666b.35.1716802308031;
        Mon, 27 May 2024 02:31:48 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c97a41esm472061866b.96.2024.05.27.02.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:31:47 -0700 (PDT)
Message-ID: <0babdbe2-1d10-4bc9-9393-f9735dae1140@redhat.com>
Date: Mon, 27 May 2024 11:31:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add "select
 LEDS_CLASS"
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20240521094741.273397-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240521094741.273397-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/21/24 11:47 AM, Hans de Goede wrote:
> Since the x86-android-tablets now calls devm_led_classdev_register_ext()
> it needs to select LEDS_CLASS as well as LEDS_CLASS' NEW_LEDS dependency.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405182256.FsKBjIzG-lkp@intel.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/x86-android-tablets/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
> index 6603461d4273..b591419de80c 100644
> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
> @@ -6,6 +6,8 @@
>  config X86_ANDROID_TABLETS
>  	tristate "X86 Android tablet support"
>  	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
> +	select NEW_LEDS
> +	select LEDS_CLASS
>  	help
>  	  X86 tablets which ship with Android as (part of) the factory image
>  	  typically have various problems with their DSDTs. The factory kernels

