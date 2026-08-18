Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690B3E0220;
	Tue, 18 Aug 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048794; cv=none; b=kDxoAQ9x2vfDU8WxPJvZlAPAVDu8Ghowu2XUld3LY/HiUFBScdYDxWo5vnLcl/bKbRt1A1+Y9vWskFXOU8n2oJOipGC6/o5AOcmg4Pb4oGvTAmCgnCpTiwrvMAZpYWVdndB80rFAFK6j2Uw7HFkYX92c31DUKSdWznQGrbxnFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048794; c=relaxed/simple;
	bh=etnah3mbBU/mN/dq+uD0thd4IDt99r5Tx70rGW6SQx4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U1blvIgRa9wvxE6IRnsKizC4SUtrw/7dkp2+D9FrCJOmQP6Mo4Rndjad0AY8AZ+eQbhgDxrC2AkYlURqX+675klE1uL/QdX3cbcWZ6OESAexxBQkkQT46iUnQkMNyRFWVRhHWMOEEFdOgv+8LU8nCKDdYP+HcXLLsRYxjSif/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU+rjRUd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU+rjRUd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787048792; x=1818584792;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=etnah3mbBU/mN/dq+uD0thd4IDt99r5Tx70rGW6SQx4=;
  b=kU+rjRUdMIBOe88sb19f5RRs5j/P+MpRcMTDRL6KDyyrUZzKRkT8UuEJ
   AOAFXHJJGLtKfEIXC1OihpJTw6h+203XKy4g+I4DAPfWY8O0P2WkeIeKR
   OcokzZn+v8V/MGgwVh4D0C8+uhTqgaIC7YzlYmkH/+9KzgzvmqOhFnPHE
   q2q0Oke3Ufa9D6ESIE/UqEA1Uu++giOuM8uOl0m5WcCiH9yroDBIG5o+/
   7DHHPWaDnp0BBxbdBfJvzFEkZMRsXHcXOrwXar7mWyXE9PPHwqflIWIah
   jhi2qV4Jk+th4kK61y3RYXvB4jdj8cIdyUxP+1vYUozwv17zcH2prWYPS
   Q==;
X-CSE-ConnectionGUID: erX94/9LTpKBbIxvnLoalA==
X-CSE-MsgGUID: ZXHJPVwYRVaE8y36PwaCfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87392691"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87392691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:26:32 -0700
X-CSE-ConnectionGUID: fluTChAlTQ2q8ixcPHMD8A==
X-CSE-MsgGUID: UEqA5LbOSvi0qwlIZC6+sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="258988319"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:26:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 13:26:26 +0300 (EEST)
To: Ruzal Daminov <daminovruzal7@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: huawei-wmi: add modern Honor MagicBook
 hotkeys
In-Reply-To: <20260814171324.16727-1-daminovruzal7@gmail.com>
Message-ID: <13b32041-0e33-367e-732a-1b8431c7628c@linux.intel.com>
References: <20260814171324.16727-1-daminovruzal7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Aug 2026, Ruzal Daminov wrote:

> Honor MagicBook laptops (e.g. FMI-76 / X14 / X16 Plus series) use the
> ACPI WMI interface (GUID 0xA0) with modern function key scancodes.
> 
> Add the missing keycodes to huawei_wmi_keymap[]:
>  - 0x0287: Mic mute key (Fn+F7) -> KEY_MICMUTE
>  - 0x0288: Camera toggle (Fn+F8) -> KEY_CAMERA
>  - 0x028a: Honor Connect / Share (Fn+F10) -> KEY_CONFIG
>  - 0x028b: YOYO AI Assistant (Fn+F11) -> KEY_VOICECOMMAND
>  - 0x028e: Screenshot key (Fn+F12) -> KEY_PRINT
> 
> Tested on Honor MagicBook X14 Plus (FMI-76, AMD Ryzen 8845HS).
> 
> Signed-off-by: Ruzal Daminov <daminovruzal7@gmail.com>
> ---
>  drivers/platform/x86/huawei-wmi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index 93cca17fd..d5f77fb68 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -72,6 +72,12 @@ struct huawei_wmi {
>  static struct huawei_wmi *huawei_wmi;
>  
>  static const struct key_entry huawei_wmi_keymap[] = {
> +	{ KE_KEY, 0x0287, { KEY_MICMUTE } },
> +	{ KE_KEY, 0x0288, { KEY_CAMERA } },              /* Fn+F8: Camera */
> +	{ KE_KEY, 0x028a, { KEY_CONFIG } },              /* Fn+F10: Honor Connect */
> +	{ KE_KEY, 0x028b, { KEY_VOICECOMMAND } },        /* Fn+F11: YOYO AI */
> +	{ KE_KEY, 0x028e, { KEY_PRINT } },               /* Fn+F12: Screenshot */
> +
>  	{ KE_KEY,    0x281, { KEY_BRIGHTNESSDOWN } },
>  	{ KE_KEY,    0x282, { KEY_BRIGHTNESSUP } },
>  	{ KE_KEY,    0x284, { KEY_MUTE } },

??? Multiple of those keys are already in the array ???

I suppose you'd have noticed it if you'd have not added the leading zeros 
and would have put those correctly in their place in the numerical order.

Please also keep the existing formatting.

-- 
 i.

