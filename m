Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE034D4E2
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121372; cv=none; b=iMHDfAdj2KhYq7N21ffDgAfguKwUtGExQHGUJ3abQyS4ZuMzxYQXZIkqCeibTrbw4AbL37uqN4Enfig01G60wsRY26uUWikDn0kMo47Hv67LHlkXAxPRDAqFXnG326ZxHXqlGfkiZFGkE2eaMbstgNO6PZZPzeMXBP5O2ASpkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121372; c=relaxed/simple;
	bh=1au+PdNHYx25DYHCEbAV2a8FoI4WXcSqi2dWB0j8eGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Px+CS+Xm+ynk7obgk3b/wDpKuOqFg7eWJ6IKXKUKHcx/Y4J3XzEclBd6g2cCT8iJVSdbsm9E75AeLqxe22yoU4nKlcYK87JmfRlg5i/EvGejWyCV1Bkl5jVkGLjTWG5o1c3zY38Eh6kk7ceI6KSX/Yqyk6rUy1jENGYMcq4eZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpMLeGl0; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpMLeGl0"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-307263ad0cbso10083557eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781121370; x=1781726170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMcWL0ItIgX4G9BHkA/Y2GiLUmww7fYrknbOdL7NWMM=;
        b=PpMLeGl0dmRO9bd8mZNzNVvhYc/GJR67p/oTZV9PQhHmyfNM2LdVyCChMoHZFFwayi
         BwR5bcsYg1E0PqnWj+OyOWp1zTY1Ww18CP/3FcCN4Tx+hhsrPEGKiMxpgsJ5ptQsmJiF
         1tx8LNlPSTShvX6pskPcE8y3wxNO1+wmzPIXgSS9eEvdJzXpZK63o2dfJY/n1B01zeoH
         ej6LCRvtpKPQI1Jh04uS9Kr0vJSc+48I4oY2CpxIXSn4fLc6Gw6i4a+RmEvmEq0vHZQx
         DHwl+tEzN6A35X0vBS0Yv5xtzhG34Nt+oF18AJ4ubr3MV8ZojoosuRPJX9ZXo6HBmGqL
         U96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121370; x=1781726170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMcWL0ItIgX4G9BHkA/Y2GiLUmww7fYrknbOdL7NWMM=;
        b=dIsarL17F8Fcf0VKU4IDIHBWYNe5SAKPwIpLytsg+iShmCDmc2eG16AanFbDl7Aqkb
         ZYVdx/981MycQ1txD6VhbvP8gUDenm+58pzjiGkM7Zyb3P2jI1z3s6YlXHz8TDJwTGlZ
         VGiRcfGKEX8gxOPdmAn/r4Mwjo9UWwREFiieJ8ysuV9dJHzfoNzBIUSkqApDU7GRjcTj
         uuWspKi3S5DX1Kn73xGKPln2SAyCfoEWg4j0v0z4Pl7A9dncYVW+9hbziFvlsL2ChnQJ
         lFLtERqgv4URvICQgIfXZVLSmoDCDr6MzNpEyO+ySr0n7qTlHohiu1AGbs1Kg96jRwfx
         UsAg==
X-Gm-Message-State: AOJu0YxLqfV1CyasHT5c7ZyyNGeCn4ADeJer7ggC31VfwkmEz1a+Dsrq
	ZONsZwnU5b7V5Gl1Eruix7waZgecimnX4PQeU/+XSNkpwIlwjHxEU+2E8/RUxOty
X-Gm-Gg: Acq92OF2qpp52L7O8JJtn/PsQs3i36Rsq5v0bcNLdWxjcrfz9VsrpOUb6Y59DZNrBnZ
	VXUGyT4002xPzvFSOEZPcP6ISqic4b1bPz7fV/A0OKhl8tq5UzIGdMBO/EDdnUbrkjxf6UAqvhC
	x+Sg+MPTR/iSrP//Hbal8xyRLb7pEia5bsAKtZ9NETik+bRfXU0PGYKc+E0kjFoIf1WJyduYg9L
	gGF8r/r/SHjUOTuDDV7C0FW4HbFj2KiQ+Z6u+4dTgNt+kpksW0RbXwoy5NNGTD9jFO4IjQn4y5H
	czLk+GMW0Am0jIof+6wQjG0kN0OisIPBQvH/5nZrDrS7eK6aVP2kMIBC6lamGLLhOnkHF/8j57U
	ffnqnnaIf4NlU39aPquWFYTaVSbs4S/LsfVXzR4EezBj+69RdN7/Et2TrrKUX2wy0w10LHKhQpr
	6syneF/ygGYu9uF8OIJZMGxCQDVc5VgRxPVaFadgjkX6KeEq11loZIrhXZtyHeRxepAd8W7SzI2
	f2MzSAqOE8e6lDdBkcW2htN5x7hunrwgntntJ88SmBNUBXW+EyH1C4JS8YfmqagvRJUWYpWWFAg
	vvCpgp47uW4xLMqvGUAOL4ggIqh3
X-Received: by 2002:a05:7301:e2c:b0:304:d92a:e60a with SMTP id 5a478bee46e88-3077b2d789amr14755255eec.31.1781121369448;
        Wed, 10 Jun 2026 12:56:09 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm26362333eec.12.2026.06.10.12.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:56:09 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: correct macro name in debug output
Date: Wed, 10 Jun 2026 12:56:03 -0700
Message-ID: <20260610195603.20574-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A call to debug_printf() in isst-core-mbox.c incorrectly refers to
CONFIG_TDP_GET_TURBO_LIMIT instead of
CONFIG_TDP_GET_TURBO_LIMIT_RATIOS. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 tools/power/x86/intel-speed-select/isst-core-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-core-mbox.c b/tools/power/x86/intel-speed-select/isst-core-mbox.c
index c81ecd602bcf..baadeb75376c 100644
--- a/tools/power/x86/intel-speed-select/isst-core-mbox.c
+++ b/tools/power/x86/intel-speed-select/isst-core-mbox.c
@@ -561,7 +561,7 @@ static int mbox_get_get_trl(struct isst_id *id, int level, int avx_level, int *t
 	if (ret)
 		return ret;
 
-	debug_printf("cpu:%d CONFIG_TDP_GET_TURBO_LIMIT req:%x resp:%x\n", id->cpu,
+	debug_printf("cpu:%d CONFIG_TDP_GET_TURBO_LIMIT_RATIOS req:%x resp:%x\n", id->cpu,
 		     req, resp);
 
 	trl[4] = resp & GENMASK(7, 0);
-- 
2.43.0

