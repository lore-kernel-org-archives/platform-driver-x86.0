Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F53B4EA2
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484252; cv=none; b=WynZr84uPvu7QAYFcDUp4XzJgQrWdfxmmIQiPqL0pCozs1sK0rdsrbGScNu7nYaoU7kvDvRHIScL+RDF0k+wV3cVTCuCCGR0hR0ZH61xf5+Jh6bz4KbuMwZOVdMPjbdvJKVfU2Y0SaD6ieQeuwd7Y4Wj0FO/DbX4LKCU+AFXoH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484252; c=relaxed/simple;
	bh=V0Tae/rKozWhabyRfdu4QuNkEaB8DkFkgOcQe8o5wq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OW2lWwuuV0qH4xdxH7GG746C+XRVsUJ4PODHG5BUuRMp9dJD44FP6q31G0YXf1PUA7fGaomYcvZJnk+1cMDkIIyKYFpgbM7e/DdvFIbhXpG343EhGbBvGYwxI73IwZpohcrx19+AffLXzLwmqroaCk/4qOJ+ZGgURMcs2t14spE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfG43JtS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfG43JtS"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso6225723a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484246; x=1785089046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWQkBHme3djyDjtoGqM4G+GNxyywodyr8gsYJac/hfw=;
        b=FfG43JtSl6k2dkdJv1ue1j48FkxIOoBrilaiKruWxYFM28947LGwWga39sjiHmMDIJ
         TgWB5f/dZ/YajU65sC5pzoJMBx/NjJsBsQ7QhEwLeT99YAPnm4FgfBcgXMMTwp76pBuk
         A19zIh+9Fxg05n1+gVcE9ygTvcwo57pK/ul5J/Ll+Xqk+bhLzG4czKkx3fTsCPH+Hbwg
         tLwsoFBEx6MOv4OVTM8uqVvKAjtIp0ZOuNeYLfXBwvPFGaZHCLXiHWlGObp2EmJj92gI
         FXUwej9BaUvPlm371En4fqgIjkZjUcnbWYof5ME9Ppkq1pSjL6G/pqWjaDKT/tTl8GVZ
         svgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484246; x=1785089046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWQkBHme3djyDjtoGqM4G+GNxyywodyr8gsYJac/hfw=;
        b=j72ohOJ0pB6wkh+J4folDQXiO3SUZeCXJVhknnXh6eYWfxI+c6Lza9i9ZD5uPJPhFQ
         erb77A9fDRVjmFnQZKx51rcBzjnhuBGVd91OweH7HnYrwppSqRO00k1jvbSqyAAV+6fO
         2avHQ5JUFL2YVj1X95n9i63Igv/9wKjAtRv7oYT4+OioLUyZie42xAcLrliNZO5ufogW
         03K6qgehOV0M13jBSBCiGKk29Q38eGXS4i0WbvZFTnUeBJ3AJkRa5U8gvtmgjFtxlrcI
         6paJ5oLxX134ZIlFXw9qrh04k+3uZAbWErhGnrOgiZ2w7AQPUmps1C7lco2ujVg78VP1
         p8wg==
X-Forwarded-Encrypted: i=1; AHgh+RquT3E9f0S5KZ6kZJXzc+V+VLkiTqJZgAnhrOwkr1J4O3mkKF2qMdDQuVRVao8/+x0umaLeOZvbnbwnMv7qCGUvs7ED@vger.kernel.org
X-Gm-Message-State: AOJu0YxTxY+lG+rfJstl/3tgPukJcP/Owgg5RB7f6Zxoj8GhD6A2c4Hh
	s8OEP8ElvmGyJNWNCRO6/ubSUeMa5w6T04FeKcjMGt+U5x6np5TYe5c=
