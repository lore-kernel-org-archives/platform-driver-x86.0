Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010084;
	b=zDe4fj/EYhavWIlIEYPM5KokF1mcz21GgbMDTt6S5XgpfOjxx+Kl0TjD6hIjYHOOH9NZ
	 FPkDx5lnhrfDaykqbcV4DixS4VyPrRMmwCIemg1hHF17Cpx34L6AOFS88vonR22p8zWi+
	 8E1QeIQTMXWXHQZaC2QKFZNn1YW4bL8SEe32yh+NJszYO8XknUwu3qrFqH63bps9zMzSD
	 LrDrd75H039zv1glLgBe+T1hR+I3abC7QqoNV10VI7hOa8T2K9lSqzj8GBrRDs2aud3Lh
	 ZC4eqpCZKLhZ+VFDykEZ6U6wObOf9HqgeUTiJ2RmdMOk3NbFR4FuTiTkhYq3jlsd9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
	b=VtBmyYjklmuCkzVOUhn5EVDBogc5lMwzzxj3reuwJbn4x0KpnDPAc9OBZLkjQRo3hi2F
	 kc7zy/zbhPzr8/zoTps5C8/PbLBP8BJ0l1OKhoj9M5OLviXpNSS+rOvzP1CoSI5e9N28K
	 +VfLOh/OfooGcvSKUIzbd2svafJ7uKf7RB6HRan5yi7u5cVBGf6Olj9dxg/ZZU070T1T4
	 mSsdNnWoWOHRbqxPczIsMXeji2S8TEOLNeW7XGNDjaU9TJ0IFhBduz0iwDO6V2O27NTb5
	 xHsjdob2zRCH6Qgdsfu7OvEOhyOp6nnZEnOdhcIjbEvfkj7oX/EhmbfqagFXMBUJ98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Hau1K/L8";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D87B606A31D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D87B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hau1K/L8
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2644749a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010083; x=1793614883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=Hau1K/L8iu04LqcD1OTzAHK4RHRVoyV4BlxyI3OVeDnEoedl7KmaF+Nuw2ro6e9JiX
         3u0nUbn9F54z6pFJc0ijbxGQGtWLRzkkVn2rlQRq7PPU+cVhbyShP3dYmQTZPVdlPrv4
         ACeV4hiAzv73oqsclhkvdOk9a2ID7ey0MZNFrc0z4Mc34ZPVwOrScSpWyBaL+tufEuLA
         CAGj6yeKap0+65nxWR65EhCef4AKga9qGelA2ood0T6vE8+Va9ys3oAUOYHxovBOJs1I
         hnUtV7myl6u2RWbwp4pNSysknC0EaZMAsDlHUo6NmOr21MbTQSmGb+FC4O/IxEbcU6iq
         MskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010083; x=1793614883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=QmLw+EkdXRz2S0w3GZGGsdJpj19ok8WUeOG+/jE9Hg0UwoZkh2l6faj5mTYFLnmcml
         82UQIl5577xJVCjJRpE17VPL45IoaFbH/iWE7BE6I2nbzQUo8ht4ZNTEVxVMEU9aoaQa
         jWThlS6dGVBk5jDnUmK1VNPBq7fzowDY2/8+rAt8jzQTcb9EkyKMWMQN/RgGuS9jhNPz
         2CZQdj05By+/Vco89RPej0wdx6qaBb89PWSHw5ke3qUOjC0uCoL74tZ7KSVC06NTjrNz
         BD47kebDubwFTCpvLOtO37ftB0klHDnk0/rGeR1XI3F+dbNQChRgcgsIeiVBn8Pys3jZ
         +KdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg3cSWhqszlh+TciiKanXMw1sM+9ok7laZ+QedoW/CnIyS822WQtCXPJ7wax3oyW1gGqwRyNf/ClaUuW8vsJUtBWuL@vger.kernel.org
X-Gm-Message-State: AFq9FYII7crN2l4A/DuDDTnIJb2M6GhyG4fcMj23aAiPv+ib0qPJ1bxu
	rIr7mar4BJdRCRU7jmtKjEW0mWEPda+6wQPEN3ivoXVrXlA6EE1JjyDW
X-Gm-Gg: AYBFou13AMpRCFvTFX3szpvm0cBWzhVWGxAuVB3ixtyS/QfyOjNVKhuRpTK3B2a4t6S
	jTkSLTCjptbtsv3P2mUpAflaZJjFYrR6h6QMTl5ppdgXFVYo5Oa9QFhmwM3TxCn/JVrQqlNPmID
	MHirKrbjjlpFvRU4qe5saqvbU1UG+JE2WumdvEl9FvzZZ7f02ZHfpV2PVmrqlqAqbzKrnL3yKNU
	Xi5Gk5Ea6F8Pved01VQyNpTht3uh+sOZ0ZCfPXBdr1fkxF7MNTOK8E+dsMI3l6mOB0L5U5h+1eC
	GQU9ps1NhJbYHvm6whEKrPQnd/ar6o1o43Wu74cGAguQK5JCCtGcGh2JOWsT9m4S48ZdkZRx5Lv
	S6F+hEOo4sDY67MzMmf4V5NUwceHT1/9dheanEHWGqYlvfcfSIAazLbFD7Kf50vxxMIscBzh+h5
	C2w3DZGdb+KapUKPdSRxmuCeOsnAwtUZT5cjW5md8Pc2Mey/VrkTDlwX3mt38rosxeBvzjxsdK7
	qywkKk4bi+RDl3Vo7I8Vq48ODJhLimetetQ+8zCrSNhDhC0NCE/aprBxgI=
X-Received: by 2002:a17:90b:588d:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3adead48e48mr5768532a91.31.1793010083558;
        Mon, 26 Oct 2026 03:21:23 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:23 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 26 Oct 2026 18:20:56 +0800
Message-ID: <20261026102101.224568-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
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

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 508912fb4e54..250c471e674d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23044,6 +23044,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.56.0

