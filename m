Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7712D1DE4C0
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 19:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734464450; cv=none; b=pmzDJeBsrYaizHFrucMXEThOmHJ5EilCDnBPHTgKlU2bxVWf4vjreu3eiai6IMTNMe4psI9lgfM7+iU9L3WNpmRm1rNyPwU9Qs+FFMOOnyn0zW3+RYwTWARovcls7vi3HPd/AGTz9l53nd4CtpRGDQ3ETPAgLCsde2xACKGmjqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734464450; c=relaxed/simple;
	bh=+WWDqtHUk63YRqrzvBPnPYD8fbd14A1YYKs1cCfr6GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IycEQhdxxbHUvRASSz/+YJ9x6jykYe1xWs6XMYDKuAcucoU0Lp38dDMaEzniyUb1ya9bFNH1JHy2j38dYQd5Qoc4G5YoDpyk0ANOzD7yS4YmYD6gE/fN6PpjflM1KvdQSZaQ+TTqpSzFiXSzpkupHQgdXd3E17UtpY/0uZ7WkXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUoOsuRH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUoOsuRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC8AC4CED7;
	Tue, 17 Dec 2024 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464450;
	bh=+WWDqtHUk63YRqrzvBPnPYD8fbd14A1YYKs1cCfr6GY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pUoOsuRHsWG56VkH1U29FvkKvwQ30RFjU4WX35ylPvit97SDlKgjDHodl3ScOs+/G
	 A5V0hWH3f0WWaXgzaobRXpgqwwSoXaDf6NPKNqP8ZJ/+iFYsmGMD4ld1NPr1aRSpep
	 rdfaf12KorPfzcwZyOSX29AlirhWCDX9xH+XYBGrsWhUDnaPXraWXMRA61WyaK1ndY
	 NkfbPBdhBe5ZRujfAfryfmaZ4Vs8EMm2nUwP3qUjKFY6juVEpqOl7xueiKlNa6CFDb
	 CtMpCKkc4PpMsPeg4MaW+tgvhL5qUF6U1YGTiIIwZnM/QC67NBZCqpbYRD99zkx5F5
	 ICSJ1p17HCcxg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86/amd: pmc: Use guard(mutex)
Date: Tue, 17 Dec 2024 13:39:51 -0600
Message-ID: <20241217194027.1189038-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217194027.1189038-1-superm1@kernel.org>
References: <20241217194027.1189038-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Instead of using the `goto label; mutex_unlock()` pattern use
`guard(mutex)` which will release the mutex when it goes out of scope.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 26b878ee51918..ef105ca6de24a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -688,7 +688,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 	int rc;
 	u32 val, message, argument, response;
 
-	mutex_lock(&dev->lock);
+	guard(mutex)(&dev->lock);
 
 	if (dev->msg_port) {
 		message = AMD_S2D_REGISTER_MESSAGE;
@@ -706,7 +706,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "failed to talk to SMU\n");
-		goto out_unlock;
+		return rc;
 	}
 
 	/* Write zero to response register */
@@ -724,7 +724,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "SMU response timed out\n");
-		goto out_unlock;
+		return rc;
 	}
 
 	switch (val) {
@@ -738,21 +738,19 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
 		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
 		rc = -EBUSY;
-		goto out_unlock;
+		break;
 	case AMD_PMC_RESULT_CMD_UNKNOWN:
 		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
 		rc = -EINVAL;
-		goto out_unlock;
+		break;
 	case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
 	case AMD_PMC_RESULT_FAILED:
 	default:
 		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
 		rc = -EIO;
-		goto out_unlock;
+		break;
 	}
 
-out_unlock:
-	mutex_unlock(&dev->lock);
 	amd_pmc_dump_registers(dev);
 	return rc;
 }
-- 
2.43.0

