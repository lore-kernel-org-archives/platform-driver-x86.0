Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECF3439347
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615670; cv=none; b=HSfb9jXXyp3aU2WKv1l/5AdSu9E/DQLG2PNnPRiNncs1RljG0atj4URRCTUuNewGlhPmm0Ajmg2zQXtvaNZ1nX8NGrylmFuEP2NkK3xKea0sTYPqmNu2uF1eXkBf1KzR6VNOUcBft3Ubg7J1OtnkrlJrM1NA5/vOMmjY5BvewD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615670; c=relaxed/simple;
	bh=CuR5q0hG/ysY6cDljY7+7vdeuayA1M3MknJPwWSlmnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7uc80KZFVfi5zS/zeKSz5izT7Q0OWJBkhMs1jrrhGG8x+jq5DQNwV7wUVYpGEwEtEE/xblpiHLwLgCwmbIxYwNLNAaKHRchzmjGGjN91MH0BlxECV+CRlkIogKSLEPJ9eiUIlR4A+cuubCYBeGd73UhoajEwlO0pKamwCDGeEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbhARNiu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbhARNiu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so98328735ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784615666; x=1785220466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qpio1MA//9AANLCzTxy+rZBs26K9YsY9hJV884pqdVI=;
        b=QbhARNiuqzABgVH5uyyQxIQ6PqIS2awdcowz7+cYZWFgLmQCMzKDQUg+QLptRpDDF9
         /F5s7QE88eK8nGgCs5LYEvSo3VCotaBu2q3TbsmErsIveUeOLHlOf2jz+1EwT+ebalD7
         8+jMhAJmnNfsmfHUng1HKScAIFjh4Imis6WNztTjzXcRTrdYfGMSJoHTFFCgefrBMuDr
         UnshuyjcvR10IEWyAWYHSOwD44aCLOjD/ky8zhfC/PKAQScSB1auM23jaj/rBEGNkq1b
         F4NbJHTr/RO8x5VN54YJOtpJjRha/MvSqmSwbe6aM0SdpAoamurIJSXaqygvi/ca8y4J
         r4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615666; x=1785220466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qpio1MA//9AANLCzTxy+rZBs26K9YsY9hJV884pqdVI=;
        b=FJ7MdSKN9ACJhqQTDjXAkUz4R5MbALSN1CVjYusv1zQe2yv22DMpnsGJlexE2Onf8R
         1YWxYUcHj8B9kODNQcZzom8XLOn5GXehZMvt4Z36fdQWTqSI0vqrgNFqc6UXgMhirqkK
         NWnyhG9nEV6GNvqaU32GWrkTg6dKKFeBYtxb3buVxN7rG5Eyzj8xE+Ebv6LicotALnqx
         zRVN0J8pviSpcqg9PO48aPQLjGN+QDqeSJG1Q0+C1RiOjGS/cJozen6eKHzWsPxZWfuD
         DQSHcX6vxLD2fFXW+EvKtGAzXe0Vqbcyuwi1KzqXzIB2N/UL7jB3Fttnos9VLofK2pAr
         4exQ==
X-Forwarded-Encrypted: i=1; AHgh+RpepCkgW8iCFIQjS82vFzmf+CkPBm4/Wp5BHAeFSbGRE0DmwvkSakrAarGry9Xs1YihN0NGSI56PHSnSY1P9Pd+zbpA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/cdeuKwUfKadM9sRcTj4STFkKPUza9Z9HKsUX6sT+hzqQ4Cz
	GEkoGE8wRI0NFgiZxH5ETsLjAoBvkG9Scd/smZtGKm3fKRLrwx6MaQQ=
X-Gm-Gg: AR+sD10BmHPkBSvi8BC+6l813q48G2n4AIgysXbjUQXk+bBvTuOFQf/XD8D20mJ6UV6
	OTxOT2VSP8IMmOhvPnoCX/RdYJSgDni/a7bMQZRV/LeMdg/xC02aIrqHSYiEtdwsBRfgMyp0rEw
	2aDCSEotkWJ+xwfW/9b+NP1UEotU7yz8e4dzyY3JVxWm2ymEg1JTKi/eLRLPuTKzcwXXxELky+1
	kY1kOB+Ye4rNlhwNevX5we+fL9xaxw2KOv9Jkp3p+9w+k+qqpntP0KiiPvxCVWLAb1FbdKmEF/2
	qhMqDEwIYjY1DkIIvM9aHKt7uGsdUZ2wY5/DtbHAjPX4JHDyTL9cv9uHSLeTqCtdN0VWkUt2Fy/
	eDeLyKcnuh5g1u4SCn1cX4dH89GFC2OUP8cfO50q9SepYYecA765VXN+eUIyiParFANb3krtlD2
	a3tIOm9CxMZu9wnHxnVTlbjVuAxBS1FX/E8zjDfEoiwaHk0KQA
X-Received: by 2002:a17:902:ce87:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2cf34895290mr177684225ad.7.1784615665937;
        Mon, 20 Jul 2026 23:34:25 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.60.20.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm73608386eec.21.2026.07.20.23.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:34:25 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v3 0/2] Add Apple T2 NHI device links
Date: Tue, 21 Jul 2026 02:34:05 -0400
Message-ID: <20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a cached flag to detect Apple T2 systems, then uses it
to create device links for the Thunderbolt NHI.

Changes in v3:
- Fix build errors with non-x86 machines
- Used __initconst for apple_t2_devices
- Removed UEFI_QUIRK_SKIP_CERT as its unused now
- Used IS_ENABLED(CONFIG_ACPI) in tb_apple_add_links for the T2 part
- Removed !bid check to remove warning with -Waddress

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  treewide: Add a flag to detect the Apple T2 chip
  thunderbolt: Add device links for Apple T2 NHI

 arch/x86/kernel/quirks.c                      | 105 ++++++++++++++++++
 drivers/thunderbolt/tb.c                      |  51 ++++++++-
 include/linux/platform_data/x86/apple.h       |   5 +
 .../platform_certs/keyring_handler.h          |   8 --
 security/integrity/platform_certs/load_uefi.c |  38 ++-----
 5 files changed, 168 insertions(+), 39 deletions(-)

-- 
2.43.0

