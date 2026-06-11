Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58F34A3D6;
	Thu, 11 Jun 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152495; cv=none; b=cQJpYPASRuAWS/eKf9mn6TGUKUHkmC+yPJZuadWzCdTqKgCphgS48TclFJboOzWgZLk0IHifxZy9g5ZlsOjDH+n/aw6L3rz+UFHqD6qw+LGLKJkgLOeTb8tKQQze6/VQfVkhSlbu8ivwxgGBEH5EFXXf+tqFyfS0H07A0WunhTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152495; c=relaxed/simple;
	bh=FLkS+GZdWTJKOYTS8ViFO1vaiuJ2oJ7m6y/vn5sNHrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W028zdcEJhLuGLLIBWogQIcIpec5jN9wxrejDVbV5Nu/qgoycNJ+sNcw+5GrAiSVCqMoEI0F4Jaacy/ZgDr4f2pLV8JMDNzOgAgCg6vPpT+JP6HcrdiwDlIJGvaS68wEMajFuyYEWmBUrZatEs4A7eCC51sZ9uQe8QXoPCzt86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJhiQ1T0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJhiQ1T0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152493; x=1812688493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FLkS+GZdWTJKOYTS8ViFO1vaiuJ2oJ7m6y/vn5sNHrU=;
  b=BJhiQ1T0RM/Mu65xtXX8ORfDV9JOH775CqX6RKwZLM90Ba7aSpKnq8hi
   LCxAST6SEferPUzVPBdXCV734vJphkPuVQd3UjYjp1DPUlnllP1uyruQ9
   7PYvAnOVV7kCFvsi4ii5jZf8oOTzxsRpjs4KCeD8/NF/ssT7mscGK6rD2
   rWMV84z84OiuFnxEWSSjSsznps6tJMJ1K93t4HfR8r9bXjZhmgMpyZSo7
   PyA5EACmbUHNbnyPLgXAH9KY1EYfcjr7HkEvzZXyfYVPmFJf4tmNaHDKf
   OpLHR99b7kzpG/s9syBQhxLMszAkHKJmQSOWYXlEZr0BR4K7rMb2eUr+8
   Q==;
X-CSE-ConnectionGUID: HmY17OXqSdKk56VWfkY9UA==
X-CSE-MsgGUID: 6Gv0djOxTZGVvJ5vk40RLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84530991"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84530991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:52 -0700
X-CSE-ConnectionGUID: cHQqcOwgTbqetUXnFOh5+g==
X-CSE-MsgGUID: bAWQwhAEQNKBp2YDQhz7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468342"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:51 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 03/15] platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
Date: Wed, 10 Jun 2026 21:34:31 -0700
Message-ID: <8a4824ed90be82bdf7494e173b0f122fde663aa4.1781146840.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781146840.git.david.e.box@linux.intel.com>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Update the telemetry namespace to use the new PMT class pre/post decode
interface. The overlap check, which previously occurred during header
decode, is now performed in the post-decode hook once header fields are
populated. This preserves existing behavior while reusing the same header
decode logic across PMT drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V7 - No changes

V6 - No changes

V5 - No changes

V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmt/class.h     |  1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 24 ++++++++++++++--------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index ff39014b208c..8a0db0ef58c1 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -37,6 +37,7 @@ struct intel_pmt_header {
 	u32	size;
 	u32	guid;
 	u8	access_type;
+	u8	telem_type;
 };
=20
 struct intel_pmt_entry {
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index bdc7c24a3678..d22f633638be 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -58,14 +58,9 @@ struct pmt_telem_priv {
 	struct intel_pmt_entry		entry[];
 };
=20
-static bool pmt_telem_region_overlaps(struct intel_pmt_entry *entry,
-				      struct device *dev)
+static bool pmt_telem_region_overlaps(struct device *dev, u32 guid, u32 ty=
pe)
 {
-	u32 guid =3D readl(entry->disc_table + TELEM_GUID_OFFSET);
-
 	if (intel_pmt_is_early_client_hw(dev)) {
-		u32 type =3D TELEM_TYPE(readl(entry->disc_table));
-
 		if ((type =3D=3D TELEM_TYPE_PUNIT_FIXED) ||
 		    (guid =3D=3D TELEM_CLIENT_FIXED_BLOCK_GUID))
 			return true;
@@ -80,15 +75,25 @@ static int pmt_telem_header_decode(struct intel_pmt_ent=
ry *entry,
 	void __iomem *disc_table =3D entry->disc_table;
 	struct intel_pmt_header *header =3D &entry->header;
=20
-	if (pmt_telem_region_overlaps(entry, dev))
-		return 1;
-
 	header->access_type =3D TELEM_ACCESS(readl(disc_table));
 	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
 	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
=20
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size =3D TELEM_SIZE(readl(disc_table));
+	header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
+
+	return 0;
+}
+
+static int pmt_telem_post_decode(struct intel_vsec_device *ivdev,
+				 struct intel_pmt_entry *entry)
+{
+	struct intel_pmt_header *header =3D &entry->header;
+	struct device *dev =3D &ivdev->auxdev.dev;
+
+	if (pmt_telem_region_overlaps(dev, header->guid, header->telem_type))
+		return 1;
=20
 	/*
 	 * Some devices may expose non-functioning entries that are
@@ -131,6 +136,7 @@ static struct intel_pmt_namespace pmt_telem_ns =3D {
 	.name =3D "telem",
 	.xa =3D &telem_array,
 	.pmt_header_decode =3D pmt_telem_header_decode,
+	.pmt_post_decode =3D pmt_telem_post_decode,
 	.pmt_add_endpoint =3D pmt_telem_add_endpoint,
 };
=20
--=20
2.43.0

