Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636428;
	b=34UUMFCf4FZzhCXrLztGqE0QHTdiB7OK6p5daeZdhmxuUAaR7lGRySyhoAtZ1sORyVGU
	 7LQUFkpRAMZBKk5/XJdQcacuiYVzoHWb5FPp1EXdlgsXjbZ/BUkH7wQuJui/q1E+/Zb++
	 P8S1W32KxyFVa6daOrdPoWIG/VIGGQZKjORkKYSv/TAnOPc9btqXx44R+kUkyXKKL+8XU
	 kNtc2imqhM0Ul/XEggpleNt5wQWBGo0ZPYs1tW9oqUf0nLH5BNq9xx4+EsTl5vHt1JBBh
	 MQxJ+B2R4AVKdGTJu8rxJ0OutfPGOop53wMjR9aevPC8+Pl6eGZyHQciZ5HeqLIurEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636428;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=t9dLqTu3GEsIFKd2VeWHnh3rx2Gr2c4jkGlpEl42+yc=;
	b=4TwFXfLhHf2SIocSSS94zFtd2qvG/q4Y52ELTL2Se3knn3Hb4MtAG6Q4NDnDKdEBrQwd
	 Z3xotIA8ul2PlJvFUyw+FSZ3l1UwxP09esffQojeFfg1XYXPK3h/n+TOgkanSbuHew5s0
	 Vlll9Ro7OBE5F/SgvHzN+9AfUxLKIRIN2EQH+sRI/We+dW+Ga3iIkdLEWdstK3ZgB0KXg
	 dquLSQyI5mHx+hQShonecvvNS8XD2apE4H+Ant1c01z5XcDc1HMxNU7VQ5+ibXijuL71r
	 a/+/p5dKS6W0GUP3B/DEdkzmXmb3kgJG0zcJZIydSjpDMcWFr/8LejgXNnIiLl/2UmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ghoul.dev;
	spf=pass smtp.mailfrom=ghoul.dev;
	dkim=pass header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b="WxhQ/4QT";
	arc=none smtp.remote-ip=185.70.43.99
Received: from mail-4399.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD55606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 19:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD55606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b=WxhQ/4QT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1795636424; x=1795895624;
	bh=t9dLqTu3GEsIFKd2VeWHnh3rx2Gr2c4jkGlpEl42+yc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WxhQ/4QTVVMX5FTs/xoncJlNoNiQZ2QzbFWjFexdX6rcqNoQgqLvgCaGCceZzCSv7
	 HLi73RzmjXMiKwraznkDKFkN0+nwG4kzePWm5ycexPGPufBJKvoUhslYfhZAbNTUTr
	 81A/4J796pUpThfmTHnMKPo2qQ1iUktHkGSwgso/861SN7ZHnR7Ht2VM9u4VvIMTEh
	 TaDLdH/8ujM6QIzmzQe/yPYLWSczEOrA/cgruiynQ3yUr+68PqYeJbx9jVGYkt0mGd
	 LF9W72woqx2Dv9P1LMyZK0m9wltSrf6J+RrcID6S+tLvvPpCYO9QuNBshcq7JxyQeN
	 MJyWos9aeM55g==
Date: Wed, 25 Nov 2026 19:53:40 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Denis Benato <denis.benato@linux.dev>, "Luke D. Jones" <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH v2] MAINTAINERS: Add Ahmed Yaseen as co-maintainer for ASUS notebooks
Message-ID: <20261126-asus-armoury-maintainer-v2-1-2091821519e7@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: ac55af1181630648f6ec20837faa56f50604b3fd
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
DRIVERS" as privately discussed with Denis Benato.

Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
Changes in v2:
- Use "Ahmed Yaseen", matching my previous submissions
- Link to v1: https://patch.msgid.link/20261125-asus-armoury-maintainer-v1-=
1-053e67858be4@ghoul.dev
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba7650cb86b0..c47b29d15d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4223,6 +4223,7 @@ ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:=09Corentin Chary <corentin.chary@gmail.com>
 M:=09Luke D. Jones <luke@ljones.dev>
 M:=09Denis Benato <denis.benato@linux.dev>
+M:=09Ahmed Yaseen <yaseen@ghoul.dev>
 L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 W:=09https://asus-linux.org/

---
base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
change-id: 20261125-asus-armoury-maintainer-59689b2f2db2

Best regards,
-- =20
Ahmed Yaseen <yaseen@ghoul.dev>


