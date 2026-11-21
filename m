Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252051;
	b=g9B1T+IjnWNSg7PTzkGGu7JdysWGrSOX2V3TqSRlewym421U8i2bRZROpJV+OIdfXrCv
	 1RNjrvjnxMQhFKSLD6Rrh21ItnB/po/N1HUmUMSUSkQxzJAW1otvUZINuJ6uLWrkj9A/S
	 iDvTXfPMU5FDD+fBSLCXkU1a68ZRWTEtAluiAzQYbvePX4/4Mx0Y7+/6hDCc/yTSPxmGg
	 y3dt/zTrb9qpgeaLTkhqL/Dbh2LhFZUVTZgKLQJwF1d3NIbH2gCd92yuatMKqkCydahzv
	 KwjHArQFXzuZqjt29kwDLUsX4Uvwvna1j2vyVz2/adndGk7Ys0DPYKWQ4/iYdGoT5UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252051;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:DKIM-Signature;
	bh=Bs2lGp5S4yn7qw40vJpLiofVxDZD6i0LF+haNWiqNho=;
	b=3ieHw5Q+w3sEIrVPWlAWsF+PrsA05kAL9pcrcrDb/xzfIPGITztgmYvKORfEzPs9Slpo
	 0OPBvAZclgL1Np//VNy+TsYB6TFN7bMCAXjqof701oqDZxIEetrOv22GheoxGJUip3TvF
	 adDWdLLsmlIKp2zF+ngBAv9vTdbJDcAg32X1j1OlaG48BnR6hClqWUBH5HY8VHa5toXiN
	 6Ye+JoeTENBaYxJminFuk8vzltW5LimSkc+yLFe18NfYjugMrcyG+rkvDfifCo1A8Q2t9
	 nzM+vIqiSvtUAMjRjaU+Cn5puq6ax0JM2KqhgdZa6J7imzII3X5W2DB0BEVzbY13cTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=kpmJSrq9;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB8C606A320;
	Sat, 21 Nov 2026 09:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB8C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=kpmJSrq9
Received: from abreu.speedport.ip (p57bd9562.dip0.t-ipconnect.de [87.189.149.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8126F4C2F3FFE7;
	Sat, 21 Nov 2026 10:06:23 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"David E. Box" <david.e.box@linux.intel.com>,
	Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86/intel/pmc: Fix Tiger Lake LTR ignore maximum to 22
Date: Sat, 21 Nov 2026 10:06:12 +0100
Message-ID: <20261121090614.677144-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
References: <20261121090614.677144-1-pmenzel@molgen.mpg.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795251984; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=Bs2lGp5S4yn7qw40vJpLiofVxDZD6i0LF+haNWiqNho=; 
	b=kpmJSrq9N/3mmyHgzG2pQAavDftO+2/GqKq8barGosh1Rt6xrSiPY+Vl5qzdk3hdcQuzn+5GYsXi
	Di0u3GpWZcPmRORVqYLpEYodybe/rw0XTQ83JjG861vB1c1Xwt3NaLCTvXamLGXPlTkbzw3wKUqd0S
	3HLNpFcz/x3R6oKew0CoFfXjiawocZpshS2KpQaxrKT6isa37ogqoVYBQlM6ciw+Jl7Y/NINbBJpUB
	L+qNpaNygcMve60I0FlBUIFiutU8iyEGPXGHS187+wClzJ3eNYo0soaUHyWueTaHrwnVmqU3McBwMX
	Mu7HKoY9TwNgTf/LjJO9fgfmoUE/iOTQ==

ltr_ignore_max is the highest index in ltr_show_sts that has a bit in the
LTR_IGNORE register: pmc_core_send_ltr_ignore() accepts indices up to and
including it, pmc_core_ltr_ignore_all() sets GENMASK(ltr_ignore_max, 0),
and pmc_core_ltr_show() reads the LTR_IGNORE column for those rows. Cannon
Lake (19, EMMC), Ice Lake (20, WIGIG), Alder Lake and Meteor Lake set it to
the index of their last IP.

Tiger Lake shares cnp_ltr_show_map[], where THC1 is at index 22 and
CURRENT_PLATFORM at index 23, but sets TGL_NUM_IP_IGN_ALLOWED to 23, the
number of IPs. So debugfs accepts index 23, which is CURRENT_PLATFORM, a
row that “cannot be used for LTR_IGNORE”, and the hardware drops the bit.
On a Dell XPS 13 9310:

    $ echo 23 | sudo tee /sys/kernel/debug/pmc_core/ltr_ignore
    23
    $ sudo grep CURRENT_PLATFORM /sys/kernel/debug/pmc_core/ltr_show
    23	PMC0:CURRENT_PLATFORM	LTR: RAW: 0x40201	[…]	LTR_IGNORE: 0

whereas index 22 (THC1) reads back LTR_IGNORE: 1.

Set TGL_NUM_IP_IGN_ALLOWED to 22. Now the write of 23 fails with -EINVAL,
like 24 before, and 22 still works.

Fixes: 43ef6c226a60 ("platform/x86: intel_pmc_core: Add LTR registers for Tiger Lake")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    Claude Code (claude-opus-5-5) helped find the off-by-one, write the
    patch, and test it on the Dell XPS 13 9310.

 drivers/platform/x86/intel/pmc/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index e55164e5807fd..3edad5a1f72cd 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -214,7 +214,7 @@ enum ppfear_regs {
 #define TGL_PMC_SLP_S0_RES_COUNTER_STEP		0x7A
 #define TGL_PMC_LTR_THC0			0x1C04
 #define TGL_PMC_LTR_THC1			0x1C08
-#define TGL_NUM_IP_IGN_ALLOWED			23
+#define TGL_NUM_IP_IGN_ALLOWED			22
 #define TGL_PMC_LPM_RES_COUNTER_STEP_X2		61	/* 30.5us * 2 */
 
 #define ADL_PMC_LTR_SPF				0x1C00
-- 
2.54.0

