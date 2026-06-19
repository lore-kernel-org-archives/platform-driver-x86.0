Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62533689D;
	Fri, 19 Jun 2026 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781906979; cv=none; b=CHWOHdRl1Hp6f7KLmcUarwb2IZD7mJ3QODM8++wfOauTMx2RVl+uKzMAtpGd1ZDaL62VNTkPkEeixjb1N32nAgyD1MDOmIWa6KUGRixq2vwHEBwElo9jf6GbGhHn0v44JZdAj1D99R7GP0pZx+ZcB2z6Do+YziW1k+CXMRXZYmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781906979; c=relaxed/simple;
	bh=ZFm216XHuqLjbWkXVAMK2+4hGVIoUrMThKSxgFuFIfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0rVIykn+AhgSvE8O6V2J4QyhoHYdD/IdkjuxohwpueDxIRce0chCJwLLauWc9ppJCrWW64SFNGhj8I6V/0RfY+La1xm8IrwfACmAcBnPIe77iptqr/e19Ryy4A1c76kBrbE928DrIm2Tq4Lx4hF1tMy7Rx+tfE4Eyjon9FtCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=h+Q7m0/T; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="h+Q7m0/T"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E7EE0269E5;
	Sat, 20 Jun 2026 00:09:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sMMkZkMGmvQ; Sat, 20 Jun 2026 00:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781906968; bh=ZFm216XHuqLjbWkXVAMK2+4hGVIoUrMThKSxgFuFIfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h+Q7m0/TCuT0kLRmi1ZJDEcyJQc4zFGk0CHCDNIS86oYgb+naDSZD/n6BM6hlqw3o
	 Ncg3s65gSO4T7gvzlXBuSiiZ1Bo0UxJvezSp6YCwIQRkhFoCBFi00kuUCosU95ZF1w
	 k7jj5e9X94T2Yq4eg1DqO9WZDhPXIteDQz9zWGcCv2KfiyAwOpsngJDfadvwH1zjS1
	 hElkPS85qkL4Laa4evhrsYoDajpGa7Df+bzWahgEmHzjwR1KNb7igLRTgYZyoHP2vW
	 51ubizjNJwhCMSlb2lcQ2yqM0DNFrH01V0KQGlgWWZIdW0Plzp91/eXLuXJEpw5XxF
	 ZfeohieH1//lA==
From: Marco Scardovi <scardracs@disroot.org>
To: moravec@ukf.sk
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	eliadevito@gmail.com,
	emreleno@gmail.com,
	rafael@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 1/1] platform/x86: hp-wmi: fix platform profile issues on generic HP laptops
Date: Sat, 20 Jun 2026 00:09:11 +0200
Message-ID: <20260619220911.7542-2-scardracs@disroot.org>
In-Reply-To: <20260619220911.7542-1-scardracs@disroot.org>
References: <20260619220911.7542-1-scardracs@disroot.org>
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

Fix this by:
1. Dynamically probing which thermal profiles are supported by the BIOS
   during driver registration by temporarily setting each profile and
   checking the return code, then restoring the original profile.
2. Initializing and updating active_platform_profile to cache the
   last set/boot profile.
3. Falling back to the cached active_platform_profile in
   hp_wmi_platform_profile_get() if the BIOS query fails or returns
   an invalid/unmapped value, rather than returning an error.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220008
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221569
Closes: https://lore.kernel.org/platform-driver-x86/a3b137df-1b21-4460-b003-58c5ca2d59d4@ukf.sk/
Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/hp/hp-wmi.c | 53 +++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..93df269445eb 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1662,8 +1662,11 @@ static int hp_wmi_platform_profile_get(struct device *dev,
 	int tp;
 
 	tp = thermal_profile_get();
-	if (tp < 0)
-		return tp;
+	if (tp < 0) {
+		guard(mutex)(&active_platform_profile_lock);
+		*profile = active_platform_profile;
+		return 0;
+	}
 
 	switch (tp) {
 	case HP_THERMAL_PROFILE_PERFORMANCE:
@@ -1679,7 +1682,9 @@ static int hp_wmi_platform_profile_get(struct device *dev,
 		*profile = PLATFORM_PROFILE_QUIET;
 		break;
 	default:
-		return -EINVAL;
+		guard(mutex)(&active_platform_profile_lock);
+		*profile = active_platform_profile;
+		break;
 	}
 
 	return 0;
@@ -1707,10 +1712,14 @@ static int hp_wmi_platform_profile_set(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
+	guard(mutex)(&active_platform_profile_lock);
+
 	err = thermal_profile_set(tp);
 	if (err)
 		return err;
 
+	active_platform_profile = profile;
+
 	return 0;
 }
 
@@ -2017,8 +2026,23 @@ static int hp_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
 		/* Adding an equivalent to HP Omen software ECO mode: */
 		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	} else {
-		set_bit(PLATFORM_PROFILE_QUIET, choices);
-		set_bit(PLATFORM_PROFILE_COOL, choices);
+		int current_tp = thermal_profile_get();
+
+		if (current_tp < 0)
+			return current_tp;
+
+		if (thermal_profile_set(HP_THERMAL_PROFILE_QUIET) == 0)
+			set_bit(PLATFORM_PROFILE_QUIET, choices);
+		if (thermal_profile_set(HP_THERMAL_PROFILE_COOL) == 0)
+			set_bit(PLATFORM_PROFILE_COOL, choices);
+		if (thermal_profile_set(HP_THERMAL_PROFILE_DEFAULT) == 0)
+			set_bit(PLATFORM_PROFILE_BALANCED, choices);
+		if (thermal_profile_set(HP_THERMAL_PROFILE_PERFORMANCE) == 0)
+			set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+
+		/* Restore the original thermal profile */
+		thermal_profile_set(current_tp);
+		return 0;
 	}
 
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
@@ -2263,6 +2287,25 @@ static int thermal_profile_setup(struct platform_device *device)
 		if (err)
 			return err;
 
+		/* Initialize active_platform_profile */
+		switch (tp) {
+		case HP_THERMAL_PROFILE_PERFORMANCE:
+			active_platform_profile = PLATFORM_PROFILE_PERFORMANCE;
+			break;
+		case HP_THERMAL_PROFILE_DEFAULT:
+			active_platform_profile = PLATFORM_PROFILE_BALANCED;
+			break;
+		case HP_THERMAL_PROFILE_COOL:
+			active_platform_profile = PLATFORM_PROFILE_COOL;
+			break;
+		case HP_THERMAL_PROFILE_QUIET:
+			active_platform_profile = PLATFORM_PROFILE_QUIET;
+			break;
+		default:
+			active_platform_profile = PLATFORM_PROFILE_BALANCED;
+			break;
+		}
+
 		ops = &hp_wmi_platform_profile_ops;
 	}
 
-- 
2.54.0

