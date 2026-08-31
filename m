Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8E39B972;
	Mon, 31 Aug 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167513; cv=none; b=t5SXwScYHj+tfBOCTtoKc56nLI2HKvVpIOQ9vLxR26hNjLb5KEMXRTkR4B8y4Tqv0sMSEJHjekQAOLsBXOjfvJIXJquarLr1krfaT/VuwlCOFFQFj3Az43ZAyiNrTaoRRxwUY7rwnQ+73uUqlMjBz7IJinNEGoTtX/xIqnDsdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167513; c=relaxed/simple;
	bh=8cBgtHL/rCZyAM6c4HMYcXqzfxPCRFkBY7TBfv1f9vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCwkxDnTRqdjuT7S88cUR6I+PtjBZPlgYgpCgPe9a4WxoAQReIwejzILSf8oFdpTsKGnGuWtZUpqFuWEZsWGBYDIXPN+xI/t0zofvX4+MGkH9Sxkq6sIpq5grd5E9LgMF/FH8gPFLG4DgJr2M/TO6YDhSyiHypT0ZYNZwQq/fso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3ASnrYo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3ASnrYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167511; x=1819703511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8cBgtHL/rCZyAM6c4HMYcXqzfxPCRFkBY7TBfv1f9vE=;
  b=c3ASnrYo51gAl7jTNotebtuecbDReYPG4Ftgpb2/GXILf5McBbjiUaqP
   gd8mdV4POPIHJW91gqf8A4MBSqli49XgBbBEse9LUM81RpoSH77DKkBRh
   Oz2CO/5s5x/yctwo7tYxeq4VM4Ysh+2Ro5/vC9ctui/YQo+wn1KZhPm3a
   lWILSs5LRCTmM2NX0B/EJzKkFDHnu72LBUq9inOlm5UgD/JBEc4hl1szj
   KuyPTh0WJDwRRN7a7roncU28T1l5xXNMMF6JP5+GhMltQrHvADBYtUSlG
   D0mUK7VvJES6v4p+LzU4VXvPH8D/nZrYmmU5s4qdEcOipeADxO5z+o6Lk
   Q==;
X-CSE-ConnectionGUID: 2ESUJqWyTR2EeJNBtQ5OEg==
X-CSE-MsgGUID: aU5/Td5ERiGVnKGDKGFAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="91082692"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="91082692"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:11:51 -0700
X-CSE-ConnectionGUID: M13EvuugTnuMyCuwkJwGYg==
X-CSE-MsgGUID: fhVNOEncSh+krxAY2u9cdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265027104"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:11:48 -0700
Date: Mon, 31 Aug 2026 12:11:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Message-ID: <apVFUoSmLmj51zJh@ashevche-desk.local>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 30, 2026 at 04:15:04AM -0700, Dmitry Torokhov wrote:
> When gpiolib dropped name-against-label matching in favor of firmware node
> identity mapping, lookups referencing unattached software nodes (such as
> arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> 
> This series fixes the lookups and cleans up redundant software node
> registrations on Lenovo tablets:
> - Point Arizona GPIO property entries directly to the codec device software
>   node, which is attached to the parent device.
> - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
>   during devres action teardown.
> - Generalize gpio_secondary_fwnode_init() to accept a node group argument
>   and use it to attach crystalcove_gpiochip_node as a secondary firmware
>   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
>   Yoga Tab 2 models where codec software nodes are already registered when
>   attached to their respective devices.

Nice series, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


