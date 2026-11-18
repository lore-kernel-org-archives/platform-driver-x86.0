Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974206;
	b=oLTvXaurqsqlFBksQs1OJ+wd71k4+r1xhKvRnyODc2Bw40wpfl6hcjuiQfiT/AoZYEdV
	 JMhORXrnMGXXvXIDVdITX2RwKxnPVNCmTT/kKUt7MlAfuZbUO3NvY7xWPtsSnLFHu8qms
	 sWp1RxpPvCKe4aUvF3ZanKdgsAkeCMAzYaIcIbWNVOr0thtYj+OAX/14+kgE29fhWTlHb
	 ZXoCVG9eENSQDDLakQus60o3/NCjZ6URksQiu0aYPQyleyxJZQY28QvtoeAR9LI7Yq+eH
	 bAZlAwVXMrRDv6S4Yak14UmqfFC9EhV1l7Aum0J+AhoRSdha+4kpGxm5eR15gcgzLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ae9bwOWGcO98bar8k0caB+5myseA2kptk5uaDrLazE4=;
	b=DnXIA7sJE5CYWsvom19ahlAV0F/FzVTCqwGR5awrjkrgS+v2QMRR4s+vLQnK8apQ2S34
	 gqNTKp0i9vXzzoraErVULLijbbOcnnWdQeYm6kLDo/+acpFopfXB69yvd0B0e44rRQHux
	 TpLIUgr2/vQEId8aZk4wUHC5Ljrd7ORczb84OQxaoMpWVs4SkYdXhKRpPTUvTYEdr+7Kw
	 GtICELQ4k7VENTdUcvfEyixLyKyHaQOWSmVvC0cgnqZybST/88dx/T26UPlwBluMEe7fa
	 c/dbsxMOyroQ486f1OwQjw+xd1gM7FV9HVxjOabXGkFI6SI2UisCGsQbJQKK8XBuFwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpclxAqK;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BE0606A325
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 03:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BE0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpclxAqK
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so284691a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 19:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974205; x=1795579005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ae9bwOWGcO98bar8k0caB+5myseA2kptk5uaDrLazE4=;
        b=wpclxAqKthTZNtOQhABEJIoTLZR+VQjBuL1M0YcglSTP544nVA96iXx5Edd9Nh2Irg
         GAikLj8kB5lXHtETw70Hcjl+MTvfbz0XgXAEaHTmDanRJqhKUSYageq6eDj3x954SsRC
         pqOCBjebVS2OgsJ5LbkB7r+astxaUgUMw7L49XpZPDZ9CCyT1wT+LKhPg0pvBiFeNQj+
         dHzrF2DsS7xgBJZ4BA+HIMDOjrzushS0Ms00SUK8XifNHzbbb3ZKeQspspwcOoB+FjSV
         T8XhbXis3lxbYAakgEuaRneANddd8lex4oEqXKyoNiOSLuHP7nhc2t5GnOaaEhniVhuv
         tVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974205; x=1795579005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ae9bwOWGcO98bar8k0caB+5myseA2kptk5uaDrLazE4=;
        b=ao21lVlLg1XW888f3wyKTSuXa5t+WmrjeHQntQHZypxPI9GNh6TLL6JdccjHIYOr0M
         nF/o5FtATtv6ak8k0KvJnNk9E1iNH84uqEkbxGtFhcGKXgNXuWinZoaORueDOpucezCM
         p/K/7Cm545/dJc005doc4f/CIHwhYFCgad5+hgxcxagraNplC4DOsNLoEKsS3HBMXzF8
         Qf0aPfqCSE88hjRXVfajoq+13sstl+8Vo6on5ghGJC9G/isb/y6bY2goVA64EWneR5Ab
         n3FCf1tKl5XLmQIELL+CL9qnxtB+qsNktw5xjK7F3gtJ6uJjzZwCzdrrSwbjWTxKvpFz
         ctsg==
X-Gm-Message-State: APuU4Z+w663K+ysWSh8mTFJVBXtH0MJ2Mva47gxTxWE4RNOTFMVYs2f5
	NaGeSXMsim/bDsWOoWTGrZEeXZXmikdBQoy6oWwfV/ZczjK6Z7VO0cFH
