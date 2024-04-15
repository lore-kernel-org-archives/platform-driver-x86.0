Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19873189
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189297; cv=none; b=Fw+CDFP4TuLQ3CWpXZuV62wfygBiSNgOURU9bf5ixCNMkcavk+HcdiFRvdELJmXvIeQtk1YedkSINm7E2zubxacZzSO8vG6GH5+rdaLGJooWVDyoa5KOs/bqLPKopoopP6reqjV39REnG7TL3zDsUdBt7LztE5HJvqWJI7d2GHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189297; c=relaxed/simple;
	bh=E5fqNKMEJvOuxFM1idancWb5y7dVU1GPKR/i+WPs564=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhGctXFXIk8CG4QRrvBcTF5a5MAPN6jLLb1OJAmdTNcDd/sNIFBeFopU/NEKKFww0FFq+xd72QRarLaNKs0KuiW26x4sBji241z6sVdW/XsieLSZGjAhgHCaKVa1qDoZ+793//ptMAO3jgZXW/240rq55ejksG5KEEUArTmK4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZG5O2Z9Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZG5O2Z9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713189295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lgAdsAmTEJcMhaPuhx3JcDwrjAq2Cwq+TEEWmTNaR6I=;
	b=ZG5O2Z9YxMbKMq5lYhzeyyANpjPYQrJC6SNbPwcCQ6ncXkEgFd16y6n2eIL0JHAxuboluT
	np2lGKHH34u0pxErK/IdH5bvGquIIKs2DRewcPOGk4ZBALmC6DMZp6pLHG4Fm7yR4lHgpW
	gHOcxaY6giJc/19w/50OSMnMNkbGTXQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-rS0_S_AgMHCWYwNx73nawg-1; Mon, 15 Apr 2024 09:54:53 -0400
X-MC-Unique: rS0_S_AgMHCWYwNx73nawg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-518b4b45e91so1718650e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 06:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713189292; x=1713794092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAdsAmTEJcMhaPuhx3JcDwrjAq2Cwq+TEEWmTNaR6I=;
        b=YAFDenFTMxIvJTaE74ww0N6TKWmLzh7jYXKGaBenxubJoMOjCwdKdguoMtwN5PqREj
         60GnvqpAS6bd7vGMlGzWVVCu9MpyHU2tM7Fp2PHHRFCAGFRt2FjRhgGyDpnQL7GqCIZ4
         W953P8vnmAFrq9mPvRgRne4X/2CE66DD4jgQU4ZkHVK9NIoVkVSa61m443OYa/YeFgAv
         oYv7XvfpBfGzRvP/KIpET8pM+gK1RwxlawNhqE5v2ixgqxKkoRK6ici1Zyl4qTdRvdTK
         Ya5Muk590v8Jn10HbUvtYw2q6TzN4Xdu9dVdCgGmPSM4PSy713802IWUqVMPmXBku4CD
         kE8Q==
X-Gm-Message-State: AOJu0YybfwdC8gG31Pu3ZszhopfcBshIwAs7jfMRQ3hMHjN4xaiK6Ps3
	vvCWYv4naAC97/p3CK2bBuFmFBEE2J++cgR/O7zWAGQAFzCC5ajG0DpKJVZU4iCpb1uCkiOzmIC
	orpyECyzRwWPGPrlEIkfoN1mM009eUNCnw/ewaQNXYAgz9uhXI0g+PnOQfJoTQ5mMQ0D4V7Q=
X-Received: by 2002:a05:6512:3e0e:b0:518:f4c6:5bb3 with SMTP id i14-20020a0565123e0e00b00518f4c65bb3mr2257801lfv.25.1713189292302;
        Mon, 15 Apr 2024 06:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Rdk9b+BjN61Kb484JRhMPY9ILj6rkt+Qq7n65Kr3bzdgsLwl/DxN6FWaICX4JCY7sMF6rw==
X-Received: by 2002:a05:6512:3e0e:b0:518:f4c6:5bb3 with SMTP id i14-20020a0565123e0e00b00518f4c65bb3mr2257779lfv.25.1713189291886;
        Mon, 15 Apr 2024 06:54:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wg5-20020a17090705c500b00a4e2db8ffdcsm5560395ejb.111.2024.04.15.06.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 06:54:51 -0700 (PDT)
Message-ID: <6eca2b94-1f05-44b5-b6e9-8f0b2f2f885a@redhat.com>
Date: Mon, 15 Apr 2024 15:54:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more
 BIOSes
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20240410141046.433-1-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240410141046.433-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario, Ilpo,

On 4/10/24 4:10 PM, Mario Limonciello wrote:
> BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
> being worked on there is still a possiblitiy that it won't need to
> apply to future BIOS releases.
> 
> Add a quirk for BIOS 03.05 as well.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Ilpo, since this fixes a bug and does so based on a DMI match,
so the chance for regressions is quite small, I believe it
would be best to merge this through the pdx86/fixes branch,
can you pick this patch up please ?

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index b456370166b6..b4f49720c87f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -208,6 +208,15 @@ static const struct dmi_system_id fwbug_list[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "03.03"),
>  		}
>  	},
> +	{
> +		.ident = "Framework Laptop 13 (Phoenix)",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop 13 (AMD Ryzen 7040Series)"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
> +		}
> +	},
>  	{}
>  };
>  

