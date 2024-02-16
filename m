Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCA145341
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708118802; cv=none; b=fcIb0WUSleSumoL1eJIZg/4fwtXIkmPD6p3b6xVUgLF4p9eQOVMlifgEg8wMoIexYwIdJwbMA1ycxZdNRT+X/SD/k86vX1wucNYQpDuI4AW/wzvkAsONTTsUmB8V5RkYdCLW7i+ROpg196X3BkjJlgQ89oAjRykbhfmZOHpGjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708118802; c=relaxed/simple;
	bh=v/SxM8NehM2cyIVkarhkcReKLTOxrHkmStAo1alc4gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfSzJvab2bThsPJkp6Yj7aghUyn4g55pMkjLeoLgBsOLQPqMjSj/hDPTaXxyFeGNpTOETHSZs5A1YymJC/KCncA9zZlDbU9N0RkkudUtiHVS7nZT5zq+g7QDiN/6cDc10f+nIKnJ3rhziDHj6wbS3AjcfNp/Dp4+qOSxN7Xg7SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2407012"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2407012"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 13:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="912425388"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="912425388"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 13:26:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rb5jA-00000005BMi-2HRq;
	Fri, 16 Feb 2024 23:26:36 +0200
Date: Fri, 16 Feb 2024 23:26:36 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/4] platform/x86: x86-android-tablets: Fix serdev
 instantiation no longer working
Message-ID: <Zc_TDM0T7oPLruoJ@smile.fi.intel.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
 <20240216201721.239791-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216201721.239791-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 16, 2024 at 09:17:20PM +0100, Hans de Goede wrote:
> After commit b286f4e87e32 ("serial: core: Move tty and serdev to be
> children of serial core port device") x86_instantiate_serdev() no longer
> works due to the serdev-controller-device moving in the device hierarchy
> from (e.g.) /sys/devices/pci0000:00/8086228A:00/serial0 to
> /sys/devices/pci0000:00/8086228A:00/8086228A:00:0/8086228A:00:0.0/serial0
> 
> Use the new get_serdev_controller() helper function to fix this.

...

>  #include "x86-android-tablets.h"

> +#include "../serdev_helpers.h"

Seems Q more to the previous patch, why is this in the upper folder? Are we
expecting more users?

-- 
With Best Regards,
Andy Shevchenko


