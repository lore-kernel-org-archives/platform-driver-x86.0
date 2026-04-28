Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039C43DA3B;
	Tue, 28 Apr 2026 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392352; cv=none; b=mr09hEF244YncS9oiKMiVfyE0Mh4xpIgD8hsE8eqlH8MZlQvwuMtIe6hs25t3jq1guM4ZRxxZdfANFEYUGHa17zI4Khdc+NPdtOb4RYlFphMLUPFeszX4ImcZqv9D8PTa4kk/Sd4rfbXgICZ5gJ6E270LAFGusB+4RzQFSzrRyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392352; c=relaxed/simple;
	bh=dw/tOAXR2y8Ej93RDFMXRfcxFSi69D8X0SiJJpS9lLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iOhimFmQ2pVH7aOSJl4d4TFknxQlldWRoFTWaNmOQ9s27q1r/isx+JffqWGTdJfAQnbmLbuHu7nGw6XASyfPdNlhLifBIxzSyqTAYfKGbUksoQmZUenlVCxdJBX+4iS/Q+4GgBnMNra60hSUXYN1FNtl5vyPnvWx2e8nvdFPpUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGb4PteC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGb4PteC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777392351; x=1808928351;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=dw/tOAXR2y8Ej93RDFMXRfcxFSi69D8X0SiJJpS9lLQ=;
  b=NGb4PteCb3sV3fnrWfCXoFDwPyo05xFidlhz/PhGy784hsPmv6oAbno1
   dwAVH5TGalC0NjEHs20lnZUTJAzJLlhMuBWV07nIMlWK+S7qILRAki40e
   RNIDHpmKXBeFKN3tj3+qKZ+gpgE83UXScjkE6Qw6HuW21HxpLAoudyQds
   9v5bNlMGZl1KxA18uO0Z/E2acwkBbwguwLZjubJdwTZ93of1kGMFBMKbq
   6M9/+pgtGtPU3nr0u1Cs4oeN+u+3Ltj+hIOOMrJvUvBYD9VckHHSTVf+K
   6goxgjpPLsNx9fu3HC/Tie9XTIZWV/0CTP1i7B5HvHuzhtbZjrBulZNOF
   Q==;
X-CSE-ConnectionGUID: fiyXYdp0Q4+eWNhWTWhaww==
X-CSE-MsgGUID: Bn16ZlIfT8GCaEylnxjRdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80881227"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="80881227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:05:51 -0700
X-CSE-ConnectionGUID: S1IPoGbFRFS+QRgm4lql7g==
X-CSE-MsgGUID: zJy8WXbdSJyEV6UHL8YHCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="227468307"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:05:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mattia Dongili <malattia@linux.it>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260424075755.305770-3-thorsten.blum@linux.dev>
References: <20260424075755.305770-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH] sonypi: use strscpy() in sonypi_acpi_probe
Message-Id: <177739234439.10973.3057717116633267259.b4-ty@linux.intel.com>
Date: Tue, 28 Apr 2026 19:05:44 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 24 Apr 2026 09:57:57 +0200, Thorsten Blum wrote:

> strcpy() has been deprecated¹ because it performs no bounds checking on
> the destination buffer, which can lead to buffer overflows. While the
> current code works correctly, replace strcpy() with the safer strscpy()
> to follow secure coding best practices.
> 
> ¹ https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] sonypi: use strscpy() in sonypi_acpi_probe
      commit: b54a4676b3069c9a8cc68e07122e6438491a3353

--
 i.

