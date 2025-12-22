Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322F2D322E;
	Mon, 22 Dec 2025 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414605; cv=none; b=A3SIsiUEtkg8/RvEjyx//o3kpRy3jlzNjYJ2JqNuk9a/7i6tt1PMZQ26ccea9RgiDUgB2sMVn6EC04vsZX3cHvG45zh3ria6seOXg1s14Qpuld6JvqAJ6GKbPZPVuNsc57lRIpqScBIz0wkllrAufFsYOH0s+rE9bhW7gdt4CR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414605; c=relaxed/simple;
	bh=2azAXEZag1CP73ejF1HxRF/4u8J/0WYdUTQ42NntXKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QzygMCAukStnoCppgjUP0/5D44RZluAXAKlcysAMU4+F86x9MGOgfHNbW22PCL2RLRg+tQKGmI6e+2Vi/lfLzbExnSito/2XDqQBfPo/nlwEtJZNFoAeAc63uaxEGUFhJPQNtuGowcHx/CoV+qokAPrS/EKKj6e4p7pZQGfcobU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSehHNL+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSehHNL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414604; x=1797950604;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=2azAXEZag1CP73ejF1HxRF/4u8J/0WYdUTQ42NntXKU=;
  b=bSehHNL+sgYA1sRofYO7pyumZXEDeloRb/QNW/qO38SXO7l0T1w5f/Zo
   1NR/bmiX61h5P1hSxK2X/a/7RfKbWO8khhW2bV0d590SM/lA+rwVL3FMG
   kldmSW0cNFrrWsmBHf4jJrWCLu5Qf1GA8gMd2oSZuCzrFy3yG8skTb6xh
   w0j2v+Z/zrvn+v5LepgOkYAyh28I1SdK8LHDQsvG3H5XV/bchRzwvo6HN
   ri8BweL7gQtfcstipZm5P1tviU/wJ+wYumJC4CFx/ASKolipFaYwguP7G
   d2w+s870OFwVISZexY+7MHGbtgxFoUr1V3EHa5BDfHbte13niSezH4f9Z
   g==;
X-CSE-ConnectionGUID: pazIjfeXROSfXCo7moCLEQ==
X-CSE-MsgGUID: sSv0/6QTR0+cp4OKCedzjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68206160"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68206160"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:24 -0800
X-CSE-ConnectionGUID: r9IHh6KEQ6mV9FGj5hzITg==
X-CSE-MsgGUID: 0CsnrxYwSl2nfb8US9hFig==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Vernon Mauery <vernux@us.ibm.com>, 
 Matthew Garrett <mjg@redhat.com>, Junrui Luo <moonafterrain@outlook.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>
In-Reply-To: <SYBPR01MB78812D887A92DE3802D0D06EAFA9A@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB78812D887A92DE3802D0D06EAFA9A@SYBPR01MB7881.ausprd01.prod.outlook.com>
Subject: Re: [PATCH] platform/x86: ibm_rtl: fix EBDA signature search
 pointer arithmetic
Message-Id: <176641459407.16407.6172664210555241455.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:43:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 19 Dec 2025 16:30:29 +0800, Junrui Luo wrote:

> The ibm_rtl_init() function searches for the signature but has a pointer
> arithmetic error. The loop counter suggests searching at 4-byte intervals
> but the implementation only advances by 1 byte per iteration.
> 
> Fix by properly advancing the pointer by sizeof(unsigned int) bytes
> each iteration.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
      commit: 15dd100349b8526cbdf2de0ce3e72e700eb6c208

--
 i.

