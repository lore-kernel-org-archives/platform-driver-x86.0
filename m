Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11714F105
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601933; cv=none; b=PXHhEUcOE4Ard8Che7mXAESTXfCAKmjztNNDm2IvI38E76XGri92lf4chUcKf5P9q8FUZRnXgaCbekGbFKW4MAeT8TDmSfpZY3+XkH6N3nAtmGAvKp8L6PIt85yvNHTLJbu9Ea8kx8lp1/rGMMb0yzcgGNVk7Z5R6aaDrIWeRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601933; c=relaxed/simple;
	bh=i65ssyYayF9FH8BUBfnKW3K5EK1hWnLcMWLPFVcToMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orQluMzr4X45FcAjG2gsFI1Wy3xX9Q5C3qK603R8A52EFFWnNs+NIhWo+xe+jEDlLtXm34j8g+wur7qchGUpbnnS4+IkZ7ZLLkGsGDUtFJsgV8vTaRtiiebtQBete9qaqyTnoAL+cJum8j0czq4aumg7gJJdp2h0gz+kLqiyk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VEiGmUcJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VEiGmUcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715601929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Cj2/My5ysuOGViM2gywYUzFnwDdaE1cr2+t6L65cLw=;
	b=VEiGmUcJPO5FvUZSs9GWLsFXxtLJxIT91/AcilPuwhN/zEzgBAzlmpchetuPYSoSUBHNLV
	2z0xZeR/E4j5J9L6Zq+mlkaleN+62f6XJ5M1Saj6IGh95FGT9+dZlJip4wDjAdYik1qwFd
	azOCO1JpxgCiAjPFKBtrm92hdJO7d6M=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-r_yxwxCJM2GRmUpjcIgMwg-1; Mon, 13 May 2024 08:05:18 -0400
X-MC-Unique: r_yxwxCJM2GRmUpjcIgMwg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5222c9b6fd4so2250243e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 05:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601917; x=1716206717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cj2/My5ysuOGViM2gywYUzFnwDdaE1cr2+t6L65cLw=;
        b=aJCBqeo05rNevhnNlYYkEpUyDcmWVGqEmhlW0I+TOCbrE+yeimKSoX8MO6q7ywVwI1
         oZm0E5iJCgRKZmfMZLuYYQ5Ls9YegsLiDJVk6JFzsagpwUSIP5WLxCcaEAwZ0jgdbGL+
         oSYH3x+1opeVHxWJmkqwIpLBCwZaeoVbNJilQOSwO3vEgjol6sywv1In5nccYRX+/wo9
         McMlDMsfyZsj0Ofmnd1t6GbVuODCKwIqJLIBa8KAOldN2T80ccczgQKa/4zRiZYQLHe5
         cPrfjVhCEZIaD8UN8/r3Zw8/XRaxZJSGOzIfBYj+WRruKys2TXYYM/VYblB2BuPZAxPi
         naNA==
X-Gm-Message-State: AOJu0Yy2ytDO3OVGL5I/3hqatJTZ890aOfp8DIpv3Bu5YoFK3U7K2YaH
	4LoKG/ZceeLMXltrMCkQFki10jiwuu/BIf5DTistEXJEfUrksDcpmq9Yrc+apYxAYb1yzsKaUKT
	l4GHMQQoRnmcPN1kBYx871W44FhnKGJCdS2OwgS42FssOInqXjdCuAuIgY4w5xJPIPYMQcCM=
X-Received: by 2002:ac2:5149:0:b0:51d:1d32:c676 with SMTP id 2adb3069b0e04-5220fe7a018mr7277749e87.37.1715601916899;
        Mon, 13 May 2024 05:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGJ3dnAJxJIVW0dqxce7SqZEWRvO18ednZlPgf3c/20kgdCAsq0DTHNSpNOwE65GmiHIkNeg==
X-Received: by 2002:ac2:5149:0:b0:51d:1d32:c676 with SMTP id 2adb3069b0e04-5220fe7a018mr7277719e87.37.1715601916441;
        Mon, 13 May 2024 05:05:16 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7ddfsm591134766b.121.2024.05.13.05.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 05:05:15 -0700 (PDT)
Message-ID: <e6151a47-3c8c-4875-afbf-15fcf5857079@redhat.com>
Date: Mon, 13 May 2024 14:05:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmf: Add new ACPI ID AMDI0105
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240510103519.876646-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240510103519.876646-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/10/24 12:35 PM, Shyam Sundar S K wrote:
> Add new ACPI ID AMDI0105 used by upcoming AMD platform to the PMF
> supported list of devices.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

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
>  drivers/platform/x86/amd/pmf/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 64e6e34a2a9a..2d6e2558863c 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -381,6 +381,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>  	{"AMDI0100", 0x100},
>  	{"AMDI0102", 0},
>  	{"AMDI0103", 0},
> +	{"AMDI0105", 0},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);

