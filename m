Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410194;
	b=NF0791MDteSWH0S2hlyG76QbKs49Gj/yfA5HkYMKM5615OD3x4PPApG6tXzGnB+hMQlQ
	 FuB6BMmGGGj3LdmgQdEOgiExFiAXeenrhFzZ9d3NPg754xDvH5KXxVaKe0SWDHWskNAWK
	 aXjxtD0PIKDJzfvH0qSC25ZRmS7mACufc2fQ+g4ieM1xCogRaW3PxRyAuLWiWlsxadoFT
	 luSf1kZwm1r2xttEQcsFulLDKHdQ+wbpgWhjvtW/95hicWjztrCq4Gifnphrmre5csKeY
	 gtNpYclgKKWpqsuuV70ZJWItSYcc/YyQWfPWiDVaUDHgV8bxiLkNy+OnPot5R+lGnrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410194;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=48u8q9gbjgm+FnmBNe9mWVyF+rAqI8YoLJBqJ5vrjbc=;
	b=tNxaXxOXjXawH8nXchB8sCaQy8C43pINCAl11pFDnMVPQZ10B4m9ZUBjLPQOaU/LGURE
	 VYIwGj4HIZCIFxA9OZJ2+5cgWvEajEba3OQtxSKyKlBiuJ1Hnjqg+RHnvJTCDcFsOpvWG
	 l19zbDR6rRWckGGxe2mQ0/6uryrOQDgPy3NkFfATZwlEE1emzl6iySJGRBcLK2s8IUyfb
	 U/2DOXzKJRVYtvS1jWxQVHHDzL42rrYl3xSmEjo0d9qR8WzMn2a7nrO7GSdwlVneLvQ5X
	 Tw6c3+Ui8b9gk71IdHYg2OQ2u1Es8Mos0+GaEADbUiiOsBqd2UKWR370O6vy7axDZtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cglssmy+;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583A606A329;
	Sat, 31 Oct 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B583A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cglssmy+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793410189; x=1824946189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LRiKvRUskUruRWJMg/LsXb4ThqjjFUrvPJlq+ZPlX2w=;
  b=Cglssmy+95nA78tNwMlXS5sOkr9k5RTdFoOkMTCOCxC+tw44eK/TOEVb
   1/gjMXIDdF6Aqz8Op6JAT4KHFq9kHIFigMsXoOKlaIFmu1m1Si3zR9pMs
   zE/fS9QMUGa/hE+jKxSxv8juSBGshMn5VXUntVGwR/PWw0FTmMXj0u3/5
   J6DYCsmCQn0nf1BrMTPgROCKvdRKEekTgiz6xEXGgvOf2Adb4cMu9WLc+
   +KgFfHXx09mwLo+sny1ghIWhc73VN2QlZWKS6XRB3h2aGvhgZ6VvU3ee9
   GSgHFvSrsZBol17EVSNtAJ5MXE8n/0OD1raaO9FoB5hj+caeFongqIbE/
   w==;
X-CSE-ConnectionGUID: N7h26zIzTg2g5/h88wbHTQ==
X-CSE-MsgGUID: amjMmt9QSGSfgB+xqBgtQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2213338"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2213338"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
X-CSE-ConnectionGUID: YmNQ32gQRdmsfzYwTlrarw==
X-CSE-MsgGUID: rxrHooNkRa+GI/KhRuk5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7397959"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:29:46 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] platform/x86/intel/pmt: Validate telemetry regions against the BAR
Date: Fri, 30 Oct 2026 18:29:38 -0700
Message-ID: <20261031012939.377995-7-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031012939.377995-1-david.e.box@linux.intel.com>
References: <20261031012939.377995-1-david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

pmt_resolve_access_pci() computes the base address of a telemetry or
crashlog region from the base offset and BAR index in the device's
discovery header, and the region size also comes from the device. The
resulting range is ioremapped by intel_pmt_dev_register() and can be
mmapped by userspace through sysfs, but it is never checked against the
BAR it claims to be in. A malicious or broken device can therefore
direct the driver at MMIO outside its BAR. For ACCESS_BARID the BAR
index is three bits, so it may also select BAR 6 or 7, which are not
standard BARs.

Check the region against its BAR before it is mapped: the BAR holding the
discovery table for ACCESS_LOCAL, or the BAR named in the header for
ACCESS_BARID.

Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 2b11c4012f6a..8f87f8db3966 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -214,6 +214,10 @@ static int pmt_resolve_access_pci(struct intel_pmt_ent=
ry *entry,
 	struct device *dev =3D &ivdev->auxdev.dev;
 	struct intel_pmt_header *header =3D &entry->header;
 	struct resource *disc_res;
+	struct resource res;
+	/* BAR the region lives in, the discovery BAR unless the device names one=
 */
+	unsigned int bar =3D ivdev->tbir;
+	int ret;
 	u8 bir;
=20
 	/*
@@ -258,6 +262,7 @@ static int pmt_resolve_access_pci(struct intel_pmt_entr=
y *entry,
 				   (disc_res->start <=3D pci_resource_end(pci_dev, i))) {
 					entry->base_addr =3D pci_resource_start(pci_dev, i) +
 							   header->base_offset;
+					bar =3D i;
 					break;
 				}
 			if (!entry->base_addr)
@@ -280,6 +285,7 @@ static int pmt_resolve_access_pci(struct intel_pmt_entr=
y *entry,
 		 */
 		entry->base_addr =3D pci_resource_start(pci_dev, bir) +
 				   GET_ADDRESS(header->base_offset);
+		bar =3D bir;
 		break;
 	default:
 		dev_err(dev, "Unsupported access type %d\n",
@@ -287,6 +293,20 @@ static int pmt_resolve_access_pci(struct intel_pmt_ent=
ry *entry,
 		return -EINVAL;
 	}
=20
+	/*
+	 * The base offset and size come from the device. Make sure the region
+	 * lies within the BAR it claims to be in before it is mapped.
+	 */
+	if (header->size) {
+		res =3D DEFINE_RES_MEM(entry->base_addr, header->size);
+
+		ret =3D intel_vsec_check_bar_resource(ivdev, bar, &res);
+		if (ret) {
+			dev_err(dev, "Region %pR is outside of its BAR\n", &res);
+			return ret;
+		}
+	}
+
 	return 0;
 }
=20
@@ -574,3 +594,4 @@ module_exit(pmt_class_exit);
 MODULE_AUTHOR("Alexander Duyck <alexander.h.duyck@linux.intel.com>");
 MODULE_DESCRIPTION("Intel PMT Class driver");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("INTEL_VSEC");
--=20
2.43.0

