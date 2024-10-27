Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC22A95C
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Oct 2024 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729996476; cv=none; b=TgKZllZSIYX4DZTHuIr1r+QRhepvBfV7qAWsX9lUwLDwTztdfO4WVr3wK1EPmo7MSY5TxY1YW4fTKHALfQfnn1byxzp66R6A9W7+dwLFRu+hZypPaj117qO1YWfg+tQMFXNfnSNlSJu6brnv6u3KlLrWBRQAs/zdPZAImLVQHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729996476; c=relaxed/simple;
	bh=0RKf6eAdD9YBOugjpNrva9EEoJg6NtOJyMmwj6DaPQM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsOURTxekLYWL1SMO5aLAGiaGq4GMd25oxy8VNeVLbzU3o3zGfM2ZtGp7l7g9TgsPf6NImg9EneX9o+ydlCx0MiT76VP1HUHXnKmaMrjXah8laU0E4Kazp9wJ73yKE0JmA+NfMXV9uFeiJRhOKmbricUWcaQopOugz//j6x6zyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=mJHzaaND; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="mJHzaaND"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 6C159404BC;
	Sat, 26 Oct 2024 19:34:28 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 52657404BD;
	Sat, 26 Oct 2024 19:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=dkim; bh=oNAGY+q4PfpKQJtnYodSy+ttJ
	wU=; b=mJHzaaNDuO3UVv3g5rjgKc2cpaf2YuVrmabH+9iaNEGwNOJaNVgmAXwgK
	WALhpvvXAisyZ/+cy+4YUVSDKBN82g7+XzIqeYS68793TrwEVkq+Oi+kooOywH5f
	0JPaz3qs5Lh46uEamlbkkVvjQ8vLiOKfITofMLvfOkeaKc1v8Y=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=from:to
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; q=dns; s=dkim; b=BvgGk+a+abWiprscGUX
	v5WFZzw8M944u1iz75/OgUDvcUAoHm63dm4Y8lzFsdp1H/j/1qM4TgyUHRgXr7k5
	uQ06E1i6Id8BAI1AhK8xR1sDCiLMroFqsaG0rDqRGrAovKdC1fY7CuP1/RKv8jgF
	K+ZT/yNnOTve8wNaV9K9RfDc=
Received: from bugfood.local (unknown [IPv6:2600:1700:9750:59ef:2efd:a1ff:feba:f3af])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 4EF53404BC;
	Sat, 26 Oct 2024 19:34:28 -0700 (PDT)
Received: by bugfood.local (Postfix, from userid 1000)
	id 124A02C056A; Sat, 26 Oct 2024 19:34:28 -0700 (PDT)
From: Corey Hickey <bugfood-ml@fatooh.org>
To: Corey Hickey <bugfood-ml@fatooh.org>,
	platform-driver-x86@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2] platform/x86/amd/pmc: Detect when STB is not available
Date: Sat, 26 Oct 2024 19:34:27 -0700
Message-ID: <20241027023428.419116-1-bugfood-ml@fatooh.org>
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

Additional debug shows that this happens when the calls to obtain
S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return 0.

According to Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, this condition
indicates that the STB is not available.

In order to avoid the ioremap warning, and to help the user understand
the situation, catch the invalid address and print an error.

Link: https://lore.kernel.org/platform-driver-x86/c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com
Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
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

