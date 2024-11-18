Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCC7194C8D
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731915001; cv=none; b=r1nT7711Ubpvb84wtp4/Q4SYrGt14d8QcSDqozqBio33uWb6Jc+itiC8X51xsvA5z5nkLhw9uHA5Pq2fttzOMGHrbNncdbhf0SpcDezFWQTbAKWYzDbpHrmjc7M1nFu4Vm8oNr5tfM9D7UBabJweqpRO4WBjGx68W83Ll6qPl0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731915001; c=relaxed/simple;
	bh=yYejkGVmhQSxgt1LSIBLxXNAaQ3bld9Y7GYMSQUvulw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p7S4W/P5cx//JdDXl7sASUSRvE/rPK7iBpqNPg3AMihA4O3MjpGLyc7GkXBIZVx73b/HviOPIirdDekfrAccXHhs0JmJ40T+G5Js/0AVmL4Z46OpesPaQYeefNKiLu6o1CfFZ2iQcmmwQEOf3tnBzrVe6pzpfFqM7zpymwoXxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MRyiiq3q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MRyiiq3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=AlqpJCs+yskoKvKohsqem2hmeNhPOpiYtkfKCY3Ow1c=; b=MRyiiq
	3qPpvACKY9KB6T1Lip1KaWBB5nUTjb/Igib5RranATGY+fzHThzQgYbJ3U3Jkubd
	cZIVqg3Mp13A1CLFKLKPetHV8AlU9VVKtoAFPkq5oYeeWcim0PmOARvTUa8mxA81
	hN1a0GcudWIEw6y7T9/QtLniRwxGOHAZUvPYctJdto8Z0PfpdWpxxbK4TwtrdP4O
	/hpWmQgF59Vqvywf9lJr/oXm/dIpcwvAo4cww1Pm3bs2cMphkexQTn9hpSeuNunY
	XwAJjk997eyCM9dd/yaBJIrO6XAph1CpJ0Mie2APjvAVSxkYpCgMr8eGNq51sJ9p
	T8nEDGEfJtXcOIdA==
Received: (qmail 112550 invoked from network); 18 Nov 2024 08:29:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:42 +0100
X-UD-Smtp-Session: l3s3148p1@qrVM4SonqIYujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 12/15] platform/x86: quickstart: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:11 +0100
Message-Id: <20241118072917.3853-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/platform/x86/quickstart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/quickstart.c b/drivers/platform/x86/quickstart.c
index 8d540a1c8602..c332c7cdaff5 100644
--- a/drivers/platform/x86/quickstart.c
+++ b/drivers/platform/x86/quickstart.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/pm_wakeup.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
-- 
2.39.2

