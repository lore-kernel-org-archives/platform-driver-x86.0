Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406386;
	b=pv7AlCXBFZA2tUsqtUZikiyZ5J25hWGl/4OmFT84im+iepd+8pJOTVoBXuAhZXj2RSVC
	 tWX5q4gEBJVMQYTJiWKNPJKouRQrsaBdcvboZDy++fH9pdw15XTdJ+rgthRWW2v/ucR7A
	 mORsj/b26F//lZEQiky2tgUI9g0ObtIN8Tt4/60c6Q+k1E197+FQyRes6T6fbC6VoozwE
	 v5LyrAOQIA5aqHkLfDfSPnoia3lsUhk3Lr1FRbiVg/x0t3lJLS/dspwuocOJkdjNAta6H
	 FwwET/aGH87GOjln3vEHfGFTX+krL0iul1TCfgRhPAkz/KK+go5zyuqnlxBCKlQQ7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G+pbc/fHfWz6bvXTAuuM9dleXjCvd6l2HIlBAADBKB4=;
	b=fGVzDrz91MqfhJr+XEqmIthJf6Rtvjk6vDCAKCpjy9VyXARb5/dWO7fhrjNC7PA7OlMh
	 XTgDKEEUNaid64iGJxjFOV5LuIl7fXDxZ454P+fNZJHuJ0ZHRyvawDfItSBYtr3zx9LQr
	 LNi+Zj1qs5XAuG7se1XA6SNLxzR+1NyJSuIipSPU1qSG/QQjzuPVQSfnha/1c20IG4pXV
	 SojRjWBwiNRTcBgl2D7lmO0I2JKchg1kdGQl0xSTpqRG2GysIvioMBVicMgurm7I46bMC
	 fswjFlSoBCfnItZsodmxYSTaagZEnBtt6bRP8kK+uaVSGMkudcltFlJ87NAtfMqlFgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2t29f+2;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F9606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02F9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2t29f+2
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1630399a91.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406385; x=1795011185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+pbc/fHfWz6bvXTAuuM9dleXjCvd6l2HIlBAADBKB4=;
        b=E2t29f+2UNRSurIt3r3KnMKweMNtc6wjlB5qIKuO48FK51ZX2D1F6HjWnr4wm9+Eiq
         aU2/DNZ3x70FqeN6OcR1naR3F/IUS/JXqS3eT1XHVhauv+/HyIVE5be28ZeBc3MfJYd2
         Vw5pI/WN0UKhFxj8RPJAvoNm1YSEIlnXbTjlNYDk3KHqpMbwymNPd318azNAw3i4eYiy
         l9LDBcGxfl2gKfwik0LAc1Jc9572qG0BelSopKyoX1Rt+ikGcEKI4q18m9S00xraqLCA
         XRh/Ahu4YKLuD51pZ1kSy03oLBDC/j4OoVIAuULSSbCJRT75EoauC7/ULFLm0NXy0Ytd
         PMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406385; x=1795011185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+pbc/fHfWz6bvXTAuuM9dleXjCvd6l2HIlBAADBKB4=;
        b=qIfg73wR55lHbhIlX5zdhLKIldQWyPYl7Xcyn1R25M+7Xg6v2xkJ97spPQsqrU8Ybg
         ow3T9PXCTRLzuH/MSQLha7Sa9+Z2dn1zkM7FAerQttbyyWUPu+X6MiYhVoodoodUH8Cg
         5ucC/6tNT4FWSByKcb1G4tSB9ZrwSD2gmHm9fRz37a7+XMRBwE5ieMp9WpJw0wP2TK8S
         jefAK25N+oBnZz/JufTT4YK5ZZXgjN7vYNPWjncIFuLKmGEZKpp8sB3JsWoLzGUJZWU+
         I6OOLViumXw/OM0VMXo/3pQnpy58da7G44w9JAFwiW/BhidUZwWOO7Bvk6S7WAFKXtz5
         q9lg==
X-Forwarded-Encrypted: i=1; AL+hErExmJxGybCw/TR5mEQrmnmdX0qXxpJFk6nC4+nM9ACvqan+SjOt7+LI5/FOKwAjvqOV6psenPSCFHs0oyFS1BG6zpuL@vger.kernel.org
X-Gm-Message-State: APuU4Z+pFALGa0HWATrEDlIXPl0B/FNPYFUEASOH6x6gLfT5tXcRIjtL
	S2FvSKc7/GbF7ktTlYRjsIekdFKdknYPIKkPLPhT4SqIClVPdkJtC61M
X-Gm-Gg: AYBFou2AjhrR05NDKAnL8z0RIBQSEDKoCeNH+0jv8thp292uV/tob0s1BE326rztCTX
	L8rDdCPp5XvLkSs2kzTugFEI+LOx3axFVsUO8FXqF2fqTHSXikiq99lSZ7hQxWywnT/GR5IZ08k
	7eQ6qRBVMc5tb/4xm8WWsBCrR/uFKA3NLkUEDdqa/Xs2j2oVt8j5plLX37zJVKko8MyqG3Jgt+L
	I1s64byeOhNYjAZcIMi25n1pGiLTX2BEUc/GRNa8w3RJ1KyuPhXsEyyeQkMRsYrSIER8hICI5zH
	cw33ATuhkvrxyM1fRS7hXnhho8fNNW1TaistvGSJaqsyQdqHKf/7cqGCnZRkx0g6lvdrz7xJdhv
	K3mjDBruvt0pSShnrCsy+y57T7Ae7fh2TDHnvsdvrsvEx9AxHYNgYZ3SYFjrRC81maxj53xVMSm
	baQX2bV1/p6XHCF77YDUlBTNdzqZN5VsIl13U5H+Heo74Buwv8V4HXfLk+JG1RXYVq9FEAGiYUX
	yRI6NMsMW4MQvHew/0DHRexHyNWDQVVr5mwjSHwuOlFr1TWYT9IGuAz5cLzYrPgS+QuwbNWaZVy
	fq10COlOEBPD9KuL9FNw2Qj1
X-Received: by 2002:a17:90b:57cb:b0:3ac:7872:d1b7 with SMTP id 98e67ed59e1d1-3b182eec0f1mr2432639a91.32.1794406385217;
        Wed, 11 Nov 2026 06:13:05 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:02 -0800 (PST)
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
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Wed, 11 Nov 2026 22:12:21 +0800
Message-ID: <20261111141226.9482-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
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
index 981eb3fdbef4..b3307cbb60c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23698,6 +23698,13 @@ L:	platform-driver-x86@vger.kernel.org
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

