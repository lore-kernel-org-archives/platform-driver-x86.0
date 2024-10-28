Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D71DA0F1
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114663; cv=none; b=Tv4A0W0OtzUlc3FmZVYgpROMA0dLwGYlsf3fUbp+fN5pzGp6cESl5Ml71b8peqmc7bD1NOcj31mtCUAeokgGdJ+2V037YBdkTxI9fm4oT9VjkBHa+ltDq9H/IkebrpCPduj90tB1jWIdx22ap/g9/yyHqZvt9mvpcHdn9TylUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114663; c=relaxed/simple;
	bh=ItHaAeA3t5zCok+910i2whs/c6mfv3/gAIB7CAL5qPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWgeXu8pFjILqgByFuTXwnqvN340/nBheFs2eP1UODQf30FUQI7OLTnkLr0NPn2iNVPwTfVKIjnscpR1Hl9VGwt+OhZi1u+40hkxb2ZCBZE8doQveF9t9kbfenyKLiX87PC90l1YRvAJMbaoJR691GtNUMCFZh0xH1Dod1Pklbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b=KpsqjSJg; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b="KpsqjSJg"
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202410281124126875a7b338f39d5a5c
        for <platform-driver-x86@vger.kernel.org>;
        Mon, 28 Oct 2024 12:24:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=60P486yFCSDAYHWuQ7gt3t6auAm6BcPA3MNAns79R/0=;
 b=KpsqjSJgHmPb2VaxzsR3ZAijglfiQa6Pq743EGQIMQRyviHaosz8VG9MKhYelgT0hdVukr
 3oIatBbevZS9QGGxsw+AKHPv6NFP+Tf7MFO9lcHeKMktuBiYWT0vxAiWX/sFk/t6Zz8od1HL
 HFIAotWUIxCctQtb9pnQdEVDDAycBRER41S3d1NZFP6w8Kle65rA+UcoXYYqcpOD1XzsdFyi
 +IIiA1MxFM7b2ZC8eIZJZFs8WW7oY6V36WqWfnfghWLg5KvvNHZ/9vaVZNgVb4tfU0sSwQAA
 +QofxWo69tSZcO96pED+htNF6mXyhprgt1RGDhP4ZdqkW+M49qaQucjQ==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: konstantin@linuxfoundation.org,
	baocheng.su@siemens.com,
	tobias.schaffner@siemens.com,
	pavel@ucw.cz,
	lee@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	felix.moessbauer@siemens.com,
	christian.storm@siemens.com,
	quirin.gylstorff@siemens.com,
	chao.zeng@siemens.com
Subject: [PATCH 1/1] MAINTAINERS: replace bouncing maintainers
Date: Mon, 28 Oct 2024 12:23:59 +0100
Message-Id: <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
In-Reply-To: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
References: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Since complaints about bouncing maintainers raised [1] we have now a
replacement for maintainers that stepped away from their duties.

[1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7ff3c758535..c1b39fe9e356 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20274,16 +20274,16 @@ F:	drivers/media/usb/siano/
 F:	drivers/media/usb/siano/
 
 SIEMENS IPC LED DRIVERS
-M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
-M:	Xing Tong Wu <xingtong.wu@siemens.com>
+M:	Bao Cheng Su <baocheng.su@siemens.com>
+M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	drivers/leds/simple/
 
 SIEMENS IPC PLATFORM DRIVERS
-M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
-M:	Xing Tong Wu <xingtong.wu@siemens.com>
+M:	Bao Cheng Su <baocheng.su@siemens.com>
+M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
@@ -20292,8 +20292,8 @@ F:	include/linux/platform_data/x86/simatic-ipc-base.h
 F:	include/linux/platform_data/x86/simatic-ipc.h
 
 SIEMENS IPC WATCHDOG DRIVERS
-M:	Gerd Haeussler <gerd.haeussler.ext@siemens.com>
-M:	Xing Tong Wu <xingtong.wu@siemens.com>
+M:	Bao Cheng Su <baocheng.su@siemens.com>
+M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
 M:	Tobias Schaffner <tobias.schaffner@siemens.com>
 L:	linux-watchdog@vger.kernel.org
 S:	Maintained
-- 
2.34.1

