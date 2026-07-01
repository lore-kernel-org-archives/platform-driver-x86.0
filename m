Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78368477981;
	Wed,  1 Jul 2026 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905417; cv=none; b=AS1uDPCsbFS4NTuPN5Cwa7ZDcfE+gW/CU07uMtFCR+EdLN0cH3+l17QqGE8GvijZ7u9jSIFXsm/XtiFKajwis2jFm+vP82Wo6kKCDyRBrAZgLxS2rcYRVv7ObT8jYFgiFPCZz+7jqs8Bda3HlYzu7fEvZJP8m1O55EYiRLD64bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905417; c=relaxed/simple;
	bh=qrKrMxoZfIz/oFOspOAtPaTHDYnEARAdZUzYY7TJr78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jm1Xdt1z58zkYHgiR0OTS+hDEnfiH/qxdhhHBIbp+882+t20htwRBwhdRs1RQJE7IABi657FdVxsqkuYHsKTfgzvhU5xksIoGKMmJIviB470KCfLGqNRdqS249rCr4ewYIIKlWz6BGpc9QqjE8fqxfHmpPgILDfiHHsb766i+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSI3nK/W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSI3nK/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905414; x=1814441414;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=qrKrMxoZfIz/oFOspOAtPaTHDYnEARAdZUzYY7TJr78=;
  b=KSI3nK/Wqvvfd63UimrY50hPUOwsZXhglGu0CpOv6ePZmG9FQbausoVN
   SPG1nQfAxYG6+ctIPyOlj2LKXTkl4Sa5P4j6+39wSXpc/gPHaHtkKI7GY
   YbppT/DZo+SOA3eeXzZf2fF8Qa6i/FHwU4cnlgNuWOdaK5GwthEBUGNlx
   SNpwclHeeZRAUMxGTGWaSXFU2P61c8m2I9LExy9xiUGPpslb8dREfkOWA
   GHKRvK6p39dl7h5Mhzoq59s9AzPkp8ShFl+RY3h4ZM50DX2PPncchLA4J
   dsbhXb390yig9izgpdQ0usySByBv68ztaftWU5t7T8mbqMQ+IGRQxd9E1
   A==;
X-CSE-ConnectionGUID: n8FJoi5LQKiCVsm2ikleTg==
X-CSE-MsgGUID: 5gaMD2G7QBa/8qdo3W0C4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87548610"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="87548610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:14 -0700
X-CSE-ConnectionGUID: H4+aYQhrSQiHk1WSMpQL7Q==
X-CSE-MsgGUID: wgDa71NBTNGbXXPzWLS8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="248568099"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 David Glushkov <david.glushkov@sntiq.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260528183358.552782-1-david.glushkov@sntiq.com>
References: <20260528183358.552782-1-david.glushkov@sntiq.com>
Subject: Re: [PATCH] platform/x86: msi-ec: Add MSI Raider A18 HX A9WJG EC
 firmware
Message-Id: <178290540810.22449.17403244930780078557.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:30:08 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 28 May 2026 20:33:58 +0200, David Glushkov wrote:

> Add support for EC firmware 182LIMS1.111, found on the
> MSI Raider A18 HX A9WJG.
> 
> The out-of-tree msi-ec driver probes successfully on this
> machine and exports the msi-ec platform device. Without this
> entry, the in-tree driver rejects the EC firmware as
> unsupported.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/1] platform/x86: msi-ec: Add MSI Raider A18 HX A9WJG EC firmware
      commit: 2f70f3d2fd3d9e0e36348386a660f77d19a294a6

--
 i.

