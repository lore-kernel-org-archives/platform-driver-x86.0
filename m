Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879FA450415
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727111; cv=none; b=T4dBp3wMrouvqGWu+ftFNKVXEPdYnKSkmLeyqpFXqSbPn+/HcIL8fcj0Vep2rBboCNjBnL9rP7mU10NkeLAa6y2JXCl5cFNA+Ymi9LwT2RZECEUZ6Y9jNNG/UnIPWo8jSu3ykCXt1KtGXkxadgqCw7PpCPLGq6sAQceI82QmiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727111; c=relaxed/simple;
	bh=kZai7cDOlZ0+l6zlb8MOoVY8sOR0vPM3UXr16XTNIpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryQ4WvuwUI2QujbVtBwl9c6v8mPZYT28lvUyxBfqRhqvV3MUD38Eie4wI0b96mArUdTBBTOeOLO5a5U3D2IZ7LrMQfZxvQqoMwUgqEGYpu6NrgbAVEKfkrTK1t1DJsSCRbOPCNOEc4WjYGJnzCIKg4nPn3ZxfIHHWvNSWCoEQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDdIRD6k; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDdIRD6k"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db710396ffso18474205ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727110; x=1792331910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=NDdIRD6kMpIXPWM32EyTX4CHZ917b3pCAW/G5wtqVdCjQ2MhEtaHi9QvEboZ/mZaLN
         Lnq+uBPkJIG3kuWmJlfvj4+OWwxHLar/Qm6zgxkxBfywCIPTS645KRcYx1QgfR+YVpo0
         GGT2FSjI+jn4PkaGh2kc/tQKTIZZwkDPYf3WkQx1hDrwPi5LEiUy0YJf/uUfRly72WRR
         RdOm1OK+tGC4Oe4c8kcuRdPOhBAWqqOt1iKEvBMMZXiub3Mslze4uPhd5dmjpUrYxIeF
         X2in/jMmL5oY8/jodnT0VfPnlKfA53s/ubqsQuX/HJWvusyoZis2V6CA5lIEA6sBSNAS
         ikeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727110; x=1792331910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=o2TbxZZTfDDkV0gwNR1SiC76a+s+RuD59Vh7JrHBk+Gef8UbAAmwzRQdy55EJCE3Ax
         1Luvp+MT98aPfs+IAc3GosFQrLURNyimMj5/4h7K8yd7JE6qRlZ6HhqcbmBOuoeSiKrv
         mSTDLVhMathpBH80b5ykI7OErEdlSVGaTbwKBhyth5ysZj1/5EMc5dLxcHKvgJaYSK69
         aXikLyl/FZYJS0Zb1uktZ0YvxMih6EGJvBnraZlr13zdC5orXJ9BGAuuZ+j3467H+Jst
         uw4fggVmZiTLOL1QpwQGtPNs3ozxxMGfrtVj0oiIBw1yp/D7s9bGfIs4V+9GzP9u+HQm
         buNA==
X-Forwarded-Encrypted: i=1; AKwUvBzftNwWEL8902Tl0WMeb535acIBjuKu6CKl4lvs8uuXidX3LdZc0UI/4tcJjgUa0DCDIO7JjUPfX0pK/aNpPqEWX1p3@vger.kernel.org
X-Gm-Message-State: AFq9FYLEh+8VF1PZjIWwvKvsn27czx/10oc9u79HSZcmRP0m+TN77nov
	DIyROUHByD3G0wGs3k+UdCKaJMCejyhUEc/NROkr4AhhE6F8feNqd0os
X-Gm-Gg: AYBFou0myr1S9tYRsldZjnBIqIgOLBRjjQYg3yqSHY36aRMbAWdUbZZ7WWnMjGvs3ef
	SmzOlpO/H7jTEJPE7ouuCAyeDlwai2VBFkJzNB5xhTHiVwl/e35W4dM5UWLLthdiWHgjXsNx6fJ
	vj46Lt2NkSwW8KcP1cY6jrB17oQk3qAO8dl+vQYmmwIM956yxYDNo4DtQPLfCgZDyoLbq3mNYyc
	3nChVxexea0hVVzzIfqxEE11ZwoYkbg3CXs3LYdOm4rIumBx7xOq4Fm0bYBfv4cGZ9WPseHYQVK
	aA/snT6IKv8abzD+6aBFlw4meopbi2zT9IPbYf8CCylQ/i06juSX9lxtwWrWmL7nrtK6/0rLluN
	0QFT8ZmwIJTNGMqNvegCjyUBigP8y8KpHwPnDExbOnXAi5Q3s35muLdlWH4nddXmIj21mWpMqKt
	DzMLw24KgBe4+Zye0LbkuhLaLCyyWWIml6w4I6Xg3IcBWBN2OPD3g34ePxqejVFsMppOKmHIVr
X-Received: by 2002:a17:90b:384b:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3ab3a953717mr3582472a91.12.1791727109922;
        Sun, 11 Oct 2026 06:58:29 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm11831648a91.16.2026.10.11.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:58:29 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v10 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Sun, 11 Oct 2026 21:57:46 +0800
Message-ID: <20261011135748.11792-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011135748.11792-1-qby140326@gmail.com>
References: <20261011135748.11792-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a6978d14b975..93a519b96189 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

