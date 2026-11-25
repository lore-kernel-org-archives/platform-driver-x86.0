Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608600;
	b=KfnA7y8FF4pe71wExOUep/IHb9niJKH4/MqW7nJgewuyC2lpXL+TeiXmrTCtXIKsTJKm
	 i/yDREmjY6dMZg6pwnQjJqiw99lj3DSSvS6YGbDs9idXZ0t6RO+B37lpm0s27/OQvFL8v
	 4wXeWkdYXesrKfwHz8SkksiGGIjyu3rVRaNi6p4nDzZ7KPpEN0xvEOG2a6YljtjbZ/72B
	 MWbjyJjhdY0BqWZWUyPmXDF2ug8eyf/FQe2qFdKWjZ/0YIneZyNz6rpXFRgoK02t3aqdv
	 4zfCmRsaxdgttPsE0eHQGRqtX+v5C6vNEGa8kADFK9cHx0UT2u0jzrySho1Tb2CtDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608600;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8wBwtuJsGaQU0lzGZKmrRPCz1qceCGO9wyoK7OZ9yjk=;
	b=CDkF/D3/uKSum4XJWwVJdsDVsQGI9GMM4H2VrsgDc6TX9zYBxNrgJOl0H0N+1W1f2cL0
	 nmOh64n2w3JihmBjLhksFmRqLAmjPhF1frFY7NBO/Tqz2P3W4HY/MGQXdswLJd+EeNJ/9
	 l7FpgtOAQzab59jbErNn3XrsLt/kp8JOPRFq0Y6/2lAUnwy1WV/5elFB34axQiIwpcyhX
	 lkENYl6VxaZy8KrpVwhaXH9oaN+a50pHuGg2EHVaSeClHzJCL+3ecaVWSE/uMisXcv2Vz
	 Siqtd8cv6DzEMFCHWZdfNyt0u2MrPRoCTUQUwxF0TUaTLdoxKR0Y3AY0ButR44hiMJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jfd4e5ov;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6106F606A31E;
	Wed, 25 Nov 2026 12:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6106F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jfd4e5ov
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795608601; x=1827144601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OoZJcOqtwHtc1mXcC45OLAwJuS6buK8qaDHdK3nI8ZY=;
  b=Jfd4e5ovt3d4U+ft9FZJ97FM53o4Dc+hF0f8DIBwRVtfc+UCIb4hZcIf
   xiu3CvoEsWWB368ydHgLuwnS1ZVcvvTNdT0jQM/uTHh90NANVkZS4hULo
   yVnv/7Oq8U1VfnAFtB/eo0xRMHydYv81zu+Y3VNhiLC6jEjAX9gi/1Lyi
   rErBoLJ7YNSAgte01VrBuv+QWcklrEFz84TtbkpY2zatGBNLkx8H30Dvi
   3A6TOxcS7cHHYEqJqF4c3QrovWdGUHUdSYZG6nf35FrRLVw3N2CpxYmx0
   0VfjeSIcwuuGp9urxT1VAHYhYp3Lt7FF44qIZur1E/6I51LmsFHgm7exn
   w==;
X-CSE-ConnectionGUID: hSVMGeHpR+S1/5wTED9BTQ==
X-CSE-MsgGUID: lv4afe04Raa6pefoI5CxZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4544980"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4544980"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:05:58 -0800
X-CSE-ConnectionGUID: DPiA2P7zQ6KWQmBzWnrq3w==
X-CSE-MsgGUID: 4+w6/FdIRkOrZ8Uy+4DoZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="13877051"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:05:52 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CCD1911F920;
	Wed, 25 Nov 2026 14:05:55 +0200 (EET)
Date: Wed, 25 Nov 2026 14:05:55 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sergey Lebedev <lsa.uz@pm.me>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hao Yao <hao.yao@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: int3472: Use actual clock frequency for
 DSM method
Message-ID: <awbPI9LPXFUpBinZ@kekkonen.localdomain>
References: <20261125090921.46652-1-lsa.uz@pm.me>
 <84ecba76-5fe7-4bb2-b18f-efc7cda2247c@kernel.org>
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
In-Reply-To: <84ecba76-5fe7-4bb2-b18f-efc7cda2247c@kernel.org>

Hi Hans, Sergey,

On Wed, Nov 25, 2026 at 12:16:08PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 25-Nov-26 10:09, Sergey Lebedev wrote:
> > From: Hao Yao <hao.yao@intel.com>
> > 
> > The third argument (args[2]) to the _DSM method was hardcoded to 1,
> > which selects 19.2MHz. A sensor whose SSDB asks for 24MHz therefore
> > runs from 19.2MHz, and everything it derives from its clock runs at
> > four fifths of the expected rate.
> > 
> > Pass the frequency from the SSDB instead, with 19.2MHz as the default.
> > 1 selects 19.2MHz everywhere, but the value for 24MHz depends on the
> > platform. Where the frequency field is one bit wide (Tiger Lake, Jasper
> > Lake, Alder Lake, Raptor Lake) it is 0, and 3 would also set the clock's
> > enable bit again when the clock is turned off. From Meteor Lake on the
> > field is two bits wide and it is 3; 0 and 2 leave the clock unchanged
> > there, as measured with an oscilloscope.
> > 
> > Fixes: e4543de8b6ff ("platform/x86: int3472: Evaluate device's _DSM method to control imaging clock")
> > Signed-off-by: Hao Yao <hao.yao@intel.com>
> > [Sergey: pick the 24MHz value per platform]
> > Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Thanks. I'll add Cc: stable when applying this, too.

-- 
Regards,

Sakari Ailus
