Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0B54766A5;
	Tue,  1 Sep 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256104; cv=none; b=GS7BpZwTm/czPFCglR4xfc+1NCnowUczG4gK1RsfzoSFfcwfqMvUe6KwWG0+MiB3BuHl21Vv2UGO1sMrQo1DcWkizlQJP9+WOR5N1adCwF+KsTpKuRJb7ovFcM3Osd9QZEIcUBEiihl7eQLHLWtHJtQiHHSThgmLBSPylP8erCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256104; c=relaxed/simple;
	bh=qAp8MrjiaLvm3oKtW1EugfF51+OIz+9Uqiti+xEPkYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfmodRgncJw/7UTTugPm+ADcNPj2C37TG+OLBvEYoru6qEL6tF6d2OAErYmievZ6wdRswxovTm3Da39y4xZwXebFSEEdS0TIfNjwiy+u/MOKHqD2D5s6NtsQp7qnCaCCdN2rSsjbQHvQ12mQeTM7VAxVRY06nJLdqbKYAPKEaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mb3JzQ9f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb3JzQ9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788256102; x=1819792102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qAp8MrjiaLvm3oKtW1EugfF51+OIz+9Uqiti+xEPkYA=;
  b=Mb3JzQ9f/dJvjiywTGbrjCIwFVklhQDKJQ0rczOvjE1r3rgTTSIGX1c/
   D1ejb99joCdRi43Xa5edjAykZBT9/CynBRH8rly/iw57ZysFmIRjgIVlI
   JxqGp+sM0jP4SFbR0r6cTw6Ntz5SXtyhpAGGAB9uY6I7z1+zDIq9syULp
   E3KrjP60bxVw1Unapf2pA0fMBEWD/Y0HvCNDBYRQ+FHpNyiZFbCAuLgon
   HPGEXFbq6vyxLJ1XEMKi+xxKRwffu0UN0kfOO0/MHQIpjmoW7oTeMdhY2
   69c1bPJkB2PjegDzQ1Nm7JvLYdbmcQbVg1Zmyj/gvjQRrqH1LJKDKMSWi
   g==;
X-CSE-ConnectionGUID: 74dm2VBLRl2GK9lN8faQsw==
X-CSE-MsgGUID: HhlEzP+mRsOgofO5ZUKMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106052093"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="106052093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:48:20 -0700
X-CSE-ConnectionGUID: wY0NC/B8S+ucLhVM0COMHA==
X-CSE-MsgGUID: 8vUAhiscSpS0GNI5BXPmuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="293882126"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:48:16 -0700
Date: Tue, 1 Sep 2026 12:48:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 2/8] platform/x86: int3472: tps68470: use unsigned
 int for GPIO lookup loop counters
Message-ID: <apafXsvky0WQjNkw@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-3-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:48PM +0200, Thierry Chatard wrote:
> The GPIO lookup table loops in the probe and remove paths iterate up to
> board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
> the loop counters to match and avoid a signed/unsigned comparison.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


