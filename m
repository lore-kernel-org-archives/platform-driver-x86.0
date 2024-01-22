Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955539ACC
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915933; cv=none; b=DJL8tN/HD4QUOgBgkIqbU34gVdd7vR47ObT01K5r83yFEEt/YTUGLBC5A0YfR1vNtg1ZHTwRfGEAtUktK6OmJZjyYqKYbTd6D2WmMR7/hG0TRVD53M6xKD+tawKZcl9o3VafdnuHiHqchuMDfPfsb8O3wvzOiwirA5IxeOuJ0tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915933; c=relaxed/simple;
	bh=obeJpErKx1ajD/vnD9k5XonkpOwWzKiYpDN+xpRzyi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAEdHKjzkECzH0JMbGj9IXstaC8qqykHOF0jSun52bL6Uh9YiDupwJT5oWUSZgNsRiVqnb2aol2GAAUay44v1hZGx9KfjzL9vymSOzHRReVH2ArMihf25lY2u1Fi/epJsU+f+mCEcS6HvnMsQjYe2ikJMjCfazjBKuRQeCLQlRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBYxuGHN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBYxuGHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705915930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kn3fQRsqrEoDq0Np/quNq4DBE/NQf4GTUAHa3GuAYZM=;
	b=CBYxuGHNeRcf4XNspISVnEGGHkzNZJJbHkMn7jb7xUrYPEMBPohmbszevnLVw2YbwnzzNJ
	/MXCFVTlaMiHPm45wpExAq/fq9Cr+tyk1F5UC1U4XFVyxue+ql7yf1dLB7mmKSci8p8QSB
	3zxHvc5X/y3JKeGSqnXzzpEp7JZLNNY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-4WIV5J_YNJqaaMualYUAOw-1; Mon, 22 Jan 2024 04:32:08 -0500
X-MC-Unique: 4WIV5J_YNJqaaMualYUAOw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50e7ddf4dacso2092529e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 01:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705915926; x=1706520726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kn3fQRsqrEoDq0Np/quNq4DBE/NQf4GTUAHa3GuAYZM=;
        b=mFvWNh/qq+Vs7HLgV7TChHgQoiqTTcmSg1HG/OLamKSG6vvRmlUQVmfoazmS/s/2yD
         VLXeBobVLXgY2qvtCjaWjrmZBad2adTfceAvsOYEasS/UahzApNLvDWChOrz8016UwL2
         lzL/wODf64V8ftj08WxioGv/sM7OcafegdNEdyWv5fA3ZQQJnh2iqkN7JBnIMBvT0l/m
         ZGQHtpFHuthaYTmaM4FhWn0Ge45rD0v3mMDKcdAbIDV54bjZDG+haawcZOy5J+fgSQSk
         YC1VA1gHuXwZoL9V5VEE7Ob0eDvmiqvSn212ALUt8AJqvWS+n0ogNfpz2EXcUKiXnpiV
         a2Iw==
X-Gm-Message-State: AOJu0YzPD73bfmUkFNNKykI6W9FOFVXS0ZVlrgwF7ivJ1hyxYLTe54GV
	IddNDTqOkQLPIx37H0x+95M93dybpXNxrC9U0K0XU33NcswiPrpdZyD9LFbRcKtJ6TxoCO1uVP0
	4ViwBMU/jDzrkezszsb/JkQ6eIc8F2p94T4bIGzCdWJUh7wCFEz9I/J1Qw3bg8emr1Cvk/3L4SO
	+9gKo=
X-Received: by 2002:a05:6512:3b9c:b0:50e:af7c:85e9 with SMTP id g28-20020a0565123b9c00b0050eaf7c85e9mr1757670lfv.89.1705915926506;
        Mon, 22 Jan 2024 01:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsH/ZTfbt3CmU22k6fVMrrmXiAwpiRkYWpN2vVPhM6Gg0eFFZ3L+WQuJSuarq07nma3B1W1Q==
X-Received: by 2002:a05:6512:3b9c:b0:50e:af7c:85e9 with SMTP id g28-20020a0565123b9c00b0050eaf7c85e9mr1757660lfv.89.1705915926146;
        Mon, 22 Jan 2024 01:32:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24945000000b0050f1c24cac2sm1058884lfi.66.2024.01.22.01.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 01:32:05 -0800 (PST)
Message-ID: <01c404a6-50dc-457c-aec7-989151c96c66@redhat.com>
Date: Mon, 22 Jan 2024 10:32:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: remove defunct acpi4asus project info from
 asus notebooks section
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>
References: <20240116105101.32458-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240116105101.32458-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/16/24 11:51, Hans de Goede wrote:
> The acpi4asus project appears to be defunct, according to:
> https://sourceforge.net/p/acpi4asus/mailman/acpi4asus-user/
> the last posts to the list were done in May 2020 and even then
> they were mostly spam.
> 
> And the http://acpi4asus.sf.net website still talks about 2.6.x kernels.
> 
> Drop the defunct mailing-list and update the W: entry to point to
> the new up2date https://asus-linux.org/ site.
> 
> Cc: Corentin Chary <corentin.chary@gmail.com>
> Cc: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans





> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f230a2fcfe89..80eda624fc1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3159,10 +3159,9 @@ F:	drivers/hwmon/asus-ec-sensors.c
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  M:	Luke D. Jones <luke@ljones.dev>
> -L:	acpi4asus-user@lists.sourceforge.net
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -W:	http://acpi4asus.sf.net
> +W:	https://asus-linux.org/
>  F:	drivers/platform/x86/asus*.c
>  F:	drivers/platform/x86/eeepc*.c
>  

