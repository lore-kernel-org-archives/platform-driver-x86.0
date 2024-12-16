Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DCB839F4
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369468; cv=none; b=acaHtdxzmoJ+CYNVnyn18W9NM6qfxgr5ZJUoPKIpWkqoks0bUJdrhM0+4eDkWiPpj/pXaCJkONZVR2rEySNcB5I/ch9GRWRY6mdfkv3KqVPtBK356ybdYrsz1IP8HAdJhOe0v09Tzlb1BtBY8oQWK1kdm0yOcFuQQ9G3ECvVsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369468; c=relaxed/simple;
	bh=253JcMNCvfAoRiFgoAZ0Pweb/aQlSecC3T8S2jNSsDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=akIxllNomnh5d2010cTM9e+DXpJCQPiURWCrfx9D4Okn9SnS0Qf6zLFcgH3QJQcKmZWQtDOKki52nBL2fYwZSrYo4P3V0eflSHCHSJMjTa+HQm1SCx5syKtiLxKfkvSJB12hiVAeSGJ8g2/VqMCmiiG4vltD6mwxM/Q3JKQVUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZssIQKIu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZssIQKIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734369467; x=1765905467;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=253JcMNCvfAoRiFgoAZ0Pweb/aQlSecC3T8S2jNSsDQ=;
  b=ZssIQKIukhUTDuj2uB/lhBNXkyQckrzUzlVD8TfgLTD0v9t1Zm5xWCsP
   Ej3Otjeuo/hQQsJAbDAIuNvJf39hvxLKNBVh1OcDJ87R1J983O2MmBzOL
   /5bnacmqAk304Q/qbGFLql0FEuvgtJohCHZhy2Ck6N/VBZ1/H9gUd7Bzv
   WOeJt/tl6yv1shhZJYZ9DnOh4x8orCmjZ4BKlzyXohnvR/UbG60tPwAai
   wSUATixMRW9BE21V6MfJNkvyid5tBV1sn0ri/vla54izrb/8w7b1sVxTn
   llo2hG3qMcdY+EoE3aB2gkhTA1xy+Y3EB2gQ4CmpurlV8unGR7HsuQg3g
   A==;
X-CSE-ConnectionGUID: yK/lo3fITkWamuW+cfHPpQ==
X-CSE-MsgGUID: uq/pZrg6QziRUeCAf9RhIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46156599"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46156599"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 09:17:47 -0800
X-CSE-ConnectionGUID: N5rrWH4xTRaEobymUncVZg==
X-CSE-MsgGUID: WUy2rNoxROGVT7E5pXZKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98051802"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 09:17:44 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com
In-Reply-To: <20241205101937.2547351-1-Shyam-sundar.S-k@amd.com>
References: <20241205101937.2547351-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd/pmf: Enable Custom BIOS Inputs for
 PMF-TA
Message-Id: <173436945879.2913.895221431387080855.b4-ty@linux.intel.com>
Date: Mon, 16 Dec 2024 19:17:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 05 Dec 2024 15:49:37 +0530, Shyam Sundar S K wrote:

> Introduce support for passing custom BIOS inputs to the PMF-TA to assess
> BIOS input policy conditions. The PMF driver will adjust system settings
> based on these BIOS input conditions and their corresponding output
> actions.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmf: Enable Custom BIOS Inputs for PMF-TA
      commit: 6000bc1f5a81eb3938d824b325dbe1790d4f7efa

--
 i.

