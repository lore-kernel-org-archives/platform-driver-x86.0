Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83542367281;
	Mon, 24 Aug 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584395; cv=none; b=EgMYgTjvR+r72TH4E/Cyzkag0rSzDcigPIdUaRfSqlqeUlMe5160CX/Bu4cL2jG0gv9ZiJwWMzyYJXjvI253sX9UpJ3jGIZdSDUmDsihFunRe7n5HdGspNLSY1qD6YSVkXbCLoGMZXPEBTsdZpTNClMu/w/SthlFcY1KTSka6A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584395; c=relaxed/simple;
	bh=ZbSyAmzlDTthC63fgw6axKRqZWtYhob+aM8/te0gO98=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MyDI6fboT7jwegYmKxYVeGLRQMEcgSchH8sxB/DzQGZGsl3M0E+etdkWnd/01gQYIJy+RH2gvrVNhf/FARKkmiCPrGXBYWkjcvbAzwbBedfL6JVpDJ8A2vSYmEixxwihIDexG9lSnqo45atFt5HD5D0uKZw2zN2UnDMNngxGKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dpkx+HWw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dpkx+HWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787584393; x=1819120393;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZbSyAmzlDTthC63fgw6axKRqZWtYhob+aM8/te0gO98=;
  b=Dpkx+HWwxZKw3heD54+K6rIQf1L3ZdPLF8EbjU9ozWZmcZ0OqUzuVOTK
   VGPe5Hwa7G6lVU760wrECsCtKYQduH+FlXrDdh3JHOTdi1HKWpAD3epEP
   L1+NvJPSmGMMp/d9PmWS9ik0PJc2BrdzYdBHbJwiHVxwJDIMuqX/mPnoN
   vqSSVKBZWb4lfxHtriSRJqWlK2WX+OOt+hK3fDgxzUXWPnZVf117Augsj
   oG93WK8V6llu07e/Z2unlKYf3blvCGyTp+FPmEb68MluTehNRxAkGzMsS
   SDDnDordrq4C+jDDDVkkZjplo3MbyYn5CSOe+PEv4S9jGn5BcxViPIVL9
   g==;
X-CSE-ConnectionGUID: r4TPu06dSoKdlaiptC9WlQ==
X-CSE-MsgGUID: /R+8sYPbRBG0fj6ZvX5aoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91850751"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91850751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:13:11 -0700
X-CSE-ConnectionGUID: LjG+ytrFTgqTBzLgJ28DYA==
X-CSE-MsgGUID: iJ7As//rSh+eu4Hln4oUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267598947"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:13:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 18:13:06 +0300 (EEST)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/6] platform/x86/tuxedo: Use intensity according to HID
 spec
In-Reply-To: <20260728115918.125349-4-aer@tuxedocomputers.com>
Message-ID: <65d76abf-2e31-7188-af0c-88bf70dbe83e@linux.intel.com>
References: <20260728115918.125349-1-aer@tuxedocomputers.com> <20260728115918.125349-4-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Jul 2026, Aaron Erhardt wrote:

> For RGB LEDs, the HID spec offers an example that uses only two
> intensity values for turning LEDs on and off. All other color values
> are submitted through the color channels individually, thus avoiding
> duplicated handling of brightness.

Hi,

If you want to pursue this, please provide better justification. You 
basically just rewrote the existing comment that told the current behavior 
is intentionally written as it is --- without really explain why you want 
to change it and what was problem with the current behavior.

> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> ---
>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 25 ++++++++++++-----------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 11babc7c7767..8f1ffca0430d 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -553,7 +553,7 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
>  	rep->red_level_count = 0xff;
>  	rep->green_level_count = 0xff;
>  	rep->blue_level_count = 0xff;
> -	rep->intensity_level_count = 0xff;
> +	rep->intensity_level_count = 0x1;
>  	rep->is_programmable = 1;
>  
>  	if (driver_data->kbl_map[lamp_id].code <= 0xe8) {
> @@ -640,22 +640,23 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
>  					j + 1;
>  			rgb_configs_j->key_id = key_id;
>  			/*
> -			 * While this driver respects update_channel.intensity
> -			 * according to "HID Usage Tables v1.5" also on RGB
> -			 * leds, the Microsoft MacroPad reference implementation
> +			 * This driver uses update_channel.intensity according to
> +			 * "Color Attributes Examples" in "HID Usage Tables v1.7".
> +			 * Only two intensity values are allowed for turning LEDs
> +			 * on or off, while color and brightness can be controlled
> +			 * through the RGB values. This is also identical to the
> +			 * Microsoft MacroPad reference implementation
>  			 * (https://github.com/microsoft/RP2040MacropadHidSample
> -			 * 1d6c3ad) does not and ignores it. If it turns out
> -			 * that Windows writes intensity = 0 for RGB leds
> -			 * instead of intensity = 255, this driver should also
> -			 * ignore the update_channel.intensity.
> +			 * 1d6c3ad).
>  			 */
> -			intensity_i = rep->update_channels[i].intensity;
> +			intensity_i = min(1, rep->update_channels[i].intensity);
>  			red_i = rep->update_channels[i].red;
>  			green_i = rep->update_channels[i].green;
>  			blue_i = rep->update_channels[i].blue;
> -			rgb_configs_j->red = red_i * intensity_i / 0xff;
> -			rgb_configs_j->green = green_i * intensity_i / 0xff;
> -			rgb_configs_j->blue = blue_i * intensity_i / 0xff;
> +
> +			rgb_configs_j->red = red_i * intensity_i;
> +			rgb_configs_j->green = green_i * intensity_i;
> +			rgb_configs_j->blue = blue_i * intensity_i;
>  
>  			break;
>  		}
> 

-- 
 i.

