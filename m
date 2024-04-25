Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85581AA3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2024 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714036479; cv=none; b=rLwgF0Mz0Rfj/HAh9oZmDZTTWN0rKPpsWVHlynrLXdf8qViUhz33LTh4Vzopf10qxJjZ5+ahCyTtkCcP7mDcoQRdrPnjbt2IlSUOjcIQxbaLj9tkA3WCusWsX6GWfh82zMKyCeSHuTqbb5+exaL6Ox0/HQMBI+yB2hprS+VXPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714036479; c=relaxed/simple;
	bh=AIhRsEPYfXbtxH26TDUBCpgBCOwW9uVV4aGc4A5eO9M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nOx5K5piWcfEgka1y7JdYnwqV0iTPr1B3P4LcV+A653De/B6AAvnGCuwMFr4+lzJ9ONwj3uT6qefe4NKCojBh3mczRzAE6KoqDO3xRydC06sEN5nbYW+wcV/vYhyL4/KNszj1bUw97Xin6JKOLGnSQJzLtk2gdOHyQd+8jjQr1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kg83qbBo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kg83qbBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714036477; x=1745572477;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AIhRsEPYfXbtxH26TDUBCpgBCOwW9uVV4aGc4A5eO9M=;
  b=Kg83qbBoBIJG/dIIsNnn00oQL1sJAZebExHk6leLAtCD/BrrC3DUfPP/
   jCdfrz/KzJjgZEWIMVLDjWAi1lVa7v4RoPNwnNK3QFR1hl57XdZTxiKvU
   Aab1CQjpUT0G2NyobPBXUmuYyEptFbG5QAdpIEVbEa05AU5iucSbksIMX
   +hXTACJfqoSSHKt6yCCtwV0qFsPyBn4wGbTHFW+bcKzoIO5ZxpY86K4BV
   dBKxvkfP2FOxsgDGuG31b2H8P8mIVYAew4JHdUe2U0l0K4bcUgMO8zGbH
   eahMMRJSiOzIeTeh7YMcExZ2YNolBaB1OE7FyjNjvKGWMT28iEK6CzwNc
   w==;
X-CSE-ConnectionGUID: RmPrn928Qp+IuLI4ALXroA==
X-CSE-MsgGUID: JkdXrg4aT5+F8vizIogRyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12643099"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="12643099"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:14:36 -0700
X-CSE-ConnectionGUID: Qn79qDm3Qtex+ZyTtfgFhg==
X-CSE-MsgGUID: svQbTvtbSjaHDfedR6oFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25099628"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:14:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 25 Apr 2024 12:14:28 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change
 hotkey_reserved_mask initialization
In-Reply-To: <20240424122834.19801-17-hdegoede@redhat.com>
Message-ID: <d56986cf-e400-4f8f-d2aa-0fb1bba297cf@linux.intel.com>
References: <20240424122834.19801-1-hdegoede@redhat.com> <20240424122834.19801-17-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Apr 2024, Hans de Goede wrote:

> Change the hotkey_reserved_mask initialization to hardcode the list
> of reserved keys. There are only a few reserved keys and the code to
> iterate over the keymap will be removed when moving to sparse-keymaps.

Hi,

Consider extending this explanation. It's hard to see how the old and new 
code are identical because there are more KEY_RESERVED entries in the 
array than in the new code. I can see the list of keys in the new code 
matches to those set using tpacpi_hotkey_driver_mask_set() but it's hard 
to connect the dots here.

> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 952bac635a18..cf5c741d1343 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  		   "using keymap number %lu\n", keymap_id);
>  
> +	/* Keys which should be reserved on both IBM and Lenovo models */
> +	hotkey_reserved_mask = TP_ACPI_HKEY_KBD_LIGHT_MASK |
> +			       TP_ACPI_HKEY_VOLUP_MASK |
> +			       TP_ACPI_HKEY_VOLDWN_MASK |
> +			       TP_ACPI_HKEY_MUTE_MASK;
> +	/*
> +	 * Reserve brightness up/down unconditionally on IBM models, on Lenovo
> +	 * models these are disabled based on acpi_video_get_backlight_type().
> +	 */
> +	if (keymap_id == TPACPI_KEYMAP_IBM_GENERIC)
> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
> +
>  	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
>  			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
>  	if (!hotkey_keycode_map) {
> @@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  		if (hotkey_keycode_map[i] != KEY_RESERVED) {
>  			input_set_capability(tpacpi_inputdev, EV_KEY,
>  						hotkey_keycode_map[i]);
> -		} else {
> -			if (i < sizeof(hotkey_reserved_mask)*8)
> -				hotkey_reserved_mask |= 1 << i;
>  		}
>  	}
>  
> @@ -3587,9 +3597,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  		/* Disable brightness up/down on Lenovo thinkpads when
>  		 * ACPI is handling them, otherwise it is plain impossible
>  		 * for userspace to do something even remotely sane */
> -		hotkey_reserved_mask |=
> -			(1 << TP_ACPI_HOTKEYSCAN_FNHOME)
> -			| (1 << TP_ACPI_HOTKEYSCAN_FNEND);
> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
> +					TP_ACPI_HKEY_BRGHTDWN_MASK;

This is a simple define replace that would belong to own patch?


-- 
 i.

