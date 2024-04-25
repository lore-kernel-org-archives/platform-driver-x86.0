Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19DC1E4A6
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2024 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714035101; cv=none; b=ban2YLTYz3oJggSlMAyzsKLQ7pBuVjd2bVIFqnYMxSnXy+V9/HEiFLRhd356zoTgluBsTWmRX3XojeeJRT3WqEQwDaqF7ft3ppOunASk4fif8sxRWMgxI892cXahI2JDLd4Ezs/iTJvlGC5X1MyEVSqYcQqcg56fWVX2ZcQbruE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714035101; c=relaxed/simple;
	bh=vP9Zh/S/E65ExERBbAY4ACwwsQUnaibmPhNbymBtvPY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZVAQZmtWN/v5GYw+xHPlpySvx/uzvtPfSkjCF3tsOQRuVh58hc7IBarrrQ6xP3scQUfgJ4bg7JoDeN1U+9MvWSnc5VtDPxlpzSar0tgaZ6q+g27JlxWJJiaKoux58Fr3ynyjUx5HWRbWq4Jd8rjwY62QNMNTvSP1jbz9IojAiF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jD7C0Am6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jD7C0Am6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714035099; x=1745571099;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vP9Zh/S/E65ExERBbAY4ACwwsQUnaibmPhNbymBtvPY=;
  b=jD7C0Am6vv2+ShwT7s19ACWFKLVuehkJShglIo+Ob/5eZPPkafiQYLzJ
   FBa/u34SY2NGSVp60e/tYayFEOVrAeEmS6wvm7GCp4mRgeNSg1/VQNiCz
   kcsIYfFvE763owUHiyZ5qSNc1l5wUu6rIOm1GON3GPQ394QoRqRosToEF
   aQxLzAb51YJlSxvSPcIYUVaRmbV9QfQW8w2w+iShUVaidRZVrtbaN2hEb
   Ga/d1yogO6Ahe1I6cWQXI4HMmsTBctmHugdZxJEofBnS2E5W3i773Zqhd
   SE9gFv9cu40DpBptHeuXskiMU6JvSMxBPJGp7FT0d29onij+MXyz8C8ed
   A==;
X-CSE-ConnectionGUID: dFUt83MdSj+svsycAUPiMw==
X-CSE-MsgGUID: 7EE3srCGS3uVOZbJ3keGVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20395921"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="20395921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:51:38 -0700
X-CSE-ConnectionGUID: LPadY9SrQn+FZ4XTAF6/Cg==
X-CSE-MsgGUID: 8ykOEWxcT0mEWxLysRJKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="62478982"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:51:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 25 Apr 2024 11:51:29 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 15/24] platform/x86: thinkpad_acpi: Do not send ACPI
 netlink events for unknown hotkeys
In-Reply-To: <20240424122834.19801-16-hdegoede@redhat.com>
Message-ID: <d90d0a49-04ca-b63d-e250-5f86f97b7980@linux.intel.com>
References: <20240424122834.19801-1-hdegoede@redhat.com> <20240424122834.19801-16-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Apr 2024, Hans de Goede wrote:

> Do not send ACPI netlink events for unknown hotkeys, to avoid userspace
> starting to rely on them. Instead these should be added to the keymap to
> send evdev events.
> 
> This should not cause a behavior change for existing laptop models since
> all currently known 0x1xxx events have a mapping.
> 
> In hindsight the ACPI netlink events should have been suppressed for
> the adaptive keyboard and extended hotkeys events too. But the kernel has
> been sending ACPI netlink events for those for a long time now, so we
> cannot just stop sending them without potentially causing issues for
> existing users who may depend on these.
> 
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 9b38770412ab..952bac635a18 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2250,7 +2250,7 @@ static void tpacpi_input_send_tabletsw(void)
>  	}
>  }
>  
> -static bool tpacpi_input_send_key(const u32 hkey)
> +static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  {
>  	unsigned int keycode, scancode;
>  
> @@ -2271,6 +2271,14 @@ static bool tpacpi_input_send_key(const u32 hkey)
>  		scancode = hkey - TP_HKEY_EV_EXTENDED_KEY_START +
>  			   TP_ACPI_HOTKEYSCAN_EXTENDED_START;
>  	} else {
> +		/*
> +		 * Do not send ACPI netlink events for unknown hotkeys, to
> +		 * avoid userspace starting to rely on them. Instead these
> +		 * should be added to the keymap to send evdev events.
> +		 */
> +		if (send_acpi_ev)
> +			*send_acpi_ev = false;

Hi,

I'd consider dropping the check and passing a pointer to dummy variable 
instead of NULL, and comment at the caller defining the dummy variable why 
the value is getting ignored. But you know this code better than me so I 
leave it up to you what you want to do.

> +
>  		return false;
>  	}
>  
> @@ -2298,7 +2306,7 @@ static struct tp_acpi_drv_struct ibm_hotkey_acpidriver;
>  /* Do NOT call without validating scancode first */
>  static void tpacpi_hotkey_send_key(unsigned int scancode)
>  {
> -	tpacpi_input_send_key(TP_HKEY_EV_ORIG_KEY_START + scancode);
> +	tpacpi_input_send_key(TP_HKEY_EV_ORIG_KEY_START + scancode, NULL);
>  }


-- 
 i.

