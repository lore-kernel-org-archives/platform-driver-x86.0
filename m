Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7816F274
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712767043; cv=none; b=r6c89oLr6fjuOtbWN7iT13xQQbtwnjw6qZRovWRr6WAtyY8jyrO+SD7RJOQ+b12bzqGZaWpSVHYWSr9FZH+9LEL0MQHMAdyzXoA7AFg8EdNw/73rYapvXsEi0wDnOSK5C6YL03rwhjnmc/DvaiD0+suLew6NmEbgcwwczmADEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712767043; c=relaxed/simple;
	bh=x6kX87sRMXHnPbyjGe1FRW5wticTlTZoe6fTYLdulTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heYQZd69LvqGaDvEEpyLczcrAhz4pJlNmNJnPJUT1F3DjYDBunJj9TqAHdvu8iOc/p1jHawP+F6olL9tgYKGXbPRTyxptl8QDEEVwSMEJR/QBLqipAES1ULcl7fd1Tw6Jqk6CkqZR2z/hM961Owavd+GypnvXAD/YcP60d7ZtSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNyl1NS4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNyl1NS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712767042; x=1744303042;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x6kX87sRMXHnPbyjGe1FRW5wticTlTZoe6fTYLdulTE=;
  b=XNyl1NS4ZaY2PKv/wSrtJTAd5zXWvHaH/bFY8x1Gy/fOTu0XvN1ZujIa
   sxWk3E7MOxGWaSeXSn89/urUc+oYlwYAbweRXjeJLoxGlwigssJBPsJPh
   LXEcc4PFcX2BhUh9eE4Dtg/TMkb2chyFUfj+AZDaOvGoT74A4ssCoIxcX
   TUbxjcFveC8/A2QK4i5vTj27TnCIHSkAk80vXuhZUfis+9t7cfB1WAh+d
   vieccn/mf0syg3NZd+7w84V1Iw12nCayPligiR4R9DjcBI78QdrqItfYC
   LlLrEoHbOu4R9y7CGuremcf8Oz4STkmb59nHERQ0NHVs8OdAULJkbXvsQ
   Q==;
X-CSE-ConnectionGUID: HwU7fUTpRdKUVl9f9dr2vA==
X-CSE-MsgGUID: 9R+vxy7MQsq7pdOeZ/tt4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11993431"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11993431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 09:37:21 -0700
X-CSE-ConnectionGUID: NpbDo5nHQdSPdXFbwpU2cA==
X-CSE-MsgGUID: cRzfX3jIQN+eMbYM4rv5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25375507"
Received: from tashley-mobl.amr.corp.intel.com (HELO [10.255.230.246]) ([10.255.230.246])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 09:37:21 -0700
Message-ID: <527e7fb6-dc10-4072-bac3-11f30dc2149b@linux.intel.com>
Date: Wed, 10 Apr 2024 09:37:20 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Don't allow HSMP=y and PMC to be
 enabled together
To: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20240410141025.410-1-mario.limonciello@amd.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240410141025.410-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/10/24 7:10 AM, Mario Limonciello wrote:
> If the HSMP driver is compiled into the kernel it can cause problems
> on systems that support PMC since it probes hardware it shouldn't.
>
> Prevent users from compiling HSMP as built-in when PMC is enabled.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2414
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3285
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
> index 883c0a95ac0c..d734f6698f97 100644
> --- a/drivers/platform/x86/amd/pmc/Kconfig
> +++ b/drivers/platform/x86/amd/pmc/Kconfig
> @@ -7,6 +7,7 @@ config AMD_PMC
>  	tristate "AMD SoC PMC driver"
>  	depends on ACPI && PCI && RTC_CLASS && AMD_NB
>  	depends on SUSPEND
> +	depends on (AMD_HSMP = n) || (AMD_HSMP = m)

Can't you use depends on AMD_HSMP!=y ?

>  	select SERIO
>  	help
>  	  The driver provides support for AMD Power Management Controller

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

