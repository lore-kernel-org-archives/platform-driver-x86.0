Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB03DD52B;
	Tue, 31 Mar 2026 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945362; cv=none; b=R1FxxMAyj7A0CK7jtD3rdid0aVWmpf2/MhiOf0r21K1d184hgsXGtauJEVnmAPCXSvvw65trr/BmMS9u6kwRMae69kmVxAz2t/hO2F03mvKPk0R63rJkccxCcAh4qEG9BDsts9qvTPPUCLIiTw/ur0y/85M2e7ngqVFA8ArphRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945362; c=relaxed/simple;
	bh=Zd4WaMCTgyRS5Xtx4dnVef/ZdkWg0l1Xx5T22hWMW/U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PVx1YXD3OyiTztsi7lLqzGFi4Y+MTItvlKzUBFqIM/pzcBvTsMk4Nu0eMoF7v5tmeprDy92Z7mV9gaauH8SCdM7HXnl33LxFzzlwHpMfd+DVQrQyIDGd+DHpqbV4ChFK7zskvie9R7XToSr+fNyGBe4YEP3GGf6oTMBEVifAl7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISor5gNC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISor5gNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774945360; x=1806481360;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Zd4WaMCTgyRS5Xtx4dnVef/ZdkWg0l1Xx5T22hWMW/U=;
  b=ISor5gNC2K74fQ9B3fTByJAQmrMfxOWH/E83UMVs4kRgiQxLh68azjf5
   +BQi8Bh7Ne4HmpD90FpVi50Pv4JOgTgEZosli4tQa0mgKH0Nh2xEIhT0w
   Hlm3SdLDyGmx+pnb16GEBnyCJhH+kKFtQP4/IVLFhQeZ0du6PUmfDq9hO
   JaKYgR0QLNMZ8Kb7ALC1LUmy/I9EzeTnkhxDwrUtEyviP/EiOKbl4AYjS
   aMu4lhbOk+UsBcToFOhGoLu/QXfHGeJi5rGp4E8NvEP+KLMvhs3JK1fXK
   io1gZfFAuio/sHSnvP2PjjLU4fXe08DVslAyVTs/HYqTtZYA1xhpVOgtg
   w==;
X-CSE-ConnectionGUID: eCTFahfkSYmkboQFGbsI3w==
X-CSE-MsgGUID: VmXVdhXmSg6JISIzt168ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74982598"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74982598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:22:39 -0700
X-CSE-ConnectionGUID: 91diz+HqSp61TCN5+8/9vg==
X-CSE-MsgGUID: Cy4YF5nvSky3iL9+Kn2VCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226546442"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:22:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 11:22:32 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: alienware-wmi-base: Transition to new
 WMI API
In-Reply-To: <20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com>
Message-ID: <d80f8562-f05d-c22a-5d62-398bf05b7030@linux.intel.com>
References: <20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Mar 2026, Kurt Borja wrote:

> Transition to the new wmi_buffer based WMI API.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> v2:
>   - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
>     returning
> 
> v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com
> ---
>  drivers/platform/x86/dell/alienware-wmi-base.c | 32 +++++++++++++++-----------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> index 64562b92314f..9abdc5de8e23 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -9,11 +9,13 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> -#include <linux/cleanup.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/dmi.h>
>  #include <linux/leds.h>
> +
> +#include <asm/byteorder.h>
> +
>  #include "alienware-wmi.h"
>  
>  MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> @@ -150,23 +152,27 @@ u8 alienware_interface;
>  int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>  			  void *in_args, size_t in_size, u32 *out_data)
>  {
> -	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
> -	struct acpi_buffer in = {in_size, in_args};
> -	acpi_status ret;
> +	struct wmi_buffer out, in = {
> +		.data = in_args,
> +		.length = in_size,
> +	};
> +	int ret;
>  
> -	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
> -	if (ACPI_FAILURE(ret))
> -		return -EIO;
> +	ret = wmidev_invoke_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
> +	if (ret)
> +		return ret;
>  
> -	union acpi_object *obj __free(kfree) = out.pointer;
> +	if (!out_data)
> +		return 0;
>  
> -	if (out_data) {
> -		if (obj && obj->type == ACPI_TYPE_INTEGER)
> -			*out_data = (u32)obj->integer.value;
> -		else
> -			return -ENOMSG;
> +	if (out.length < sizeof(*out_data)) {
> +		kfree(out.data);
> +		return -ENOMSG;
>  	}
>  
> +	*out_data = le32_to_cpu(*(__le32 *)out.data);
> +	kfree(out.data);

Hi,

Please don't bring back duplicated kfree() calls. Just assign out.data 
into a local variable so you can use __free() for it similar to what the 
old code did.

-- 
 i.

