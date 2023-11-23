Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4b7QTib"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B081BE;
	Wed, 22 Nov 2023 20:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712238; x=1732248238;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZNP+0mMTg9UYIFCYqwmcsOydsKIWsjAN9iCN8hOaigM=;
  b=Q4b7QTibKv6mnrdsAc/hnBQZ/saCvqsHtsDlHJNCNivGlGH7XwxmSapg
   04/rizd0Kusyrvm2BMv/icWtZB9nEGWib4Fc+QF0v+HV0a0nMMiKnz0N7
   8XGvMU5Wb/JmSJ9fxVJgbME8HhLOqr3qMM3KW9o1SwuQeNjfGNx28gmn1
   BbTpofz9Re67vZIsnJfMRLSShpyUkWC8tfj+VbjS54rMD6I5iTJF92IF4
   p2Xcq/m0v8SZlihRPha4o3vFAKddCpCd5iVAjpIzI04eD+fDKwnplbGIm
   gTpjiaCEvyFho7uf3wca4WCT8N0mCKyl4ltlcIu8X7KmzFeCO+5F6CRoe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389347945"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="389347945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801925648"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801925648"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:56 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id F14E7580D81;
	Wed, 22 Nov 2023 20:03:55 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 05/20] platform/x86/intel/vsec: Assign auxdev parent by argument
Date: Wed, 22 Nov 2023 20:03:40 -0800
Message-Id: <20231123040355.82139-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123040355.82139-1-david.e.box@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of checking for a NULL parent argument in intel_vsec_add_aux() and
then assigning it to the probed device, remove this check and just pass the
device in the call. Since this function is exported, return -EINVAL if the
parent is not specified.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 - New patch

 drivers/platform/x86/intel/vsec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 7dc3650f2757..7a717183c58b 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -103,6 +103,9 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
 	int ret, id;
 
+	if (!parent)
+		return -EINVAL;
+
 	mutex_lock(&vsec_ida_lock);
 	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
 	mutex_unlock(&vsec_ida_lock);
@@ -124,9 +127,6 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 		return ret;
 	}
 
-	if (!parent)
-		parent = &pdev->dev;
-
 	auxdev->id = id;
 	auxdev->name = name;
 	auxdev->dev.parent = parent;
@@ -212,7 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	 * Pass the ownership of intel_vsec_dev and resource within it to
 	 * intel_vsec_add_aux()
 	 */
-	return intel_vsec_add_aux(pdev, NULL, no_free_ptr(intel_vsec_dev),
+	return intel_vsec_add_aux(pdev, &pdev->dev, no_free_ptr(intel_vsec_dev),
 				  intel_vsec_name(header->id));
 }
 
-- 
2.34.1

