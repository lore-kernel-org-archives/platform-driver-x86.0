Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9A22424C;
	Mon, 26 Jan 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437810; cv=none; b=EEX1Niogvijle62hPsQBvpFDz+hXH+i5pg0/5Is/3/DGEPR0yoL4rsm+r2M4HJI7yOvkwLQPDlHCr7ngtJmTB6ImDCvOz7Hk+Qa2YXM69403Pi1uE7XIE5rOn7a6IrvelFryxv4r5oHvH3UDh9SrkewB8aheemSOMQ5lOYxq5j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437810; c=relaxed/simple;
	bh=EhVkDBnbS9p1Ph2Hux2GsqUWa+JMcBUXj43qKCBDKvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IzwNmuJ/KoS1RLKtHUIQVsEQf6rYG6Uz3JYLz90Dl2jOnx3RetQ5r80o9Gv9haI4QGfjaMRD4UHGyWGCLdtl34Pq4d2LxB7Zz6UMbfrhb23rY41rUoKMi7ADD0o7LZ2MiYmoL3ShgfhHwZhTXOkssqd/PaAo52p+++uLyrDKONA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnwC8RUF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnwC8RUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437809; x=1800973809;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EhVkDBnbS9p1Ph2Hux2GsqUWa+JMcBUXj43qKCBDKvw=;
  b=KnwC8RUFSqpfxtZvtZPl5zMgdrRD9s0sJatX4thCGJTFlJONowBjBosT
   QqTCO+32jposRib9SRUEPEwz4EhQt8vo8ylF2xuQmm6NVG63rkiypuGml
   aEumxK5siW5MYDa1R1wSfF4AGOgyufOCnJndSiF7IDjRLRKbryTgt1Me7
   PBBhUs08bqpfr+T90G/kv6OnCdFoE288wL0HZ//AfLMR0Fg7bPmtywreG
   1x+XWkujVflMYX5fL44//Vzf/LBFseXBAUnp1aLSaaGWDOiLciyLK0Mc7
   8uPLLrv+OF3JhTeQgS5DJSxV615mRFNPEcNl/Zdh39CHSF8+WJfFvJnGQ
   w==;
X-CSE-ConnectionGUID: bt47E8aiS3CQrZ9l1XMKAQ==
X-CSE-MsgGUID: Lc41cu+vTR6yN9RJ16Q3Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81724749"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="81724749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:08 -0800
X-CSE-ConnectionGUID: zXZSCSAhS3yEBjO0w1ZY0g==
X-CSE-MsgGUID: vCTQdwsBTC++8Z7YG0g3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207938419"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Zilin Guan <zilin@seu.edu.cn>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20260106091318.747019-1-zilin@seu.edu.cn>
References: <20260106091318.747019-1-zilin@seu.edu.cn>
Subject: Re: [PATCH v3 1/2] platform/x86/amd: Fix memory leak in
 wbrf_record()
Message-Id: <176943780190.10029.6868012389297386604.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:30:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 Jan 2026 09:13:17 +0000, Zilin Guan wrote:

> The tmp buffer is allocated using kcalloc() but is not freed if
> acpi_evaluate_dsm() fails. This causes a memory leak in the error path.
> 
> Fix this by explicitly freeing the tmp buffer in the error handling
> path of acpi_evaluate_dsm().
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd: Fix memory leak in wbrf_record()
      (no commit info)
[2/2] platform/x86/amd: Use scope-based cleanup for wbrf_record()
      commit: 2ee832305a25657d7cfb577bc30d8c1d43bfb951

--
 i.

