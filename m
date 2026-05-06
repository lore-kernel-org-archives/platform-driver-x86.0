Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C6044D685;
	Wed,  6 May 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075674; cv=none; b=haNgTw8DHYdCn6CiCvSh+kV/LJ7JB/5DetL89goae6mMkf8OMr+6+yw4LQBeoqGTlyOyXPOLK1u3mfRmPu0TpEild1+lxcemFmoJ1Plc8nkjQLq5KntUcESNMPv+L76MLPmZWDNY+XemfIlXVcZhm4pQFrzOg0RdDOaVIuEPcWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075674; c=relaxed/simple;
	bh=+ov+vrMIcTYmmHxu2JPpd6MU0I9XPu6bebb+IgpTqIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WXaA0LQaqgRrkmlv3TR/rRf4Gge8RRHLGBmmGwaSAcJzKKqBJDhC7kg+S+EmfwYSkUfM9ADq30xjbCZzVaLLSj8ZvKS6WhNI0uelHnYDbV0zekmL1BOIFJOWc0CZHdpIg9LqvwzKW20vF3S4zu332ubbCH1nNG24z2a+zN4u9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbbnkARB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbbnkARB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778075672; x=1809611672;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+ov+vrMIcTYmmHxu2JPpd6MU0I9XPu6bebb+IgpTqIg=;
  b=gbbnkARBYy67e08KERaaLLum7Rmry1e38eoFPzsZraQZGJSLGqGQ1H8M
   G/bdqaOj9L1YGtoe9MAA5UbXQcLXNe0ucLhJAdWoKdGxJv5Ppn/tH8fow
   6cSjIQpi7wmM7G6ftnu5Pai2o0K+RDcJR8AAUYlb1XNTOa+YPLb/Sc8DV
   997MytafJZVQyc0sLRL4XT5AMZfH1WUPO/Ujp6He8cDhHiIYkkxecCdEj
   TLcdy6opNbTq+cJWSkoMAGPe11bwr2oMXm/iFAaDImUQHLECS+YRNhq5P
   W3fVM4Lgjj1Y+MLfJXiTObL/P53zMrW9GrDZN1fRzpgeuzkOXDutXVDkA
   w==;
X-CSE-ConnectionGUID: 2DvrM9i+RPOLYCvhPinWVA==
X-CSE-MsgGUID: zhJ4/IdyTCWHoeIFH07YmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90104147"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90104147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:54:31 -0700
X-CSE-ConnectionGUID: XXvQQHdRSbG/92jZ6UJ8Rg==
X-CSE-MsgGUID: cZRUAdpIRfavwWt24fFCcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240489281"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:54:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: skhan@linuxfoundation.org, hansg@kernel.org, corbet@lwn.net, 
 srinivas.pandruvada@linux.intel.com, 
 Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <cover.1775665057.git.m.wieczorretman@pm.me>
References: <cover.1775665057.git.m.wieczorretman@pm.me>
Subject: Re: [PATCH v3 0/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
Message-Id: <177807566314.8094.18400142922022766172.b4-ty@linux.intel.com>
Date: Wed, 06 May 2026 16:54:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 08 Apr 2026 16:27:40 +0000, Maciej Wieczor-Retman wrote:

> --- Motivation
> 
> This patchset is about exporting instance ID, a value used to uniquely
> identify MMIO blocks in TPMI devices. Userspace tools like "pepc" [1]
> can use it for direct MMIO reads or writes.
> 
> Currently exported information allows doing this on non-partitioned
> systems, but partitioned systems require additional steps to map MMIO
> blocks.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/intel-uncore-freq: Rename instance_id
      commit: d8e484a452ca195b7c099373f3c7901bd405b623
[2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
      commit: 6cf1c1e9f21ba2e44e05e691d5241290c7d6c41a

--
 i.

