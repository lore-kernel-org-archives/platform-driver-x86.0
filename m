Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431878;
	b=BRYDYg+e3K6wowCmsVIuIchbsk+FYctlWPt0SP4uJhMVrNH2dzbWcHBpMrP/AaiMv898
	 wWWz0f0SrDPe2hSO/3y8s0V9bX/atcuYBlyHz5rfPOZddLBXcPaSTqmMcv4ZVf4ZL+0cD
	 72rn9Io3/dI0v3aQdjdJzvdYuf1NtDoi6ACA09TYhWGHnVmJKWTFXszzkNMMystlHsn3k
	 vy9dtt/P8lFu/UcsIWTusFRGEscYRLEd1A5ldaE/brC97ZCwPOacLPLmzoEu9lsDKy+Ap
	 +F9cHAeNILMxpE4NmKEwP+8IMkQPOAOno0nEWsnDxEdqq85XhxyHHIqW1ChpSy6Gkzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431878;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=2VZXYB/XAV9gkQS+/7Kqmpff0/9Z/WHKT0qqbrXQsP8=;
	b=icu7PZJBi7LsnDEGrJ1L5ob3/TRN56sdTaVa6+FSSW5XiAFWYfZszBYkKoDQalX05P0B
	 8vBuUs031IlBA3+2X6P6CSGPZNKPRztbAKS7T1BCX8Bvd/Y4x+PNbp5Fr+uprfOCl1wQe
	 140duKkMrP1Ce3+xsspMqGzv03t2DbKLRPWmhsKxtgYhWD9LBQS+v8PlUODXCoT4uJtCj
	 gvY6Tjg/CwiZZZri/tO761eb3UXysIjC2FnNPoEbSBldoNVpaRmzS0ehJS7RhgGzyYOjI
	 qe1GUqkRXVFPxBn3JCds1Tyb2kfuHg/rhbe0jT7fVHJb4GkrtE1jT2h44MqIthh0uiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bta6yQy3;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA6606A698;
	Mon, 23 Nov 2026 11:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AA6606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bta6yQy3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795431878; x=1826967878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+ReqMnz1UN2SVx2qJzOWe+RB4scccJ2EHySM+9F2iV8=;
  b=Bta6yQy39K9pk9dVQesG9qIVNjyjiLHLQ37tFlq3vHQFHCNKToflxdex
   tm7Zs+pITAvGbyp07m3d4IweSXTrzUiOjOwtpolGvENlSsYQOOg4wEjnR
   ocT4BCjHhBcTwLZp2IgLFkmTQXEkgaJbTZEDM4af4ZZ3hMnDTTBAv5R4o
   JYEeVOFwJZm8legxuQixLyuxORCTEuwX4fX+XVkN2XQfZbrHe3cIY5zrv
   yJMPJy5l/PcG1i4S08picEl1jb2Wxslvkrs+GWZuwnYLUIx5eDZPAYbW/
   jCsA5oQl9FvFX1zlgbOx0TtJpt1gUTmh/7RBo6IV4pY5jQj8Lv5+7yz5b
   Q==;
X-CSE-ConnectionGUID: yf/N1pa0S86W6x478SV4Yg==
X-CSE-MsgGUID: mL2Iq5LIRoG9w7bDF5jl9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4286114"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4286114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:04:37 -0800
X-CSE-ConnectionGUID: 8MZgaDAfR7a6xoiPdrC2aw==
X-CSE-MsgGUID: gTZATZU4TSKofvFVN/ABxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11171057"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:04:36 -0800
Date: Mon, 23 Nov 2026 13:04:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: linux-kernel@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] Introduce Synology NAS x86 platform driver
Message-ID: <awQdwaQAF5bqTlhW@ashevche-desk.local>
References: <20261120214014.4188702-1-linux@zary.sk>
 <b3be68b5-b363-85bb-513a-733ab31cf1b7@linux.intel.com>
 <202611231025.06940.linux@zary.sk>
 <awQdVBHiNY_J-A4y@ashevche-desk.local>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awQdVBHiNY_J-A4y@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 01:02:48PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 23, 2026 at 10:25:06AM +0100, Ondrej Zary wrote:
> > On Friday 20 November 2026, Ilpo Järvinen wrote:
> > > On Fri, 20 Nov 2026, Ondrej Zary wrote:

...

> > > Do you have an opinion on the selected approach?
> 
> Let me briefly look into this...

In general there is nothing wrong with this approach. Only the enumeration part is
somewhat worrying. I haven't checked how other similar drivers do in such cases,
I know Hans has a lot of expertise in x86 quirks.

-- 
With Best Regards,
Andy Shevchenko


