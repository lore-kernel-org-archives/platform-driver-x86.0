Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACD10F2;
	Fri, 15 Nov 2024 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731655957; cv=none; b=PRkDqFKQ+awzpW3a4sWnPgYaFMMrYUvZWhtAvtenTLCCbp+P0ezaDEbANMe9o1EEPVJmUBITL+nQTTLvirDfCu7dUpwsG1w3sEpA+udf8icUV++lRhcT8EUtlcXX92KATxA5Qe9oPwkCIXG1Hq5K684aoEKRxacxNwjigYHxVyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731655957; c=relaxed/simple;
	bh=0V5OwHDo+36xwLU6QvqkVMnpxuTFLJxySW23aw6mJ3c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Tt9ScAB+kbl8I06KDtKZBTsm1HY5j2g4j69iJUdbfisd7fh8+83byN6KECC+006lbjIfwu8V6dedzXDOLVoA2RecgpQrAppWph0fa81TJKQYq4e8aZZyeluPvjWaOes8kv85oYS/jsFYlv3npUI+3Ldc8PyPyGVTM7Bg40Q6ryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36736f908841-f9069;
	Fri, 15 Nov 2024 15:32:24 +0800 (CST)
X-RM-TRANSID:2ee36736f908841-f9069
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16736f9071ea-edd6d;
	Fri, 15 Nov 2024 15:32:24 +0800 (CST)
X-RM-TRANSID:2ee16736f9071ea-edd6d
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: srinivas.pandruvada@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] tools/power/x86/intel-speed-select: rm .*.cmd when make clean
Date: Thu, 14 Nov 2024 23:32:21 -0800
Message-Id: <20241115073221.6176-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

rm .*.cmd when make clean

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/power/x86/intel-speed-select/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 7221f2f55e8b..b58185cc97d2 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -47,7 +47,7 @@ $(OUTPUT)intel-speed-select: $(ISST_IN)
 clean:
 	rm -f $(ALL_PROGRAMS)
 	rm -rf $(OUTPUT)include/linux/isst_if.h
-	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete -o -name '\.*.cmd' -delete
 
 install: $(ALL_PROGRAMS)
 	install -d -m 755 $(DESTDIR)$(bindir);		\
-- 
2.17.1



