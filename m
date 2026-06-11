Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF60C2FF
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 00:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781136769; cv=none; b=i1M9eBX9ZjY47Nu6ne7VvJZL4gouv52XnnRapm4OKJuCXoAABbrJns6soyqy+YVor71yidZ3vS4JmVwwEfc06YGxNMlQC1tJ/XFNiq71zEiBJCZ6ocrjwFvsBGnRLYDZfYNnIQKkdbDOM/i2uZi4k6+ndOOS0COYxkQJj1Hgi8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781136769; c=relaxed/simple;
	bh=/m4ETACmj7nvXcjoMOwra9dq213JKmKZmxg2PQjG8nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7JZnou4DwoV8TFGPCKuV1LqHXAMVH5wq1yNulFDU3rMBFIOqd6/WZ+Y6ul9ziIx7h1/wFN/m6LJTLSWuVXJgUqPCFVvRWLp2Pn5jMXIWnrZICS6ERKLP+rGTp1xfpX/CqJXYKkcQFZUSuPCfATnOX5SQg2zVeQknfx3cqMyeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULS0YIUI; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULS0YIUI"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-307d0405e07so3850440eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781136767; x=1781741567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZK5IpFkAwuG2SxeJNtSu18J0v6LR2/UIaNloMbXw8Q=;
        b=ULS0YIUIuFAb6JVUSAqron9UvNNYko/T665Wl/ogk3lssh8sB2MIoIPZLFz2q1xowS
         tfN6NwxLg9xqdmQn98+2ZQ4QPRwIJka9XaoNYO5Mve/av1s4ax10vnoo2Kk2pX8FhX1f
         k1e1K9Veg3F6khTDfkihvRQ4Yw3L1SEVTCl23W3wgphYcjrlszH+nM6n/vRoIKouGOYi
         5BFoQ5ERsO1Ob4b6e1hcpWTG4hUFS34xWX5cv/S64ckQuu4Y8Tb9JLrVgznlh0yAnnSM
         kJQNxsmOMf1CjfZNCI8ls0BrbxkDyOdveRUCxog4DQ0q9/KqF/rXxFD8nCtW7EknoIZu
         Q8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781136767; x=1781741567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZK5IpFkAwuG2SxeJNtSu18J0v6LR2/UIaNloMbXw8Q=;
        b=YBjPfUfPy66u1X954RJzHxYI0HO3uY/fwgSH+fUhAiri99xxYEW6XlbHVbsF9C4ADC
         GEgp7n9hRJPBVndd4KlKzXpfnpi8BorU29ZIhrhcC5t+I7CFxcbp4xw7HxOd2p6clj3B
         d2Xj1t6G7M3ahR3Ne0menK8mGGcJuNpBm+GvO/ki0vaDQ3YktoMOuxDbIwNEaJlvkglS
         a0oNE9n47THYxcNPMvNKhbgwfzhfltbxOFEZ223e9vzeOP2nTt4o6B4uE5FrYGcrtRvh
         G8N9L41vbXatJy6pg7wlBaxfe4g3z3cLjCrd5kANuOltl/PPVRAl5KMgMerMf9eLxlUB
         WQ1g==
X-Forwarded-Encrypted: i=1; AFNElJ+k2+VdmAtOlMf+UesMUUDnjWKh0y72ImehsMCVe+fdlXXuM+XnO/Y655ho2YvMz3Ukr1euOuVY9prtkmZdzTRjOfV9@vger.kernel.org
X-Gm-Message-State: AOJu0YxkqMw7spTuUtzYb/0fwJoFrHNoGdeK4qxDYVM0VfF+GII0pYH0
	kyoS8t/LbfmdkOqpjPtT6azEtEt3Bk5wuJeUTwzvMY/1uyqg5MSGnytmyokuRMSs
X-Gm-Gg: Acq92OFZHu2Bbz2X8tx0bTfTjny0UY3PZP3OECSZV9bZS+Z1Ru7MODs8Hg+JqD5eOmR
	8SNJivl0CPOlzwOwCCLk/3UYt3Riwa23F70GzxT2rnvlp28KWETBMWIOEwOdaqJ/FH0anKXwbVu
	Z2K9dM2/FvbDnKRRMBsb/i3OdEAhhq843GqBqiawEIElLjk3N4AnQuBEzGqDTE9Qte2h9ak/3+0
	pxoh6BkFuQExpSMJ6x/AePi9Jt/EUVDPsarsMSZKHXN4e5HdkK1R/zh5JjZvBcj6AIHlTzuVcqs
	TbnyJW3w+JOk5e7MeNWtpQsMYyuLuZjCUXeAKgpsRuecPyTjBeTvpIdx3hA++MtlErtvpJeG9qk
	f55ESv/13/F76coX46QIHo6OVFYm7b+a6GxUpR52pFli/X/o/URa0V/BNRxv/DuSfRIsZ+rCwnU
	TdbqA5MAGrxF2GTSFSQyHEwBY4aFIOpGNT90YA0VtVB4mTv23HCtX34KDOYgThY7lNEMO5vxWZL
	205aLMiF/xH/+1BOcl3R9LXJBngDH6eU/LXjytWbXygcJqAoFPvWM13lz89rnp6Kx/DAZHyiAwn
	9SYtaBR8ukghfDOAyhcjAanxJFya
X-Received: by 2002:a05:693c:2c8e:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-308046229b1mr429039eec.6.1781136766828;
        Wed, 10 Jun 2026 17:12:46 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm27100265eec.12.2026.06.10.17.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 17:12:46 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] platform/x86: dell-privacy: correct CONFIG_DELL_WMI_PRIVACY macro name in comments
Date: Wed, 10 Jun 2026 17:12:34 -0700
Message-ID: <20260611001238.391045-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comments in drivers/platform/x86/dell/dell-wmi-privacy.h incorrectly
refer to CONFIG_DELL_PRIVACY instead of CONFIG_DELL_WMI_PRIVACY.
Correct them.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-privacy.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.h b/drivers/platform/x86/dell/dell-wmi-privacy.h
index 50c9b943dd47..ca242e1fe53f 100644
--- a/drivers/platform/x86/dell/dell-wmi-privacy.h
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.h
@@ -13,7 +13,7 @@ bool dell_privacy_has_mic_mute(void);
 bool dell_privacy_process_event(int type, int code, int status);
 int dell_privacy_register_driver(void);
 void dell_privacy_unregister_driver(void);
-#else /* CONFIG_DELL_PRIVACY */
+#else /* CONFIG_DELL_WMI_PRIVACY */
 static inline bool dell_privacy_has_mic_mute(void)
 {
 	return false;
@@ -32,5 +32,5 @@ static inline int dell_privacy_register_driver(void)
 static inline void dell_privacy_unregister_driver(void)
 {
 }
-#endif /* CONFIG_DELL_PRIVACY */
+#endif /* CONFIG_DELL_WMI_PRIVACY */
 #endif
-- 
2.43.0

