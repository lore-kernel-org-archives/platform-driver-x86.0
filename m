Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92893DAADD
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 14:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929080; cv=none; b=I9xGw5nQxytFKUlZgeXpklcp1dAfMQYVMDC9FYh8c2+HGEM5mP8pUziw/dzbrpT2fiDdIUCxZ64yH8q9JeXsN3vx0oxFH3ZhVZxiuRqUWY5aekAQasi0+F2MrWs+uMa4eXwb9Kx6JEeyZ/fsCG0W43sORDzWmkJ0AFp0mJiSBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929080; c=relaxed/simple;
	bh=zb4f0TOM1edy2nxAfvHRTgjaq3Y7gM76Vog/0hLTNX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lk/U/cvx3Ll8duZWs97Yngr2xHIUX7ySEUnraEoEBC8grQS9D7XZmEN6DoXCh2AaWTZJymcI25mY9XBPSVTb6Ik0zAIBE7YqVk+JhCk0VMmfNPDJvwzniXnViZ/Ysrs+7BLqt+0ioPlwrmJLUbuF4zHn7Zk2LqLiOcrYHLCJA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLgBdYtr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLgBdYtr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1336009a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929078; x=1788533878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bg0cMSBx6jvoo6FdRRB69kyQY8hrlgEg3jHHCFAWJo=;
        b=dLgBdYtrpnmy2aYKdcZmWQq/JyF2Z05degWdmz7WyKOAMUeWiDdPAeiOXfBBf1CdPY
         WcZvvO45LlKn1A+snuxNT9Hk7HqgyXZ53Tu3MShXVY1kMmYxrGpbpVWSv1LwdGMysX3T
         kZcpIORSn5OdhH9kIhG1Jiis2QT4AIxgxWgb64go6KVNiMRtrZ7anW8z2b0Uk58dAd4b
         +v0DdiRHR2sAjAkldyQgJUsmkms2Ku0XOhwFdFf1kdzgYelK32NyQOnmb554Z6E+/AxM
         WL1uyr+EoVHGG6hL9uZVyd+VLkfVgPur438hO5zWZOffg0u8jEkYfgFs0DWAWOKUEK4E
         Fk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929078; x=1788533878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bg0cMSBx6jvoo6FdRRB69kyQY8hrlgEg3jHHCFAWJo=;
        b=aVjTPOtEOL31NJghMwcYuOXl6uD4Fa2MrDkzraxpdNwoyX0KidiPy/jNz3EKjznpYp
         Amp+rjkWXmnKY0xBAiw9dcAMo8BZNSO+6CO+kCcC6z8tPkKCYecLcO750Ex6faMGYF+J
         NVpyM8y72GuSYkCXOEb8PjFnEed0cnPDoOF9Kr3iii2M5XVdT6s6MUP7bkyO4wUz15BI
         gJJQKmhFM/KbiLX2hEgF76mJcO18QZtdf1Z9RGSwHxt2AG/1988F1W8p4MtlO7446fo4
         7kYyqGASMIkeE3sIvtK2yC2uR+F0BeMSbB4bdCwfa0IKX0hU0RP91706JTm96QWyiJXO
         JOaA==
X-Forwarded-Encrypted: i=1; AHgh+RoySEPeFpw4kQD+vxP/ATj6xATlOOqSzvHVBnCs3Aer+w3j3ZlqrbdwY159PfQ8q07TD9IPODFv+bw8uE08RtpcWmIX@vger.kernel.org
X-Gm-Message-State: AFuF++ncgTP+xL9LXtbr8zitoge01oVFXZ5Lxjp3v6h1SEwnGD2iWcJ+
	ZK4JzNBXLd2pYW+uS0VN42Rsc1E4wvRiWjt+f7PglRagOnVsa5OtD8DN
X-Gm-Gg: AR+sD12sb1DS159EhP+iR5zV/26P/Rx9smOIjMK9zH5Cuz72Spu+SLfYOHQcLoytpni
	xByK8GdfFxSecMV+D/rUH3jhk13YFmjdEEZlZkxe0/Dh28OgkPMCLUx2tFixVxoHBSQMOxTQvny
	Ym7qElNlfio9OGjE/Z07osD0S/774xqM2roGKcMnF9kNyuRieFfLHPNw7pHhIXksOPFv8tkcYvv
	1q8WfCm0TSBIhPgZi5XWbldlOpU34DcwfACUBO33jH0usj8hFixjQ0isLH+1As9RzBEyzsFpT1p
	bVLHwErrE0zVgVF1axJyKJgp7HYKgTUvvRqchtJeWq1jnfWYWUlAFoDPL69y0GbyBIzoAQN328+
	FjivcWeDvMJmXz3UMOnF2Z++419LNcjR96xKgvsnFUH0WUPQlr3lOloY1cnVZau3SNM+Q672h/q
	0YU63bg46stez7QvqtXav1qoKPhO8mCBeUDcGCWosA9NAsj54EUzsHJYvAA2xKKPAvfInyztSxX
	rBceIKqcdfWFLnebj2pS0Fh8UCyJBH7YZT2QDoVi8B45pEE43gQ4sSPVE/u9AEooN5JPKSh4Ls3
	VcOu3Pt7cgZ+JA==
X-Received: by 2002:a17:90b:1d04:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-396d0f75f2fmr16305656a91.11.1787929078047;
        Fri, 28 Aug 2026 07:57:58 -0700 (PDT)
Received: from linux-dev-rtx6000.zfl.local (HEVEN-AEROT.bar4.Portland1.Level3.net. [4.19.244.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm2894396a91.0.2026.08.28.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:57:57 -0700 (PDT)
From: Rickey Bartlett <subtexel@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Rickey Bartlett <subtexel@gmail.com>
Subject: [PATCH v2] platform/x86/dell: alienware-wmi-wmax: add Alienware Area-51 AAT2250
Date: Fri, 28 Aug 2026 07:57:56 -0700
Message-ID: <20260828145756.341733-1-subtexel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Alienware Area-51 (2025 desktop, model AAT2250) to the AWCC DMI
table. G-Mode is not applicable to this desktop, so generic_quirks is
used. The full product name is matched to avoid colliding with the
"Alienware Area-51m" and "Alienware 16/18 Area-51" laptop entries.

Tested on hardware with BIOS 1.6.0: loading with
force_platform_profile=1 force_hwmon=1 exposes a working platform
profile (quiet/balanced/balanced-performance/custom) and a fully
functional hwmon interface (6 fans - CPU, 3 top, 2 front - with fan
boost control and temperature sensors).

Signed-off-by: Rickey Bartlett <subtexel@gmail.com>
---
v2:
 - Reorder commit message paragraphs (Kurt)
 - Cc everyone reported by get_maintainer.pl
 - Send with git send-email; v1's indentation was mangled by the mail
   client

 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index d1b4df9..2b0ffcb 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -121,6 +121,14 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &g_series_quirks,
 	},
+	{
+		.ident = "Alienware Area-51 AAT2250",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware Area-51 AAT2250"),
+		},
+		.driver_data = &generic_quirks,
+	},
 	{
 		.ident = "Alienware Area-51m",
 		.matches = {
-- 
2.53.0

