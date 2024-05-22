Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C72B9C3
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716398353; cv=none; b=OeoZ8iEmGJzNwy4NGjqq20irXUeKL9QR6zel2/UcUc8p2IOEofE5/9mIP4V5NPxDfljH9M+WvRSikSAgPQWY+gO3W2nih4m0jROVE7ZGC9+2wsojpn9Hnd8j8FtMUswOBflLn6Gn6hftFTI/Qk0afJl9LQ94SWIPrDcl+5naEj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716398353; c=relaxed/simple;
	bh=3LXJ1V8wLIo6Scr+2D8aUyJXKV2K/7MujpcGOrU09Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jpbri/eutvmy5sstIQY/figFeE+LrirUQUFN1gljELAZuyqDuzAxXUjIeUVDcH05KDS0Z4l5HyE5m8wlxOP9RdxopDIUIwen3W+xVb/hiLigxXEU0RB4AlRg9hrlD3ihYDDy2zyfekFlD8SsWsHc9iwWYSpv0/DuchmY+kxazRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Zq5amy9dSZSdDNlTcq43Bw==
X-CSE-MsgGUID: TmPz9HpGT0G/yY3DImVjZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12609288"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12609288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 10:19:12 -0700
X-CSE-ConnectionGUID: l4GeEZScR123bqIX+vhRVQ==
X-CSE-MsgGUID: XmBZaTaHRQaH2HMpYY/iBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33222531"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 10:19:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s9pcJ-0000000A3Li-1QCL;
	Wed, 22 May 2024 20:19:07 +0300
Date: Wed, 22 May 2024 20:19:07 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Gregor Riepl <onitake@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
Message-ID: <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
References: <20240522164807.28936-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522164807.28936-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:
> On x86/ACPI platforms touchscreens mostly just work without needing any
> device/model specific configuration. But in some cases (mostly with Silead
> and Goodix touchscreens) it is still necessary to manually specify various
> touchscreen-properties on a per model basis.
> 
> touchscreen_dmi is a special place for DMI quirks for this, but it can be
> challeging for users to figure out the right property values, especially
> for Silead touchscreens where non of these can be read back from the ctrl.
> 
> ATM users can only test touchscreen properties by editing touchscreen_dmi.c
> and then building a completely new kernel which makes it unnecessary
> difficult for users to test and submit properties when necessary for their
> laptop / tablet model.
> 
> Add support for specifying properties on the kernel commandline to allow
> users to easily figure out the right settings. See the added documentation
> in kernel-parameters.txt for the commandline syntax.

...

> +	/*
> +	 * str is part of the static_command_line from init/main.c and poking
> +	 * holes in that by writing 0 to it is allowed, as is taking long
> +	 * lasting references to it.
> +	 */
> +	ts_cmdline_data.acpi_name = strsep(&str, ",");
> +
> +	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
> +		name = strsep(&str, ",");
> +		if (!name)
> +			break;
> +
> +		/* Replace '=' with 0 and make value point past '=' or NULL */
> +		value = name;
> +		strsep(&value, "=");
> +		if (!value) {
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
> +		} else if (isdigit(value[0])) {
> +			ret = kstrtou32(value, 10, &u32val);
> +			if (ret)
> +				return ret;
> +
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
> +		} else {
> +			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
> +		}
> +	}

This reminds me a lot from the next_arg(), can we not reinvent a wheel?

> +
> +	if (!i)
> +		return -EINVAL; /* No properties specified */
> +
> +	if (str)
> +		return -ENOSPC; /* More then MAX_CMDLINE_PROPS properties specified */
> +
> +	ts_data = &ts_cmdline_data;
> +	return 0;
> +}

...

> +	struct ts_dmi_data *ts_data_dmi = NULL;

I prefer to see 'else' branch closer to the 'if' which will avoid a need to
look somewhere else in the code to answer the question "what if condition is
false".

...

> +	if (!ts_data && !ts_data_dmi)
>  		return 0; /* Not an error */

This is basically a part of the below now:

> -	ts_data = dmi_id->driver_data;
> +	if (ts_data) {
> +		/*
> +		 * Kernel cmdline provided data takes precedence, copy over
> +		 * DMI efi_embedded_fw info if available.
> +		 */
> +		if (ts_data_dmi)
> +			ts_data->embedded_fw = ts_data_dmi->embedded_fw;

> +	} else {
> +		ts_data = ts_data_dmi;
> +	}

	} else if (ts_data_dmi) {
		ts_data = ts_data_dmi;
	} else {
		return 0; /* Not an error */
	}

-- 
With Best Regards,
Andy Shevchenko


