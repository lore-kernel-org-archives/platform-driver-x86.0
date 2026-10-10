Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAEE353A72
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627408; cv=none; b=FdD8J2Dr/qVvWRMpdn3aT4U4KVmRCZdawVLRW0prMxPJMWuDi4Bi12B4AJwVGnaamiXpT0reLuiny2n6Gx5dDwOuFVu97+MfRV/wQzeW3ZqYnzRZDFUaZbE211qIJYcPxxixlKPUsLig7LH4Hjca5M0ULq27IgxLsnASQOuEJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627408; c=relaxed/simple;
	bh=sCljAVWLjKOLm7IfEi0mbyqGtrODlKofnZw7AfHjiIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7dQTvKf98sDRjQiIh/UWy9N79N1B4bV8vkexI/SfkOb1/IG81JL5oOizVi1vBV0Hy/7GPCXSJOTcv859rLTwePMvMRckcGzPN3tIr88Qg3bHVAaDqTMgWlhMH8fE3HHDZ0sagULMCiMrgK5BNVbqC7Zz841PGR7E8I/qdf1pQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt8UK+xY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt8UK+xY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14434545e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627405; x=1792232205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=360Ah81wzUt84jPWuHxVGQCsAvtIkeDp95VvPwcByPc=;
        b=dt8UK+xYV3af/mOP+RBdZXW+r5mO30lcCsoTNkl/rBAX+AvUjRQXK3je8El8+ZI6cS
         xyAcGc5KU0Uelos8Y0PXkgL7jkdDR48Ef4VrFW4YChSP2Xs1J4W1bTZYNow1e8lb8kfH
         xfmCpKIDiax9s54hmo3REjRg7R+n1Mqms75bTZ3LDlhFOdzxEdqKC+34ivCy54eYewp4
         P6k9slgLrm5KxYwtyWlxYh/NWGXuz2Ur9E9dvws8GrDZQcm3I8o+hzoasfN/Z84vUDF/
         P2NVlR1xieDOtwCP5oV7zkSIaAng6+34LHBHB/JKFFXjBH71SoHoGd2PP3Vy2Rn1WtLp
         0//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627405; x=1792232205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=360Ah81wzUt84jPWuHxVGQCsAvtIkeDp95VvPwcByPc=;
        b=fmK/CW630TAhnIkMRUUA4Dtt2ylPdAGTzjQCDcGU7GDbL4cR+ZS4ZEU1REc/7oCEod
         +IgcTschbmm0gxEHmj+Qy2aUpgricgZc1W9Mcg5AFz7PWmANeenaA1DtzEulSkDZkHlo
         UtB9XX9XNtqfhrCxDlQy2Rmk5zjjSZNgp39mYmyOm7gxWliSmuBFjxvda1cN33sFib5/
         YOwpAyQSPx/dvVK5pKfSjdS1eekukSKV0Wje/E+MxMAiRAZELayo2maJUX/5rw7LEPnN
         TlYQt9/o4T0a3wq0F3phSmBmB9CUjsbw7+EjWo16xx2ANV8zaElnK8XMb78FhnRqEGnj
         Pubw==
X-Gm-Message-State: AFq9FYILKeacgRpOiYGxnQp+PpdjWafH/NZSjxFGHGzNxudXD0Y6iuSj
	PEE6lr8y99eV8/bVAUrLPtnUJi4VCndqixEiWHUZD8pqvRwrMXLZBWXCv4gI94UwZXTYTDG/
X-Gm-Gg: AYBFou1u89ZGBqgGhQzcOo8gYBRRwJp3Yq4966yR2RpzVViMzeOxciUFc+Bpj6NKqHm
	X45aTO8cM2Y6lV/fFsweNuxXXEOIs/kbI2h4jGQErw1e5gKcl7hq+WJvbVXJ5dYEGSCxa/Y3QUJ
	iu2FJ1+gaZcAV93WrXTNszGO5JJvReE/4Pn2SagJPxlylpjcrnvBSPpXR1shnJUCRG/yCR6us1X
	dWcFwT9Zi0+5RMEGaOskrtZAFV+mG30atMnCvP9n8Mvlu4A38Y1o/xQSx8ktxjBiXzBKWXyuE9G
	LOLyN1tk7i5Bs+vLcp5CPmERPOybg0zm/8VRYpbHGaKRfjvLC3quFD8pn4dhJkZeXc4/LERuT0s
	ifY6Qm8VGt+yr9ROTT5Ua0S+tkSnsgJDs8e5em6M5BA+rFwKxdOaPKVTVRQi7VwtKvFAtuW9zB9
	+hEEqO+71fQ8B/t24xYZKzgz4xoZe0/V46ClWq2gMfRBM4EuMbSBfC33ZM7uU=
X-Received: by 2002:a05:6000:dc2:b0:48d:659d:f8a3 with SMTP id ffacd0b85a97d-48db949033dmr6700203f8f.23.1791627405144;
        Sat, 10 Oct 2026 03:16:45 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c38f4sm9417856f8f.27.2026.10.10.03.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:16:43 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	luke@ljones.dev,
	denis.benato@linux.dev,
	benato.denis96@gmail.com,
	corentin.chary@gmail.com,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v3 1/5] platform/x86: asus-wmi: rename TUF RGB state DEVID to _CMD
Date: Sat, 10 Oct 2026 13:15:57 +0300
Message-ID: <20261010101601.888709-2-bartualev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010101601.888709-1-bartualev@gmail.com>
References: <20261010101601.888709-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pre-existing TUF RGB state DEVID (0x00100057) is a write-only
command used with the DEVS method. Rename it to make clear it is a
command rather than a readable state, avoiding confusion with the
upcoming readback support.

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 4 ++--
 include/linux/platform_data/x86/asus-wmi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429ca7..5adf7a289f82 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1140,7 +1140,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 
 	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
-			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
+			ASUS_WMI_DEVID_TUF_RGB_CMD, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
 	if (err)
 		return err;
 
@@ -5153,7 +5153,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
-	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
+	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_CMD);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c83ace1..ecf8b5e6cbae 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -159,7 +159,7 @@
 #define ASUS_WMI_DEVID_TUF_RGB_MODE2	0x0010005A
 
 /* TUF laptop RGB power/state */
-#define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
+#define ASUS_WMI_DEVID_TUF_RGB_CMD	0x00100057
 
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
-- 
2.56.0

