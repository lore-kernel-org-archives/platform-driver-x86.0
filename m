Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5230E821;
	Mon, 24 Aug 2026 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787611594; cv=none; b=DiaLSCiD8omDQXxNNGDw2wLQUUtwQnCTFdVTxMp+R1BP6MZASLVzsawXLdEUc81O2oicFiQRI4NGEc05pzDum1EuVgYlluWyfOSAz4o5vSXaGFohtILCgjir8KmUkaps92ta7IdrZaRP7F4DpWFNhDdaszCK58otFp0LJblfA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787611594; c=relaxed/simple;
	bh=eCh2s5j6XPCxZy+jrR2r26IPPYgdJbg05xyaKwY9oHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JmM0H2UUH0y+aAdvlseIWqVVrAOO8GYYQEMx2bfD93SHsq+ZINx31iRxndkrc0i430CCHX/5qngjWzz9r8HdNHkd7sWdXIFJ0OSYN3sd7citOL4M38zy82yTDwRqZzcfHj4a5oI6sRqnbw5zDiznHh8idjWsZzchsIvBXpedm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tocgoxtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tocgoxtp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0754C19425;
	Mon, 24 Aug 2026 22:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787611593;
	bh=eCh2s5j6XPCxZy+jrR2r26IPPYgdJbg05xyaKwY9oHY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tocgoxtpd/BHpeX81TDRLj3o0W+FzxdMjDyRyqIlC7L4bN9L9ZL948m22bKtJ7lZl
	 rzieACYVQQbPjWgrPid7MUNQ7e2sxwtQv+zHZnYh513G4V998e5WYcgXByliKZfhoW
	 E/7F/du+xl4jinm+p8qvZxYKRNcPuH3IujlyTfKFxUy9KSXaS2d2Mxmheu0JOUEhDD
	 jdq47B9Ll6QIIiBbWKDw7h1/07US3LKx2tK9tgGV2f+xQe0FHLgbCbo1rkVagOcTae
	 u4gTMOvxf22vm3O3kLruhc/iip7IDyoaaswwFWeNkHYX1VHn/mS5H387xpD9f2Gsrg
	 jFhnL6eKKwJPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C296C5DF94;
	Mon, 24 Aug 2026 22:46:33 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Tue, 25 Aug 2026 00:46:33 +0200
Subject: [PATCH v2] platform/x86: asus-wmi: suppress -ENODEV warning in
 fan_curve_get_factory_default()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260825-fan-curve-v2-1-2ee1ffd2a1a3@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3bTEPN3k0qKyVN3UPH8X1zAloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0AMvTBv2cAAAA=
X-Change-ID: 20260824-fan-curve-enODEV
To: luke@ljones.dev
Cc: denis.benato@linux.dev, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
 corentin.chary@gmail.com, fxzxaxon@outlook.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787611592; l=1285;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=5pBe+s77ZOy93/fwA7ehJ07ZlIr00ptgYIjNjLjwA9w=;
 b=E5yuCqVjc4wnPArmrapjBIVXmsVi5slpvrrhIjDrAnQ2nEaNHVMIj8lPs1S5KPNOD3xd+LzFH
 12olN68QLxeCvLpySxHi0RyuKYxUcyV2HyAybNYGsF4dYeNAA6QFc5s
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

When firmware does not support the fan curve WMI method,
asus_wmi_evaluate_method_buf() returns -ENODEV. Callers treat this
as non-fatal, but the pr_warn() here still fires, producing
spurious boot noise on unsupported hardware. Downgrade the message
to pr_debug().

---
Changes in v2:
- Downgrade the message to pr_debug() as suggested by Ilpo Järvinen.
- Link to v1: https://lore.kernel.org/r/20260503174752.26288-1-armundunelis@gmail.com
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e835779b6..527289b7d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3610,7 +3610,7 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
 	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
 					   FAN_CURVE_BUF_LEN);
 	if (err) {
-		pr_warn("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
+		pr_debug("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
 		return err;
 	}
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260824-fan-curve-enODEV

Best regards,
--  
Armandas Kvietkus <armandas.kvietkus@proton.me>


