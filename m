Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672510;
	b=PTjOGWhXAe63oWZ4nzT7snSv6zDEMAd/hJPnhBemYnTuORsw0n3ryeufnuiJpnodFmva
	 jejFtD0rimtvRWvq1w8lptpCPpsdt0ZuzKFL6l7HrJ0iaeq6J/Tf8A16rlatHkSmsF6WD
	 V8bF6BnQdL0XtO9QvTnrSc6mgLSFU7Y4kkJzsUBWWQrpgLZ7ca1FvUymASoCumSTQF5PQ
	 5TJ9DngYsf/UuZrUz0+MvVTt/uCZG0hP/E4QOKVeIImk/bPtQoN4w2jOiB4QzvWxEFg6s
	 pLZqk88M8OSORVoeSwJO66+hGqBha17BhCHV16678AuHHV/MbvNBcTyrzGlGREqgrVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
	b=RqMMJQS6VxxgUePHEo1z9guqaV/ML+QLCguzMGFPuEo9AcJBwltJYCeT5nP6wild9wAa
	 EoW8c/zYcyQQqWQDvwxY/p+0v4mMKm+HXg4svxJVRPDcHm/6BVaIDGjhaBPdRtXG2urxi
	 a1VOERQQ/3I9jjvsaSBCFSSw4h0ruuOyAFAXazVbH4jC7ckXT3dcGL9xKtLfPi+SSAmQb
	 Uh76Ra8t7heIVk0M4Vuebz/mHZ9/PtH+u9G7Y/uXXcmtRo3VknINjfOENXOJBTMpdbmA9
	 zOeRtefMbdN3Qy2CmK5deg2lbjZBm5psqWWII+UrnUHrcMvD9yGk7eC/s6FctA+iZTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbQbi1gd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728CC606A32E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728CC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbQbi1gd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3704d30b84fso2580576eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672509; x=1795277309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
        b=tbQbi1gdIC6/6HaGRuQ6NdTOfpXgDybDtxfF3N17V0BDjnvKhlWgVO8zpSUMHehkay
         C/ZZMI7Wyt1MHl3lC4/ZFhoyOFviS7f81UlMhCS1uT+w6L4DUAd8SdECRH3ZQk75ObMn
         KHjTAObVD4CLG9k08HoNhZWOrwIL9E6dBuay8QPtR+HcvS1PkoONye3PVKLtIG2zPQtt
         pUMwuj/9uJoYqsltFOzDfY6TpIIli8wtlkDFhafCkBw+wn9jU9mioZpYnPCzFgG2OtUX
         sa2gIHeeIQ4a6Fhqdk4/rJV7g8KsGaSW7ebH/J7t0lnazJOcoJQeXwbhje/URz8VoFi2
         jipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672509; x=1795277309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
        b=xsqUlSlXdlXg7zBaQ7I47lDXWJxAXz7s3/ndOJdLfl7OJV/egawMe2d6rxeJ+wksDr
         H8yat4Y4RHEN1GpGoowGJCtrpvbpDD1kGb2pt2VQEOle9IgkHiNHVVvzNhsoGirmJ49M
         XRjLkThvtHBEN4BaOKVZ5Z8f44d9WzxnmZSWlWMzlY/+ACO8wLFDZEgi60iQ8CmXEaGS
         JBO3WvmvY1g0GtzXz7vuEGgz9YyTU0Ra6E6Aaspmz29O/50Yd6K947OM7lzO/8eJKd+8
         T1ygesDFODWXjTyAVbqtbNos6SNq3z3hBJjxDeG9laaCuBWir9Vmf9QBwDBuTG8YAgqo
         OA8Q==
X-Forwarded-Encrypted: i=1; AL+hErH6/jhSPRRmfEKtbu7SefWXKldK5K25ZjXp+pEDzKf1uASUcCIsYLpobvpmh/zBUWpofzkHiEmpdG8e1UCooczJHyP2@vger.kernel.org
X-Gm-Message-State: APuU4Z9hH0TxCr0t9Px4Pr+Rc+SkGuHOfP7/algdCnyQrI3q+Ng9+uhB
	mOTLS3rOqyEbFf95tKq5p1lQAVRRtHwwXTMlqUp9Iog+L7BOw5GCRKM=
