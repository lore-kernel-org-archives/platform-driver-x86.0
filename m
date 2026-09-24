Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9937AA6D;
	Thu, 24 Sep 2026 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278446; cv=none; b=F2IfYXdXhuXBk+eDOFeDKLJf7YIL53mEe4jKgGXZ2Tf+zTwA9BkuzeX7yToFPmpxGzMRtkaaS+ouQmJTKH2tS9+MRJ2kZEQ9+I4ID6CeYdQ7YhALqo7zhOQuBAsNdzEiYOti5BKmWEwt0nfmHAA0HJy3xjhyQVNjrCn3qbw6nmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278446; c=relaxed/simple;
	bh=bquA6qE5PI7Q6ShEgxRTtwwOE0jIBsgmr0VLnP1yKBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EzruDdu9mhNh4RPWh6XzloByPp06f1BSkNyVdlK+YWVjDOy3y2XY3WHpJnrrWbGIlNOECmuPrG+cqyWEx/uJCH/1Q/zRUgbrypienlucU0V1vlssTZr4Dnzi3ivhSnO3GgzMeLm7qlrJj/eh0TTNfD32G+baKNBpypFqP+2fDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsuilLl6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsuilLl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790278443; x=1821814443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bquA6qE5PI7Q6ShEgxRTtwwOE0jIBsgmr0VLnP1yKBU=;
  b=WsuilLl6zLn4LcmVlPHw/50B4DikhtYi8/J7dbMejwN1qAZ+gBTmiIc1
   s6cIQGdkGdB/VhlBruS7U257nPB+U1wxlN4mvb2w8+23IRwuJJjqeNR5W
   f5JC7AgW8nCTmGAnAvGb1A3jZpDWnDrEWO93EIvt/iskwxLJIqVM1Fb0+
   S5/kXDtwUsG4BQX91ITa+lyRia0O6fQewxG8LvWK9oESOqXCcXj/l/4dS
   BV/tWdcV1YMB1a0MdcTykjKZbNXmNLhDaW/x72BF/k8W42O4POSYoOxzg
   7K/jwYARgqbmokeor6SAgRzwVpoyHqu0MYsVIhC2K1NT4QdKskrMzp3lr
   w==;
X-CSE-ConnectionGUID: RkqYjB4FQEGGQ6OuiaVWJw==
X-CSE-MsgGUID: amqBEP2QRI2Ui1ZNcpXUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116591525"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="116591525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 12:34:02 -0700
X-CSE-ConnectionGUID: qFbGXUBVSwOpx9Ru1J8PGQ==
X-CSE-MsgGUID: /M1bvfG0T/y20PD+xQ7a2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="271960856"
Received: from b04f130c8410.jf.intel.com ([10.165.154.100])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2026 12:34:01 -0700
From: Kristen Carlson Accardi <kristen.c.accardi@intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/x86/intel: power-domains: Handle failed tpmi_init()
Date: Thu, 24 Sep 2026 12:36:23 -0700
Message-ID: <20260924193625.1830526-1-kristen.c.accardi@intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpmi_init() can fail before domain_die_map and tpmi_power_domain_mask
are usable. It returns -ENODEV on CPU models that are not in
tpmi_cpu_ids, before allocating them, and if cpuhp_setup_state() fails
it frees them but leaves the pointers set. When the driver is built in,
its exported helpers stay callable after either failure.

Patch 1 fixes tpmi_get_linux_die_id(), which dereferences the NULL map.
uncore-frequency-tpmi calls it when the world-readable die_id sysfs
attribute is read, so on a multi-die CPU missing from tpmi_cpu_ids that
read oopses.

Patch 2 adds the same guard to tpmi_get_power_domain_mask(). It has no
callers in the tree, so this is hardening and carries no Fixes tag.

Both build cleanly with W=1, built in and as a module. Neither has been
runtime-tested on an affected system.

Kristen Carlson Accardi (2):
  platform/x86/intel: power-domains: Handle failed init in
    tpmi_get_linux_die_id()
  platform/x86/intel: power-domains: Handle failed init in
    tpmi_get_power_domain_mask()

 .../platform/x86/intel/tpmi_power_domains.c    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.55.0

