Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB903793D0
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563477; cv=none; b=Ouqekue1uA2UrEeTLlvqBhb1IwXSWmPFIG+LWf7Wf6MEnXBN9g0rwv1k9g7LhxEUrZ9mLOD2S0cAHA5W5QsT2RxEMO3LZCyZxZ/+pAMST8IJ6dH2kZAlryVPa/FvYIjisg+WFD0MqCyMLeaH+acruFBuU5W12Z/B6hKvltLynp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563477; c=relaxed/simple;
	bh=h+XjnIB9qyjCiNKiaKwh4C5hfVDLAKuIBwNYo5HuUn0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZUjZrPl6veAecGcWblyrksNDhqdfzikZP8SFHIyxyQSYDedP4XbmCpSNdS2CaUrimJ8eLmzazYtE2eEyw1ZOi/vPhOrOj/TRtgclVwu5+VeE0GvqU/EFNDgygvcBtm86Ihl2G7AFQHdbnMXvilbAPzHOfAYMuqGysTnSIYbZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zvet24wK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zvet24wK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563476; x=1818099476;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=h+XjnIB9qyjCiNKiaKwh4C5hfVDLAKuIBwNYo5HuUn0=;
  b=Zvet24wKXLg6dUCvWub9LsvO8L6ci/w5ysCpYrxts+7hMSenAP39rjpy
   Jx3Frl7wMHOaB7ZoDLO4AyWVI7vqw+U73T2IItfOI/MYwVBGcymmNISmt
   CBgIqNBop+4wVsVsL0AMQcziuCdcTL3mPSZxNQd1gOmNOWlrCeE9/15Kx
   Jo/P+N12WcYRK6mGpkG3OBIbpZia2KNgHV9exHjRzmBUGnm76+a692m/H
   035y62j8Ajnd8VF8g1NcSn7t4lKJDs8j9KoHNoiBIDsu4l7rcwCgtZ57O
   DpR01z1rcziNiPzmwv+lbcMRZx0NoWoZqTGz4TivwMCKXPNzz6nQTKUwW
   Q==;
X-CSE-ConnectionGUID: 6yD04aaQSx61PBwi3O//2A==
X-CSE-MsgGUID: CdOcKT+sTTqep/ZcFXSzIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515365"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:55 -0700
X-CSE-ConnectionGUID: dcoOqYdDSoC+2xsIKaPdEA==
X-CSE-MsgGUID: 1da8AUP1SRyQ3syA+sMBlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779913"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:55 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com
Subject: [PATCH v2 01/10] platform/x86/intel/pmt: complete pcidev to device update
Date: Wed, 12 Aug 2026 12:37:42 -0700
Message-ID: <20260812193742.2170188-13-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the pcidev usage was moved to the struct device.
The struct device is set for only the telemetry endpoints.

This usage prevents other PMT features (crashlog) from using
the callback mechanism.

Use struct device in the intel_pmt_entry.
Update callback usage to os the pmt entry rather than the
telemetry endpoint.

Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 5 ++---
 drivers/platform/x86/intel/pmt/class.h     | 3 +--
 drivers/platform/x86/intel/pmt/discovery.c | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d0ab8e33c62a..402d51df834a 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -100,7 +100,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count = entry->size - off;
 
-	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
+	count = pmt_telem_read_mmio(entry->dev, entry->cb, entry->header.guid, buf,
 				    entry->base, off, count);
 
 	return count;
@@ -286,8 +286,6 @@ static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
 		return -EINVAL;
 	}
 
-	entry->pcidev = pci_dev;
-
 	return 0;
 }
 
@@ -365,6 +363,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 	entry->guid = header->guid;
 	entry->size = header->size;
 	entry->cb = ivdev->priv_data;
+	entry->dev = ivdev->dev;
 
 	return 0;
 }
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a0ece4fc3837..258cb460e61c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -20,7 +20,6 @@
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
 
 struct device;
-struct pci_dev;
 extern struct class intel_pmt_class;
 
 struct telem_endpoint {
@@ -42,7 +41,7 @@ struct intel_pmt_header {
 
 struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
-	struct pci_dev		*pcidev;
+	struct device		*dev;
 	struct intel_pmt_header	header;
 	u32			disc_header[PMT_DISC_DWORDS];
 	struct bin_attribute	pmt_bin_attr;
diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
index c482368bfaae..f4203d240f54 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
 
 	mutex_lock(&feature_list_lock);
 	list_for_each_entry(feature, &pmt_feature_list, list) {
-		if (feature->priv->parent != entry->ep->dev)
+		if (feature->priv->parent != entry->dev)
 			continue;
 
 		pmt_get_features(entry, feature);
-- 
2.43.0

