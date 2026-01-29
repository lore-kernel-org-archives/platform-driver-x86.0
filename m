Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9E388862;
	Thu, 29 Jan 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690393; cv=none; b=r6JL9q7dGtKWcmUy6XhdTcRBMexJVzc2YfQDm2B3j/uyRR1oElRhTPn9yIgOvoT/tJnITrbMsxUO6hFu+zehNFzEqtpqhxDEx6r2s/jZmPQVYTUTS7SkMcNHNsc5CEAP8sC5raOPAVGXP3jurlL9nce83QsOltpRqVbmfjHV06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690393; c=relaxed/simple;
	bh=syORQz6/jaiDPYUDg4bpEbdROW8uM9ABKMwAPzJti8c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HEdCi946vmzHOEeNz7T1qecpZ+z0FIeqsONMN1G5iIH6hLpKdgzX/K6jM2x5WKwEM1geFyu7b1Xk7QRbNoog4NEOCT1bwcUsdKHw3pMd0cdPnBiPPBZExfmBJmzc30c/T4NYhZ6DwgU2SpCIAnFbxzqegCtse3m0NEYilDCsp20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GePvQgKq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GePvQgKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769690392; x=1801226392;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=syORQz6/jaiDPYUDg4bpEbdROW8uM9ABKMwAPzJti8c=;
  b=GePvQgKqxKVeiWzb73tHVAybguUklmAebBr4VeotWIvZapbbdKSPHlDv
   Y4O5QzNf4z6Z706SDzZHz7sHP/hVp64xXW4dhbWPLBt+OlnGRabwjAbs+
   1zdbK7VwAN9lqSkvoL1tnxydUDCLEKdH0mESVMc9u5hZuR0IgWqzYXYRY
   z3ufL3vXSfu6Tm07prViWwp8GvLveOGhDN7nwodED8C5kPH8DsLlOZNSN
   PXf5uGqDUL4Fvj8eE0ZvuLiaSYx6Lv3xc+6RQzx2GPJ6TEcFwogVXyCAM
   xHSUQ43qrjMM9fYEG3H1CWipPQgwo9qLVpLYwtnPicwXIRRHrG0JaXtbU
   Q==;
X-CSE-ConnectionGUID: HpddwXdUS6uXS1dFzOtudw==
X-CSE-MsgGUID: FViII1M4SiWbnke7Z6Tl5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73522337"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="73522337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:39:49 -0800
X-CSE-ConnectionGUID: bLOj6GAaRPi5BGHgXt13mg==
X-CSE-MsgGUID: gR7xmFIaSVGrkfUwdbvfnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="213121327"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.172])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:39:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260127-plr-debugfs-write-v1-1-1fffbc370b1e@linux.intel.com>
References: <20260127-plr-debugfs-write-v1-1-1fffbc370b1e@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Make the file
 domain<n>/status writeable
Message-Id: <176969036282.2211.16439611557189817993.b4-ty@linux.intel.com>
Date: Thu, 29 Jan 2026 14:39:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 27 Jan 2026 15:45:40 -0800, Ricardo Neri wrote:

> The file sys/kernel/debug/tpmi-<n>/plr/domain<n>/status has store and show
> callbacks. Make it writeable.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/tpmi/plr: Make the file domain<n>/status writeable
      commit: 008bec8ffe6e7746588d1e12c5b3865fa478fc91

--
 i.

