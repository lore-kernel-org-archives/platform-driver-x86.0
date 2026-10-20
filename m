Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497742;
	b=uvtDKIxBiOl2V3wesSh+ejvuVpkYmyNmZUYChwv+yfUei5K1s0ZB0mxLqmpd7aGHdchN
	 6JqhEYipFl9OgtAdVjFrYjZYUNB8HQpCxjurmU56f5/9jMahaUsEu8kqzsUmfHQDMlYGI
	 vaFKlC/gJSqxj3D9vkv8P7Ha5lsgX36Go32GuI1exWVVCVFMs4stE2ptqNtm35K1ld2fU
	 DDaDAnzJkI3OsPfvTuWokDgmclYfPtO575tlVF/UCxeTZiB8NYYrCFX+KJ+LLprdDYcPV
	 IhYMvam8+Mw1TmruPQjjzIwvzdZICQbX7WKsAHGz8YwXrVAGQdtAZzxltyzP5eODxPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497742;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=i+uot2IdU0v8YawbNB6okMBPCTKyJldAl4CTjSEyuiw=;
	b=zdSwoLd8FRAJ6EnqxaPTrohHBDwtk14YLt0azcm3TNxPxJA6J+ZyQqOGnEixQl0nQkJK
	 pN4ZdnJSRyKroIurfz4hsKVn4xG0ouTxzDR+JtrEdssV+Y/3OoBNAEmKLd7FE6BW/cUcF
	 bFvdXuyXh9aFalIUqN2rTk5wXdAO3tHvHwyKgekBwwrOynaDWmYqyAP+yZUoQbqe2fZ1r
	 PDtGDOsd858gpgQHFtbmz9cQOi2Vz9dnVZFDHOGgNuaGtrlI9/BRx7SH0BmioYd4EbTgN
	 lVyEk2307JkBU4kWxA5Y8lWS0TuM/SE+jQn6JiqsILDDKvhr0e3AiflDZtGW0opJvKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MYwABltg;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205BC606A319;
	Tue, 20 Oct 2026 12:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 205BC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MYwABltg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792497743; x=1824033743;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oGCa/lByeTyGUsaxjUXsj/z8n4Lw6d6L0yN61Kk7C9I=;
  b=MYwABltgBIZdVrdIadKik/UkztatLc2eoQvlWddDZaenSdqitmvJW8er
   XV6NRUESW6d8jVMO5DPIwkMFDlqcT+07UQLLQbv3MKW+JjA03LtFZ+z0D
   iWuomo+pkdzC5Mrpcf0fMo/7eCvAkFboP+uRnXKylqo0OgaXQA/7c5jHk
   Ss21EkbUDH8zqN1uorbMFHE+xsRSUap98nJkib+4qgLgBsNtsYTEzZ9eJ
   pY7beAGBkrtAy7kGpAL8ExUfrGn6zcXvGWhsxBwEKM4ndXTjigrHJ7L3x
   z8YypWGCdBJI2OMrovhXeL9VshTVxSSa1m/IHep4/OTkEqfywiXKVc0T/
   w==;
X-CSE-ConnectionGUID: g2gD3FFMSaGIt26xBKZigQ==
X-CSE-MsgGUID: 07dyA/WkRd+qoePrfXe9zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1211521"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1211521"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 05:02:22 -0700
X-CSE-ConnectionGUID: SjkUlVU3QI68JbuS6Uai3g==
X-CSE-MsgGUID: PvXxZGB1Q22bGOehnCp/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4582327"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 05:02:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 15:02:12 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>
cc: Hans de Goede <hansg@kernel.org>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>
Subject: Re: [PATCH v12 0/6] Merge redmi-wmi into bitland-mifs-wmi
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
Message-ID: <fe242f7f-34f5-1f96-0fc1-d6806e777391@linux.intel.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Mingyou Chen wrote:

> This patch series consolidates the standalone 'redmi-wmi' driver into the
> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
> the maintenance of overlapping ACPI WMI event streams.
> 
> Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
> platforms share the exact same keyboard event stream WMI GUID
> (46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
> the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
> it into discrete type/id/value fields.
> 
> Redmi operations were not contained in this patch series, future reverse
> engineering is required.
> 
> This series introduce a newly reported mic-mute hotkey definition
> for Redmibooks
> and dropped the previous redmi-wmi driver.
> 
> I don't have a Redmi or other Bitland device. So I cannot work on the
> real device.
> 
> Features are working properly on my device (Lecoo Bellator N176).
> 
> I leave the future reverse engineering work to the community.
> 
> And by the way, the no_set member in bitland_profile_entry means a
> platform profile is only report by the firmware but not available for
> set.
> 
> I don't have any LLM API credits (and I don't want to order it for now),
> so I cannot run sashiko reviews. Could you share the other review comments
> to me?

Hi,

You can find the public sashiko instance comments from here:
  https://sashiko.dev

There still seems to be some valid concerns remaining.

As it's AI tool, the reviews do not always find same issues on every 
run so it's sometimes worth to take a look at the previous version 
comments if there are additional findings there.

--
 i.

> v12:
> Fix the issues mentioned in https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/ .
> Copy payload_data to output->data at bitland_mifs_wmi_call, not
> overwrite the entire struct.
> Correct the key name (Mic Mute) in the commit message of
> "platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries"
> and my device doesn't have a FN-ESC key, so I renamed the enum variant to
> WMI_EVENT_MIC_MUTE.
> 
> v11:
> Add missing return_code_at_end and accept_zero_function logic
> Fallback to balanced platform profile if resume to performance failed
> 
> v10:
> Replace the previous "profile table" with dmi quirk table
> 
> v9:
> Add the missing feature introduced in the commit
> e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").
> 
> v8:
> Correct Ilya Gladyshev's email address in the MAINTAINERS entry
> 
> v7:
> Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
> in bitland_mifs_wmi_keymap
> 0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),
> 
> Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
> Rename the reserved names
> Use Xmas tree order in bitland_mifs_wmi_notify
> Collect the Tested-by and Reviewed-by tags
> 
> v6:
> Drop the wrong Redmi ops
> 
> v5:
> Correct Xiaomi DMI vendor name
> 
> v4:
> Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
> doesn't support full-speed mode.
> 
> 
> 
> Mingyou Chen (6):
>   MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
>   platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
>     the bitland driver
>   platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
>   platform/x86: redmi-wmi: Drop redmi-wmi driver
>   platform/x86: bitland-mifs-wmi: Add quirks table
>   platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
>     if last performance profile is not available
> 
>  MAINTAINERS                             |   7 +-
>  drivers/platform/x86/Kconfig            |  12 -
>  drivers/platform/x86/Makefile           |   1 -
>  drivers/platform/x86/bitland-mifs-wmi.c | 345 ++++++++++++++++--------
>  drivers/platform/x86/redmi-wmi.c        | 154 -----------
>  5 files changed, 243 insertions(+), 276 deletions(-)
>  delete mode 100644 drivers/platform/x86/redmi-wmi.c
> 
> 
> base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
> 

-- 
 i.

