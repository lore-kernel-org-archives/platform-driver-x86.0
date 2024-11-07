Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7481EE00E
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973132; cv=none; b=S+yCgzermqFTW9LS+U/fnjIaFn0zWVBHq0x1CpqT52REiB8PxTtl2P0pEOHL3krDC16zEfAWZxl2fqlvBxBj373SIsI99XJKCSzreFx09Cti8FT/ZSLQk+azjvkKwSqPCl1z4pwMVMBiMTCv/m1QgJeqPNSf0PFN7tkLg4mgWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973132; c=relaxed/simple;
	bh=lXItsEWUXZFt109+Ui6NjhDPYawsgqJMEGuIDDt4Iso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKlB/JXszxxuV0teixBLUW/u0iWgQePf4s7FY+m2lOcCifMH71o7kKtHchm+AWmXaY5YhuQt2D3hBRFDV1O60O1uq2mjYnskuiLtj953N1Iwdop/mNKCGimtNwdci9Ly6XXf7+tUHK5AgcolqiLY+koKLr0PaEt92LjYPrhKYhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FKWL0XQr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FKWL0XQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730973130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VEUV28AwOvWa6u7nd82oecUGAe8DexY8QGwvcMosJck=;
	b=FKWL0XQrlnkgfE2TFoiSPiabNvtd2v9+we95BNyHBToAxI324nt3qsCbIeG7bYF5VtJrrf
	5XaL6F8+hKxku3Cva3+GWrxnJWfK8YRmt4UjGwwdi26dFuJUGevLV7IeJEFM839pugh3HU
	/hqAndaSSBZZ/SwgSjMxlNU0+mtcspA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-Ppgp-7YEO6Ow4BJa7KSqsA-1; Thu, 07 Nov 2024 04:52:07 -0500
X-MC-Unique: Ppgp-7YEO6Ow4BJa7KSqsA-1
X-Mimecast-MFC-AGG-ID: Ppgp-7YEO6Ow4BJa7KSqsA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99efc7d881so50559166b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Nov 2024 01:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730973126; x=1731577926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEUV28AwOvWa6u7nd82oecUGAe8DexY8QGwvcMosJck=;
        b=DLGM4XEZBx53VIBwkbqLxesA+n9EQCMwMSrhzWNIDDc6JenSpwCJIVy/IzuBud29gy
         5shwdCFJbewifjTEykcyEdEWHHS62Hm5kAmDvMDqXybkexnmb5+I2Ud5pVSwmVQ+1Blb
         zv+sihEFtSx0NAA85ll5lerTdZ6Ncz1APYVGpKTDBlXwUePkIJporHeBVqss9WSfwkFQ
         VmFWqTdQqfNLcqFTRdFsV1YzpI4EMKCP6qljOPvJJ2vkYC0W72gicPBGSbfJgPI15mx0
         hNOEyqUZOxdN7/vF+cSlhkx0tVLsPPfRzA78ASdt2HbbgsWHMh+J3X52N3Y7lsQar9xS
         sf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbpWAZYdajAf4eeXLchXG52/j1XZpkbaIyKImHbjz1Z57fGRyCo48U/5REFww9iL5XBfN56rsQYZVoMZ5N/78IAuoP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0ramAkG1e5nTFEOsHmkLVUavxWdx5CcxRi9CSVjH6aOW8OEY
	gsKNI9mFh/82cUnGqJuMlYa1SjnnFa7LeB7jOy7Qwj8o9ov5PhkGRwbOJPDp0DKTZgEw0BWzCrf
	ZoIUaU2qASfxNxEtO15+Z6+EfQOy0LGggVViIeGG7sqyd1BaKOUmPYH27UrtyZZj2uJXMtR8=
X-Received: by 2002:a17:907:7b8c:b0:a99:f91e:4abb with SMTP id a640c23a62f3a-a9ee74c45a5mr33909466b.27.1730973125745;
        Thu, 07 Nov 2024 01:52:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/D+Goumtn5kexsx3EjigJMrNxwxMpZhpEgJ5ovlt1GNGtnNirFQ2WOtraU1wN/4QnVQoDbQ==
X-Received: by 2002:a17:907:7b8c:b0:a99:f91e:4abb with SMTP id a640c23a62f3a-a9ee74c45a5mr33907466b.27.1730973125315;
        Thu, 07 Nov 2024 01:52:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc4c6fsm68706766b.132.2024.11.07.01.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 01:52:04 -0800 (PST)
Message-ID: <73f56b53-f02c-49ca-bfc5-67eb51e852b6@redhat.com>
Date: Thu, 7 Nov 2024 10:52:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: Use
 platform_profile_cycle()
To: Armin Wolf <W_Armin@gmx.de>, corentin.chary@gmail.com, luke@ljones.dev,
 mohamed.ghanmi@supcom.tn
Cc: srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 Michael@phoronix.com, casey.g.bowman@intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241107003811.615574-1-W_Armin@gmx.de>
 <20241107003811.615574-3-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241107003811.615574-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Nov-24 1:38 AM, Armin Wolf wrote:
> Replace throttle_thermal_policy_switch_next() with
> platform_profile_cycle() to reduce code duplication and avoid a
> potential race condition with the platform profile handler.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 24 +-----------------------
>  1 file changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ce60835d0303..ba8b6d028f9f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3755,28 +3755,6 @@ static int throttle_thermal_policy_set_default(struct asus_wmi *asus)
>  	return throttle_thermal_policy_write(asus);
>  }
> 
> -static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
> -{
> -	u8 new_mode = asus->throttle_thermal_policy_mode + 1;
> -	int err;
> -
> -	if (new_mode > PLATFORM_PROFILE_MAX)
> -		new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
> -
> -	asus->throttle_thermal_policy_mode = new_mode;
> -	err = throttle_thermal_policy_write(asus);
> -	if (err)
> -		return err;
> -
> -	/*
> -	 * Ensure that platform_profile updates userspace with the change to ensure
> -	 * that platform_profile and throttle_thermal_policy_mode are in sync.
> -	 */
> -	platform_profile_notify();
> -
> -	return 0;
> -}
> -
>  static ssize_t throttle_thermal_policy_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
> @@ -4301,7 +4279,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		if (asus->fan_boost_mode_available)
>  			fan_boost_mode_switch_next(asus);
>  		if (asus->throttle_thermal_policy_dev)
> -			throttle_thermal_policy_switch_next(asus);
> +			platform_profile_cycle();
>  		return;
> 
>  	}
> --
> 2.39.5
> 

