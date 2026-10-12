Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1164A6CF6;
	Mon, 12 Oct 2026 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820549; cv=none; b=qF5UEyHSYONWu6iRx70UaQ3AlTs+80Yo0AgLc378dNdbmk9YDTLsV+idkEXRBXHYUtkpRCg4KvDTiBHscGNBvkVt/ysuVgS+SkzSv/qYcSz6FzR+G2XaHOy/6H+7l24yv37wRilz3gLhu4SvJn9GISsyGuIBEXJxmtg/iDYrp9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820549; c=relaxed/simple;
	bh=b7C3hLkZZXq6bGDeHrp6VaM2y69O9anjrJ3/eQ61Vmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V0Xi2MxzExVC2AK77Ic5h2l1qwS4a/UDGtfMdiIlq1GsURqY078MIOFPq4l+lNQw1sOp7rfpZPvJt3i3enZZNCYQvBiLmxd2l4sYRqYl2PYQwBlLjoRzTJ0GCDVAo0JXgyPcW6g+kp00hiYrQwpbdiVQmIdFZJW4/FmY1/8/hBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afg7XW5R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afg7XW5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820548; x=1823356548;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=b7C3hLkZZXq6bGDeHrp6VaM2y69O9anjrJ3/eQ61Vmo=;
  b=Afg7XW5R/VitCrcVaeWd+12jkVRCo5q3cBYvqLsZxvsnxU/51L2cFdAs
   ODqEXQyiysrn3ifXFaZ6Z+KSZ/h0EO/1VmJZHLtJWsqjbWxcvTBEWdMth
   oh9Oy/mK5b/ORJewQFAjas/4SBITEAiGTW57nI27xc9O2mQThfSL43Mi6
   XbQvILx1lR8yWprmDusDWNjuAUztMY6v2n5vd9MlZ5P+4/8QLBHd2d9c7
   ssK99pxcaNPGcNQOCk2eIUaEL/PKZ6ErYJkTjlfa3ZKzUZsZvU8tSOR4k
   dO4fNJqPQuZ9X8iYrvjK5ax23J+IQtL79vMjBXtM41GU8v/sDHO2xOzsd
   Q==;
X-CSE-ConnectionGUID: IdrRlmOMS8SBLquOMnlSNA==
X-CSE-MsgGUID: CUmKGYMDSACzlmfqUQUqnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="544980"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="544980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:47 -0700
X-CSE-ConnectionGUID: MPPzgbKaRhW8p11BSGhzvg==
X-CSE-MsgGUID: 8ihOOmVoRFuRNKPjjf5+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="890224"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:55:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929181655.26105-1-matthew.schwartz@linux.dev>
References: <20260929181655.26105-1-matthew.schwartz@linux.dev>
Subject: Re: [PATCH] platform/x86/amd/pmc: Add spurious_8042 to ASUS ROG
 Flow Z13 GZ302EA
Message-Id: <179182053649.17897.10842011478760638051.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:55:36 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 29 Sep 2026 20:16:55 +0200, Matthew Schwartz wrote:

> The ASUS ROG Flow Z13 (GZ302EA/GZ302EAC) wakes up from suspend-to-idle
> without any user input. With PM debug messages enabled, each unexpected
> wakeup shows the EC raising IRQ1 at the same time as the ACPI SCI:
> 
>   PM: Triggering wakeup from IRQ 9
>   PM: Triggering wakeup from IRQ 1
>   ACPI: EC: Query(0xa3) started
>   ACPI: PM: Wakeup after ACPI Notify sync
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Add spurious_8042 to ASUS ROG Flow Z13 GZ302EA
      commit: 0a8ad16321411b45e49bbfb7986348790f3227c6

--
 i.

