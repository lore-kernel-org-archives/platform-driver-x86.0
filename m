Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B265028B
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792697; cv=none; b=LVqKAteY8t4/dpmD5Ng7ZzRRfNWiy9r/bXB4sBNCipGvapCWJRQXCYNOq1A1qFXg2AYAyAoBcm2b4R2Wsu+Uwqn050/uzCHakkfBzUXeey8uKWd+MBg4BYeAumqrTzVpchBwSAJ0ReNiQuRBNINwino1DUHdp+vWUt47Z9dKKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792697; c=relaxed/simple;
	bh=ev/31B2OZtxrY8N9FP0SG9Dm3wjCKTeMhKJJbJnoogg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDWOBOnBpWocDraG/hFTwS7yhPHfVqgc6vMNSK6FDbzjWz3UVwsM3Bhj4ZgwQDZVyom2PQj4TcKYlS4FUwIfr32if8TzfRmdDHjqOfLYFF5xBOD8JhRGcgslNeyl9CQhPlm0NwCJ/0GisLhYajoX+XYG2cAfP7MZDFNc7CHKLmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JLiCOg5z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JLiCOg5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713792694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhXisW7GfhDn4x5RJVdbAZG0rJy8YwZlKBxKJjOJou8=;
	b=JLiCOg5zbLxdaQmPKuKTrhnGnDnS1F8HB8RxwWUf2xLUD3KTVTwv0oEShpng9j9vj1TAae
	HV95+HeLuOV3Eu33diHyZ19AS7rZTIHrY8ijyhRBxuypG6x+AniXvz1x4JqgjYaPXjynAV
	EnksoJ7N0XZfv9zQLqw7NLJ07BHKPcQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-jX5P4WLeNmO_rE_8LjkTRg-1; Mon, 22 Apr 2024 09:31:33 -0400
X-MC-Unique: jX5P4WLeNmO_rE_8LjkTRg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5238ca77adso629480866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792692; x=1714397492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhXisW7GfhDn4x5RJVdbAZG0rJy8YwZlKBxKJjOJou8=;
        b=OTetTH5pVu7OgXkob2iG/Q0KwCFpfXZ2vo6lGMg/tBlE3TkuQ6U7vl12PFmvSM17xc
         WKu347oUEduvlqxeI+vjQ0mV6eBhu8ucUPKk+2UbED8uAoqSb2EsqegurF/7StNzwoNK
         z/NUiD9yxIugNpJAv3yjLCcWmNtjr/iU9PYjpZGYJ9GZgs2H7imyAR/gVM9FJtwFjpYo
         l+KaNF4S06MddnuObQpaTKhGR2cpVae+P2aDQqQ3SqouceayTbPwhvIJq6ICC6yXUPjZ
         qMvXgtMDVeRpcg326thzrqei9BS1tbk2iQLMUEtVRh0rSTYJIAYEk4Lmy+VBlpSMAt7e
         m1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXJnwpSyud+HTjM5cWbazp9ZTCP14Yk3TeIWuBLRcxHd+gkpt4jpNL5fqVSjoX+lkJ9lfmgKMSQ5QxYClZ/ZTB+2KXKMwGV9Xb+KvTlvuwX3FzkeA==
X-Gm-Message-State: AOJu0YwKL+hr64zE0Qa2pClNRA8XKevio8nWAMuEjaAeg0LL8cxfd+6u
	MMkLgene9DRymXB7SPjCk8Eq7CS/vh8VnqW9sKxKqqkfqyCqafLkC8d8Fxa8SLkKr1+ej80ECQ+
	iLMbYgWx1ruLH39J7R05Xx909vqOqBya4zVyygpEhovHCol4xaTjPzpwGKBfXCSHRj+ZUmMA=
X-Received: by 2002:a17:907:6d0e:b0:a55:b8b7:1971 with SMTP id sa14-20020a1709076d0e00b00a55b8b71971mr2973320ejc.32.1713792691906;
        Mon, 22 Apr 2024 06:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv+CAd+jKJmbYplnSb+CO+1kk8F9HG2LzTTaPgWqJCM4DePE5aNvLf57b/UE8XefZETs3ExQ==
X-Received: by 2002:a17:907:6d0e:b0:a55:b8b7:1971 with SMTP id sa14-20020a1709076d0e00b00a55b8b71971mr2973291ejc.32.1713792691543;
        Mon, 22 Apr 2024 06:31:31 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id w25-20020a17090633d900b00a51cdde5d9bsm5741921eja.225.2024.04.22.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:31:31 -0700 (PDT)
Message-ID: <e2567d94-6280-42b6-acd0-bf4aba90883b@redhat.com>
Date: Mon, 22 Apr 2024 15:31:28 +0200
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
Content-Language: en-US
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
> v1->v2:
>  * use pm preferred profile instead
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

