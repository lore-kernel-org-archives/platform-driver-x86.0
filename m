Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0352313E14;
	Mon, 23 Feb 2026 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864454; cv=none; b=QZb0hHU8ozYV3vTQ4TvrfQVVuPictUnwR8Gt7cx68rqIL6ijzJgzFIheeuio5P2U/R2+HoH+9H+JHnj7boPFKOKU3wvytYWqjW+JIl/ZwmPKNYO3RpdelghaqE5DDnn7C+6fvDl5tXeXCRiK7CGCByeIaxCSWTIqRLutecTFc/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864454; c=relaxed/simple;
	bh=2JNHvhghUA1/5UhO/9LPfWuiDnbTIdU4niaE2Q4q0RY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IOsbk0NG67of5TpBKjDEbOd8RvOm0ghJtmfXlI+ChIrWJUOIiPkThGRVtF0QmmWzEGXYX3+94putcNPQ3AA41VY76DlLd/kuOFY1bMCQlZWAGLf12ebLnGt7p1DSz01mguMDEI1e+PsohU2GYH1OLgojZivJGH7Khn/Xc2T1IyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5XEIjyb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5XEIjyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864453; x=1803400453;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2JNHvhghUA1/5UhO/9LPfWuiDnbTIdU4niaE2Q4q0RY=;
  b=Z5XEIjyb5SYcFjvR7Iq0K0kILmJTCsv+8Pt50nQZ9IqfwQ0RCaro1Lxb
   vAlAcSCqgbDkAcIoV0BDemL8d2fNd2oPGEgxFU6DYqDQ8+ISX3pw0vmyA
   UodylKRcgPEAeaalWKDPktlXQpMUaM6el/LHdxJdRE5rukSIeOoB45Y67
   9QYn+ib1VulOh7y7Xi1lO6qx2TYsfouHxHT4Q3LUrznfPDOaLUdtzralA
   ojOZJMFv6XhoPH8oYG6NGudrF/QB4rU8o40bAtQMn6ODIT5qxnP3kcEeT
   ClmAwS2GIK8bt9d6pjwKLc/o14NdbO3tgBUJV0gFWezmXHZ32pYAKhhQp
   g==;
X-CSE-ConnectionGUID: nF6fVZUnQVi8n6Al66QWvQ==
X-CSE-MsgGUID: EvYuxmY1Se+mKLBWONtEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95481702"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="95481702"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:13 -0800
X-CSE-ConnectionGUID: LNi/oT9NRRGdsaovz7aHTQ==
X-CSE-MsgGUID: sN520Ev0S061uVTZs9eBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215638047"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:34:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: alexhung@gmail.com, hansg@kernel.org, 
 Peter Metz <peter.metz@unarin.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260213044627.203638-1-peter.metz@unarin.com>
References: <20260213044627.203638-1-peter.metz@unarin.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to
 dmi_vgbs_allow_list
Message-Id: <177186444423.17917.14945673795280235334.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:34:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 12 Feb 2026 23:46:27 -0500, Peter Metz wrote:

> The Dell 14 Plus 2-in-1 (model DB04250) requires the VGBS allow list
> entry to correctly enable the tablet mode switch. Without this, the
> chassis state is not reported, and the hinge rotation only emits
> unknown scancodes.
> 
> Verified on Dell 14 Plus 2-in-1 DB04250.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
      commit: 6b3fa0615cd8432148581de62a52f83847af3d70
[2/2] platform/x86: intel-hid: Add Dell 16 Plus 2-in-1 to dmi_vgbs_allow_list
      commit: 857f5036f8fd729e097efbe3ba421b75e27346cb

--
 i.

