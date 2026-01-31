Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695C025B31D
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Jan 2026 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824884; cv=none; b=Yr1VVRRHcWgjDjJlVHlBJGTu0EmcjVwLMSofHAiiCd2uRKWQwzJg48CESG9pAkBQ0HcPrUT3Qiu7OeqCS8Pq9Lrjlv4jjiRlR8E7klRFpOzJKnf5cgVb40U6VL4eC3ugrl7jkKc0MpwlJAIQJKNE59C3u27oGFecXvEjKCaGAYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824884; c=relaxed/simple;
	bh=rwTcSQeFvX1zkhtTyeX1m8gHB0g7eKKnfzpxj5vnEv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeTjIvmydtmyeTqQX++1+gFo2CnMOwKMt8jO5oIvg7jaroUgc8ZNoln7GwModC88LPRGRsVu0XPgj0jJMAANGeTaq7rrwnPk4t3+URT+GUwojtdxJP00ds0T/GA7xGBVDX2gR5FidPvgpe0wjfICAZCoUUiTH0WL8cbAH9vw5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2X7HKTH; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2X7HKTH"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-124566b6693so2773704c88.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jan 2026 18:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824882; x=1770429682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1na/xz3BN1RTjBzUk4RSsstxgXPtph4Ojpxkm4qT8E=;
        b=F2X7HKTHJouE11Ep+I8N+8Xd8tHu5z27frzkNFD3rXetoC0wGlhXdQyCCN8MZ1LB0v
         w9VrszAD+MTDarA0jMHRecBbPD33M2wwBrWE7EEF+CLLEmjCRLqAHnmxcJU7XqOVptsd
         /mCnKrXoRtxGmGqQjfjv4Dzi7JJ6kHpen4CtyHT26rOkF/98efZcBEsOLsOXp872cHEl
         bpCdWnX9RJwIpANLN3LF4bLMJDiygKRIY/UtzVi4Q5jolZc34Zn0rhhq9yM8Yu1SIB2C
         2w3SzuS3TJpBhfIqVJIwrLw/G6LvY/kzl7xmaZTavxEdg1HMGwJYMpW+2IyEQIiQDHHk
         Rhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824882; x=1770429682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1na/xz3BN1RTjBzUk4RSsstxgXPtph4Ojpxkm4qT8E=;
        b=m6ZNNRYvTBtR9ovJjjTrLLhDsME1HAiwkwhsc96o0ESsCvIetIqkAeFBQsfCxNiaor
         3D0KXz97w4ilKOR7wPrR7YIGliblJ4RPS2mtn4CIk8ycAU/y69zf6pYOlD2G9URd6oA6
         /hKq/rNRtmiIyytC1HGys9O8WpNmJAKI35PT1c69KLdcsPo3J4MpEkY22RWR+UOJRKbl
         RW0B5wkDFXwuoJXKPnqiXrmlB5mb7iowmfyjVp7F9Itnkk83K+cBcguVcuPqD5lSJ87U
         rpQu4gNvUaIYh6o4iTetk3hyoP04X1UHl0rf+Gs8TKvTI8sx+FkPAZUrk1TTZ6czna1v
         gmLg==
X-Gm-Message-State: AOJu0YzwjfzoS69kcPzQ269eN0r5U8mvKt+wtbOj5StpXG9LMzHSwfEI
	WH/C/+Tb5z+G7WZvEDHuGCR63oXJfTNefl7seNZ6XhbjIP/xrddnJR5T7Pix2p0X
X-Gm-Gg: AZuq6aLqSVh5JmnInNKmMywtPg8pV3D9PXDBJa3ZtzAfVFipKUsSvWvBXcfTuRlOnjN
	8Iaf7ZGcMNqRLdNNtBqR01PH2rzAgMqE4YReKIPjcaXsbMHgDvPiS09kECdL1knX2a2DCKiKJ5X
	NRg2A88Lva+VTi6D9GmsKZ2fHK5OqpeBmngv1l/ID4dxv02Iiy1OOuDqKQB1cnDFsEsxzVW2bHc
	aw/vux+2hOOcaZEzVv9KwnZgDcagSoc1Rs5umSbnAMhPzWcm/Z8h4AZz6F7vN1kXjt231L1voLH
	0nRQ0l0J0vfejj0vIoUQO2P2VnRGvc9Has9Ip0q5eY+LXnnXOZTnLPwRLhT1QayE5j81PZ4JPqq
	S6nv082aKQo6hcQWechPy/u6wiHEd1oiv93t3g5U69ZzYUNKYjSMvnbPkMFZNV/tnJVmBkwGSiF
	Pk8Ip83w4WFhsyLS1JiEwTg+iZ25Lg1igE1Yeb8hvAUuia+bVktVPf4dK8wtV2azXGFxC8GhO//
	2dfdLvKG79T/gW/3yzTEG5WwtjEwfTrkLwpuM3Gj9CL5/rvqlQtTFk8pofngB3rzD6vq6PSafaz
	9dj2
X-Received: by 2002:a05:7022:fa6:b0:11b:bf3f:5251 with SMTP id a92af1059eb24-125c0fe6a5dmr2315800c88.16.1769824882416;
        Fri, 30 Jan 2026 18:01:22 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f597sm12344838c88.5.2026.01.30.18.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 18:01:22 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] platform: x86: remove unnecessary module_init/exit functions
Date: Fri, 30 Jan 2026 18:01:17 -0800
Message-ID: <20260131020118.46171-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two x86 platform drivers have unnecessary module_init and module_exit
functions that are empty or just print a message. Remove them. Note
that if a module_init function exists, a module_exit function must also
exist; otherwise, the module cannot be unloaded.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 14 --------------
 drivers/platform/x86/mxm-wmi.c  | 12 ------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 0775fadedd10..9917362461e8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5244,17 +5244,3 @@ void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 	used = false;
 }
 EXPORT_SYMBOL_GPL(asus_wmi_unregister_driver);
-
-static int __init asus_wmi_init(void)
-{
-	pr_info("ASUS WMI generic driver loaded\n");
-	return 0;
-}
-
-static void __exit asus_wmi_exit(void)
-{
-	pr_info("ASUS WMI generic driver unloaded\n");
-}
-
-module_init(asus_wmi_init);
-module_exit(asus_wmi_exit);
diff --git a/drivers/platform/x86/mxm-wmi.c b/drivers/platform/x86/mxm-wmi.c
index 9a457956025a..dbc5e35ec38b 100644
--- a/drivers/platform/x86/mxm-wmi.c
+++ b/drivers/platform/x86/mxm-wmi.c
@@ -80,15 +80,3 @@ bool mxm_wmi_supported(void)
 	return guid_valid;
 }
 EXPORT_SYMBOL_GPL(mxm_wmi_supported);
-
-static int __init mxm_wmi_init(void)
-{
-	return 0;
-}
-
-static void __exit mxm_wmi_exit(void)
-{
-}
-
-module_init(mxm_wmi_init);
-module_exit(mxm_wmi_exit);
-- 
2.43.0

