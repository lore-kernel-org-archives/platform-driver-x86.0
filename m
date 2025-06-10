Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6961917CD
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541766; cv=none; b=VWYArQZTASvag5hvn8FqDdTOV670LjEyzOSojL6YqvNj9x4fQHoEErbVG/pscQ//hsyPI9C8ZLywFGe3ss7Kw90Za4X0bi3PJl/GdAlWk+uJV0NPYjLU+KUNa1eVz9KSVXcGsOntHI9U9GxG6vbX2P53SD2B7WIlmxKSvpibaik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541766; c=relaxed/simple;
	bh=yPKc6T40B3XakMaNtWAXSn/mNIQG2MGHVnPLJ4GwDnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tWT2ddy8TUSEbhR6RWpPHFLwiQr4PYfh6RM5GVdPNDclTMI9A45s4tIeb/qj9VqcLROWzdtXEZIePwD0ss+NDRPy+mf8pEPDSTQdTfwOuoSoeWrs0ChGeoue419WPtLCcgJ5JXPxkGB4sk9rBdeq0VD0VrksBPRaOgZ+XOxz05c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ3JFylv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ3JFylv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749541765; x=1781077765;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yPKc6T40B3XakMaNtWAXSn/mNIQG2MGHVnPLJ4GwDnA=;
  b=HQ3JFylvI17qv4H52PQS42GfQ9MqW3wT9HRFdRbli3PI7CI/STLxowCN
   a4NAN0OklVaWH5gKTfTHyogJnphoQkBWPaYTTkUtwNfiy7VGYhpP6UCmS
   kCLfXDoWP0j1bVkKoRumWqgTIxm7UoLWKzAG8hoQSUrDSe8h/FVBUJYcm
   9oZQy7XcvSb2P2h9V7gAfq1AFJLPjsuY2gjG5wqzAQ/fGDzDDsCHEwm3p
   duLhaJzHESgA1/rJD//acs51AOPx7Sm+pqtD9jHA47+JORFF8wHKWS0ln
   Mh8sKs5YCOmbMyvT2nzn0oByorzETjcKlHb8ge2p2jh9vowFHob15AqJ1
   g==;
X-CSE-ConnectionGUID: 0chC+yeJTIeITczQ64e4vQ==
X-CSE-MsgGUID: pXtuEDexTZytL8lscFy1kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77039677"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="77039677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:49:24 -0700
X-CSE-ConnectionGUID: 2VLw2jESRHe7PZ8unJJjrQ==
X-CSE-MsgGUID: CL7Ph7xRQ1qTfowrP/tWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146682160"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:49:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Mario Limonciello <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250522003457.1516679-1-superm1@kernel.org>
References: <20250522003457.1516679-1-superm1@kernel.org>
Subject: Re: [PATCH v5 0/3] Improved cleanup handling for amd-pmf
Message-Id: <174954175075.5583.9150193625762056673.b4-ty@linux.intel.com>
Date: Tue, 10 Jun 2025 10:49:10 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 21 May 2025 19:34:54 -0500, Mario Limonciello wrote:

> I noticed some memory problems with unloading and reloading amd-pmf.
> These were root caused with a double free.
> 
> This series cleans up that double free by switching to device managed
> allocations and also fixes other problems observed in earlier iterations
> of the patches.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86/amd: pmf: Use device managed allocations
      commit: d9db3a941270d92bbd1a6a6b54a10324484f2f2d
[2/3] platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
      commit: 93103d56650d7a38ed37ba4041578310f82776ae
[3/3] platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()
      commit: d7186dfd41924ef01ef490be5b82ab63cc417b31

--
 i.

