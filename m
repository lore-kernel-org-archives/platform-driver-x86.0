Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486661;
	b=x/fY6z77MeyrAl7qEk6W8QcVjbFeI91BVdvh5t4ZnOWSzir4MmyIXclQZhidFJgh2PIV
	 cKouy36Zv6uZHlsLa3aoUki7mAQlv3BLFnO3UPTaC83Ys8iI6cHc8dZ5cBPB49uBC+cg0
	 QVUmvArW0OLQgtAPq6PA7VZGs4voQu8sWV+8zBPOl4S8TBVPGHV8DWM893Ji5EshqcnsD
	 Q7drekOd0XzECiP6okxQcqLWRpVtjYcQ42G2fyKz5A258Jq04SG6qL6PJLVh9amQScinv
	 V3PGW0qoSwxICSax/qZSDKgd1DHYkByuVLWcA0ORlcCnAbJXhGUUsnaSorymqm0xHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486661;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=8EADj5N0q93RQwZJra0ETd5ppkBln/LzNjMY6Y0zjkU=;
	b=jV8FvTMbKrupydzKnVt5Pekw7mCS2+rjdSRjHkvpc21v+tOUS+HNqnk0APrujlyo1/zn
	 w4QSYeG09p2VnQJUGxeFNg2mI3g31IIE6319SAqyQOIYWoBWzvXjqpjSHaen7rtslaaXr
	 JIZF1WQko7CzaRDEG8CmvkrKiMnSHKp2ZtbBqAd4d0v8EyRSYo99EGQ1Cg5qg5WU8Dq8n
	 aMnjA53rZFjh+rHOv6P2/YhHOeUsuzTZ6XJE6u8uRmJFMAeeBcnFwFgv6MTMo7Y2WQ8Ji
	 1Tka4/byT0UZZ+4qwcymUe8vtBkNblBfv2QggSW579/UGSlz53/X1qVk7sAcW0O0ieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Tf9Zb/uc";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC7606A328;
	Tue, 20 Oct 2026 08:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CC7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tf9Zb/uc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792486660; x=1824022660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DHTc8bHXvi3461boxPJwmbEs/Ed5gx2BU1gdpjFJ2Es=;
  b=Tf9Zb/ucdk/7jUw/GHT0euB1DjCJv3TpX9oci2u6s/IHt5G0MFyGNXxM
   Nyv/g8gVwWNiNRx7JFpiIwMNhW/RuDlAsE7B571/81DVMh9KBpi/plUXE
   7TlPggUz6K8aAErGIxGzYXC0qrz8bkBCzkabg7Y9d3paisXfYO8fbAcKW
   IxrT2o7znBb6hz68UlBPTkYMXy4lnbdwheHjQYhcRtxRgyinXxxC5gwag
   YQeqfD34yfR0rvHJYMSZclzJBEHHqbgSH16PxX73Pg6nV4kUIMgQto0lr
   MOtwpZjUQkFd/Z/li56yzWkbgM7/rJs0e9jMesTCai1Ny79onXNEpDF7b
   A==;
X-CSE-ConnectionGUID: lAbcQ0trR1mynSHclUC4Ag==
X-CSE-MsgGUID: 1wC/+zA4TAqmhhVIGpoBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1073551"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1073551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:57:40 -0700
X-CSE-ConnectionGUID: FsoMjv1uRpK/tBdhNGGx/w==
X-CSE-MsgGUID: MaC+lEpjRz+Tl1gr/gMh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3223107"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.72])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:57:37 -0700
Date: Tue, 20 Oct 2026 11:57:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Alexander Patrakov <patrakov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com,
	andy@kernel.org, antti.laakso@linux.intel.com,
	dan.scally@ideasonboard.com, diamondback@cohunt.app,
	ilpo.jarvinen@linux.intel.com, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
Message-ID: <atcs_nK50gJ3dBRX@ashevche-desk.local>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
 <20261020015001.15672-3-patrakov@gmail.com>
 <atcpXzA6KQfgiD7J@kekkonen.localdomain>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atcpXzA6KQfgiD7J@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+ Uwe.

On Tue, Oct 20, 2026 at 11:42:07AM +0300, Sakari Ailus wrote:
> On Tue, Oct 20, 2026 at 09:50:01AM +0800, Alexander Patrakov wrote:

...

> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> 
> #include <linux/device-id/acpi.h>

No, this has to be part of i2c.h on par with device-id/of.h

Uwe, can we get this fixed, please?

The basic idea that whenever we have -id/of.h included, we must have -id/acpi.h
included as well. Otherwise we will get tons of this explicit include.

Or let's do it other way around, drop -id/of.h from i2c.h/spi.h/et cetera (but
I predict the answer to this approach).

-- 
With Best Regards,
Andy Shevchenko


