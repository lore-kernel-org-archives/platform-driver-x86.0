Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB12140E4F
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589786; cv=none; b=TU5MzpqmKINaemSfT3zSrKe8PW17BF/c7MnTraz5Nh/HbRs/QoOYHVKka3My8TSZLnPXBM5I98dI4AWHScujBKDw++XqVS2BzRA8nz9gwFCcIqe/k6JHwaYOZJ3LM0dLvu3fDblwKnQ0djhR4vZMOVRb7k3U7xcLhx/5vGCdatw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589786; c=relaxed/simple;
	bh=bGKC8/Up8+ganbUnQQMf0gdfJM77eigF0DsnS9gdTWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZv9yXvIBuFwuiUNR/YxS5KzFY3feFyNUge+hamUc3EWE1WdVSwgaYxH5TcXtzR1B4e1gNKAmjskHHdwZdWJhr0o6Fue+7CdYXWQDdZIXcREX0QJFRcjp2m8qLprcB83I+AZj2OElPDwd3WMsgCqwWd5glOVURFt++msCsBJmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+42KfnZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+42KfnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712589783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1X6fZeFDQkaVHOCXAp3VmowI6Zes/NS81fuOoq72q8=;
	b=Z+42KfnZYzdAkRKfZWuoy2Qplwvb97Fvf5xWvtJv2MQRpyQ5mCsvjm6FTsvrQLwhMWM4cn
	pJd+o4Xgc5T5lnaPP+N4hes2DLtu0TvxOMD50T4ZrzXkl/h3hdE0fnz4rzvFP4BuhwzrsQ
	/X1wQ0MckLexFKShwVr3Zfql5CqaT1o=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-Y8bEG8AuPQCpO3JlYdgXuQ-1; Mon, 08 Apr 2024 11:23:02 -0400
X-MC-Unique: Y8bEG8AuPQCpO3JlYdgXuQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-516d6407352so2605157e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 08:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712589781; x=1713194581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1X6fZeFDQkaVHOCXAp3VmowI6Zes/NS81fuOoq72q8=;
        b=KR5ffyaeXqjJl9zW4XFdOYwgd+VLBAAfQlquPqIobzqyGRuzujKOdE61y/ao0qR6S9
         azEPvOVPYD5R7cB8KUwDgqJRPIjBJJ/4Hhlh/By8LyARpKYTq7ckqggmetWBILzV72+X
         PouXAGu7NKGjx4VWPcU55c8aD4vQ7BWtnLtTChTI19Tq5PHSD9uCpjxO9j6Zd/fIeK6s
         T6rtOij0RlXSQAevwxKTORLDDqC3yyljtnFyQJOCrSU9Q0pukOTDwuDQqMvx+PGibkhn
         tftRUlpoYdxuT4Ljf1aK9TBohnjToE5yK3zTE0OqfVKtxcvlT8mP4SOb8t3daCsCaE0+
         4f8g==
X-Forwarded-Encrypted: i=1; AJvYcCVLJ9N5wLpr7um4/3A8G9JtT44toGfaM7y0mlHK7xzTpm6NjkyDsaX3pVsQ41wtx3k94xRJddxxqwFmmTRoCNpUjv4CN1G6/xXLlcbbqQiEhMWviQ==
X-Gm-Message-State: AOJu0YyFHbu7QiIHzK5MU+4275U4yeXJg5obYn+16UuFpZH/bMqx0+GV
	g19RdA3swLY8ahU6gMEZaWY7UbMvY/e0F/DKdhkIRsUAGGTn5ugM0gV10JF6Sl/hNBDbBTW9DQI
	aEeT66WN4STSo1DnWvMJBbFjxs7VQZOLbcSNdMylbCoilWlyAkXZt08VQwjwJeRKx2mEKnVU=
X-Received: by 2002:ac2:5999:0:b0:515:bf94:cd38 with SMTP id w25-20020ac25999000000b00515bf94cd38mr5843972lfn.36.1712589780791;
        Mon, 08 Apr 2024 08:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBRJ8DlMjO/InmEYpooBoBZApWBp5pDYwgdjZIA7BzcXKTSKEHdkJmMnKcAJ5HitTh2OMumQ==
X-Received: by 2002:ac2:5999:0:b0:515:bf94:cd38 with SMTP id w25-20020ac25999000000b00515bf94cd38mr5843954lfn.36.1712589780284;
        Mon, 08 Apr 2024 08:23:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cz26-20020a0564021cba00b0056e3f2f3f7csm3300081edb.12.2024.04.08.08.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:22:59 -0700 (PDT)
Message-ID: <1760f058-de52-4519-8d43-4395a88af4f2@redhat.com>
Date: Mon, 8 Apr 2024 17:22:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/surface: aggregator_registry: Add support
 for thermal sensors on the Surface Pro 9
To: Maximilian Luz <luzmaximilian@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ivor Wanders <ivor@iwanders.net>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20240330112409.3402943-1-luzmaximilian@gmail.com>
 <20240330112409.3402943-4-luzmaximilian@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240330112409.3402943-4-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/30/24 12:24 PM, Maximilian Luz wrote:
> The Surface Pro 9 has thermal sensors connected via the Surface
> Aggregator Module. Add a device node to support those.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note I had to apply this manually do to a conflict with:
3427c443a6dc platform/surface: platform_profile: add fan profile switching

which I merged into pdx86/for-next after this series was send out.

Please double check I resolved the conflict correct.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 035d6b4105cd6..c38203c00a705 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -74,6 +74,12 @@ static const struct software_node ssam_node_tmp_pprof = {
>  	.parent = &ssam_node_root,
>  };
>  
> +/* Thermal sensors. */
> +static const struct software_node ssam_node_tmp_sensors = {
> +	.name = "ssam:01:03:01:00:02",
> +	.parent = &ssam_node_root,
> +};
> +
>  /* Fan speed function. */
>  static const struct software_node ssam_node_fan_speed = {
>  	.name = "ssam:01:05:01:01:01",
> @@ -311,6 +317,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
>  	&ssam_node_bat_ac,
>  	&ssam_node_bat_main,
>  	&ssam_node_tmp_pprof,
> +	&ssam_node_tmp_sensors,
>  	&ssam_node_fan_speed,
>  	&ssam_node_pos_tablet_switch,
>  	&ssam_node_hid_kip_keyboard,

