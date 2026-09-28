Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04643B2FD4
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632997; cv=none; b=l68zEK20/EEpMUwRh7sqm0DhPiixLbeECtIryM3XSGBy3BwHIwRiIKK5BaZoGjumtiRJkeThs3oHFC9CcAx3BQhJiI3tT5TBL+Mq051hj0qDSxy10QOH7K+pf+Sqem2WpUNKlGTPp7rneJVXAIuh4N7CoUUxYEIe2GxD65mCtrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632997; c=relaxed/simple;
	bh=UfqEC0hvhzksIoWD3A2UB8R/0PLC23wCy5su2X5T2VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZTRgCPCwsRDTd9km5tRe3bELjhRPsnNFScuh+ndQ0dfV8QH93x/xkt/QDWvw9tLyamsdftQnEh58Hyz1Mfgx5w3S3BkfkjNw2s/+xGnL8v8m8eFtEZXbWtBPm0eBJm8PZ94o5GIngzpRPpzLjZw5F/5sImd7kH7LJFa1bJfzpR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M7DaofgO; arc=none smtp.client-ip=95.215.58.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M7DaofgO"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UfqEC0hvhzksIoWD3A2UB8R/0PLC23wCy5su2X5T2VU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790632992; v=1; x=1791237792;
 b=M7DaofgOtoKMtSSdvroZMBRl+UNaj42CsHtvUtYjmkRqeLidM/TZoVWO004pVnTJz6nwczZT
 2Rh0QGOtX73tMtxg+aoLQpwxui37CY2XHFjGnqAZq80KWW54vzz6w3vYibLor7abaMTabvXlLY0
 qdKNPWA5VxIhbmFCV/TS3PlE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 538580cffdbed75c;
	Mon, 28 Sep 2026 22:03:11 +0000
X-Mizu-Trace-ID: 538580cffdbed75c
X-Migadu-Flow: FLOW_OUT
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
To: ilya.gladyshev@linux.dev
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH v1] MAINTAINERS: update Ilya Gladyshev's email address
Date: Tue, 29 Sep 2026 01:03:10 +0300
Message-ID: <20260928220310.34883-1-ilya.gladyshev@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For stability and availability reasons, use my @linux.dev address
instead of the one at my personal domain. While at it, fix the name
order.

Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..16d0deafa723 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23037,7 +23037,7 @@ T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtw89/
 
 REDMIBOOK WMI DRIVERS
-M:	Gladyshev Ilya <foxido@foxido.dev>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
-- 
2.55.0

