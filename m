Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922153590A8;
	Thu, 22 Jan 2026 01:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046603; cv=none; b=ST+R0GwGEeSSwG3ZOl+Lkj2TfSxXDFdnW8zhabBaNcHL+ENd6HiX0iXuyCemeYTw/3J1wwbG4cWvaHVkOWjyTm9sA8jgZFj5u+i7BvHk1FHR+ttNAbYdcJsd+jKLiUs+V+5NaARYb1TfjO8/5JYMN/b9+6apHPlTUibjhc5kQlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046603; c=relaxed/simple;
	bh=aKL+BLox5AfmzlV1l9hkz1vFtq/B89pPGLRNBGoDQOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=du8BXhy+s2MPUAbixXPEts2GhWo9B3AZhkaENI4eJLbQbU7uKubfdfs5hJ9fxCn92M75qipToYKgk7Q00O3pdH4b1ECXwcnwPhHjgKKuk/5pbrIqNxDH30SeQtyuCqyVtq8kN+syH/kKulWyNcS8Qbjz8up2iax97xn82vWBjxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j53DPfkW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j53DPfkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046602; x=1800582602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aKL+BLox5AfmzlV1l9hkz1vFtq/B89pPGLRNBGoDQOk=;
  b=j53DPfkWvF79PYMekn6Z+5wKOvJcsoRdSFOM/rhQmTYu41+aCDR9jd26
   ydeGTw8tX7YAc+jNnQ0aOepUhbb/LuluXiLzX82SULjoDvrHDAZMCVNjH
   CBDMF7sXn9aABBWGoZB2Prj+tgHX3Ab59jlL+5lDstVjVEd7P+OVSpcTA
   pGjQJxcrZNBnymqLFSVkjFhiy23ioa0kr2YFE7MXBvsbkZAfieHZOTuSi
   eBIqp/8EA1hCuEzP3JV/Zv78yTOt48oGlmxE8UShkuZW0aKSR9yxetfM/
   ihhN4UGUdQ/QuBy17bdcJl9O/6EAg6EuZdNoYINu9/60BJO/uX1LgCxpA
   A==;
X-CSE-ConnectionGUID: LyHQP3a7Rr66+xNOapoSzQ==
X-CSE-MsgGUID: VTr+DnqpRzGdqihpidJqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="73910937"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="73910937"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:49:56 -0800
X-CSE-ConnectionGUID: OzuRyhmGS5eEwv/k8Tcu7A==
X-CSE-MsgGUID: 2s6++D1kTTiUp0cOe95V6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211616426"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:49:56 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/6] platform/x86/intel/vsec: Decouple add/link helpers from PCI
Date: Wed, 21 Jan 2026 17:49:44 -0800
Message-ID: <20260122014948.3158069-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122014948.3158069-1-david.e.box@linux.intel.com>
References: <20260122014948.3158069-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This refactor is prepares for adding ACPI-enumerated PMT endpoints. While
intel_vsec is bound to PCI today, some helpers are used by code that will
also register PMT endpoints from non-PCI (ACPI) paths. Clean up
PCI-specific plumbing where it isn=E2=80=99t strictly required and rely on
generic struct device where possible.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---

v2:
  - No changes (previous patch 1)

 drivers/platform/x86/intel/vsec.c      | 13 +++++++++----
 drivers/platform/x86/intel/vsec_tpmi.c |  2 +-
 include/linux/intel_vsec.h             |  2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 61b32ae7f064..f850343491fc 100644
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
index 7748b5557a18..180bc5e18e06 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -655,7 +655,7 @@ static int tpmi_create_device(struct intel_tpmi_info *t=
pmi_info,
 	 * feature_vsec_dev and res memory are also freed as part of
 	 * device deletion.
 	 */
-	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
+	return intel_vsec_add_aux(&vsec_dev->pcidev->dev,
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

