Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8C233134;
	Fri, 15 May 2026 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804509; cv=none; b=J8inogemc/Q7Gm/suU2aFXMyOZhfhyLvb9kdX69r0Etm8jY2iSC7sZ5CSAyA/yO1aykdPTzKPHhlGQhWTTkWkg4Fe2j8U0wHst+3YNG6gDfPIDCXk9/w9Cx8u6EcCyQpIFx3PsJV2N6rxT5GfntswgFcbYp7tiH21Ivd559N2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804509; c=relaxed/simple;
	bh=5pTzuJT1QmtpFgR1bOkWh4eV3W4l5sqGjN0sBSGElOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cA1/kUrmFpImYFqyD2BVMn3GVRfZ7gdBwUMlBhwse7Hgs/bDL2PNREKtrdXs0boH7UQeHPDTUTT9V/VRHMyKfnrJU9o9WL4AfvA5XUgx6XwJ5hD4yvYTSWLSqgRMSxDH9Yvk0nRpX2Qt9tGDlznTo5QcjW+2MvPsbNdr1jcgOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgeTHKo3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgeTHKo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804508; x=1810340508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5pTzuJT1QmtpFgR1bOkWh4eV3W4l5sqGjN0sBSGElOg=;
  b=AgeTHKo3QEZKtmHeFZNuv7YYxccVMqPQcZfLyu7LGsqaw5lU5GlY7twV
   qYOPviC8EvJhRUEiY5r10bA33k/UPMY03teWz+GJi6bIwaj2BuhfFXoxJ
   Lopjld6UeeG6lZGydjQrExu2sOL8G8Zek4ifPp0heALIctmFVMwijQ1/C
   /EYucgd03Zw/IV5o67aL/nfJN8l31/5tEvxqfvdYW1OYa4hSrBRQ68PQV
   7IuKm0HQDfqWOB8GcSsJ7ER1zTwoJ0vASAesHpl1Oc5+RK8TzQnLDR9dx
   sF+y50OB2Hd4gQR/StuHHOX9QVSilGShDZoEt7dBgWs0/Yi3MSQI7F31R
   Q==;
X-CSE-ConnectionGUID: tKd7+n9PQ8a+GBfNWvAw/A==
X-CSE-MsgGUID: 9TeRgAxER+uSeA731LwzgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895157"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
X-CSE-ConnectionGUID: 4eVbJ2roQkijTntut0l/Fw==
X-CSE-MsgGUID: m4uBqk1yTmKBoKnISZwbKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879065"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 04/16] platform/x86/intel/pmt: Pass discovery index instead of resource
Date: Thu, 14 May 2026 17:21:11 -0700
Message-ID: <20260515002130.701457-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change PMT class code to pass a discovery index rather than a direct struct
resource when creating entries. This allows the class to identify the
discovery source generically without assuming PCI BAR resources. For PCI
devices, the index still resolves to a resource in the intel_vsec_device.
Other discovery sources, such as ACPI, can use the same index without
needing a struct resource.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V4 - No changes

V3 changes:
  - Rebased after dropping the previous "Move header decode into common
    helper" patch
  - Adjusted the intel_pmt_populate_entry() call path to match the restored
    intel_pmt_dev_create() flow
  - Did not apply Ilpo V2 signoff due to these changes.

V2 - No changes

 drivers/platform/x86/intel/pmt/class.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 9b315334a69b..7da8279b54f8 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -206,11 +206,12 @@ EXPORT_SYMBOL_GPL(intel_pmt_class);
=20
 static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 				    struct intel_vsec_device *ivdev,
-				    struct resource *disc_res)
+				    int idx)
 {
 	struct pci_dev *pci_dev =3D to_pci_dev(ivdev->dev);
 	struct device *dev =3D &ivdev->auxdev.dev;
 	struct intel_pmt_header *header =3D &entry->header;
+	struct resource *disc_res;
 	u8 bir;
=20
 	/*
@@ -235,6 +236,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_en=
try *entry,
 		 * For access_type LOCAL, the base address is as follows:
 		 * base address =3D end of discovery region + base offset
 		 */
+		disc_res =3D &ivdev->resource[idx];
 		entry->base_addr =3D disc_res->end + 1 + header->base_offset;
=20
 		/*
@@ -397,7 +399,7 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry,=
 struct intel_pmt_namespa
 			return ret;
 	}
=20
-	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, disc_res);
+	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, idx);
 	if (ret)
 		return ret;
=20
--=20
2.43.0

