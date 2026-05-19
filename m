Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC83F4DD5;
	Tue, 19 May 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193498; cv=none; b=rw3rJSKTfiLJF5B+NhidYjbjzsF4hspZeLoNmdyOpH/aJAODL+gbKJ0YsIXB+g8G0NNSPAfZAp8pviyh22QcyagZCnKvHqB6aBnKXqtpNFuBr+UKKdhdhMY5+Iydcf9AtKgTNMdkTE2viu+PJoSeb+hu/kh8VlbREN+qlllETPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193498; c=relaxed/simple;
	bh=xlMTkLLJhqDZzK/4k+o0UJJws6lVq1XUvnNauQ7KIfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hze/l5jyx4CwYs4cIYj+ZmFgPU4c5RbbHjLyC8EO624Zkk9t27tLnrqgq1Un1IBD8gezkOKwMQ05eo7TvHrvmQRg9mUp/CvcDPUqo3QcKu8pfF8SRO+dJCC0R/4Z9X/aISA/lPjC//wwVX93k7Ro07oFlYth1ausZIk808GvSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9GVVXoL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9GVVXoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193497; x=1810729497;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xlMTkLLJhqDZzK/4k+o0UJJws6lVq1XUvnNauQ7KIfY=;
  b=i9GVVXoLowRNoH5ei0T/DjWtgHDO+gah8SA2XXSvspvJ4dzkqAYBB55U
   HjdwppzEwhH9Yz0sBjfnTYqlfXjYWhWruuTJE/NtaGdCgxmK5PNaXpASn
   bISnPrUn2rop4D4akJFGTC/rtKshU+u1GpI6W/BIUu9OAuhny1O23Pjy9
   F7g1tbhVdBOXQ1NXeFL410UAN3psRMdANBX9v87fVJHVqdLsaDChgO/4r
   lDIFKOGX1aJidHqR0zlI1TWfwXNegttlk9gNbnEurFqNLKuSj2+N81juZ
   ytQZpaPOScyrMmxAtmb397DN0xI8c5rnqxocGLD+2gKMi7RMHVHcwyo2w
   g==;
X-CSE-ConnectionGUID: wBlPbDlRQ+Km9ai2Xq6g0A==
X-CSE-MsgGUID: BK7VI144Tiex8kKLr8eRkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79970126"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79970126"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:24:57 -0700
X-CSE-ConnectionGUID: uuLlVburQA6jxjZEbfwNjA==
X-CSE-MsgGUID: WJZmA4EXQ+evh562DJ2rqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235500856"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:24:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mario.limonciello@amd.com, hansg@kernel.org, 
 Krishnamoorthi M <krishnamoorthi.m@amd.com>
Cc: Shyam-sundar.S-k@amd.com, perry.yuan@amd.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
References: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
Subject: Re: [PATCH] platform/x86/amd: hfi: Support for ranking table
 versions
Message-Id: <177919348656.8561.910401362049938228.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 15:24:46 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 08 May 2026 00:39:26 +0530, Krishnamoorthi M wrote:

> Add changes to support new ranking table version. Version 2 of the
> heterogeneous ranking table provides static CPU rankings. Version 3 adds
> dynamic ranking table support on newer AMD platforms. These changes ensure
> that platforms still reporting version 2 continue to function with the
> existing static ranking path, avoiding regressions on older hardware
> that does not supply a dynamic ranking table.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: hfi: Support for ranking table versions
      commit: 4339fa4fae057c99cbcfd8127769219feb14964b

--
 i.

