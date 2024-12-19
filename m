Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B917C
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Dec 2024 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618940; cv=none; b=TTNn+4p2aM3PIrVo/0dsQxx0uXcUdqTSKpZ7vPIGxhss3B1WK+CGpK94/kjE93rC9t7wYeFJ0I9R7dWOHPXo9zLpbxBchmizA90l0YfpoTw3tpXSaOU8bwqrNoZlgtU0Gf5f7YQdZmeZ8lRnJ2xfZPr+WF5KgK8L282h3cTALpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618940; c=relaxed/simple;
	bh=OXC3eOiZUCD4DI/nz1jv3TcwbuNVL8Ki75P7plDAuC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HDw4lpLkcDFTjQB+nQYqesASSvpccqtntEbyRxFSQPquk2/luvhA/e/Ob6sIIm5xZARWjtS+n1T1PwfPYo7ucCYXAlmVBSisQBwxW58GCXZVsNoDSgFC6VRKx4PgihpTqTA7DjwqivSVyHtY3uRFU+tSLN9fLxh1g0Fc9FtVRMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Geuavkgg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Geuavkgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734618938; x=1766154938;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=OXC3eOiZUCD4DI/nz1jv3TcwbuNVL8Ki75P7plDAuC8=;
  b=Geuavkgg+QDcfZ12zpeVpdkoLLQfWbr1ecfR41o8qHzJ3kMxQBHLz14K
   bfVUHBF+JJEe7H9nQEZtNunnEmnwgaH3MMkqpqqtbJC7rdfUX9oTNxjQw
   I9ZxgWSAlM7UX+UpMc8OxFZ4VYWreOaHSuPy5UN8BJu5OM0fYhtMoeUzV
   0skdFkVdPvobiq5cvVMPi4XmptwCa74Cs2+PlnDeo4AjcxH+gr+iSa0GJ
   8KHkmFV8Mb7C+Az11svd0sHtGhO1bcKAaLdLLXMNGefRyUdD4N/VwVybE
   Ao1a/TY/zagz9mOuYgnAGjl+phf87IOUbuv3pazAr4zwobVXsVrWNyH91
   Q==;
X-CSE-ConnectionGUID: zNLqd9+9S5mU4WEzujPORw==
X-CSE-MsgGUID: GB/XRuZzRT++d3wva+2EGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34452896"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="34452896"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 06:35:37 -0800
X-CSE-ConnectionGUID: mKBJ/wI/Te+gOox6gv4/Pw==
X-CSE-MsgGUID: UHLl4jlYTSah0aRiVLH9bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98003880"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.7])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 06:35:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, hdegoede@redhat.com, 
 Shyam-sundar.S-k@amd.com, Mario Limonciello <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241217194027.1189038-1-superm1@kernel.org>
References: <20241217194027.1189038-1-superm1@kernel.org>
Subject: Re: [PATCH 0/2] Use guard(mutex) for amd platform drivers
Message-Id: <173461893154.2389.10169872262514501118.b4-ty@linux.intel.com>
Date: Thu, 19 Dec 2024 16:35:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 17 Dec 2024 13:39:50 -0600, Mario Limonciello wrote:

> Update the PMF and PMC drivers to use guard(mutex) instead of
> mutex_lock/mutex_unlock.
> 
> Mario Limonciello (2):
>   platform/x86/amd: pmc: Use guard(mutex)
>   platform/x86/amd: pmf: Switch to guard(mutex)
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd: pmc: Use guard(mutex)
      commit: f947ea8dd657ed70c0c02b35ac485a24366201d3
[2/2] platform/x86/amd: pmf: Switch to guard(mutex)
      commit: 03f8e0e05510dad6377cd5ef029594d30e6c096d

--
 i.

