Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC005494A1E;
	Thu,  1 Oct 2026 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839495; cv=none; b=f1tbLijWggpqkTmqteaTkJTjGwxlD85LdvTePSXfyE7vUaKUvZcCV1H0WkTLIZkqRmviyYyimp9Ss8dJmfZqjMWmlfnXl8BC3pp8LkRGmTap0EGEocZxZv9OayOV5lvRkvQU3dBbw8eX7DG4XrbvE+A5u/gExelQJOiR0+1Mz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839495; c=relaxed/simple;
	bh=+faFofoXegG1ISn4JdgrenSzmfNeFHWdLH+k76ut1b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzGgH11C9+n3ZUtB/jQ1ibACbGNiudyNaSwkmkuh0CjAHoh6hI+eil8MdMUlsoP+p+lq/HjB5LaGsvtqg1U1LIGYvH/TpXk4l54lVILOXeoHNG1obHlFSTeWUelvXGLbMNuXA5gMaRQC5kwFRrGchglqAdPtTvwjMKt1jGWFvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnGpHP9c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnGpHP9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839492; x=1822375492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+faFofoXegG1ISn4JdgrenSzmfNeFHWdLH+k76ut1b0=;
  b=jnGpHP9cEyM0w7J/fZqxUzfm/tvhbY7PjQxeM69WNbCqvChr49e97cRa
   fnkJqIZQez5FqqyBpI08O7KLUgtsBPvnNmGJsbF9GUluWhiFkkhABKK1J
   Hc67H8Oa2eYe0fJaL3qJE7bG62sifBgNDJQsMF4gzuhQsuSsZIxq8BGWC
   xh6PF62XxObHTVjQqtH8QdszT1I0SPzsncV3C7PTR2blwHzwFHgwV5ieA
   c0XZM3ZAPvey9HD5bWTX0qbqI3vw85JqNMQi4yH7UwgG3S8pzy2aVAKMp
   09t1fqTYSraZpTU+dtN3TLNDFzJPEBipiDL4TgDKq/4HAnWddubz/RLiN
   Q==;
X-CSE-ConnectionGUID: YJVFRrTqSs61CfWBS2LjJQ==
X-CSE-MsgGUID: jzrwqDrwS0WBsx7x6wFWwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="95397169"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="95397169"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:24:43 -0700
X-CSE-ConnectionGUID: sDUsQiW8QE6pHHPgfA+SFQ==
X-CSE-MsgGUID: ny6zVMXCQVmOsxpabN/rWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="303856866"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:24:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7D958121D05;
	Thu, 01 Oct 2026 10:24:37 +0300 (EEST)
Date: Thu, 1 Oct 2026 10:24:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org,
	hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for
 Dell Latitude 5285
Message-ID: <ar4KtbRTyJR0Bo-b@kekkonen.localdomain>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-2-tchatard@gmail.com>
 <ar4GIfvaxGiykYKX@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar4GIfvaxGiykYKX@ashevche-desk.local>

Hi Andy,

On Thu, Oct 01, 2026 at 10:05:05AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 02:43:13PM -0700, Thierry Chatard wrote:
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
> > Assisted-by: Claude Code:claude-opus-4-8
> 
> Assisted-by: LLM

While coding-assistants.rst does indeed suggest to just use "LLM", I think
more specific information is worth having, too. Specifying this seems
commonplace elsewhere. I have to admit I haven't followed the related
discussions.

-- 
Regards,

Sakari Ailus
