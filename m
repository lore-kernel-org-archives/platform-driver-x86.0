Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565D32AD14
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463460; cv=none; b=beuLBtEX74xhhD55Y+4xGmNBYIC+M/d1nZwYqg1sVQICnFIf4/1KDetiOGK+9ZnxhJwhCRcOPqkZqW9BAyeUkMzXXpD49EJ7dYz6Rz8B8+ndfyRZX8UY7CPZVfqiGn8ZK1IXC54LxJR3dRejBgtEHqgp3IE2f7QSW8Yr9xw2ECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463460; c=relaxed/simple;
	bh=hmV3VBpV8Rpet6iKDgF8OX+o387N7yqiVzPh+Z51MKs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kLyFjUX1G467sDYNN0qbtqjaRCntqe2metxdjHH3x2jv2bXHZLPm5+sqzSHUuNCT0emN7uTbZwwyxd4aU9CSAaVNi4O/WzfyHxsL14vBu0zMZPyhHBxsZnCkqOfbpA8/xzbn2VYRFcd7itG2ERi/gEXUZFor/aRJnv6Lw4F7so0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7osei7i; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7osei7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749463459; x=1780999459;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hmV3VBpV8Rpet6iKDgF8OX+o387N7yqiVzPh+Z51MKs=;
  b=X7osei7ijFz7OgEXSjT9W5tbwClRgEF7e/YHeaT8ptL4/MkLl+gNV3tb
   ICf9IR3nW7/p2e+cOzCZK5pyPZg+aBYJT3wxYGHi0fVGAAJxltm3se+vI
   bwHDxcMknWG87OgDwD60YF77ayvtYTwCHCb6Gt+6KuB0LXtKndCPnyr2O
   TtjsvD0UU58M8Gf2vbKwk51+XWdtj0YD00Lo3nxYrcCZz6cwYPazJdrr5
   jHKlcY7fGiwIyaRwcx58apqgKdYTS0vVZt3rwmEbC0vfhJk3d/gYGBHnu
   zzNL8VlfsHCyG/QR4BSazfuog0aBS5MCzqoDUWqqqlvtsGClOr1pE4529
   Q==;
X-CSE-ConnectionGUID: kgI1z5+2SYyTAqIwNhH9sA==
X-CSE-MsgGUID: JYxo2tz3Q4CqyZoCH+Xjxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51529375"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51529375"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:04:19 -0700
X-CSE-ConnectionGUID: EwtlYfLMRK6WxJjqIaHDdg==
X-CSE-MsgGUID: +gg0hpytTiK0ZGLWgDv3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177406092"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:04:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com
In-Reply-To: <20250603055807.2503028-1-suma.hegde@amd.com>
References: <20250603055807.2503028-1-suma.hegde@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use IS_ENABLED() instead of
 IS_REACHABLE()
Message-Id: <174946345241.3675.10830184067559555064.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 13:04:12 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 03 Jun 2025 05:58:07 +0000, Suma Hegde wrote:

> IS_REACHABLE() was required when CONFIG_HWMON was set to m and HSMP to y.
> However, commit 69157b00b526 ("platform/x86/amd/hsmp: fix building with
> CONFIG_HWMON=m") added a HWMON dependency for HSMP in Kconfig. With
> this change, using IS_ENABLED() is sufficient.
> 
> Add the missing header file as well.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Use IS_ENABLED() instead of IS_REACHABLE()
      commit: e7c1a9e8d33ceb44ef088de7a9112a1db94d13a4

--
 i.

