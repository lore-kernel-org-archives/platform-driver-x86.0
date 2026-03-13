Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB563264DB;
	Fri, 13 Mar 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366741; cv=none; b=Xb6EXQjbbD8GICppO61QzlYW/BPsR1IBSPk9tIi+KPMVfjMtTlXoBDtr0hMKkYrWVbesTY3RZzJwW45Q8w/U01IZ/rrnt7D1Ibmb2MsQ86eqeD1tK84/crA5EG6NPS49s6L1AAAiI155aznPvq5G/vrD41jI1JMmWfUDUMsA4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366741; c=relaxed/simple;
	bh=Bu8e4iScR7E3XQ8O9eiaq6neJALpydajJX1JgnO3uCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKpBJIR3DIER14p94Q0jHmwYyJ7JDnuzJUKweO4Kc7+93QXk/koPzV/4Ww6bh4t65Xxh05uniHxqZlLuESH97L4MCEJo80JOaDpWYfpvMGSzfMGZYKaORqR58rDeDFOJjwnk84HTmxdk0e3NsNQLA9XyTDqCbojlDrRhSqN0epg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqcEnk8o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqcEnk8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366740; x=1804902740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bu8e4iScR7E3XQ8O9eiaq6neJALpydajJX1JgnO3uCw=;
  b=hqcEnk8oFKbJm57b50q9wmUBezvGOZ51P3qDJXuIbbN9pvyMdhpLAsEO
   XeWnpRuW02fF3n9qgIM//zN3yXJBWI2TVupLrmoPibq9D8GCZJmu41q81
   4GaNJ623wR7e0nNm0si/11dGPoRjsNpvcDg3ox/W6wJpw+Z5dIwkJcFck
   QzgrlnVuHfIK06ni6AhNdwQddFTVbsHK+oLV6HmikksGtSG06kmMFYgrx
   +ynsf9YZRiLj+dDq3Ot/CcFfhuHixxwY0vvHK5N1uS6C8Apb3oRGbw3bv
   II539mT4BpPNpnN1PNmO+6oP09iOmK0xmz2DTXFP/wvx+7IOUYusA3fO3
   A==;
X-CSE-ConnectionGUID: I8CZbhHyRm6+QDZTFqJcLA==
X-CSE-MsgGUID: Vbg3PNmUTmGcqgU2NUt82w==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354544"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: gjSH2OmzQQ2zkn9kBRFh6w==
X-CSE-MsgGUID: 3nmWHI5+TgGw6uDfZBhAuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108474"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Michael J . Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 03/22] platform/x86/intel/vsec: Decouple add/link helpers from PCI
Date: Thu, 12 Mar 2026 18:51:42 -0700
Message-ID: <20260313015202.3660072-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This refactor prepares for adding ACPI-enumerated PMT endpoints. While
intel_vsec is bound to PCI today, some helpers are used by code that will
also register PMT endpoints from non-PCI (ACPI) paths. Clean up
PCI-specific plumbing where it isn=E2=80=99t strictly required and rely on =
generic
struct device where possible.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---

Previous changelog:
  Changes in v7:
  - Correct the remaining struct device * argument to intel_vsec_add_aux().
    When dropping the unused first argument in v6, the device parameter was
    inadvertently changed from &vsec_dev->auxdev.dev to the PCI device.
    Restore the aux device.
=20=20=20=20
  Changes in v6:
  - No change
=20=20=20=20
  Changes in v5:
  - No change
=20=20=20=20
  Changes in v4:
  - No change
=20=20=20=20
  Changes in v3:
  - No change
=20=20=20=20
  Changes in v2:
  - No change (previous patch 1)
=20=20=20=20
 drivers/platform/x86/intel/vsec.c      | 13 +++++++++----
 drivers/platform/x86/intel/vsec_tpmi.c |  2 +-
 include/linux/intel_vsec.h             |  2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index e0096be605d9..938648b9ef09 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -158,18 +158,23 @@ static bool vsec_driver_present(int cap_id)
  */
 static const struct pci_device_id intel_vsec_pci_ids[];
=20
-static int intel_vsec_link_devices(struct pci_dev *pdev, struct device *de=
v,
+static int intel_vsec_link_devices(struct device *parent, struct device *d=
ev,
 				   int consumer_id)
 {
 	const struct vsec_feature_dependency *deps;
 	enum vsec_device_state *state;
 	struct device **suppliers;
 	struct vsec_priv *priv;
+	struct pci_dev *pdev;
 	int supplier_id;
=20
 	if (!consumer_id)
 		return 0;
=20
+	if (!dev_is_pci(parent))
+		return 0;
+
+	pdev =3D to_pci_dev(parent);
 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
 		return 0;
=20
@@ -204,7 +209,7 @@ static int intel_vsec_link_devices(struct pci_dev *pdev=
, struct device *dev,
 	return 0;
 }
=20
-int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
+int intel_vsec_add_aux(struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name)
 {
@@ -252,7 +257,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct dev=
ice *parent,
 	if (ret)
 		goto cleanup_aux;
=20
-	ret =3D intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_i=
d);
+	ret =3D intel_vsec_link_devices(parent, &auxdev->dev, intel_vsec_dev->cap=
_id);
 	if (ret)
 		goto cleanup_aux;
=20
@@ -343,7 +348,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, str=
uct intel_vsec_header *he
 	 * Pass the ownership of intel_vsec_dev and resource within it to
 	 * intel_vsec_add_aux()
 	 */
-	return intel_vsec_add_aux(pdev, parent, no_free_ptr(intel_vsec_dev),
+	return intel_vsec_add_aux(parent, no_free_ptr(intel_vsec_dev),
 				  intel_vsec_name(header->id));
 }
=20
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/=
intel/vsec_tpmi.c
index 98846e88d3d0..2298b6361094 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -655,7 +655,7 @@ static int tpmi_create_device(struct intel_tpmi_info *t=
pmi_info,
 	 * feature_vsec_dev and res memory are also freed as part of
 	 * device deletion.
 	 */
-	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
+	return intel_vsec_add_aux(&vsec_dev->auxdev.dev,
 				  feature_vsec_dev, feature_id_name);
 }
=20
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index d551174b0049..49a746ec0128 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -184,7 +184,7 @@ struct pmt_feature_group {
 	struct telemetry_region	regions[];
 };
=20
-int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
+int intel_vsec_add_aux(struct device *parent,
 		       struct intel_vsec_device *intel_vsec_dev,
 		       const char *name);
=20
--=20
2.43.0

