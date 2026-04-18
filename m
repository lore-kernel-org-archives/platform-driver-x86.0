Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12231D362;
	Sat, 18 Apr 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776496741; cv=none; b=eRFUJR7z8xfZOOPHCAHly8FeCq3IFAOo2OlcWuLC51HS8Cq9iKArJIu0riOQghJGzgi8uTndU/k8+VbXsPPNCiyBOqgW2WgNA1PMhRWbUy08ZLTmjYXl6d4TcmjhUO28M1A5/jxPQFsTu8/dgvT/77DLW+ZXRTxA8WzEU0A8j0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776496741; c=relaxed/simple;
	bh=ALkjhhjQuzrNINfyaAtq43U8EVnV1DZHI0VuzDH/oIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JK0QQtmEVuCf0QC5m+sY4x/7CFVY4v6NPcIuWVtmcfzSCGPnkBvWgPrTBizdcaD2x05u6sfLSsf23IJjLyfWdLYla8KTwDyVkdsCYAK+bcFJLGtjQ79S5YwS7NEpP0co7C2SA/4hrdfjKGRsUeQC16kxL4tViVvP0+Kzwn/w1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZ1CuMRh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZ1CuMRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776496740; x=1808032740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ALkjhhjQuzrNINfyaAtq43U8EVnV1DZHI0VuzDH/oIQ=;
  b=AZ1CuMRhAlU1ePfMq3N7DRsQiq3SuL2Gh/LCy2YSmxwLmUj5O7oU2AMy
   YxasYoMfnh4cav0tJX2jHc4O3bTc77rV8GWCL/s0s8dsbVv25+dKo9OOe
   UDRlaMLvtOD809PWycY9HIa4MHxNuVQbPhBfaLmLs6qLTd4Uq3P+DpyM4
   HRL6T+DFeIZhkZRZum++/NEHjDlSUvrnQURJdQTbNJDhnfC5bh8onSsXO
   QwaqeyTzMbvRl6xgPNxq/qrGJGBg7SP8wnjNCwq4TG99/NAVjVTkpELKe
   XuYEYQrmmR7RTxF++pSIFLlUg8D0XIm54CXMhhi7PCQ68Asc0u0lvtxPI
   g==;
X-CSE-ConnectionGUID: sucsTzmrRrqh9+NZjvtwQw==
X-CSE-MsgGUID: osWR+xWjQtqGmORGliL5gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77376406"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="77376406"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:19:00 -0700
X-CSE-ConnectionGUID: iNz4kELlQyCHnbrpVkGpXA==
X-CSE-MsgGUID: YaqiFp8ZT2K8Vonl65Z8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="236206290"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:18:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 047FB121CD9;
	Sat, 18 Apr 2026 10:18:54 +0300 (EEST)
Date: Sat, 18 Apr 2026 10:18:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v3 4/5] media: ipu-bridge: add sensor configuration for
 OV8858 (INT3477)
Message-ID: <aeMwXeM7sWY1uAeO@kekkonen.localdomain>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-5-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417163252.15603-5-tchatard@gmail.com>

On Fri, Apr 17, 2026 at 09:32:51AM -0700, Thierry Chatard wrote:
> The Omnivision OV8858 is used as the rear camera in several Intel
> IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
> INT3477. Add a sensor configuration entry with a link frequency of
> 360 MHz to allow ipu_bridge to create the firmware node for this sensor.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
