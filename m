Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906659;
	b=jxkgbHU2A/7o0ZSjUYxVET1dO35BRxtW/EUnhWqCEKFCgA3HtwOYiKYlTAJNr13822DG
	 f143jTdzT1T5FPvLS5UBaVdFaGq6zAGJ6iQS60Y+dZgXyML/ucaX6DNQupsqpYbyivAUM
	 mCv7++6v81cy1XtorDHAEBwh7PBjRHpG9DiJrsNIQcOqnonEzaY5PWVLXDWASsTcCLlRp
	 rZTItjgwQSz6a2hLCGWII1NhjIdAdhnXzQpTYrERJIxBNQoD+jmtpYAEa8PpRUXHqosOq
	 JWDs4V2riXEQdzEuFDcl8M31uxHWJmGDgol9pkTrP6srP3q672p+/pX3mylSRfQP/PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=VfvCB69zFffTvll7Uz088QFRKuitfNBaW/NJB0o56kg=;
	b=AXCqiHfNVKDxnfmFRJgLSYNnAz42sx2ngfI0f82i1O+d/kmWnYbxMaK/6HQgFIy6MPAG
	 ETa1jP6XUCpqdn3upUxkVrBp71MLJxgcNGbz65JqKp1BLiv1PiigtESdRY9Lhv80rjFVG
	 fBBcGYj5/s3z0aMKTIApS868uFVKHiKZ+O579GasTVG0dfGEZrl+WInnBuH+u8y4Gv/Sr
	 x4cVj8YgiV8WovAXss5wZ+2amn0gmUtMw3iC9P5xUIqASxvHfh7/YhS5moTJwhFP+BqFV
	 6iuzg7hkH9IFSydtxwRXRB/1s2n8gXTl/N99W7g/0fEdG1KWQ8RaRDSCi3j9QjkrpAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=joshtriplett.org;
	spf=pass smtp.mailfrom=joshtriplett.org;
	dkim=pass header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=AtPTHxb6;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="FpG0US/e";
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F53606A326
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 19:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=AtPTHxb6;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FpG0US/e
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0DE21EC009A
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 14:24:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 05 Nov 2026 14:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:content-type:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1793906656; x=1793993056; bh=VfvCB69zFf
	fTvll7Uz088QFRKuitfNBaW/NJB0o56kg=; b=AtPTHxb6T4qxMK1tAs470VUwz7
	KV4vHjcqBgvYPeytqFAPwQiYEijo50nBf/luN2dcU0xWeCaQzGS8y0Im3PIoAU8z
	JwT1Lx4vlvpeUEq8Bwr7J0ggVFkt8bIdy3Ek/ZrNZq81uabEWOpO8FCpRK6GVtXr
	lCw43RvUv3Yqzv+rAgY4MHOEIgC2SxcFvxS5OKdXc+rrCaW4+hWK3eN9grX4iUoW
	XFZEsYeJePAHVu4qDrlSd67oDSeTfzDJzWFTer9OF5JRJkVrPiDZmOD99p4jHR5x
	CIJuRNZ/zXf0J0w6lWmfmjJDi1CRd4V6AbJGkk0SkHIkdJBDR5JwCSv6rVpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793906656; x=
	1793993056; bh=VfvCB69zFffTvll7Uz088QFRKuitfNBaW/NJB0o56kg=; b=F
	pG0US/ex4mB0Yn9TIxxpL9EGJ4cXfiRbPTNntqJeBjha4F927CqaJaQ2eBmygQYd
	PIMmXMLiGmf7x6qkc2tnQvYrWweNSU4wFlWGuInaMCgOYROsmivyWT7xEyGEeTTM
	MMCuRWI8M3nfi/hI0+8m34G0nXFmOOKnHwOiPjhYVBoO+kcnKEU4bmsVeCbTAwZx
	rQzDgrG8tBQsLdQSc5ZBH7U2dj8cOBdXSapQUy7dXEMO5rCc0ls42h57JSO50jAO
	buZWDH+0E+XsHO4bGGvprtx0axeNCF12tp/+CUBuBTvl0sygOUeE+9HV/MMRf8Tu
	J8E6b36n0HWa6Kw6FdoAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=joshtriplett.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793906656; d=joshtriplett.org;
	mf=PGpvc2hAam9zaHRyaXBsZXR0Lm9yZz4=;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:5mQsvt9U779IUb9JGTaI9X4u/KqM9xfR5O87ooRi7BFAwRm
	TxEzAvzpiiut8Dt/vKD9b2ilXRE5fQ0gdcu6pqOBmZ82/+NOFuqDS/Kqf4WSohrH
	6p5CRusWa2+OGDpnbAgzi954j1WzjWSX9bgLlQj3DcZHqAf6ggyP0kn4+MZV5JCq
	oSHdg5j8mYUWYhJZVp2Vhv4qIkABPmzBhKvkV9Hlc69sDKc+KXzwJpY1t4Y4GkpF
	gtTuXi1l+6InIMDkj8mXwy1Iy+R6ZpEqGrCVFGD4n9gV9bVzKE2f2UXER+de4NTG
	K4CwzZKUlq859F7DNtgk+jbXy9lMcG10rx5looA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=content-disposition,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:rx+BpPmfIdPB4Tlqo3YU1f29HBHc55uNpTZc2CQUCyg=:k+Gh0LVp5gav5ovJp95LVAl72Y/3htLWNcLdWsteD9Q=;