X-Gm-Gg: AfdE7cl3ji5dRujaRfO9XRelxx0h4BjsCo0ZyuWe/cFgEgm71VDfHYllgZWBaqHniIh
	IBEgqKhTPBwguIMhGijAaC49Z2zwSOxuSj00J5N7DrerzkEgQjOcX+Nfj/DFdFZ8NuK2kQg2YYW
	26hAB6RyQnSeJwv9timsiJH/voAt5FownDjUCh/AvVDnzRukJqn2ygTphlCae4MNAk6kNW8hKal
	h6+tJkiaUL4UDOcGCKS3aE0mgFrpc5jkzyR6eh0hjiWGzsp9Z1/91b7ciQWojDtKKXTHtykeps/
	nr9o2FHOIbRC0uGYbb0izBih0LhC8KlaC5d38G/lkVaHHryxbHsJsDVix1ObfCkshIdIkLpXiUT
	GeSOkqSF9EQFRJofvXSv8enu/DtbpzofQCFM/YtoNpGxCY0VSSGYFrX4+zCen5xg0XdMmk1I/ai
	3XdAuMrrJCuFN7mGVtWMEcaRunL1nB/oFdIlbbGjjs
X-Received: by 2002:a05:6a20:1713:b0:3c3:8651:b302 with SMTP id adf61e73a8af0-3c3ad7ac447mr8585778637.28.1784484246013;
        Sun, 19 Jul 2026 11:04:06 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.194.66.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm27967645eec.13.2026.07.19.11.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:04:05 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <andre@negmaster.com>,
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
Subject: [PATCH 2/2] thunderbolt: Add device links for Apple T2 NHI
Date: Sun, 19 Jul 2026 14:03:04 -0400
Message-ID: <20260719180308.1398-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com>
References: <20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Eikmeyer <andre@negmaster.com>

Thunderbolt NHI on T2 Macs (2018-2020). The NHI and its
associated PCIe root ports all sit directly on the root complex
with no upstream port. Apple's ACPI tables name Thunderbolt root
ports as TRP0, TRP1, etc. Find them and create device links back
to the NHI so that PCIe tunnels can be re-established after sleep.

Co-developed-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Signed-off-by: Andre Eikmeyer <andre@negmaster.com>
---
 drivers/thunderbolt/tb.c | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..26529141573a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2019, Intel Corporation
  */
 
+#include <linux/acpi.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
@@ -3310,6 +3311,54 @@ static bool tb_apple_add_links(struct tb_nhi *nhi)
 	if (!x86_apple_machine)
 		return false;
 
+	/* On T2 Macs. the root ports are stored in ACPI as TRP0,
+	 * TRP1, etc. Find them and create device links
+	 * so that PCIe tunnels can be re-established after
+	 * sleep.
+	 */
+	if (has_t2_chip) {
+		struct acpi_device *adev;
+		unsigned int slot, func;
+		const struct device_link *link;
+		const char *bid;
+
+		for (slot = 0; slot < 32; slot++) {
+			for (func = 0; func < 8; func++) {
+				pdev = pci_get_slot(nhi->pdev->bus, PCI_DEVFN(slot, func));
+				if (!pdev)
+					continue;
+
+				if (!pci_is_pcie(pdev) || pci_pcie_type(pdev) !=
+						PCI_EXP_TYPE_ROOT_PORT)
+					goto put_pdev;
+
+				adev = ACPI_COMPANION(&pdev->dev);
+				if (!adev)
+					goto put_pdev;
+
+				bid = acpi_device_bid(adev);
+				if (!bid || strncmp(bid, "TRP", 3) != 0)
+					goto put_pdev;
+
+				link = device_link_add(&pdev->dev, &nhi->pdev->dev,
+						DL_FLAG_AUTOREMOVE_SUPPLIER |
+						DL_FLAG_PM_RUNTIME);
+				if (link) {
+					dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+						dev_name(&pdev->dev));
+					ret = true;
+				} else
+					dev_warn(&nhi->pdev->dev,
+						"device link creation from %s failed\n",
+						dev_name(&pdev->dev));
+
+put_pdev:
+	pci_dev_put(pdev);
+			}
+		}
+		return ret;
+	}
+
 	switch (nhi->pdev->device) {
 	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-- 
2.43.0

