Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794707391;
	b=pr0n4edEJ24K5UEO3FTdt4ceeWzH3A2IlZcUFI2DOtyFYFp9trZExU+mUgYH9p8dAlbf
	 9nguGnZG//jgBbK6O7glz+4LfwpeV4mjZVMsDFF20mwG/Qe5DNvdahiSk/oIDSw6tLRgL
	 kwnqoajOzkq9qQfRprNzsDr46+vx/xRd4q9VXYoOL66uoT4ZUW42aXdT1u6UO1Wo/WEb+
	 OLrN6t5CJTLIRy8LdNKKD01UQ9VSl3XIVWaaeXKE7ZMANPBvLf75Omyvgs7hNQSgzhtpp
	 315NZVjqO4Pl9Lsd2OL1LAPUbNf7ReXOWIOKNLhI9dnUKea8Rqm72vob+WvqRuc9Wqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707391;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RY+3zTaheaZaJwV0g+DnVk5UX0CGm1CESbGbwowCPAo=;
	b=n4plDCZ+VHF45fjh71e0VM6GepbPNbG0joL3Sk5sqsGImHg5TFILoejGMJ15TOJ5Kxm3
	 n1g4bysvGmcM430yq5Nxx/+gJJswqO6LzG4aKsdsVk7wAVfMGVK+3dHmp5dWESF7YXS+p
	 NOkPs4wevBu6DtHeTybOEd4ttDu3r963yy7M4oSoCA6bHb+rPhuQOLnkDBauVG6tOPSYM
	 Ft1iwOLlU1MInu2EHsjJodPNdBJ1IMvOJkWL8JjTADS//mtzKYJFSutyeDag3/8hbwKOG
	 lxpz1ze3fiDxCv0WRRf3IyJCtXAQO+f+YGkdKg7Pfh3rOQ2RUopV43bN87rSj6cXmZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dzt9pali;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EB6606A32F;
	Sun, 15 Nov 2026 01:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EB6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dzt9pali
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794707392; x=1826243392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sw2BCA/L3ATBD9mSg1o9inHSaQ+ku7cx+a5WeNLUnVk=;
  b=dzt9paliYb6fSHRfzd3GKm9wH6Ot480fDGcQkWLtX0PX7tp1O5IlpRkj
   BayanA5BS+pw+t8bzFQRYxGd8yS8rxcffGDRXaIV1MQgJ0HD04+9hCNei
   x7Nm01pXvmdo9h6cu+qcEPPiQuNjHL/ewtEwrxNeZQbfJM836APKByGZ3
   AtZ3+cXxGyNUKt08DOKn8mtpUkeHt5oPu1xeiyZfCS2bvmkw/uhtotsM0
   uJmO7GU5ppHHkwXAO51I5FtlSABTQOSGJubf/DLMNaP/4iOeaO+jSjhY6
   ToBZ9TUCI9uYpLWJgJFjcnOhCO0HUpqCaed+2k0qo6ecZTXAkjCprB8iA
   A==;
X-CSE-ConnectionGUID: 6Uj7DH4zQJyc0ZdoNrLRVw==
X-CSE-MsgGUID: a+bjwgoTTXGzJf4imh1J+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3476607"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3476607"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 17:49:50 -0800
X-CSE-ConnectionGUID: NNyhtCDHR6uaBc0Y/H12Og==
X-CSE-MsgGUID: mrkjLSFXTEeZQxaDOc05hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9492168"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 17:49:50 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/2] platform/x86/intel-uncore-freq: Fix deadlock when removing attributes
Date: Sat, 14 Nov 2026 17:49:48 -0800
Message-ID: <20261115014948.2517688-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
References: <20261115014948.2517688-1-srinivas.pandruvada@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uncore_freq_remove_die_entry() holds uncore_lock while removing the
attribute group of an entry. Removing attributes waits for active sysfs
callbacks of these attributes to finish. But the show and store callbacks
take uncore_lock, which results in an ABBA deadlock:

  CPU0                              CPU1
  ----                              ----
  kernfs_fop_read_iter()
    show_attr()                     uncore_freq_remove_die_entry()
                                      mutex_lock(&uncore_lock)
      mutex_lock(&uncore_lock)        delete_attr_group()
                                        sysfs_remove_group()
                                          waits for CPU0

Mark the entry as not valid with an invalid control CPU under
uncore_lock, and remove the attribute group after releasing it. Free
the seqnum_id after the attribute group is removed, so that the name
can't be used by a new entry while the old attributes still exist.

Adding and removing the same entry is serialized by the callers: CPU
hotplug callbacks in the MSR based driver, and device probe and remove
in the TPMI driver. Callbacks running before the attributes are removed
are safe: the MSR based driver returns -ENXIO for an invalid control CPU,
and the TPMI driver MMIO is unmapped only after the device is removed.

Fixes: ae7b2ce57851 ("platform/x86/intel/uncore-freq: Use sysfs API to create attributes")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../uncore-frequency-common.c                 | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 6051aa040abf..22019099a857 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -313,17 +313,24 @@ void uncore_freq_remove_die_entry(struct uncore_data *data)
 {
 	mutex_lock(&uncore_lock);
 	/* Nothing to remove, if the entry was not added or already removed */
-	if (!data->valid)
-		goto uncore_unlock;
+	if (!data->valid) {
+		mutex_unlock(&uncore_lock);
+		return;
+	}
 
-	delete_attr_group(data, data->name);
 	data->control_cpu = -1;
 	data->valid = false;
+	mutex_unlock(&uncore_lock);
+
+	/*
+	 * Removing the attributes waits for active sysfs callbacks, which take
+	 * uncore_lock. So this can't be done while holding uncore_lock.
+	 */
+	delete_attr_group(data, data->name);
+
+	/* Free the ID after the attributes with the name using it are removed */
 	if (data->domain_id != UNCORE_DOMAIN_ID_INVALID)
 		ida_free(&intel_uncore_ida, data->seqnum_id);
-
-uncore_unlock:
-	mutex_unlock(&uncore_lock);
 }
 EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, "INTEL_UNCORE_FREQUENCY");
 
-- 
2.55.0

