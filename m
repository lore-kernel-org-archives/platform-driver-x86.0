Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448374D4899;
	Fri, 18 Sep 2026 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730391; cv=none; b=K5MSLpGUGQTZiPVydcECFgEeehoCh1ltzT5/VsizGCX3tlAaAXLCfAJ4KfiS5ohafgs1Ts/bxzaJBWOvA2fKI4r0FrVshpCFmGbLDWEBqxY1vBGPj0kItfPy0w8CVxYUp9CeerHzTQ1cNuXB9PBgI9Lwn/o8rCAZW7x70lmHE/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730391; c=relaxed/simple;
	bh=1CLzcdM9wdo5qhwY4BmmOgSDYvGQTofOdhNF8bgHAQQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HEt03dMnQDofAQ66WQLDWuZ67K0xI3TyCSOk8v6z9ekDsxhO9+EAp80+gNdepdIqqL0fWvs0YEmPuZoa2weEttFHZxzVCz9zMPeGLmMU1QjrWETp7zvNrN2ixWRBveH7KuhkyF3OYVTlRCGEZA4xbbTc3XnXUBfcW+Ai/xBNwe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPEx9dgu; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPEx9dgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789730388; x=1821266388;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1CLzcdM9wdo5qhwY4BmmOgSDYvGQTofOdhNF8bgHAQQ=;
  b=CPEx9dguFyPMGaFpkLJw/04L4+3DP1XBqhM7Q6Eo8/sihTrtILK9B7mK
   ahm883Tne1rHUBUJ2AGiOWmH1oZur/Feo17vg2lWLgWY8WXf17O3TOAaD
   H9MlnizvrNmJPlLiarLMHv+jjaSOeHSeSLLM0FuXQ0gqPyiLT0qvi60+U
   E0Q5YAc0k/7R4dfFLym4aXbJpZBy0eQOVaZg5PkxMAnFoCfZag/lLQhI0
   yAJBSpQJ/5xw1P3JLw9E4S/VqM62DH0Ne6VLhtTnY7dItbyoqVac3jXo8
   /svW8dsUecoML9UdRxUes6oDr5UjO7t9qwzJ5Q80K7PqTuCKE0IAFRQTc
   A==;
X-CSE-ConnectionGUID: WgHpH4DLSOGppkn34o7p/w==
X-CSE-MsgGUID: b/GkmWGdTmqqX0gpC2/KJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="735988"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="735988"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:19:47 -0700
X-CSE-ConnectionGUID: sUQuAkMLQGqedZGGNjHwyw==
X-CSE-MsgGUID: sNEaTey+T7267W+EUWkVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2544437"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:19:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 14:19:38 +0300 (EEST)
To: Justin Vargas <justinyvar@gmail.com>, W_Armin@gmx.de
cc: jlee@suse.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: acer-wmi: Add support for Acer Nitro
 ANV15-51
In-Reply-To: <20260819041740.9645-1-justinyvar@gmail.com>
Message-ID: <a00b2a01-8629-d242-584d-08a5e983e970@linux.intel.com>
References: <20260729222920.6490-1-justinyvar@gmail.com> <20260819041740.9645-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Aug 2026, Justin Vargas wrote:

> The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for thermal
> profile handling, hardware monitoring and fan control, but has no quirk
> entry, so none of these features are available.
> 
> Add a quirk entry for this model.
> 
> Note that this machine does not support the turbo thermal profile: its
> supported profiles bitmap (misc setting 0x0A) reads 0x53, and writing

Armin removed support for trusting the "supported bitmap" in b0908e03fdd4 
("platform/x86: acer-wmi: Stop using ACPI bitmap for platform profile 
choices") as it was unclear if we'd interpreted their meaning correctly.

> PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
> remaining profiles work as expected.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Justin Vargas <justinyvar@gmail.com>
> Tested-by: Justin Vargas <justinyvar@gmail.com>
> ---
> v3: Use a model-specific quirk_entry with cpu_fans, gpu_fans and pwm
>     set, as suggested by Armin Wolf, instead of reusing
>     quirk_acer_predator_v4. Fan control is now tested (see below).
> v2: Add Assisted-by trailer per
>     Documentation/process/coding-assistants.rst.
> 
> Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026), by building
> this patch as an out-of-tree acer-wmi module against kernel
> 7.1.8-1-cachyos and loading it on the machine.
> 
> Thermal profiles:
> 
>   $ cat /sys/firmware/acpi/platform_profile_choices
>   low-power quiet balanced balanced-performance performance
> 
>   low-power, quiet, balanced and balanced-performance all apply
>   successfully and audibly change fan behaviour. Writing performance
>   fails with -EIO, consistent with the supported profiles bitmap
>   (misc setting 0x0A) reading 0x53, i.e. bit 5 (turbo) clear.
> 
> hwmon and fan control, via the acer hwmon device:
> 
>   pwm_enable  pwm    fan1 (CPU)  fan2 (GPU)
>   2 (auto)    229    2311 RPM    2057 RPM
>   1 (manual)  255    8167 RPM    2077 RPM
>   1 (manual)  128    4482 RPM    2065 RPM
> 
>   Setting pwm2 to 255 raised fan2 to 7284 RPM while fan1 was unaffected,
>   so the two fans are independently controllable. Restoring
>   pwm1_enable/pwm2_enable to 2 returned both fans to automatic control
>   (2267 / 2000 RPM at idle).
> 
>   temp1_input, temp2_input and temp3_input are also exposed.
> 
> The WMI mechanism was cross-checked on Windows, where NitroSense switches
> profiles via SetGamingMiscSetting with index 0x0B and the same profile
> values used by this driver.
> 
> The analysis and patch were produced with AI assistance (see the
> Assisted-by trailer); all testing was performed by me on the physical
> machine, and I take responsibility for the patch as signed off above.
> 
>  drivers/platform/x86/acer-wmi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index e0eaaefb13d..86c212df49f 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -466,6 +466,13 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
>  	.gpu_fans = 1,
>  };
>  
> +static struct quirk_entry quirk_acer_nitro_anv15_51 = {
> +	.cpu_fans = 1,
> +	.gpu_fans = 1,
> +	.predator_v4 = 1,

Can you respin this on top of the commits in the review-ilpo-next branch 
which contains the commit 2502b3d92132 ("platform/x86: acer-wmi: split 
hwmon from platform profile quirk"). Note that the commit id may change 
if I need to do a force push due to some issue.

-- 
 i.

