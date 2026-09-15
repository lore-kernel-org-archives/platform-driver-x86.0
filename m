Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20443B2FD4;
	Tue, 15 Sep 2026 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477715; cv=none; b=qYFBsJce71nPq2AOwoiacJ91cBMJJhN0FxqCgx4uz3vQrJ71oJsEtLblBsMcdz92vLT32LCu1a44TTSdx2tjvS99XV35IIcxJsEzKABZU6AlcnT0gtqAdixJrh40w1oPaJT2EmP3kLtZk9zbJ0X1pl1afbnA5IlaZF3DYmOSp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477715; c=relaxed/simple;
	bh=udOijt4W50cvdO67B9RsymYIiIYjteZ+EcvCsayEw7U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=af0/V0E4UosRErL7nGFIgyIcBXtox1Equf/TAeymRMqAYHvj6nUaeFtYuP33nUq4LaTTKt8ifo2bj34AJ7JlLXw8/JCoAfehwM9FWam3b88u0GDWwP07XTodt89OPSY0WtK8T30BNtCBayAc22Ks3hYt1MG9ufx007N/r08ubI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJqfi2Pv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJqfi2Pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789477714; x=1821013714;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=udOijt4W50cvdO67B9RsymYIiIYjteZ+EcvCsayEw7U=;
  b=hJqfi2Pv9JoveHApHunTAIvPbpoxHF88/F9VYQqEKjsRzE1Fir7U2Rpc
   mqZGxKjuAA1Ey/X9qfC+rnxns18gb+cjhxhxpnbRQ0sknHtLYbB8KLpmp
   dspoKK5zrYXINB0PoR61uSZRU/cnMuv5Iq9G6UgzON6RtuJrobVBVoJ9a
   FMqS0CvblUUYGhTHb9GMVd8jaKCe+You9urU06Qxp2uFrHyuBAxLFPJ26
   Kp0J1pL0LkQ5dSPQ1lnT80zJXCBzz7jAbYM/iiKTFVZ/Wal4gRInHZ7r1
   8DCnhicVbyyBWBykIKpAkZrAV/PJYHePAOndrVZJ43ekR4i4b7J1UfbKq
   w==;
X-CSE-ConnectionGUID: o20FbW5/SG+RSch5QQg08A==
X-CSE-MsgGUID: iLuaAm42TDKlLxazNspG+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100163698"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100163698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:08:34 -0700
X-CSE-ConnectionGUID: xQWfTz3rSTKdMVgDrijTyQ==
X-CSE-MsgGUID: PAaxcB0FRUeR2+uWlu35PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269732343"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:08:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 16:08:26 +0300 (EEST)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 5/6] platform/x86/tuxedo: Update and extend
 documentation
In-Reply-To: <20260826081149.235487-6-aer@tuxedocomputers.com>
Message-ID: <7533530b-1d13-e977-df13-f7ebf4e92a29@linux.intel.com>
References: <20260826081149.235487-1-aer@tuxedocomputers.com> <20260826081149.235487-6-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Aug 2026, Aaron Erhardt wrote:

> Remove an incorrect comment about the Microsoft MacroPad reference
> implementation allegedly deviating from the spec and add more
> information about the module and some other minor improvements.

Was it "incorrect" or was the spec clarified in a later version? If the 
latter, that would be worth to mention instead of claiming the original 
comment was "incorrect".

This is a honest question, I don't know the answer but I'm kind trying to 
read in between lines here how we ended up in this situation so my 
impression could be entirely wrong. ...Thus, please don't assume I know 
much about the content of these specs (despite me briefly looking into 
what I could find around this feature was introduced).

-- 
 i.

> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> ---
>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 51 ++++++++++++-----------
>  1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 2b985b030197..3e5ba524fe58 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -1,9 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * This driver implements the WMI AB device found on TUXEDO notebooks with board
> - * vendor NB04.
> + * vendor NB04. This enables keyboard backlight control via a virtual HID
> + * LampArray device.
> + *
> + * The device will be available through the regular HID interfaces, such as
> + * hidraw and can be used by any userspace program that implements the HID
> + * LampArray standard.
>   *
>   * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
> + * Copyright (C) 2026 Aaron Erhardt <aer@tuxedocomputers.com>
>   */
>  
>  #include <linux/dmi.h>
> @@ -488,12 +494,14 @@ static int handle_lamp_array_attributes_report(struct hid_device *hdev,
>  	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
>  
>  	rep->lamp_count = driver_data->lamp_count;
> +
> +	// Physical dimensions of the Sirius 16 keyboard
>  	rep->bounding_box_width_in_micrometers = 368000;
>  	rep->bounding_box_height_in_micrometers = 266000;
>  	rep->bounding_box_depth_in_micrometers = 30000;
>  	/*
>  	 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
> -	 * "HID Usage Tables v1.5"
> +	 * "HID Usage Tables v1.7"
>  	 */
>  	rep->lamp_array_kind = 1;
>  	// Some guessed value for interval microseconds
> @@ -547,7 +555,7 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
>  	rep->update_latency_in_microseconds = 100;
>  	/*
>  	 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
> -	 * "HID Usage Tables v1.5"
> +	 * "HID Usage Tables v1.7"
>  	 */
>  	rep->lamp_purpose = 1;
>  	rep->red_level_count = 0xff;
> @@ -560,8 +568,8 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
>  		rep->input_binding = driver_data->kbl_map[lamp_id].code;
>  	} else {
>  		/*
> -		 * Everything bigger is reserved/undefined, see
> -		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.5"
> +		 * Everything bigger than 0xe8 is reserved/undefined, see
> +		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.7"
>  		 * and should return 0, see "26.8.3 Lamp Attributes" of the same
>  		 * document.
>  		 */
> @@ -606,10 +614,7 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
>  	u8 key_id, key_id_j, intensity_i, red_i, green_i, blue_i;
>  	int ret;
>  
> -	/*
> -	 * Catching misformatted lamp_multi_update_report and fail silently
> -	 * according to "HID Usage Tables v1.5"
> -	 */
> +	// Catch bad reports and fail silently according to "HID Usage Tables v1.7"
>  	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
>  		if (rep->lamp_id[i] > driver_data->lamp_count) {
>  			hid_dbg(hdev, "Out of bounds lamp_id in lamp_multi_update_report. Skipping whole report!\n");
> @@ -624,6 +629,7 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
>  		}
>  	}
>  
> +	// Fill kbl_set_multiple_keys_in update buffer
>  	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
>  		key_id = driver_data->kbl_map[rep->lamp_id[i]].code;
>  
> @@ -632,6 +638,8 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
>  		     ++j) {
>  			rgb_configs_j = &next->kbl_set_multiple_keys_in.rgb_configs[j];
>  			key_id_j = rgb_configs_j->key_id;
> +
> +			// Search for existing or empty entry
>  			if (key_id_j != 0x00 && key_id_j != key_id)
>  				continue;
>  
> @@ -691,10 +699,7 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
>  	struct lamp_rgbi_tuple_t *update_channels_j;
>  	int ret;
>  
> -	/*
> -	 * Catching misformatted lamp_range_update_report and fail silently
> -	 * according to "HID Usage Tables v1.5"
> -	 */
> +	// Catch bad reports and fail silently according to "HID Usage Tables v1.7"
>  	if (rep->lamp_id_start > rep->lamp_id_end) {
>  		hid_dbg(hdev, "lamp_id_start > lamp_id_end in lamp_range_update_report. Skipping whole report!\n");
>  		return sizeof(*rep);
> @@ -706,8 +711,8 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
>  	}
>  
>  	/*
> -	 * Break handle_lamp_range_update_report call down to multiple
> -	 * handle_lamp_multi_update_report calls to easily ensure that mixing
> +	 * Break handle_lamp_range_update_report call down into multiple
> +	 * handle_lamp_multi_update_report calls to ensure that mixing
>  	 * handle_lamp_range_update_report and handle_lamp_multi_update_report
>  	 * does not break things.
>  	 */
> @@ -750,15 +755,12 @@ static int handle_lamp_array_control_report(struct hid_device *hdev __always_unu
>  					    struct lamp_array_control_report_t *rep)
>  {
>  	/*
> -	 * The keyboards firmware doesn't have any built in controls and the
> -	 * built in effects are not implemented so this is a NOOP.
> -	 * According to the HID Documentation (HID Usage Tables v1.5) this
> +	 * The keyboard's firmware doesn't have any built-in controls and the
> +	 * built-in effects are not implemented so this is a NOOP.
> +	 * According to the HID Documentation (HID Usage Tables v1.7) this
>  	 * function is optional and can be removed from the HID Report
>  	 * Descriptor, but it should first be confirmed that userspace respects
> -	 * this possibility too. The Microsoft MacroPad reference implementation
> -	 * (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
> -	 * already deviates from the spec at another point, see
> -	 * handle_lamp_*_update_report.
> +	 * this possibility too.
>  	 */
>  
>  	return sizeof(*rep);
> @@ -894,8 +896,8 @@ static struct wmi_driver tuxedo_nb04_wmi_tux_driver = {
>  };
>  
>  /*
> - * We don't know if the WMI API is stable and how unique the GUID is for this
> - * ODM. To be on the safe side we therefore only run this driver on tested
> + * We don't know whether the WMI API is stable and how unique the GUID is for
> + * this ODM. To be on the safe side we therefore only run this driver on tested
>   * devices defined by this list.
>   */
>  static const struct dmi_system_id tested_devices_dmi_table[] __initconst = {
> @@ -933,4 +935,5 @@ module_exit(tuxedo_nb04_wmi_tux_exit);
>  
>  MODULE_DESCRIPTION("Virtual HID LampArray interface for TUXEDO NB04 devices");
>  MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
> +MODULE_AUTHOR("Aaron Erhardt <aer@tuxedocomputers.com>");
>  MODULE_LICENSE("GPL");
> 
