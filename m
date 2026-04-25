Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42CC175A7D;
	Sat, 25 Apr 2026 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777115463; cv=none; b=o5UW9TK3fcb8a+fGRzz5qPThdCa/w625fee8wwqAHlL6A91wXWfZAs1r11wAvectiO5H7iNn6g1IqTjPofz3qp0ZDGI6vmVBCqFnqvgE4vd69TfUt2asLUtaiI7IwVwiQhb+D+Yhs+Aj9I3PuVOpbzcm2XLw55MTflUExFF61L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777115463; c=relaxed/simple;
	bh=BnNzr6JeiBh0lS+EP506OhHbnLCDTgmDdjN6o6vBrEs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=T9RxcZdTNyO8kM7Y49OklWcbkiqx8vpQiS1YRxmsh1g3Y7kiMA9qQF1Jl8Qv0rFn3cnV9OwVMIK1THf4LJkgKsgzLZMljM1JLQUkrBw/XpqsCBVS4Fm5e3tgN5HdprTjgPsjQ5lJGTeit2Qw/F/KLzHIYS+DThWnPLRT1w8h+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bPSuQwXh; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bPSuQwXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777115453; bh=CdzOsgSQCQHwIGtMwUPQkCLU/FReBWinxUkX8AkmX3U=;
	h=From:To:Cc:Subject:Date;
	b=bPSuQwXhOVSzXbqCZt48lwNXdppG37VrrmGgVmKkhX/1Z64BSWqXzRJs4QAhxCelS
	 V2Oy3xZvMlCg4IO4wy3WPbUUKIa8cbUmPIW2LF/KOs3qYTT+9koHJhpQlc4t1uWD6o
	 DPD12103FZ3PQJNDk05l3yUeuIX25p1BbXv1cCMQ=
Received: from hp-victus-16r0xxx ([42.48.237.226])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 1DA3A22E; Sat, 25 Apr 2026 19:07:26 +0800
X-QQ-mid: xmsmtpt1777115246tzi9085gc
Message-ID: <tencent_C70DE4F14F7552DAFC00633507DB5B48F708@qq.com>
X-QQ-XMAILINFO: NMOcRb7Tb1o3t/Pp3izLZtdOcbp0u8gZsqMeRB52/ez0YbjEXTnPs2XJsvsupZ
	 zAULyO6JtNNSq2f0S0VN/PWazDST55DKDFIa0O+y+G/iSxwkb1aAaVqlsOZI+cmgQm/wsHH9JNff
	 s6jv+v5c72HHaxmwi9FLwnHtmErp5pYA/2jpflS1OzILlvkQXvsZZhdYEr5e0rgS/KUWcL4itqDv
	 QIKMbENdLld+7tLO4c8Sxf6Rcn/kTX9H3A+uV+FVjD22OD8tYnuM5o3epwfy+8Y4jeXUlMKjp6cC
	 JPpwMGwYBWqWii5OLGO/JWSSlXNvIu+bvAARnh9tq1IEJCtmfytZzOx4u/SgpRe1UDpumFQWaFhy
	 SEMnts1SjVy2L4k0lm5CrY/Uc8r80Xu500/thVvFnx0w9CgcOOSa7ROSRodYnTFlklWvKDZXp9Ki
	 I6XuRoehnrM3rfpDt2+fS6Rl0/DbxgtYwYUC6yiUY3UzZNeK4zZfhh0cARV44cWHd/Fi/1Z0VwGK
	 1hoS5dC/HSn1F2FsTM79z9Odl6lI1myAtihOmrGzUzag/Zi3mklV/fFzv2mYKMilK8ABFaMyMRyX
	 RptK5m9a5kMdFP5eUuAKbhqEtUwTHTUY4Tj7FlvqtDZj1BhSej+KHIDKTuW6fVjpsJ8Y4LsIrK2C
	 uPPhRe+i+q3YlGdwhx4X9eRSBNn6Fgnz3bEgnnO1lWAIgIBGlhLEo/IfS9UIU+S0Y2gIW6eA6sQk
	 mgEZHMq88nR4n76x39tbaDlwns/XiHO6FZ0VLz0DzOvG4a/lku203zoR5yRkvgZT5mQ1ArSlR3Th
	 4miLfzfJjSqIB57HRiQHq+1iUD74YZRrFJwcz1Dw5Ja2KjY7pFOd8unOJmIRU2JHYEp4tHsa8pXR
	 IhXkksrV3SDhHaU1jwA52BONs7rAdg1wVlKS75qCbZpLqDrG48yi/PZYDt9tRwPUyaQFWI+kQYbx
	 mBVjkCVU98rN3935Ce64hslm0HnpvJBoPTb56KP8zut7rhG/bxuvpEmiwEGvTXjhy5INkA8XqoW1
	 5OdMzBHFNBTaoeY6KWTY3NpC1a5FsZNWzfrji5JrgeGpZqvoNmbEdjBHph76woH6aWfrUDgZJGCe
	 PTqQANNZKAY0cAJRGq7VT4mBaaRfT3avQYAF5cIJ1ksUwLIIqhU00rRG+JK0oBfeC+ECfVoIVT8B
	 j0QMQofxDcPFj3wki2+w0SiZHu
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Haichen Feng <2806891994@qq.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haichen Feng <2806891994@qq.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
Date: Sat, 25 Apr 2026 19:07:21 +0800
X-OQ-MSGID: <20260425110721.121545-1-2806891994@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 16-r0xxx (board ID: 8BC2) has the same WMI as other Victus
S boards, but requires quirks for correctly switching thermal
profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on board 8BC2 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Signed-off-by: Haichen Feng <2806891994@qq.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d1..075d39417 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -213,6 +213,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
 		.driver_data = (void *)&omen_v1_thermal_params,
 	},
+	{
+		.matches = {DMI_MATCH(DMI_BOARD_NAME, "8BC2")},
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
 		.driver_data = (void *)&victus_s_thermal_params,
-- 
2.54.0

