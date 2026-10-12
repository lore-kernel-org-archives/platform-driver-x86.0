Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B909C48820E;
	Mon, 12 Oct 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820469; cv=none; b=ixBSnlDDqgh5dhnKVji4eB7kxn0BbnSGEwO3XCgrNvdxNgfFH6xeOTTcizM//axKJO7z1ymNNxlBpZKdYvoXzP3XPGzpNWFP+M9CZ0f2Se7ITh4a3Y2TEX25uyhWMkeGqEf9PAeozJHLz4g4sd76GYhefvKXf+OcsIartBGTC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820469; c=relaxed/simple;
	bh=IIMW/dmTV3UCLM5ovIpjNEopYy6cTPYvlu+jWVX9WDk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f/jgGIYc0FA5PG144U2E4lbDVsEVJrc4VecmGuONBOJLhu7fr61I6wqQmWrWbXCxQq/1uHEqp0InZVoPD4rABbyTQCxy0L9j1YbWQM7hMsOzwEBDBgICglBatS9dS9dGqZ6qodr+ZeAoDxk1nBFNWbfRS9zAsQjk7wA1uPg99Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O87p0Fcx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O87p0Fcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820468; x=1823356468;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IIMW/dmTV3UCLM5ovIpjNEopYy6cTPYvlu+jWVX9WDk=;
  b=O87p0Fcxgv3CDMQd97Zj75N1pSAWClbjOvfevYWJctLCHloPaJu1PDzy
   HXq23ISkmu7XGiJfHYZpqbgJX2jieYyRD6oiQvfYHGqyjZEYcXvfXOO7d
   zQGY7WCVotoelc3pgnBmXkatUeIiq6cS35TcJGtBf9f4iY6OuzHgVzC/d
   4rQT3ZXiN/g/xn9ysZETIpmxhFdYwSjW3w+ON0OMS1KYW8JQvjKwXiZGP
   W/JklF773G0N0C3hR6xB11L1RmTkSl/zU3PTOe58T4siWdhxzlZ7MJZby
   oNAyPOB10s9AuEeNvt1HAIP39CUkRGIKiXQjy8OVLHfCzmLfXGJgqR2dK
   w==;
X-CSE-ConnectionGUID: fhaOzVBDSG6cczljHWXkww==
X-CSE-MsgGUID: TUILt1l5RgycCS+99IyUsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="522461"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:54:27 -0700
X-CSE-ConnectionGUID: it9lUr5cRJWiuKokDjrv1A==
X-CSE-MsgGUID: +h7KJvZUTBKtk0N4xH+fhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="843770"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:54:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 18:54:20 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>, 
    "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rodrigo.vivi@intel.com, ayaz.siddiqui@intel.com, 
    syed.abdul.muqthyar.ahmed@intel.com, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 0/3] platform/x86/intel/pmt: Fix crashlog regressions
 and add completion uevent
In-Reply-To: <20261001220351.1592138-1-david.e.box@linux.intel.com>
Message-ID: <3aa06f60-12a3-23c5-9f5e-dd3d2b1d0448@linux.intel.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Oct 2026, David E. Box wrote:

> This series adds a uevent so userspace can find out when an Intel PMT
> crashlog is available without polling. It also fixes two regressions
> from the v7.1 vsec rework that prevent the crashlog path from being
> used at all.
> 
> Patches 1 and 2 are fixes, tagged for stable:
> 
>  - Patch 1 fixes a NULL pointer dereference on any read of a crashlog
>    sysfs data file. Commit 353042d54d82 ("platform/x86/intel/vsec:
>    Switch exported helpers from pci_dev to device") started using
>    entry->ep->dev, but only telemetry entries allocate an endpoint.
> 
>  - Patch 2 fixes an inverted return value test of
>    intel_vsec_walk_header() in intel_vsec_get_features(). On devices
>    without DVSEC/VSEC capabilities that describe their features through
>    device_data, probe fails with -ENODEV and the auxiliary devices it
>    created are torn down again.
> 
> Patch 3 is the new feature. It emits a KOBJ_CHANGE uevent on the
> crashlog<x> device when a completed crashlog is found at probe, or when
> a manually triggered capture completes. The event carries
> INTEL_PMT_CRASHLOG_EVENT=PRESENT and INTEL_PMT_CRASHLOG_COMPLETE=1, and
> the ABI documentation is updated to match.
> 
> The fixes are sent together with the feature because patch 3 cannot be
> tested without them. Crashlog data cannot be read without patch 1.
> Upcoming hardware with crashlog support has no DVSEC/VSEC capabilities
> and describes its features through device_data, so it hits the bug
> fixed by patch 2. Patches 1 and 2 do not depend on patch 3 and can be
> applied to the fixes branch on their own if preferred.
> 
> Testing: the series was tested in an emulated (QEMU) environment,
> covering both the probe-time uevent with a completed crashlog present
> and the uevent after a manual trigger completes. Hardware with this
> crashlog support is available, but testing on it is still pending.
> 
> David E. Box (3):
>   platform/x86/intel/pmt: Fix NULL dereference when reading crashlog
>     data
>   platform/x86/intel/vsec: Fix inverted walk_header() test in
>     get_features()
>   platform/x86/intel/pmt: Notify userspace when crashlogs complete

I took the 2nd patch but the others seem to need more discussion/work 
given the recent changes.

-- 
 i.

