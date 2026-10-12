Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2B497B64;
	Mon, 12 Oct 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817620; cv=none; b=iEPeXaF4aQpcVOOuZRUDc5fmI0NUHEXMfixFVtSPvPKE5gGsM1yPN8yIopabbG81dczXdzdT1eSMu0hY+OHhg2IhBveUKNU1s401SVFTJx9cT+ZtrX1dGEpKrdV5EaFN0gdwfTiLmY/gzZQDfFaSn5zN4XkQS3FccSWyl4CQnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817620; c=relaxed/simple;
	bh=1lSW8vLBeVQroU6ImCcVCVnGOKSq1pzmekSby2J34gY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WbWmNqzSNBlOAOgFwLY7GgW4nkuMztL9L6+Kg4KQY49E2+5ZafFdzcGPA5XMZfSuC4OW8YC2q1i5D4Ar75sh5wUPvDCn173wcVn9QMDVGEOsql5XHctetDZZhwCMYgUa4ks5E/0EzBKzJAPtZoLnn12N6phJqst0G/cxVto4Kns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIbKLxyq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIbKLxyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791817618; x=1823353618;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1lSW8vLBeVQroU6ImCcVCVnGOKSq1pzmekSby2J34gY=;
  b=PIbKLxyqw04ONBQNDt/Ays0rquxK7qHdlkd7dlzQamOy5Iw8KijwhTWp
   yqI9txfS4khMJb/ePGFU6rBNYbiq1qtXRJ6hruF/7rsoX670okIrivljp
   ACvhSxh1mfQ86dNwKu4rcXMw9swdfuLdRKh+I2YCiiJk24Y+dZWJvFxsm
   bxfPcY5J0b4HbxqkjYGkl0FaeIfsUMXVuLun4jJlhFfM26upvQzzV8HGy
   uVPAAGqwKA+WwZQd+vA2SbgelasWFQz1QUDlJbFo+Gqmyn4iK1G6AUgjs
   KxyeLeMveI1fVL2a/mwGpJs0uK/t7pCu1q6w/Bg49Nq/PVFZjDd9nd6X4
   Q==;
X-CSE-ConnectionGUID: JwtfQx3uSrSL4Yt18TDYFQ==
X-CSE-MsgGUID: PlDg97kETESSQcrmGqgg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="516252"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="516252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:06:58 -0700
X-CSE-ConnectionGUID: 7FQscmOiSoqGe5WSWjIqZw==
X-CSE-MsgGUID: Wg64IoQURg2wTsZomWk+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1034221"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:06:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 18:06:52 +0300 (EEST)
To: Patryk Pilichowski <pat.pilichowski@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: msi-wmi: Ignore WMI events for keys also
 handled by atkbd
In-Reply-To: <20260926165034.94254-1-pat.pilichowski@gmail.com>
Message-ID: <25d919c1-87bf-3e2d-1757-96bc9391e702@linux.intel.com>
References: <20260926165034.94254-1-pat.pilichowski@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Sep 2026, Patryk Pilichowski wrote:

> On MSI notebooks, several keys generate a WMI event through the Wind
> event GUID in addition to a regular AT keyboard event. Their event
> codes are not in the keymap, so every press logs "Unknown key
> pressed".
> 
> These keys already work through the AT keyboard, so mark their WMI
> codes as KE_IGNORE, as is already done for the MSI Claw. On models
> where a code does not also produce a keyboard event, the event is
> already dropped, so the only change there is that the log
> message goes away.
> 
> The Wind event GUID is not specific to the MSI Wind. It is present in
> 17 of 18 MSI notebooks in the linuxhw ACPI dump collection (2012 to
> 2024), with the same _WED structure. The codes are shared across
> models too: the volume keys on the tested notebook send the same codes
> as the MSI Claw (0x21, 0x32).
> 
> Tested on an MSI Katana 15 B13VFK: Fn (0x0b), mic mute (0x19),
> settings (0x1d), mute (0x23) and Bluetooth (0x78) no longer log
> unknown key messages, and the keys keep working through atkbd.
> 
> Link: https://github.com/linuxhw/ACPI/tree/d6d30c6ef6f4/Notebook/MSI
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
> ---
>  drivers/platform/x86/msi-wmi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
> index c9db750fe5..6c798f6177 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -46,6 +46,12 @@ enum msi_scancodes {
>  	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
>  	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
>  	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
> +	/* MSI Notebook keys that use Wind GUID */
> +	WIND_KEY_FN_NB		= 0x0b,
> +	WIND_KEY_MICMUTE_NB	= 0x19,
> +	WIND_KEY_SETTINGS_NB	= 0x1d,
> +	WIND_KEY_MUTE_NB	= 0x23,
> +	WIND_KEY_BLUETOOTH_NB	= 0x78,
>  	/* MSI Claw keys */
>  	CLAW_KEY_VOLUMEDOWN	= 0x21,
>  	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */

Hi,

This is getting increasingly hard to read as the values are not ordered. 
And apparently grouping them by model was bogus anyway (as mentioned in 
your changelog text).

So my suggestion is you make a two patch series, first ordering these
existing ones numerically and adding the values for those not having one 
yet (please also convert 0xD0 -> 0xd0 for consistency). Then in the second 
patch add these new entries.

--
 i.

> @@ -66,6 +72,13 @@ static struct key_entry msi_wmi_keymap[] = {
>  	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
>  	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
>  
> +	/* These MSI Notebook keys work without WMI. Ignore them to avoid double keycodes */
> +	{ KE_IGNORE, WIND_KEY_FN_NB },
> +	{ KE_IGNORE, WIND_KEY_MICMUTE_NB },
> +	{ KE_IGNORE, WIND_KEY_SETTINGS_NB },
> +	{ KE_IGNORE, WIND_KEY_MUTE_NB },
> +	{ KE_IGNORE, WIND_KEY_BLUETOOTH_NB },
> +
>  	/* These are unknown WMI events found on MSI Wind */
>  	{ KE_IGNORE, 0x00 },
>  	{ KE_IGNORE, 0x62 },
> 
