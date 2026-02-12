Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF4523F424;
	Thu, 12 Feb 2026 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770879774; cv=none; b=KgpW51kyhPWuGgEABpLkK3QFycuiA9t72GoPmAO8/zcEht5yDe9Qj1w8fiUU5DquiX9TsY7nHXLGH3srpRaklj9ystskRvyAVlEplGI2dWnqZYRFdMro2VfXtqdzfSsJnGuExQrIamy2TDlvPZQMtOpe1yy4CFIkLkNgxHGGjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770879774; c=relaxed/simple;
	bh=sa6CYTU5cL/hpWUbRgp1qPiZPytf4PLf4/u8hIGKACo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GXBHqslqB2J4wzMSIGBZcpaFibhc3gu92szyfLBrUwXcv4HCX8crmg7SMngON2KyX5+d177U+6pSDN/kJdvWcxsiySmKJIY3kT530DFqBG85Fff2LjcCFt0E7EnlwYmqRhkVgR1ASzpg9g3PQM3x0MWwME9ETedyi6rzlmex18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bm5Oaz+u; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bm5Oaz+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770879767; x=1771484567; i=w_armin@gmx.de;
	bh=EUFJ1FojByf4WN3V1kf4vyC8qEwv4Cvf0RDvuUtPexA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bm5Oaz+uNh+YhICY2ULiXOdIKw17ANFQKP5HzqvCKBYp7HDck3KLj2daA7w6mp0U
	 NOSjyh+6pOYj4OLqmkrMcYrLkJFIOCubT63ptiR6YqtyxGbosRBGYx9lsC1ADZ0QZ
	 I8E5hlwN7B7YIghIK0SqvU8+5OOOPE07CaK1i27QSxl+ohD3+1WuOwm9I1aH1UE/N
	 K3H0nkAnYW3IIvKuTa/ZesyzEeREKs2t7tjCPUPPAPEttTWXnwEaEDHAFn8zgXWB5
	 m/SYLLk6Q6HD6l3JFjIfhD8IhUXhfLidy7bPOpoXtsWMcJajFEodRHSLYXNcOWdU4
	 nZxq4+BHQ7PVdzLUmA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MOA3F-1w9rHb3r2X-00LaDd; Thu, 12 Feb 2026 08:02:47 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] platform/x86: uniwill-laptop: Fix crash on unexpected battery event
Date: Thu, 12 Feb 2026 08:02:33 +0100
Message-Id: <20260212070236.17296-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260212070236.17296-1-W_Armin@gmx.de>
References: <20260212070236.17296-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:24u/Ir2sllFVAUf9bLrzaGBcFsBVn9NpxbDmdFdUu5q6Ch6jgwP
 W0INhGIQ5SjUa8XZcczmFgYNTofRWdAYZexCeyA3QDTYVDYAjDKymKfm9VEU3eWlem1TtUV
 pMqJA2dBj8O8Cia9rPsmGEeFgN36HZoh2IxyQPdshVKglqEyfoJ+h50rbCfZR8Kiyt8szVA
 GImyhWE/hka9nSNWhQSKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HTbgU6kJohE=;EfVFrdQEuNvOlo5kx6eBpFO4WPO
 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

On devices that have not UNIWILL_FEATURE_BATTERY set, the underlying
hardware might still send the UNIWILL_OSD_BATTERY_ALERT event. In such
a situation, the driver will access uninitialized data structures when
handling said event.

Prevent this by only handling the UNIWILL_OSD_BATTERY_ALERT event when
UNIWILL_FEATURE_BATTERY is set.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 30acf752adce..ca66288e0d5d 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1355,6 +1355,9 @@ static int uniwill_notifier_call(struct notifier_blo=
ck *nb, unsigned long action
=20
 	switch (action) {
 	case UNIWILL_OSD_BATTERY_ALERT:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
+			return NOTIFY_DONE;
+
 		mutex_lock(&data->battery_lock);
 		list_for_each_entry(entry, &data->batteries, head) {
 			power_supply_changed(entry->battery);
=2D-=20
2.39.5

