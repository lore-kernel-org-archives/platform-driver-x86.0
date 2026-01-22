Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D473A6402;
	Thu, 22 Jan 2026 03:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051360; cv=none; b=NCkWwkKCEcGhsdbZOgIFnwlKDsz8Oh+SM1V3Ad3JqS407B77R2vztNrD3YloiXyPH9hVkP/7cT7A1CahlKYzaResNlNFRiR8ISJYRn9YaCX0BhIsB1ffRyvK5LYwk+/DwvL/u057OB3APTuK/ZM//DM9FCOV14HOlxfSA77tMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051360; c=relaxed/simple;
	bh=gYeoo7q2gcsmWeWAuD66ivUnD+WG3xUpRH1yys6edd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNEzI+6aZv4n13lZV4clgpP8NfLprWkkAsPeQIFSLhC9yiNW0h3ihogJN3xXjZ0QM7Pf3Mzy+YHrziI21wIAyxmYlUkdg9NDdce1IEzVAR4PgbnGQnjbZzB8o8z6A/oQgNyfj9YW6GbluoulXIe7Qvz7ZF+koDM5gI376RDjKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJarm4g3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJarm4g3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769051358; x=1800587358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gYeoo7q2gcsmWeWAuD66ivUnD+WG3xUpRH1yys6edd4=;
  b=MJarm4g3hMlo4DwEeTkBIdtCwwTVonbSejXitUz3eaXV9nXi6t/BPCNr
   Qo3b9MJBykuvbELITw9fxO2rot4zb5jWKwXjhOmzKzGZHIgZLXnXm4yJC
   olcJlPx4+A9xYAHTxdPz9frY9lxxIHrsFgS63Zb0J7xRvcyTEA50kqFEs
   7vW6Bl1ofVFXoCIgoXvmZygMZUBq9Dg8O42GcjvCqVEFuEw6oxs5QwCH9
   rJUpmlxT621C4IMNjtO5HQkTfJcicI/44rX4pSc3qpD/aCz85t8mvD0Lu
   4GENNymQptQo4+tVvgEUJo+SVNASR2v0cT/1Fax/8urn2l7ZdbaIJ5rO4
   A==;
X-CSE-ConnectionGUID: dWHEVe4oQHqvjJJgcKuRAw==
X-CSE-MsgGUID: 0rR9puvpR7KVq0djo2zRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81733107"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81733107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:09:15 -0800
X-CSE-ConnectionGUID: Lj9AS5Z/S72vq/xcea1n2A==
X-CSE-MsgGUID: EphVaxp/S2iui1r/3891dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="211058841"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:09:14 -0800
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
Subject: [PATCH v3 5/6] platform/x86/intel/vsec: Return real error codes from registration path
Date: Wed, 21 Jan 2026 19:09:00 -0800
Message-ID: <20260122030903.3247167-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122030903.3247167-1-david.e.box@linux.intel.com>
References: <20260122030903.3247167-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Stop collapsing registration results into booleans. Make
intel_vsec_walk_header() return int and propagate the first non-zero error
from intel_vsec_register_device(). intel_vsec_register() now returns that
error directly and 0 on success.

This preserves success behavior while surfacing meaningful errors instead
of hiding them behind a bool/-ENODEV, which makes debugging and probe
ordering issues clearer.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---

v3:
  - No change

v2:
  - No change (previous patch 3)

 drivers/platform/x86/intel/vsec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 675074c90b79..4aeb0728b435 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -461,20 +461,19 @@ static int intel_vsec_register_device(struct device *=
dev,
 	return -EAGAIN;
 }
=20
-static bool intel_vsec_walk_header(struct device *dev,
-				   const struct intel_vsec_platform_info *info)
+static int intel_vsec_walk_header(struct device *dev,
+				  const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
-	bool have_devices =3D false;
 	int ret;
=20
 	for ( ; *header; header++) {
 		ret =3D intel_vsec_register_device(dev, *header, info, info->base_addr);
-		if (!ret)
-			have_devices =3D true;
+		if (ret)
+			return ret;
 	}
=20
-	return have_devices;
+	return 0;
 }
=20
 static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
@@ -580,10 +579,7 @@ int intel_vsec_register(struct device *dev,
 	if (!dev || !info || !info->headers)
 		return -EINVAL;
=20
-	if (!intel_vsec_walk_header(dev, info))
-		return -ENODEV;
-	else
-		return 0;
+	return intel_vsec_walk_header(dev, info);
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
--=20
2.43.0

