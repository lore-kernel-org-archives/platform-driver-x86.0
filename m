Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34B5431E51;
	Mon,  3 Aug 2026 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784374; cv=none; b=e7DDR8FUfnrFkXTr3/nNsy2hphmDFwzL57HBgBYIYtekeO24CbwUvqA3aaz9Y5qqxJ8LTlDuBosE+2hufz2/AUgE+ySAI+yvhZs+lr2nEV/MCNDakJbRralDlOf6vXoQjZeb9lcXofL8bMCMAx+MGqrOYwvjstwiS3BmLPxgbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784374; c=relaxed/simple;
	bh=SF3vylpYB82DrKadhk/FVp5B8Y/ZDKXw7BXUlATsPxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pDsJAr4yrPzHQDWRoubVeAxHxJraXRShmS2kXUccHgj+ElwwLocqv2cNWsrS/aJaSWG+g2GmJjtq6PefrJorVSEbflpL5kV/YYYROe5RgVENQVEKHceoMGWRyJUtUhmEKPo7N9fhdhcPorPs1N3yS/5Qhjs1ptw8MQ7HtXwv70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJFhkBO7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJFhkBO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785784373; x=1817320373;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=SF3vylpYB82DrKadhk/FVp5B8Y/ZDKXw7BXUlATsPxI=;
  b=hJFhkBO7CBmzcMFAv3uKfwPvh0aXWFlKrndKAQAgIA9XyxVnKw5L/OFt
   NfYCav/iiCK99KNU4/ci+v2aUEPezScyi/r7Uf6LQ1tgw9B4ffmWdkfQN
   UIwGjIZTH60bpHi88nfrM53Il5LOqVwnV1Pg6tp6B3t0LAIlUuCKxWjT1
   EuEbHgff/bBj+HT7JfirvZ1LzWEWwmOuzulAo0pTJQiWQtN3uFT9GZ0np
   FPzEZgEZVQy9y9lieMg3OrvTE/LLQJapbv9U9diJrQibUm7/Xzzaghj4U
   AHUuCKwl2q+5bAl5KGXxmnrgkbSVSqFJZkpHAnfiNJOsAR8HqohIp7mVP
   g==;
X-CSE-ConnectionGUID: N8eow2GtQRWlMoYlH2BIRw==
X-CSE-MsgGUID: i2N6lhDuQGap7NBJ8e7IdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85307355"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="85307355"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 12:12:52 -0700
X-CSE-ConnectionGUID: B0wucp96RrKgvOehOSt7Mg==
X-CSE-MsgGUID: HgJKjKi0SHGIMOVg3EmBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="291238134"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 12:12:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Linmao Li <lilinmao@kylinos.cn>
Cc: Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Maya Matuszczyk <maccraft123mc@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260728111924.4106898-1-lilinmao@kylinos.cn>
References: <20260728111924.4106898-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete
 responses
Message-Id: <178578436515.17622.4835801853250373634.b4-ty@b4>
Date: Mon, 03 Aug 2026 22:12:45 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 28 Jul 2026 19:19:24 +0800, Linmao Li wrote:

> qcom_ec_read() accepts short positive transfers, while both callers
> unconditionally consume every field in their fixed-size response. A short
> transfer can therefore make them use trailing stack bytes that were not
> returned by the device.
> 
> The first response byte contains the number of payload bytes, excluding
> the byte count itself. A complete response of resp_len bytes must
> therefore report resp_len - 1 payload bytes. The existing check only
> rejects counts that do not fit in the response buffer and still accepts
> an incomplete payload.
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
[1/1] platform: arm64: qcom-hamoa-ec: reject incomplete responses
      commit: 1b04f556e8428a3865a95627ab7a0acb5d9b93a5

--
 i.

