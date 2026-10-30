Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321923;
	b=pqsWXfj32P/Nmsi9YwJW4/DIaOOzzXlibrLjOtxMVJi6khwXEHMm7t52ivqBT99vku1g
	 2OnisN9UT0F4+AOWvv7cyCvpO8kwfSdx7HsfDks14i2T52qIViS/l7UjHlifGIzNNBTW2
	 4aHyUi2ymbX+yVTSZVhP+HXvCVv6EWLEhQLzgbEVpVFPpOW5zbTllvdTejchiUFcYI1lM
	 S/YVuisFJBhU6eNbZww5HaEzZLV9sLMm3Xsn4Za7Fs6MP++iMITFQ07juivMFUv09umUs
	 2smvp31pP1RLNHhqozgjPLDIum5uTY0Fc+M+4jir964M2mSrp7L77sdC55Y59iS1arg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321923;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DEFn2XHjOLlJM5OoS27zxetNuXFbNoAKNCQVpNeJL1k=;
	b=S9bhpkO8NIN6YIEShlmN+4dWidH2qTdIrQASP3GG4+K/JbORs0rAUWMvkID5xypRuitJ
	 M/5slQUcuchMvJOWbslo5ZV7Ja6ptBS09BNCdMqtfA8GpzjXsWsllecl2rXZapvh7eeaR
	 SUFr6oHn+tiXxVnoonIkDBn+TFYOX//T9nKgPuITCOoChnILoMo+dl6xrZh1RbTEI7OSR
	 RB/+fuUh899u/mL1HdMzfHkAjl+2Hz/YerbdzPB2VPmaRuGnPQR+UJGPJF+ogkanT8fym
	 ZQ/MDtoTZ+BCrhYjcNyX1mLs+8H+Ithv4ZOywZ7TYroA18kL/bjB9yrCdICnsMt5QLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=exultantmonkey.co.uk;
	spf=pass smtp.mailfrom=exultantmonkey.co.uk;
	dkim=pass header.d=exultantmonkey.co.uk header.i=@exultantmonkey.co.uk header.a=rsa-sha256 header.s=fm1 header.b=S6e35Ojw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wcRvKNDt;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1781606A31D
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 00:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1781606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exultantmonkey.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exultantmonkey.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=exultantmonkey.co.uk header.i=@exultantmonkey.co.uk header.a=rsa-sha256 header.s=fm1 header.b=S6e35Ojw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wcRvKNDt
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D3F2A14000EB
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 20:58:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 29 Oct 2026 20:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	exultantmonkey.co.uk; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1793321920; x=1793408320; bh=DEFn2XHjOLlJM5OoS27zxetNuXFbNoAKNCQ
	VpNeJL1k=; b=S6e35OjwSP1IiFlVkJNaVVwhl/1xWPOVw3iurCKXkCsIXw6OrxA
	uJvm878c6HIWXOFWtJjC2AJF5Qp7M4MPMl2z6nteBxEjhDDR2bIdeeugivB8FCEN
	iQfU2BchMzUDkkFoForRaPX7hBNJGPD8BGRTd2fwNierYHp4WT64upajVg78144E
	z+Hc6KBW3iKs4Rgu40IGGpO3GzENJfu24IjJu0X77oQ7F0w2ccnyP9KXmAmlddtQ
	xKUapVUgywbvhKvwSawtzuoGiDGR33pUpUQqnwpqbMDRErsWRY70CQQsEEntBBGl
	9yFC5tQTGah5orNwaTBFj+hZxupkVxf/6SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793321920; x=1793408320; bh=DEFn2XHjOLlJM5OoS27zxetNuXFbNoAKNCQ
	VpNeJL1k=; b=wcRvKNDtbRB8KgMxWOAnDcLTu+qjQ0nykABt+qUekz4kvS6Lm9a
	ZM6k8Cu2CsJ1BBHVLO9RHktXBdhrmeZOIviuDdn8tS186LjDykL5Sn2Bw91615D8
	9ADl/0NpFCR2/g3ChVIiNlbIGZdAFR+cXR0A9bwOPrpz5ry9BtayZ8cmd1faoI0K
	8n+/Ynn4neRja8I/aQwv+f34Qs2l4bbY0Y2WRwhFy214c+cM8D+Duqs6Dzc28r8L
	RzXEEA39Z1F+i+loeyS2OEItg20zu3cbaaKjMqdBxZx+3Ke4rr5U55mmVmjUNWSQ
	sh9DMGfC1hF/Az+cDSNDMOh8EAvX8Q/5v9w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=exultantmonkey.co.uk a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793321920; d=exultantmonkey.co.uk;
	mf=PGRhdmlkQGV4dWx0YW50bW9ua2V5LmNvLnVrPg==;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:VkDFY2LieZ0Z/UJ3BnVcAw9bpAoupt3AnrVIS9Arzflt68B
	LseVzUO45Je9xcDV2WtMX/VVoZCfZb1bFosE426UBZlpzlTKdkZTNUkDDK4v+OdQ
	nxHimDcAUAbLmWsLRGI+Z+4sveB70t34of3oqua9x7eZY/cYIssi/gkJu/fwBybf
	k3Y5KtCeMVTeIY/Uli5PthpLOIwVbeT05ZtdtUsVhwhnRP1XuFrPPEj5HEfHQ5e6
	Y8UKCO9ftLbSuRMHKAvNaS0gqp2dyH6HlKgux5vNVcns4Kizdr1mf+z+cTm7LsjJ
	KvHeVvFunXc1qMEZOO7bCH1vJVEosZrVIlaCG4w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:lG5dIxXvAoTaAxrV4F/bLJKy9M6bwtYUDIOIr4ZJYEk=:LUxHGxcxVAdimMLBgUrrKkv9xtsmDEDmHT5VHMx7i8I=;
