Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471031;
	b=kuKU5c/WrugeY+BND54yEqM4VFexZleW+GjRkGX6hmXvl2Vd6jGB8mRR2SSKAP7LuyM/
	 AkHfE3mozGLgxWF+LoZ6ClJ5bsWkD58jJmeFKHln7zEvoKyzHPtC7rDOtMCjVt8hlNJl6
	 /lLom8sB3bG+GJsWphTVbw6kDm/NNCSBbcD0WBw9azIm9fY7FfAOZ2LJoAZpyuudyzcgT
	 B/o8tChZXDJ2dQtjW3kc9fraNxTWd1bREhtymbXzxpjH1TMMC/Jsmhydwe3WvtvevxtE0
	 inszUN0PTpo5o2leIAzlTyCXcb5lA4ouSUjSySHnbQ2ReTrgtFU/YIaeoYcNBro0Qpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471031;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PBOx50dU5MAESsqZCyDmajeGF32kegFfpiXvkGjOtO4=;
	b=u/N4CtylS5/tnRj0miQBoXdeENGavT8CHHQ5ljYcIODMO7KgwD7C1GhnyPZI3xhsBvQP
	 naSyZ/qBXVJDFFp0ehXOeqftOHNKhBtFQVUtc2E8i9DEQd/oJITEjEmZkLyrfQHGm9qR7
	 VK25DHDyxJ1XF1Cac6WagS0CnI54KeV8LO1OUYttW3VX9f48OyhUTbTS5Bct3AdoMbO0B
	 h/v8Xvas6CpXPDQKa5vILRQ3yWO7HpKAf0/iL0a4/fp1IWideDeD0JLxKkZl0Zk5BESJf
	 YelX0b/XVM0iK1zJs0k89qJUuMCWHO7j5qJgtYiouYbWt/kU1o9gH2dNsOW33nLe4Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbwMZFzh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0104606A321;
	Mon, 23 Nov 2026 21:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbwMZFzh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795471031;
	b=VqLYZOT/P2RVtU6ZIvHjxXWmOdMibel7MmtUFZXKR8InuKdKmkBJ7UGtU4wdeC2a9z4G
	 tA93Rg/b6z4Oj8kjANCcV2H+vAUmIipX1C8d32iqCziLM8aAOB4gR450lJIiRJdk/9ooH
	 wlLhuWt26k3Sn+DOl9h/fNIw+SKF8jpPhe96YlIUcY1pSInlKSWVtjKdfQUEKt5Fo6o8q
	 IjP1sKyUo40iL1spwRhcq3l0d5VpZjGtdx0EGDML2JPh9MrFlSlSqyeQeoZtZZyiJ9NQi
	 9OzwK5KqPdD/yChGaNAev1lqRNiUDPQ7FGlHo+Yzp4aUg4zs1XhzsG4bg8TaGKl0yxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471031;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PBOx50dU5MAESsqZCyDmajeGF32kegFfpiXvkGjOtO4=;
	b=tip3Sg5IZ7NkIWJj2JuB+SVs89jn8jqKKLP36F854xNPjXAkUcTrnZFaLS5skvBvKRIW
	 YYMa2X7QNo7OmTTsCSCVAAKx+k594W60lNY4f5LAk9EuN5pbymMIA3g1i0SYhbDZzEf6H
	 r96I38X9KFZRzdP3Rm/H6EOTPqCR0HMGcIepq0o80+7EW+lljfiV+oSTORtCC9NQHIbIQ
	 XtJWQWvcaaLCUTesWQQJ4IIKbEkPjd6EiXIQBeR7A++YAM3JT5Feyo1bZJeMyfq7KZNCN
	 FLZ+uxlZ99LcULLUSuhnMRltfiXuV/UcXSauhV0u5lk8yGIb81lSqeUny9nGhXLeJ4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 853891F000C6;
	Mon, 23 Nov 2026 21:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471031;
	bh=PBOx50dU5MAESsqZCyDmajeGF32kegFfpiXvkGjOtO4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=nbwMZFzhkkG9kZzRzoJ7eoyWYlGzsHnivm6IAR4vS3GjzMOfETkpeJpDqzlQLTbDQ
	 BpevoGG9Um+RNOlL1PmUmilN3EfMURROd44Ba8ihpi9pTI/LXjd8Yv92LAswOizOTi
	 IZeohZKR6eDvYBxp8qZzm+0j3f0+d2nOyFDcTXO5z8F1Urok/+BIC2TLgpS0c+jgvo
	 G45W5aF26vS6VLcH8XsdLYZMtK1LzcLIi6uu35as5SqvDOVJvHVDxteJK2O3ZdsFZj
	 M1IsXscXEddRnVpKkHt35VEZeoH8B9t3kxjGBLTHOUbScHJ4o9oFIG3GK0AScRteB5
	 0dsP/KCmrzmug==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 050C44C77B;
	Mon, 23 Nov 2026 21:57:10 +0000 (UTC)
