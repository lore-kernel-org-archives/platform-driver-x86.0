Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22613C3F4A
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874917; cv=none; b=kOrpd4vlgeVjPPxTrTA7UOWWA/T6J1kh1zcXi2TQCFVinCV/qzAVTCiAMzRA5Cb+hBDxVrPTXMTMSid5MirBaSiASHphav7qEWELE//42Fe+Vf9dbjRFqsAWaMd0L34OJK/k4WLPzioOf0Q9qEuHdiHSfQYiAhL9UQvS+RrUDlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874917; c=relaxed/simple;
	bh=Ovmya19diuJa8fThJwiSxRQRTCHQqR5ZBDnhXhgDcYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZT01aolG6JfsL/Gbux2HfKtSFnRr3RKC8IuTyESoutB+2rIM5r5dN/1Ll0N58zn4V2L9EAupPk1ITmcnw7e0EagPRhb2xdYGIrSlJ1HJtnAeno1T3BTkEHmpT5B1I6+IrxQcKxyaLchKlZrmo54knuT9z6fCjCj6MaAH4l6/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPT7QnrN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPT7QnrN"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a652535dcso1442727b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786874915; x=1787479715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRr1s5vo5lxVg/PZVIM+bsf+HNxgZ/bwzmlUjnCJ/ns=;
        b=qPT7QnrN/QKU+ssV7KlWPxk4ukykRMDpNrPyw4zjAN5lDT1W61C+fMUnB7JZ8MAWeE
         NXf54wTEs7SksFpIBovR0Q5p6RB1HobhlcInt1CKOP9dfZhDa3yY3Hm6WDhTasPOxD6U
         ZS5OpT7VUl/RYFsqvot14N1447OqZxu4aubRIdb1/M0sKi0RW6wDsP//cheGRl+gj4k9
         W68nVFu/LksOM5J+9svO4yb+X+K0Q6Tmjz9YaRKBheW2GhDtxNG5PGJXtHyhT3gM38pT
         pDYmLFJZ8dISkmGVDarLAfH2S4anTvq80FJrqsBAPv1Bms/43jvrihvUB17Vl+LbHIY5
         7i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786874915; x=1787479715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRr1s5vo5lxVg/PZVIM+bsf+HNxgZ/bwzmlUjnCJ/ns=;
        b=g02/Lpr3mn3unyP/2Z3SpqEdHBx+k9dXLeiPpwiBJUV0fEMAUV6590I6hB9LOVoBOD
         mVu0VA3wMB5PHNiHlDsI/bEWSuoZ58ddMvyTfGdyqCB1b79jIEMlMKrrP1fpiBtCKEsW
         7dzGzyFPD3Uh0+Y5vb8hVX8rvhJJGIG717Noivew6inn7ZrrzK78r/WgMQMn72B8EKDD
         z+ipCu1r6BcVx0aSXbHA9T6Mq9Vk4qmZuIfJly9+a1lrxKMbDic3qTGjX1cG6pzhbJbn
         t6/uvTcEK71+j91BDNhmYDbWwy1Z8I+YN9Qp8vuecuIayV+Mo4eFP/cVkBSj3SmEOwdA
         gQzg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ6e2cQ027/v3+ZosOJWbzUdzKTCT6roiNjD10WIZpb8IRugFo+sljFeMaw1KueQSaFPMjV7/P3H6qmus1v4Km3NwC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wnKcaLhgQ0roKwAgcS5JsnsfuwzQiKgmESql3qRMaZ+44iGP
	bDIqARb+Mtq9+04lGU+2iTtI4TrcoPx2EjvUsrVBoAbV6ZNr0PU9GqmjsKvCAdMG
X-Gm-Gg: AR+sD115iPYKDYSx9xuJfW5x51hmqCd92WCbDRV5oqZKmQIIyurb3iJv7rtjdQdeQg4
	vLvEfgvFlVm7Ym9CDs06Yr/14U2cuPr4g+6rqSpKuH+09+oyB+BWwV5KpaiBfn6QW275Ue6hed7
	y51WkchOvY9wva2KzDr34kYDx3C1YoQCGhAltjShAaModr4188mXooLlpunKj/xWyaZHcftNG3k
	vQ0PJnGruIm5M6Mqx0Lkk3YgkxBuDhWtwialWUVyXjdX8QPPVhvByDyRYKG7hL/jafiH/OOqdIE
	3yNoBd3Vd9y4ygC2fG1/5COSFj+lviYEJxMGycdwhnpbLEfCN9bBG5h0AnztBD0vzpVLEE0kv3J
	F97uGtM0sTxzxSug7kdq240s2aAO27aDYfapqiIwDy2+LbNImnQWP7AWCdQQedoU1OaZS15DsXx
	UcB2aaPStTCH353PALf9RfBIyMD5pQub4W/og=
X-Received: by 2002:a05:6a00:348c:b0:845:c8f9:6ce0 with SMTP id d2e1a72fcca58-84fde2e93eamr19143804b3a.21.1786874914904;
        Sun, 16 Aug 2026 03:08:34 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f15dsm1759601b3a.20.2026.08.16.03.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 03:08:34 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com,
	rahulbheda131313@gmail.com
Subject: [PATCH v5 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Sun, 16 Aug 2026 18:08:07 +0800
Message-ID: <20260816100813.300450-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations are not verified on real hardware, the operations are
reversed from the proprietary software (XiaomiGCommandCenter)

Additionally, this series cleans up the redundant Kconfig/Makefile hooks,
updates the MAINTAINERS entry accordingly, and introduces a newly reported
mic-mute hotkey definition for Redmibooks.

Testing status:
- Fully regression-tested on native Bitland hardware.
- Redmi-specific logic blocks are compile-tested only.
  Feedback from Redmibook hardware owners is highly appreciated.

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table
  platform/x86: bitland-mifs-wmi: Add Redmi laptop support

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 -
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 556 ++++++++++++++++++++----
 drivers/platform/x86/redmi-wmi.c        | 154 -------
 5 files changed, 482 insertions(+), 246 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 967a69120f57273e2ea4396074eceb0daa35a9c4
-- 
2.55.0

