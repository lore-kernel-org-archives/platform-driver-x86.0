Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF2145A1F;
	Wed,  9 Sep 2026 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929226; cv=none; b=WbhsSNqNyLFWph2J28bazIOSgrmYF/1nJLEx0A7Ffl1QsQdU26Ml1wIqjxu8SLtV/CG7Le4hi3oT9MOvGJuKI2VkaXygdoYnFOZje8VZcV0i3Z0VAzhF8ugUGuawZSnuMVlg7GC/CbELoj4E8r6mDn+/8JYjwJR2WHgINKTa0T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929226; c=relaxed/simple;
	bh=Ok2z4j2NFg0vlwTJJagifJjwcY0TQPyf7bEygM3L1Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSWlUIB57MIU4ruGoLHzl/emy9wkoHB6zzvLb8kcYeWeuRVRmKUax4Whx8y12WrjmNVC80B23V6KTl3MLVIdem9fJfBPRnsLXolzd3NdI+i8QQ7oO7Z2Q3pULxbFKoEvOWbpSKf+Itbz7HFJop5Wgk55NV1v9po8DA/bhYb6A4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZIWAq3Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZIWAq3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788929224; x=1820465224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ok2z4j2NFg0vlwTJJagifJjwcY0TQPyf7bEygM3L1Ls=;
  b=KZIWAq3Yq+p7utBaro0CTd78U+ijFHr4OHRKKhGhXLfxxS9Yym4bvKVC
   POzcQiHCVQpA3KnO4F+QCJX1TmnojY1ObpM2xvyaVQh9GL0Kr5FjumM+U
   ahMmPuHrMJPJ/SndyncIcyNGVN1nE9P4WHuS4aSQOQryr8G9E5DDps35f
   B3pFVP7mrs1eXqW+IRd+20iGfUjAUG9oW3HsfQWYKJx1k2f5RJkVKs80c
   NqhZNSFeh35EXC8QPJdF1mGyrUxr16JWGn/Q8ZC/NF3cofzo3G0KtphWX
   Gy809viCNY+IkxeRsKnvwOI0A2LehS32eypt0NteDFqSlPLBFtgIRgE32
   w==;
X-CSE-ConnectionGUID: 2COCznRqTtuYv7zgue93xA==
X-CSE-MsgGUID: fy6o/bkmS/2JENLMArP94Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114886663"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="114886663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 21:47:02 -0700
X-CSE-ConnectionGUID: j49rDR/9TsW2DNZymZN0nQ==
X-CSE-MsgGUID: ZlAIBf4XTsuMZw6XcZtflQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="270718305"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 21:46:59 -0700
Date: Wed, 9 Sep 2026 07:46:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Thierry Chatard <tchatard@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource
 conflict quirk
Message-ID: <aqDkwTkAsvs8Escx@ashevche-desk.local>
References: <20260831160754.9857-2-tchatard@gmail.com>
 <20260908161629.335223-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908161629.335223-1-dmanresa@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 08, 2026 at 06:16:29PM +0200, D. Manresa wrote:
> The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
> the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
> variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
> same variable, so intel_lpss_acpi fails to bind the controller with
> -EBUSY and the front camera sensor (OV5670, INT3479) is never registered
> unless acpi_enforce_resources=lax is passed.
> 
> Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
> applied to INT3446 on it as well.
> 
> Assisted-by: Claude Code:claude-fable-5-1
> Signed-off-by: D. Manresa <dmanresa@gmail.com>
> ---
> Applies on top of "mfd: intel-lpss: add resource conflict quirk for Dell
> Latitude 5285" from Thierry Chatard's v10 series [1]. Thierry, feel free
> to fold this into v11 instead if you prefer.

Do not fold, just add into the series this one as patch 2, for example.

> The conflict was verified in the 7275 DSDT (BIOS 1.18.0): GEXP has
> OperationRegion (BAR0, SystemMemory, SB04, 0x0208) and INT3446._CRS
> returns LCRS (SMD4, SB04, SIR4). With acpi_enforce_resources=lax, which
> has the same effect as the quirk, the controller binds and the camera
> works with the board data from "platform/x86: int3472: Add TPS68470 board
> data for Dell Latitude 7275" [2]. The distribution kernel here builds
> intel-lpss-acpi in, so this exact patch has not been run yet.

The patches still need an Ack from Lee.

> [1] https://lore.kernel.org/linux-media/20260831160754.9857-2-tchatard@gmail.com/
> [2] https://lore.kernel.org/platform-driver-x86/20260908161445.334910-1-dmanresa@gmail.com/
-- 
With Best Regards,
Andy Shevchenko


