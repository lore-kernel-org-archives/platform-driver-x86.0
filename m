Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E68372661;
	Mon, 24 Aug 2026 22:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787611628; cv=none; b=nJLH5M6Dzn0bvXU0okiH5VFW46UHzQHRMQCppKZp3v6AFFJbDOoMkvqOSUlpb0twNJXaS3d3njJoP02Up95AzObjh8uVEqFqNUWxy3MF5IiUIw4NayqII2pfT10YKdUJuNotgd7HvbkTCHB2bcvhKMzX5LEHDZjHxIms/7ziM5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787611628; c=relaxed/simple;
	bh=7yjsvEDBIHBIRv0LSdv8o0b+CltY5jRNHIcG34z3ZO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G6UDqVcxcRFVq1zw/sQLgseCw4yKqIP3KRjA/enK9yfrbYZzc0mgMwVpuMxykUVkFUUIhfzOjkz4sAC79aSoUTml6xxBXlTQdjbl37EWS8AJ4PvdQG1nSe918xFtbujmpspwkE9WQX7yVMktsQlXN3xhs2cJs2QHhKcn9LNDWrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFKT8H98; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFKT8H98"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BAD9C19425;
	Mon, 24 Aug 2026 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787611627;
	bh=7yjsvEDBIHBIRv0LSdv8o0b+CltY5jRNHIcG34z3ZO0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SFKT8H98v7PXVkl8U6EVh3d32FDZz3gaHehdux0LKzEu1l7WO60nPsUmQT/TS/Rzu
	 hThshRAQhv6KGay4AHODkK4A2pOrGwr/gOUKPVA5oBk67eSmI93uOuCZf9YGF+AUem
	 Ql8ln7+JVTviu8ois491vUenHBDkY8n/Ku0R2NDC2ZXrw+MIWsSXUWsrAOmfDOAUMq
	 25RoHUSGKWf/nq1f70MHGTUPNH8N1+QLEvnj9s6pbahBz7cvL3yZI/+kPIw1KFBwgX
	 Aks/WTk3yuCGTDwzEP9xBbtAQqvX1Y+A2Y5cx1TcMZBD+u1I7aVjhjQtHSU9tWjsnp
	 fEfv+3mUxCGOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680D6C5DF9C;
	Mon, 24 Aug 2026 22:47:07 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Tue, 25 Aug 2026 00:47:07 +0200
Subject: [PATCH v3] platform/x86: asus-wmi: suppress -ENODEV warning in
 fan_curve_get_factory_default()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260825-fan-curve-v3-1-617f8e661e9c@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NsQrCMBRFf6W82UjzqiJODjq7uUiHmL7YCE1Kk
 gal5N9NKoLjgXPPncGT0+ThUM3gKGqvrcnQrCqQvTAPYrrLDFjjrt7jhilhmJxcJEbmcjpfIZu
 jI6VfS+XWftlP9yfJUKbF6LUP1r2Xm4jF+xW3f8WIjDMk4kp1KLhojqOzwZr1QNCmlD5GkYnWr
 gAAAA==
X-Change-ID: 20260824-fan-curve-enODEV
To: luke@ljones.dev
Cc: denis.benato@linux.dev, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, 
 corentin.chary@gmail.com, fxzxaxon@outlook.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787611626; l=1502;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=y44dEYVBGvbxP3MDjx8P9coTSyk+MzRa8DWyMe7v9VM=;
 b=wmzzEa3U6Oh07VaLflF1yr99YXS9fifPfmk1XSqv79rUZfRchQOjYAerJilApSjH7wTiH4x73
 Zm/3tWrPSHnAo83tZvXaNsSSvyISPS7GmoqiDTnatcEtscx6QCkUY/M
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
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://patch.msgid.link/20260825-fan-curve-v2-1-2ee1ffd2a1a3@proton.me
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


