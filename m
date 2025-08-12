Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE031E22E9
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Aug 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001742; cv=none; b=R3YEMWCG7BndkoeWPME915W9iB3qxOl2/VUv4x5s0gAvWfPH80cvPL9c2/UUDsCbefe59A6daiA2eORt7oN/C0ayAUnIzoLWVnUi/uX+fL4VHKCh1MKz8j0X8QMivg+IhbFNrNfdJuhrBmpjEy1F5aWgQE/cGrlZHyiVRO/3KvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001742; c=relaxed/simple;
	bh=7JtL33OUqqUdFJA9PSmaRjMi3t81sUG0S7scXE0vG+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EI8vr8dD5qCMCId+3qM/euq/lTXFVkM4S3TOhTUGWN7C5yahXqinsXc5D4ZWNN1nW72rTG7ZO4CTJYVTQluGolBn4g4uIVNyAq+X3Fs02xXP7hSU176Nd/m5lcZAIvPl65zmtFREkVJpYewo+pBtRtrciNAmqyAWzQtboJVdm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wfkb8bNW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wfkb8bNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755001741; x=1786537741;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7JtL33OUqqUdFJA9PSmaRjMi3t81sUG0S7scXE0vG+4=;
  b=Wfkb8bNW0EDCesmYrZC1nEj2jG8fRo68TjC93/ysvo31MRZF4V03LUWs
   TdEXLTinU5sP2jpUqWIm4zR2rqmlnlNDhQfR+4QwZYCpz+T0Lnf1UWWnt
   ZM8QNHFjiCgqu+NVgsoMXGu4GCoBQDx8WxfFQsrjdGebvwRDw45kVCCJb
   gOyRz6PeF4qgGLPqhp2K3o8XMFGNfpfeJJ/+4xofT+2RRZDTI+7JCgor+
   yhQoVVIdemYAJolVqR2e5tQS2SKMrHJLuJk6hRaxQewlLPnkM23feHXxg
   ZTq05y8wxmFGcyAzIkVsZyFy0Kkt83WQ93MVFjJrMGkNv51SuQOPpd15m
   A==;
X-CSE-ConnectionGUID: qecSo120Q96iFOMdbZ8QsQ==
X-CSE-MsgGUID: DFJMi1O0RFa4sMKmH6rXhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68648816"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68648816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 05:29:01 -0700
X-CSE-ConnectionGUID: aHsu65PGTVO6bcn9GW80Yg==
X-CSE-MsgGUID: O+n2HvDzToKjV5ycsLfv3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166472096"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 05:28:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250807100637.952729-1-suma.hegde@amd.com>
References: <20250807100637.952729-1-suma.hegde@amd.com>
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr
 is non-NULL
Message-Id: <175500173505.2252.11213969532775872717.b4-ty@linux.intel.com>
Date: Tue, 12 Aug 2025 15:28:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 07 Aug 2025 10:06:37 +0000, Suma Hegde wrote:

> If metric table address is not allocated, accessing metrics_bin will
> result in a NULL pointer dereference, so add a check.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr is non-NULL
      commit: 2c78fb287e1f430b929f2e49786518350d15605c

--
 i.

