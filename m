Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456A225BEF8;
	Mon, 17 Nov 2025 03:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763350451; cv=none; b=ZX02GApmvTFaXDs2kluneejXG5IOuRYi4RpWxNuQ2ozt0NkpIRlkHuJh6LfH/EJAgFSrRNTWMZiI67/SwM+KQzm6GCpoVYPiTAN67yWIdag/sFBBpMYohJ+Au2HCBS3KiDFxAMyRpQMbcMyo68wyVcFztieYFXUUUKeF+f0h8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763350451; c=relaxed/simple;
	bh=Th1olMP6XtxSssOFwBaCwRgvju1TvPX/Bvo4zo4VN1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOpFIjAcIhEBXJv6sWHyIAMQj1yXB5z5O3/a/mqvRwNX0akwUBmuz2uLvbQcs04RBtPIsh0ktD2oByl2PV6a4jT6NqUgDc8g1REduhzXVE44JV/aJVUQA9dCy2fybc8FpaE3ikTiMtgs0uvSYOFKUmf6G9+Ao3aFWvTkx9l9JqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowADXYdSplxppg3UHAQ--.27044S2;
	Mon, 17 Nov 2025 11:34:03 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos
Date: Mon, 17 Nov 2025 11:33:54 +0800
Message-ID: <20251117033354.132-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXYdSplxppg3UHAQ--.27044S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1Uuw45tFyftryxGw15urg_yoW8Gw1kpa
	yDZw4ayr43Jr4Fka4kAF48ZFs8uayqk3y7Wr1j9wnxZF45JFW3AF4ftayag34YkrW8Ca4F
	qa1UtF45ZayDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwJA2kag5dUkgAAsh

isst_if_probe() uses pci_read_config_dword() that returns PCIBIOS_*
codes. The return code is returned from the probe function as is but
probe functions should return normal errnos. A proper implementation
can be found in drivers/leds/leds-ss4200.c.

Convert PCIBIOS_* return codes using pcibios_err_to_errno() into
normal errno before returning.

Fixes: d3a23584294c ("platform/x86: ISST: Add Intel Speed Select mmio interface")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
index 3f4343147dad..950ede5eab76 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c
@@ -108,11 +108,11 @@ static int isst_if_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	ret = pci_read_config_dword(pdev, 0xD0, &mmio_base);
 	if (ret)
-		return ret;
+		return pcibios_err_to_errno(ret);
 
 	ret = pci_read_config_dword(pdev, 0xFC, &pcu_base);
 	if (ret)
-		return ret;
+		return pcibios_err_to_errno(ret);
 
 	pcu_base &= GENMASK(10, 0);
 	base_addr = (u64)mmio_base << 23 | (u64) pcu_base << 12;
-- 
2.50.1.windows.1

