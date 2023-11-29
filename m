Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8dYxSsW"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6143C9;
	Wed, 29 Nov 2023 14:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296500; x=1732832500;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xvZYvHgO1aPnYX1bisLdg94DIXjNqrQoBT9Flv01IZY=;
  b=m8dYxSsWIwKIM1Ut0G6DiiMx9x4clXiFz9UO57FSFUUL4jUar7GMXJbK
   jlgpNqK28yqq/qOxb/SW5fe3REWjgRperIQ2YXEvVHxToM7Nw4ujAMaKj
   qTQoMw16EfmUIgZzlBc+Wduy/vJJOQc43MTPJBAxDLJ/Zb12R2fHZ+QUe
   JK2aYUy8rEVVrZN2PV1OQrn5AiciVN0KejrVp5QRFxLu5/Sa6h3HmK71n
   dYjROWCwJ2jS0BRkhT/WJMhwjvHPqwo8+XImD6dxhhXNPReNgDPurccyR
   vZua7d8WfiKi4w8Ex/l2Y7q2lbn7S5jvnenLOz++dqWVyqxLE293lu4dl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937000"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937000"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070417"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070417"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:33 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 686685807E2;
	Wed, 29 Nov 2023 14:21:33 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 06/20] platform/x86/intel/vsec: Assign auxdev parent by argument
Date: Wed, 29 Nov 2023 14:21:18 -0800
Message-Id: <20231129222132.2331261-7-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129222132.2331261-1-david.e.box@linux.intel.com>
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of checking for a NULL parent argument in intel_vsec_add_aux() and
then assigning it to the probed device, remove this check and just pass the
device in the call. Since this function is exported, return -EINVAL if the
parent is not specified.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No change

V5 - New patch

 drivers/platform/x86/intel/vsec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 27e8698ebe5e..329ba03a6da0 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -103,6 +103,9 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
 	int ret, id;
 
+	if (!parent)
+		return -EINVAL;
+
 	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
 		       PMT_XA_LIMIT, GFP_KERNEL);
 	if (ret < 0) {
@@ -120,9 +123,6 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 		return id;
 	}
 
-	if (!parent)
-		parent = &pdev->dev;
-
 	auxdev->id = id;
 	auxdev->name = name;
 	auxdev->dev.parent = parent;
@@ -204,7 +204,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	 * Pass the ownership of intel_vsec_dev and resource within it to
 	 * intel_vsec_add_aux()
 	 */
-	return intel_vsec_add_aux(pdev, NULL, no_free_ptr(intel_vsec_dev),
+	return intel_vsec_add_aux(pdev, &pdev->dev, no_free_ptr(intel_vsec_dev),
 				  intel_vsec_name(header->id));
 }
 
-- 
2.34.1

