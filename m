Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F2E17C9A9
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057965; cv=none; b=r4ikgIsSjaoI0AjtAgoXOiclaCoKhR+P2U0tqIxY0Pv4bmdzWxJyUQGGQ2uehGKU1tM4d76nR26W4ZfXeMhwMAYCVFoyPYTceLHxpgkJWrSs9Lp2xrEc+OSJrHUJr6TEPAIQ3slP0NtFRDKsKIzyTpiS4xuUxQTQotu1UWE0kL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057965; c=relaxed/simple;
	bh=3E8UknEqSHZAcXniAwjf+6pj1naW+gTUBVB98txU7LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaH4kjWo1uuXLp8NUIM/QgF9nTV0puhIH6adgTAbD7Dc8fcpni9IoTsXqkRk2JQZwIbQNR5mf3LbkRAQeULBxPmSMdoi9LIO346vzs81wdFJbnzgPeYygBa1hC/+4eUmglqQPHs3TQtqR/MzPzScJ8uQFfsU0+mT7l7G4Ubh7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9UJbTUW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9UJbTUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726057962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OiQW+zBQm6vtaHF0u01yFenxpXbBAA2X9t1zS8CTGXU=;
	b=N9UJbTUWjSBDOskhg2FldYKQ9hBmITaDgGlz2Q3geeV7krTQ4/MiUO5Jv/UAgmj+b/+CPz
	biYTR/5xU2nAEpmScPtOmpv843fTXX2bYFE1WxSHQWbVrivyPW09Q5obtu0aHdyLmsBfjK
	DHMTUi+lEPC+alVteWWAOOQ50ApPvys=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-HE3ztB7vPg-wLUZTMez00Q-1; Wed, 11 Sep 2024 08:32:39 -0400
X-MC-Unique: HE3ztB7vPg-wLUZTMez00Q-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-374c301db60so2871557f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 05:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057958; x=1726662758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiQW+zBQm6vtaHF0u01yFenxpXbBAA2X9t1zS8CTGXU=;
        b=WB3nbd0hGJrHbtZz7NA9Jxdu5/i0gZNW2NpMGBxuSsnvQeP6aUZV6IzTggH4jydkZT
         CDXkZGPrXf3BuXEh8jVseboPUOqwFlG4kk22dmO5a+QfpHy4IrKahhB2y/ZCECSb+qpr
         xWkR9/c+Ko/pltsZyGrWK1H0mxXvbnN6FaqCSC3UYyC2zCxcZlRaXouIG4c1XST4jUNm
         zcFHYaQY7T2Js4DPDMQIlkchWd2RacBz8vtg2IXwXtPKMqsoPSwkSzySyaAyNU1pR45b
         3IPYjUV379HrKxHH7Sls9widoOB7N8Wtpa+bmAMbJrBQqE5C0ljIs2IejHr0y45ZLqZV
         ZO2A==
X-Forwarded-Encrypted: i=1; AJvYcCWUpdkNIpmk5V3vlYWfj+wV2LjzZgt056e3+z4paAW/UkIB6I8EONffsDJPFrrXDReI174b0/qZuOsq27gSTXtu5aL6@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZgRGMVwSQvGd7/gNDO2eN6YQieT+SIp2vhPRDPImcm12C8t6
	4pC3mT6PAgpRwkR7MihjnGu5GkpBuk7lbEWBMmxyOWB7N+x4HNMLjt4lary2LKks5xCa7YOmuJs
	1cwITbKWWvyp7/KLhB6/yJIH8fC9MmbCP/E4rL+Xog/421lz6qfeMBIumFaPZDTNmXE09rZ8=
X-Received: by 2002:a5d:6988:0:b0:374:bde7:d148 with SMTP id ffacd0b85a97d-37892685e63mr8999942f8f.1.1726057957839;
        Wed, 11 Sep 2024 05:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa5s1+ujpu4nHfNJIdFLp8Ue9eAk17qJD5Dkov2EW/zPFQXxOodKFyYZX8UF4a9t6DBStfjA==
X-Received: by 2002:a5d:6988:0:b0:374:bde7:d148 with SMTP id ffacd0b85a97d-37892685e63mr8999929f8f.1.1726057957308;
        Wed, 11 Sep 2024 05:32:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5201dsm5419613a12.46.2024.09.11.05.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:32:36 -0700 (PDT)
Message-ID: <6ad5b0ee-d05f-4e8e-8946-cbeb350add8a@redhat.com>
Date: Wed, 11 Sep 2024 14:32:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: don't fail if platform_profile
 already registered
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 corentin.chary@gmail.com
References: <20240910045443.678145-1-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240910045443.678145-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/10/24 6:54 AM, Luke D. Jones wrote:
> On some newer laptops ASUS laptops SPS support is advertised but not
> actually used, causing the AMD driver to register as a platform_profile
> handler.
> 
> If this happens then the asus_wmi driver would error with -EEXIST when
> trying to register its own handler leaving the user with a possibly
> unusable system. This is especially true for laptops with an MCU that emit
> a stream of HID packets, some of which can be misinterpreted as shutdown
> signals.
> 
> We can safely continue loading the driver instead of bombing out.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch. I've applied this now, dropping the second
unnecessary chunk manually so there is no need to send out a new version.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index fbb3345cc65a..d53c4aff519f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3876,8 +3876,13 @@ static int platform_profile_setup(struct asus_wmi *asus)
>  		asus->platform_profile_handler.choices);
>  
>  	err = platform_profile_register(&asus->platform_profile_handler);
> -	if (err)
> +	if (err == -EEXIST) {
> +		pr_warn("%s, a platform_profile handler is already registered\n", __func__);
> +		return 0;
> +	} else if (err) {
> +		pr_err("%s, failed at platform_profile_register: %d\n", __func__, err);
>  		return err;
> +	}
>  
>  	asus->platform_profile_support = true;
>  	return 0;
> @@ -4752,7 +4757,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		goto fail_fan_boost_mode;
>  
>  	err = platform_profile_setup(asus);
> -	if (err)
> +	if (err && err != -EEXIST)
>  		goto fail_platform_profile_setup;
>  
>  	err = asus_wmi_sysfs_init(asus->platform_device);

