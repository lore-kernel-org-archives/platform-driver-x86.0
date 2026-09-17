Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDA4D9541;
	Thu, 17 Sep 2026 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643344; cv=none; b=lGPqxjP2imFH84VRT6EiVM8kQCo6tQu+peMxcmyhJXxrdLliMg8zSqJHMCtOU1+5RauNvGVtmWz9h1UtvRD+tPCUppNSv53gQ8sbQBSi4C0aTrEpWrxCFumuaJNwYCL0zW5oh1/uCkWtQCd3iCDgqRDRU3+En3TViK5Q+rCOs44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643344; c=relaxed/simple;
	bh=9Pp5dF5AjV4QLOdwWYYWBE2+2SZ2cxFWR/f/oWMiy6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mKD7TlHvO02Pw7V5JBy9wxfyWBLRW+sU6wfClabgQY92G14/9DjJxkweBo/WiBnpCCsxeVO77qJqyb9BFO/DZIRuyfoV7bWaPPRgtZt2yCgNuSTZOOLWAmMxkUSC+t7WUX+f1ej8qIbo/dhloSLHx+2R55SMupJGNZAaNTTvMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru; spf=pass smtp.mailfrom=itb.spb.ru; dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b=NU6RhC8A; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b="NU6RhC8A"
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward101b.mail.yandex.net (postfix) with ESMTPS id 38992C0156;
	Thu, 17 Sep 2026 14:08:35 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:d44d:0:640:ae2:0])
	by forward100d.mail.yandex.net (postfix) with ESMTPS id CD781C7CC1;
	Thu, 17 Sep 2026 14:08:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (smtp) with ESMTPSA id F8UFGSKgnqM0-TBTyf941;
	Thu, 17 Sep 2026 14:08:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1789643304; bh=ZjCHREA7PBQnoRJqpNNOCAdbIHyuMD+l2akI3A3i+lE=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=NU6RhC8AD0WZ25RD/8wlyjB5TCN150NqL/7U/nWGUIO4OMCGY5QDBCCIO3rZKIyPH
	 qKVskEa+kHr4EDQ11LHJEhcXYGuPlHaVgURyx4TfIrZKMpPZHK3m2YmfSCiCJBKuss
	 RFcqxTpcgGz1J4HUz1+zXscrbxS3eMcvB7X6dov4=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
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
Subject: [PATCH v3] platform/x86: intel_telemetry: initialize default trace verbosity
Date: Thu, 17 Sep 2026 14:08:12 +0300
Message-Id: <20260917110812.2831-1-aga@itb.spb.ru>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v3: Add the missing revision history as requested by Ilpo Järvinen.

v2: Rebase onto the current master branch and update the file path after
Intel telemetry was moved to drivers/platform/x86/intel/telemetry/core.c.

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