X-ME-Sender: <xms:wOvjajO4_1aBKWvKPDdKbwh7FFXi1zdYb-KYBvMLGLkC4oKhzGR3ww>
    <xme:wOvjan9dTEhJnfoUSXSLWB6vHxjx1NPDFFETiZqCfvJ_iu4dl95qdXY_pUJ7LtNig
    s3WZIAmzuga6GLvF8KC75MyZqEjSrEPqE-7YEHrrH6MIh4oqgTX-aYOHg>
X-ME-Received: <xmr:wOvjao531t_rWtM6okrAuutGwC-OogKNicOmFMjKsdmBZ6dgXq7JMurg6AoDM_Vbq09itC4>
X-ME-Proxy-Cause: dmFkZTFrExGWSUNaf0sWNZj86zZAAbAdxjqIyM4qts/6KLSgrk2qMd2x0qF9bmUPVHy25S
    P0UvOaN/qlWt0Hes7xh8PwwUqKyYrVFvLzknayokZYx9B4V/RMHwNlm2amxrYoteZHr8d/
    /+NOaK1J/yq2a8YW23UKVhmlHn6ZRJN0XhrTME7qgs2Z2lACdo74Cb/bQCUuuxQM61JYjL
    DPquJzTuGYAMMTi4wjgqh6eOgZcRicKgvjQnmnaLAlp0vY5BaX+hg+GnVe7cxgrt4pjc/w
    Tpo9rYHJBj3F7hh4o0aZn7tDxjExF/cfHXUdfbI/ZnOldaMlGSddEFPkkuWsp5MwXwy9ne
    AzUzy5XClCveYkj0i6/nidUeo/u2mMC9Arl9f0R3J0IlfFVcYZ/6R81mnmKPWe+6H+A01u
    0d8WySRNA3G1W6Z8gDELeGSpGXXqLXbtOjF+TMVnm38euyIRsWgb01p+8qkJU4FJ4aQ2lh
    TUwM8upQUbC3mi45LEWQCJkNVFEFK/rvGJw5MyfY3teThQ5l/R8wuQFeWcSsrkQXoUbfgD
    CaXggBteu9DbVkaZyRuGbM7stNEgFxq0y8xwOlEaRALd68HAWyuR66r3i44KW6HO9zzJr2
    zRyVwJn4D5J8F1CxNf48Jegjhnmv6fm6DeX6/AQyc7IwF1f37X+XCgRnpMQQ
X-ME-Proxy: <xmx:wOvjal55WjlCZuJqO5zGvSSV6k2CTOvRfW1FhfJTvamVVS0Z41446g>
    <xmx:wOvjappx-52fF0T9c1QUtYgGnMtuQl8jCRM9qyhN6F4Q4YP0yb2Zug>
    <xmx:wOvjauOay6STYXtzJ3foMtC-FLj1yR7lw5NmWcydnwolR3_IDK48gg>
    <xmx:wOvjap25OkIeowWYEerAWNeCeVjA0k59YUg3lErP51y5w88hWrcECQ>
    <xmx:wOvjahUpb8uAX0mnWBvU7kRHW9CFxzVNuhFjoBauUdxckwgcPc8ec74T>
