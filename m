Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74AB9475;
	Sat, 29 Nov 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764423152; cv=none; b=iJ73UcvKV8iPxUc8XfPC78/GXMg3vtTELycmPET9SXzm7XroKjAgFQZLZRi5voIvVHroXrq07c6bE19wj/3D1Rqyo+I6regTl522wSK1XD+LrSLhjRv4HUo8WZh5RZXtEJr05vUdJ0LIL3F0CSfv6mQlaNUf7VK6EnYAk2KQRfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764423152; c=relaxed/simple;
	bh=yO4SrGnx2atHeKbSYXaOxMk6bdsgnMBEAlB77I1WTbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlPHwTwIXBJJpAqop2RBMr8n0reWhCc7jqMrZgm+za6bPCwBZjS4HZRFoVJuTUTAFBsVV73u1GsU2Rp1UPGCuvGfRfVMsNx/s6KU8tVCZ0AwvI2n8nagJc5ZN8IDkv9VI10Moqq8l/dsY8EMTcpb6v8/ZV6/FELV1iYX94/Lyvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LakU6Ynn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LakU6Ynn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764423151; x=1795959151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yO4SrGnx2atHeKbSYXaOxMk6bdsgnMBEAlB77I1WTbs=;
  b=LakU6YnnqDdujJ9QAHh+b72RYtuEb+CRKElH8OhrxNO9wBmJzR810rAd
   6ucwfBzSjvyQJKl16tydwij0bMN9+2REco2gHtt+3VOV9rQrq2+7NyqrD
   8XXQcwKLn/+b84u6OdyC+AO5yiQKDnJwhtFjja7yu5CPLL6jGJd2wi9V9
   mjbex2BwEW3eFTpvlAsPghChJYRlVVtcwev7qSycIWJrR7FK642L+a9bg
   DN+N9oi24kSoKt+1+U2reyizc1wTNtKkoVkPoanNFuG40aBWVE6jJ0zgb
   EsVozWyYWz+nBflGKcrsbB/IfYsQ4jeRkFyf8kZIvzhyZOr2mRN7wCiI3
   Q==;
X-CSE-ConnectionGUID: s9Bp3HE4TOu2ADOpLzfH1A==
X-CSE-MsgGUID: MzAn7bd9QB+MtgU7COO1oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66371076"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="66371076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 05:32:30 -0800
X-CSE-ConnectionGUID: lVyAHPcLS2KWhjW9rV21YQ==
X-CSE-MsgGUID: SBVMMQ7aT5+N481sGFPq3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="217017199"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 05:32:28 -0800
Date: Sat, 29 Nov 2025 15:32:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anton Khirnov <anton@khirnov.net>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jian-Hong Pan <jian-hong@endlessm.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-wmi: use brightness_set_blocking()
 for kbd led
Message-ID: <aSr16ek8PFuT3vPG@smile.fi.intel.com>
References: <20251129101307.18085-3-anton@khirnov.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129101307.18085-3-anton@khirnov.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 29, 2025 at 11:13:08AM +0100, Anton Khirnov wrote:
> kbd_led_set() can sleep, and so may not be used as the brightness_set()
> callback.
> 
> Otherwise using this led with a trigger leads to system hangs
> accompanied by:
> BUG: scheduling while atomic: acpi_fakekeyd/2588/0x00000003
> CPU: 4 UID: 0 PID: 2588 Comm: acpi_fakekeyd Not tainted 6.17.9+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.9-1
> Hardware name: ASUSTeK COMPUTER INC. ASUS EXPERTBOOK B9403CVAR/B9403CVAR, BIOS B9403CVAR.311 12/24/2024
> Call Trace:
>  <TASK>
>  [...]
>  schedule_timeout+0xbd/0x100
>  __down_common+0x175/0x290
>  down_timeout+0x67/0x70
>  acpi_os_wait_semaphore+0x57/0x90
>  [...]
>  asus_wmi_evaluate_method3+0x87/0x190 [asus_wmi]
>  led_trigger_event+0x3f/0x60
>  [...]

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


