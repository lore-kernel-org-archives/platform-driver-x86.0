Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E9222582;
	Wed, 10 Jun 2026 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098182; cv=none; b=bOVL9ou0mQR6O48I6eDUxEkFn4FsKvWXqe0rcNcIQU1tAV6DhwxKX3Wui2zmEDqXHBOsdJoBWCKpj1vC8V5z8vno7zVWFnOVwngGcMEmv3rxV9nc7yeUV5YqWyMHFE2fI7pXfQkJdKFNxUSZEsc/Hm+nmfJBuC3cGHehOrhDxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098182; c=relaxed/simple;
	bh=JG3JuNxSjRbujF9iMmxO24OWtssU66AA/iJqj+tOYh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SFWEG9YxBKDwCr/1DyGNkIYypAdYs1Y3kyk+v8dHW51UWOd4tm4c2EWSGqlTUcswTgSRw7pas7Ik7ual6IHsiKBW+pCMy2LkdhjRRcPcNUMTg9jWKut1DqBxFI96Q9cNlkgIC1aK1Y2pfdOv9aDyafKK/0oLgRoxaTzKPBke7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dP0nmHRJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dP0nmHRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781098180; x=1812634180;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=JG3JuNxSjRbujF9iMmxO24OWtssU66AA/iJqj+tOYh4=;
  b=dP0nmHRJN1ZuzfnLddAg4CgOOrA6fiZv/UDVGmlNib8WlTwr9Khf6AM9
   dzgqLsGD+xxC0OkrK9RBNe0PAJ57z3ziutOUuHPjgxHF7IAgvgH4uUIwI
   x+hmZW53HSivHw1+JGjJL6Oein3pR614FyFurj1p82K7esIEvOjLx0L92
   ejrewt/32TSJ78OzZCxebtDtJajUV2kc/Nu6aB9yfg4MAVOpF/xht4bHH
   6+JCCUbpMgBIQhdO63THKMNPixGTivbHbrryMJNYnwDmMFE/Iw27DhfKO
   c1IwgXM3kLogvooouBpAm30swMWu0353aYQRNQWpiDx7ZuzXCM25jKJu1
   g==;
X-CSE-ConnectionGUID: FK3x7ibsQnGRwRcXlg9+Bw==
X-CSE-MsgGUID: i4vYBttlS7ygjPcwytj/xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84460617"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84460617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:29:39 -0700
X-CSE-ConnectionGUID: 2R+4T5QeShSPguEEDLXkbA==
X-CSE-MsgGUID: ai5HphkPSVGpfMoCzAbtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243712258"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 06:29:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: michael.j.ruhl@intel.com, "David E. Box" <david.e.box@linux.intel.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260529183150.129744-1-david.e.box@linux.intel.com>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for
 header walk
Message-Id: <178109817239.24283.13772452562650349778.b4-ty@b4>
Date: Wed, 10 Jun 2026 16:29:32 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 29 May 2026 11:31:49 -0700, David E. Box wrote:

> The base_addr refactor changed intel_vsec_walk_header() to pass
> info->base_addr as the discovery-table base address. For the PCI VSEC
> driver this info comes from driver_data, but exported callers may provide
> their own static headers and leave base_addr unset.
> 
> For xe, this made the discovery-table base address zero instead of the BAR
> selected by header->tbir, preventing PMT endpoints from being created.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/vsec: Restore BAR fallback for header walk
      commit: 375bbbbd112af028ee0b45d833a6233c23d19bbf

--
 i.

