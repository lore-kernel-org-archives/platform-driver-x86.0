Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB84A3D4E;
	Tue, 15 Sep 2026 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475201; cv=none; b=PqHj+hrnOn2ZO8vR2EDaU578ZrAaDuIO2Z5gjmN+zdzw8ZzceRSaqiJt0X4KRjPgds/F9BVAtgcMh/osrI+RKuYmievVQ8YTWXrYenzZP0TRN8oGb29e5fIGIaGmSViJ0HDeb1QaHdogKdragRf9H3XCqdLko7ywqmNuJYvKH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475201; c=relaxed/simple;
	bh=A4/6+kF8RuDC8yrL6PEbqZxi2axYHdvcQB8Cumovhjs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gswkBO5DQSdOvUV3wLHDNtMf8W2DK56GVAR1T2d9dyfYAoza0nld0CK6QILJ9YIjwKpIU0J5ZYKGhn+GaRZ7q5XTxayeDuhOdnEtqYc1KCjlB+0+olRBk6TFe8bHbOUlUZ2jxyaZfW/ehZFlUzeJTnnho0cQXiPiW08kyAADY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1k+bbbY; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1k+bbbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789475200; x=1821011200;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A4/6+kF8RuDC8yrL6PEbqZxi2axYHdvcQB8Cumovhjs=;
  b=C1k+bbbYRjwk8XtAWzXpYZfJGwW7YF5NAEG7lwLWJ5wssnbfMDELDpKX
   fC/3IJvKdURl113mc55gFGMWvqZ3TEtvNNtPfnF+1y9IEPpMrzw0kbx91
   g6HD67JOUVass9adsWTK6KaHuUfigp58i2TgAcAysm9u7eORHM7V7HFIf
   J8leCADTPKGD02+L1g4CRUSYVMtZN5HGjmNXzKpmCg0Xux3n/rwYVwxVJ
   nyNWKnkR/mGKlg12KILcTxqIOoHK5ihG97fZlp5j7NcivqlxMtZA4CjQR
   fdaiS1eFayABMjxVo9pxt/hw9criC/9ZGGaadDmTy0ytr3kkFBDu7MHqu
   g==;
X-CSE-ConnectionGUID: rz0JHls6Seuv2UQ22pzMhw==
X-CSE-MsgGUID: PSNZFRUHSBmfNvf+869gaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="346216"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="346216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:26:39 -0700
X-CSE-ConnectionGUID: teEGA6qZQPyDxlt9m9EkLQ==
X-CSE-MsgGUID: ySZU+udyRlC7ZQn0ZmQNhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272517499"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:26:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 15:26:31 +0300 (EEST)
To: Aleksandrova Alyona <aga@itb.spb.ru>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    "David E . Box" <david.e.box@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, Darren Hart <dvhart@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] platform/x86: intel_telemetry: initialize default
 trace verbosity
In-Reply-To: <20260915122107.9784-1-aga@itb.spb.ru>
Message-ID: <4ab722af-756d-0c68-3b25-4bd38e89cdb1@linux.intel.com>
References: <20260915122107.9784-1-aga@itb.spb.ru>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Sep 2026, Aleksandrova Alyona wrote:

> telemetry_def_get_trace_verbosity() returns success without initializing
> the output verbosity value.
> 
> The default telemetry operations are installed when the core driver is
> initialized and again by telemetry_clear_pltdata() when the platform
> driver is removed. The telemetry debugfs files can remain available after
> the platform driver removal.
> 
> A subsequent read of pss_trace_verbosity or ioss_trace_verbosity calls
> telemetry_get_trace_verbosity(), which may use the default callback and
> return success without setting verbosity. The uninitialized value is then
> passed to seq_printf().
> 
> Validate the output pointer and initialize the default verbosity to zero
> so callers never use an uninitialized value after a successful call.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 378f956e3f93 ("platform/x86: Add Intel Telemetry Core Driver")
> Signed-off-by: Aleksandrova Alyona <aga@itb.spb.ru>
> ---

You're missing the information on what is changed in v2?!

>  drivers/platform/x86/intel/telemetry/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/telemetry/core.c b/drivers/platform/x86/intel/telemetry/core.c
> index f312864b8d07a..62299524a07b2 100644
> --- a/drivers/platform/x86/intel/telemetry/core.c
> +++ b/drivers/platform/x86/intel/telemetry/core.c
> @@ -24,6 +24,10 @@ static struct telemetry_core_config telm_core_conf;
>  static int telemetry_def_get_trace_verbosity(enum telemetry_unit telem_unit,
>  					     u32 *verbosity)
>  {
> +	if (!verbosity)
> +		return -EINVAL;
> +
> +	*verbosity = 0;
>  	return 0;
>  }
>  
> 

-- 
 i.

