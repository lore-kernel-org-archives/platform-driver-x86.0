Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B22566DA
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401354; cv=none; b=Wfa/cMmaWhU/KPGGX2hPaj1Y0/Vk9sdSQ1TvKVB4nFFVw3YTgn3czz7gjgfysScKzXVKQQGhcD5gSS2QS3VaznUEPDUctxd/AuhPJZBeLiIewqqzd66a7f84ApP7bovIq6X82RsBMjRhhRkz9qyOOzPf4IQR35JJ4FtED4NpJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401354; c=relaxed/simple;
	bh=j67p8aB7XPW1vhL19sO5+IekjmlqK3mvJGCsTpP0/HI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qYfhUDPM85OwKqBIHUUa7BbcQk/b39CRDuUkgohjSsY9jPi0EkDmOyFYkBlD8Nyn5UNjekLB8Z/iLvpfr1uvYCDGsooxeYr48lPQTc5PLapLGn9hI52pWro5X4ZrZOl4k/Td1MHPoVC/719IrkEwOMDKt6P3M+YdwJNRPxWW9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAbgPw+C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAbgPw+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745401352; x=1776937352;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=j67p8aB7XPW1vhL19sO5+IekjmlqK3mvJGCsTpP0/HI=;
  b=WAbgPw+CE+nRpLeJdK5tnvxZoseLBxSBF2dErX8V+CkB9wZ7GaH8LGqh
   UWy9vrY1mtwRCCU7rBZrBcewgaX9FDCLwJOYgT/2+p2bq0gxHtuVYWLI7
   5gbxiteI3hLeNoj8zuBDJCu2Y4RNASldZ1Gvj5QANuKitVKv1K2KqbMMn
   3krekkSDWbm6cNz1cVr5j86YnIjTFmHzIHaDRzPFw2nYKW4uCMznYoZ9D
   sHE2eQMPZPr39usQdm+ijv2j4c7xoqXr9/kRCkZ8zyBagzbriynyCKFxU
   eRVGqiUwy+w7wjsggI7KwBR3rdKU56YQQDbw6WDLPRVyRZo2lhEePuIEq
   A==;
X-CSE-ConnectionGUID: /6VM1sSYQoCO2dNvjV71rg==
X-CSE-MsgGUID: yibYFfr5Sp631kLpFIc/Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46868914"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46868914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 02:42:32 -0700
X-CSE-ConnectionGUID: VOZAyAIdR72B6DkJszl2nw==
X-CSE-MsgGUID: GIB9cFV8Tl2Dc1oPtrHLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="163325914"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 02:42:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Apr 2025 12:42:26 +0300 (EEST)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add support for new
 hotkey for  camera shutter switch
In-Reply-To: <20250423055130.9146-1-nitjoshi@gmail.com>
Message-ID: <669674a9-935b-78a7-0556-ec597ce2b1a5@linux.intel.com>
References: <20250423055130.9146-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Nitin Joshi wrote:

> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
> Changes in v2:
> 
> * Added ASL method to get camera shutter status and send it to userspace.
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5790095c175e..80b02e8538e8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>  						   * directly in the sparse-keymap.
>  						   */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>  	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
> @@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
>  	}
>  }
>  
> +static int get_camera_shutter(void)
> +{
> +	acpi_handle gces_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle))) {
> +		/* Platform doesn't support GCES */

Drop this as it's unnecessary/very obvious.

> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
> +		return -EIO;
> +
> +	if (output & BIT(31))

Please use a named define instead of using BIT(31) directly as it improves 
code readability a lot.

> +		return -ENODEV;
> +
> +	return output;
> +}
> +
>  static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  {
>  	bool known_ev;
> @@ -3272,6 +3292,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>  	 * after switching to sparse keymap support. The mappings above use translated
>  	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>  	 */
> +	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>  	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>  	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>  	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
> @@ -3303,7 +3324,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	const struct key_entry *keymap;
>  	bool radiosw_state  = false;
>  	bool tabletsw_state = false;
> -	int hkeyv, res, status;
> +	int hkeyv, res, status, camera_shutter_state;
>  
>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  			"initializing hotkey subdriver\n");
> @@ -3467,6 +3488,13 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (res)
>  		return res;
>  
> +	camera_shutter_state = get_camera_shutter();
> +	if (camera_shutter_state >= 0) {
> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
> +		input_report_switch(tpacpi_inputdev,
> +				SW_CAMERA_LENS_COVER, camera_shutter_state);

The second parameter fits on the previous line.

> +	}
> +
>  	if (tp_features.hotkey_wlsw) {
>  		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>  		input_report_switch(tpacpi_inputdev,
> @@ -3633,6 +3661,8 @@ static void adaptive_keyboard_s_quickview_row(void)
>  /* 0x1000-0x1FFF: key presses */
>  static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>  {
> +	int camera_shutter_state;
> +
>  	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
>  	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
>  		*send_acpi_ev = false;
> @@ -3643,6 +3673,17 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>  			return true;
>  	}
>  
> +	camera_shutter_state = get_camera_shutter();
> +	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE && (camera_shutter_state >= 0)) {
> +		mutex_lock(&tpacpi_inputdev_send_mutex);
> +
> +		input_report_switch(tpacpi_inputdev,
> +			SW_CAMERA_LENS_COVER, camera_shutter_state);
> +		input_sync(tpacpi_inputdev);
> +
> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
> +	}
> +
>  	return tpacpi_input_send_key(hkey, send_acpi_ev);
>  }
>  
> 

-- 
 i.

