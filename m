Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645083;
	b=KiX6AtZNBF0XmnDkC0uXdnwK4Tjr6ZeUaqtmDDRONKago3cAA2ym8KlhgNFv5FSldVKE
	 0UfZPF1sYVoWCLvSRMbTBX2vJHXwsP4UObB8m4rGSFotKKVtvbZzg0hjpzrYKoLKqNaKp
	 1XZQnyuyf4UrCNm6n34Y7Cq7vY8opwZZdN2tnj8Me/cDCZcpXdRn5S4JjVEzasc8m3Uy1
	 zh26h3uVLSMuBrbnIQsDCQtVpugOPeZ/WtnUcNgpDkJyVlXMU9iChgZAlhQr92cl8J3Sv
	 Quo/cf6nbCf0zDH3Vpx4/DOQfbGVgSqbKESfHWKaXGd70o+xpRFNum4tOYun2TnG96Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
	b=sevfsNVNX6NOX9RAlvSdrZ+1XUJH1boWOxGyYWU1lRsOAtxcw+ssVJjQcNrJblH3Qalz
	 3L7WI0Ny3FqkJw1hr2q7xmJHi5XZbzwPphX+IBxFhFfyaeM95CBagUmwLs2OfzW79nl25
	 lK9mqHCDH79YV3LohWaRu7JIFbWb2/0HK1R8n8wbxpiVAR1Z7dJPhBrH8N6PMe3zdjWEi
	 aMgZCFR3EpqU3qrCuHiWIJDSEaFE0IcADtc/nb63NeyQEd8LPxGdQrSxLcVaBFsrDK543
	 xlE1oR/QLqjpznqPFB2kuuwlX7VoleAkaaKKANj0V2G5vtR5DPnkD3nDWvtWyuS9KUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZxGGnum;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EDC606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 22:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EDC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZxGGnum
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c71feeeaso2689028eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645082; x=1796249882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
        b=fZxGGnumQ471hrV6MSOZ544ePTSYpR3Lpx1xjQjLGbLFi+CyEjoihhTrNFOnsUregf
         PC9dfmFaXIseGu4FIHQknJd41iX+Pfjh+pVEa9givyLuAaa/QLXg6hZjapJd29+5FKQd
         SeINeDM6vBzGE5p3mXaJRacxB7gjH+HgroTijO5ZiWPRCJUlOnihF9TN/DA2gQWygDHo
         Dhm817XIYFjIozAp7hurJ/G7vqVyV55MLsjBP0W7ANa0kSpDD+CCgM3lZTXbkR41rR10
         SGVpyeLQ678n98ApzY4dBaVcEPR4K6Ndqn6Qo6ZXJXg/iFEXXgD7UhMPSDkDWcAGwMTd
         bJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645082; x=1796249882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
        b=Q+miaGf32r59N4D9ZuiSQ465R15w8dlZgkcW6Lf3b3lR/vY+U+HSTIqcPW8/bQUqn3
         H9q2ln31Fp01bFtbd9jbyk2TMiQKDH3qaY/W9sUo8xW3O7Ozjfq8jP+8IHdcRfuJ4+8h
         F23vV2xJjb/Rsvtp3b1ph/BMOfJTp7tT6uJgowDYF4AGS9r61rj01I2tppnD4zADLR1Y
         NCkGRGwdWfscUVoMCWK1CJO5+iqHiZcjsOI3mWtZwPq5zKheTIdnPBOgiqqdNTwaSYGN
         oV8u5O9o/1KS7m2B+sxO8YNzpSNjpelyWsYqeU7XPgEcTnV+0d60zEsHldr2Tg4wTdmO
         +DAQ==
X-Forwarded-Encrypted: i=1; AL+hErGHpLOTyaqn6ehCEsRpqRpA/M/4wtJHc+XaDYZoAgwkTLZUOxcdtsv8scBZ4nDLX8kDjzhJv1q+Hxgwsq6Lh08cKnmF@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ud+ezfcKQspHhUf/Kdi4Wu48rsmxK8JHnIkUuFIavbCbSzd0
	CgkljkhPRY30ynZN9RnofwPtvkPqPXChpH8hchqFakMouERArNk+/nK2