From: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Aime_via_B4_Relay?= <devnull+frederic.aime.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 22:57:10 +0100
Subject: [PATCH] platform/asus: asus-wmi: Detect Vivobook thermal policy
 without presence bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-proart-thermal-policy-v1-1-396374f9e1d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgRiLSq5Qu0jjqiDVhEkuLe
 HfTdvkW/++QWIUTXKsdlF+SJKwF5lKBn9w6MkpfDFRTaww1GDU4zZgn1qdbMIZF/Aeps7b1bBs
 aCEoblQd5/763+99pe8zs83cGx3ECY0vy6nkAAAA=
X-Change-ID: 20261123-proart-thermal-policy-28556ce532f2
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Fr=C3=A9d=C3=A9ric_Aime?= <frederic.aime@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795471029; l=3936;
 i=frederic.aime@gmail.com; s=20261123; h=from:subject:message-id;
 bh=Wf3A0r7uX2ZUoDRLKINwzfnBD6nYGfliM3J1iNQZ+80=;
 b=je2sq2pyurw1z4J9SAwuhxejIsQmEHl9jcHi5ltd6GWMmYXi7s+v2fPBnsmB/20hDtkxB4jYT
 KhXsoEpQDGJCE1BDcBkGvkaQrWUBgHnOlGUKaXX/gQ3rvJk0Rprh9Go
X-Developer-Key: i=frederic.aime@gmail.com; a=ed25519;
 pk=xkFcmpr+qwkxDu8LFMuiki1YjzZT/JWGb/oXAMSMFOE=
X-Endpoint-Received: by B4 Relay for frederic.aime@gmail.com/20261123 with
 auth_id=1624
X-Original-From: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Aime?= <frederic.aime@gmail.com>
Reply-To: frederic.aime@gmail.com
Content-Transfer-Encoding: 8bit

From: Frédéric Aime <frederic.aime@gmail.com>

The ProArt Studiobook 16 (H7604JV, BIOS H7604JV.305) implements the
Vivobook-style thermal policy device 0x00110019: its WMNB DEVS handler
calls ATKD.FANL(), which switches the EC fan curve, updates the DPTF OEM
variable ODV0 (notifying IETM with 0x88) and selects the matching NVIDIA
power table. This is what MyASUS uses on Windows to switch between
Standard (0), Whisper (1), Performance (2) and Full Speed (3).

However, its DSTS reply for this device does not set
ASUS_WMI_DSTS_PRESENCE_BIT. It returns the current mode with the USER and
BIOS bits set instead, e.g. 0x02060002 in Performance mode. As
asus_wmi_dev_is_present() requires the presence bit, the device is never
detected and no platform_profile is registered. power-profiles-daemon
then falls back to its placeholder driver, the machine stays in
Standard mode, and Intel DPTF (thermald --adaptive) keeps applying the
Standard policy, which caps the CPU at PL1 30 W / PL2 55 W as soon as
one of the board sensors reaches 65 °C.

Device IDs this BIOS does not implement still fail with -ENODEV, so a
successful DSTS reply with both the USER and BIOS bits set reliably
indicates that the device exists. Accept that pattern for the Vivobook
thermal policy device in addition to the presence bit.

The existing Vivobook mapping matches this firmware: quiet -> 1
(Whisper), balanced -> 0 (Standard), performance -> 2 (Performance).
Tested on the H7604JV: power-profiles-daemon now uses the
platform_profile driver, each profile switches the firmware mode (DSTS
0x02060001 / 0x02060000 / 0x02060002) and ODV0 accordingly, and
thermald --adaptive applies the matching OEM policy (e.g. PL1 130 W /
PL2 157 W in performance instead of 30 W / 55 W).

Signed-off-by: Frédéric Aime <frederic.aime@gmail.com>
---
 drivers/platform/asus/asus-wmi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index b33ebdb21..66a68944d 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -660,6 +660,24 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
 	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/*
+ * Some BIOSes implement the Vivobook-style thermal policy device but leave
+ * ASUS_WMI_DSTS_PRESENCE_BIT clear in its DSTS reply. The ProArt Studiobook 16
+ * (H7604JV) for instance returns the current mode with the USER and BIOS bits
+ * set (e.g. 0x02060002), while unsupported device IDs still fail with -ENODEV.
+ * Accept that pattern as well so platform_profile works on these machines.
+ */
+static bool asus_wmi_throttle_thermal_policy_vivo_is_present(struct asus_wmi *asus)
+{
+	const u32 mask = ASUS_WMI_DSTS_USER_BIT | ASUS_WMI_DSTS_BIOS_BIT;
+	u32 retval;
+
+	if (asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO, &retval))
+		return false;
+
+	return (retval & ASUS_WMI_DSTS_PRESENCE_BIT) || (retval & mask) == mask;
+}
+
 /* Keystone *******************************************************************/
 
 static int keystone_check_present(struct asus_wmi *asus)
@@ -5222,7 +5240,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
-	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO))
+	else if (asus_wmi_throttle_thermal_policy_vivo_is_present(asus))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO;
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))

---
base-commit: 2268d837dea13a78639fa3dad60472bb67478709
change-id: 20261123-proart-thermal-policy-28556ce532f2

Best regards,
--  
Frédéric Aime <frederic.aime@gmail.com>


