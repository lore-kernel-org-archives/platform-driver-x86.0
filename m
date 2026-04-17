Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440F6364EB1;
	Fri, 17 Apr 2026 05:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402581; cv=none; b=lVH9mImddWXpA4iK6onF4wNJd67VEBbh9xf4vyXzIfe0TObOmPl9KbnWOKxRJVbd/on+zgLe+bQLbCodtgr80ECc+oQjkx92stmDPfPyVt/kTzKhAYu+vItMUF9JERdYNy3f/0XEO2wB5S7PTwm8eF8221iUDlgd6rqMf3l3Eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402581; c=relaxed/simple;
	bh=IQOaukCuOKVQcr5hapHpIcBkscfL8ANWwa7KceBMt98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5F85C5oDLW5ufMfZnh3KKwwGrP9Lxybe5qWdAXIwS0O91XqBmcStqNZEJWziBO0ir+CwFPgOcnB+bU5cMZBTB4cfgv02yyk0uWs+BCLSAI/9vJwL1SdT1ttY1nmFIX/P8P2DxfmKY2tuGCmK4c5iTa/CsZ8PXzqLSssW1ZvZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AUXwsJUi; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AUXwsJUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402563; x=1777007363; i=w_armin@gmx.de;
	bh=vGpbr0VrFDI/3GnPOZoF/vWye2wxtvZkGuSUYvsplsk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AUXwsJUirQZHE7AM+nkjX0r1jbs2PeFRZ7d4u7B5EJPukY6ka8JiAWZYb3K0GUGj
	 62xdTqVQMZKujI5LiPgCFzCTS5Qtl9UIWYuMaHAh9F5XHV81OFq5MHr3rK/Fh03Wt
	 SJ2P3BzMp7lKYWH6Kw/fPNAGhBtGNxUkg2cX4llBvOy8+yWCqxDClSLsDeuXuoF4p
	 nDPlnW0L4BXEQ71R34HuwJnUR1Jf+bSKCCjHuTBvZ8SzoWFXvNXtB7g3Rmkt1a+kn
	 qRqTrXwRxvxiUObMDmF4SC9vGNJA8krHoNJMrGBbsxiYzddH37ZPacT+U7pujLDXE
	 iUeDLGJuQq4c+4/b+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1vZv3y3PtI-00cLcp; Fri, 17
 Apr 2026 07:09:22 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] platform/x86: uniwill-laptop: Accept charging threshold of 0
Date: Fri, 17 Apr 2026 07:09:07 +0200
Message-Id: <20260417050912.5582-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:iHuNoNtdTmPBJ4YGwierEk7tiNUgemo3cmPEWsZxbnxeZ6BzsN5
 TFEa/cG8TTLw++YxGNvsWpMvN72tyxaNeQk3bybRYIgawojYRMtsNAT0HdZlUjFtxEF+uPb
 JMtmjzWs2U4J3OODr4C/BDAfRBJgwLah3f0duIq4K1qrQp4vJcS1W1pE5snCuNbLQfQxysP
 Hthh8R7AFwOlccMZs26mw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WLrKpCDy9/c=;PQ9ZvM1oZdJrrE1TlJQOH/jmUXv
 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

The power supply sysfs ABI states that:

	Not all hardware is capable of setting this to an arbitrary
	percentage. Drivers will round written values to the nearest
	supported value. Reading back the value will show the actual
	threshold set by the driver.

The driver currently violates this ABI by rejecting a charging
threshold of 0. Fix this by clamping this value to 1.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 8f16c94221aa..5551f193c2c1 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1424,11 +1424,11 @@ static int uniwill_set_property(struct power_suppl=
y *psy, const struct power_sup
=20
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
-		if (val->intval < 1 || val->intval > 100)
+		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
=20
 		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTR=
L_MASK,
-					  val->intval);
+					  max(val->intval, 1));
 	default:
 		return -EINVAL;
 	}
=2D-=20
2.39.5

