Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BFC1A2396
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Dec 2024 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734529304; cv=none; b=hg/ZAxo3NTui/dcTGsGFyFOZXkJASIidEWMb8dg4EXHUiOg2ygXphIqP8r5DHasORWlox1bstEeFbewgLnOvSwCb2ie6B+BAtsLMqZy63TEg5r+LyPxm7PJ+ddLlzPexf6FTG7biVqKweuhrs2gJoUwaPnFj8RjYzqYL0q6TI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734529304; c=relaxed/simple;
	bh=7/Y0GRt5e4ac5Q+O1rXzZMVy4kPhMVIxv6aiKhMklx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CmdysFwaTsYcDLCCqOcVjFIV+GZiHCThw//tBEZhiGfRE8vzCaNfFFE9hg8jIyeVUYJEKH/M1o0zpQ81Gw8WLTWAVtXR9/7ayl8NjWtZTGI0kdZ/40HlUll0wePPFC1uZYnlwiCsY1KcIEIMEN9CnT/Y+Je+xRi7npMXN5zatU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhUjFa+l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhUjFa+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734529303; x=1766065303;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7/Y0GRt5e4ac5Q+O1rXzZMVy4kPhMVIxv6aiKhMklx0=;
  b=FhUjFa+l+WNguKR48b/U+hu2YTpXJy12lsNG8TrxW0KailmQrXSG+i9X
   NS72hxRRKEGERutsCDP1Vd/HCQlJgPSln7vMqKBbvG2e9mZ4/VlGlN63O
   I27iiwbOxs5N5mWQ6YiPRphvrlyBWIFPDAkzmVgZeX5PnvRHZsHnm6s8T
   81paSpbBf40h5uQgsiGoDoV75tmezzO4RKcUd1PlX50+EjtqOwXNZoUOt
   op+Dos2oq7G8bIjNxaRwQNzGZUJfnP8/p5JwNjRl6W6BmZvahNJ4GcyV/
   FenWH54VOpXQbj3I61PuRl7fDN59lH598t0DCSl4ccSIt/VKwfgJLW0If
   w==;
X-CSE-ConnectionGUID: ni5DtoPORvePJVnLjnUTVg==
X-CSE-MsgGUID: bXPnneFxT62heTuBMKjyAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38785666"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38785666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:41:43 -0800
X-CSE-ConnectionGUID: wFXnX617Rp6YEdu0AMxIag==
X-CSE-MsgGUID: oL5v85yhReiIDBM/+bcxLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="128657339"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 05:41:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: vadimp@nvidia.com, hdegoede@redhat.com, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241216022538.381209-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241216022538.381209-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH] platform/x86: mlx-platform: call pci_dev_put() to
 balance the refcount
Message-Id: <173452929402.1146.1326740555930865674.b4-ty@linux.intel.com>
Date: Wed, 18 Dec 2024 15:41:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 16 Dec 2024 11:25:38 +0900, Joe Hattori wrote:

> mlxplat_pci_fpga_device_init() calls pci_get_device() but does not
> release the refcount on error path. Call pci_dev_put() on the error path
> and in mlxplat_pci_fpga_device_exit() to fix this.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: mlx-platform: call pci_dev_put() to balance the refcount
      commit: 185e1b1d91e419445d3fd99c1c0376a970438acf

--
 i.

