Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202719CCEC
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Apr 2025 05:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743658417; cv=none; b=TobqMulmWO06klakZhnqQqnxs6FSvWnJbtbJwpAG3Wucd72eIQ3i4LdUgB2+WX1zBOvAhTryUeail5qHaldOagoNYB/ANf8tvVmZf7ENXWc6UoPFpJTzcZktNWIHRiNW0MRphXIcd2r2N5cB+YwEtkpDhI3Xn5cTWLQ0VFkjMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743658417; c=relaxed/simple;
	bh=64tpOsCSu851Tm3qmFwxaUEUBcvnVdEjZLiLFeuR8hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jr1oNCTT73P3SzDTkGzmaRnc5z068eH5cwtBe1vCahoFao5ZmUtrGsFd3gB0bdq7R4ruL8udcufxtyHIU6OHJjkVQ165TIo0itl4ZYcYyIHkzCxCVtqX2N8ew2Tv9gVjKOXynmv0TubEYIF+Agy2aiAYIi/bjrMhQPOWsL+Gc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODCEbPof; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODCEbPof"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736b98acaadso462683b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Apr 2025 22:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743658415; x=1744263215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWJv5oRfGpcdT3oNJyuapUxcfcU/e/rM/U1wGsQvEJo=;
        b=ODCEbPofih5vBe/l/q6zVV857Fb8TogRS9wZmreOaAPh0+HIDRWLHqJPnr9WdJfChf
         C9eQ/wrjJpeN46S+emk6wNzVk6kZ0DUYkqkgcnCuKWz49lbazUaN2aCEuUFWRO6D0vs4
         FjybNn46a+iyyXhiY60A/aVJ64LiKhBaVyGNFuuM4NLgqKMPaV6ivjgrqoDhraz6oKyV
         dVh97feTOZ9JAvoLv677jiepgJnDJT+w6PovRiyu44z4EaCagzolOrq89PEzmI/ai67x
         JDLd3+Ruht0DBcVr43IuWsZEAHEIGG5UANmPqcmqGp+/kOoBJtRtu8a4Wi2aMqEVMs4V
         VkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743658415; x=1744263215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWJv5oRfGpcdT3oNJyuapUxcfcU/e/rM/U1wGsQvEJo=;
        b=WJkc0BQWki35nqK/y38n4qpAp+YmJLfnYvN2jYeTAD95av7Tvfo2JJcLkYFk1MtUlM
         g2DGFDFJCsdVOH315NTcPvuNhxrVKL0cz4RsGIicmR4B/skjpHR8T65vp/gI6FTO+Fzb
         BXqD2Xla8dbc7VAAXOnaKDJu6MruWyEIZCtmYNLdEab3mNpknkw/Fiw4pZ6R5wMplvgS
         8KsmrIpFJEdkNMIGvZbrKuMjpq7OFX6k9V0E2nzucPRv4rajeRKUqK0PAsjwaI11EOhd
         YNcRwpuDieilv1TlDUiNbBx9NFa4fExaqmwf0m1BiK0G37xRVUvvWSsUXTFA58yOaeka
         8Qyg==
X-Gm-Message-State: AOJu0YxrzI5L0piVFUiT2GKraysNnMJ7dPw4zTvJh2+g212/j8IK5b1Y
	Q1QgR1Cq9pTjXSQXZdzpst/KvfUL511zeDUZREL0iSpNjGPk9hsD
X-Gm-Gg: ASbGncstanU6t2rNwGsahVh/7oalAlcCmrESQmMHBs9j6dVqU76XLxun0efc0nLAAJ/
	di12ggERE3giQ4GYlVOFxi+tTX28c3W8yRS9v62lJeY6oVMIivDAv5xwmGUGm1Km5wUy/zqpH5W
	Qwg0WYpm2EORoCRUc1i6ncxiDFV8O0ebPUwi8FgLkNX5Z8rATGO6VdF35IeIrz/K2/xyq3XU268
	6aQokZqWNgpqHS3r6S9Ej0TdnA6c/8kgemohVHme6uxuKnetg+omDDmrrHLNAbm0An9Rhvxqg+m
	K9XkMtIgpogrnQ5cvHJhP3GNyHfv0KGLbV3nqyc0ZbqDcRZdSw8zjmaes8+ZGDNQ37CJanmTvKe
	BKWYdTrhll9F9bPFYCHodnrArlVEkNW2hy4x+TbzYhMcZegc=
X-Google-Smtp-Source: AGHT+IH67+eaOowG/Ie5nUPnrEDoJYCtXe4BvXGrbNHAkWeP7NtJmiON1E0cpgdC+TDNHi/3NBcfjA==
X-Received: by 2002:a05:6a21:99a3:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-200e4c1d3a6mr8055558637.18.1743658415089;
        Wed, 02 Apr 2025 22:33:35 -0700 (PDT)
Received: from nitin-ThinkPad-X1-2-in-1-Gen-9.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7deasm551614b3a.170.2025.04.02.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:33:34 -0700 (PDT)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	njoshi1@lenovo.com,
	mpearson-lenovo@squebb.ca,
	Nitin Joshi <nitjoshi@gmail.com>
Subject: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey for camera shutter switch
Date: Thu,  3 Apr 2025 14:31:27 +0900
Message-ID: <20250403053127.4777-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
has new shortcut on F9 key i.e to switch camera shutter and it
send a new 0x131b hkey event when F9 key is pressed.

This commit adds support for new hkey 0x131b.
Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0384cf311878..80f77f9c7a58 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
 						   * directly in the sparse-keymap.
 						   */
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
+	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
@@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 * after switching to sparse keymap support. The mappings above use translated
 	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
 	 */
+	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
 	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
 	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
 	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
-- 
2.43.0

