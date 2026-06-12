Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5463E403EBC;
	Fri, 12 Jun 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285706; cv=none; b=Q6fB2+zjeiUzQrltGnFP4cw56jPK4ODj6TKOim9b8gWgJQuerulDeGwUtsM3DGWI7KMU7sn3K5kHJXGFvIthNHQ4KNi4ZfYBe1UGHyFASzd1ruHiaraDgu70EkRGxirg1VQo2PPKNFVaFIVs74jsiJobScqFsPf+FLutoYn3DwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285706; c=relaxed/simple;
	bh=TttEb9JwhZjQT/oOyoKeQyiisWuP6iixccimpKZm1WY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LWmR6gWoy5Eh/S3K90YjOYPk9Kdb1R39yyBZ5D/UbtVmAFLMUUp+m+JmGm4fwNbv4rFStZ4UGswUeNK0tC5N22dT75Wn0J/oXeiZjYu+rxvQWRyR9cFevAZDBdD6qpnyNLmFOq9TNpsJMpF56abW2eGz3Q0hSMyMxkGfHwb7rJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ndXb2Fpo; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ndXb2Fpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781285696; x=1781890496; i=w_armin@gmx.de;
	bh=pY7z3Lwdo09hb9WZLvkS5Tey9P1PQ/b5loc8U8j+tZw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ndXb2Fpogz0encypG1cRefSPBLWO6vUlIJxI7qKHvt3901jym8zjoK/Hd54az7hE
	 jF0glZ8WIDlax5bL5W8WDiC6XwubLVbI9J0A7Hdsgs1lZFQjCpdyM9z8WV6XMX2eV
	 zFzpFWwyv0ON8HRQ3I/KqHBenffryJxc6wYGGAJMJ5HZJDTy0OJQI99AdstHy1Q1m
	 1gQZFf9shMKZqK01sGoQG2GpocELBnHx/+Ih4iTIV6+/JqS7J0RGy6WX20EwlrNo4
	 RPP5u6w4tzyE8MdQhtLDLQkbkm7Ub7SPkG/H94i+fYCIglQDT+cVz5PVGFLUCNLLc
	 ngSQtwGZMAJX4sys5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Vu-1wmsq13ypS-00RgUF; Fri, 12
 Jun 2026 19:34:56 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: dell-wmi-base: Fix resource leak on module load failure
Date: Fri, 12 Jun 2026 19:34:49 +0200
Message-Id: <20260612173451.467629-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612173451.467629-1-W_Armin@gmx.de>
References: <20260612173451.467629-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d41mcJ6GCpthchP7Qn1XXYGY4WI2SjsK1Pf81IkqmcSS7Ryqlr+
 txXWqErqepAIkJNlXPuCVpm2sqgntKLHhrfbcZiVzpB1z3bS3D2bQebtP1gnnYXyIO4mkLa
 JjJd7OTPnZiuNEFyBFqe4quhqovlAvXBWyjssEeg7Y7d/23UTYVXSoDFdRzaUCHTOFrk5bD
 sXDhOqCzX5eqUFu2Xs21g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3Qs80gidSdI=;21QcMPDY8Ujj49KMQZ2HrhMBHsl
 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
 hBdtXViuk0E2iv/M4k=

We need to properly clean up the SMBIOS request and the privacy driver
when the module load fails.

Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell har=
dware privacy")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-base.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/=
x86/dell/dell-wmi-base.c
index 997383ba1846..fd6a508cd902 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -843,9 +843,22 @@ static int __init dell_wmi_init(void)
=20
 	err =3D dell_privacy_register_driver();
 	if (err)
-		return err;
+		goto out_smbios;
=20
-	return wmi_driver_register(&dell_wmi_driver);
+	err =3D wmi_driver_register(&dell_wmi_driver);
+	if (err)
+		goto out_privacy;
+
+	return 0;
+
+out_privacy:
+	dell_privacy_unregister_driver();
+
+out_smbios:
+	if (wmi_requires_smbios_request)
+		dell_wmi_events_set_enabled(false);
+
+	return err;
 }
 late_initcall(dell_wmi_init);
=20
=2D-=20
2.39.5

