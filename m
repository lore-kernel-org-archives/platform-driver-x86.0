Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF512344DB9
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633495; cv=none; b=iwqiLCZGsopwZuTRP7jSJRFi9DfJMV9uNam5srqo5mIVbzw4gZ8pE+DKVuUTSDW0EyusZQQBeWtwY3vMyoLXbrNNoiWxVhsRLwLjwfqlkOIEMUcZKJKXoxPpV8eqkqMgK0MHiNFsMay16te44MJibWGiqw0mCELpPzHgcaOO51k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633495; c=relaxed/simple;
	bh=ySeS0Vzm/VNQTVFo6H1qNaWKUIZtuwg/57iUZSrpE/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IprbD0SrGyMPemCDXNwO3p9p42mrI5wyH0LxWMoHborbszXgBWE8pFNKJ2k792/Dy93Fck9ir3xt704pjQuIRHyHEiBD8B5yfJLQRThZwDASByBeH51ARASlUpMbZN+23r0i0CxK21xGJJ1UnCUwEcES8PMJ4mklzSAHJvRmg/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DT8gXRJK; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DT8gXRJK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772633480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bWAE/ZPEYpW1S1c51922wMGkRrP5fLUTEMqCMOITzAE=;
	b=DT8gXRJKD5pos5hid7Tiv3YVrlS45XJnOu3B9djTXa9gJf66U0vYVcUtzdy8/N6r4aeTEb
	33Ma1PBBNyBnZvcqTQzoOeEjKaPijrXX90Bga4d2vE6/VZSj2Srkm9db8EXUF0RBRmJx/y
	HfgEwazU9Zxah3OsPRs52LNs0REHoRU=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] MAINTAINERS: change email address of Denis Benato
Date: Wed,  4 Mar 2026 15:11:02 +0100
Message-ID: <20260304141102.63732-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I have been using a linux.dev email since that is hugely better than gmail.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..27377c282e67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3989,7 +3989,7 @@ F:	drivers/hwmon/asus-ec-sensors.c
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-M:	Denis Benato <benato.denis96@gmail.com>
+M:	Denis Benato <denis.benato@linux.dev>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
-- 
2.53.0

