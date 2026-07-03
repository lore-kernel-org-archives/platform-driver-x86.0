Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2453D952E;
	Fri,  3 Jul 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086166; cv=none; b=d5ma105aahoJdIZb8OZAOPu23tjcTmcQ7YTDVwwSJmt150bxHqT0Fs5ZXhIowY/joPj5UiSy3I2Xcggk6ZsAjN5HelN8bY7SclN6j7FUehSxaIAByCrrrpthOwUkLWlRrvOfEwMzlz5ZvbhvFqgUIA/Tji9akvIowX4NSoHrsGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086166; c=relaxed/simple;
	bh=6Z72ljIgUI20FJXRi9moEg7SSCwEyGCr+HzzOcOKw5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N1Ez0SmA9uRZ6Uf9sMdpj+F1jL2K5rk79MRvYyZwwyI3KdItbpo2JQSPx+isQmNrCLIf+eUMNB01JEEyVRV5wd8uo0GPMTRsWeFenUe7UL8tyvd12aMq3oiTnjikAwTWC+eDo3mMLKRi816Rh0WI50OVHyAf9e78VYoP2vqX3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFlj3+cY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFlj3+cY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783086165; x=1814622165;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6Z72ljIgUI20FJXRi9moEg7SSCwEyGCr+HzzOcOKw5M=;
  b=FFlj3+cYETGUEhJ2Y912pU1tDuXC+UvGJGJrlD3nIv6L5MMash0Unb5/
   PF/+d30VydQw/khpOzz9PqHAql6V4zbyaetXme2M0ChmifB5e/uTcMxod
   rhvYF04YqIZqf3Gn36xkRJ/0KmA7mWbRPSaIUu6xUAZBboJ9qhYM0ESBg
   EpCrsQTkw0ljkbQ28HPLJ8T9bNoAzFNkt4WNTncZoZGDDLn1pIlKDDKVE
   YFC/UKPHo4Z48JukKje0BIPAL/hV/94ZoJtZZPK9ER6YmSuP0s/04xqdu
   2eXi09WJJRLHOLgCq5PIkEuk21rytC7JgA8zSf03E56/AyYgTDTuXCk8n
   A==;
X-CSE-ConnectionGUID: ObxsMXvMS6a879uHKKRFKg==
X-CSE-MsgGUID: fzE5yQifTsu/Yj1oqufAuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94199570"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94199570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:42:45 -0700
X-CSE-ConnectionGUID: wfCQcblhTxGzrD+ozKAfGw==
X-CSE-MsgGUID: 9irZIvEWQI2YSqp0E+gj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250466603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:42:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Gibson <daniel@gibson.sh>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20260626220210.1761783-2-daniel@gibson.sh>
References: <20260626220210.1761783-2-daniel@gibson.sh>
Subject: Re: [PATCH 1/1] platform/x86/amd/pmc: Avoid logging "(null)" for
 DMI values
Message-Id: <178308615726.25771.14949789172723746192.b4-ty@b4>
Date: Fri, 03 Jul 2026 16:42:37 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 27 Jun 2026 00:02:10 +0200, Daniel Gibson wrote:

> dmi_get_system_info(...) can return NULL. Using that as %s arguments
> of dev_info() would log "(null)" (as part of a message like
> '... System Vendor: "(null)", Product Name: "(null)" ...'), which may
> be confusing for users.
> 
> Use Elvis operator to print "(Unknown)" instead.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Avoid logging "(null)" for DMI values
      commit: a0738abd042f7406edd2175a819cf2e66388ed97

--
 i.

