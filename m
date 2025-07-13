Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B45E156228
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427811; cv=none; b=sqbTM1xjxSFNCB4Hv7XGqUiUc20atE/nNhZDrXtpdQNrk8Jnc02fL2WtDuwGhvqo2M5bZvb2XSwyZwHAkZ+GDK0Amd7mcmQ5zmaIZX6UxbFiR2698j9OPf+GS5PoNENUcC6J4bhxtAOG201gM6Xgx8/p55JasfhY9H2xDE4e0oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427811; c=relaxed/simple;
	bh=FCJ4IU4j+U6xQMZgZnRxgXoyukF8eMT2iB3TNiA16Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGhXJs5+IwJmwipHUqxfgujAbPxFwZFkw4ZBJuop4QNAcLJhrjKJCVx8p0SGubMX37ZK/9GVFjEcJqbG2eq1phNbMOVIfaDkLArDGqL50OCCMDfVmWy35xUggIP/ohdCzsOYnNO5dUfn0gd4wDD1ndzCo/4GHaLaagTtBkHRlbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqeA4NdJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqeA4NdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427810; x=1783963810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FCJ4IU4j+U6xQMZgZnRxgXoyukF8eMT2iB3TNiA16Vg=;
  b=eqeA4NdJC6tM0Cy5NYwohjHajJtVJOmlZPN1fEZ7QLdeb2SOfx8+FGN8
   UQZnShhpE0KggvOlgBqbqxDT8gNyW2unLyGFZgqOmpGjtpbYxEQ/UL+rd
   zAVVYsOwCgw9x8l/eI7X+bun9JpPesA6N3yoSkZaixvT2stu4h4zKRpGL
   kUu/DWQ2fWyvwGdU1V98+i+l3T8ZrB7PnySXpxX3iXHiWiOjIpRfiv0BP
   xSqp2pEftVUL9xMLLdZQDjkE+Ke3tVxV8Cd2muZYOR0b6uaQzVrNHumCy
   Sz1iXs129yWR3aHSqPOVM627DD89gOXqRxIJbJd1APruDw6s7uSYaHz5x
   g==;
X-CSE-ConnectionGUID: XcMqw8xyRc+hB6yPnUDbuw==
X-CSE-MsgGUID: 4eIxZfImRe+31KMsFU3p9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334143"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:09 -0700
X-CSE-ConnectionGUID: ToUTpcOtS8KpuYo09RR2nQ==
X-CSE-MsgGUID: WPC9IbcvSlKm0OszLt1dTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069318"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:08 -0700
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
Subject: [PATCH v8 07/13] platform/x86/intel/pmt: re-order trigger logic
Date: Sun, 13 Jul 2025 13:29:37 -0400
Message-ID: <20250713172943.7335-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting the clear bit or checking the complete bit before checking to
see if crashlog is disabled seems incorrect.

Check disable before accessing any other bits.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index c3ca95854aba..440d2045e90d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -193,6 +193,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&entry->control_mutex);
 
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
 		return count;
@@ -202,10 +206,6 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (pmt_crashlog_complete(&entry->entry))
 		return -EEXIST;
 
-	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
-		return -EBUSY;
-
 	pmt_crashlog_set_execute(&entry->entry);
 
 	return count;
-- 
2.50.0