X-Gm-Gg: AZFdTZftE8IMsL+gKsW/vfoDsYe/Xfn0lJrR+TnrY0SmIk+iecEojT1qvY9+iTcYQOP
	9JFrK/PPVli3uwgRMLCq8lpV/JbVBpJv1MVFAOlYawOzNlQK8aDPulRMPVTuJuv8EUEx1Ou8mEx
	rN3AKdmjg5nWwbnwSnHJKw8NdUE3sIh35VXFlAArapz7wsUiox+cganhfAeOUJRi5mIkzfRTRwn
	riu1fZBPhBRepzjQxYOiob77ayiyXeIPDmZKeGDivG3oThGWJYXLab6DfMk37jiXJeTAvgIuKAk
	jM1mr5v/S7iPgsaz4O7VyMJrg9gUp8ZSYHrBgruOjqqIOuDg7AOS/g4Nm9bCLVWxnEP1giGfozH
	UzU5b7FqQcSSApSuLAgvPxzoi+BijnyLel+tCqfavUMSWDBkGgT786RaqkhTKXkLyWKY7kAicMR
	kTxSzgv1BdCvGG98zhpcmx8wMN/vZxyHH4bfXNA1JiJkNoL+Z/p6Av/bAUCS/VhGHK3G0JN/J97
	e8mRDKmPdNav6ObmR+VaOBBK3iEMOD6eYvZXdAsDqagXLEUHrqAn0gIkjOiUzlnWB/QrAxuZaQG
	mUzMBWSCmdQWp/dcgKCWghdyYDeAZ+c0Sf+6gf9HlFVrfFqkmjJG1OHyHgC1IEaZ8knhGYENHF7
	8kA06K9TQNUc3rmKS4SdMPH/ielbBf0K1TUeq6EsFlK1p3DzRos6vxZbKEOKbVYtTxvaDNdnMhM
	EkwI5RPe4fGzrdOFl+LONws/8=
X-Received: by 2002:a17:90b:4fc1:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b3d0645d36mr1381673a91.9.1794974205267;
        Tue, 17 Nov 2026 19:56:45 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm598227a91.0.2026.11.17.19.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:56:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/4] platform/x86: dell: dcdbas: Fix SMI completion wait and buffer handling
Date: Tue, 17 Nov 2026 19:56:34 -0800
Message-ID: <20261118035638.11773-1-rosenp@gmail.com>
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

Fixes for dcdbas.

Patch 1 fixes the host control SMI wait for types 2 and 3, which the
compiler removed entirely because the status was a plain memory read,
and converts the type 1 wait along with it. Patches 2 and 3 fix the SMI
buffer lifetime on unbind and module removal. Patch 4 hardens the
validation of the firmware-provided WSMT buffer description.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
the driver probes, and growing smi_data_buf_size and then unloading and
reloading dcdbas with dell-smbios on top is clean, with the buffer freed
on remove. The host control SMI (only used at power-off) and the WSMT
paths were not exercised.

Changes in v3:
- Patch 1: use readx_poll_timeout_atomic() instead of
  read_poll_timeout_atomic().
- v2: https://lore.kernel.org/platform-driver-x86/cover.1794861287.git.rosenp@gmail.com/

Changes in v2:
- Squash the type 1 read_poll_timeout_atomic() conversion (v1 patch 5)
  into patch 1, so both waits in host_control_smi() change at once.
- Patch 1: include iopoll.h instead of io.h, and return the error from
  read_poll_timeout_atomic() (-ETIMEDOUT) instead of -ETIME.
- Patch 2: add a Fixes tag.
- Patch 3: make the dcdbas_release_buffer() comment a plain comment
  instead of malformed kernel-doc.
- Patch 4: the problems were found by code reading, so drop the Fixes
  tags and describe the patch as hardening; reject remap_size < 8
  instead of <= 8, as an 8 byte mapping just gives an empty buffer.
- v1: https://lore.kernel.org/platform-driver-x86/cover.1794633178.git.rosenp@gmail.com/

Rosen Penev (4):
  platform/x86: dell: dcdbas: Actually wait for the host control SMI
  platform/x86: dell: dcdbas: Suppress bind attributes of the platform
    driver
  platform/x86: dell: dcdbas: Release the SMI buffer in remove
  platform/x86: dell: dcdbas: Validate the WSMT buffer description

 drivers/platform/x86/dell/dcdbas.c | 80 ++++++++++++++++++------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 48 insertions(+), 33 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.1

