Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D960D42252E;
	Mon, 14 Sep 2026 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379379; cv=none; b=oLMpnFfnSCEVhDzXRw54AtRIowJnfJNRiO/is9D65uanwErkaPwSe34DC3zxm4c57osxXAz2283HR3zu1HLXN9pghUs3jkBI99RAQ0gMmTAGgzJhBpz2F9ivyT7Nl1C10pwhc6DFGDU/dHulL1TIGusXPJVSRR99Fiyr3OrG7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379379; c=relaxed/simple;
	bh=bcHESYyxprB9PBajgDosUqy5zqLEmHQmNGvMYjPVHVU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aSOI8fMf7s4I4r7loai06STjKEWUnmswni3dNTDcTK3f5KNsDHnZ1Kb3RCXzBsE5+rnVLdd9pYYpITVsmAvTTqb7DeuJ4D2W7qwsMUk5tN7NqFCWk4nzGUSIqGS2JGM6TJ3rx5MfmzjId4pBhY5loWKvTmwuMZgRjueWY/LCfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru; spf=pass smtp.mailfrom=itb.spb.ru; dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b=YjoL2Otx; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b="YjoL2Otx"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward201a.mail.yandex.net (postfix) with ESMTPS id 3536E87FD0;
	Mon, 14 Sep 2026 12:43:57 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:4c9f:0:640:5657:0])
	by forward100a.mail.yandex.net (postfix) with ESMTPS id C9DAFC0411;
	Mon, 14 Sep 2026 12:43:48 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp) with ESMTPSA id hhPZFfRgF8c0-TtSTL2gx;
	Mon, 14 Sep 2026 12:43:48 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1789379028; bh=mCAGYtaTcGqDfAxIe85xgnYDU1k12MigPvWWOeO+1M8=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=YjoL2Otxbj5EmBqrO9BtLcm/H20PIhVnRTmtgznaybpPCmnXEEHWyWilrBpcvHqC9
	 Uty8fRt+c05I2aHSwK+HsWBhv3Qm9OVANEYMGP1L5zJJHDmow8SCOX+FMu/+yJDepQ
	 7tVuwz6RyT5lqpMzB8+KjcmcorwmOmFE+vpLMT34=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Aleksandrova Alyona <aga@itb.spb.ru>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Cc: Aleksandrova Alyona <aga@itb.spb.ru>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <mgross@linux.intel.com>,
	Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] platform/x86: intel_telemetry: initialize default trace verbosity
Date: Mon, 14 Sep 2026 12:43:32 +0300
Message-Id: <20260914094332.2706-1-aga@itb.spb.ru>
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
 drivers/platform/x86/intel_telemetry_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
index e4be40f73eebf..6a1e9df26ba1b 100644
--- a/drivers/platform/x86/intel_telemetry_core.c
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -51,6 +51,10 @@ static int telemetry_def_get_eventconfig(
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

