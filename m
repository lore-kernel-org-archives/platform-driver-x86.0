Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71397395AC7;
	Wed,  5 Aug 2026 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954718; cv=none; b=OzT1pDhdnCp8NjAEy+1EoGwD7D1fwsE+N9FkOEchmsGIg4bxeQYGkTnpVs95kpW3vg9cX1FiaGrX8EVTz/LWPwcH6t0PW51Tbl6GM1JYY45PJfyRPbGCy+DCGjAeECEPA2VDexELXi74DanqhtlyA6ZoQa2qUdPA2QJqNk6qnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954718; c=relaxed/simple;
	bh=S91DiBBlcMR6mfD1rEa3LCPErql7ntLg/323ddcrQkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5ZWzf3FDkNZN0mQrU42NsIjnBm1nqfhVjkWuiqfThjFl+4zFk3PHZdFkB5zPCojjHpsSOLuhk0NMzDt0ZRaszo9l1lWKzAvbJLDytYVhc2nyxY+D8DZMde9Krvkh5zBQjUBu7nVW6c8BX8xqpZIcsvGfYPA2FInwWGoFbcahUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ir/lWtLG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ir/lWtLG"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CB7FEC2AD4;
	Wed, 05 Aug 2026 20:31:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQOYn5AyvDjB; Wed,  5 Aug 2026 20:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785954708; bh=S91DiBBlcMR6mfD1rEa3LCPErql7ntLg/323ddcrQkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ir/lWtLGJuBRxTobaRA1JoK+xQ/zCVbj2hSg0QlKBRa3bW4bZaqfFMyIgJ3J8VxAI
	 T9lt9DOMGWhYd91pVsyN9BvwB8zeO9Hb1v+t84zMdOYjfpvaQi/z9Qh2HK6qxvT09x
	 jPIezWB0NRmmX9hXSmEisfAX0odlMSqcX2+SaCWhsAP8s+30AQlSMl4yKZ4zjKRdFy
	 3TJTVTrcxXtvDACuvW/cHYtrqtsQS3atVZdXFoSgxgI2U2HK1Dnv4kJUWDfWrYvihS
	 vY3Z7az0XmbrFGkwn2m0fypNpiapp6VZpE979iaS6NL52zYlST/5udwNHmwuWQArqh
	 vooKMvJ2RTKQw==
From: Marco Scardovi <scardracs@disroot.org>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 3/3] platform/x86: asus-armoury: Prevent disabling dGPU when in use
Date: Wed,  5 Aug 2026 20:28:08 +0200
Message-ID: <20260805183131.3075-4-scardracs@disroot.org>
In-Reply-To: <20260805183131.3075-1-scardracs@disroot.org>
References: <20260805183131.3075-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check ASUS_WMI_DEVID_DGPU_POWER_STATE before attempting to disable the
discrete GPU in dgpu_disable_current_value_store(). Return -EBUSY if the
dGPU is currently active and in use.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to asus-armoury module")
Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index f745924af8a8..2d5ca75bc727 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -515,13 +515,25 @@ static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (asus_armoury.gpu_mux_dev_id) {
-		err = armoury_get_devstate(NULL, &result, asus_armoury.gpu_mux_dev_id);
-		if (err)
-			return err;
-		if (!result && disable) {
-			pr_warn("Cannot disable dGPU when the MUX is in dGPU mode\n");
-			return -EBUSY;
+	if (disable) {
+		if (asus_armoury.gpu_mux_dev_id) {
+			err = armoury_get_devstate(NULL, &result, asus_armoury.gpu_mux_dev_id);
+			if (err)
+				return err;
+			if (!result) {
+				pr_warn("Cannot disable dGPU when the MUX is in dGPU mode\n");
+				return -EBUSY;
+			}
+		}
+
+		if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU_POWER_STATE)) {
+			err = armoury_get_devstate(NULL, &result, ASUS_WMI_DEVID_DGPU_POWER_STATE);
+			if (err)
+				return err;
+			if (result) {
+				pr_warn("Cannot disable dGPU when it is in use\n");
+				return -EBUSY;
+			}
 		}
 	}
 
-- 
2.55.0
