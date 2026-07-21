Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52A1E22E9
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784612725; cv=none; b=V6ChtigBpU+Fdy/v4iXfgdJcP2J/CDcg6btRXxj2YcyYh6HH3rJ1Ls9yiFq2eNGRoWJyIDpB8AtrocBoz/zf10FmnMldJZ07BucZdZtXdEGJUW+bJsPdOgZ81Blj5SjAX12mz/ugrIQXo2HaEMHIQjdqP/p8ZLR48EzeRZp/MnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784612725; c=relaxed/simple;
	bh=5BhgpjbYv7n6lehcfJMF8RfisXcwZAfesEnS0AHA5bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BulaBwUJS6wjgzl1RRhD0SNZUPOAnd2mUEKXnxeM5ubycAgd757bkZKBRNgopWEdGuyBgRuXZePRIwJrXQ+uJ/af63bdTrp2DsGwVGI1/Z03rBHqjHpUmeG90Ct0XkosTVhOahoMDhGCtzm4YZL9xeHwfrOzcVqogrbAEHGczRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niyH+W0o; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niyH+W0o"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso10043365b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784612724; x=1785217524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUyTzWLCTMDNRWqM9Nwj51oZX76siHgXFAZY7PVYJ6I=;
        b=niyH+W0oCs7obIekqZcREwbib3WeiSvwm9cdmy+o16MBvpn6i7gu+oCxZU7vYi6WZb
         dHhzU31UysT4c6zDiFGBa/7as/1c3sE/oTKayW3DMoBDDOa3pcMowTbuHEFTPagU8Ij9
         yuTZHQKi4krAV1V9eFk9xP/hohACObK+FFZIjmn10SgXKjvjyAMNAbQ38BlLV7BMnP3e
         VgoC2dSKME/17DebW2KKAqUz/KYSNnUPY/8kLGaelyIerLZ6j7YyBgzqlaRXoKsRMJQe
         9JhsieoxbtWpgZkmUZT7jQzGUxhHE2vo49yeHqE37Ex/BwvOP4RaU8yeu9eWWsgRZRd3
         WL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784612724; x=1785217524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUyTzWLCTMDNRWqM9Nwj51oZX76siHgXFAZY7PVYJ6I=;
        b=hq/7GlIcau4Y+I1xklcfe2uLWXYPP88Up/9pROoG7Y22lT5anOgtLM0e5zEmVXZHrv
         ZAkSJ9FE3ePOX/AS0b8ZgTvSr+GyU+nzuNijVs5UomOYUQCloSIyS7zWGofBJM2N4EV0
         bc1DEg3SiB5sZai1zoxzmpRNp+Z9jsEWaYj2aCgBQBRo6L+fQGgkBLNchzpUA+vfd3SZ
         57bO7N1JA6tK2HMIkBf0uyAsP/dm2l/lx54z068/O7/1iiwHQZeYsmd+0L6oK1OxnpdM
         0ol+bL4VNz/QhmUeCYeetEghYftES3s4jW5l2f2pCJEXFzxIJYPeelzT2u2+FhtRTSg9
         jXfA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8IGzb6LN0HDd4iTE/bg3NJ7Q0YsZeHmIFiPDFVR5DjJi/w7UjwaFuOOKzNHLhQRb69GnNIgKzExT+Bka6C+cCBRhD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr1+7zIC9Ixxma4v5iQzV7jlSoBGDd1cjM9BOvP/1EbrGH5YC+
	z66eGInwy9bGdIsh0ygPXbuM2RfHpCdJ8+vebArSRjqJYwuKi8/3kcQ=
X-Gm-Gg: AfdE7cm8zLg3xQM6oIxlknrv/7bzjJld3bvPDGSELEMjc3dE59pnA8znO1HnOylYKA/
	HpMWafnMxW4vPHNUrRKbMQSLrhEEZ/BoPbvtNWqVRIrMjUP87c+ybsa6Q0ZZYr+0JgSKz3G6L87
	RruA+kBWPlGp9bqEdB48+YqoNl2P3RHn7LGMk1HXCo1TtX7At0X1oBSUSRPhTpOY3Fy+MDkKiFx
	lu3OGI1CMsbeDPIKxfkhy4FExkXxGRqkstkazGAtc7SpIlhhVM60OFbh0d5msEnEunmla89b1iL
	HUKWNIMYvzsgYaJQkY7VVGCQ1K+pqqKWMTABmzZPOc6PZwjFzV8mFN8WCdWh/fjRXYvvrlEz6TY
	nwz4xLP7PM2szAa9gJxze+YFtuBz7N6/vQq/5qBrDRowuja6uxoQivEcUHmJdJ8HM78aaf5CPpl
	XR+d9PVW0hOwPbN/ddxBbnLOncDxoXZlpSnjSH9w==
X-Received: by 2002:a05:6a21:3b89:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c3ad64b57emr18830801637.22.1784612723689;
        Mon, 20 Jul 2026 22:45:23 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.60.20.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb770sm46620876eec.16.2026.07.20.22.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:45:21 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add Apple T2 NHI device links
Date: Tue, 21 Jul 2026 01:45:00 -0400
Message-ID: <20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com>
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

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  treewide: Add a flag to detect the Apple T2 chip
  thunderbolt: Add device links for Apple T2 NHI

 arch/x86/kernel/quirks.c                      | 105 ++++++++++++++++++
 drivers/thunderbolt/tb.c                      |  51 ++++++++-
 include/linux/platform_data/x86/apple.h       |   5 +
 security/integrity/platform_certs/load_uefi.c |  38 ++-----
 4 files changed, 168 insertions(+), 31 deletions(-)

-- 
2.43.0

