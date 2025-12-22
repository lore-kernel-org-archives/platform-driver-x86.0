Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19BC2E8DEA;
	Mon, 22 Dec 2025 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414612; cv=none; b=rOa3/ozLdMtzJ73t9TPB2MF00S8NavRBa8EW+Ux/W7coEP+UDuE9LBPSKFt5G/yG/F+wa6LdwGJRJMZbfdMauzoM90A7TPZxOtyM20I5aoZayJLbgZUUSmVHKCxeO4k6bSsdr5vCYbe67hDFsljtxKECmlorNxqQePuGBwrJnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414612; c=relaxed/simple;
	bh=juAqyrruV3GFPoKV951l6jiYtYE8wtB+VzmkTbjjKws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UFizGPQ8EHeUFue1nYAngveN5lN/Z0IQtTN6vhkDG00o8xPqCrHm8hRYyWTA4iiz1h6wupwnzzzxJoze01f03i3YZoIBh0JFDp3nV9fx/wbs1HvnE8wPa64Hf83ztr3N0SuGOb92AbJ/JsLIvIfW9j7iDbYrEnIy0c6zBdmnOJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Af4YlGsF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Af4YlGsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414611; x=1797950611;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=juAqyrruV3GFPoKV951l6jiYtYE8wtB+VzmkTbjjKws=;
  b=Af4YlGsF8DoGTZKhLT8lOX8mqOZoUjN36xbGXx8SaDROP0OOimEcWgYc
   pZxaaKkIxFap77z9/jriQMSCTxzZ15eazC0x38iq7dlRFJwgg4UKo2Wrg
   yPi6H/rGnBEyKNPwBNsxjSFGo1JJj11gwdZoFQMh90XPmi7z3S2nsynOd
   cUB2Nv6n4Ej8Lx30J8OmNJrds+uNuijOonHUmY6JONIYbBalN9FAXYybS
   v17UvbHgnQjjCtrCvCYi1As4//RMe+nFhKJFqvekPT1GMzQr5xRJtNOGp
   Dec3x3nzoZDRClbhQ9FVqpLXFgwb0KCGdV1cpmueR4Jf+LYYgiEO1xVhS
   Q==;
X-CSE-ConnectionGUID: 4DUjaYfgSrGI1iwOj6+l3A==
X-CSE-MsgGUID: E/3/+vmNRMSbVOhCrN+BLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68150863"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68150863"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:30 -0800
X-CSE-ConnectionGUID: 2Ia2C8hKRI2j/WGnhXCPdA==
X-CSE-MsgGUID: 58vLnH5VTHmmi55GwXdbbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200042766"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
In-Reply-To: <20251216063801.2896495-1-rdunlap@infradead.org>
References: <20251216063801.2896495-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] platform/x86/intel/vsec: correct kernel-doc
 comments
Message-Id: <176641460369.16407.5613191397256413657.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:43:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 15 Dec 2025 22:38:00 -0800, Randy Dunlap wrote:

> Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
> warnings:
> 
> Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' not
>  described in 'pmt_callbacks'
> Warning: include/linux/intel_vsec.h:146 expecting prototype for struct
>  intel_sec_device.  Prototype was for struct intel_vsec_device instead
> Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_size'
>  not described in 'intel_vsec_device'
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/vsec: correct kernel-doc comments
      commit: 20e20b147cf7cb6780a5b95da2a0e37c52cd1015

--
 i.

