Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F33DA7FB;
	Fri, 18 Sep 2026 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744519; cv=none; b=As/FA2H/aBUQvT/inlTNK2CWxNjaU3u5VQeU1oLISvZW4A+H7TsYtH/XEggQRiWkSwPBUZjpp80BDWZqdNciF1llxs7sQoWrZQbFsF6b0Y79P5SVqT9OblFPsFp5/lGqdkn+oxPUDL/CE4beWthSyJTV5gDeux89JQEeKWi+MVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744519; c=relaxed/simple;
	bh=b5gHSM908nVjfi1zu0tdgVoLUytVXfsLVTTcMldGEzI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=owEHz7UyuOR1ezu0b3AmPiBXbaDJixYI02WYrFPOda37qUMd7RHfgIK5AEJubfySPBiBIFfVC4APJgcMi8YLwOb6HvdalFT7vMNNmHiunFC/hCeNC8muxRqdUX6M7RPlShtIDAaENrVgd2MLDHblYR05o+TipKJ0VKXFe7YCLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xffh0BQj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xffh0BQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789744516; x=1821280516;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=b5gHSM908nVjfi1zu0tdgVoLUytVXfsLVTTcMldGEzI=;
  b=Xffh0BQjvM0BswL7KqlknTLYV7Bh4wt/S1dPlBBeOlkziP+ngl3tlSvJ
   aki1VBGWVL2CV7RT6hu1HgK3Vkw8s3br7NHmOcA7AkawbbOOq29/Awgrw
   KA1QzSvF/7DXmEZEQRYHqUker47hS3ycct3jgwKuyDw1EDVfAL/l50LbR
   dbxqWW4O3fP3bSwEQLcx/82It4GhMidbdZC+Loj0HFAIYXf35ouk3Mncf
   xNKXPhTiEIjgfL9nuXG9pLfay0XqTWA9jQTEmGh4ZY7FnRx146K9TlmqH
   iUDSs5FGvibLTs4dnDtNHitEljMVhaeKEU2oz6CuOS7xN1T7F6WFZ/OAC
   Q==;
X-CSE-ConnectionGUID: DEIgUiHmTwaitibeIkb+qA==
X-CSE-MsgGUID: I1ELF6fOSIeeGNLadXkiOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="92766598"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="92766598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:15:15 -0700
X-CSE-ConnectionGUID: JO+6b6+iRV2GqUsZTDzIHg==
X-CSE-MsgGUID: m48+oIPaS3Cct5c6DYaC+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270749700"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:15:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 18:15:08 +0300 (EEST)
To: Huang Wei <huangwei@kylinos.cn>
cc: Hans de Goede <hansg@kernel.org>, hmh@hmh.eng.br, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, derekjohn.clark@gmail.com, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, thisisamirv <thisisamirv@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard
 thermal/fan quirk tables
In-Reply-To: <20260826073014.2611191-1-huangwei@kylinos.cn>
Message-ID: <c8339940-7bcb-c62c-20a3-63f6db19f3d4@linux.intel.com>
References: <20260826073014.2611191-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Aug 2026, Huang Wei wrote:

> The Lenovo ThinkPad X9-14 Gen 1 uses a non-standard Embedded Controller
> firmware (ECFW) whose thermal and fan registers are not located at the
> classic addresses. On this model the thermal registers sit at 0xA8-0xAF /
> 0xB8-0xBF and the fan registers use the non-standard offsets, instead of
> the legacy 0x78-0x7F / 0xC0-0xC7 (thermal) and 0x2f / 0x84 (fan).
> 
> Because the model is not covered by the existing quirk tables, the driver
> probes the legacy thermal addresses during init, reads back 0x00 from
> every register, concludes the EC is "misbehaving" and disables all
> thermal sensor access:
> 
>   thinkpad_acpi: ThinkPad ACPI EC access misbehaving, disabling thermal
>   sensors access
> 
> Fan access is affected the same way, leaving fan1/fan2 reporting 0 RPM.
> 
> The infrastructure for these non-standard ECFW models is already in place
> (commit 301c1904d638 ("platform/x86: thinkpad_acpi: Fix to correct wrong
> temp reporting on some ThinkPads")); the X9-14 Gen 1 simply was not added
> to the model lists yet. Add its BIOS model code N4D to both the thermal
> and fan quirk tables so that:
>   - thermal_read_mode_check() selects TPACPI_THERMAL_TPEC_12 and reads
>     the 0xA8/0xB8 registers, and
>   - fan_init() selects the non-standard fan register addresses.
> 
> Reported-by: thisisamirv <thisisamirv@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221228
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 6dd7c28fc0db..498139ac8f4b 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -6021,6 +6021,7 @@ static const struct tpacpi_quirk thermal_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', 'T', true),	/* 11e Gen5 GL*/
>  	TPACPI_Q_LNV3('R', '1', 'D', true),	/* 11e Gen5 GL-R*/
>  	TPACPI_Q_LNV3('R', '0', 'V', true),	/* 11e Gen5 KL-Y*/
> +	TPACPI_Q_LNV3('N', '4', 'D', true),	/* X9-14 Gen 1 */
>  };
>  
>  static enum thermal_access_mode thermal_read_mode;
> @@ -8845,6 +8846,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', 'T', TPACPI_FAN_NS),	/* 11e Gen5 GL */
>  	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
>  	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
> +	TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_NS),	/* X9-14 Gen 1 */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
>  	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
>  	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */

Hi,

This no longer applies cleanly so please respin.


-- 
 i.

