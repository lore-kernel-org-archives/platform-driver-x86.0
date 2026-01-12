Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05235FF72;
	Mon, 12 Jan 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232045; cv=none; b=e3cKitw3ulOmWaMcHoGHa19zgcpclUNiSjiPP/HKwEtH/sgCVbfNuP2nWHrDyzgwt2OUnVAP7VlUWqV5z87RLYpnfQK5zvCNft9wG/SF/PFUkrdGSP2Ewe3HN/N++YNutc2Lh72TepUH+RJkICLKG8gDKVOdB66G3ePIYPuTBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232045; c=relaxed/simple;
	bh=2rQILFNuDH4pC0hf4eIvOmGQ0huaHLjCiqQPmcRnehk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RaSVd/vfvLXfQDx7lIEZ+8S95geudEcjnwdwL9euUf/6oLnnXR/ZveUFfsKw1qRfjGgkUhFlasDM7sa8M1T+eItkkUdPXQwec76z7m67LEsXv5GYcIPWekkRMSy5iqXux/jqU6sRVWtcaZfZfh/l9pyEsxFCDFLOZGE5LQbCUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuP9xE6Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuP9xE6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232044; x=1799768044;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2rQILFNuDH4pC0hf4eIvOmGQ0huaHLjCiqQPmcRnehk=;
  b=DuP9xE6Y8riMlVmoKoxeknXcwWOWctpTPluvXjwEnkJI+fwgVoRe80+Y
   N6U5WiyZq+UU+e8NnjuBinB8SNTfVLbpCGfQFVvExF1bzcl7zheiFJEbI
   KsQ2O9/Il+F4tqOCJZ6BoirzE6TTeQ7n/d810rZOuOK1B84NZ/oyOU0LD
   RebPsGTb0xU3ypkJUezS0X1V8E1eW5IjKcw3Y46B7RbmsnO+jIppMyFon
   w8VvzKSQdJf4ffqtD8JjToXXzGgodSSEgZUjOahLlcCqOp4S4b/z9ASYf
   NJKSGcA5rfTvHn0a7C33Cpkc55PzjOEX/cMRGNm5rg/rV+O0J4bDqwjVw
   w==;
X-CSE-ConnectionGUID: zCp2zQimRdSC+lQ66RTofw==
X-CSE-MsgGUID: nt9FPXnFRKuoAUb3Yqljwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80147109"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80147109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:04 -0800
X-CSE-ConnectionGUID: mCAiURrrS1GuDVf3OHgxpA==
X-CSE-MsgGUID: xjW634tsS7SOxgBDWuCZcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208636302"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:34:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260107060256.1634188-1-srinivas.pandruvada@linux.intel.com>
References: <20260107060256.1634188-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 0/2] platform/x86: ISST: Fix for write lock and
 suspend/resume
Message-Id: <176823203763.9723.5243670404691527685.b4-ty@linux.intel.com>
Date: Mon, 12 Jan 2026 17:33:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 Jan 2026 22:02:54 -0800, Srinivas Pandruvada wrote:

> There are two issues, which are not urgent as the current deployed systems
> don't support them, but need fixes:
> - Write lock- Even if the TPMI is write locked it will still write to MMIO
> - store-restore data during suspend/resume: Not storing and restoring data to
> all power domains.
> 
> v2:
>   One minor fix for new line
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: ISST: Add missing write block check
      commit: 51bec3adb6006e070fefd43a3fabcd4446b910f2
[2/2] platform/x86: ISST: Store and restore all domains data
      commit: c2cacb320ade6beca0e02d399a4385181409ebdd

--
 i.

