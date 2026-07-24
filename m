Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133E4457D7
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911626; cv=none; b=YJMjLn3bf8J/iAMtUfLDa11jQoI5ImYUJ5+9izCj6Az/HMRnIQN0UaAL3gVRFx6H5kiO0wAprJo6PL8SQxlTKzz0ewE1dOlBstkhds4CshIf0pfbaI51qcqVM3h5WYTZsVUZxyqTPBaZ3iu2UwEga1+1YZ9E2QFIyzKT7Kavs9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911626; c=relaxed/simple;
	bh=9NYcmLdbUWrP+mU//pO/mmqOOgJ12dK5s4oIK8p5CTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbYDMKE+HMuu9ZSECMVeLhPqHcGW8YSZEaxb0Tgy/iQDdnA540zFARauM9XFE/aooQMjJ82gkuHNHE5HsPiudm5DekpXHIiOZqO8tVFrNvLGF/BPRlOk7bN70E+0/xj7aYvPlto8sVinO4AIOUnJEflRNPSuEr66U9TqnQ/9FLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKXCZ1Hg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKXCZ1Hg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e507b079dso241964b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911624; x=1785516424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXWL3A5rMUnEz/bSY0B31M4CG2x+3yDzIFpO8mfVO/g=;
        b=YKXCZ1HgtcYariII6zoa/8UO6Tz/vHBoKWTJ7d7XJBhVx5r24ZBlIzzrK7zPPXOTkw
         0DlufLkPARRIkjTfSeIwC5WeO48xZtjBbSTAD5mJsAzKcw1A2NUOjerAqYCHAolmPBC+
         YT0Kd16OuLm4iq4LQjfvPqUkjl6OW6c13xBPUe9Nzoj/ZDSn5uz9rFgZsaMw03iEg3Ms
         klP8G1ZOmnxcNn2zv5Do7MepEgxnBnM8XHHMvPRhqObt6gqDdD4iRHtYlbhuDy4fvA/h
         u3KmX2ATr3nGrVqjVvpVDyqQnyas3MzUCDJO2pxOxssyHvci2PmjxroCwvKQbFwD13+6
         Etsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911624; x=1785516424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXWL3A5rMUnEz/bSY0B31M4CG2x+3yDzIFpO8mfVO/g=;
        b=jS1j0csjhgd2JPCvqlZKze1Zn2TA+LLyaJwqMY9V+InP6vol9Dgg77M7e4cv6aNFN2
         MKqyO2O7TTcYez93mtNeGqEAaRwpvT6MW1Ad8xhl+9CB/JjEeZ2MrvjJdu/Lz9JrzRvm
         SZxborQS4QwB6ijylXw0G5mmPoK5tQcZRk+0cjeqHBepon8S8X0yr/oviMPbMVbOp/Oa
         NrP4gDMwexbP08ELY0ua3OkHxZv7EkCTvtQcP2TaRlJhWY+fOd1VnPmSczuwHipwOhtU
         mYiTBYZS2BmxL44BSH6PmoWsM66ea1vSNmxBoUMf17vzHykWEZih07sEgxj+xAj6psf8
         YdyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyTOZ/6ezldf5CO0YzcJWdwcpPXLYGQl6zxYPw7OPD9IwsqzGDH/Tkt1ndmZvJ5fRJ0sbv0x0wsnU+xYH6e93HwV3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwzIC64LRI6WKwhYGyRXsbP69JDmCBsVLDHuz4YObMqF+Bu0o+4
	o9A0OfJ6r0HgitEtutLnMmy1betSe66ugxokU+QmtMUlvEnYniC3wH8=
X-Gm-Gg: AR+sD11HeFyY56z/LKNOKHzYO/QvW7gmPguuxMPnYVCGENBdkxdwNj56+MX3YOGll5a
	jOjJscZtCgwOYjsVcm1pSU4Ohly5vOLrhB713hRNGn18tWIX8GWc2JtnEpAku6eqkpHuHcaV7M1
	+7V9qh5S++PfvHnv6YtPr4nWSig1VdULQXy/S1d+Ecizp/8zfd8kqe/g44DrSvjCYNKiVa4E3rE
	TfOuTqFILASwsGWulD9ePRXo4cbbGSxQsdSH+yt9si0iUr72Uw+B+io3xC8suRcxIUS2yZugThM
	w9Kg5kLJnr7440H/vycTRVQlf+mPK3Q/zS1psq+KJT8XP6B26RgLREqYqs7HdAHkdGbn5utdk0o
	xF8mPpOuMT4BhewQNmB8ue1L5Oi4fIIrh0h3Lat6oG1OKwe9urF28Lew8JlEv324nP9XyfIOXSg
	/yOmRNVapeQIZEjqzK0+Reb8/ww2zuxrmeXEMkTw==
X-Received: by 2002:a05:6a21:6f0e:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3c44af6dbdemr9141519637.14.1784911624220;
        Fri, 24 Jul 2026 09:47:04 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.60.19.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e29sm918244eec.15.2026.07.24.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:47:03 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add Apple T2 NHI device links
Date: Fri, 24 Jul 2026 12:46:35 -0400
Message-ID: <20260724164641.2239-1-atharvatiwarilinuxdev@gmail.com>
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

Changes in v4:
- Limited TRP check to T2 Icelake systems only
- Optimized has_apple_t2_chip check
- Included pci.h to drivers/thunderbolt/tb.c
- Used __free(pci_dev_put) to avoid label

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

Link to v3:
https://lore.kernel.org/all/20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  treewide: Add a flag to detect the Apple T2 chip
  thunderbolt: Add device links for Apple T2 NHI

 arch/x86/kernel/quirks.c                      | 37 ++++++++++++
 drivers/thunderbolt/tb.c                      | 58 ++++++++++++++++++-
 include/linux/platform_data/x86/apple.h       |  5 ++
 .../platform_certs/keyring_handler.h          |  8 ---
 security/integrity/platform_certs/load_uefi.c | 38 +++---------
 5 files changed, 106 insertions(+), 40 deletions(-)

-- 
2.43.0

