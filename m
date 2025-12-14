Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B171221D3CD;
	Sun, 14 Dec 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765743606; cv=none; b=SolN+wTNoh3Uzmy35yIS6NlKBt1qeWpyldJFCE/J15w3pAIxuLEpubmi46h9kjprtbdQIgo4BuyOBhnpf6c/KBRXnDQLfEx16TgW1AFLg8aPVZCxK1J6fVxc+k7RFxOaKuIh9szUO2gvOui51mWZjFHI5VxkCvjUyAUoKEumNdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765743606; c=relaxed/simple;
	bh=+gGFv0iTIzJmHmAGRGBexRNjCwraUMZ0Z30cjSbPvMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BU6o5CQOAVCSCknXtzuCFxv+95C20v3boTLY0DtKdxjM1vHlht/oxq8x8BjpktN+Dpvu5RmUSUpHm6u9VmgKBH4pYXU4+JAwHmixsc8J/EyVv25o+rKDZh8EJDcg2IbtddzrFD1BJ1mP9KMHxl8ejkpzhtNjVQGegQPKAiPCKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XzfyiDL7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XzfyiDL7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=nCCWAkTjW23jyyBF1+0qwVXkoHoIg4WlxDfgQRqNDvY=; b=XzfyiDL72RBAtvY8RoFOh4kOhG
	qADv67KrAWjB3wolBoIXrqiURt01njm2PFR3EMNxb2cMYuJRFR44ISLAE95ImZad1RlMfUG4k7SdM
	AS9Brll6WQZrMcXbHn9JvxxnTt2amzY26e8h6ye/MJQPxLVScyjYGvfKxtMQU1K1Cx0ZMOMtc9pg8
	NuTHzj/GxUrdlpM6uoBWD6+TThfjM2sS6o5+yrQhCA+WaPMvF7t1hfyGKe7i/2ZHSDIxPbQ4kn/AW
	WYmRDwnemdwT2DVJ7PaAvTFSwzAWvNEGXx3WdeIeOcykRP5UiW1X5GkWBo8H6AxrJc9fjdKwtaEfm
	q++OyaqQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUsZW-00000002iNw-2MhA;
	Sun, 14 Dec 2025 20:20:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"David E. Box" <david.e.box@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/intel/vsec: correct kernel-doc comments
Date: Sun, 14 Dec 2025 12:19:57 -0800
Message-ID: <20251214201959.2195863-1-rdunlap@infradead.org>
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

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: David E. Box <david.e.box@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 include/linux/intel_vsec.h |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20251201.orig/include/linux/intel_vsec.h
+++ linux-next-20251201/include/linux/intel_vsec.h
@@ -80,8 +80,8 @@ enum intel_vsec_quirks {
 
 /**
  * struct pmt_callbacks - Callback infrastructure for PMT devices
- * ->read_telem() when specified, called by client driver to access PMT data (instead
- * of direct copy).
+ * @read_telem: when specified, called by client driver to access PMT
+ * data (instead of direct copy).
  * @pdev:  PCI device reference for the callback's use
  * @guid:  ID of data to acccss
  * @data:  buffer for the data to be copied
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
