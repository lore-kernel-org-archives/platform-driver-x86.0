Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD1274B3B;
	Sun, 28 Dec 2025 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766958167; cv=none; b=RDa8SA9w9YVaUdi53/ik19c6y9QVJW+RhX8Rclk5VfTDAVfsl3b6fMsEnD3tkIpkuI8KUEUdH/pTuKg1bgMnCi9+jU43DVF79tpPlZWq7IWwl7Bcltip79WoGW6BT0tHnZHGv6RQwIN5c/OyBQp6QabCfi6KEctnYDMiCX/EPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766958167; c=relaxed/simple;
	bh=KHy3cpBHcA5E5rb1dfYHq4PN2NMGhtW35VzQq6ym9Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=us4fKNiwtLDHpavi5ZPre7id7+47gYH/nV/KPYC/gbRAK5fLhOqQpck/ayRGaXBIRIVE1kxYHdQPABs0PSjvCrNFGRxcTjRKeK8nPbIG3Yn/qi3ANE8EPpavd3wQkDmIS78LwMuqJuF3nqIOM9qcUDfa1n4QFka6z6Geom+tquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jJbMY8C4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jJbMY8C4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766958148; x=1767562948; i=w_armin@gmx.de;
	bh=W+tlFXPvvzTAou4qPekZ9sYhiKGpBWhR05/jOAAJTsY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jJbMY8C4u6vhcr5g2hXNxYbv1SCbdH19ogNOeYmjF/yY9st69R28k4+pwf9pjz3l
	 FIAQyH5P7luPsKA+dc577qpUTizfVFqmS5O73SUAfs9iAub+AMbl+yUxeSP2NTsn3
	 MtEHG+tt55loexQCzRuiZ49KIBOVv3YtEih8KPDkq1+Lw+cPHkKTz0WIAxwpUrIio
	 cgRE2F+4Sqaw/G5qye9VlTilxX8aojPGYaqbJd/IiVzuJr/3xhF5VvsLEuXK+jbFS
	 0YWs491WXvKF7R2H/dB5bkQwBmlnnlA64iIzQebG5eg1BzCRNbBFiRUQB9t7uKRvb
	 gMTcqtVYp+TCN+HP+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from linux.fritz.box ([5.61.142.23]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLR1V-1vIitU3KbL-00NMpJ; Sun, 28
 Dec 2025 22:42:28 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: josh@joshuagrisham.com,
	dakkar@thenautilus.net
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: samsung-galaxybook: Fix problematic pointer cast
Date: Sun, 28 Dec 2025 22:41:31 +0100
Message-ID: <20251228214217.35972-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VV41Fg6caLk3s0ZjTfTfEnt2WHPnBu+yjzVBIX+DwzazNOVfkeA
 b+Ud82GGFEoQ1L0qPmIKHemGmDixDY5A/dTSo8zYv6g0e/t9MdZMUuTBE+SlKcXpjarWK85
 njZfDtcmGHWN76TjbYySgOV3WZncia0c8DOJT+/cL03grwc2NFOJpdQgPJani3d1VmLuROJ
 TKYLV7x0CR9mEp+EsSH2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lEOzTv2MMfg=;F+GqutdM5w5ywMM0mjxLxdNVr8I
 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
 YfUWG5KVhh2Z7nYUYHMaMlYB9RHuf

A user reported that reading the charge threshold on his device
results in very strange values (like 78497792) being returned.
The reason for this seems to be the fact that the driver casts
the int pointer to an u8 pointer, leaving the last 3 bytes of
the destination uninitialized. Fix this by using a temporary
variable instead.

Cc: stable@vger.kernel.org
Fixes: 56f529ce4370 ("platform/x86: samsung-galaxybook: Add samsung-galaxy=
book driver")
Reported-by: Gianni Ceccarelli <dakkar@thenautilus.net>
Closes: https://lore.kernel.org/platform-driver-x86/20251228115556.14362d6=
6@thenautilus.net/
Tested-by: Gianni Ceccarelli <dakkar@thenautilus.net>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/samsung-galaxybook.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/=
x86/samsung-galaxybook.c
index 3c13e13d4885..755cb82bdb60 100644
=2D-- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -442,12 +442,13 @@ static int galaxybook_battery_ext_property_get(struc=
t power_supply *psy,
 					       union power_supply_propval *val)
 {
 	struct samsung_galaxybook *galaxybook =3D ext_data;
+	u8 value;
 	int err;
=20
 	if (psp !=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
 		return -EINVAL;
=20
-	err =3D charge_control_end_threshold_acpi_get(galaxybook, (u8 *)&val->in=
tval);
+	err =3D charge_control_end_threshold_acpi_get(galaxybook, &value);
 	if (err)
 		return err;
=20
@@ -455,8 +456,10 @@ static int galaxybook_battery_ext_property_get(struct=
 power_supply *psy,
 	 * device stores "no end threshold" as 0 instead of 100;
 	 * if device has 0, report 100
 	 */
-	if (val->intval =3D=3D 0)
-		val->intval =3D 100;
+	if (value =3D=3D 0)
+		value =3D 100;
+
+	val->intval =3D value;
=20
 	return 0;
 }
=2D-=20
2.52.0

