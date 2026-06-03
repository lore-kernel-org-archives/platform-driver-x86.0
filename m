Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFBB3E51DA
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456290; cv=none; b=sOeRnrAbTNOQ3MvITohY79Ayjo6uPCKnIRJVoHrUAOmPnAJPNIbpk/L3BxL2At403TAjfIW1g1Qv33l9RCoNLh+LLdOPVknOi3w2m3PfCgg8DruKN9oTkxYI2dNRLvaB0HzWuapFMsRDfuSuSm/l4F+ck6Lu33K41xrWh2Ug7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456290; c=relaxed/simple;
	bh=wHEP3T0JCOGOfR8/mhG8DF0emMo+OpOS1XpQXj0JKsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgZC6z0h6q2oO4VEODS3Mvi165xg8iKX7YvcW2wWOg6V3uCt11CELHGpQCaLzZ/jvqrGRN3ZomGnbbxdFvSIRPPJ5U5NLfjM/nyzAHUY8fS51hrO4d3tkZbOJaqBa1BDEu0iyNnOm+7lDkon6XEKRffyI1zrr2ycvkjcaqWSj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=MuYim8uu; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="MuYim8uu"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gVXlr5QXpzBRc
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1780456280;
	bh=N2jcZfkZx8sHU1eydr66vjE0TAGI3mXPIcJNMYu/yg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MuYim8uuBcNA3ExEQ+czq+vTrMahw3QhC9eWy8xB1d7CwKSmqe9lLhD3RCynsw+3b
	 gSS59uGDMak/dykxwb+IH+9IsNUL/nN8CRV2tTPWvlOJ8h3gJjvFnYdQSOhO0Jr1Ey
	 ZCcD5ZvExbdNKJOSaiXYP5mDVo3KZWEW4+o9vxh0D6D7r9D+/aT2TCNLx6rLu42yey
	 TJrGURbAJDKQZmQ7wgrmmvps5OeW9Ouse9J21IpRAU0SqvQphzjmM0OdqsJ7ohY/Yn
	 jmln6wVR4atMRycn/JawCS0Y03aejeP6v4WocuDCU+5rwSlkBKskRfuwylbzIL+ts7
	 R7VXL9ClgrGCQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gVXlr2bfXzhHB
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Wed, 03 Jun 2026 05:11:19 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v3 RESEND 4/5] Documentation/arch/x86/amd-debugging: Add example for reset register
Date: Wed,  3 Jun 2026 05:11:09 +0200
Message-ID: <20260603031110.345815-5-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260603031110.345815-1-daniel@gibson.sh>
References: <20260603031110.345815-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The amd debugging documentation didn't state how to identify kernel log
lines with information from the reset register about the cause of a
previous random reboot.

The added example rectifies this.

Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 Documentation/arch/x86/amd-debugging.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index d92bf59d62c7..3176a1240fee 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -366,3 +366,8 @@ There are 6 classes of reasons for the reboot:
 This information is read by the kernel at bootup and printed into
 the syslog. When a random reboot occurs this message can be helpful
 to determine the next component to debug.
+
+For example, if bit 19 was set, you will get a message like this in the log on
+next bootup::
+
+  x86/amd: Previous system reset reason [0x00080000]: software wrote 0x6 to reset control register 0xCF9
-- 
2.48.1

