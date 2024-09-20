Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284B51863E
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2024 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726802220; cv=none; b=UqtNY9yclttBYlqK2oZjF1N4BWOUpHi5QJoQgXCUZHP9jVSJPpWtK5s7DcH1AVeVbMZ8dhe0eB9GNNC4JNdHU5LHN+8sNYmLx398LZNvJ1LZ7pNGgr0wPK4TawD0916bd7y1zJgvx7jjshgCcHTGYKcIbzVQRZkcNXVtq8d2L2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726802220; c=relaxed/simple;
	bh=M5rN54qA5rVUrODvgLOg+DMIwvOB0Hj59wVhuW0Emks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p6vyhuyJckm8t1cPuCxvRfUb6oJrUO1rhSZJXoD2smvXSsIMo9ZEPXoIrc18Hi898JTSeA2jOadzpVzcV5CF5xEeB4MUMUZ0JS4Ci7nm4hhV83IfojRH3mU03VSzxnJ3OWWkx8VpReg9xj0suvXcaMlKw6qaD7oxdDKmLOY+OC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=g1Tfol8y; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="g1Tfol8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726802190;
	bh=GF2Am1EBaW0aKWs0P0U1SrDB1E0DigRM28jfgRVw8L4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g1Tfol8yc1sYLWBXTOHxhDjaMedWhLiCuBh9OEgAH6dbzDRQMcLf9vTYFx8BFLSBL
	 3UWv3hjMK6Gj4uwFeUBYPtDmCsQUPG71P0TOOJg7fyyLdDF3CNEYcSRXS0ChbnB4IX
	 bxvdQeZcMbyyCJSpdrn9X76ea8N4bog4/hjjKPEQ=
X-QQ-mid: bizesmtpsz8t1726802187tolf78l
X-QQ-Originating-IP: K44m2XNNdMuRI7n2PLIjQFE90u+LWrqfbttPLcCjzoU=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Sep 2024 11:16:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13448690296646782473
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
Subject: [PATCH] platform/x86/intel/pmt: Correct the typo 'ACCCESS_LOCAL'
Date: Fri, 20 Sep 2024 11:16:20 +0800
Message-ID: <781C12799421D366+20240920031620.1211752-1-wangyuli@uniontech.com>
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
instead of 'ACCESS_LOCAL'.

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

