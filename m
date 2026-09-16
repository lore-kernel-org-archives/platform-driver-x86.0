Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D144F30C8;
	Wed, 16 Sep 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555007; cv=none; b=UFMBoWrYIhGx1OWXD2/9zLnaWfEWNNBSwyu+IV2+tUrbCUYtrLNU8ETYSQVNLelkf/dIV7aJuQ+teTpQ+Owo0CXq8Z+msaTOyG4KMMkIeJ6umqY91RXin6YKpc7lDPTDquL1TCLOIZr1+eE95Zk3BXu0Q7r+6RZYQWE/j32GFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555007; c=relaxed/simple;
	bh=It6pVWCOEJQoZAi/+GplMBQtgO5LmFvL6bcIc9a7iY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NrnQ2TRAfJobZzYZ91BgiI7OvAlVevBXaFPeeu/8CFJTjC2rNsgFijWsTl3iRKo6MbCidU9pHY2POmM/DH0fonYaKlXVGiJdjh63fiBT+Wr0pKf3RYH7VnzrigiJnxSy8z32c6sZzK9smDpRtdmFaF9KbdovX77glZG0bodhpKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3Gkz4tn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3Gkz4tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789554998; x=1821090998;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=It6pVWCOEJQoZAi/+GplMBQtgO5LmFvL6bcIc9a7iY8=;
  b=n3Gkz4tn+q+nkdlFN1Iveu7nfPwcJ7slG5RykOR9fKHVLRZAOiQx3Zo6
   1PSGcjmKJyklDHit+yDkvyn5QollB3BorYfDZWidVwUeG1bNIer9GkKIw
   V7UToqi3yE9Tq3/zltM291MrQUXEBi4T78K0FbL8L+CFoIHwt97bfFrPn
   /98DFyjuh6SOoAiBUHHaM2VonAMgHKfutO6TmIt1DqS2sAvMNsXRQnB2r
   xrVwRlW76rzojSDCUaoLnnbIRB0ghAayR+UXrh6SKkg5gRlhgBhQKUfYq
   xj5ApPFQ2E5FYKiRrbH/SvRrLnXMBTdQKIZPtVqKzh5kgKjzK8gPI4Ga8
   Q==;
X-CSE-ConnectionGUID: FXdLUV5nTvqN0aqbjCwCOA==
X-CSE-MsgGUID: nwUmOCIFQjGOhZxonoTBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92434674"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92434674"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:36:31 -0700
X-CSE-ConnectionGUID: 9suvTPxqTEeSSMyp38x5vQ==
X-CSE-MsgGUID: zrmIQs5ZQX6tFckbvQ9H6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1524209"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:36:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Hemanth Selam <hemanth.selam@gmail.com>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
 W_Armin@gmx.de, eric.piel@tremplin-utc.net, kenneth.t.chan@gmail.com, 
 jlee@suse.com, srinivas.pandruvada@linux.intel.com, 
 mpearson-lenovo@squebb.ca, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Subject: Re: [PATCH v2 0/8] platform/x86: Fix typos in comments
Message-Id: <178955498348.1723.15488888459425072981.b4-ty@b4>
Date: Wed, 16 Sep 2026 13:36:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 10 Sep 2026 10:14:35 +0530, Hemanth Selam wrote:

> v1 was one patch touching eight drivers.  Denis Benato asked for it to be
> split one patch per file or driver, so here it is as eight patches, one
> per driver.  The corrections themselves are unchanged from v1.
> 
> The words all come from scripts/spelling.txt, which is the list
> checkpatch.pl uses.  codespell finds nothing further in these eight files
> except "ALS" in asus-laptop.c, which is the Ambient Light Sensor and must
> stay as it is.
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
[1/8] platform/x86: asus-laptop: Fix typo in infos_show() comment
      commit: 3bf79c45d88b54c9a76f8bfb6733249acfc3c8b7
[2/8] platform/x86: asus-nb-wmi: Fix typo in asus_nb_wmi_quirks() comment
      commit: b6cf8c621b85648b82a6704b1a68106eb193616f
[3/8] platform/x86: hp_accel: Fix typo in lis3lv02d_acpi_write() comment
      commit: ad483da2140339400bc50c69b017f6fd0cc9774b
[4/8] platform/x86/intel/tpmi: Fix typo in TPMI_FEATURE_NAME_LEN comment
      commit: 65d3f988c5fae277a3ff732115697d252d5b3913
[5/8] platform/x86: msi-laptop: Fix typo in struct quirk_entry comment
      commit: d11503cd82f48242ccaf7b3d481a103d1a75105d
[6/8] platform/x86: panasonic-laptop: Fix typo in the file history comment
      commit: d766ef2dab2d718ca760e4f1771e883736ccb861
[7/8] platform/x86: samsung-laptop: Fix typo in sabi_configs comment
      commit: 0934b4b77a462240d591f90472b690788b3988b8
[8/8] platform/x86: uniwill-laptop: Fix typo in the kbd LED brightness comment
      commit: 974014bb4087fea3b481c0ac358873587f628663

--
 i.

