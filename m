Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97E1A08B8
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343680; cv=none; b=NEGEy3FWLXZ7MZAliWIPajPzDNmUeqXn0yYMqfRsj/4Dw+bq5t8X0uzFT1tjbveFrhuzCK3Girm/yrzhAO0R8hDtY+BSPs+MAevnYRRgq14su0airjfDSl9fRGU/Gd+6yDky7evmLZ/yFa4qc/tMIyiPyoe8fPb3cf0m7s6HGG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343680; c=relaxed/simple;
	bh=ZBW+6EUq2+oQvX3AbUxv/I0pXRWyLtfPFZ+OmCrqp1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bsvHoNPeetFNYBwcmbihQ02CLAKMhLHQ6crUqze5DMMOX0JAM+uUtLakcPkfo1yg/NQmNr4hR4DMB/c7NMIqc/qMovw3tHs/3gXB89hMd/rVvHjiJ5yahfAbUsTpJ79u5JsDpmE3Spd7JNVUzdBPx5Hd6IMq3FUiKN1sFUpSAus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCgyLFhK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCgyLFhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722343679; x=1753879679;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ZBW+6EUq2+oQvX3AbUxv/I0pXRWyLtfPFZ+OmCrqp1U=;
  b=OCgyLFhKvk1Sb5pwaxwW5I29iilLjHGn++8FvnXtm/hDTHVpFSeThTNB
   JzA52AFb6eWlhZcBnwy8FlV/Ffm8gPsC7txclA0/Pbb8kU+f2BfiLMzLl
   9LrhesQKxH6JNCyMG3b9+rFLcspBIEknckJTJ83Mln5ZP6Z0gVsUcfXHb
   Ei5+o22kVybjpYzr/K8KWqrrf8l20NapWZV3gaH3visD9Ho913u/gZqkK
   LYWJqj8LKPYfbmfbl35wLlG2VcrXBcVh+6GyRqFAdHbf3n4/oBuyGLn8N
   HkRdqpEOf1IjC09Vhj6WBqvbpZgR3h7fynZ+W/dmc+QMNu/M8qumssDFy
   A==;
X-CSE-ConnectionGUID: wmAANbLeQEi9ejI4q41Wrw==
X-CSE-MsgGUID: RU17AA7DTouzWanE7lVLfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24020056"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="24020056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:47:59 -0700
X-CSE-ConnectionGUID: I/kofqt1R5WstQYQW3yyyw==
X-CSE-MsgGUID: EhQD0btRRc+ds8aV17yrpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54582438"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:47:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
In-Reply-To: <20240718150119.3427190-1-Shyam-sundar.S-k@amd.com>
References: <20240718150119.3427190-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v1] platform/x86/amd/pmc: Send OS_HINT command for new
 AMD platform
Message-Id: <172234367290.2712.2384885523773098413.b4-ty@linux.intel.com>
Date: Tue, 30 Jul 2024 15:47:52 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 18 Jul 2024 20:31:19 +0530, Shyam Sundar S K wrote:

> To initiate the HW deep state transistion the OS_HINT command has to be
> sent to the PMFW. Add this support to the platforms that belong to family
> 1Ah model 60h series.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Send OS_HINT command for new AMD platform
      commit: 426463d94d45d37c233e480231a40b9b35f10e49

--
 i.

