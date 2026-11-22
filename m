Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391069;
	b=cYEweq2PVaYQ516xjAnpHM+nurciRHJfW0qA9nCOf4+7seM5MWvDA6TH6ku0uCE0xKpu
	 2UIEiIM3B+zdajl1FrDNTkBiTQ2Bp6bprGg0vebXAdmUqtvlt37DsAZfy56O9yCbGGGDx
	 K6PA6aL9f4/6C3APWYRknMbAglISTzZYh5adY0mRfFw109oYPOqGC+sFCYaNYAUwrfFqY
	 jJeQ/Bi4mK7JyT6zp4QmK2WXVTXwD49FjRDaKynT78BaStKrcWD+r9vHE9i5zwvvK3ogR
	 H23jr+68BY4VNFv/HxlF9gHICyi3VhoKFe39sFve3yjbBD+sHWUqyuJtTgZGw039jJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391069;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=gH7EtxdhRpEU2MDW4hrWT+jWSZ8U1Mg83JMafbjW5/8=;
	b=VK0kb+WPAmW0i0Y1lHtDqfbNP2PHAy6G7LgfNyslX3D0o9HXkAFHv2LE4MENTNTETTgW
	 Td5vRhXj6f00H1jVQeGLkNR2NP5EidXpoSEhy18YJObNTarNeARyxqg1qjaD0vyAoNSYB
	 Dj0vTO6Dx895nk27LmO7tpB7+d/EsOItujq75IUFZ1vgKdnYKoDh5cMQf3ITpGecJ8+kh
	 MXyHj5HmZX/8xaPlpEmYmRHbI26MivYAORNXUL1XVFo1KjnZBCAqbgJF2JJtg/BaJ/+pq
	 J/MisYHE+MreGkMqvxazIxtTeMLjotMe7ZL67m0vx6+AFj8gXHvQacn1sW4ewvntseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=exultantmonkey.co.uk;
	spf=pass smtp.mailfrom=exultantmonkey.co.uk;
	dkim=pass header.d=exultantmonkey.co.uk header.i=@exultantmonkey.co.uk header.a=rsa-sha256 header.s=fm2 header.b=RKf3avQE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hBN6CAaQ;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5E606A332
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 23:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A5E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exultantmonkey.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exultantmonkey.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=exultantmonkey.co.uk header.i=@exultantmonkey.co.uk header.a=rsa-sha256 header.s=fm2 header.b=RKf3avQE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hBN6CAaQ
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AC01B1400278
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 18:44:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 22 Nov 2026 18:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	exultantmonkey.co.uk; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm2; t=1795391067; x=1795477467; bh=gH7EtxdhRpEU2MDW4hrWT
	+jWSZ8U1Mg83JMafbjW5/8=; b=RKf3avQE1E9u62mSpc0XlsxfhchrKeHyMZja7
	GKm9mWVreHOsOMHJpy1USPzUwRIwIefw9z85XaaAAobaGxrGw7UoLs6xjmgEozKc
	EDPFN1J1M9RwMLQ8U9MxHiXAIDwx/ZFpWVscbSfe8IUzk8zbQVQbv9GQ+TcC+//x
	f8vbsMpo9UBfDGi610ss4o01Z9TcKNTurQVopdsiCWhjJwrdVHcnPk/cdIiXy9Cb
	avaqrLSf3Sv2Kie8vO/7TmFqaYiBmS0hKHvS6ClpnTf3OtYFa75anJxSlHdidA7Q
	rDAjHQ0TUWF3EOZUAUUFW4Q/f9p9nvqiwvlqQg2h/pNSXVCrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795391067; x=1795477467; bh=g
	H7EtxdhRpEU2MDW4hrWT+jWSZ8U1Mg83JMafbjW5/8=; b=hBN6CAaQHbXvF29pN
	69SrajU77ciHVgJFVZ7XEF3Z9viD+Tp+6rUNgTGHy3FT0KYgumbddk77NjU/Iv2l
	2EghLQgRVouH2VPYUMvv/oYEEO4Z84TVEAYupAg0f5lrBsY21Nx+Iu9pNmFdAbcM
	ZgGNPvxIpsdR4KWsPncAUUC3vTTTUtgnFdZXTA3nl7HO8JPKovoDmUrzNM0O0Bll
	NMJqWIy8OjcY9fPo7c7a/Pdqhpu7Hdm7fgZrgkgRbJvWThbhOvFQZdIXZeUsQhx7
	+g5gUtcvr74XmKF9EhzY6EdEVyw5KnF6ExmmWkP5NGEd+uhhWTVsJvCOP5gWRKJ5
	JlhoA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=exultantmonkey.co.uk a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795391067; d=exultantmonkey.co.uk;
	mf=PGRhdmlkQGV4dWx0YW50bW9ua2V5LmNvLnVrPg==;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:PRJhtKqT0ekI1P+UzDdUYzvcho3T61q8pMS5aA6upPZpCsk
	vL2C5wyHDA/IUbCR5j3imKm77Nc1fbp3MH7yQKcpZA47rD9pz9ux2nu5LQtSpvnT
	eUvVGoHXHPMiJMXqoAC26aaz7d7ieEgDwLL6yAbNYJcgLiTXa3EWSyA4b1bwB0I1
	ecL3x0JVMcffIyU3pStq/d2iOYlOhCad7fqHDqwA2JbAQyvdt7WKtto1M6rIZdIR
	SNQadQ4QoRZZ16aLIYTGynPPnvjNeup+kHzaO4kfKwty4X3nvD6WnOCKd5oGsI4F
	NehrAtxta2PDdqD/yEBE7T7bNZDT0UQXl3fEUig==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:c06JG9f1QNXedOZXdZvZ+buVuri/XRlpKKPnM9d/008=:rRB1ZVCmFGM9DQVRDAU1tDDlupGA2lWEbhrEND/c6YU=;
