Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EC4E36E7;
	Mon, 21 Sep 2026 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010612; cv=none; b=UKhfqs9UeyW8zVCKv+GivqhFy2+M1ZaIrahhmfqJzfDdgJUqwPOigPHDYDnJzCZ1OMlNo978tPIPu2bVB+IojYigrsEx53gBz/vlLDXeOxBLT77XUTppLYz1V+aSb7nskrrbGh7clsuDT6eNvdy1RR/FHVGVqfEIIg4R2I9b5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010612; c=relaxed/simple;
	bh=3MFm4KTbs4YLJyk6YdkxEqA8q63VNDBOo0H+onYmaQk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YValo/kqp1YG0b6yhHjC8NAqtL+SzHoQZtlsmdOXWcJg4TeekLG9qI9e5gI915DYgmnCOQdXI831qYsbN8RSILrZYtXThCDE+k/ORynxhFP6F9wGdE8RBkxMuq9ZKMRdtXM4LDmlIBBH5REY4jQFfln9oh6iXNG7wv69tb1M8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecCYMqv1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecCYMqv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790010609; x=1821546609;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3MFm4KTbs4YLJyk6YdkxEqA8q63VNDBOo0H+onYmaQk=;
  b=ecCYMqv1g1uSr+Dy+NYBIOYbr/+9Zsw0/WQEepI+XCn7+qloQM0A/sbK
   LjkS7P+5h9l7tT4fmpdxWt099YG6/4hKlvv1shd0mHhTSpUa0eD6095wi
   DUAz3/1u+0FJSNXTedptn3P4USJkuI8Xg8AVn0x00M/V4Zp5aAvWhSIyK
   yFKMD9nllxGVUEwXv/s117OdjAxb1Hze4Uhf3TlxrRXNCcAvTnlJn2Aeu
   uotBF+l/ccq0QnnmsW3KACurKpGhlI7+8ncPixu8Pkd2p0a6kgrP0gPER
   mQ7AerGJYY5bnXk9mXwiB8ZKOUrrAz4TbUL1xWflOD3a/1iFfOniScMmq
   w==;
X-CSE-ConnectionGUID: WjCh2e45TAy9ZnUv4+jlIw==
X-CSE-MsgGUID: Jkj0a8j4RWGK9BPvSWGAlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="93048099"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="93048099"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:10:09 -0700
X-CSE-ConnectionGUID: 5RdilMGfQPu7VYTJtMz5Lg==
X-CSE-MsgGUID: U8TT9cUUTpmpYhdTfn5rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="4076541"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.215])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:10:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Sep 2026 20:10:04 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER" <platform-driver-x86@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fix a few Sashiko flagged issues on AMD_HFI
In-Reply-To: <20260921170411.1149960-1-mario.limonciello@amd.com>
Message-ID: <d70bc046-49bd-79b2-7df7-57d79046c507@linux.intel.com>
References: <20260921170411.1149960-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Sep 2026, Mario Limonciello wrote:

> Sashiko flagged a few instances that could trigger out of bounds or
> use-after-free.  This series fixes them.

Hi,

I suppose it would be fair to credit sashiko with tags.

> Mario Limonciello (3):
>   platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
>   platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking
>     data
>   platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy
>     device
> 
>  drivers/platform/x86/amd/hfi/hfi.c | 34 ++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> 

-- 
 i.

