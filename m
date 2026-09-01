Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512B47A875;
	Tue,  1 Sep 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260212; cv=none; b=IbrPLfxR44j8+JxwGI67gowwbcc/u9AMdsVN463mmXX4DOeW5TukOB3aC9RUxKJk1CJ42gmZe38+bESh62tdfHPJ66laFa5Y8dR7v4nXVSKP8Z/AGN0X5jotbWAoOXqcaWdNKRymq/6YQq3P++7OB51fr4ghIfxsNghdS+2cXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260212; c=relaxed/simple;
	bh=CtqazdC+ygL2SFHTHMPJX7tAVfA0wmPae+FwESe4ZPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWL1hZI5LxS3zF+oDRhYZsjtq1UqXDQpLdg5u+t4E1BXv8/ysRBVaeAW31HlkFhMXDyM46XKgRQvXl9+32ja+mYnZJHuhkg/pQ+LcDgx0BnTE7pHUMlzYsmrdFPdbtNAtaSIvlo7wYak+J/tRYvtc79yeqZkl7ImuMxpDg++JR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SK2f0Npk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SK2f0Npk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788260209; x=1819796209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CtqazdC+ygL2SFHTHMPJX7tAVfA0wmPae+FwESe4ZPw=;
  b=SK2f0NpkhPLiUk+k3y4IrAyKK+JDiYWWOZX3Vbyk8SGoudEQwmbmQWP5
   VjUxO3LolCDNt07TKRBzF8cGq5Xjy4pb2lDsKfjIl5ipsdYYKH27uATVn
   aam0uOy1teGoNXJ49fooELYNuw+7KJ37/pPP93ukhLtTilh8YcSowTxxX
   SsASWeVZCcrCTpZiU4iBjy2QmGspTnjJwAmDs5jX7PmTEEU9LBTMpunpG
   DL3kHNXJdFHkn67RJ05WLNW1aLIOOgICwMGR3RGNrEY2cDSyBX+WEgqOl
   SVBQfD7b2nEuArfLu9rIf4RB+93P6nF6ihvA2TdXut5m3bA9NcpLfRMnI
   Q==;
X-CSE-ConnectionGUID: H9+VFcs0T3a9kV6kx57IfQ==
X-CSE-MsgGUID: Tid2gAc6QuyvBIeBoG61jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="91199122"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="91199122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:56:47 -0700
X-CSE-ConnectionGUID: YTTAVOg0T+KcwkE5DLmVuA==
X-CSE-MsgGUID: iB/Sy/vTRAuryUIucn74qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="272579942"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:56:42 -0700
Date: Tue, 1 Sep 2026 13:56:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 8/8] media: ov8858: add ACPI device ID INT3477
Message-ID: <apavaVrfxk3mRkTh@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-9-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-9-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:54PM +0200, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.

Sakari wants you to add ACPI_PTR().

-- 
With Best Regards,
Andy Shevchenko


