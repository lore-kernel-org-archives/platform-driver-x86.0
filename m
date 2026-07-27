Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA1B3FF1B4;
	Mon, 27 Jul 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153969; cv=none; b=noHJz8wNf+2TLKgEwPlz37KMDXbfhsEyZscdGQWes0U5S9ea6WvhAqut5xWZOpsMVMRhaXo8QBKzNq0IAsxCdT4ddVGA28doaU8VCFidUOSwlGPRuKzB7Luq4sHdmOUtiUu3yqaPjSVLt+rSdX0Gq+pVnzX2GCWuAhUNIhTbb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153969; c=relaxed/simple;
	bh=huOU08qye6v3XZnvCm8lUh/pigHwTcBOogtSatC6Hpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hJECqJMCub+2DlTSdkXIbsBXwIVtrEeGzA8TyC+tTx/3yQ19QeZqS3vOHIjkINJiOoqk+wutlaMXeWlaIeGLbMur39DzHHUuHNHv2nvSE06zLseH9ZNi8QZRsWQ8qqd0v8IAvptgSP+aj74BIcV4+w59Z0vzHUZnQZgvnytt3JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSYTqJov; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSYTqJov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785153968; x=1816689968;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=huOU08qye6v3XZnvCm8lUh/pigHwTcBOogtSatC6Hpo=;
  b=XSYTqJovcD4txR6W5x6kp+KKqhAJSm/PlixJgD38JYckl6/j0JtQwnNS
   TzfNFEWXOuky7oBX5X1gXAOqyzQLcS0Nj+CoE5lHw97E0UBkkt9TZ5z+A
   XMDLzLLmITJrd4Axo6pOiLm1Ua22cnPPFfqmmTVh/zJk35PcDeiabwvUc
   yGGWIosIrmFiYNOcYV0ZkKQaEYuqnw27GmhUqDaWJ0RYlOvS+lVlUCsKL
   YxFN3rbIfGKoo1v5i6m+mLZrAxlIku65dsdzKb8IjYK4bUmhVvV3QJ0XM
   pedRsJZmvTOUTnolOljg99Omm7gKJIllinYN/V4AR51USLc4qYRXBK9TD
   g==;
X-CSE-ConnectionGUID: 3FPrygwlQwKgV3bKsndfXA==
X-CSE-MsgGUID: 4zesBVLDRiWUsawoHl+F1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="96077157"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="96077157"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:06:07 -0700
X-CSE-ConnectionGUID: LQirQPYESBOpg8VjhP2Tiw==
X-CSE-MsgGUID: g8sdKBVqTKeDBZJc2okCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="256034992"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 05:06:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: Dell.Client.Kernel@dell.com, shuangpeng.kernel@gmail.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 gregkh@linuxfoundation.org, arnd@arndb.de
In-Reply-To: <20260720131921.368000-1-W_Armin@gmx.de>
References: <20260720131921.368000-1-W_Armin@gmx.de>
Subject: Re: [PATCH v2 0/3] platform/x86: dell-smbios-wmi: Fixes and
 cleanups
Message-Id: <178515395903.10740.5236572602807746273.b4-ty@b4>
Date: Mon, 27 Jul 2026 15:05:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 20 Jul 2026 15:19:18 +0200, Armin Wolf wrote:

> This patch series primarily deals with a potential UAF inside
> the dell-smbios-wmi driver reported by a user. The first patch
> fixes this issue, with the remaining two patches further
> cleaning up the resource management.
> 
> All patches have been tested on a Dell Inspiron 3505 and appear
> to work. I also verified that the UAF issue does not occur anymore
> after applying the first patch.
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
[1/3] platform/x86: dell-smbios-wmi: Fix chardev resource management
      commit: 41427211f663c6eb36986ca2ea68d7e87aac52e9
[2/3] platform/x86: dell-smbios: Pass device to callbacks
      commit: 08d31d42b054eae62ff57bfd88b639f111b2b8fa
[3/3] platform/x86: dell-smbios-wmi: Replace global list with single item
      commit: b844001890c5bc15adf3b16c44d99edd2005d393

--
 i.