Feedback-ID: i8d5147ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 20:58:39 -0400 (EDT)
From: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
To: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	linux-kernel@vger.kernel.org,
	David William Richmond Davies-Jones <david@exultantmonkey.co.uk>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Enable cTGP in performance mode on OMEN 15-en1xxx
Date: Fri, 30 Oct 2026 00:57:24 +0000
Message-ID: <20261030005724.84507-1-david@exultantmonkey.co.uk>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the OMEN 15-en1xxx (board 88D2) the GPU power limit stays at its
80 W default in every platform profile, including performance.

The firmware's SET_PERFORMANCE_MODE handler (GM1A in the DSDT) stores
the mode byte in EC register 0x95 (HPCM) and enables NVIDIA cTGP through
the NPCF device only when that byte is 0x01:

	If ((HPCM == One)) { NPCF.CTGP = One ... }
	Else { NPCF.CTGP = Zero ... }

0x01 is the thermal policy v0 performance value. This board reports
policy v1 (byte 3 of GET_SYSTEM_DESIGN_DATA is 1), so the driver sends
0x31 for performance and cTGP is never enabled. NPCF only reports the
cTGP offset to nvidia-powerd (ACBT = 0xA0, i.e. +20 W) when CTGP is set.

For boards in a new omen_ctgp_boards[] list, set cTGP explicitly with
SET_GPU_THERMAL_MODES after setting the profile: enabled in performance,
disabled otherwise, with Dynamic Boost (PPAB) left enabled. The Victus S
code already uses this command. platform_profile_omen_set_ec() is also
called at probe time and when AC power returns, so cTGP follows the
profile in those cases too.

A report for the Victus 16 board 8934 shows the same HPCM check in its
GM1A method, so other v1 boards may be affected. Only 88D2 has been
tested, hence the list.

Tested on an OMEN Laptop 15-en1xxx (board 88D2, BIOS F.20, RTX 3070
Laptop GPU) on AC: nvidia-smi reports a 100 W power limit in
performance and 80 W in balanced and cool. Without this change it
reports 80 W in every profile.

The firmware analysis and this patch were prepared with the help of an
AI coding assistant (Claude Opus 5.5 in Claude Code). The result was
reviewed and tested on the hardware by the submitter.

Link: https://lore.kernel.org/platform-driver-x86/CA+LW3S2g4E971by7WhfFZGuyLT47141_Zn+eJ=wyqxB_+4G95A@mail.gmail.com/
Fixes: 286e937efbc7 ("platform/x86: hp-wmi: support omen thermal profile policy v1")
Cc: stable@vger.kernel.org
Signed-off-by: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
---
 drivers/platform/x86/hp/hp-wmi.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833ac89..e09a6d261144 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -235,6 +235,14 @@ static const char * const omen_timed_thermal_profile_boards[] = {
 	"8BAD",
 };
 
+/* DMI board names of Omen laptops whose firmware only enables NVIDIA cTGP
+ * from SET_PERFORMANCE_MODE for the v0 performance value. With v1 values cTGP
+ * stays disabled, so it has to be set with SET_GPU_THERMAL_MODES instead.
+ */
+static const char * const omen_ctgp_boards[] = {
+	"88D2",
+};
+
 /* DMI Board names of Victus 16-d and 16-e laptops */
 static const char * const victus_thermal_profile_boards[] = {
 	"88EE",
@@ -2035,6 +2043,17 @@ static bool has_omen_thermal_profile_ec_timer(void)
 			    board_name) >= 0;
 }
 
+static bool has_omen_ctgp_control(void)
+{
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	return match_string(omen_ctgp_boards, ARRAY_SIZE(omen_ctgp_boards),
+			    board_name) >= 0;
+}
+
 inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
 {
 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
@@ -2045,6 +2064,10 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
 }
 
+static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
+					    bool ppab_enable,
+					    u8 dstate);
+
 static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 {
 	int err, tp, tp_version;
@@ -2096,6 +2119,17 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 			return err;
 	}
 
+	/*
+	 * Enable cTGP only in performance mode and keep Dynamic Boost enabled.
+	 * dstate 1 means 100%, as on Victus S.
+	 */
+	if (has_omen_ctgp_control()) {
+		err = victus_s_gpu_thermal_profile_set(profile == PLATFORM_PROFILE_PERFORMANCE,
+						       true, 1);
+		if (err)
+			pr_warn("Failed to set GPU cTGP state: %d\n", err);
+	}
+
 	return 0;
 }
 

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.56.0

