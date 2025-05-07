Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509D1F417B
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613359; cv=none; b=Ssq4eYsN22CXpP2JwuItaL4z8mU0F065qLfX1bH5H/sWDdYgMzH5bavJx1nkMo5+90bvswM+i7GQI9LpjVA9BCWSQpDx8LIpam1KVHqsLbv4feObPTYzuVbX9kVQEoAimbJ4wgOJSGHq/9RAi7/RcPD4KpTqPD/jm6KnZwmDoZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613359; c=relaxed/simple;
	bh=As2f1mhaDBEdjERdliqCjSGQscwJDN2toe5EEqSKQz8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gq1OHZl08jnEwD1YdieE8xN99EB9uLteTj3++B+VYmlUCrz/BjfyMdTG2SZip+5b0zDsloUQfxtE4NJKtziQkY4Ei9f9hersljVZTwQ2fneIRmCzMxiAuZc2n++kWolarwqSm461vrxOutOnVqfXfkEAG/eT4qodnBmJgFapj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUj7vYmV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUj7vYmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746613357; x=1778149357;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=As2f1mhaDBEdjERdliqCjSGQscwJDN2toe5EEqSKQz8=;
  b=BUj7vYmV1UDBYnQs+CQ/c+nek1OtoudhkgVOX1n3uFu8N3OFZh68NXnI
   azSte5V5iYf74mtDvN9gPiGhxgjbKUI7MF5FQb+a4KnHdC3mssoia3c0Q
   cTSvu+Z43950OV+X/5Tz8Q68n0LIoiqVL+ZeXKAJV7YFYZuPm2pElkfnV
   r3uNfy0Pfi70AKjMPaYfYGOl6lSEdjbyyh8tdD7OV3h3ZzJny3C236AKF
   Xf9nXOdQ2pEF/N9TQHnCJ7xd+5az2bMjOUH1GXfEEWxrE3w8cqJ4NZJlP
   gkrf+gymk9jcEHi3auBsTJwoojcF5pD0Cl3oHjHpqNqejntNrrLJseVwl
   A==;
X-CSE-ConnectionGUID: Y/E0ezaAQzeEZ0SAP3F1rA==
X-CSE-MsgGUID: KL91SPumQ+Ov3+1ogy1zMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="50980867"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="50980867"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:22:36 -0700
X-CSE-ConnectionGUID: FrDIJFUiRFa17vnz2YCsSg==
X-CSE-MsgGUID: X3VKEekVRLKVCVqmEKVQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135776526"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:22:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 May 2025 13:22:29 +0300 (EEST)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v6] platform/x86: thinkpad-acpi: Add support for new
 hotkey for  camera shutter switch
In-Reply-To: <20250505150152.27968-1-nitjoshi@gmail.com>
Message-ID: <b2c85fc4-e288-c875-68a0-74b287609dd6@linux.intel.com>
References: <20250505150152.27968-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Nitin Joshi wrote:

> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>

Hi,

I've now applied this into the review-ilpo-next branch. You forgot to 
include Hans' reviewed-by tag which he gave for v5. I've added that there 
for you while applying but please try to remember to include given tags 
yourself when submitting a new version (as long as there are no major 
changes that would warrant dropping reviewed-bys). My memory is finite 
and I'll not always remember those myself after looking a large number of 
patches and comments on every week :-).

-- 
 i.

> ---
> Changes in v6:
> * Fix sparse error.
> Changes in v5:
> * Incorporated review comments for consistency.
> Changes in v4:
> * Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
> Changes in v3:
> * Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
>   code more readable.
> Changes in v2:
> * Added ASL method to get camera shutter status and send it to userspace.
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5790095c175e..080063395082 100644
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
> +#define GCES_NO_SHUTTER_DEVICE BIT(31)
> +
> +static int get_camera_shutter(void)
> +{
> +	acpi_handle gces_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle)))
> +		return -ENODEV;
> +
> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
> +		return -EIO;
> +
> +	if (output & GCES_NO_SHUTTER_DEVICE)
> +		return -ENODEV;
> +
> +	return output;
> +}
> +
>  static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  {
>  	bool known_ev;
> @@ -3303,7 +3323,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	const struct key_entry *keymap;
>  	bool radiosw_state  = false;
>  	bool tabletsw_state = false;
> -	int hkeyv, res, status;
> +	int hkeyv, res, status, camera_shutter_state;
>  
>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  			"initializing hotkey subdriver\n");
> @@ -3467,6 +3487,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (res)
>  		return res;
>  
> +	camera_shutter_state = get_camera_shutter();
> +	if (camera_shutter_state >= 0) {
> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +	}
> +
>  	if (tp_features.hotkey_wlsw) {
>  		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>  		input_report_switch(tpacpi_inputdev,
> @@ -11161,6 +11187,8 @@ static struct platform_driver tpacpi_hwmon_pdriver = {
>   */
>  static bool tpacpi_driver_event(const unsigned int hkey_event)
>  {
> +	int camera_shutter_state;
> +
>  	switch (hkey_event) {
>  	case TP_HKEY_EV_BRGHT_UP:
>  	case TP_HKEY_EV_BRGHT_DOWN:
> @@ -11236,6 +11264,19 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  		else
>  			dytc_control_amt(!dytc_amt_active);
>  
> +		return true;
> +	case TP_HKEY_EV_CAMERASHUTTER_TOGGLE:
> +		camera_shutter_state = get_camera_shutter();
> +		if (camera_shutter_state < 0) {
> +			pr_err("Error retrieving camera shutter state after shutter event\n");
> +			return true;
> +		}
> +		mutex_lock(&tpacpi_inputdev_send_mutex);
> +
> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +		input_sync(tpacpi_inputdev);
> +
> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
>  		return true;
>  	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>  		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
> 
