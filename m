Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219781;
	b=AB97GzDzbxCEIgj8+fKlCZVKiacEfVVdhPaT4h+tjMr+fXqtL26qPDwsPXg2SXy+qutt
	 +WKRnHlgMJv1U4uMUMM9W6h5mO+xFyFfMQ3uYmP2YhN9UcfMJ0KDAxmxFA8N9doXka8fd
	 rgjFkQqIzPPdkA2RBmvCTkMFSQ2rS4qgD+0dktQAk6K4GlSq1JLgkLmkRy39LKq9wbF05
	 CYlhekIELE5uTaFtL5W6e48Wims3OOfNQdfar2HV87jHaypsXTXR8OWgVf2WPtPGaUzl8
	 1QPiK/KPWyL6YXfK9smPWBnmEr0AxaLPW6/Iwpwse+OvSxNOz+lRbGUZfJ0dzyHF7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iEQX1pAJ7wtjY2/7daAaqxt4QQCiCe/GT1MXA+6yeBA=;
	b=LBY0/LimFhASZ+R2sIH9r2MXI8WtS8lB9YhXCccQ3rNku8dF5kXur09PCWLjXZ5ZwlIm
	 Jb2X2kP87bf4CLArVnyxT+FxME43/I/rFzsM+lpePssCirL4+guKkg98nJ45xb15XsK3o
	 Bs1/JjMNwUQ9ISTWKgvCfegI/RPEeifYQViC3wHax2LMBGAuLX9O4ZcjPTQ7AX7ddl3ug
	 cwhUL2ov0IVaI9iqEXp288WKw5jlZ570fwghQ1u8dXWz79Pl950QOnLJ8gnHp6i9p3udf
	 xwoly8Q59ciMyNlHW7sQNcf/1rP2P4W7frk7oM2R/mpmrd+D7uXbuCqljVL4wqH9VhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRPohT2H;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650DB60A260C
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 00:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650DB60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRPohT2H
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so1109842a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219780; x=1795824580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEQX1pAJ7wtjY2/7daAaqxt4QQCiCe/GT1MXA+6yeBA=;
        b=MRPohT2Hi7L9tT3edEUMdEHRH8uVyTlfpl1y8J1khVVswjkzvdcBSDNWQCF4sD3JHO
         rATq1hmaMEoyMQj91ulv17dbBhnzMldAstC/89kbCIiVjbCIlhiEDxghw/G8DwhwThVf
         erGDiNUKxs5bUvX2YW+Umo5wPHPJIRsu4Dd6Gzy1rRbd/nLZrMG2c1wY4SrpBn9hegix
         71JFn7i8WkKEF6X+m/CzmZggZPmVW3eAmAPIab7MxSu/Ulag+n7g+FFf/hFhvipgLeON
         Rqqdm0ACyOfGxjUJzE6jYGhkeODWbM62m+nm11h3gRzHfhFK1NWYGf3k53ZBskplDj2y
         5a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219780; x=1795824580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEQX1pAJ7wtjY2/7daAaqxt4QQCiCe/GT1MXA+6yeBA=;
        b=hm/U6K0PC00sH5xgfK83z70pvjYodrAMPGn+qxkd5nrL2lr36M/4kX4T4Ne4r9GXAL
         oBcAOwcNSoNYaBX1uZRv6SYTL7NifczpoRAf1aLRKrkAfhMUQqAtzUfLANNCI0ilWgya
         HMq0ZbR9SmG1kBp3CRaKVVdvIWfP+0qgszZVH6hxWa18ZkflaD3cXkdeBPuPXDKIzNDx
         Oe0CYNwLA1N3BeKbrEEb4EIwA3hNKcdZAZYbCh5wbbIb3NTx304PexzlU9i6vW3fusRC
         HQhEzBkcYGy5QKX3qkh69d58z95OrD9k6ZFIRkCPsBI3VeM8JPJjEA2L71qFjCaS+f3g
         hOPQ==
X-Gm-Message-State: APuU4Z/+FwjaMOq3ZSP79XQBrjhQx65ZBPNXj3o8wvWARW/taq2NMOb8
	WJVWlIN1iXhD/3N0LPKOmw1t/sg1khA3dRmUy1N2IFImuPHwD2rYyRrf
X-Gm-Gg: AZFdTZdzDGc30wHBiC3ZukBWt8hQjqLa26unDJyzm/0Tc+B0ckwE34Hc6z8GMYfu/T6
	TMfMSzJcx1KuWy6zRxr9lGLaZECm2eWtY1ORLdHU1OLGQY6EbBH10rR/da/f7uwz38Koi+IN4al
	Wfi4gcpwR72tzitCL0QFXk/Xg+Hkp+OtRsbM4105jau1djgtsErB2J2liPx8J7zGqiXJAih3j7W
	Uk7vgZJ1o3j8FGzQ+HWytsZh66jRTCBC7EMblvskj+gqf6cJqQKWSM91VYZBnAFyHCanEUzcAoO
	bxTouwmI4IF3+cvtTNAT9zD0R+sva93b2Tu1hFETBwvaBip1vJds0PIsDjkx3rOjUAiQbHses2F
	RMGEnw1FFlfYnHwYzNxHQ41aezmBbUT8G3ljc6knKBwvtmml1ZQwSlhihBldYRX++QqTh39Jgi9
	EpLB0zDYo+HM9u4CFah5IDAWQ0Kk8LnP2ibJ8mPd7E8Y26R/qMS8etIGatzvBMQymXRVpIuu8ic
	dTGWzCfNFZS+QN0l6D/c1D4bbZyE2H4JsUhvSIyvj/t30rRd1TEohxD6I318AWWsONZMABqEgWV
	OlPXm9JjKCNyIxMWGvMEcaNxF++GDAsUe1Vzm/u/g8CXlPDHBAMfyngoLfISQUopzbVJ/RGXz6a
	+KwctmXgI3F+T4vNHF0KX7Gb+rSO0JMBcLLED9457uwGt5VV2Lwc6sFbsSDQMHvsQzbxoGlsOjW
	wIwQ==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:ffb2:6ae3 with SMTP id 98e67ed59e1d1-3b41c902f49mr4198463a91.32.1795219779657;
        Fri, 20 Nov 2026 16:09:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Fri, 20 Nov 2026 16:09:28 -0800
Message-ID: <cover.1795219225.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed as unsigned into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
   (v1 of patch 1; v2 is compile-tested only)
 - charge_control_end_threshold rejects -1 and 101, accepts 85
The kbd_get_state() failure path of patch 2 was not triggered.

Changes in v2:
 - patch 1: convert to a u64 seconds value instead of failing
   check_mul_overflow() on the int, so the unit selection below works
   on the full value; retitled (review feedback)
 - patch 2: don't fail kbd_init_info() when kbd_get_state() fails;
   fall back to level 0 / off mode so the existing code picks sane
   defaults (review feedback)
v1: https://lore.kernel.org/r/cover.1794633179.git.rosenp@gmail.com


Rosen Penev (3):
  platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Parse the charge end threshold as an int

 drivers/platform/x86/dell/dell-laptop.c | 47 +++++++++++++++----------
 1 file changed, 29 insertions(+), 18 deletions(-)

-- 
2.56.1

