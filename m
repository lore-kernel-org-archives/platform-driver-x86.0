Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193222D9E6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057029; cv=none; b=IfRk0p9e8ud02NG4vLX/FYPym+mlrH5czuhNz1CxIfyzMYQFyaVGjYmY441LqzijyjhZ08/mxxfGdxMfFFLvCPG3GuYHPJfcoxnKYvWYdjfEFUWeLQ8gs7J5sFDpqae57yWSGa1AzoFNTxdcwnuWR1t6YEHUA41cYIrBSzJifz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057029; c=relaxed/simple;
	bh=BJcfpLwdp7OjNfdXNRDZjblDyEz0umlF3JSqpfLr03I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKVmjIDWaswf8BxCA4tosv1CaxpCAktftYfxOJ+FxVla/Ab8PnDvjQ8jierwwiRPzxjRmIhKAziC7b/lwRCeJxjzmTpQKgNGezqA4CMch69urboIFbkpVk/a8MF0Z3fuOTW+2OIqXz/ExNclv9kHOPYRLnacf5LJqkt+Ke4Uw3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwwMbJFN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwwMbJFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057027; x=1782593027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BJcfpLwdp7OjNfdXNRDZjblDyEz0umlF3JSqpfLr03I=;
  b=ZwwMbJFNVI5aihYrjzEoXIRttaR3mlpwNh8hZ5/Bl7USJZPR3GQfaYW1
   /ZYgSq64YbtiEh8YKCws0AGvFYIBd+36kdjw44w5xW/CdRsYPf8td6LjT
   BJZVT+rafXlrKJwMOyc8KFGJ9/8F/bKt+hL/0kQQH3Y9LbEuZWFS+AOff
   fkwkIYI6+UjJv++CKvh+duiheqRXZh1AwdmmiHQiLRpAzEfRYE99Fb/sV
   U2U7/SvL6d4QCqPiwQaYhA7tUvxLE7y3/fG629a/EgmVFjYHeIX6oILAW
   PPxJwvK4cyPtmF1m1rmtxqGBpqYmvv/OFOhYKxB7Js3KCQr+RqPFD1Kaa
   Q==;
X-CSE-ConnectionGUID: U9H2I3jNSceOzmEzryQFog==
X-CSE-MsgGUID: jdjVOnptSs+IN4J5PXkZyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003203"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003203"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:47 -0700
X-CSE-ConnectionGUID: MrFUUSUVQYG9uiqArmvggQ==
X-CSE-MsgGUID: fKjYIsXeTieh7RqGhOq4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939019"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:46 -0700
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
Subject: [PATCH v5 06/12] platform/x86/intel/pmt: re-order trigger logic
Date: Fri, 27 Jun 2025 16:43:15 -0400
Message-ID: <20250627204321.521628-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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
2.49.0

