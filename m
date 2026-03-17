Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368F3C6A2B;
	Tue, 17 Mar 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752427; cv=none; b=ISzOApTrp6M4ThE/fEV/S7sNoSYsLg7k49++K9lWERV7iZEi2Hy0bF7W50nV8gyj6lvDLOz7aQUTSQOZCDLPlPmDGtaiEZ70vlbf7QcOjxJ26NgBtkrOy2Fv1D1C0+HPE43S/fIrwJF7/r8+0MJ6I/+fV1nGaz8Bbrulu1UZ11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752427; c=relaxed/simple;
	bh=EaeZHpY/1A8lhOVhle+UHdYnV1fwfHhdGgmbw4I9l6I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FeTdFDA9qfMM7HyfR8wrauJg3CmnyfaKLJCU5GE+zNwb4gwaOk5lnlDCb7+GrLIji2/USkO1Mcgb35tNPaY2MrmV2nNx2ZYMYSqWmUZ1TqUZewoAHrR6vMXiejYTErIgSvKEW0UMdNyD2MR1Gxl3k6pf6+LV8Lx4dJcu48jVMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jW4TuvPd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jW4TuvPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752427; x=1805288427;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EaeZHpY/1A8lhOVhle+UHdYnV1fwfHhdGgmbw4I9l6I=;
  b=jW4TuvPdIJ2D/GPl6Eu6bIkxzJnJI7piE8bPzcXH5wZ6l+VnbkLCGkgk
   TD2bKPBrGlbe98Rt5AGgvrHqVXxt69QyhumoQ03eyxUwBnZKTP5CXmqL2
   9MfrCumli2hrV+lk9Dpps5vmedY11UHLJo7/HHpz8uSGomHhY/jcXQNDq
   RJa1adrGKRLza7IqK0iK3M4qY8fU5zjn6+9s3JouSbd+sUP85G6dt0q/c
   9FBG093VrLJoV9tjdAR+eOZnHFTdC/yAt+vQGGq4vDpa+qWPaqLfEU6gC
   cjZ2gYfb5Ye8ZnxPQKZ2jjjX4PE3E5STcgXKSVnw/frC6dXZrDRcIDWAk
   w==;
X-CSE-ConnectionGUID: i2fjF8r7Q2eNI4sqHSg49Q==
X-CSE-MsgGUID: EQBQc6uaRCeliUl2/YFrqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85481153"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85481153"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:26 -0700
X-CSE-ConnectionGUID: 3eko9EZPTrqGVg7xBdq/Cw==
X-CSE-MsgGUID: CZ7FcPUASfG/XBMzP7RvDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260166173"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jie7172585@gmail.com
In-Reply-To: <20260227154106.226809-1-krishna.chomal108@gmail.com>
References: <20260227154106.226809-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-wf1xxx
 (8C76)
Message-Id: <177375241871.9137.5526511920149627794.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 27 Feb 2026 21:11:06 +0530, Krishna Chomal wrote:

> The HP Omen 16-wf1xxx (board ID: 8C76) has the same WMI interface as
> other Victus S boards, but requires quirks for correctly switching
> thermal profile (similar to board 8C78).
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C76)
      commit: 1f74bf1b37afa279cacda86845cf0db3a4856a89

--
 i.

