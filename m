Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B23A268
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138571; cv=none; b=UT5vWAVL+gm3B1q5DvuZSGV5He/WN0B8Nlt/zuQLpocVGDJ3zsjkKV78amUQngskw5B5U/a134Eh7AJtf34tKN8Ve9BtUJtHFw6Fk7DvrVOLfGtUpB5Lzgr+FGabvGEoG3QYcbakObkgeV7moxiey8hhUyrXkVcpyyNreqno2Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138571; c=relaxed/simple;
	bh=ivpTMk06MMozGDctBej53Vdot/AYr1qIFW/ZZwz2Ank=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwLcFSA4tWlG4tILWNvhP3hVT5K464w1V4vAyWtvu6GtuIvBAPM6TscO4yWlQSADidz0+46bl4XXC7avzoKg/MjZvflFNh7cKMzTzuXU9ieg8NaMp82518VuCw84ySxXR5iYkEPzYdQDXTUCkfBnSjuOWYcfp/znxG9SERyd5XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=Kpmb9LsP; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="Kpmb9LsP"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 258B3401F6;
	Mon, 28 Oct 2024 11:02:42 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 06BFF403F3;
	Mon, 28 Oct 2024 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=dkim; bh=C5LMndAS7Pesc70XMAYSA/TY8
	F0=; b=Kpmb9LsPPOh8n/zIF5ETRG30R7MK92kY7756x3kOMFQ5Ypl4hIlXPNcLp
	oHGLrHV8nZ1avXFYIE4lrkW+verbG8vzTLW+giF/RQJ5zlboGdqf5bxduEVqxBVy
	2x8d5Ax25PRUlClSHUDDFqkrq5cjDV5UpQ9LoAME/M+cxFTr1g=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; q=dns; s=dkim; b=IHCUy2359e7MCJ72xav
	ElgkcwoQoOuLF8sfdeGdsK4YXX8XFDXUOOB5IMPwqum313LJjkjJnHXITQghOO12
	OPFpGaQK6+moeAD0ISM98SjAxy8QCvAFtOvphtdT/ajvfsM+XekEfh+9iiSPwYpc
	O4GBg+iutIQmbET18uyW6/vY=
Received: from bugfood.local (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id F1C08401F6;
	Mon, 28 Oct 2024 11:02:41 -0700 (PDT)
Received: by bugfood.local (Postfix, from userid 1000)
	id CE0F22C026D; Mon, 28 Oct 2024 11:02:41 -0700 (PDT)
From: Corey Hickey <bugfood-ml@fatooh.org>
To: Corey Hickey <bugfood-ml@fatooh.org>,
	platform-driver-x86@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3] platform/x86/amd/pmc: Detect when STB is not available
Date: Mon, 28 Oct 2024 11:02:41 -0700
Message-ID: <20241028180241.1341624-1-bugfood-ml@fatooh.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025051141.924760-1-bugfood-ml@fatooh.org>
References: <20241025051141.924760-1-bugfood-ml@fatooh.org>
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

Further debugging reveals that this occurs when the requests for
S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return a value of 0,
indicating that the STB is inaccessible. To prevent the ioremap
warning and provide clarity to the user, handle the invalid address
and display an error message.

Link: https://lore.kernel.org/platform-driver-x86/c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com
Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
---
 drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index bbb8edb62e00..5669f94c3d06 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
 	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
 
+	if (!phys_addr_hi && !phys_addr_low) {
+		dev_err(dev->dev, "STB is not enabled on the system; disable enable_stb or contact system vendor\n");
+		return -EINVAL;
+	}
+
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	/* Clear msg_port for other SMU operation */
-- 
2.45.2

