Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186886;
	b=T/vw1DvHhFM574o4FY9LiRDpOEAqRN/DtzvJc6jYi4yixgsnqiQhiZyzjV6VCj5bPU1v
	 EXd2bEWokrNixxSHmZIZAuu9nGcdBvQbCBvDC+4n/QL7Up5PywAqqZjimHKaKv68gn51i
	 YOeiwv7x9rYwgYNoddLNLnlSDTSeUbHjJCo8vYHoRYmWAgsn44Io1+4YSjC0wrgSGHcCv
	 clgNM7jwMTkQ8iHPa6dtluroT8HOHV6neav0Wxd3qQZv0w4RaOvecvvJcQI1eg6V3ICmR
	 pVlFpedH+yP+ERvrJ6VJNzjmzjl+thZu1W2nqO4obWg5PYcytkU9ng4S2VrzekBo22A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
	b=KXTvVV9Ykr4q74N7vG6T49KT5Rr/T9ASmIOHNzbM1yO/3zyD+a8X48q4rg2NTvDqgBwL
	 3dXFg5uwum0VTHshcNFuOjbRaxd8ZYtEa2uii91gskltfBokoLDzvVIkF+qyexesI2s9v
	 Jpd76tUyAebV03YMwCvMBmsza07oTjan1d/3Qi50ai7NMXftLSSKKB7WGKkxql3XnhdJk
	 UZ3ajYTiJE2rdAHW4o7IB2upL4A0MQviz/2OmokjnEQkxPYJLQfMEMNuOEuk8i+ZzKOcL
	 NbqJK9k+2C8qiVurbAfMHx+GFhR49lkLHjQD0/9ngO+C8IAUH03ABr10ugG0bXKJpBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pHF4cm/G";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CC606A31A
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHF4cm/G
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e831e86ebfso4787365ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186886; x=1793791686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=pHF4cm/Gtj35Vl/HJPbHyddiIIeIKyQtkvmg8Yz/kw3scBHhEbCLLbaiZevtUNMcfw
         7ckAt/0xynwqqrjNNzojtSMyZqrHq9DP5tP0/Lbmp0ihkMOrng3hiGkb2gq1EAhaXgO0
         FLCuVutUGqbm5G9Kuw8t6pgX5uFcW4v39J7lIn7qVnejyhzyonApnoyVuVC023oUwmuC
         oaZI1CkndmSSxTy3yQfCVv4lyaCATaTUVcfhsygygf3H94O3y3LfFUzjEy/uSdNOtnWX
         CFVfI6bYnTxyrP1fVSXgGAAx96a94P5+DLTYca8EBc77phaqvNsWqnl/KENso28W1PpK
         /Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186886; x=1793791686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=NjJLjNCDtNz4ApjGtKQ1HvOScjJg6F0Y31v2uKLpJbZZG3dP3bzajRRGOKukWTlBI3
         CBL79nA4/KwC+aJg+N9LBwbanuEYya4kUaWQhEP6pddnSSrdMyw7vxpfxNJERgoldsLe
         y2Y8Uy4C2x/Or5ZA4Fz0LDNmFZMRuerlCB+oPvXHoDTox4Azmt6PHudmaXbb2ovTLcQw
         89q3ybtLIH1v2JINdi7Pipas0TtKtcRwTBt0XsoxXdZ8je12hPBtQ7XFvCH4CYC3x2co
         96REC2MDIW/73revQZSAyK6md6W2edMmyRmQZGZQbrm3rO75T1+YN107fGSr3pPselQT
         p5Dg==
X-Forwarded-Encrypted: i=1; AKwUvByHpG8RHVDsTeJC9qpZRipep9auTg6+IEaWJGszPdd3/6b1Pw+3m4U36sFk2x37qJZAcPdY0AOvwDkOUNsXM+A9ozfy@vger.kernel.org
X-Gm-Message-State: AFq9FYL51ly9p/BwvqEewcQWy1u1eJtBkXeiaCAzGlRjpOpNc3V06hey
	C9NnGf5eSVwWYSmBkGhw270gkePL17uB6zn8qEmCXRK/eFyb2V377wg+5FXB9+EI
X-Gm-Gg: AYBFou1gehjxcX3ucB/jYKxKDrzpNLe13E66Jzb/7goR6UjSCollm3RPa8ntLN82W8r
	uoswURa4k36BVZXUzDMONcUYpBzjAyhCMlfnWBVMfWghgmHvCKgxBKC1TYfRKI0lb2C5uXQYJG3
	oFGbtybiLHLSU9rl+87Zmgyp/vK53+s/KvrKAWRP+p1+lpa5jSNq2pymqOxpy0H8CJXEoLh+uFR
	bMEU6Lyy5NWsCDWbPB7BwiLKsUop5pLhvgN8p18xuaC4nn+Ucv0GJlS1RljC6CzLqRQqM5qsW5/
	d/Rq0nkijLUaSzmO9V/EI2krmhlKoFqRiTSyq9dX4XYwtXQhxfL5wEjxC0/w3ZjjALFV3F8Gj/F
	RiwDkT3EaAvWu+NTUO+407+9R5Y5sYT/IQ767/skwh92S7YCgjA4iMbyl5jIRUVfV1SDSpfwper
	/PwCC+Ul7PM27bndIlj2hCMjjDE+zpUm6as0r4gGB3K2wYqsF+bWsIRcgj35XbRLd7Kjz3xgxhB
	6EA2JQuDLoZwSSBkExTYz6sPsJRTAKp2JpIic5sEH+hQd4YA2ze856VzdZxEqBoUWfsA8V8al0a
	r1Nwlnzokp0=
X-Received: by 2002:a17:903:3d0f:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2eb00338be7mr18248175ad.16.1793186885470;
        Wed, 28 Oct 2026 04:28:05 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:04 -0700 (PDT)
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
Subject: [PATCH v15 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Wed, 28 Oct 2026 11:27:37 +0000
Message-ID: <20261028112742.674847-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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

