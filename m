Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4743CCFD8
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617622; cv=none; b=IiaujexE/4kvkCgBnr7Pzf/mf3Ou6nVHrgiYOp2THTDJpTxsp5ajTlCo939G3sLZsWVXqDTeV0Ay3JFdVmjHiVXjiLvZLoI9YhWJFLXbPSQkhPuCuWd6EtsbzWn8xmt0TyWqAIY2b5SJ2rHM82S4PwMduj3uyvEwFATFMLIGJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617622; c=relaxed/simple;
	bh=wHEP3T0JCOGOfR8/mhG8DF0emMo+OpOS1XpQXj0JKsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvYeZPiUUCaiBaYoGJgqzc0usAlWTIRLyvPrOEEPBwSI7vYf9p6dbjb9qv+2imvziNJ2qzecUD2xa+UotyMujXGaZP3+FP0H80+mp+6cALaMSVY+fAzWLFGQtbNhlrtDXltjZWBkuz+VCcITSOML+VZaURkS1HyZpJ+gfAtFKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=aPaA/4Br; arc=none smtp.client-ip=45.157.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="aPaA/4Br"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gFSms213fzM7r
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 22:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778617613;
	bh=N2jcZfkZx8sHU1eydr66vjE0TAGI3mXPIcJNMYu/yg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aPaA/4BrxhBgbEPd74cWKGCnv9tau6fIId9ov8QYCh2ErCDfOlymEhgXLKSspS17P
	 KnhQd+2U3NUNbGteBziVGtgHJCHT9ViPZWuQruVD5B8GwsJp/dG29fOWPoN0dRzgKa
	 iNuSwz5hpTLJq0ceysnPFN5aOEqCmpOlVjp8ODHOUJuf0uW67fAsYZtaUXeyCkQUpS
	 URtcUoAlFHPI7ymXvG8q0Mw3PbtdBz1ZPwskJpEE8CUmLPBSypn9imr5rF1YtzN//w
	 tk/6pdu1xRkznCqBTUq6nGRhvLm6AQTLosiq92ppbkNl/2PScZ9vjbQRiAgH9oM3aE
	 covKFmoAguTzw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gFSmr6BwWz5W5
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 22:26:52 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Tue, 12 May 2026 22:26:52 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v3 4/5] Documentation/arch/x86/amd-debugging: Add example for reset register
Date: Tue, 12 May 2026 22:26:44 +0200
Message-ID: <20260512202645.1549111-5-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260512202645.1549111-1-daniel@gibson.sh>
References: <20260512202645.1549111-1-daniel@gibson.sh>
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