X-Gm-Gg: AZFdTZevtm0BKY2GVlZecSqGw56Si5Y6IAsmu87B1vGkklcaJOCszHUcKnq+UaQ7NIS
	rro38toSz+rPktbcF9SItyvMaQ7A6Me8CDup4n2PnXbmuesi4wxI2VK6QrgXdt4MSOn6CwG+KRy
	kky8/wZ4YdCVSi+vV7gSXzpg4QjxSIVeFL34mo5B4mnDJcnJDShrCbmCoiSRCbv14pdozUR+rQf
	jyqsqXqhrLZfFY87oU5dQYNC91nXZ4iZ5SALOOulm23ZDUtqO71kIn+4ZOARUVoxCrvFWssZpFi
	4P9EpgrikSU2czxGRcraPwt7aZowgrkQqWdpREOHkFLaOIGO1gVYVnfNeI7JWQh4C0qTndvPNe3
	j3oOtac7xAZYTqRy+Pjb3sdVEzRX2ZgeqYKANpNR7t2GgO/GqR4FX02VLd1iRsTcrmkpGNbrffg
	k/Dgx7i/YZkXrjZwtykoLxbQHtcl6mX+QR4i49tPI6NAyw8VawQAg/aq6W/jIREqsWZGwvH3COa
	qXidb+BD0wB1N421IMcmdGZ05XigzZSxLS1ebkO6M1RQxDMjuXtbHzy6Z1nbJw5chS6X9St3cJv
	qAV1nEB7oE5ShbD2ljev
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id 5a478bee46e88-386b8963d3amr8931010eec.35.1795645082138;
        Wed, 25 Nov 2026 14:18:02 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:01 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 0/3] docs: ABI: report a symbol that one file describes twice
Date: Wed, 25 Nov 2026 22:17:55 +0000
Message-ID: <20261125221758.2535044-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

check_issues() compares a symbol across files, but it skips the case
where one file describes the same symbol twice: the loop returns as
soon as the symbol has one file.  The ABI parser keys every entry on
its own, so a repeated symbol on one file is visible as two entries
that point at the same file.  Compare at that level.

Doing so surfaces two entries that claim the same ABI:

  - shutdown_unlock in sysfs-driver-mlxreg-io, described once in the
    October 2021 block and again in May 2025 with a different default;
  - the internal MCU protocol_version in sysfs-driver-hid-lenovo-go,
    whose entry carries right_handle/, the group the removable
    controller lives in.

The two documentation fixes come first, so the tree does not gain
warnings in the middle of the series, and the checker is added last.

Four symbols are described by two files each.  That is legitimate when
two drivers expose an attribute with the same name for different
devices, as hid-lenovo-go and hid-lenovo-go-s do, so the cross-file
case keeps being reported, but as information rather than as a
warning.

The first version was posted on 2026-11-25:

https://lore.kernel.org/all/20261125190742.2420486-1-takano32@gmail.com/

This version points the internal MCU entry at the top-level attribute,
which is where sysfs_create_groups() puts it since mcu_attr_group has
no name, and the checker keeps its warning for an entry that ends up
without a file, counts lines rather than occurrences, and drops an
unused loop key.

An AI coding assistant found the two duplicate entries and drafted the
checker.  The counts above come from running get_abi.py validate
before and after; the paths and the group were read from the driver,
not from the document being fixed.

TAKANO Mitsuhiro (3):
  docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
  docs: ABI: hid-lenovo-go: Point one entry at the top-level attribute
  docs: python: abi_parser: Detect a symbol repeated on one file

 .../ABI/stable/sysfs-driver-mlxreg-io         | 12 -----
 .../ABI/testing/sysfs-driver-hid-lenovo-go    |  2 +-
 tools/lib/python/abi/abi_parser.py            | 48 ++++++++++++-------
 3 files changed, 33 insertions(+), 29 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

