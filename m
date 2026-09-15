Received: from forward206b.mail.yandex.net (forward206b.mail.yandex.net [178.154.239.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A43CB8E5;
	Tue, 15 Sep 2026 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475370; cv=none; b=FyS1cNelbuPPWUwLsaHHkhWxvh0WilYmZB2UDRBsse+64C0hyrn2h6CRjfK2cXXYdeM93A2JXL6rOkORZQqWgc+YJV+WqVdc+vvhkllieEqQngiIfxUGje2J0G5WL3R3qRfpM6/2PfulDySbTsChwBzjs3R62Qh6xENwvpT608s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475370; c=relaxed/simple;
	bh=43LQWZhAikthxrOGBI9C5nSqZPXDZnwF42Xyz+a6xWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FnYFWaJ+baWNtaMSJVmvpv55R97mpBvEYwppFQKQN7ZcYGzC9hdur6HcGZkzRACAdnzqOFqEaF7LmYranC/7DuUzi1McSNQP0GFiKakKu7DDy73UeT+B0p5fBUx6qQ5o15TsQ7/jBWVdFo04KnU78Yjz5rVmAO1k0nCQYJ6mMd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru; spf=pass smtp.mailfrom=itb.spb.ru; dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b=jEjXmaa7; arc=none smtp.client-ip=178.154.239.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b="jEjXmaa7"
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward206b.mail.yandex.net (postfix) with ESMTPS id 6CF3584D29;
	Tue, 15 Sep 2026 15:21:33 +0300 (MSK)
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d103])
	by forward102b.mail.yandex.net (postfix) with ESMTPS id 6A100C0C12;
	Tue, 15 Sep 2026 15:21:25 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:27a5:0:640:d65c:0])
	by forward103d.mail.yandex.net (postfix) with ESMTPS id 51561C0057;
	Tue, 15 Sep 2026 15:21:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net (smtp) with ESMTPSA id FLTQTrXoXGk0-Yty1pZe7;
	Tue, 15 Sep 2026 15:21:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1789474884; bh=Wy6THidwzkWx4Qg/Iya0BoQZUihtoUwpaggeqqVSXdw=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=jEjXmaa7Ozoh9co+mDd7TxiEMmXwCSW16vaoGvX75P0AQJQ312/sCVj6wGkgNGrPa
	 sylW9DqDI2rxQM3oy9ge1l7v85UXpPDgNyNGysv7oY7EEVdN2Y94SUEJae+XNONTnf
	 6HnSSI9EINAq24zaEKTDIYjgfgoxypZtBOp+QiOM=
Authentication-Results: mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Aleksandrova Alyona <aga@itb.spb.ru>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Cc: Aleksandrova Alyona <aga@itb.spb.ru>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] platform/x86: intel_telemetry: initialize default trace verbosity
Date: Tue, 15 Sep 2026 15:21:07 +0300
Message-Id: <20260915122107.9784-1-aga@itb.spb.ru>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

telemetry_def_get_trace_verbosity() returns success without initializing
the output verbosity value.

The default telemetry operations are installed when the core driver is
initialized and again by telemetry_clear_pltdata() when the platform
driver is removed. The telemetry debugfs files can remain available after
the platform driver removal.

A subsequent read of pss_trace_verbosity or ioss_trace_verbosity calls
telemetry_get_trace_verbosity(), which may use the default callback and
return success without setting verbosity. The uninitialized value is then
passed to seq_printf().

Validate the output pointer and initialize the default verbosity to zero
so callers never use an uninitialized value after a successful call.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 378f956e3f93 ("platform/x86: Add Intel Telemetry Core Driver")
Signed-off-by: Aleksandrova Alyona <aga@itb.spb.ru>
---
 drivers/platform/x86/intel/telemetry/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel/telemetry/core.c b/drivers/platform/x86/intel/telemetry/core.c
index f312864b8d07a..62299524a07b2 100644
--- a/drivers/platform/x86/intel/telemetry/core.c
+++ b/drivers/platform/x86/intel/telemetry/core.c
@@ -24,6 +24,10 @@ static struct telemetry_core_config telm_core_conf;
 static int telemetry_def_get_trace_verbosity(enum telemetry_unit telem_unit,
 					     u32 *verbosity)
 {
+	if (!verbosity)
+		return -EINVAL;
+
+	*verbosity = 0;
 	return 0;
 }
 
-- 
2.26.2

