Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE6281ADA
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 05:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729833474; cv=none; b=P590HiDOd9hXveaIC0j1tx+Hi6MTzCo/plslmbjMZtByeNpZSURX7NJdBHpRsnGiUFzQjGqX6s12DxWh/0pP8U2NSS3NEIFh+2A6QNQdNNpEN+qUEOD0Iz9GdbTwVueNZ6AqrmEctvr3ntmtBYg13qY33pvWh96BTpBb9vbjcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729833474; c=relaxed/simple;
	bh=tazo0QLTKrqw+wMVuKxzm0R7z7/g+AVw1s/FkXLqzAw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=R575PIDGZR8LXBkWZf+gxYS5HYegp6T5t8S8PRye3mD3NkzedVXBWb39heseQmFy6Ta+cNgSBvvJ4r0Ppd3M7S+kSu3VjWRmWpyN3Ck5Vybc6+s0IcprEbsPgt3Fo3X38Kw9Y/GfmGUG0GK705ZFNmKdP0EFcstiN0STtO+mGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=C5CAAW80; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="C5CAAW80"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id D5A2140254;
	Thu, 24 Oct 2024 22:11:41 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id B94A440366;
	Thu, 24 Oct 2024 22:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=dkim; bh=1dqAAv0pzxjxWiUoxquw3RWPGtI=; b=C5CAAW80P77yWDG77SLm
	PdOmfpHSsIBVKvxAWHqQrL9NbCpr7Qbufai+4ekkx+OYJy0zfSWUfCaHQx8/fI+i
	4PyI6DwP5kt3js/8ybp1IKYgjQ6Iq9ZhNKlzxWhv5gLqUOmCipgp69H3XejCtgWC
	kKqlnyA02+XILvTB9Kv7YVA=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 q=dns; s=dkim; b=BuyFsE8TvLQwPSnSGhFxrKiiwHPPbu2Cz/W5R2R0mBJUbu
	TjG/qa8PZZBshfsclGb2ru36Ap5vGs3jkSa8WFl+GDiTwcIakZxO7Bxf5XShuDco
	s3wRP9Ab2lNHfuzXATj3S82l4qW4rVQ8mnAJICinbLGnrE/Wv8FxsAHgMrPds=
Received: from bugfood.local (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id B234C40254;
	Thu, 24 Oct 2024 22:11:41 -0700 (PDT)
Received: by bugfood.local (Postfix, from userid 1000)
	id 841EB2C020A; Thu, 24 Oct 2024 22:11:41 -0700 (PDT)
From: Corey Hickey <bugfood-ml@fatooh.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmc: Detect when STB is not available
Date: Thu, 24 Oct 2024 22:11:41 -0700
Message-ID: <20241025051141.924760-1-bugfood-ml@fatooh.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corey Hickey <bugfood-c@fatooh.org>

Loading the amd_pmc module as:

    amd_pmc enable_stb=1

...can result in the following messages in the kernel ring buffer:

    amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
    ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
    WARNING: CPU: 10 PID: 2151 at arch/x86/mm/ioremap.c:217 __ioremap_caller+0x2cd/0x340

Additional debug shows that this happens when the calls to obtain
S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return 0.

Per discussion on platform-driver-x86@vger.kernel.org, this condition
indicates that the STB is not available.

In order to avoid the ioremap warning, and to help the user understand
the situation, catch the invalid address and print an error.

Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
---
 drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index bbb8edb62e00..72b1dfc64bf1 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
 
+	if (!phys_addr_hi && !phys_addr_low) {
+		dev_err(dev->dev, "amd_pmc: STB is not enabled on the system; disable enable_stb or contact system vendor\n");
+		return -EINVAL;
+	}
+
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	/* Clear msg_port for other SMU operation */
-- 
2.45.2