X-Gm-Gg: AYBFou1gHoG3M6xsRI0Hswq2leAxL9L2Ua6u8gWkOStOF/khevhbwW3fyBiKZHs6Z5M
	66e7cz6f+26uXWHt6Le+pbGqdELruN4yMadi+vapcrpLQzcOrTPMij2M9M/uSySvganSqABmBp2
	tQy95GDEw82aeFSV9Neu50dB6jiXsIZ4s1eGSvAfUdgmE/Z2s/5qMH8JKPpmfTN7XHKkQMz14+R
	xpblQlNCO6GZZi+9HVz1Tt8s2lzf15GqRxFJvHpX3SAFZSs1Nq1AvRB+WBdk2OMCi1Ok+GRII/1
	gnUMqe5Iv0Uw68tIUgY+HhFSsd73CU9sAm9TsSy9ozzugMXBr00pESuD23pPAD6gwGNdK0ew4up
	Wg//cduDDqBJNMGYwAcnZaUmiv+9d664eG0/2VfLuH9EkMr+6uwMNsKMv1zP1D6l9KsVr3KfZZS
	6LIqZ6lVSLocw2Gn8lU2oTsrhlEToKrROgiSZCPHOK93H++DccXpITW0N3nsFprxuemfCGQUoSO
	sMKDPCnsXKy5d5CaYseN7YDZDTHvWXS8VdqSanRngHF8AedysxYcwRcCVNHfstfn420e+kck++2
	CSxXPhB0gZIMkRqcvxeKZ9cKndv5Y4dWmpfuKXUUAIw00QengZDDN4qoSCwP0UAGFg==
X-Received: by 2002:a05:7300:f18e:b0:375:894f:2524 with SMTP id 5a478bee46e88-37966b52646mr7220639eec.12.1794672509407;
        Sat, 14 Nov 2026 08:08:29 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:08:29 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 02/12] PCI: Disable pcie port on specific amd devices
Date: Sat, 14 Nov 2026 11:06:26 -0500
Message-ID: <20261114160731.3756-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

As mentioned in the previous commit, PWRD turns off the entire
bridge, and if we read/write anything to the config space
or the PCIE space when the bridge is dead, the CPU CATERR's,
so to avoid interaction when the bridge is dead,
we remove pcieport support for the bridges..

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 arch/x86/pci/fixup.c       | 43 ++++++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/portdrv.c |  2 +-
 include/linux/pci.h        |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index 795d81c7a..b1697cc4a 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -1094,6 +1094,48 @@ static void asus_disable_nvme_d3cold(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x9a09, asus_disable_nvme_d3cold);
 
+static const struct dmi_system_id quirk_disable_pcie_port_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro15,1"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro15,3"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro16,1"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro16,4"),
+		},
+	},
+	{}
+};
+
+static void quirk_disable_pcie_port(struct pci_dev *pdev)
+{
+	struct pci_dev *upstream = pdev;
+
+	if (dmi_check_system(quirk_disable_pcie_port_dmi_table)) {
+		while ((upstream = pci_upstream_bridge(upstream)))
+			upstream->no_pcie_port = 1;
+	}
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x67ef, quirk_disable_pcie_port);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x69af, quirk_disable_pcie_port);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x7340, quirk_disable_pcie_port);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x7360, quirk_disable_pcie_port);
+
 #ifdef CONFIG_SUSPEND
 /*
  * Root Ports on some AMD SoCs advertise PME_Support for D3hot and D3cold, but
@@ -1179,4 +1221,5 @@ static void quirk_tuxeo_rp_d3(struct pci_dev *pdev)
 	}
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x1502, quirk_tuxeo_rp_d3);
+
 #endif /* CONFIG_SUSPEND */
diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index a9cbfc1d2..d2f19e566 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -688,7 +688,7 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
 	int type = pci_pcie_type(dev);
 	int status;
 
-	if (!pci_is_pcie(dev) ||
+	if (!pci_is_pcie(dev) || dev->no_pcie_port ||
 	    ((type != PCI_EXP_TYPE_ROOT_PORT) &&
 	     (type != PCI_EXP_TYPE_UPSTREAM) &&
 	     (type != PCI_EXP_TYPE_DOWNSTREAM) &&
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d31a8d107..fcb4f5893 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -420,6 +420,7 @@ struct pci_dev {
 	unsigned int	no_d1d2:1;	/* D1 and D2 are forbidden */
 	unsigned int	no_d3cold:1;	/* D3cold is forbidden */
 	unsigned int	bridge_d3:1;	/* Allow D3 for bridge */
+	unsigned int	no_pcie_port:1; /* PCIE Port driver is forbidden */
 	unsigned int	d3cold_allowed:1;	/* D3cold is allowed by user */
 	unsigned int	mmio_always_on:1;	/* Disallow turning off io/mem
 						   decoding during BAR sizing */
-- 
2.55.0

