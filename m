Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D81C84BB;
	Mon,  5 Jan 2026 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626951; cv=none; b=B34K4YeRxodESuV5aqzdlKAKPEHh8XHlm59sgo8maEAxDBKES0+B/N1g5Z0yi5JEZB25vXSbi1MZTm2r/CVrwFdWJHIpZtUKlAMsLpbrU0oseZd0rWgLR/4i0ljcUPqX1bRTlCM4RXhZl9Qsg+ukuS+PLQ/Hk2GwB6qiFkBWebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626951; c=relaxed/simple;
	bh=gR0EEkhchhl/9ruBsCOfr6xzYU++I71FdcUhdJ8T5Dc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dTvvIWkWmmMxccbBheYliSqy7uE9W5tSLJpDKv3jirJKT4VgtkL4L4S84l8/ItcIyzGx8SDGsq6s5F4V1yGRs5g5Cqgz6VLea0tkBq/Ll2RBKkKSWWpShnerD8T3fV+xkJVvfllIbM6SSz4md9imj/elA4jeC5Yll72Gb3mKRZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KT4va6wL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KT4va6wL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767626950; x=1799162950;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gR0EEkhchhl/9ruBsCOfr6xzYU++I71FdcUhdJ8T5Dc=;
  b=KT4va6wLPRUFG+soEjaBdJj9nuiFOZqcO0JfOyz326A5UVL3U17cZAZK
   KNrlSQPxU41Q/pc3myhKLViMNV6+KNWOM/LU3+Fzw+VD4m51vO/99tA5Y
   K4F9UgHT7XqZdfqe9UkF+08iMw0vfr6T3Y2+DcXe65vP+MQBoJjI4cDKh
   kPIFIWWsrZD8uLP64g3euI5u+nwPtCba1R8MI9HuIf08LGnSauoVdHCo/
   dH9Kli5niUMJw1Ag2f9rY2PLYSfSCw4ddeBj6bm0NDsxGxVmv3//Lr/tW
   IkMf8ddnYsIZ+AyqGjwlRFU1gBgwc2V5Jzyai/XCqBteEhtMJEqQfkCYD
   Q==;
X-CSE-ConnectionGUID: ctAXfFqMS3a1nIzaTVUGJQ==
X-CSE-MsgGUID: 9+hUCPsdTm2CYigkD9ryRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68186255"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68186255"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:29:09 -0800
X-CSE-ConnectionGUID: J0HYnX1KS2KsbAr2uYOckw==
X-CSE-MsgGUID: lAEGPfbUTe2UtwdtkGqThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="239896325"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:29:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-doc@vger.kernel.org, Haiyue Wang <haiyuewa@163.com>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Akshay Gupta <akshay.gupta@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251230133101.14362-1-haiyuewa@163.com>
References: <20251230133101.14362-1-haiyuewa@163.com>
Subject: Re: [PATCH v1] docs: fix PPR for AMD EPYC broken link
Message-Id: <176762693843.2568.9282406819072603735.b4-ty@linux.intel.com>
Date: Mon, 05 Jan 2026 17:28:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 30 Dec 2025 21:30:50 +0800, Haiyue Wang wrote:

> As 'AMD Documentation Hub' [1] announced: "All technical documentation,
> including for AMD EPYC™ processors ..., and more is now hosted on the
> AMD Technical Information Portal (TIP) [2]".
> 
> By searching the No.55898, update the new URL.
> 
> [1] https://www.amd.com/en/search/documentation/hub.html
> [2] https://docs.amd.com/
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] docs: fix PPR for AMD EPYC broken link
      commit: c92724b40c2f36ca0f2a789cf8cb80dd51107f25

--
 i.

