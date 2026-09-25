Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5D3A2576;
	Fri, 25 Sep 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326291; cv=none; b=rivw2fm5ZnOWEyajqGaRUoag8czKxsVxBGc6lZM1bmnn8NlDEV4KByPKGFb6EYamjYaGcW0A8hDKwW3Bw5akSaUTdvJ9YooV1kfCqpyG547x0xjYEOr8vsV3GEfYL5U8ctjNuK5mJP0kJ+HdRMXz90upC/UiREmjKDSA459beSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326291; c=relaxed/simple;
	bh=3wm6TUr+tZUOPwnofkBwSc153ql4UOBJK8YjoL01jks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTnEIws9K4+DEnaqCy6bL7bbKwhro1/0jmnwgjYG8xJSKUgDSSlxWZZRbsN5Q0XVOEwM8SgIDsgKlGfk1QUmvN76yrUazfBuYjbpjLA3S0i1/T3TrI2LLcr3XbBaY5kaLABgUTM69b1TapDoHqDAmXZVNGVHH43JMfJweYyPeMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDQQf6qI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDQQf6qI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790326288; x=1821862288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3wm6TUr+tZUOPwnofkBwSc153ql4UOBJK8YjoL01jks=;
  b=cDQQf6qIxtrnZiMiBCAr3mzwylDkMnIpmvnHq9AZma276R5dCKDW3pC4
   T/KtM2cSjIEvKkiOjGq2L9s1BT6wxT632IMH56C6vN5Ty184OgT8BUc19
   INAxAAowDYVMrIHpHYkwD1LiwX6ij3GHjgUm7syT39YtwW498B4PI+Fmp
   rZzQfx2GzJe4xR2C+qQhGbZ6fsnBvXBbQRBRmLggqJ94ZPVD6875f3BWz
   LWcmQX2j+TWW/Aqw7L4NKuWqH7uSVeFG/TcLdrM2z93iXuh32z5YIEp4a
   WxSm+bmRDlH/WvsKPxSS5U/vTrCdV4cDEzT1e4605PkO5w1mQ6QfNoUYI
   A==;
X-CSE-ConnectionGUID: eHK0jaHIQ26N7dwwlIPJVQ==
X-CSE-MsgGUID: FhretcEuR4y+a+TEO3gvMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90149509"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90149509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:51:24 -0700
X-CSE-ConnectionGUID: tTBcGD5gS06zv6Op1u528g==
X-CSE-MsgGUID: XtE7K6PSShuE3ACHVpwfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273502300"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:51:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 06AC4121BA5;
	Fri, 25 Sep 2026 11:51:21 +0300 (EEST)
Date: Fri, 25 Sep 2026 11:51:21 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: benjamin.mugnier@foss.st.com, sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com, mchehab@kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Message-ID: <arY2CULvwXGyVvH_@kekkonen.localdomain>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
 <20260924171820.1179823-5-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924171820.1179823-5-koreev.r@gmail.com>

Hi Ruslan,

On Thu, Sep 24, 2026 at 08:18:20PM +0300, Ruslan Koreev wrote:
> The CSI-2 receiver already accepts MEDIA_BUS_FMT_Y10_1X10 but the video
> nodes offer no pixel format for it, and MEDIA_BUS_FMT_Y8_1X8 is not
> accepted at all, so a monochrome sensor cannot stream through the IPU7:
> the ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 only
> produces Y8 and Y10 and no configuration can be negotiated for it.
> 
> Add the GREY, Y10 and Y10P pixel formats, mapped to the RAW8, RAW16
> and RAW10 frame formats like their Bayer counterparts, and accept
> MEDIA_BUS_FMT_Y8_1X8 on the CSI-2 receiver with the RAW8 data type.
> ipu7_isys_is_bayer_format() treats every raw code as Bayer, so the mono
> codes take the raw path in the CSI-2 cropping code; leave them alone in
> ipu7_isys_convert_bayer_order(), which otherwise warns about them. The
> two parts belong together: with the mono codes exposed but not excluded
> there, any crop offset on a mono stream triggers the warning.
> 
> Tested with the VD55G1 on that laptop: libcamera negotiates Y8 and
> streams 804x704 at 58 fps, and Y10 and Y10P stream with plain V4L2.

Can you try doing this with the ipu6 driver instead? We're about to drop
the ipu7 staging driver after some smallish number of kernel releases.

-- 
Regards,

Sakari Ailus
