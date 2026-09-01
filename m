Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347144746A6;
	Tue,  1 Sep 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256147; cv=none; b=gISbu9jkbe6g1Mid4AN7h8yEMcH6pFtgBc+oi9Mo/JZnUIQlsSsH0PN0TjmELBQN0/8bHmo2YN7SXvD+X7w69M7Dufax+OlNwx2Ck9jwQ6CkSdIwpyFNB5oGX9x6Zx0KUrnH5UQ50vr/olBkKB3Df9/DB6DuhDPm4N4owjYkXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256147; c=relaxed/simple;
	bh=YKIXqy7Khno/ZX6ELHvGQtHbnl1Wy4r/5tHU/FXbpqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssEFwYQ9+XHo4YBLbDfnHQC4sP3dOdB/uQjzGjTg1WJOR8jShfqmujcMLy/29n8dtJLXEodHKXWeOyl8/JOh6F/0bDaLu9idL9by+2PoHvW1wBnInL4xZzaewRhqXAgfXABwhsNj/AV7TIiCX5/iByD3fkcQ4H9T45uFvh//eSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MA5WaCSg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MA5WaCSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788256145; x=1819792145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YKIXqy7Khno/ZX6ELHvGQtHbnl1Wy4r/5tHU/FXbpqY=;
  b=MA5WaCSguB9vMhaU+2mxScuw8GRQlIW8EbBCpStb6DWVPDtuwqD7vzYb
   JbSTmOBRquOY3Wn3kwBZTtVfB/F809mkP3EZYswMBQydwe/uiz58s3vjM
   AShAcq6LvrOVQFmo1wXGhbCFIg6jzlu/4//rXX+FHMZyGHGhAJju6bKeC
   05vMUyjW2vynJcdmxRUMtKBfkBcBY2xiVgFawXGUxVcINlRB66oL3aqMD
   ybLq0/MzupLwtbGSD89I19QBXlF9sp9B8afSBX5QF6OjnWV4hpn1t8zVP
   E+D8v2OkgOhM7WOo5Awl1UDFL+xczxTcLoEAUzbmDYSPSSZOWO03lqQLw
   g==;
X-CSE-ConnectionGUID: xl2AdajkQo+gsOkIg8H+3A==
X-CSE-MsgGUID: tjwI4f5yS/+kba0rGnbhpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87817125"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87817125"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:49:00 -0700
X-CSE-ConnectionGUID: 6bOhXe4GQPC7IEDRlMaloQ==
X-CSE-MsgGUID: 7OQ2jy+yQqWWlea7qhuqMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="274321262"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:48:57 -0700
Date: Tue, 1 Sep 2026 12:48:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 7/8] media: ipu-bridge: add sensor configuration for
 OV8858 (INT3477)
Message-ID: <apafhuUgCVGRfn7h@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-8-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-8-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:53PM +0200, Thierry Chatard wrote:
> The Omnivision OV8858 is used as the rear camera in several Intel
> IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
> INT3477. Add a sensor configuration entry with a link frequency of
> 360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


