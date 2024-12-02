Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAE175D26
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157277; cv=none; b=sohUsnCaH+59eomxzmoNUk7L/3XMN9tHghzvaGnJwaH+FDTNsChW9jlQ+oQw9qWlSNGDoN18Ar0u8QbUxaoul2Ynfti3lOmbrd+bxBO4o+q1j+zVIvLx9IOslmEcQBBnkXBMC8L6QrI3pDc6OlD3BtDqUDe7lxPivVx6xW3u0M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157277; c=relaxed/simple;
	bh=ZjwBt1PrwXj7Mb0M5HFltm4SrGZMTdD6eVYSErNhzRA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XDVFIEce6SBfgYq83Qxe26984cZKQ4nt36jX/w1L0qDW+dd5iJvy1ElRH+/mlHE64hoGGRayeSZZ9+YpfeMQ9fulMY2uwjI5xgKvd91VRH/eZDoyJ/pspjt5z//FdbZYwsp2Z7D+f7zK5gAvIY67jzSHqTzHtlNB9iZI/foc7ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIpaVscL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIpaVscL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733157276; x=1764693276;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZjwBt1PrwXj7Mb0M5HFltm4SrGZMTdD6eVYSErNhzRA=;
  b=oIpaVscLoSzr7ETWCDyMn3htVDrexoqTv5Hczdq6N36RoKgdz5UBqx6G
   OvRrtqXMxWtDrZ/63lWknYdw8giOD5YygJvy+lqit048ohjOtWtNzG/B/
   8+9ZUFI6VF09ApfaJ28WNgWpP/jb9XgTdQUKIGONhcJzMHEtu9Zdo2Fkx
   6Acd3i0TOZ67dnfEj3h4VmS2kGeexzRSepA5p9UukKe7v9GsSfLnh02sm
   mn2D58GS+FLxs9Agf/WKDCXhhs8tjYrC5lKYS1ucn78o9Oi4bKVL5Kwle
   ja4/UK72TA4KrNMf5f6I3QG21zfbwHUpac+YV8uaTEIB8KUiS0bzRSU3G
   Q==;
X-CSE-ConnectionGUID: Yi5KYQi9TE648ekcZj5s8Q==
X-CSE-MsgGUID: 22bLK3r8SQGpG7Fhd7Xe9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="55824103"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="55824103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:34:35 -0800
X-CSE-ConnectionGUID: dwxsfNbXQXSbNxnJgG0kXg==
X-CSE-MsgGUID: f/04rYSqQCuCudJSjaHg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="92981248"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:34:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Dec 2024 18:34:29 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/6] platform/x86: serdev_helpers: Add
 get_serdev_controller_from_parent() helper
In-Reply-To: <20241116153533.84722-2-hdegoede@redhat.com>
Message-ID: <c6ef83c3-824e-cb9d-93ec-80dc98cfa2b7@linux.intel.com>
References: <20241116153533.84722-1-hdegoede@redhat.com> <20241116153533.84722-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 16 Nov 2024, Hans de Goede wrote:

> The x86-android-tablets code needs to be able to get a serdev_controller
> device from a PCI parent, rather then by the ACPI HID+UID of the parent,
> because on some tablets the UARTs are enumerated as PCI devices instead
> of ACPI devices.
> 
> Split the code to walk the device hierarchy to find the serdev_controller
> from its parents out into a get_serdev_controller_from_parent() helper
> so that the x86-android-tablets code can re-use it.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/serdev_helpers.h | 60 +++++++++++++++------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86/serdev_helpers.h
> index bcf3a0c356ea..b592b9ff6d93 100644
> --- a/drivers/platform/x86/serdev_helpers.h
> +++ b/drivers/platform/x86/serdev_helpers.h
> @@ -22,32 +22,14 @@
>  #include <linux/string.h>
>  
>  static inline struct device *
> -get_serdev_controller(const char *serial_ctrl_hid,
> -		      const char *serial_ctrl_uid,
> -		      int serial_ctrl_port,
> -		      const char *serdev_ctrl_name)
> +get_serdev_controller_from_parent(struct device *ctrl_dev,
> +				  int serial_ctrl_port,
> +				  const char *serdev_ctrl_name)
>  {
> -	struct device *ctrl_dev, *child;
> -	struct acpi_device *ctrl_adev;
> +	struct device *child;
>  	char name[32];
>  	int i;
>  
> -	ctrl_adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
> -	if (!ctrl_adev) {
> -		pr_err("error could not get %s/%s serial-ctrl adev\n",
> -		       serial_ctrl_hid, serial_ctrl_uid);
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	/* get_first_physical_node() returns a weak ref */
> -	ctrl_dev = get_device(acpi_get_first_physical_node(ctrl_adev));
> -	if (!ctrl_dev) {
> -		pr_err("error could not get %s/%s serial-ctrl physical node\n",
> -		       serial_ctrl_hid, serial_ctrl_uid);
> -		ctrl_dev = ERR_PTR(-ENODEV);
> -		goto put_ctrl_adev;
> -	}
> -
>  	/* Walk host -> uart-ctrl -> port -> serdev-ctrl */
>  	for (i = 0; i < 3; i++) {
>  		switch (i) {
> @@ -67,14 +49,40 @@ get_serdev_controller(const char *serial_ctrl_hid,
>  		put_device(ctrl_dev);
>  		if (!child) {
>  			pr_err("error could not find '%s' device\n", name);
> -			ctrl_dev = ERR_PTR(-ENODEV);
> -			goto put_ctrl_adev;
> +			return ERR_PTR(-ENODEV);
>  		}
>  
>  		ctrl_dev = child;
>  	}
>  
> -put_ctrl_adev:
> -	acpi_dev_put(ctrl_adev);
>  	return ctrl_dev;
>  }
> +
> +static inline struct device *
> +get_serdev_controller(const char *serial_ctrl_hid,
> +		      const char *serial_ctrl_uid,
> +		      int serial_ctrl_port,
> +		      const char *serdev_ctrl_name)
> +{
> +	struct acpi_device *adev;
> +	struct device *parent;
> +
> +	adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
> +	if (!adev) {
> +		pr_err("error could not get %s/%s serial-ctrl adev\n",
> +		       serial_ctrl_hid, serial_ctrl_uid);

Hi,

With the current code (and I suppose this moved too), W=1 build detects 
that dell_uart_bl_pdev_probe() passed NULL which is then being formatted 
here with %s. While it "works", it would be useful to solve the warning 
and perhaps "/(null)" appearing in the print is also confusing to user 
so maybe do another patch to change serial_ctrl_uid to e.g.:

	serial_ctrl_uid ?: "*"

(There's another print below with the same problem).

--
 i.

> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	/* get_first_physical_node() returns a weak ref */
> +	parent = get_device(acpi_get_first_physical_node(adev));
> +	acpi_dev_put(adev);
> +	if (!parent) {
> +		pr_err("error could not get %s/%s serial-ctrl physical node\n",
> +		       serial_ctrl_hid, serial_ctrl_uid);
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	/* This puts our reference on parent and returns a ref on the ctrl */
> +	return get_serdev_controller_from_parent(parent, serial_ctrl_port, serdev_ctrl_name);
> +}
> 
