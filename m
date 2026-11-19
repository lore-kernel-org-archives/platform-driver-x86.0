Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108241;
	b=ln/FSJouOk65aLcTFkd0TQFqYExrED7NBehzOcplIdEdnE7f/Qt09ZZMBS0utNe+TLdR
	 GjAAgyvOOexBQqhBHm0Z9UBIp/mE+mEjXUu+NQUSTpUAXvwuQje/ZloZrFhsktUscKiRn
	 NcNs0XurnWyGjDbsnJEcODtLnSod+FMMJ+MBBMjYmLBXOdkvt16ZNPhMiMUIryg5dsCum
	 grBH+rZXlynSCHJcfRRdJdSfDXqeF5M8TddxvS2Rui7/IVChIMHlgc2drqtXAIu/xDMdD
	 7ulu1Znd9WqYFLzGYHxLLzd67rSX9d2vWf9IFV+dDufO/Ku0TuZs1RTDCJbw+x5Q19w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
	b=hZdROCwB5m39bsMdJH0vO7rA+KmOskjmCJLgt9oFZDtmP3RKyNUovMPXOa1oleqPTzih
	 W2x5R9pfZZb8dDmnLhLua3CaTCTK2wD/UUZZSGnMeDFzswUMrImF0uvjtFpeB4EWtk9dF
	 55OIgQ+ckNCYo8r7LYjZxW8XCwCG1rzFXx0nIJk0Qi2TFhrhX+R49uTyJ/aiWxmW3Qah+
	 A81tXP7ALpUDQQo2pG9izKKAuAi5ZOsRjC8UsRHDqYUimWaUvkM5XIKotk2T7Rn5WwvK+
	 W8FDJ8ahaz0TJPahqLF5ujS63K1YU/MxAMsQR9TJXwbaWzJclCzuKWOumK+k6o+TCQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R8GFJzyB;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC4606A604
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 17:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FC4606A604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R8GFJzyB
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so51898b6e.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108239; x=1795713039; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
        b=R8GFJzyBafa8n9vJed6wgg6H5h7TaVP1UUEAohsETCkWNrDwQgr5f69LHtWGBz9H5T
         94d3Dkop8IE0AU1OHaULcUrIqgu69aXdql+81c9WqmVsKTJtQigXrVpHSL2UGGpiJtDh
         vTNY/3KGvIUAaIQyRJVzK4BXOQSWiIRwO/HsDMLXNuDLeKTLgmAQeBMtDvRNBaGYcgEr
         1aVoDE06yzGNOGj1aRDLNqbdKx1gG+yjgbhwzykVWk/qxXuLsSirsdIn/eRFH4RGAq1h
         YW3I0FN1CRmcI7L0FmEYA0vNwhXtZniF2Omd7P3DEIcgVHVJaq1HKWtxWg4kkln1ajc0
         ItKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108239; x=1795713039;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0YFHDsV85WusBxLlbw3gy7XlrMAOreRvj1T3GhoBqY=;
        b=wcCOY+Qr8cCrtJ3h7CU7B6mrfYIRHuAOqzlI7Z6GawS7EpU0eW1ViLG3LmGNOjxEXF
         fgDC8+r4kQh6a869SPSj3uO1omGMjleZVx9zSbEwgVyqzIpMRVmGJl9QxO3Srn80SEbt
         T0dHM8am7mDhPaL4F+ITrUGTXnHACHCd0sml41WC0yClc/M8GjM7Wd7T+1NdjiwqDCfW
         w+cZM/1mva4z0NEUFAyGHop3J3cRaIRGqO8X+zvIICuorXGBL+gYCryk0qyaGB74cajF
         a6CH5Knqw2SvljKEgCGnwT6JKOvpkOsAJU2bGvk+em2gBpvVar/Feg8Cn5KyzfEVgCVZ
         gKTg==
X-Gm-Message-State: APuU4Z+H5BTwrlq6KvrwdtmubbVkm6uA/aMYJCbISEVnpEFJ7vsmzdUL
	0QIY5p8DQXpWr53O7rMZeiA5eKPXksBGM0Cj5A+pv/evHNBnxD24+zK/mpuPrlkIgOBh9gEPeID
	oiWT7cAEdsg==
X-Received: from oiju13.prod.google.com ([2002:a05:6808:116d:b0:4f5:740:2bcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:e8c:b0:577:2255:61b5
 with SMTP id 5614622812f47-57a0b03bd9amr687021b6e.30.1795108238778; Thu, 19
 Nov 2026 09:10:38 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:33 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171033.1535923-1-irogers@google.com>
Subject: [PATCH] platform/x86/intel/pmc: Fix mode check in pmc_core_lpm_latch_mode_write()
From: Ian Rogers <irogers@google.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Xi Pardee <xi.pardee@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In pmc_core_lpm_latch_mode_write(), when pmc->num_lpm_modes is 0 (all
S0ix substates disabled), pmc_for_each_mode(m, pmc) terminates without
assigning m. The subsequent 'if (mode != m || mode < 0)' check then
reads uninitialized stack memory for m; under zero stack
initialization (m == 0), writing "S0i2.0" (mode == 0) evaluates
'0 != 0' as false and latches a disabled substate.

Track whether mode matched an enabled substate with an explicit
boolean instead of comparing against m after the loop.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/platform/x86/intel/pmc/core.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized, and with a
standalone C reproducer under ASan/UBSan; not runtime-tested on Intel
PMC hardware with disabled LPM substates.

Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
Fixes: e35ee8ee498d ("platform/x86: intel/pmc: Remove unused param idx from pmc_for_each_mode()")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/platform/x86/intel/pmc/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 47759b2a8012..7e12990d45a2 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1147,6 +1147,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	struct pmc_dev *pmcdev = s->private;
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	bool clear = false, c10 = false;
+	bool matched = false;
 	unsigned char buf[8];
 	int mode;
 	u32 reg;
@@ -1165,13 +1166,17 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	 *	'clear'
 	 */
 	mode = sysfs_match_string(pmc_lpm_modes, buf);
+	if (mode >= 0) {
+		/* Check string matches enabled mode */
+		pmc_for_each_mode(m, pmc) {
+			if (mode == m) {
+				matched = true;
+				break;
+			}
+		}
+	}
 
-	/* Check string matches enabled mode */
-	pmc_for_each_mode(m, pmc)
-		if (mode == m)
-			break;
-
-	if (mode != m || mode < 0) {
+	if (!matched) {
 		if (sysfs_streq(buf, "clear"))
 			clear = true;
 		else if (sysfs_streq(buf, "c10"))
-- 
2.56.1.708.g77570a6a1d-goog

