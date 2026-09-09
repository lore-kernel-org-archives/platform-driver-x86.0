Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72256423A85
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963126; cv=none; b=c1IktWLHFGX4fbjUvEp842fM2J+hwMB7KROAqcJn9awM12QgHOnibBZ0rN4c+L0lbzlFufFFQFbt8JK76RPum/pffw5FIsLh6P3l/P3+K1cNDWiqzGBKsopLMf93HJOt1KRAaY2K+3/ie11bMn/8sskEdqn972twh4EuF71PxiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963126; c=relaxed/simple;
	bh=R2hc4nJYNByGNuFXkvT9ryaFP81H3CQrVxptV/nw+9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXHGmsUdI9IRv7wVTv8/yXapwTIgexLdVbcifwXrWPRpGN1NKuohmWEOjaJmleSAcd5xFg82qal3HDeljICAa99TTyJSgpc6XSY+o8amtZ9sFv7/htyg9AmQQTTCHwNeANbel34Vrp27TGXyypJhb00zuaYklrYzP1F0AbXeWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lx7NbqwJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lx7NbqwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788963125; x=1820499125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=R2hc4nJYNByGNuFXkvT9ryaFP81H3CQrVxptV/nw+9Y=;
  b=Lx7NbqwJu7pZVBNptQanKY0wcWwRj7iaK3vAO7RJh8TwCwTZJD4kKXv6
   Its4lg2/1PxOjqQL6B5Ao2nxlIYafw9oItQjuf+qaAetMWBSJclctVeiR
   wsF7kxhe0vrR74WLe/yobIP1ZsJgZzi4xNMboABco+WCaa630nKMXFU+q
   mxlbP2dXhBj+rvjFsDPXtPC7gWKP1OyyANy5qcfrxCZDbzjgnS3jrcj9e
   6cGDvcAUyiozRZXMEdsGaL/oak1zaT7vviORw5XZlgUtQbyIpfpK2mt+k
   jcQiOp2FejJNAJ01TfbIVv7BznL/O9Pf/skH9LvBY7Gd4Sq1ghTXmHFVx
   w==;
X-CSE-ConnectionGUID: OlSBjI20S4K/QwGjU1WySg==
X-CSE-MsgGUID: urfhsV8OR0S3wa8HqhaNSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106761320"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="106761320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:12:04 -0700
X-CSE-ConnectionGUID: SYvnV8gOQNSLE1ie8eVR4g==
X-CSE-MsgGUID: fJ0IDbndRjykRybAWav/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267045217"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:12:01 -0700
Date: Wed, 9 Sep 2026 17:11:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: fix
 gpio_secondary_fwnode_init() not working
Message-ID: <aqFpL__dXmuTnLey@ashevche-desk.local>
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>
 <apcRAvoHkh9blDwK@black.igk.intel.com>
 <74f149f6-caa8-db4e-9ef4-5c15b7a5845f@linux.intel.com>
 <2666d5fe-994b-4f5f-ae5a-60ce9fffb867@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2666d5fe-994b-4f5f-ae5a-60ce9fffb867@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 08, 2026 at 07:51:55PM +0200, Hans de Goede wrote:
> On 3-Sep-26 13:54, Ilpo Järvinen wrote:

...

> I see, thank you for quoting Andy's email since it never made the list (1),
> nor did it reach me.

Oh, it was not intended to be not public. Thanks, Ilpo, for sharing the content.

> I'll prepare a v2 addressing Andy's remarks.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


