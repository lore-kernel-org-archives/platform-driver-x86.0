Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEFC482CD
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2024 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726841847; cv=none; b=i47Mt9QV56XtRfb6I5AeCuTrnq9G8Nsm4bWPQvcq+EeeSDl+oIa1ii2mK72lpIf1uBeSSfCRBfl3UjIDA3Z1NzzVlXPSWDXOpEHFHcPQ3WealPeC9QWD3O8YVhz9Cncaw7nWP824kVhAcMKsMiTwuURB03+Mn4uHd0U0fw4mZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726841847; c=relaxed/simple;
	bh=vkC9LJ7wr/yUOTjMnREn2YogWu54jCt01NPv91t0bz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tNUnVqlrUaF0YN+JGSd1xpArrRmWNlcZfSenUBLWT9DdPDyUF/IZ/ZF0h+SnmXtTO4P+BaLp9tPwm4yhjmTx5pAMseN8otl1xNKWr6kfvbs11ZskZ/whzGDbGIjW8b8BlEu4wZ/fb1wUpTsZJjoGmbsRExDwx0GKyu6Nh57B2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=P1hNlmpm; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="P1hNlmpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726841832;
	bh=Od6QYms+epxEv2KZ2ZHKNs5K2uqUIAKuYW2CJnmrKog=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=P1hNlmpmw3XsTOjpZLnItWldgotyNPD0kTJscTXU7SJpiRFTkNKJXxOAeFOL586dy
	 R5cUyN+uPLWml+vhmchR4H5qxb9bWcCtiId9p1B6RVn4HjGivYSX5YHqjEs35E07/C
	 edGV9O6jMaU+DDnOekFuvjsK+xmQwcqtrhcPh7fM=
X-QQ-mid: bizesmtpsz7t1726841830thcbxfa
X-QQ-Originating-IP: YnLcdraBHkhEhdPXQQdKNpmewBQ/1x15Q/EY49Azb4c=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Sep 2024 22:17:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3504659909987845671
From: WangYuli <wangyuli@uniontech.com>
To: david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tzimmermann@suse.de,
	lee.jones@linaro.org,
	lee@kernel.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v3] platform/x86/intel/pmt: Correct the typo 'ACCCESS_LOCAL'
Date: Fri, 20 Sep 2024 22:17:04 +0800
Message-ID: <4F742FFF72DFD84F+20240920141704.34373-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

There is a spelling mistake of 'ACCCESS_LOCAL' which should be
'ACCESS_LOCAL'.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/platform/x86/intel/pmt/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index c04bb7f97a4d..7680474c4f96 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -207,7 +207,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 		/*
 		 * Some hardware use a different calculation for the base address
 		 * when access_type == ACCESS_LOCAL. On the these systems
-		 * ACCCESS_LOCAL refers to an address in the same BAR as the
+		 * ACCESS_LOCAL refers to an address in the same BAR as the
 		 * header but at a fixed offset. But as the header address was
 		 * supplied to the driver, we don't know which BAR it was in.
 		 * So search for the bar whose range includes the header address.
-- 
2.45.2

