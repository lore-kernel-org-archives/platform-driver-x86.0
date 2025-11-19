Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D117D2;
	Wed, 19 Nov 2025 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513204; cv=none; b=WeR+6Svk36XfUYQ4zSCH6OgIPAcVwaaZJ3jo9MTyFjbAT6g27UCUlhSxly6ffWcSvJnwMfjFscLp6au5foXNv3Qy3BHNPzkHAx9+pgsxnrmckE5uWCjscMEYh6CGNhev05dEo3Np7BvlTB3fSoe8yYB6+mcngpx7VjWL10xRFq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513204; c=relaxed/simple;
	bh=cdSI8LbaBnlLN9m0wxvQS1K3z96XEujbOZ2RnvZCx6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+cP3f+zOhW52evG3uSXJLyty/lBgPIb18oogzfMTjL43Q/DC2rqju0381Bun3TO8oQ4Bsoj5GrYf/p8i1XmLM2SiNSSickDGjx2d26Y7e7KgIHoTrUAgzpReZVE/HcgJmimm/om9sbFdI3C1Sx2GTVmd77Fcg3AUGTsywjQlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUCfmZvJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUCfmZvJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AC8C4CEF1;
	Wed, 19 Nov 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763513203;
	bh=cdSI8LbaBnlLN9m0wxvQS1K3z96XEujbOZ2RnvZCx6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hUCfmZvJWHjgrr43OYn0eeeQV3njwmBJSuwIgT6hnwDel8ONj++qvUNOy4Ru7g7Yp
	 bcfOn3bjhq4q+539TZTOo9TovKH8Ms1M45Y80XQtSKthKmvd7SSCJjYCaizzRl/g+l
	 ZRzrYgX9u/LvJZR1zHEcz/tedPtUbz3BQkE6qCwcT9n12aon0uHjqeEMS0n4ZXDsPc
	 Ih8vzc8guVAd8RZmjjOeyMUrDGFHZpL1G9KESMJqUZQwWUlOHjgRXqI6c42qraMne6
	 RGGvGv6kwZGYMaJcWqxazjeYPFANbRLtPVOoXM6qFnaeBfBpDDW5Qa0Pn27TJYogNq
	 LWTE+ZTIbDNpA==
Received: by venus (Postfix, from userid 1000)
	id 95EFF18121F; Wed, 19 Nov 2025 01:46:38 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 19 Nov 2025 01:41:43 +0100
Subject: [PATCH v2 4/4] platform: arm64: thinkpad-t14s-ec: add suspend
 handler for keyboard backlight
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-thinkpad-t14s-ec-improvements-v2-4-441219857c02@kernel.org>
References: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
In-Reply-To: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=sre@kernel.org;
 h=from:subject:message-id; bh=cdSI8LbaBnlLN9m0wxvQS1K3z96XEujbOZ2RnvZCx6A=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBpHRNuMNSkH06UH9q4lDwu2ET3xLtzqz62e1MRJ
 CDJ6W0xa/GJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaR0TbgAKCRDY7tfzyDv6
 miuLD/9jk8PXR3zjf3d/NP6C7qBSJEz/f09A9ZcW0iV2GqZ27esdHp12yJ9l+SHbNYanbKWIhJP
 VZV9kFFnZXDIVMtXoXamPlPElPbHL23QwdrcP4hz6vtsAAjGFOC57lj/ZI3NEdLu2yMiOwrljx5
 ewo0LtZEuPYYg7xyIvjAVnHEWCsAzwZGHoBo8uqla6Jxsn5olR9uzf+mXgFxnY3I8sXTYTeGW7i
 t/qnbfTngSmS8o8qwUU9sE6aPnFtHxrbblRmxU5OSYYp97+adxlye44F75H5Uwrb5Rmaoe92ZAr
 qjMNuyyqQPPAqD24cV4XzjjZU36w3XXk2S2udfJkyKtFWm28gSUueQq6a8roIlwwrLfof5ZLd4J
 QHkpZlFO9Wk/PDAVIQmce/685Cu0quH11OtqzIsn6prDmPgp0J80+PwxfG0bBBAt654dAtaBLzw
 b10dHl8KGJqALfitKAX1TE7MCj7023BBOwFHiV37bGTWHEeG6/K4Ukp6XZHe59rwKjQn1ZbBt5G
 Chtu4zYGbAIqm3L7ueUvwtlDgJgkD43OquFOxNO6nPNUXDR2qcZzSE8giCv1CFrLMrdJ827wbvy
 zZuE9/+FUwzg85NbpHKmdy9PLp5/AgPKqaQWo6ZZINdqcowwvHi5I2YKztIMeVvg3WIV5Kb0Dow
 L9uRJwlhuh66MDw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This ensures that the keyboard backlight state is restored after
a suspend-resume cycle. Otherwise the keyboard is automatically
disabled during suspend and then stays disabled after resume.

Note, that this adopts the same behavior as the existing Thinkpad
ACPI driver.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index cf8eff50d710..5590302a5694 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -610,6 +610,8 @@ static int t14s_ec_suspend(struct device *dev)
 {
 	struct t14s_ec *ec = dev_get_drvdata(dev);
 
+	led_classdev_suspend(&ec->kbd_backlight);
+
 	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
 			       T14S_EC_MODERN_STANDBY_ENTRY, 3);
 
@@ -623,6 +625,8 @@ static int t14s_ec_resume(struct device *dev)
 	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
 			       T14S_EC_MODERN_STANDBY_EXIT, 3);
 
+	led_classdev_resume(&ec->kbd_backlight);
+
 	return 0;
 }
 

-- 
2.51.0

