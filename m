Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977D23ABB3
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086733; cv=none; b=NDBSQ494c5LtkXthf/JR+wMdCe9OhEzD69JSyicgXoRwCwE6zFezc4I7s7wowFV+3jAPeJKRvzKBPKBZ2qyFkIcBpVv9bMNbb9ZhxAlQYzRm0QdOmk7/N8Q1GYIXwhCPJmURUvMjlvIKj/1BOhAxL1zQuLKFHeIzDhmWwDcn8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086733; c=relaxed/simple;
	bh=D9Zul45yjXKzwokdO1jUDxBZAEv2+NuRjL3Kzqe+gm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5M8XGeW5jmzZI+7Burck5NBNiKE7VRhOZy9+aonyz0WRx/RClZoSvpoW9+88myy07+kLIsQ9kRt5avBKyfek5NLlOSOyaEdyGARY0djub1xLPLUx2o3ZXD6N3t6XfVEoz+jMT07Pmo04vUpH9pBJ0Ni4lR8DJGXeN9xcjXEqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXr2G0hC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXr2G0hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086732; x=1783622732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D9Zul45yjXKzwokdO1jUDxBZAEv2+NuRjL3Kzqe+gm0=;
  b=OXr2G0hCYas+ipIz4rWqa0qZl7fs//HYXDQat3jILTg2px8PV9e31niU
   h8Z4gFafv9c/qshHfofDNC+eaDXxWwM4HjW28A9HwM1fcyI+nGRuwJTQZ
   HP3YuI58vFNhWZdyFkPumZf0klx1NDm0mw18lPWk3Nw0XwcdInyjlQzs8
   /aPxscs6mr2TaYa66sXCBS0/tHAA/KYfUd9pA2myBHboFznaSpgpEVAxv
   YYae4irn6wA7SJPJ8lR++BoHExzjc+9P+tijt113zPf5EcIaSsUUf9JG0
   6I1qcOv4mwyobY5m9P7D8WN44N64JiXrQRcwNnD/6OsjV5A9hf8LUUGiV
   w==;
X-CSE-ConnectionGUID: bLPmfIvOSZ2XTuOBRltCKg==
X-CSE-MsgGUID: SO9lcEPoSLKvJRFlw1ir5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451065"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:32 -0700
X-CSE-ConnectionGUID: pph8gk8qQEii73pMzS7MmQ==
X-CSE-MsgGUID: /q1U77/PQVOz6wR+c3za/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404876"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:30 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v7 07/12] platform/x86/intel/pmt: correct types
Date: Wed,  9 Jul 2025 14:44:53 -0400
Message-ID: <20250709184458.298283-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple of auto variables do not match the return types of some of
the functions.

Update the mismatched types to match.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 440d2045e90d..881f4abdae14 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -138,7 +138,7 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	int enabled = !pmt_crashlog_disabled(entry);
+	bool enabled = !pmt_crashlog_disabled(entry);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -169,7 +169,7 @@ static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry;
-	int trigger;
+	bool trigger;
 
 	entry = dev_get_drvdata(dev);
 	trigger = pmt_crashlog_complete(entry);
-- 
2.50.0

