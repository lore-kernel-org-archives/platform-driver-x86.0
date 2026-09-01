Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5625524C;
	Tue,  1 Sep 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261362; cv=none; b=q0EuXuIahZimQ85a6jvN3zWGMxz3MULXNjvkK8/7O46eosktS/c1fppdkz8jwPQmBqnJd0bPymvl26WbaWl1jjHkRDHq7rOrVpIRR/cgJRiek6UNXCzKQYrxRNsNkkxIsgAjmWhqDzAnQozIykqNthTohNMjvh2zbnq/SsAkZ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261362; c=relaxed/simple;
	bh=1UXO+Rzd9EMIQYfr2pRFaXs884ruaGkMEOU2Q6GOWV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxVrAXlgH2uO0YMTkM/fCdvBPJ6SxPv8+VV8vMNCPwNrdC/gsDKSh4UH5N2Rv0npSjsbIhzPK2txCa59h9Xe8RWzEnCDiKcrODmwFY0zApfbUh2gULbP4b5mEWQBknJc78yiKn88e2F7bG/vH4GnI9L7oVOj3/r04l7zVhTJig8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGALZGNL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGALZGNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261360; x=1819797360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1UXO+Rzd9EMIQYfr2pRFaXs884ruaGkMEOU2Q6GOWV8=;
  b=NGALZGNLtx7qjRg7fGWhitKgE5sSDzku7uPWb929Meacf9NuLS7Um4du
   WIbsz+CE+1DY+W76ivpRAkuN99plmxy+BW9vBWSwUZjv7isPIF2CAV9vp
   1gT20LaegMlkkCVwZuI381fJPOZC3ukGDiJwqrRhZRx6ldddTrX/r06lq
   Kb5NBlMsVWLPprftz8gZmHGwBVJE9ABGIDzbQkxHZsg3VMXyzjG+MeWgS
   jBL4r/pJoFpM3BJCq9udXaIyOuCIsiuL3wIGAR2WFcsRjrlecv+9P4E09
   KSip0hnOGtovUGupSXAgWszVP4HzlWTDb9jbnjZePwF8m3K1P8oMlu+8R
   Q==;
X-CSE-ConnectionGUID: qaY/SQimRxiQMHp2lU/TMA==
X-CSE-MsgGUID: vRqBlu7/TYuwiV1mFCsF7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87825008"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87825008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:16:00 -0700
X-CSE-ConnectionGUID: rGJOp9NIQN2G8DC9dVAcEQ==
X-CSE-MsgGUID: zqf0l4dVRF+f/nUWJ8GQrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="274336556"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:15:57 -0700
Date: Tue, 1 Sep 2026 14:15:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 6/8] platform/x86: int3472: tps68470: add board data
 for Dell Latitude 5285
Message-ID: <apaz6kjt6CcxWARa@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-7-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-7-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:52PM +0200, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
> PMIC/clock/GPIO hub:
> 
>   Front: OV5670 (ACPI INT3479) on I2C4
>   Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind the TPS68470
>          S_I2C port (controlled by reg 0x43 S_I2C_CTL)
> 
> Add the regulator supply map, GPIO lookup tables and a static clock
> consumer list (for both sensors, to work around the broken INT3479 _DEP)
> for this machine, and wire it into the board-data DMI table.
> 
> Regulator mapping:
>   CORE -> dvdd/INT3477, ANA -> avdd/INT3477, VSIO -> dovdd/INT3477 (opens
>   the S_I2C passthrough), AUX1 -> dvdd/INT3479, AUX2 -> dovdd/INT3479,
>   VIO kept always_on. VSIO also supplies avdd for INT3479 (OV5670).

Now it looks like it should (only + lines in the statistics)
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


