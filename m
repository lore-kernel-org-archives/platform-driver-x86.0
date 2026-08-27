Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCF279907;
	Thu, 27 Aug 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815111; cv=none; b=SWiot57quS5HkVUAaFY3AS/GdSRUjkjkTG4GOV1IkCeuxVzc6tynCqf4uv91uURt3nZF2cD6VNDAMyO0tLt1W1OJQXNYQAswotSfU6oGdbZmzw19JLvrNjv8dcg6FGt59BEvpXbrGhoM9TXMOVmuDseln4QCDSKB5rym8BtP0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815111; c=relaxed/simple;
	bh=UvD7TQgA18JVFJVQjvWgn1N0hB0o5goWAESI6PcJFLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KafDU8jhZbYrfiC33CpGoY0ce0jgx8aGSITbQpLo5VwfGvZ2FFaJPn7NT8KG8ErVXNTZXno5eOGdaUCiri6fUCz5dAvo7+zMJTR2m49Z5Ac01W1Rg6efeZo6B97o7x49WPGof+dmv7hUpuFsZo6Vn5oFwZ5K/6j4SjaBzAzvkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izWxVpu+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izWxVpu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787815109; x=1819351109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UvD7TQgA18JVFJVQjvWgn1N0hB0o5goWAESI6PcJFLk=;
  b=izWxVpu+TarVXWITe8kpqx9r7xPJqvhVbEKbO3pPEQCAfU+N97N6D9R1
   Ps+Gca/DTmuEUTzw+LCexODWziLJeull1QlOAq/aD7X2p7lYb2M5ifc9s
   ZIRVWw1Vw2YfDq6znlpni0d0/gQmBMSIAb67tNKt78x6JMAKubck/8bXQ
   Wc4DBi9X4VSQCSw/2t3B9hlzQjkVfjSKQGsNmc5d+Sk95E4ucf7ucyUyP
   IJ24RCsvaRf488ByQETTEDzH/hGZtWFs+/29zSKj3+/WUwyZ02KFd7Nw/
   B1d7LmLZJ7UgElX3a/AjGtTvC3IFpQgwlPJ+CGUZ7tj2pPVCmx3D/vzrz
   A==;
X-CSE-ConnectionGUID: GiDOasCJTqe/jXLrky+nHA==
X-CSE-MsgGUID: V6QB1my9SqGwLdV5cBpSbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98905716"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="98905716"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:15:38 -0700
X-CSE-ConnectionGUID: NLWMJ1/tTZ+1cItM60d/ww==
X-CSE-MsgGUID: WGfP4NUNTrGo9A+j00AiQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="264552085"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:15:35 -0700
Date: Thu, 27 Aug 2026 10:15:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v8 1/6] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
Message-ID: <ao_kFJE1smoKeKXA@ashevche-desk.local>
References: <20260826112452.13539-1-tchatard@gmail.com>
 <20260826112452.13539-2-tchatard@gmail.com>
 <ao_jsFUSa8GmgHnr@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao_jsFUSa8GmgHnr@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 10:13:58AM +0300, Andy Shevchenko wrote:
> Again, there is an in-thread new version, DO NOT DO this!
> If you send a new version, start a *new* email thread.
> With that, the v8 has no cover letter...
> 
> Note, using `b4` tool will help you in preparing patch series properly.
> 
> On Wed, Aug 26, 2026 at 01:24:46PM +0200, Thierry Chatard wrote:
> 
> > The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> > and the I2C4 controller (INT3446) both claim the same MMIO region via the
> > shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> > with -EBUSY, preventing the front camera (OV5670) sensor from being
> > registered.
> > 
> > Match the affected machine by DMI and the affected device by ACPI ID,
> > carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> > applying it to the per-device info in probe. This follows the quirk
> > organisation used by the PCI counterpart.
> 
> It's okay now,

Ah, actually not. The subject prefix must be "mfd: intel-lpss: ..."

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

So, this tag only applies if the above is being addressed.

-- 
With Best Regards,
Andy Shevchenko