X-ME-Sender: <xms:W34Da4ugLN97Gv03is2Zsju10BnH3JCOKrivLXccaqLxxSZ5_vk6hA>
    <xme:W34Da6by7bUi_EbboCiAWew_6vmLi77Z5NmFHPkCv-iSfWHhaTIWvYSsojas4iulf
    RPl58cj8ljk3iT_UAhvVe9IJn9ZYRSHs4GQpAta8kCV08C55HOz9mPx>
X-ME-Received: <xmr:W34Da4Ck2WQuQRPzAmTzOIEJpUmMO_pgUCl0tc7dUx7KstqwABpwKgcn8tL78-Jn4SjJH4g>
X-ME-Proxy-Cause: dmFkZTE4OpePBGOUQ/MZgyKT2LmGBTDGwgt9T7ktp1L+2PY1eiQclgBluVmRQpzEebEkIt
    TQaAZLWyRbTBtMLB92ODl/Zr7OCdAVyUO+KeZmyAVHi45p5YJ06CI7J2hr3IQCTvR+y2ku
    4jUOZXeiIkb+fOBTdMLQM1O4BdwrB51MNJ1bj/WgB7Epx4R1fWxVsc3A17xDKkRGyPIMgf
    J4Eyjodzh0ePccQJDTpRaNUlPslTpUCRENMth2f3vDbStCRlZ56kgbE9hT4ZkwT2iIAxM6
    xkvpoLDoijMFr8QemJ82fWkP7aHowDv1+IEGckxXVCMGgGBz/3DJqlWfKTfEILfi7zeBib
    rPg/1PXftG00mcR3WvNoYOKihv6DrjLftC/psNho+/D9dux5Aawwi+8AKTfEzO2q3EoyhE
    q21IALgFTzF3N/fL2m0SSrNJUSQ/2M+Ht67QakPdiAts8rZ00MGG6PglCqBv+8LjBv8IzE
    wsoJQXnHLw/6mocuUG4QC3l47GDi1tfGtvyooj8c9i/volT09sr8GCcC6xeuNdyjcNvteg
    cJsoOqa7G44AgGq5KJHDaehNvm09oSn4KCjL6znHM5y4fdWS8qa5uU+BwvN8tidfPvfYZP
    yb0oEv44C77hVj3rxbxJ8NTh9eFEQj+utcp2qHK2v0XHNHl9h8Ful/ROICbw
