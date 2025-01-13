Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C53C1494A7;
	Mon, 13 Jan 2025 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789933; cv=none; b=faB9z6B6e4vTHIFaHxp8ok2LkJ5PSmnBuwPu7ZFOwdBtdbMNn3RGjmNoaG2obaVx2ksAbYHNqd+ldRccqBhnZa622F29VwVfrHL2m1fu39iyCr5v+JmVjOrk6ihlewTbMAgkLJKqpcnJOJ5TKwvlwMqP0bkjRW+erQef78BE+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789933; c=relaxed/simple;
	bh=Ho+bRLYO0R9d8h7coLlhzNP0ow+dhUze1AemVzydknM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CV5/w12syzQYE9/E1F6y6iEIddCqaEpX6uVpIOxdUaseafxSCEGcellFFaPxLe7KFhTgf1Ofd/BFqyQyGfG7FIzpiP9VgVx0GLC8i9SniETO2IkFcFXdOnA33c1+UCWVXEOI8UkiY5lWGNNb5UUMjcQGcDrQ+fhJCXHgVV/A7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Um2nLEcd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Um2nLEcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736789931; x=1768325931;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ho+bRLYO0R9d8h7coLlhzNP0ow+dhUze1AemVzydknM=;
  b=Um2nLEcdCnGXPtK/qM58HtqqW1Np58ThA7BdQ4ZPtuhF5gwsPkpvyOrE
   gGDw5me8VoeZt3yxSd5H5yNapnX85yiJplFKpVqg95Rzsc6w5IXqY2T+j
   fnUOrltwL9gLH96m282SuoTqLwFSSDUblTC62ZRz39d8H1KfcXAtzugul
   hQCYVU9DdETRkoQ1Qmz8MQ/MKg5st4X4Mywo+dCKY9XyRsqNN763yPdKb
   0axb5AcFNxzjw0rtyxJqxPGtrBCSk2xPO/2LySAwurutloyNjRHvw3gQp
   ts9ogw0YZltgz2ToxymaAVcHLxJ7QN7f4nTHGYa5ur5KXOgsXB/V1OQuX
   Q==;
X-CSE-ConnectionGUID: 5A3YtYqNRG6H0oKT0gFYQQ==
X-CSE-MsgGUID: 9nyt5GRURNWyOkDuydeiEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="62438967"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="62438967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:38:50 -0800
X-CSE-ConnectionGUID: hgjHkNqwQou4sXXf1g8/sA==
X-CSE-MsgGUID: e0VS1T5pQA2Sj/CNMRmnMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141827764"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:38:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: qipeng.zha@intel.com, tglx@linutronix.de, mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
 hdegoede@redhat.com, linux@treblig.org
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241221234807.160473-1-linux@treblig.org>
References: <20241221234807.160473-1-linux@treblig.org>
Subject: Re: [PATCH] platform/x86: intel: punit_ipc: Remove unused function
Message-Id: <173678992185.2757.1035836253337787501.b4-ty@linux.intel.com>
Date: Mon, 13 Jan 2025 19:38:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 21 Dec 2024 23:48:07 +0000, linux@treblig.org wrote:

> intel_punit_ipc_simple_command() was added in 2015 by
> commit fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
> but never used.
> 
> Remove it.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel: punit_ipc: Remove unused function
      commit: ad0e06361a56428ffb971e8c902514cbce0d7ebb

--
 i.

