Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1795322C78;
	Wed, 25 Mar 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467125; cv=none; b=chzIw5MSedelKKK8oGdWL3a/sqC8h2yqXXB9poyjs2mqDYsU1MeNSP0L3YgILL+AhTSLhjIg9BO3iEabtH5tycHAUi9SGJwwqp+QpZk8peATA3xuMInBWRgyJ4X/xlKa3GXDAq2HGmoUBjLcwCLYUbnHI/jvWDpASBaCy5fimek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467125; c=relaxed/simple;
	bh=nLYBy1U8dsQHa/PSjMVlcXGEoTw9hfhmhLi/sBQCUWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFD7Uccjem/nwVYZAEBkNADLM59OaxmTbi0t6NWfAP4BekqWcthPd42iz93J66Lej5MHErHqD5NS6iNkcoqn6pQdL6U7STE19Q/d29ki70RYdMEolT/pBjP/abiWeJmNRmu1zi9Vj9e/oR/yDCodMttpvYlt3JK87z8VCUWHZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJ+l1p8n; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJ+l1p8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774467124; x=1806003124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nLYBy1U8dsQHa/PSjMVlcXGEoTw9hfhmhLi/sBQCUWg=;
  b=VJ+l1p8nqvy4Nl2rtFfC9Db+5jQFyzTT6w17qHLh3R+MUDuVbZcdMNWp
   YpJ7UuIwSo1BzoBb4hapn1edAtLwM6r20L7uZyiIhOS2WMQvVGuTG7SAI
   faXar5nfZrhqv7UshQMdrb1z+Qgl6hn/mfoztXTUO7z6t182ZLBiC3jDG
   c7AXpMIxon4dgGd/t6iWBOdN/RjSx4K75Nj8MkKTX0p0EEtbe3NsTElQ8
   eiTlzmQs61NyrG36e7bkkQPYN2ZcUjlKGcPjacUBKNARr4E+dWTO8KcuT
   hPbcAdYfWL8DTCPKrxo+6GMeVC0d+z+MLHcjTSxQ8MBnkDuE/4bOiktvJ
   Q==;
X-CSE-ConnectionGUID: jh6CZHFqSzK+rUVyFYyqyQ==
X-CSE-MsgGUID: P3mSvcVRTG6BsFf00edNKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75403596"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75403596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:32:00 -0700
X-CSE-ConnectionGUID: przD5MYpRxK62w2T7wR9Tw==
X-CSE-MsgGUID: PYJGTGJ4RAuUc37TtnwagQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228844528"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 12:32:00 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] platform/x86/intel-uncore-freq: Increase minor version
Date: Wed, 25 Mar 2026 12:31:58 -0700
Message-ID: <20260325193158.3417382-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325193158.3417382-1-srinivas.pandruvada@linux.intel.com>
References: <20260325193158.3417382-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation doesn't require any changes to support minor
version 3, hence increment it to avoid "Unsupported minor version:3"
message.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index b038dbb69447..7381378aeed8 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -31,7 +31,7 @@
 #include "uncore-frequency-common.h"
 
 #define	UNCORE_MAJOR_VERSION		0
-#define	UNCORE_MINOR_VERSION		2
+#define	UNCORE_MINOR_VERSION		3
 #define UNCORE_ELC_SUPPORTED_VERSION	2
 #define UNCORE_HEADER_INDEX		0
 #define UNCORE_FABRIC_CLUSTER_OFFSET	8
-- 
2.52.0

