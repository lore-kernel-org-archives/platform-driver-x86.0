Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88B48F84E
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048803; cv=none; b=FLi1vNgVZ0msL+bzUh7jvPL8Jk3zqmRq+J7IVSIBLRJ6awCFAOrAZdjkgdaxAaAmlrhAkG9JjA3YkulrrV5+QDLjcM55LzVJlIBhxjq0KkGE8cUje+8MzdTeGNyDykdN77P/th44GmbostH/IS43Nh0gqLY61aTYhuto0u5xtnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048803; c=relaxed/simple;
	bh=tejf/g7U0RXSYODUyA4uZHUCv9tf3bZOzvURTjBFqe0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dJJw6sfY+XadT6vkMuGCHfbfGtQET3FEXEpN8Ptbjh57z8tlDqlo6uD4HW9Y34R8fh6f0dMbZaIORovRluolDx5buPjbd0aWKBOYNLw5ntprvjgELwxmZ7yBAeilW7d/Cq1FE0bZXD+IuuzlhpaWbRlExJsJJ+pzOWgXWWt5Eg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ha669hg5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ha669hg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789048802; x=1820584802;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tejf/g7U0RXSYODUyA4uZHUCv9tf3bZOzvURTjBFqe0=;
  b=Ha669hg54x2F2ZuobdNTGqjjAnLEruiywJPQtB5+6Z2wankTQJKBKWzV
   Uxoq6jeEKfzxNzdhNoghEtQ5gUisuL6DheLsJFcws5XdoQDvQ+Mr4bxMW
   0LfIXXIBlKWjzoaTqnJR9dAUEcZJXrZ0T2RqAzsiP4W9P/Zca4cauXkuE
   c43luMeQWFoY47AR3IoobXQXbmGcebjRWfSBZeKjm4XGVSS/UPEZBEEuv
   kuZAVPWdhblScBa6zioZSsJ+Bd54rjGQdAXha3lXyChXkqoH7HVZcuykX
   MDAnNxDdG5MJE/7Dtzkmph1sYfhXBXbsWD1VqBjeqkcqu6MIFiP81tu6U
   A==;
X-CSE-ConnectionGUID: M4JlIoLfRt6DLKeobLCvdQ==
X-CSE-MsgGUID: 5MTethJHQ/20tZnKHaxQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89431492"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89431492"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:00:01 -0700
X-CSE-ConnectionGUID: GO+AlhyyS9CeabgbGOOJDw==
X-CSE-MsgGUID: Zvjvl7O9RouEnJVz8FBD+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="309903678"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 07:00:01 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	david.e.box@linux.intel.com
Subject: [PATCH] platform/x86/intel/pmt: Block mmap when callback is present
Date: Thu, 10 Sep 2026 06:59:55 -0700
Message-ID: <20260910135954.1586360-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the introduction of the .read_telem() callback, control
for access to a devices data area must be done by the callback
owner.

This means that an area cannot be mmap-ed with the default PMT
handler.

If the .read_telem() callback is present, do not support mmap.

Fixes: 045a513040cc ("platform/x86/intel/pmt: Use PMT callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index d0ab8e33c62a..c25892a51180 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -417,7 +417,14 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	sysfs_bin_attr_init(&entry->pmt_bin_attr);
 	entry->pmt_bin_attr.attr.name = ns->name;
 	entry->pmt_bin_attr.attr.mode = 0440;
-	entry->pmt_bin_attr.mmap = intel_pmt_mmap;
+
+	/*
+	 * The read_telem callback controls access to the memory area. Block
+	 * usage if the read_telem callback is present.
+	 */
+	if (!(entry->cb && entry->cb->read_telem))
+		entry->pmt_bin_attr.mmap = intel_pmt_mmap;
+
 	entry->pmt_bin_attr.read = intel_pmt_read;
 	entry->pmt_bin_attr.size = entry->size;
 
-- 
2.43.0

