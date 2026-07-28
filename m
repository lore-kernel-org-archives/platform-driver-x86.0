Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D03B42C7;
	Tue, 28 Jul 2026 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261969; cv=none; b=cKsgPFi5ijVbuf3CbTGqEd7qqMapBaVWU0j9y9ORHuuDV7zE+y3Q5r7exwlRoPbO5CZZsvkl2S7XUa3pfe/VcRxbFIS6vevVv/AZ8K4ThJ5xg+FhWX3Czq0nzk890vn0xq8bp46TRt2Rl0VbIR8wSkZ9B4ndM05pijweaVafhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261969; c=relaxed/simple;
	bh=H4uIzGs0bvlCEi6cujRtgCjDoIMmCyQIIE20zyj7lrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pllt5QvHLeqVYYVbkVgapJ6j8Mj6+BWtJ3ybuo3VUkyI48MJi0r5S27ynZdtiOlkI4lKJ/YvTIT7QI/sGP9yWBmfdag5EWg+pYoHMwT4rpbq/q8wkpdAR0BDLuNblfRtoauW6pePT8QAdioZqMvpC7R7O0E+A/K8u7YWOZiA+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIGBB/FI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIGBB/FI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785261967; x=1816797967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H4uIzGs0bvlCEi6cujRtgCjDoIMmCyQIIE20zyj7lrg=;
  b=QIGBB/FIEyJr8Ir17YyGbpMpMy194876xt0d1Aze7+a9941EjdzaXzJx
   CWY7pj92FVsoNZmr0G4QZ47I1OEHaHlVaMjJJPzMFVm/Lxjrgk3jNc5JA
   jaAV9f1yu1GDo5iESxJrPso/tlCELt0ehxBIu/2Ljoetcb8ju7G+AONap
   8Hn/2YvkedAcP+UbfIe7W1HUZYZ/mF+z6lkRHsTb9crK0MuqRVVd77SJI
   +wKmr0bxVR/IPpzzk2kbp0micKLBan1UA7d60+O3mBl4v29mXmoG4Csz5
   WxdZKn3Mop3nVK6hS2qelMN7SGCgwoKY7vnNadwdE17QdwP1yfKsECULa
   Q==;
X-CSE-ConnectionGUID: 0W4JgWA2Q5aQ2YIR7rSqdQ==
X-CSE-MsgGUID: NbAYsg4HSV2Xdt0vvsUVuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85732699"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85732699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 11:06:07 -0700
X-CSE-ConnectionGUID: 4GvvwcWMSCySnayaV0qY0w==
X-CSE-MsgGUID: F4e0q6FmS7W5hyZmMCTpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257100821"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 11:06:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7C2BC121C2B;
	Tue, 28 Jul 2026 21:06:04 +0300 (EEST)
Date: Tue, 28 Jul 2026 21:06:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: johannes.goede@oss.qualcomm.com, hpa@redhat.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform: int3472: discrete: Support multiple HIDs
 per GPIO map entry
Message-ID: <amjvjBEhQ5cgQupP@kekkonen.localdomain>
References: <20260724105314.10621-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724105314.10621-1-tarang.raval@siliconsignals.io>

Hi Tarang,

On Fri, Jul 24, 2026 at 04:23:13PM +0530, Tarang Raval wrote:
> Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
> GPIO quirk. As more sensors needing the same quirk are identified, this
> means adding a full duplicate table entry per HID, differing only in
> the HID string, which does not scale.
> 
> Change int3472_gpio_map::hid to a NULL-terminated hids array so a
> single entry can match any number of ACPI HIDs, letting new HIDs be
> added to the relevant array instead of duplicating quirk entries.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Tested-by: Kate Hsuan <hpa@redhat.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Can you resend this with LMML in Cc:, please?

I'll post a patch to add L: LMML to MAINTAINERS for the driver.

-- 
Regards,

Sakari Ailus
