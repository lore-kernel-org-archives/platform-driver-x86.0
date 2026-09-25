Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B01471D0B
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341025; cv=none; b=vE+G+iJaAqq0P7rxr6HFvGXm00CONS+IY5jG4i51omiQVRBY+IkDFA7wKTQfngx95YRis4b/KSyxO5U1BsGQqwD8WInjvsBoX44xR3AUrWPXp9LgNmPDSnNTzMED0TPmXZL5mq93JOmhID/iq7G8j5jkwzehGDMJaYIFUx54Cac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341025; c=relaxed/simple;
	bh=Ojbh+rpmbTerjzkOkZrZx99fvYmAHgItmgKQe1gUMkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L09DQvvbgLPIsc6oaOchRynApE39YgEC+KYiYbmzTZ3MWvxkFGxYgwZ7qHEE8rXafTaEbQgTpiAkWbSnld69h3a4mkLUBDhtTdA+YMTxtxupxF2rg0eEaQSDnB1NCO2ayJqIF9ZhTHmB5iPUTPIZeBSmH2a7XXS1BoGZ4FR9liE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqW4FNCY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqW4FNCY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-488615e6cfcso854320f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790341023; x=1790945823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNUur+VAO5XL0t2pFH3iSgJjQ7R0M85XRXolYcgZ57k=;
        b=dqW4FNCYPpoR2PziurXcOz/D2AhaX3GJBJKppRxjnR1ONAx/tdIx2SGkQplzLGZcnM
         WeyAji3GBNL/1eVWvOQnrKQbtbRRHctP3o/OvbrJvzaefPDWuzVxqmyqJwUkQjwUHe/y
         dmhh3IE5XVVSXPd+XkWYA2tEOxFzMF++MMb9aMB9HeGgGjnMkinkybVm5Gms/p6DmDqt
         ekTQZ6MErK3x2m9sJNwBMKHYnrNVskXTmGwKOFy2+0KqlcRm1achxuA2/vm1eFDoSKvB
         8QSxKcKLMkrPie598BkwFgUoEC366HAEyPSJethwgU8w/6qwUS0rECJ+nIA32U1+WJOj
         1SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341023; x=1790945823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNUur+VAO5XL0t2pFH3iSgJjQ7R0M85XRXolYcgZ57k=;
        b=nHvODlt0m2AC54EZhbLkwaIiRuxYtX9pv6Lvh4Jnqd6cDUUbpFiCRBGqhgU9jW5UIP
         UbEfoesPxoHi5I8sqhXMbdYvB6m7QOPSYrJn7ECYHQZrs9ZbcpiU9R5hkCc5Hn88ut7j
         cNLyEl1SSOO8pxDE4yGxJpJYXgvJuataQla2Hql2nEldKBrqm2K0kgO8arf1WYX4lZTQ
         w9TXft9jX9jDzhMxQoGn8LE/Ky6Iz0MJTEWp5rFSnOwTbwDSjZusOAuFuZWO5+IwLWaH
         tgOznIQC5rBlALUsNwGSqUlpXCUoSlUc62sXkMFsBn8nUhtWX0liTwv8xZ0WQbeSLsZA
         39sg==
X-Gm-Message-State: AFuF++lIYvkLfPUHJn2BNXDIi9fLyMjQmrX0iH3ujdlN4X9HY4m/fQAy
	zGGu6G2KEdr4wJ/J1vTLwf+rAlcqBY90goE22d6GnctgDJPAMRuuqPiB
X-Gm-Gg: AYBFou1ylQmJ1rFtKRcDQn9J9gnwASLXKa14GlyVodZhOXtCfzKAgh+65FF5WVdPDMM
	JZ1bXnEjRb5wdS+MvChWPgiDZv5fO3Yi2c/zQq1FMS7BvR1/IEvbBIeeksgmV9zgY+TqvyMfv2A
	MXy/pHcP7p5XoVjMoJY4ZOKO0YBcW3COwIn7+zASsnT0HyXwhhvtCVI2VOOnippNXg+JBdqgU5u
	uRC9ON6DpfGF8Wz/MI8ygXNYeYrDWV88pRL0W//k72S7dRFPSmQry6JWx9p2Idb77Tu2nGK6C4L
	XVbrWGDug+Age4A993Tq5dcbEN3NoRcdnUwVak1U4f9DVqQttml6j7oBBrJ3n67BFYvXOI1OUGz
	QJtGMr06RG+3qcWu1bT4zdO4kjHqYKbpasECoUtgv3ndtMz19Si2YCK3K5rNDfwKwkplP5870dT
	cNdB3fjSCwhmHDwQkvLmN8URX8R6EpmPxFACLp/yjR4scby3PspVJYdE12fhTD5InZ2Io4tD63D
	84/EzXzF7JzPHKjiyUkf5UaKCz1nX96kHU7ytbGfvzVPdB79z9LMPcn7wlPYccEtNky+bUGl1LB
	WkmAAGIyOPkNh9i1St2NUMt41lZ9uwLw4+A9K3JJ3L1T
X-Received: by 2002:a05:6000:4b0d:b0:487:3c8:9675 with SMTP id ffacd0b85a97d-488716aef48mr11226216f8f.8.1790341022604;
        Fri, 25 Sep 2026 05:57:02 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:284])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349fa1sm10016698f8f.8.2026.09.25.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:57:02 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: teackot@gmail.com,
	hansg@kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Add MSI Katana 15 B13VFK EC firmware
Date: Fri, 25 Sep 2026 14:56:28 +0200
Message-ID: <20260925125628.69826-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the EC firmware string '1585EMS1.115' to ALLOWED_FW_10. This
enables battery charge thresholds on the MSI Katana 15 B13VFK
(MS-1585).

The out-of-tree msi-ec driver groups this firmware with 1582EMS1.107
and 1583EMS1.109, which are already in ALLOWED_FW_10. An independent
report for the same model and firmware confirms the same charge
control encoding.

Tested on MSI Katana 15 B13VFK with EC firmware 1585EMS1.115:
writing charge_control_end_threshold updates EC register 0xd7 as
expected (80 -> 0xd0, 100 -> 0xe4). With AC connected and the
battery at 87%, the battery was charging with the threshold at 100;
writing 80 stopped charging ("Not charging"). Charging resumes 10%
below the end threshold, which matches charge_control_start_threshold.
Keyboard backlight (0xd3) and cooler boost (0x98) also match this
configuration.

Link: https://github.com/BeardOverflow/msi-ec/issues/185
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 566dfc73c..6d6a797ee 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -825,6 +825,7 @@ static struct msi_ec_conf CONF9 __initdata = {
 static const char * const ALLOWED_FW_10[] __initconst = {
 	"1582EMS1.107", // GF66 11UC
 	"1583EMS1.109", // Pulse GL66 12UEK
+	"1585EMS1.115", // Katana 15 B13VFK
 	NULL
 };
 

base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.55.0

