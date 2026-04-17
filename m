Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012E3612E8;
	Fri, 17 Apr 2026 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402567; cv=none; b=L/dyH2p6m5BQbOu4/WCnihTkddUxVYXQNRsmqCu1mCLx5sQKPlk5GpvODMwQIbhXiURVP5ZFOBu9RDD7Ci2MPPJgj95TlR7NY/UfocS1Jw9qBhC1AdF+mb6rvgm3hZtjRnwGhYhErGgq0rU01vrAIe+4LDCwuJqGFmHtYNpU4ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402567; c=relaxed/simple;
	bh=/GHcXEpHI4q28HOLkAa7hpPbMfQFN2h8/D8fV255OJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n5YfufgIiLBxJrJk2MGUayCqkLOB9zJeCvBvlHKD5BoK/qGQP8ELffN1wJOsvh8BJ3bUs0O69DgopqKBNLHNf2MHkjGbAadcgK9Bo7PrxCrAraolZqac2BylBwwOsHPLdGaxsjdPYGaHAQ/Li/oVcARWyHDxnalO18GO2SOeOLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hl7TExtp; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hl7TExtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402564; x=1777007364; i=w_armin@gmx.de;
	bh=h82fCWuRoIRPaLTJpQqASL0Fssnz7ZuXYX6XEbm5Wyw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hl7TExtplJTFTWimfqUp9jzeH4XB4CtfbEWg2D4MlYWxu9scsC9NhZgGtrLx3DXF
	 Ewa+O9g4V98RTYfAka4xgum4F8rZnJd07Mq17ortBUkx+Tu7/+wjvvkKCsHHwst9U
	 ofEgQWlElXzfHqv3O8Z3qapRSlcHLv7CfcxQmFnBTgDnzY3ALw3KNDgko7CxcwRk0
	 rCDwIp4QWo7hUtdUyu+SlB9VO+nACb0fGa0KAOnUX66mNkCriTvwy+eepm0LdQJRc
	 XbR59t+w6PuNCWPxJpUnmrDFMUUFKmeely3qzeYlth3/kDWTdoRrYRngTbsL7qoco
	 zA9DgMxgjo7tRBIjXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1vDppr3wP2-00wEJe; Fri, 17
 Apr 2026 07:09:24 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] platform/x86: uniwill-laptop: Fix behavior of "force" module param
Date: Fri, 17 Apr 2026 07:09:08 +0200
Message-Id: <20260417050912.5582-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260417050912.5582-1-W_Armin@gmx.de>
References: <20260417050912.5582-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iAKWSKOtIBw8hSLUqemeCOqGrnYMMmlPJvMfVbXI6srXpIHojNg
 h3A6sGxFqA3RALBYvtJuS8j4e75kDFxsHD+krc91eevESexGofxDQYXAtFPWDzY9auQRoq7
 8N6SJkeUQDEawaq6eMMtafUJuX29RmnZrD9kfaptl6EX3kix40rogUz+/C4Y8VYGILG2OF6
 A8JCFuXaittzYoNRXnCDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QMwyGgPsHBM=;0YPZ2Ohnr4B+++5SMVDeXXewiLy
 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
 EhhShA==

Users might want to force-enable all possible features even on
machines with a valid device descriptor. Until now the "force"
module param was ignored on such machines. Fix this to make
it easier to test for support of new features.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 5551f193c2c1..7c7ea0e76966 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
 		if (!force)
 			return -ENODEV;
=20
-		/* Assume that the device supports all features */
-		device_descriptor.features =3D UINT_MAX;
 		pr_warn("Loading on a potentially unsupported device\n");
 	} else {
 		/*
@@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
 		device_descriptor =3D *descriptor;
 	}
=20
+	if (force) {
+		/* Assume that the device supports all features */
+		device_descriptor.features =3D UINT_MAX;
+		pr_warn("Enabling potentially unsupported features\n");
+	}
+
 	ret =3D platform_driver_register(&uniwill_driver);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

