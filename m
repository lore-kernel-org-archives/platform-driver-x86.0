Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144173;
	b=USjJVwao6XYWlCet8LFdKbbr+dS7HcPjFu62gQnSeT5Bm+qhoKWdzEqX2Zge3SaqKqnO
	 jmN8yjvrqbaMTCTW49wir4kURc80XBbcbvkvHI8VwspP5npdcdD645ZfYbsJSjcpAUYvB
	 KnTWM8yF19V/ejMcQAxxwDOB+1BLU4WZ+vcVPXL+m3w5sYKmFCNOmi3BcUb9bEtGHpnEB
	 nGT541vHQSl2VxGHaOOstzbKqORgk7ZolzoTcu8N1tKZSQsOyIiODlFsiHKqMn8l1abrl
	 M8Wkniyfu/ZIInQTyNIEWkC93b74CyJbZW8jSa3ZquAahNY7WSw13YnfIUQlvVqmxGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144173;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=IGYDahWwuRgVs+v3B40ksZVdUjKk1YSApRxwtmgYmAI=;
	b=wtgQaXAk/Lgx+MZjp7B0eLz1MWcZWJVRGccyxDXHl7R9loZsqy3us3GcOljs4kCM2baI
	 UFovJlD6JCFKhKJnic+2hXJGmWPRGRoNxYwuu3DRyQZos6PYh7nt0Iep3TPQh34X67ETh
	 wgShTFLh5Vee8/yr6eE04Jc6Yq8hMxqmuGC3MlynukL0n042M7anUHc1Y0ODL0NMLLBmu
	 0Aq23/FsefhJWyOrHsyH/8Aakp1hwWECG8dQSrg6UPhn2Tg/e1TPyrCmvO+Hw6tCyJ9D6
	 goeIvCwHrHfIYvqxnLe2vgpsWOSCwhjz7Wt62jNlu6/ByI7hYD+BuImp4FK5aEuiUgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=pass header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=TsvIvMAC;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=iwTkwSwl;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F77606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 23:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=TsvIvMAC;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=iwTkwSwl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793145072; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=IGYDahWwuRgVs+v3B40ksZVdUjKk1YSApRxwtmgYmAI=; b=TsvIvMACh4R0Yw/m1sgk2e/41x
	GcVdjunEEzq/UXwHHQ3qOt7diHqLSLeAkCxNh7nXmCW3LQgdGuqZuxoa327RWHTq+ZW14SB5IpE1K
	85H7dwqkhKY00CWRxthdsr1/dPEwTq8DPVl3jXoGjxZBmdHI/f9Hv9BYRN8cxMc8nIXJeJq18eXaH
	6SnG0uHBHbGDHsSbeiEsNRg5NKFrv3LlslaSYQrfnXqnUrMO+b7RPcsnIcEqieYbYrmrhaotUXWCa
	T22YEbUq9ZfDvKYBiuYHiN/RdtijJD4thWjsSpOXlntTS+ERKGv55K4vyFaioKhCZP8y/KNnWU9sP
	yzRcc+uw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793144172; h=from : subject :
 to : message-id : date;
 bh=IGYDahWwuRgVs+v3B40ksZVdUjKk1YSApRxwtmgYmAI=;
 b=iwTkwSwlzOSJzFzdTlrdRtZkB+Na4VO7A5/rCpqnBM19+ZBrXr1LccmaecWz1nQE53m0V
 gzuSB4a3QJRpQf8av+xg6WqjOA5MuCFuvZAI/P/n3iR7qW5b1p9gTrEJFKaa/rF6vRIVBam
 uhn+D1woUq/YNJmy/9tUOCxavxhRzPxD11DsvO0UzdV9bB0Sug/Vp2zduHHLoVWAMGdnm+T
 s1Z+ETnGxCd4CKxSXbGucIWkQT+nPkRSJdgjJj+57tXe/swKF84MUvYsr7uIMzSYE6LqapX
 CvXa9mlXLpphtd2+ZV6kyOHaZgO/k24B42ooMhUiXIsstKCbdUCNrPnbFsdQ==
Received: from [10.45.79.170] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xLqhc-gL4Vta-Ev; Tue, 27 Oct 2026 23:35:36 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan4)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xLqhb-FnQW0hPn835-KyNy; Tue, 27 Oct 2026 23:35:36 +0000
From: Shang En Sim <sim@shangen.org>
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shang En Sim <sim@shangen.org>,
 Krishna Chomal <krishna.chomal108@gmail.com>,
 Suryansh Singh <technosfan14@gmail.com>,
 Emre Cecanpunar <emreleno@gmail.com>,
 =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
 Radhey Kalra <radheykalra901@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Clamp PWM input before narrowing
Date: Tue, 27 Oct 2026 18:35:08 -0500
Message-ID: <20261027233512.211524-1-sim@shangen.org>
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
X-Smtpcorp-Track: CIpSkjPeIm9h.3NLhBolPslBL.WrsTaAfiPw7
Feedback-ID: 879706m:879706aL5FzMA:879706s8MPA8VqoV
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

The hwmon write callback receives the PWM value as a long, but pwm_to_rpm()
takes a u8. Out-of-range values therefore wrap before the helper can clamp
them to the supported range. For example, 256 becomes 0 and -1 becomes 255,
selecting the opposite end of the range instead of saturating the input.

Accept a long in pwm_to_rpm() so clamp_val() operates on the original value
before interpolation. Values in the valid 0..255 range are unchanged.

Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Victus S models")
Signed-off-by: Shang En Sim <sim@shangen.org>
---
Verification: Standalone arithmetic boundary checks passed, and the
affected hp-wmi.o object built with W=1.

 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833ac89..d66481a98c32 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -688,7 +688,7 @@ static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
 				       clamp_val(rpm, 0, priv->max_rpm));
 }
 
-static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
+static inline u8 pwm_to_rpm(long pwm, struct hp_wmi_hwmon_priv *priv)
 {
 	return fixp_linear_interpolate(0, 0, U8_MAX, priv->max_rpm,
 				       clamp_val(pwm, 0, U8_MAX));
-- 
2.56.0

