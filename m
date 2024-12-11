Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00C5236919
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925481; cv=none; b=MwZZyKpog0oXWVn5Evvfq+F5WdssOjTPLxPZDgzKFeBM/dzjJ9J2BRSSFRZ/ImrRLXPIij+OQyxpiaphfCbxdUmtBwkmwOibDTd47LwEXLaInl9cyQOLRS69ahT89nESGmbQpZLJWWojkXERC5gj52X9IyJg/G4e4T2oA6pZrLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925481; c=relaxed/simple;
	bh=1fZNOGbIpPaCyBnDAgEqrbCezQHIjMU/yXfJemQM09Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XHLyUEl1XCbetnxVMDAS3kCdmZ/9eJ0JwJ3weC0aWfj2rPKZyfYEgwPhC5BVu1f4mLaXbSaCU86P1dlEu/Rj6G9chUd8bFHar5dM8FQUaGaMzKWFp3irmuviL/YGtOBI127miDa4qgpdkaDzxEcFgljktnhaX4Mp4dmooyUeaZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYMIlhlg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYMIlhlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733925480; x=1765461480;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1fZNOGbIpPaCyBnDAgEqrbCezQHIjMU/yXfJemQM09Q=;
  b=WYMIlhlgiHXokAIE2IPDaS2is3YcceEG/kLU/gBkmqQS27yrDh6M/WUG
   mBinpEwRYO7k4A6Rl08u/UfPgZwc4eMjGb9hoRnr4mNEPWtiBfalA206v
   ajXs3neal7mO3/tNYGNnNs8sk0OWC3bPR8jcpnonOMiuD1/grPJ35m8q3
   oBmPXeBCZkD6XWbsmO/Nmc75VSlMejgUIHEmGgpAMnfyIR8MK/cT904cG
   rBO+O3UwVzoi4UAhJhlm8ZLfo2nCcJQbgEkH+RwG4y4ldtR7+Tp11P9On
   uoP6k8CM8CvUcSJkDaXZeDbrBocsRtpV5WHcSjIqqop6b8TSWP3JD8MF2
   g==;
X-CSE-ConnectionGUID: YXuS8T3ZR/Ck0LStvuOpUw==
X-CSE-MsgGUID: Wl3skvDPSlefZ4uBaNQuHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33635911"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="33635911"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 05:57:58 -0800
X-CSE-ConnectionGUID: fuw2LE6mTKOt3dJrVtN+Lw==
X-CSE-MsgGUID: VU/eJEiXRLmtKoXsQhhz6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="126648479"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 05:57:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Dec 2024 15:57:53 +0200 (EET)
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
cc: Andrea.Ho@advantech.com.tw, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: adv_swbutton: use devm_add_action_or_reset()
 for cleanup
In-Reply-To: <20241211085821.3982351-1-joe@pf.is.s.u-tokyo.ac.jp>
Message-ID: <e0782001-7a4f-e341-4ef8-1072904c9571@linux.intel.com>
References: <20241211085821.3982351-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Dec 2024, Joe Hattori wrote:

> Current code leaves the device's wakeup enabled in the error path of
> .probe() and .remove(). Also, the registered input device is not
> unregistered. Add a devm_add_action_or_reset() call and cleanup these
> resources in the callback.
> 
> Fixes: 3d904005f686 ("platform/x86: add support for Advantech software defined button")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in V2:
> - Use devm_add_action_or_reset().
> - Call input_unregister_device().
> ---
>  drivers/platform/x86/adv_swbutton.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
> index 6fa60f3fc53c..5b07c42adfad 100644
> --- a/drivers/platform/x86/adv_swbutton.c
> +++ b/drivers/platform/x86/adv_swbutton.c
> @@ -44,6 +44,14 @@ static void adv_swbutton_notify(acpi_handle handle, u32 event, void *context)
>  	}
>  }
>  
> +static void adv_swbutton_release(void *__input)
> +{
> +	struct input_dev *input = __input;
> +
> +	input_unregister_device(input);

Better but the input device is managed so the unregister call is 
unnecessary.

devm_input_allocate_device() comment says:

 * Managed input devices do not need to be explicitly unregistered or
 * freed as it will be done automatically when owner device unbinds from
 * its driver (or binding fails). Once managed input device is allocated,
 * it is ready to be set up and registered in the same fashion as regular
 * input device. There are no special devm_input_device_[un]register()
 * variants, regular ones work with both managed and unmanaged devices,
 * should you need them. In most cases however, managed input device need
 * not be explicitly unregistered or freed.

-- 
 i.

> +	device_init_wakeup(input->dev.parent, false);
> +}
> +
>  static int adv_swbutton_probe(struct platform_device *device)
>  {
>  	struct adv_swbutton *button;
> @@ -78,6 +86,9 @@ static int adv_swbutton_probe(struct platform_device *device)
>  
>  	device_init_wakeup(&device->dev, true);
>  
> +	if (devm_add_action_or_reset(&device->dev, adv_swbutton_release, input))
> +		return -ENOMEM;
> +
>  	status = acpi_install_notify_handler(handle,
>  					     ACPI_DEVICE_NOTIFY,
>  					     adv_swbutton_notify,
> 
