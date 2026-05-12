Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492CA33EF;
	Tue, 12 May 2026 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628118; cv=none; b=HCEhRbG2yI4gHWRfivsrPmx6aPCOGm96aHnTOsYmBGkn0g21Zs5aybIKwTbrEsgrflYnEmJSoC6LiSP6ftSz2bnRp7dBr3UOmnpss45lsHLznfHiFoZDjrpwDTkiJq+Q4ERARPeJnMbHAj+HITgDUZScTClWl6HwSfwl/oFiT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628118; c=relaxed/simple;
	bh=v3IFBmtOeIcc0a9aW7NXXZAzzOEkDQx9iFXRoQXWY4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQhb6M6Alq8L8L3LVOkPNkr4ZNt4P0t9iZf84Yx6+PsLfiEUfgHLVeRXxnKXCgSeSkqd3qxz98mDicjDd17lsn2HuB6Z1qIhJAaxUzrPi6akBYWOodZTGtECbCpcSakdWHUVydysj/sBQpSa8xig61RtFo0E3QvBmjvNMLsNXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fXSwN2Rx; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fXSwN2Rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628114; x=1779232914; i=w_armin@gmx.de;
	bh=z0MgPVIY+bb6DSeoL8Ys7o7emdpNgOzL7fIUDnErw7I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fXSwN2Rx8FWLqU96z+YMGn3aDLmm/co/bsQhxzfQ3noIQ9Wi0PWEqf6OyeGiKsFy
	 wyRGQQKGra8FbwtsvrarAqJVVzePNbDeflG/CZeuuxkSMUFzTZ2rrvZIwotX62xn3
	 pstZSPtC55JuUpDc0iDqXvl8ThwnMd73YsI5FJYDmCWxS/iK4DQ7PwjQ0D4fg/t1d
	 uo7TKLnNN7Bo17J1LjP5yCcRVTciQPAm0v8ppOH0MJ+6uvoiuVtxmLKbv+PAAl4Xb
	 81g3r0yYGNXOLvwUqXnlTitcVm0e5TpnyqDszlWI6YxbFeDr1wjoKwWV+9zLy5poY
	 LpNSQa01pFPfSU+Xwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmUHp-1x4UeR22qH-00hlDK; Wed, 13
 May 2026 01:21:54 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] platform/x86: uniwill-laptop: Accept charging threshold of 0
Date: Wed, 13 May 2026 01:21:39 +0200
Message-Id: <20260512232145.329260-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yB00ah4Iig00iTbDyWfX8ggwnz7pqzCHFWj7gKLCrG4E0Hv+eGB
 aYZL3zKWCWKyOcuLhKBXnKybUws2VKkN1+0DT1BVIbzlEX8Y/MxAXkAPCtdznf8CdwxWyPg
 XXLeQlQJjRmnYJtAD1L/eipXJ/+c1smBZD3cagpqFmtxz6e8WSokGQ+NqgZlVBvFKHGPi49
 ljdvaPffwjqlQOYWzfing==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qIk1/HJuv7Q=;3fpSVojSnEYPTKAnlb0ExIW+DZx
 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
 Ba6VEUJ2X1NJm2egFp6KfuHNDG1URXfmAXzE=

The power supply sysfs ABI states that:

	Not all hardware is capable of setting this to an arbitrary
	percentage. Drivers will round written values to the nearest
	supported value. Reading back the value will show the actual
	threshold set by the driver.

The driver currently violates this ABI by rejecting a charging
threshold of 0. Fix this by clamping this value to 1.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index d9c202fc8c71..1f9e9f61d387 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1431,11 +1431,11 @@ static int uniwill_set_property(struct power_suppl=
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

