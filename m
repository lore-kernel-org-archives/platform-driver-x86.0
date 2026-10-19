Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910F24A3D5E;
	Mon, 19 Oct 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400508; cv=none; b=ElctWnAnLkAqpvZYDagP7TGvDMjaslXDAf8aLkD7VyXVFSkOd4Senuwo9aSr5iz5hyLPbnrJ73Kf2sFGSI1CWnmc+b8sQXxJB2oPhX047tdTteeMxPrB/j4Ybgug+PS0MjP9uDWfJctfOixWtRULYozgsyGE5kx3o3JJB948fPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400508; c=relaxed/simple;
	bh=ADMJ8MGw5NA9AIxOEVIqi1I/TCowIUmveIe0qrtgWcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVNZ9BHVZdya31hBbPNiymT3f2AVacXp+JYIX36fixA/dLF4+VQO7DcWRbSO0K/W4yGPfqMf0XkYuojfY2P+c68p7LCvU+JU/+tiyly+VvsyaRUlWOD4tLpirD0CNcBvYB/eysgU+KjWnpBekz0TidL9k5yVhpQX4dCKA3/4PzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB/AdmCs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB/AdmCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792400506; x=1823936506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADMJ8MGw5NA9AIxOEVIqi1I/TCowIUmveIe0qrtgWcU=;
  b=cB/AdmCsc1FdReau9aVxRqPozws4ZZYnAJFjDmG9UfsNE9ISWQtDRIAV
   BZqoJ4OhiU6odnEzYlVG17OJ9A2beYNIiDWKsEpnJ+gBZGmrYHgCIcJFr
   ipTDRpLuK8hAiI8Pns4l+wBDkm0h949Fo4UC/KLrQ537fqqIkUPkNgLwA
   nVRQQNit8hgOgD6NXJfQeVrHoGklFHL3BsSGKizc6u7kS05twayuS4Q+S
   NfCz4jKmfZ3/Xdz8MNDWtIDXpxWyZEVS3PDWv+qLgn4HyWGIk/W8m4Nhm
   V6WKMO2LByJUudsdvy/+kEpPUv5Y9elqekmyW41uqMTgTOvI+zT5ciEIt
   w==;
X-CSE-ConnectionGUID: dNGDavxkTOKPSb1MOkYV2A==
X-CSE-MsgGUID: 8Agin+qbRKut+33xtQWZow==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1064425"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1064425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:01:46 -0700
X-CSE-ConnectionGUID: +Wk1Y/+1T+eRt7GmKUwytw==
X-CSE-MsgGUID: g4MHUux/QBmyTwZ6lNAowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2957976"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:01:43 -0700
Date: Mon, 19 Oct 2026 12:01:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Alexander Patrakov <patrakov@gmail.com>,
	Leif Skunberg <diamondback@cohunt.app>,
	Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] platform/x86: int3472: Add support for DOVDD and
 DVDD GPIO types
Message-ID: <atXcdApv8uR0E8Kq@ashevche-desk.local>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
 <20261016141716.130220-4-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016141716.130220-4-johannes.goede@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 04:17:14PM +0200, Hans de Goede wrote:
> Add defines for INT3472_GPIO_TYPE_DOVDD (type 0x0f) and
> INT3472_GPIO_TYPE_DVDD (type 0x11) and map them to regulators with
> matching names.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


