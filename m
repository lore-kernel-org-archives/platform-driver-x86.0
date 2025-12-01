Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE0303A0B;
	Mon,  1 Dec 2025 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584913; cv=none; b=kOFOY98kFNG4qIWoslONDww7opa+PrM/CGEgKfr5dUpn36HcMzjDMuZdv2drIKNfr8nQOX7iU6+C0dGso1kTL1sfJgmfrrhEl+zYTXWl3eUxUugfvkqZwiXxc2pFRCcq0LxNAlpAy4/UYLbR2Y2+MdlEKZ6d7OR35r6eJhQQzHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584913; c=relaxed/simple;
	bh=pkzfxTav581DFeFSie0HUVCNVVvojVU5QF7P2Cvzjc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g/J6zUoHHFyvibWxlWjZTeHFybEwJQkIecdAFvDfSr1o8FOEsDD/7lIvfhgClvPBy1ePed4uoA4ySMPyu7vraQDoUOtMqZYR0m7vIwTg8oI670dJdD2KQGwhwBE/P/Me+X5DpEZ+TnDGQUtmyt1Aui08HPonUq9WDWEs/tkpxwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMU/nWsP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMU/nWsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764584912; x=1796120912;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=pkzfxTav581DFeFSie0HUVCNVVvojVU5QF7P2Cvzjc0=;
  b=LMU/nWsPJpg9RUn+B/FFUWmqVp2wWkMb0ZShZjrmy7yyFuBBSpziddKT
   eV5Q19usuF1+nMVKq9P7p+uneZi3M7RwNWWb/JyjhjOPzABHQpV0HpygS
   aApPKJZnl0b/mXAMho+ePHJb00tRcDgI2pZukWVVNzS/8oeMmu7aYsCWb
   cxxPXHsBGqC6saE/nqKH8v8+Gik3aSqhfjKBpfo8Vv4bCzoDKwzcc9/SF
   gmQ0IOSIgh/aG8LD+B0eqGB4TxEiilMCBNFBRJQGV1uzGweLYW1lg4BPt
   onfI8pFNWdWPlZriVDp+TCbad0JAfU2G2CF/4lbTMjY3WL4exLf/f6MVS
   w==;
X-CSE-ConnectionGUID: +lQTesZvTYGm+q8/usL5oA==
X-CSE-MsgGUID: xvArE/WQQBWoQALByxyr5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66407669"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66407669"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:28:31 -0800
X-CSE-ConnectionGUID: VSbRuRrxTOyK8nxHWjYM2w==
X-CSE-MsgGUID: XNerCUe9T/e01mST2v9G9Q==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.202])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:28:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: andriy.shevchenko@intel.com, akpm@linux-foundation.org, 
 hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251129111535.8984-1-W_Armin@gmx.de>
References: <20251129111535.8984-1-W_Armin@gmx.de>
Subject: Re: [PATCH v2] fs/nls: Fix inconsistency between utf8_to_utf32()
 and utf32_to_utf8()
Message-Id: <176458490432.9246.16471424945005415314.b4-ty@linux.intel.com>
Date: Mon, 01 Dec 2025 12:28:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 29 Nov 2025 12:15:35 +0100, Armin Wolf wrote:

> After commit 25524b619029 ("fs/nls: Fix utf16 to utf8 conversion"),
> the return values of utf8_to_utf32() and utf32_to_utf8() are
> inconsistent when encountering an error: utf8_to_utf32() returns -1,
> while utf32_to_utf8() returns errno codes. Fix this inconsistency
> by modifying utf8_to_utf32() to return errno codes as well.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
      commit: c36f9d7b2869a003a2f7d6ff2c6bac9e62fd7d68

--
 i.

