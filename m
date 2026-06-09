Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E93EB0F4
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040399; cv=none; b=MC60iZT4K9t4Cxo3C/OqaMblqGT7BN3K9eIP4zceiOgbxEfZ1o2I6uzTgXJsDYBnO6RKDV6HuzSLB2+nZioPsUu3PSi/FkW6H8D25AQomwqwB0/4xcjOUY4M2n9eZHNLpyfr81N1R9uHOvvWz6lvWvx2fZrTsrf8IqZR1WLF3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040399; c=relaxed/simple;
	bh=GrZ8tOazPW9SnQWsVocelJ/MYUhbTU3LtlAPaUdPJkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDKX2rO3vP8sme/KDe5Uiyjl8YMLeJ5ZmB07FMGG2ymz9SNHmtCK2onBssQ9rIP0JJHKE2omREgyPIe6rqNgHS1pKogSXQaTj5Ioh/w4QRQd+h8+Ue7/KuZkS4RBl/VtaW84ijTvbcWUp3g1t9UZ4geW/O7Q90i+7lyW2kJ/j2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tC/mOr7Y; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tC/mOr7Y"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ce9df31130so93248486d6.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781040397; x=1781645197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PGyVkQun2Q6/N7EX90wofjFAyUVsGOs1ptVfBjZ4YE=;
        b=tC/mOr7YK0vw6tzSTxWX8tSAYUJ7dsLJ9d86z8yBBJw8QfOeGXwRJq8CmjstsvGbh7
         dMfzy6KGfAgD3efMWJeK9fxAjYXWE9MJgWvclWcHisYawayLfurnAOjztSIg7/x8a0L6
         yyCMADPrPChO6PTSz7RSi3oppksKMScaGJNJUyH7wBWgvkbD1Wn0wdoHDra9OjpTxjH+
         bx2Kmhp1dEqf7irI8yyep5IdN3ZJeEWyCoMUdmE1PFPiX/Nz2BDDLQJi1tyGhExTP+sm
         rzD+GdHG7nNmg0/s2E7TGYrFI9ENkj/UxC8oVeNDep6XFUMvhmcaqb18FQYhvvfsZTK9
         LXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040397; x=1781645197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2PGyVkQun2Q6/N7EX90wofjFAyUVsGOs1ptVfBjZ4YE=;
        b=YtYw9l8R24HbwkVjrSuYYXMdpOmUFFG6+FmS8qnc/Jaa6nLNZqAMtRpKZ5zOHlHUVz
         talQniiCpfFb1yQpaAwTG+R/5gw08FRYWGIBeOu4hQuTaQlPRN+paOUAzx7uIyq3G1hn
         1mMplQJVjuGEML7R/2MB1BE4xNCKmOlMWdMORsVDRE8G/v50Px32lGtjTlnVqLGQied0
         xaSHTKrESioE7nFNMEREg4A5j9IxND/4f1lSRALzQV7wMEfGM/SMMS8X+it16IWDqZFM
         5IR+BhH/zronFTF9ZJLwEDPXzxO2IfkrEPOaEEF34sC1vpUHJze+4pAOvLw4kBtEeXJS
         3iPw==
X-Gm-Message-State: AOJu0Yzb+/hLNaKum47yKXdoFxPZiUvDdN2B/swwXsc12mULgZShZlxX
	w0sQ+wLKBwKfr0kDlRyQxXwOX5SRU43kN+uyccAhu+ixfsXm+rVUWNdk5MDRJZ7Y
X-Gm-Gg: Acq92OGCzMzE47d46p2zwW9P6c89pWhOT850eTOds+VoSWI+02F0MHniSgn4/uT5Fkk
	lS3Mp1pAwEKrJR8SVurtT3IXZOFJmFMXwi5n415SVIrQdFsSM4YeeMvMtNwLkoV+/JItNpE9tuc
	Zx1dcl29ZsOzaB0XdBLsDxMTtFCdyM7qcTqZIWQqyr/CjxjQP7vWijrrJTAh2Fyk9uFOihKiKyo
	uof5v2/dASFOhhd/ul7U0uWKxMW7RAnhyzmfeBf2oTBL3DrhJvLoZ/2Heh3dNjZq5kDpviIw/9z
	UVc7y0nvQFHWvlf2kvbjO9kCIaZrHjNPQCk1yNZB6QyslTsxg+NnQiMq/PA6ahRRYRg3DX0ni7J
	MokuCNhwYn3sSa3dPRflK1oA38+0Cf0GxqpCj5jK2O7OtC85bXdEbFgowvEP96ORPZRGI5O0s58
	0Tvc0Id4gcfrfGbuhx78FKLZItG3D753VzDA3JUu4hL5n6BUKR9B6ohG2F8mh9MNu51YGoWjQJ5
	IfkfKs=
X-Received: by 2002:a05:6214:27cb:b0:8b6:1c72:3597 with SMTP id 6a1803df08f44-8cee625fd49mr376004876d6.36.1781040397278;
        Tue, 09 Jun 2026 14:26:37 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdcb3c5sm226713036d6.21.2026.06.09.14.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:26:36 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	mpearson-lenovo@squebb.ca,
	ilpo.jarvinen@linux.intel.com,
	armin.wolf@outlook.de,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v7 0/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Tue,  9 Jun 2026 17:26:29 -0400
Message-ID: <20260609212631.925943-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608215205.678182-1-carvsdriver@gmail.com>
References: <20260608215205.678182-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds keyboard dock detection for the Lenovo Yoga Book 9
14IAH10 and fixes a pre-existing SW_TABLET_MODE conflict that the new
driver exposes.

Patch 1/2 fixes lenovo-ymc: it registers an input node advertising
SW_TABLET_MODE on the Yoga Book 9, but so does patch 2/2.  Userspace
(GNOME) reads SW_TABLET_MODE at login from every input node that
advertises the capability and does not tolerate two such nodes.  The fix
returns -ENODEV in lenovo-ymc probe() for this hardware; the
ymc_ec_trigger EC write is separately gated by a DMI table that already
excludes this machine, so no other functionality is affected.

Patch 2/2 is the keyboard dock driver.

Changes since v6:
- Use wmidev_query_block() in place of deprecated wmidev_block_query().
  Use __free(kfree) to manage the output buffer; simplify the parsing
  to a single length check now that the WMI core handles type conversion.
- Define BKBD_FIELD with GENMASK() and extract the field with FIELD_GET()
  instead of open-coded masking.
- Use guard(mutex) for all lock/unlock pairs.
- Add yb9_kbdock_sync_locked() helper to consolidate the duplicated
  initial-state read pattern in event_probe, block_probe, and resume.
- Add linux/bitfield.h, linux/cleanup.h, linux/slab.h includes.
- Fix comment on struct mutex field; use Context:/Returns: sections in
  the kerneldoc comment for yb9_kbdock_query_locked().

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 +
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/lenovo/Kconfig           |  14 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 317 ++++++++++++++++++
 drivers/platform/x86/lenovo/ymc.c             |  19 +++++++++++++++
 6 files changed, 377 insertions(+)

--
2.54.0

