Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8D7BAF0
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713431056; cv=none; b=cpmGIMrkOWW51NLfOv9wrpx3rdtETfvQAGGylgR+nbm2Pu+ztWriLTh7xjt0/ntOE1W4YbuitNgfAxIWix+xBg/Mbc3mNaBafv3LRt3RUk7ICRTzsgI68VzvWbXH7EDdqiuZbxPVQRpDAddQskdWNZTURXZYT17D9y3eFw/oduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713431056; c=relaxed/simple;
	bh=Ng07Evum/BkjkcFlRfN5kIJF+7KwBj2VJeuEezw65Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inob3LetJNdDhI4V5YseRWsiP6Bji/IUb91YdtDJf5qmRi6SWO83GwInuL/AhAbMZwEEFHzhMuTJGyTW9vIoL4hxXRRnTZRJxTiasV0US6quw438XCAwa2db6jdOMBOV+cqJcEgXEqV1J0eOi2JTmjCAtRvQ1UVstVJqVo0VZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyjkLMGQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyjkLMGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713431052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjUdQEZsyr1B+cnLstK3ud8ll9tHc4f4QHn3Yp4TzDU=;
	b=EyjkLMGQW6+jkVaiGQ+A9TPFDrxhgQZOEZDY8qWAP86zhSVXbTSV10FFM8g47Tk8bnVRex
	LJudbf2I311boe4sAWQFmoysrUgz/hXcxgn5l0DMfayhdXOv95/EceyquocnMeYsOm8GaN
	HLtxkx2gX0pBN2MHV/W1nnj1+rLwC80=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-67835CkQP_uE0YozD9pkbQ-1; Thu, 18 Apr 2024 05:04:08 -0400
X-MC-Unique: 67835CkQP_uE0YozD9pkbQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-516d6407352so575942e87.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 02:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713431047; x=1714035847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjUdQEZsyr1B+cnLstK3ud8ll9tHc4f4QHn3Yp4TzDU=;
        b=Wrg2VIZilcGcIFPOygxrZg1kzoziZRVuNokiUuuUUJa2Bn5R1MUCKEkfilXsXv6dju
         jn5QPcbgjFs7gR5Oc002AUEjdkR07zW2LyrTOyMb39YQfTOUZ5uqnab+ltc6m+z7EmOM
         8QvQVBIkJ1b0/1MlTpMRMHW3kjiojamAiSO9Tl7LfqxC2YWqNDL4iTFJldeG35jYsLGQ
         WEw2guB876OfRpBnQiJ/FuuRFgJ4QIrF/juqQNHfbWkusL/4WilSh0+WjU9XPp5gIjuR
         sVGOoiN9KJu1vG4Xgl8Dy8bm1Stzd4pl5wMj/wiyi9mc50Nw3B2Ojgm2p3zowNRxOwuk
         2lpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBC5N16PWC0zUt4+AmrRUTiT7vvI1uBmjTrKwRX3CtrM8hehiD5uKBJlrHUMu7gpYoECETtjAoadiGOpzFZjdLa7UnYx5Y5rVQTcrKPOGHB7lFKw==
X-Gm-Message-State: AOJu0YyvwUCgFkItiuxqn1PbL0qmVhb8aGfZ1O1w/5u5Zb6QPge6A1z0
	QYtXD1I74kf3V6PoqVOY/7LIL+VNk1dmB7TwhibbmIuTXKVuQIYfCFUFkwmUmggXEPScWDx4LiK
	+9Ded9FHQyXDnUhpJYZ5I6KUytxEA2XIEdNv0oelMGh4AIFqlcbr4Fk79LTlTGKSDHsubvow=
X-Received: by 2002:a19:644c:0:b0:515:c91a:f4e2 with SMTP id b12-20020a19644c000000b00515c91af4e2mr1018890lfj.24.1713431046936;
        Thu, 18 Apr 2024 02:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCX+axwo24HZErHphPUmlk46UZojOnXZn1R68yXCn5Wa506iFYwqgVmPiE8g4upF2OnLB21g==
X-Received: by 2002:a19:644c:0:b0:515:c91a:f4e2 with SMTP id b12-20020a19644c000000b00515c91af4e2mr1018868lfj.24.1713431046340;
        Thu, 18 Apr 2024 02:04:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h25-20020a0564020e9900b0056bc0c44f02sm597045eda.96.2024.04.18.02.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 02:04:05 -0700 (PDT)
Message-ID: <ca6e0dc7-f5ea-4c0a-b9fe-0667fadc78a6@redhat.com>
Date: Thu, 18 Apr 2024 11:04:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd: Don't allow HSMP to be loaded on
 non-server hardware
To: Mario Limonciello <superm1@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@amd.com>,
 "open list:AMD HSMP DRIVER" <platform-driver-x86@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20240416182057.8230-1-superm1@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240416182057.8230-1-superm1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/16/24 8:20 PM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If the HSMP driver is compiled into the kernel or a module manually loaded
> on client hardware it can cause problems with the functionality of the PMC
> module since it probes a mailbox with a different definition on servers.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2414
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3285
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * use pm preferred profile instead

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Mario, should this go in as a fix for the 6.9 cylce, or is
this for-next material ?  (I'm not sure what to do myself)

Regards,

Hans




> ---
>  drivers/platform/x86/amd/hsmp.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1927be901108..102a49c3e945 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -907,6 +907,17 @@ static int hsmp_plat_dev_register(void)
>  	return ret;
>  }
>  
> +static bool hsmp_supported_profile(void)
> +{
> +	switch (acpi_gbl_FADT.preferred_profile) {
> +	case PM_ENTERPRISE_SERVER:
> +	case PM_SOHO_SERVER:
> +	case PM_PERFORMANCE_SERVER:
> +		return true;
> +	}
> +	return false;
> +}
> +
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> @@ -917,6 +928,11 @@ static int __init hsmp_plt_init(void)
>  		return ret;
>  	}
>  
> +	if (!hsmp_supported_profile()) {
> +		pr_err("HSMP is only supported on servers");
> +		return ret;
> +	}
> +
>  	/*
>  	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>  	 * if we have N SMN/DF interfaces that ideally means N sockets