X-ME-Sender: <xms:4Nfsaka8L4-bcem0tFB4NTUQsjo75Us3AOw-CIqZcumKzRKAa3NpMg>
    <xme:4NfsaicPd0-L-fVWZD-zSniI_WrOdNV53ynMGk_ssMRX_X-ZWlLjtkEWoZjfyA1wT
    qfgvpgMawp1l3PO0Kmo72tGxJgzUKwsefX-7CV1skpsGxi6gc4HkkqG>
X-ME-Received: <xmr:4NfsaplVYPOoCpGM3uHUk3gW-6MJfYlZWAxpLSxS6ZNYvTAUrAu1EZFMSg>
X-ME-Proxy-Cause: dmFkZTFlFYMDGrPYwdNRx/GDjrurDJkqMGUZMAXjzy7BvQiIhXGcwMv11OxN5tZ/z/kIvv
    6cklvOTOyjLd3Sj6jaKNDwAoSmIC9ot+2iS7Ael6CYOnqCrgD9/Nqh+/Xcpzv9ikR1gC7s
    n0ShIa+m3tbrO/3YuNnrqIUdUlL2yLxi3zyI/yZwF2Ek4nyECMXYgh2yff95MryHoAqYwc
    c57h03E7fuJldqud62nqSHe4s6g5mSQkDEGX7p4Rdcj/hO5kFaUZ8rtWQAsWbFIUKDLRy8
    JSbr4tKrxhsDn/ETs39JJIzChYrgFb9KgloM++eGqCyVt32Gx+3920r4V+kOb58U2fvgsg
    mwhL3OU6AeBLUVc1iD0lbT2/IfkTnziWU9RtmN7jAZVCzphF2pz2yGH9jUVQkpUHJdwdde
    ctxt/b6adk0zj8cfr68+5ROKcAVXMqM2w+QzkqoC7zwQ+yJJAFt0gNlbRb7x/Df2pVqZbi
    Pbeclf36SQh93yxFyMD41fDsmk0wmLEwKmMs+kr/csQxRaSp5q95kXK2kFPecg/GHTICch
    6FrkipMIYZaOrhUA2KakV0/I97/iNmPudlF/lzZC2oAPlWPSupyC9x0Dfo861U2Lqm+HPy
    NoJwTJ4tm4YTr2Ck7nKa+XlKRYBEUhUgfCbQTtI5M/+9RsKM0064MjzfMR7Q
X-ME-Proxy: <xmx:4Nfsaq1f-pyzTpwyRO9J22skREzAHDRg_QfSPJYXZnXe4B_iaXaBKA>
    <xmx:4NfsaqeTzJX8Zc3pARtY1wmqWlmvfzbXDhfvUP6OpZJ849FkPNvMyA>
    <xmx:4Nfsasb4KEc2OEMfNKvHcPOwH_HZ2hIB2XbdezLIDKJY_jYVGFFJhw>
    <xmx:4NfsanGS9q903gU-wnLpUYEKUywClFHSAsNJjfVk19IfIvR69nnTGg>
    <xmx:4NfsapWw_kRu9H60Ks-RWFWptLUEYLP7ab30GkeGLQEZJMeGLor3qEc6>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 14:24:15 -0500 (EST)
Date: Thu, 5 Nov 2026 11:24:14 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
Message-ID: <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tpacpi can expose the charging LEDs as `tpacpi:orange:batt` (LED 1) and
`tpacpi:green:batt` (LED 2). However, at least on my X1 Carbon Gen 11,
these LEDs get hidden because `TPACPI_SAFE_LEDS` doesn't allow them.

Add these to `TPACPI_SAFE_LEDS`, so that tpacpi can expose them.

This was previously proposed in
https://lore.kernel.org/lkml/20250403040846.7834-1-martin@arp242.net/ .

I'm currently toggling these using write_support via ec_sys, and would
prefer to handle these via the normal LED mechanism.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..50a8cff5b374 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5608,7 +5608,7 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
 };
-#define TPACPI_SAFE_LEDS	0x1481U
+#define TPACPI_SAFE_LEDS	0x1487U
 
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
-- 
2.55.0

