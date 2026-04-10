Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C53DA5D1;
	Fri, 10 Apr 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838543; cv=none; b=srJhAg3OKG2JecKrzMDFzx+bJn+spisxMhlWx7tZDLk1rOYlxL/8epR4ZTtiAkkKGvNr5vhZHrY489x5nqDnIN3IpCDXffQ/vkW5+mN3fdaDXDDs4l1uWGWb9TGzWU6qVCUHA0dycV9W/EYEEowE0BjUPe0fTbSltFRbALUfcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838543; c=relaxed/simple;
	bh=HxlnTzmQEwEzy+olWItFMsc0s9YH082H7+y2XP6NFE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=awy/ozF2soqMPElFk1GRN2Vnm3pO01kwvdcF2wJOdL1rxuTPdMqmYiZVJEIaMkzShYbbD+THiXKxgoFlaeMtUbCRkRtLOAbyGNbQnFkl4zP3vlxtBt6o5Hvg/fRFG+0+5Y0rYZJgYBDfGEbuHAxga38jXs8jrYx/T6i9xsbPRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYpAU64u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYpAU64u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838542; x=1807374542;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=HxlnTzmQEwEzy+olWItFMsc0s9YH082H7+y2XP6NFE4=;
  b=DYpAU64uvUZlECIlGYYhH3/OWJ+wA0q1/ti1NFJOSlRDfZD5MC3DEzqw
   /EyQPaR1/JwjdEUhkk8Ht7JnKjueFYs6cGp+NOhamtC4zOfuY/Qzmo/Cs
   qQVmQxQ9TSOnx9da7HiYNNNBDkoseeeLnzXKY45N5moi9HFpCW9OmBjG5
   hj1bAYFlmA/jDmx4+DHljf+cB9EabOKZ7/Uq7cqCKlOx3HraqlP1dlnCc
   ZR6MPS1wz0vxZ57P1jkO0y5ICzDmAbTlraEEUl3NiTNGK9D4r6b/fWLqa
   uf50N5GjLJxpFnVvN3x2B4wBMkD5CNh3oVBDtKSp95860yfRUpmAe6D19
   A==;
X-CSE-ConnectionGUID: 4wMnYLQcRfOQWSjInFgpUQ==
X-CSE-MsgGUID: bTz5hNnTSKSOWkaa+7Meag==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76575852"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76575852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:29:02 -0700
X-CSE-ConnectionGUID: BZ8R5toDSKqdou/haiOdew==
X-CSE-MsgGUID: rvv4zb8kQsmirx2XLooySQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:29:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260406203237.2970-1-W_Armin@gmx.de>
References: <20260406203237.2970-1-W_Armin@gmx.de>
Subject: Re: [PATCH 0/6] platform/wmi: Use WMI driver core for size checks
Message-Id: <177583853473.14800.16471793286589917557.b4-ty@linux.intel.com>
Date: Fri, 10 Apr 2026 19:28:54 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 06 Apr 2026 22:32:31 +0200, Armin Wolf wrote:

> As suggested by Ilpo, the buffer-based WMI API should assist drivers
> in verifying the size of buffers received from WMI methods or blocks.
> This patch series implements this suggestion by allowing drivers to
> use the WMI driver core to automatically reject undersized buffers.
> 
> This avoids a memory allocation for undersized data and simplifies
> the size checking code in most WMI drivers. All patches except the
> last one have been tested using synthetic ACPI tables and appear to
> work just fine.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/6] platform/wmi: Add wmidev_invoke_procedure()
      commit: a6354b385fd18fcd7414052f8f6d13fd27521720
[2/6] platform/wmi: Convert drivers to use wmidev_invoke_procedure()
      commit: dd2dd86f44800911e71127d3f418ee3685197c41
[3/6] platform/wmi: Prepare to reject undersized unmarshalling results
      commit: 668aa6086f04d1bd63f27753d6c2d318c44ae306
[4/6] platform/wmi: Extend wmidev_invoke_method() to reject undersized data
      commit: c6f69ffec0aec2ac783f900b5c17ebff13c58f82
[5/6] platform/wmi: Extend wmidev_query_block() to reject undersized data
      commit: ceed8c1bcffab475facb6d4ee071464d01dd1865
[6/6] platform/wmi: Replace .no_notify_data with .min_event_size
      commit: a99543f1d8f92e11ff3cb2760964490b04864e33

--
 i.

