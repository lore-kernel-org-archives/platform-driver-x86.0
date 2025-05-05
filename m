Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4F98494
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453397; cv=none; b=fgtgaOJogZzalM6pUtvFW5G7NbZKIt96C/kk8sMXjM8noOhkkCZ2+EXGzDJbp1qhXH1CILXnHCVUWmPM0LQS/0qExzxrrCHCA0VzE6AK406GVSFVELsOAiXr4JBItRIIdGSo7O6TI2YcJBQdBVeAxaHbiOt4XL2IaRVWtp7nzxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453397; c=relaxed/simple;
	bh=HYT/v+OLGZEa+cNgOi7zH546K/Zc/QLAyWr63Fhk9mg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VUaMkWsOX10WrOZAEegHGm11X0F+DjjyRQhZ5HRCAmYO4XajDau2rduOVMJFtH8xuqseuAa18kX53DB3lptHJ9d510LJCRa0BTGbq9ZCTebI0SV03TzgERUlORvMbqe4bUJx0zvTfbgn/EgBcaNokcFqgpEaMT2WcFXf6XkG9JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwXNmTGT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwXNmTGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453396; x=1777989396;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HYT/v+OLGZEa+cNgOi7zH546K/Zc/QLAyWr63Fhk9mg=;
  b=LwXNmTGTCQYh9zlI7crjXJHSQHz1OV/sEm3BtU8CWG3lqLfWRGtNkMGN
   /BPkeLKIpsJeSaXNxPAJUtt81YkJmjNZQUE0cMFTlmFttlEQP1WcMmidm
   jMpZbrLNM6U6G4MQM1Dfj8pbKuBYG7hwzKs8trJGzCT5VlVWwtNtSofcK
   Jeh2MuVW7YkuhNzbVCIufjXyllE3WUtd6Gp9coLeMtOGISOx3FZfEiyY6
   POYSqNEILSGmGACp+csw1zarBXjOcvbTebTX7Llxvn7UfKFvihc5KFVkF
   vPILL0i7vHmxmY7phTfpNgKbajfsZcQnfS9av2HtSGhEVDHQXEk8uDj04
   g==;
X-CSE-ConnectionGUID: 0WV8NXUJSZuUaEpN8NJDqA==
X-CSE-MsgGUID: hh71ljIeTqmAVECCYceA5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65595631"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65595631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:56:35 -0700
X-CSE-ConnectionGUID: 30qY9XAjSuq93YFHVUuXQg==
X-CSE-MsgGUID: EXF9HpSBS/Gs1uRJHpIZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="166174661"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:56:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 May 2025 16:56:29 +0300 (EEST)
To: Nitin Joshi <nitjoshi@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v5] platform/x86: thinkpad-acpi: Add support for new
 hotkey for  camera shutter switch
In-Reply-To: <20250501123607.14171-1-nitjoshi@gmail.com>
Message-ID: <b9b2edc1-f830-2811-b0f5-8bd0667e9175@linux.intel.com>
References: <20250501123607.14171-1-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 May 2025, Nitin Joshi wrote:

> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
> Changes in v5:
> * Incorporated review comments for consistency.
> Changes in v4:
> * Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
> Changes in v3:
> * Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
>   code more readable.
> Changes in v2:
> * Added ASL method to get camera shutter status and send it to userspace.

Hi,

Sparse is not happy with this change:

$ make C=2 drivers/platform/x86/thinkpad_acpi.o
...
  CC      drivers/platform/x86/thinkpad_acpi.o
  CHECK   drivers/platform/x86/thinkpad_acpi.c
drivers/platform/x86/thinkpad_acpi.c:11267:17: error: typename in expression
drivers/platform/x86/thinkpad_acpi.c:11267:21: error: Expected ; at end of statement
drivers/platform/x86/thinkpad_acpi.c:11267:21: error: got camera_shutter_state
drivers/platform/x86/thinkpad_acpi.c:11267:17: error: undefined identifier 'int'
drivers/platform/x86/thinkpad_acpi.c:11269:17: error: undefined identifier 'camera_shutter_state'
drivers/platform/x86/thinkpad_acpi.c:11270:21: error: undefined identifier 'camera_shutter_state'
drivers/platform/x86/thinkpad_acpi.c:11276:76: error: undefined identifier 'camera_shutter_state'

Please fix and send v6.

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5790095c175e..3c75161667cf 100644
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
> @@ -11236,6 +11262,21 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  		else
>  			dytc_control_amt(!dytc_amt_active);
>  
> +		return true;
> +	case TP_HKEY_EV_CAMERASHUTTER_TOGGLE:
> +		int camera_shutter_state;
> +
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

-- 
 i.

