Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9163254B9;
	Tue, 10 Feb 2026 23:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766211; cv=none; b=d/UQjCBuNhRJcJ80Q3qwY6hH8klOEJcaKPaGZMFonlMkqprHz+uzZQwN/ImpC2J/wKGB7ujE87BXRKmcwG10Rdh9TDonFX8Fh52L4Kx1A2qWizE8ao39f6J1jL9/4BLwkv7NVgvG9TKS41vZRcMV1ZwfE1Y0jBQj0Zt62I8Hlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766211; c=relaxed/simple;
	bh=6oGR9K2BnzJDQSFZyZG8oQWUItRh9IL7GGzhSPcEVr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dpGgocb1AgS0Fl8StSJ4E/sZ7gxaVIFyaYMLA3NcebKiL/eYODo2RSkQY44mAGCIjM6iL2Rl5MFB340uJCElxgzQ2cBlCMiufYFJkoTPX4z/nB6xxlljsBKQb35opB7beYBil8dgf81zHyCRzkP46fyQA2pOBEZobgTAeJV4pi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KEDc5iQ1; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KEDc5iQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770766200; x=1771371000; i=w_armin@gmx.de;
	bh=MxRYQQe/YScp6GeFBt8J+AuOn/moDV0qTdC4sNULT2E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KEDc5iQ1vzoWL3RF76mEKEP5QmDRD8dFzZDkzIeI7kKez/pYZmw6C9MxgHNl5Tc4
	 /L/Gcf4W4PSVRRafToZ3GiamGwrKqOL+kVer3l25P93Mn+FLI+QELHZkYlFmvQv51
	 HqLVsxlZwykjVGomlNsfUtgFsrKqLAbFmKbdWqvr7n5/hTN70FRPFz31nWjkuzZHw
	 sfqtjA7yfy916t8DZldElcKGy+8Kgnu7UDgh6GxW4epgMQhb9iH4/SAm6zwJZMtGN
	 GeI2QfGc52EBbe5O0dNo7brB2qpM8vj3Y5iLsuAKVV5iFCsBrQ2Z9f3cpObtIfsIY
	 5AJurbpplcqOtaFXDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MStCY-1wEikr3A5e-00PPLj; Wed, 11 Feb 2026 00:30:00 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: uniwill-laptop: Fix crash on unexpected battery event
Date: Wed, 11 Feb 2026 00:29:43 +0100
Message-Id: <20260210232946.302936-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210232946.302936-1-W_Armin@gmx.de>
References: <20260210232946.302936-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4RjvO9SUsiY9/3vbgZ/p8JRXcP6q31BltGJ31hd4ExPlj++mAuN
 qNs1/bEpzmTZZXhvwLMFMZvrpQHBJJmEFX4JGbuMVV9aHQjPLApiz8j1PNCT+cjxj5iffMj
 IzNm5JQYQwcZOpDZitn8MUPUx+NFp6FUFi2Axr6jgB0eQVt8dT5ojMmgqV7LZbiTe6v7/aI
 rsmqKvQHcw9aaq6jXIdNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eop/dj/qQH0=;Yclqe85cu9z58Akl9mtZAD4ohtY
 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
 9wpOv6TgXzYEzUSRcPhy

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
index 856d5e38e045..938e39647be5 100644
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

