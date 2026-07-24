Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3188D5464D;
	Fri, 24 Jul 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907873; cv=none; b=toxiyNioiniUij89imgJpMSv4bemK8R64E8sa0AU0KrYgUH9XWeLQdgHG9KFXVl9ybK9Q7ja5cCOlVrSqrA+Cs8lR0brzteS/D5hIaXtPYSpjbn/IY2i5H7KczMvf/AIkrVzBswz43Ie3ZwJXq6yPNrdIUqDIvtppdjfySwQBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907873; c=relaxed/simple;
	bh=CXYFubIiFjll33ZZxcqSQS1B2W4I3BBBJAmNmcBn6RU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G4phhiFCApIPJKJKRoDA9uMJzc53zdHTg53mrgYyIG0x1amrAgkmgrB8+K2FSV5QHrIBostxvJdxtzqiX9y1fPFMRwGvzZh1uvnupVF+vuCY/dxr9n8zXil/qzrfhNBnkVlOQLLltYAwcjuav4sO+3A4y917dCHv9/bCN3fMgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2I+SsTy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2I+SsTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784907872; x=1816443872;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CXYFubIiFjll33ZZxcqSQS1B2W4I3BBBJAmNmcBn6RU=;
  b=k2I+SsTyfSOuDS/QCs493wOLf53lKZq0p2JW5368+3vGxKb2c3kH3yvR
   PpIbPuVBuP2LtsOw042dPXIdRVvuo8pBH9i77mA5b3xNGNFqRem77wNzV
   sLYHMTuVGkoiQHt6ydnitJV3FcEGkLYVLX6OIL+lLa3CZ4HIFZoi6/7Mg
   Vq8UfHkJUWIBeRTeYBbWpISzXC+8hT5ij/e3env7mnSGMd0a1N/w0IzWh
   NACJ8MoHh04UXdxSCmWyxV8v+SnbmdqB1rhU01GXp7fQbXmWGOgDwL0RQ
   L+PQqVGKh0mG+mW+NeBbYaYf5JZYmuX9/GumNbZOA19/u6RdQl33U1leR
   A==;
X-CSE-ConnectionGUID: EmpNYUSmQY+RnY81H0+q9w==
X-CSE-MsgGUID: cxtFiG83Q52Uh7Elmw8Ldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102985963"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="102985963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 08:44:28 -0700
X-CSE-ConnectionGUID: CnvfeO4nTjyTNHQiDsI6JA==
X-CSE-MsgGUID: 6NzFpOdTTfi/fUx8dhbPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="263053652"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 08:44:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 =?utf-8?q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260723172734.18361-1-hello@kursatabayli.dev>
References: <20260723172734.18361-1-hello@kursatabayli.dev>
Subject: Re: [PATCH v5] platform/x86: hp-wmi: Add GPU MUX switch support
Message-Id: <178490786105.16604.17883024255856963597.b4-ty@b4>
Date: Fri, 24 Jul 2026 18:44:21 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Thu, 23 Jul 2026 20:27:34 +0300, Kürşat Abaylı wrote:

> Add support for querying and switching the graphics MUX mode on HP
> systems via WMI. This introduces the 'gpu_mux_mode' sysfs attribute
> under the hp-wmi platform device, allowing userspace tools to check
> and safely switch between available graphics modes (e.g., UMA, Hybrid,
> Discrete).
> 
> The hardware capabilities mask is primarily read using the modern
> 128-byte System Design Data query. However, to ensure backward
> compatibility with older models, a fallback mechanism is implemented.
> By mirroring the behavior of the Windows Omen Gaming Hub software, if
> the modern query fails but the MUX WMI endpoint (0x52) responds
> successfully to a read request, the driver defaults to a standard
> Hybrid + Discrete support mask (0x06).
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
[1/1] platform/x86: hp-wmi: Add GPU MUX switch support
      commit: 59f586eb9394c7697cfcd2e1bb172c95e772559e

--
 i.