X-ME-Proxy: <xmx:W34Da6_AFzITLpODYE8Rv98aIeEhQAqnlqXTk_iJLie5NOJGLaYLhA>
    <xmx:W34Da8RAlddPHAUwZCBEqcFkNHtRxom86D-wTugwCpeDcEG7m541hw>
    <xmx:W34Da2WSOAeeS0tgWBj9DIuHW7X7ofZfNrXBHvRXiw7olOfpnAQP4A>
    <xmx:W34Da-RLX-WsFSzJ49mo6uNwrYBsPH9mlybY_LgSvmaNcevz3kcrkA>
    <xmx:W34Da4ZxY5EwVscCNN4L8P_nmwv3a7gx8xJT2r10oDnN6oQHHiEBrmph>
Feedback-ID: i8d5147ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 18:44:26 -0500 (EST)
From: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	Julien ROBIN <julien.robin28@free.fr>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David William Richmond Davies-Jones <david@exultantmonkey.co.uk>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: hp-wmi: Allow boards to skip the power limit refresh
Date: Sun, 22 Nov 2026 23:43:50 +0000
Message-ID: <20261122234351.278694-2-david@exultantmonkey.co.uk>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122234351.278694-1-david@exultantmonkey.co.uk>
References: <20261122234351.278694-1-david@exultantmonkey.co.uk>
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

When the power source changes while the performance profile is active,
victus_s_powersource_event() refreshes the CPU power limits by sending
SET_POWER_LIMITS with PL1 and PL2 set to HP_POWER_LIMIT_DEFAULT (0).
This was added for the Victus 16-s1034nf (board 8C9C), whose firmware
treats 0 as "restore the defaults".

Not all firmware does. On the OMEN 15-en1xxx (board 88D2, AMD Ryzen 7
5800H) the SET_POWER_LIMITS handler (GM29) multiplies both values by
1000 and passes them to ALIB function 0x0C as the SPPT and FPPT limits
whenever the EC power level (OCPC) is 0, the highest level:

	Local2 *= 0x03E8
	Local3 *= 0x03E8
	If ((^^PCI0.SBRG.EC0.OCPC == Zero))
	{
		DPTC (0x05, Local2)
		DPTC (0x07, Local3)
	}

Under full load in the performance profile on battery this holds the
CPU at 399 MHz and below 5 W.

This firmware already sets these limits itself on power source changes.
The EC query handler that notifies the AC device (_Q20) also applies
them according to the adapter state and the EC power level: 25 W on
battery and up to 54 W on AC. On such boards the refresh is unnecessary
as well as harmful.

Add a no_power_limit_reset flag to struct hp_wmi_board_params so such
boards can skip the refresh. No board sets it yet.

The firmware analysis and this patch were prepared with the help of an
AI coding assistant (Claude Opus 5.5 in Claude Code). The result was
reviewed and tested on the hardware by the submitter.

Cc: stable@vger.kernel.org
Signed-off-by: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
---
 drivers/platform/x86/hp/hp-wmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af86800e..c7960de7ac0f 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -154,6 +154,12 @@ struct hp_wmi_fan_profile_params {
 struct hp_wmi_board_params {
 	const struct thermal_profile_params *thermal_profile;
 	const struct hp_wmi_fan_profile_params *fan_profile;
+	/*
+	 * Set when SET_POWER_LIMITS applies HP_POWER_LIMIT_DEFAULT as a literal
+	 * 0 W CPU limit instead of restoring the defaults, so the power limits
+	 * must not be refreshed on power source changes.
+	 */
+	bool no_power_limit_reset;
 };
 
 static int hp_wmi_get_fan_speed_victus_s(int fan);
@@ -2621,7 +2627,8 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
 	 */
 
-	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE) {
+	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE &&
+	    !active_board_params->no_power_limit_reset) {
 		pr_debug("Triggering CPU PL1/PL2 actualization\n");
 		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
 					       HP_POWER_LIMIT_DEFAULT);
-- 
2.56.1

