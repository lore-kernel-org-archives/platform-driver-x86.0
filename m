Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649280;
	b=bj5mFYOte3Ia9H79kty9P4ePAI3QimdxCdhJQxJPUH+W4SKFQ65HZWCvTw0dvynZ1o/q
	 LmkjBD5VMJCPk6oYWExCV1zUvbkaRRV9TZfRAAuVwKuRgkfSUHe4OPeYKmlx4NzZbPRUs
	 sTKS0tZLqt2e8zpFMXOQ8GeWDPJFTyvQwjKlLTorDgNMbLi1FT775o0Zp9UTkAHf9DRjX
	 gCGueOA3/KN4wHSs/PFBvO0vrRm17SaKmu8BwEMtGmdLVFCPaGNZy15h3Vl/au9WTRH+h
	 SX7at6aCmIstVUEoybVFs22Q/psLU5CBwlSNIKreZZY9vfInf+sEr9lB/aS1UnzrkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649280;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mbwZFlNuXmWqSqNwudKuWBZVAY+HKCuX4o9raOMlOpo=;
	b=TiA6z9ZYS55iKwZtQALbdiZI+qRhB53/8inZZv8b5Zg+ncxHqFUhxCilcgqnsI5kwmx6
	 J0oPm9Eyzywzacbf7GUzGqYrwo42xRrAJXgPT4qh0AmDbmPKPnB/ujxF+EP4/jFrMcYDD
	 yPekKkxNlMCzgTW/g3kTKKxFUHRx/YiWxT1KD4oMsvL0b5CNF1Bv8+qPRoT9+CHtQcfih
	 eyqo9imY0vSqGxtdrISnN1D1B12/w6bg0bJmvpgv3nv8CiD70A6td44FN2PsXmT/pK9at
	 aqDcZkwqg58XdRS+XEtkWc1tUXUd+99mxW+ZBJYj+XB7YWlsVWWvBPACf4LE8xOfiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Br5HyCFx;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B507606A323;
	Wed, 25 Nov 2026 23:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B507606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Br5HyCFx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649280; x=1827185280;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GbxugmK3jKnozjQWFylG2YnbFL8+nU/YU+zxPeFYEMY=;
  b=Br5HyCFxG0hv08YUYLaoeYfw6wp5wLb0FpAgM9wDEcg7dgpxvSJqmKA3
   2By0YBan5gnTSmmJgAouuQMwmm7zegdidfPh5vLy0uV9g0bR9NxQsueCI
   vIKYJJAuXnmlI9/6gfEmrowJBmMwkY62p1MpisJ6XA3SK54+9jOAJQCik
   0tFuMCTiPHqU6wm74Eb8pEVMcIpadYN5fHmT04wrGNjIIL1HW8kdfb2zU
   kt5rnj9c3r1Dxzmsf/695VRsWowEdOV/TTryXDHa7DQN7PW0iKSdMq9Z9
   YGaxL6bxoIk+7n62lP9n1RfSTiPU11McC3SNqS5cCkgIqTacEUpVU2o1H
   A==;
X-CSE-ConnectionGUID: jzM5dNnhTxCp+M8+2al+Kg==
X-CSE-MsgGUID: gxOQ28UlQ7yALiyqpo3FJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4451078"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4451078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:00 -0800
X-CSE-ConnectionGUID: NqeG/lhrR962Si44ZRdKqA==
X-CSE-MsgGUID: LHtWz6LiSZaIk0arSSa1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11889615"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:27:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Ava Green <ava@oven.ninja>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120231607.7908-1-ava@oven.ninja>
References: <20261120231607.7908-1-ava@oven.ninja>
Subject: Re: [PATCH v3] platform/x86: dell-wmi-sysman: replace deprecated
 strlcpy with strscpy
Message-Id: <179564927344.9828.1264443485099538178.b4-ty@b4>
Date: Thu, 26 Nov 2026 01:27:53 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sat, 21 Nov 2026 10:16:07 +1100, Ava Green wrote:

> The kernel has deprecated the use of strlcpy wrappers in favor of
> the safer strscpy variants. Replace the internal driver helper
> function strlcpy_attr() with strscpy_attr() across all
> dell-wmi-sysman attribute parser files.
> 
> Ensure explicit destination buffer sizes are passed using sizeof()
> to prevent potential out-of-bounds array writes during ACPI object
> evaluations.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: dell-wmi-sysman: replace deprecated strlcpy with strscpy
      commit: 4e8f3a0472af63b41d1e19a62d5f42e19efa4f1d

--
 i.

