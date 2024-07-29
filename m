Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758A145A14
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251585; cv=none; b=fesI6xARmv8UQ1gFLn8DldjbOHRpAPwvnPhFedOJ0J22b+7m0QnVvF02rEFUncZBvhLWXzUIlg+tIk+lwsCibzEqAqZCJQE1qtAEdp7+ZW78zpP9//SkQ4ZkKmKOToGK5IcTZRf7z4GKSbMqi1U4xGuGtf/uNNvDzGyN3O/AOJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251585; c=relaxed/simple;
	bh=CZqKlNwWmW7Lt0EjociUJKDiNs20lqoO6nDeKLooJd0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BMvLxccqu5vMKSKcvpJDaqQHaDO50RhgGTlUjRaoc0snj/CrVyY2r9hd0264fo+1Mowq5WJ7gTfPB/URRM1Z2KlevkyFWD0dYW94qxXPUnwUWxH53JZTH7aPkSRJLLJkf/vW6FwpYyCRNW4eK0RyCSN3tXLxhOXG7bd3AxMve0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrrkTvzS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrrkTvzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722251583; x=1753787583;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CZqKlNwWmW7Lt0EjociUJKDiNs20lqoO6nDeKLooJd0=;
  b=jrrkTvzSRjR/Lu7k4O8vt7Q6jhW2sGVPRpuFZhFqqYU7hpwqY1/5jevD
   YOHjLT6yemhK8ZjACh2SKMfVUsyCYXBI7B4rA/wwXGL1uvjyzDXhG+ck1
   PngbZYiDaqaxACDJvPztSUEagVK74dPEgKFxIfEIp4eRWHfaFgn67aRAo
   ZWXaAeSsH+WRy7R5zi5UDs6ltTvlIRzkc79KsA2huGbsYP38G5IN7ce0G
   JK9Rh49Qun5Pf2XRZJiSYPz9kbQFLRs7HnXhH9mQGgJuqrcTyE2KmnguR
   lIzAWefew6jl2VTIIMnb6bv/4vJZbx5oSbQPNmqDbj1rRxaV1vXQhz1LV
   w==;
X-CSE-ConnectionGUID: nxcIfnlqRkG6w3nL5E8vBw==
X-CSE-MsgGUID: A1L1+W2HRm2WvJjz98+flA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="42523747"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="42523747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 04:13:03 -0700
X-CSE-ConnectionGUID: VFizjErnRyKmiBJUsbBkXA==
X-CSE-MsgGUID: OlxOwPWFRKKGx2ayoTXjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="58532861"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 04:13:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jul 2024 14:12:56 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
    En-Wei Wu <en-wei.wu@canonical.com>, 
    Kostadin Stoilov <kmstoilov@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Protect ACPI notify handler
 against recursion
In-Reply-To: <20240729110030.8016-1-hdegoede@redhat.com>
Message-ID: <823cf3b0-5051-d0af-29d5-ebc83d37ccdd@linux.intel.com>
References: <20240729110030.8016-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jul 2024, Hans de Goede wrote:

> Since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on
> all CPUs") ACPI notify handlers like the intel-vbtn notify_handler() may
> run on multiple CPU cores racing with themselves.
> 
> This race gets hit on Dell Venue 7140 tablets when undocking from
> the keyboard, causing the handler to try and register priv->switches_dev
> twice, as can be seen from the dev_info() message getting logged twice:
> 
> [ 83.861800] intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event
> [ 83.861858] input: Intel Virtual Switches as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input17
> [ 83.861865] intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event
> 
> After which things go seriously wrong:
> [ 83.861872] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input17'
> ...
> [ 83.861967] kobject: kobject_add_internal failed for input17 with -EEXIST, don't try to register things with the same name in the same directory.
> [ 83.877338] BUG: kernel NULL pointer dereference, address: 0000000000000018
> ...
> 
> Protect intel-vbtn notify_handler() from racing with itself with a mutex
> to fix this.
> 
> Fixes: e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on all CPUs")
> Reported-by: En-Wei Wu <en-wei.wu@canonical.com>
> Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2073001
> Tested-by: Kostadin Stoilov <kmstoilov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/vbtn.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 9b7ce03ba085..93deda7daac4 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -12,6 +12,7 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/suspend.h>
>  #include "../dual_accel_detect.h"
> @@ -66,6 +67,7 @@ static const struct key_entry intel_vbtn_switchmap[] = {
>  };
>  
>  struct intel_vbtn_priv {
> +	struct mutex mutex; /* Avoid notify_handler() racing with itself */
>  	struct input_dev *buttons_dev;
>  	struct input_dev *switches_dev;
>  	bool dual_accel;
> @@ -155,30 +157,32 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	bool autorelease;
>  	int ret;
>  
> +	mutex_lock(&priv->mutex);
> +
>  	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
>  		if (!priv->has_buttons) {
>  			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
>  				 event);
> -			return;
> +			goto out_unlock;
>  		}
>  		input_dev = priv->buttons_dev;
>  	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
>  		if (!priv->has_switches) {
>  			/* See dual_accel_detect.h for more info */
>  			if (priv->dual_accel)
> -				return;
> +				goto out_unlock;
>  
>  			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
>  			ret = input_register_device(priv->switches_dev);
>  			if (ret)
> -				return;
> +				goto out_unlock;
>  
>  			priv->has_switches = true;
>  		}
>  		input_dev = priv->switches_dev;
>  	} else {
>  		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> -		return;
> +		goto out_unlock;
>  	}
>  
>  	if (priv->wakeup_mode) {
> @@ -189,7 +193,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  		 * mirroring how the drivers/acpi/button.c code skips this too.
>  		 */
>  		if (ke->type == KE_KEY)
> -			return;
> +			goto out_unlock;
>  	}
>  
>  	/*
> @@ -200,6 +204,9 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>  
>  	sparse_keymap_report_event(input_dev, event, val, autorelease);
> +
> +out_unlock:
> +	mutex_unlock(&priv->mutex);

Please use guard() and keep the return statements as is + add cleanup.h 
include if not yet there.

-- 
 i.


>  }
>  
>  /*
> @@ -290,6 +297,10 @@ static int intel_vbtn_probe(struct platform_device *device)
>  		return -ENOMEM;
>  	dev_set_drvdata(&device->dev, priv);
>  
> +	err = devm_mutex_init(&device->dev, &priv->mutex);
> +	if (err)
> +		return err;
> +
>  	priv->dual_accel = dual_accel;
>  	priv->has_buttons = has_buttons;
>  	priv->has_switches = has_switches;
> 
