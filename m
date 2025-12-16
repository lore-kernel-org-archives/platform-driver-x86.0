Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B62798ED;
	Tue, 16 Dec 2025 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867093; cv=none; b=h1LE1pSJ3jwfS2Zdue3l527EG6DeNVDEyulKazNRikdRLRS2IWDRtDyKhAb6b3HeohdFfxwNTc7kNL7dhWFDOGJnpubVuuj/m5RjP42AMYOE/X+oTCxjIPYiG4Py7UHDF9BxXcawFtbYFgV4Ip8B5pOUAXGYoVHkqL4ed+EzMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867093; c=relaxed/simple;
	bh=k68jsUYEpYYTSTn0LkdWveaBvBBp7M+xkV63wPTjBCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWkpnu0XaB6V71nytk58ubuwMkh7fUEA7BZffOxJsUj4o0NcBkVm8Mxr0hyCHYhTWW+/NXwYa/sEOgbMpnmBtyByrWCBD3It0xt/askNuR0kOZxEYfCS3GSKj+R5IuFm5D2bhtUchkHLCjWBDV5+8cqF74CK9jgQkyNcR9O0Ib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=agraP6PX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="agraP6PX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=r8GP7/PD03r3ea7LhUbPnxbrKUEXf9L+A08SlPs8K3A=; b=agraP6PX4vAcAYwTY7n2r3IKD7
	jdmi9dRQkxrRLiqKLhvfj1Av1f1eAUn1+E5sH/NTkpXB+Af8GauGHR8uLl2HtkxkKR5w0xWRZXoes
	UNItuD9BASx/6ILweuDdcGybZZfUcu/BlbxgbEh/de3AjzlEqPFB/8zkQJ3gs9PDaHrMl1j/Vtuv0
	WTeQkkuml4fKeA/z+wn7g0+LB6tp99phyHGaBT3qm/vTrBjkODD+DCaZvbmRJMhQbjgHbjSvFsLjj
	sTgMTKr5tADSacDlnmfYp6uiisyPUad4QOilRzwDkXiER4G1AsPDl2WsDgD5iVF6sNn7O3UHerp+h
	sfPvFehQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOh8-00000004nFX-3Bqu;
	Tue, 16 Dec 2025 06:38:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"David E. Box" <david.e.box@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86/intel/vsec: correct kernel-doc comments
Date: Mon, 15 Dec 2025 22:38:00 -0800
Message-ID: <20251216063801.2896495-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
warnings:

Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' not
 described in 'pmt_callbacks'
Warning: include/linux/intel_vsec.h:146 expecting prototype for struct
 intel_sec_device.  Prototype was for struct intel_vsec_device instead
Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_size'
 not described in 'intel_vsec_device'

In struct pmt_callbacks, correct the kernel-doc for @read_telem.
kernel-doc doesn't support documenting callback function parameters,
so drop the '@' signs on those and use "* *" to make them somewhat
readable in the produced documentation output.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: make changes to the callback fn parameters as requested by Ilpo.

Cc: David E. Box <david.e.box@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 include/linux/intel_vsec.h |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

--- linux-next-20251210.orig/include/linux/intel_vsec.h
+++ linux-next-20251210/include/linux/intel_vsec.h
@@ -80,13 +80,13 @@ enum intel_vsec_quirks {
 
 /**
  * struct pmt_callbacks - Callback infrastructure for PMT devices
- * ->read_telem() when specified, called by client driver to access PMT data (instead
- * of direct copy).
- * @pdev:  PCI device reference for the callback's use
- * @guid:  ID of data to acccss
- * @data:  buffer for the data to be copied
- * @off:   offset into the requested buffer
- * @count: size of buffer
+ * @read_telem: when specified, called by client driver to access PMT
+ * data (instead of direct copy).
+ * * pdev:  PCI device reference for the callback's use
+ * * guid:  ID of data to acccss
+ * * data:  buffer for the data to be copied
+ * * off:   offset into the requested buffer
+ * * count: size of buffer
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
@@ -120,7 +120,7 @@ struct intel_vsec_platform_info {
 };
 
 /**
- * struct intel_sec_device - Auxbus specific device information
+ * struct intel_vsec_device - Auxbus specific device information
  * @auxdev:        auxbus device struct for auxbus access
  * @pcidev:        pci device associated with the device
  * @resource:      any resources shared by the parent
@@ -128,6 +128,7 @@ struct intel_vsec_platform_info {
  * @num_resources: number of resources
  * @id:            xarray id
  * @priv_data:     any private data needed
+ * @priv_data_size: size of private data area
  * @quirks:        specified quirks
  * @base_addr:     base address of entries (if specified)
  * @cap_id:        the enumerated id of the vsec feature
