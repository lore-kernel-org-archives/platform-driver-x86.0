Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48764F5FD
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774567; cv=none; b=J+fS9LZBl2h8MyPCXJTh3yPERyhCqKQeAsvM9H8k8pFWm4AnlfNNgc0L485NUymySQ66hpqzbWGrUKxat3dykPvCfF8YMei0Deyl9nWHWSHnWN9pm6qQ8dCTiccFMpzrSA0HqAI7ndoEcbVoZkhyghTX6WsZMXTtZEQbR2tijOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774567; c=relaxed/simple;
	bh=zSVBedYegDe/2QMEXLsfrTchWkMvOwDEFIqe4ABbrrU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qtT2SSXvQlI1QovdxRa7nQgLtX9sHOnEk6Dm6AIOgpt/NaevcTkrUqUOt0QTxErTuy3OW1CzCGEJsCSJ6UbHCMJD0R9JOtRYa1oUMPDlOEm4y2RPby0fxhBdV47uqkhcIVDAgo36M2ws8MKIRWqIe+KT99Utm53hRScsCtN2OCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBd+n1TU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBd+n1TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713774566; x=1745310566;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zSVBedYegDe/2QMEXLsfrTchWkMvOwDEFIqe4ABbrrU=;
  b=nBd+n1TUihwFsOqCrOS3mQI/0sh3t/lzHIxroPXuKL9ogIG+k6knAMoo
   UxJXUtrQSsMP7IY5Q3IvZmUluEdw7lyHq8U6+gkRAPhzq47EUR+sLFrCF
   7S7GgY4MEz8gK1kbe6qJkyM2JofNRVxDjsrpQxllY3Mc1aa5v3Ng8snJD
   fwikjmjXP5jYLm/04Z22CPMK3dH3IFWuw4wyhSQAdkB1WLNoFOcSK0/IE
   wo3+9fFzVgIVX5M3ILb/ZoAzwuXG0Vp4J8OTlzn5HiiccpHlbvRzJWb0r
   1u3yaCGo5nlc7hty3RcGnsgPlgUcoaWpy5JNNi0CoUv4JqqfrmYeMBDJD
   A==;
X-CSE-ConnectionGUID: fhjbB3XGSlu/GAS+YyQijQ==
X-CSE-MsgGUID: rd5PpGUESsORRZKQVUqC+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9469905"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9469905"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:29:24 -0700
X-CSE-ConnectionGUID: pvTiepcYSe+M4K+raXNtug==
X-CSE-MsgGUID: Nr3WqFIcTEyWnuK47X0j0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="28407865"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.39])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:29:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Apr 2024 11:29:16 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd
 event handling to tpacpi_driver_event()
In-Reply-To: <20240421154520.37089-9-hdegoede@redhat.com>
Message-ID: <a591120c-72c6-7b6c-92ba-c65c36a8d70f@linux.intel.com>
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-9-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 21 Apr 2024, Hans de Goede wrote:

> Factor out the adaptive kbd non hotkey event handling into
> adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
> helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
> TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().
> 
> This groups all the handling of hotkey events which do not emit
> a key press event together in tpacpi_driver_event().
> 
> This is a preparation patch for moving to sparse-keymaps.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++++++-------------
>  1 file changed, 45 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0bbc462d604c..e8d30f4af126 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int mode)
>  	return adaptive_keyboard_modes[i];
>  }
>  
> +static void adaptive_keyboard_change_row(void)
> +{
> +	int mode;
> +
> +	if (adaptive_keyboard_mode_is_saved) {
> +		mode = adaptive_keyboard_prev_mode;
> +		adaptive_keyboard_mode_is_saved = false;
> +	} else {
> +		mode = adaptive_keyboard_get_mode();
> +		if (mode < 0)
> +			return;
> +		mode = adaptive_keyboard_get_next_mode(mode);
> +	}
> +
> +	adaptive_keyboard_set_mode(mode);
> +}
> +
> +static void adaptive_keyboard_s_quickview_row(void)
> +{
> +	int mode = adaptive_keyboard_get_mode();
> +
> +	if (mode < 0)

Please try to keep call and it's error handling together, it costs one 
line but takes less effort to understand:

	int mode;

	mode = adaptive_keyboard_get_mode();
	if (mode < 0)

> +		return;
> +
> +	adaptive_keyboard_prev_mode = mode;
> +	adaptive_keyboard_mode_is_saved = true;
> +
> +	adaptive_keyboard_set_mode(FUNCTION_MODE);
> +}

-- 
 i.



> +
>  static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
>  {
> -	int current_mode = 0;
> -	int new_mode = 0;
> -
> -	switch (hkey) {
> -	case TP_HKEY_EV_DFR_CHANGE_ROW:
> -		if (adaptive_keyboard_mode_is_saved) {
> -			new_mode = adaptive_keyboard_prev_mode;
> -			adaptive_keyboard_mode_is_saved = false;
> -		} else {
> -			current_mode = adaptive_keyboard_get_mode();
> -			if (current_mode < 0)
> -				return false;
> -			new_mode = adaptive_keyboard_get_next_mode(
> -					current_mode);
> -		}
> -
> -		if (adaptive_keyboard_set_mode(new_mode) < 0)
> -			return false;
> -
> +	if (tpacpi_driver_event(hkey))
>  		return true;
>  
> -	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
> -		current_mode = adaptive_keyboard_get_mode();
> -		if (current_mode < 0)
> -			return false;
> -
> -		adaptive_keyboard_prev_mode = current_mode;
> -		adaptive_keyboard_mode_is_saved = true;
> -
> -		if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
> -			return false;
> -		return true;
> -
> -	default:
> -		if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
> -		    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
> -			pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
> -			return false;
> -		}
> -		tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
> -				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
> -		return true;
> +	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
> +	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
> +		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
> +		return false;
>  	}
> +
> +	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
> +			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
> +	return true;
>  }
>  
>  static bool hotkey_notify_extended_hotkey(const u32 hkey)
> @@ -11117,6 +11116,12 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  		}
>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
> +	case TP_HKEY_EV_DFR_CHANGE_ROW:
> +		adaptive_keyboard_change_row();
> +		return true;
> +	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
> +		adaptive_keyboard_s_quickview_row();
> +		return true;
>  	case TP_HKEY_EV_THM_CSM_COMPLETED:
>  		lapsensor_refresh();
>  		/* If we are already accessing DYTC then skip dytc update */
> 
