Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32281399011;
	Mon,  6 Apr 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504237; cv=none; b=cPH23w3AJnKxdPghIcIsls/yE7PwAtCMrnKLZjy4K1Sip8abcrLtIFCdlT7UPkJlV/Y/ZR8QclQpAMaOQR2+ARmqErvKuOyrc+seY4NBjzjsdGYCUCmTc7IhR1KQSysJH77yyLO6mGYSLRNGO2VC8BaDvY8O0aefh+NXyvrz3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504237; c=relaxed/simple;
	bh=esCxLWYoA/+NjnyVT6NCeVZ6QXwR1EoDhdq7iYCVg2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGbKr7uRma+AXqWlqLudMwr1KKJ/ZEFurtWLaB24zqxaH0vwabXZK/nbqyNCOflnsfrB6pn7I+n3zth8eNHZ6o8b+2wy3zUF6WY/lOa5dOJCAeOZVBB6FAKBLa/bQAp6KgL+qsbmaaHX8b97S94EQGb4PD3dpQE6RHvOd4YfTcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NlqMReaZ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NlqMReaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504224; x=1776109024; i=w_armin@gmx.de;
	bh=ZcXNtNmzNBjAZ2ZObiILpn8jzc2kMCRBTDsRXRZKtso=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NlqMReaZJrxd8FGN0FX41/6CvYjkh6F3RHnzfA5M9ufhn9bnxnD1RvKqFkAyhRNK
	 lVR82PCVXH3/Kya27P52y6lZggxIaMCe4aKT1h4PJMeOKYOh6qqSQYuOl1Y+RfgN3
	 rauwWJXzhOibsbwqWGgiryjGEam5mIMgMe1TLIqJLMemjOGFnUvxs6OETgRRen/a5
	 m4Yp8uIaIm4RCfUEeiLQYytnhfceI03K4z8nQq1mMFOzSg2q7wsz5T1ZehGbI8oPj
	 iN1ZOSrt5bxSAB+lLqS6QnZW3vCxFOoSM30gPfyp2y+HljRzyVCdmu4LCRwISKf4+
	 Gs/kKDRvxjRaBTHzJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1vRnsN2YA3-0172xQ; Mon, 06
 Apr 2026 21:37:04 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] platform/x86: uniwill-laptop: Accept charging threshold of 0
Date: Mon,  6 Apr 2026 21:36:49 +0200
Message-Id: <20260406193653.7799-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406193653.7799-1-W_Armin@gmx.de>
References: <20260406193653.7799-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:85SOyyXnav0WRZktDtClvvKftjWnwXYdUWpTS8EsOgACBt0al7M
 FDuZi83+OvnZX0S+FAmVj0T/i/UYpkkhco9soBcebGs0gaP98tITQQC/YaQfspzP/nbGD+7
 XipE22W5N9Y5R56E8NTjHsPAiPyiBS7saK87DnRD4HTLvClg0YCeKGg8eYArr3v5pyQqC9u
 xU7DJcircp9kz2QB6mh+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gR060QFszpY=;uwighYT4vJd46+BLraQ9lpCQBCr
 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
 gTKgPkCIvre

The power supply sysfs ABI states that:

	Not all hardware is capable of setting this to an arbitrary
	percentage. Drivers will round written values to the nearest
	supported value. Reading back the value will show the actual
	threshold set by the driver.

The driver currently violates this ABI by rejecting a charging
threshold of 0. Fix this by clamping this value to 1.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
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

