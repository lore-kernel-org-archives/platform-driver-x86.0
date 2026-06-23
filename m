Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6431A7E2;
	Tue, 23 Jun 2026 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233184; cv=none; b=d6VqOb8P8GdaWAO9HZ8KLXUapPcmwyq425gsPqtxviL872sbGyglU3vP05ynQs6iO1VmMN0p3CjhCxlmoaCODx1vf9RAxJKNO2TuTC+dDdf1S+b6/CudUmUf500gic7gGCfBj84eVpMD4FqomziKXmQKewTxWyVvNRrGVUudiD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233184; c=relaxed/simple;
	bh=yUdHl/JboTR6ZbJhbGoIId6ab8bZsG5CV3qxBDCuW3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABUG2t/azBSK2O2bqfeRFm+Ka9ZYOKIajO25SdSQsWja8dICqc9xFnNduuc8yZQMPnjNTw3ZW9ArrivrkufrECeIxnl3tOJ5T8cnbI44/rviCMB52BvU7qGemMviki8bEin7J6qeXIpcbPFpbumLUETBSF8puwlrGGVBP2Bn1XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SheQLij0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="SheQLij0"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9DB3026ED3;
	Tue, 23 Jun 2026 18:46:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUybOFi2rWns; Tue, 23 Jun 2026 18:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782233178; bh=yUdHl/JboTR6ZbJhbGoIId6ab8bZsG5CV3qxBDCuW3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SheQLij0Wg8So3ht7Rz5Tztxbkz++8abCwMt51E7GjdsIx3ovO47fgnd7ULfRjDDc
	 6ltIpvuB+CS8KFiw2O5rdhQF+KX+Z9vuUunowC50O37fd53ght/q4bw4pAaWwW3UCN
	 2TQYiBWeREMbnLCXYHqjpYEHWpc/8MFsFolSTHtX8wSQ9GCQvdUhD9dGHxxtkrco23
	 86ZVntrO27xMwDoA7MUJ4FRSDGNo7HqHR4O3/C0cHGg9t7AYVm6T+MGUoQ9BSyiZaG
	 oUJfkEAU5ATaoS0nmTKDFGo3DAHk8Vy6f1juuqGlxwmTI7Neuj1wTEwvU4focHtOq0
	 iqNEK3MdwGElg==
From: Marco Scardovi <scardracs@disroot.org>
To: krishna.chomal108@gmail.com
Cc: eliadevito@gmail.com,
	emreleno@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	moravec@ukf.sk,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	regressions@leemhuis.info,
	regressions@lists.linux,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 1/1] platform/x86: hp-wmi: fix platform profile issues on generic HP laptops
Date: Tue, 23 Jun 2026 18:45:18 +0200
Message-ID: <20260623164603.10322-2-scardracs@disroot.org>
In-Reply-To: <20260623164603.10322-1-scardracs@disroot.org>
References: <ajqgkq_elUlMC0Ep@archlinux>
 <20260623164603.10322-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On generic (non-Omen/non-Victus) HP laptops supported by the
hp-wmi driver, the platform_profile sysfs operations could fail,
leading to 'platform_profile: Failed to get profile for handler hp-wmi'
errors and preventing userspace power profile management from working
correctly.

The driver was blindly registering all 4 profiles (quiet, cool,
balanced, performance) without checking which ones were actually
supported by the BIOS. Furthermore, when userspace switched profiles,
hp_wmi_platform_profile_get() was called, which queried the BIOS
using thermal_profile_get(). If the BIOS query returned an error or
returned a value not in the recognized cases, the get call failed,
throwing an error.

Fix this by dynamically probing which thermal profiles are supported
by the BIOS during driver registration. This is done by temporarily
setting each profile and checking the return code, then restoring the
original profile. Restructure the probe function to explicitly populate
choices for each laptop type, avoiding confusing fall-through behavior.

There are no expected negative side effects, as the active profile is
restored to its original state during probe time, and only validated
profiles are exposed.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220008
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221569
Closes: https://lore.kernel.org/platform-driver-x86/a3b137df-1b21-4460-b003-58c5ca2d59d4@ukf.sk/
Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/hp/hp-wmi.c | 37 ++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..82fdfaa169ec 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2011,19 +2011,42 @@ static int hp_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
 	if (is_omen_thermal_profile()) {
 		set_bit(PLATFORM_PROFILE_COOL, choices);
-	} else if (is_victus_thermal_profile()) {
+		set_bit(PLATFORM_PROFILE_BALANCED, choices);
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+		return 0;
+	}
+
+	if (is_victus_thermal_profile()) {
 		set_bit(PLATFORM_PROFILE_QUIET, choices);
-	} else if (is_victus_s_thermal_profile()) {
+		set_bit(PLATFORM_PROFILE_BALANCED, choices);
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+		return 0;
+	}
+
+	if (is_victus_s_thermal_profile()) {
 		/* Adding an equivalent to HP Omen software ECO mode: */
 		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
-	} else {
-		set_bit(PLATFORM_PROFILE_QUIET, choices);
-		set_bit(PLATFORM_PROFILE_COOL, choices);
+		set_bit(PLATFORM_PROFILE_BALANCED, choices);
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+		return 0;
 	}
 
-	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	/* Generic HP laptops supported by hp-wmi: probe dynamically */
+	int current_tp = thermal_profile_get();
+	if (current_tp < 0)
+		return current_tp;
+
+	if (thermal_profile_set(HP_THERMAL_PROFILE_QUIET) == 0)
+		set_bit(PLATFORM_PROFILE_QUIET, choices);
+	if (thermal_profile_set(HP_THERMAL_PROFILE_COOL) == 0)
+		set_bit(PLATFORM_PROFILE_COOL, choices);
+	if (thermal_profile_set(HP_THERMAL_PROFILE_DEFAULT) == 0)
+		set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	if (thermal_profile_set(HP_THERMAL_PROFILE_PERFORMANCE) == 0)
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
+	/* Restore original thermal profile */
+	thermal_profile_set(current_tp);
 	return 0;
 }
 
-- 
2.54.0

