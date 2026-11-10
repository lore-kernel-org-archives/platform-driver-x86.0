Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312173;
	b=PvvgvNc/DySnYO5jJMoWww+fVtZJpOHcRCbJ/9LSuaSS7dnLelQiPrMfe57TjlknPr7B
	 8L6mei/c0W7uDS9xPg/P0GwfwP2R483KZl1eWFnFLn9W/tfEPMU8h6cTV9oSTnoVw9EWc
	 Z01/uWUKsJkGfV10JwIvUrV7ZndFbrzq3kHvOmogLflpCTD0DwMXEkmSwh2875qx2tHC0
	 71xAbXHs8Q/TWj5Ij7Qp69bPMvExb7TcNg/eVH55CZpVe/itk9xpsbWTrGGbLxiavwTmO
	 J4SNEcrC2HpWo9Q1kNKh0b0NU7Nv4ARRf9rXlbIN/BlbMxmt+WCfTAPWWx+Q8TEIgQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312173;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=w5IMEhy4okHKxHyGpwkRamhqKC6oRcjh0YGoxUqp7KY=;
	b=xtbIHdFi/QKsbS+vwakxWS2ZBHv5apvXKt+LORyTOna/gfF70RPDypSnHQWNSznJ+FPe
	 ha9wJYyZtC1e8feJcU9x1HwvI+MyK0ONjGK3w9dsCW/99Mbw0hvlBAveEEp9wnVCtIWHM
	 cBjr7zoylNWo0rXTmc+AqLig6TVF9FBNYBDncQGbQBIV7Dc7Br+JQv+vFuQwTavlrDLNh
	 VdpkZvXMo5xyZPIamAyc2rMAEprHxYQ3TPeYL9Cj4d4yd+OaXwBQuhqqXvhNj/XGfgIiZ
	 78DJmsRP2oj+DW109VtSnWpJC21myQS7qpT7W+/nA0kxggW50G+7SZIT15wGOJhKxhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W4W3Ie/Z";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5C3606A332;
	Tue, 10 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5C3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W4W3Ie/Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794312173; x=1825848173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HhAUpNuzDozuVjdF12LqWeLLpGws7iUzN3G4eEtCwpk=;
  b=W4W3Ie/ZTOhfDceUYt/hfGTR9WEnF3IxHLCZROpY0nzYhYadsW0UBL22
   FJZMVpnqdZGL8YulX+F93KbHjrzM0s/dQsXWktfqmBAOydBOizj03Shz0
   9+Ie+4gytcOFmzh/2qWXKB378vCqnsZJ2L6c8fUe9wL2ku/aYTiN4ELGK
   BCDYqpcE2F6Y/KHOrN0HuBWMTjMotGO/WonZQ1GoY+BZOzx+CG7Zx7W2s
   9jXxNH6dBpXb9afRxeScTYil3WsLKsFToTPsO0FkrN0G14Ms5zENofq88
   kEW3RQdQ5mGJBD16qMeNgQWfPZQYX6+3mMA6mCRpAiSQ+gPpmuRV/Rhph
   Q==;
X-CSE-ConnectionGUID: 9xoshxrkT6Gfb1+SnOyFSw==
X-CSE-MsgGUID: 3BTVNRAsTjuo04ME/zTAbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3156162"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3156162"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 04:02:53 -0800
X-CSE-ConnectionGUID: ZqmuHCDMTKyLwUC/7lBmqg==
X-CSE-MsgGUID: A8Fj9ojISPexeUfkUXUf7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8174905"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.11])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 04:02:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0CCB6121B7B;
	Tue, 10 Nov 2026 14:02:46 +0200 (EET)
Date: Tue, 10 Nov 2026 14:02:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>, King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: amd_isp4: add the OV13B10
 (OMNI13B1) board configuration
Message-ID: <avMH5glolytc9L86@kekkonen.localdomain>
References: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
 <20261103155313.114347-3-saif.elden.hatim@gmail.com>
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
In-Reply-To: <20261103155313.114347-3-saif.elden.hatim@gmail.com>

Hi Seifelden,

Thanks for the set.

On Tue, Nov 03, 2026 at 06:53:12PM +0300, Seifelden Abdelmonem wrote:
> +#define AMDISP_OV13B10_HID		"OMNI13B1"

Any idea who allocates these HIDs? Omnivision ACPI ID prefix is "OVTI" and
"OMNI" is indeed unallocated. I presume these HIDs have been "allocated" by
AMD? This is not the first time something like this happens but it would be
good to avoid it from happening in the future.

-- 
Regards,

Sakari Ailus
