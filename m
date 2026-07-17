Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB41377567
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268700; cv=none; b=bSMqDCGqm+yECeKMe9Lms56BRKeh6lf7iXoJ8eCjeoarClDQWZjUakDvGdWcaZTBawr1aNkWUP0m3YTiQ3ZLiMlnUkoTUDivJh7/gcG1jDUyiWLcsxoBSw59kAIeqTdDv3uQ+1zTnPOdpMnAi5xkfPJQJYNQ33YsQ6MNiero3vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268700; c=relaxed/simple;
	bh=U/WwZ/oUhnyOWZnmaH4VAFaQclk/+DD5TbgLex4r06M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tj/JZg16ae/wVT3m7NYRAAVrpNcwRNp7lJx3R/5Y2kraH39BvI+szNuQVS1PMH3HYORiKfUTggBDfWvRv1BxeieEWk+PtxyAwiqn+5t97Hri1YJo3IRdl356qx5czZPr8wqgVqeNWyVj3KQGhuoF10HxYaL+iQQp9tTmu5Ze/I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFYJMNf9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFYJMNf9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cab1f435afso14384575ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784268698; x=1784873498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozUb6IR9U02hBaC9DF1hIgNkHUdtWxbpjqkpQJBpLfo=;
        b=qFYJMNf9PeLZpieZUOmyTDNjn9rbO1JDo3clJ9uuopBF9QJens9vqG5x7YWqdjmGRn
         /eDaWt9EeD+6ITdOkTXHcKyCZMhV8430NUJdS73+wbcqzjYyj9ho3l2VAGEtkwawNaqZ
         KcTMH+I5tX2aKGBBCA6W/kr028t6kU2XOQsu80wppC/t/WfOLnPs4LEfMFNpfc2FyiVH
         tUS6O5Jgyz29Z5KGUF/BfqA/tP+CEfZU15nKUSsHgAa7yPUtPMpnawPuRGxMbWltQ3fx
         9JMGbiJb3+htGzsPyboCIdTQUtiCUv6pfM7XpADrjGJFuPYSXUTElezLkaQpEtFgxwT+
         azvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784268698; x=1784873498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozUb6IR9U02hBaC9DF1hIgNkHUdtWxbpjqkpQJBpLfo=;
        b=TTw+GwwdMeTmcVyqKSnaZh2bSXjlbU0Vo5UTYXeU0pIIevigjdZYI7EKCowL7FLsKr
         OYd/FlnHwmxIhjdJFPaDo8pkByjvKWDKXOrhHyQFaU32jGdpHiVPBJj9GYKysCe8AR9+
         34OQHqva75s1stHZjynRjmx4iGlikEMgSv2UngpULZI9JDB/Hj4xrVxKv4XejwxqkodG
         LxNwU4z+PRvHxSK96zFzAh5LThIE9jNHwks4iMeVbEAbZc02f8ItCdngd9/Sb/WlcyJ4
         ZpAbayznTbNI+p9r2wO5lG4ixzLlbS3LEJLz38ZPjSkIepQFHxib9Zy7A6IQ6/PDSu5D
         uDBQ==
X-Gm-Message-State: AOJu0Yz+385nyejM9/YZgi838Q/4dVRaOHpFg+fdjslKyB748RxIsj/G
	RmGVAvQ8UcL7nxEG0EkyxK9xpx4R5VTXBH3jm0G7mbqTK7SUBh/epD1ejJfnxqLu04A=
X-Gm-Gg: AfdE7clkeaOb3Tv6C11kxWrxYgJSqTsgYg1q7TFYR8Mu/9ulTepuXLRhXkNUbDeswz/
	cIcV+zkhGnYP/EGHXd6eo+sK264Or3pVc77PCJ4L4UAUFq/3H9s6b+2QJrCUKC9zkVV59RChRjx
	iLTZE3tHnYyIyPQyEtf9dklFfAlPmI+0ZO2MpULKIcy8PvFJdKE+605vZCTalSAmnmVdzMIdovC
	g0u2+Nf9SbKchl/5VeKHt/roDQouK9RtWxQHTT4n/SrXUe3M8n0RzVvQ95uEHOz/vdPhUGu8zlI
	c5SwGyCl3h/DbOnTLCpCsZfFqW5TTiav7mQa3jAJDqqo+zYiTchHclsUmI6M4k66QE5hfYvqfuR
	csGCPNRyog9ASyMVB0U59GV1yX9EJ/4cDzV5vRZRl6B4XqA872iSco7uOgpttlk3bv17WVtWORu
	ua6SaiTkQH8wY4bOA=
X-Received: by 2002:a17:902:ced1:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2cf34a02b31mr10896805ad.6.1784268697577;
        Thu, 16 Jul 2026 23:11:37 -0700 (PDT)
Received: from debian.sphynx-fence.ts.net ([219.92.60.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd764fsm1785294c88.12.2026.07.16.23.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:11:36 -0700 (PDT)
From: Yap Weei Choong <ywc8891@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Shyam-sundar.S-k@amd.com,
	mario.limonciello@amd.com,
	linux-kernel@vger.kernel.org,
	Yap Weei Choong <ywc8891@gmail.com>
Subject: [PATCH] platform/x86/amd/pmc: Add T14 Gen2 AMD (20XL) to s2idle quirk list
Date: Fri, 17 Jul 2026 14:07:45 +0800
Message-ID: <20260717060744.1252065-2-ywc8891@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad T14 Gen 2 AMD was sold under two machine types, 20XK and
20XL, but only 20XK has been in the s2idle quirk list since the quirk
was introduced in commit 455cd867b85b ("platform/x86: thinkpad_acpi:
Add a s2idle resume quirk for a number of laptops").

On 20XL machines the firmware SMI handler therefore still runs on the
NVMe D3->D0 transition when exiting suspend-to-idle. With IOMMU
translation enabled (the default), this intermittently stalls resume
for ~10.25 seconds: seven devices across three root ports (nvme, both
xhci_hcd functions, xhci-pci-renesas, snd_hda_intel x2, snd_rn_pci_acp3x)
block in pci_pm_resume_noirq and are released simultaneously, consistent
with all cores being held in SMM.

Add the missing 20XL machine type, mirroring the existing 20XK entry.
This is the same class of omission fixed by commit 9a469c6dfab3
("platform/x86: thinkpad_acpi: Add missing T14s Gen1 type to s2idle
quirk list").

Verified on a ThinkPad T14 Gen 2a (type 20XLS41C00, BIOS R1MET62W 1.32,
kernel 6.12.95): with this entry the quirk message appears at probe and
a 14-hour suspend resumes in ~1s with no noirq stalls, where previously
even short suspends could hit the ~10s delay. A further two-day soak
(short naps and two ~14-hour suspends) showed every resume clean.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221755
Signed-off-by: Yap Weei Choong <ywc8891@gmail.com>
Tested-by: Yap Weei Choong <ywc8891@gmail.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 74ddf1d82..09a30f333 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -71,6 +71,14 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "20XK"),
 		}
 	},
+	{
+		.ident = "T14 Gen2 AMD",
+		.driver_data = &quirk_s2idle_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "20XL"),
+		}
+	},
 	{
 		.ident = "T14 Gen1 AMD",
 		.driver_data = &quirk_s2idle_spurious_8042,
-- 
2.47.3

