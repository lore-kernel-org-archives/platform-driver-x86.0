Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=15.235.45.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363042;
	b=ybW35P4ADPvqaeeZZ4gviXInNKWeg/3d1/JPmey8FeyG/d0ZHRhfN8QJho46AlSTYYyn
	 geuQSezd+SnuSthCainLMhROl7zNEqdoeGuZivtYUICdXCku+0jDKh6DqzPnNDu3i/h/E
	 zNpHssj+KWkcmfC8Tk0i5vK6p9BfcPxDkXmNC/EpvjMHoZhWQUjckl570ow3ytoZHoCrM
	 P/33cEds/OoO7ola0AAwOB+hMqh0XHACS+SaHE9LH//D0+8Nav4PhTe1CfXSQa0O3we1n
	 htgCJvy3788A9SI3jUKuOcqlp+ZK/U13SLh1Kz4vHnrWgrYCnW8rk5qKwbicb2BMTUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363042;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w9QJunT9bd8vtlEuB9KqD4wnu7mXcZwBhzxqWM8pK6o=;
	b=jd4aoUNIJrGTxMPjzjhE6rlLJQ0FlnjT6ARRSylV2W1IfBVKbV4Fe7QdX+FFEByBlg/5
	 Ui63KuyO3fzh7nKlQBg9tGBMmowtrBPyrBmqWbP9nxRZcYMoERyC5lUVYtpXAj/w1BVah
	 sLfaR4ysd17F8vZJypLUH1uY9UhsQ9SeiPZRAfnLHtg0ciTspV6L3hLrIo7bI7+lszTfp
	 IKCUjOwtT8nNznE3+YGSqDHt22zspkhXoP7ROI9VLWAzTe8r5GzNRhI5LVPx1HcPHCQd9
	 hzegr1pbk6m3ZUbu/HsyAHFtX0nkJcQtEqfAFPEGIEhgNYAM26YaOa4+c36bgJZhaEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=petermarshall.ca;
	spf=pass smtp.mailfrom=logotherapy.ca;
	dkim=pass header.d=petermarshall.ca header.i=@petermarshall.ca header.a=rsa-sha256 header.s=mail header.b=lzOBeYL3;
	arc=none smtp.remote-ip=15.235.45.126
Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EA7606A320;
	Wed, 11 Nov 2026 02:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EA7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.a=rsa-sha256 header.s=mail header.b=lzOBeYL3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1794363028;
	bh=+pDOmRH4H1/exPVI44n/CbERpYc7hXCGLqgk7LiCK7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzOBeYL3yS9S4GUmSX1UEw9eEy8FObN4tUz0hp8XM9OBuR2nt2CoeUp6VlCoVAjhI
	 it7rCBkJ3i2/G4EzdzBbWUXUevALJJxVvb/GmpBiHTD8D4jodxJ4J2BK7PNrE44mX5
	 MZ8T31fy9v3LhxFYsGZpS9hGnvEzMQhHe9jV9bGUeKv5iE34aflVuY8fMvQf1GLAlZ
	 iq75NSBSaeXtwEvJrNOQZ76dR5R7te1MTm8O69HEsO3PTFQ2UHTxWA+4ntK0KzW1BX
	 GDHXdW3JTbccssNlP45aHLzHKjmqMOKpyv7cPzRw1INqAHXSqsfqDFErJxfpI5Y/DM
	 wV98xc+IDse/g==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id E8BDE20555;
	Wed, 11 Nov 2026 02:10:27 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: [PATCH] platform/surface: platform_profile: handle fan standby state
Date: Tue, 10 Nov 2026 21:09:16 -0500
Message-ID: <20261111020916.3557508-2-pm@petermarshall.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111020916.3557508-1-pm@petermarshall.ca>
References: <20261111020916.3557508-1-pm@petermarshall.ca>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Send a fan standby command if a fan is present when entering a PM
suspend transition and set it back to normal during resume.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 .../surface/surface_platform_profile.c        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
index 0e479e35e66e..203d21aa715c 100644
--- a/drivers/platform/surface/surface_platform_profile.c
+++ b/drivers/platform/surface/surface_platform_profile.c
@@ -32,6 +32,11 @@ enum ssam_fan_profile {
 	SSAM_FAN_PROFILE_BEST_PERFORMANCE   = 4,
 };
 
+enum ssam_fan_state {
+	SSAM_FAN_STATE_NORMAL  = 1,
+	SSAM_FAN_STATE_STANDBY = 2,
+};
+
 struct ssam_tmp_profile_info {
 	__le32 profile;
 	__le16 unknown1;
@@ -61,6 +66,13 @@ SSAM_DEFINE_SYNC_REQUEST_W(__ssam_fan_profile_set, u8, {
 	.instance_id = 0x01,
 });
 
+SSAM_DEFINE_SYNC_REQUEST_W(__ssam_fan_state_set, u8, {
+	.target_category = SSAM_SSH_TC_FAN,
+	.target_id = SSAM_SSH_TID_SAM,
+	.command_id = 0x0f,
+	.instance_id = 0x01,
+});
+
 static int ssam_tmp_profile_get(struct ssam_device *sdev, enum ssam_tmp_profile *p)
 {
 	struct ssam_tmp_profile_info info;
@@ -88,6 +100,13 @@ static int ssam_fan_profile_set(struct ssam_device *sdev, enum ssam_fan_profile
 	return ssam_retry(__ssam_fan_profile_set, sdev->ctrl, &profile);
 }
 
+static int ssam_fan_state_set(struct ssam_device *sdev, enum ssam_fan_state s)
+{
+	const u8 state = s;
+
+	return ssam_retry(__ssam_fan_state_set, sdev->ctrl, &state);
+}
+
 static int convert_ssam_tmp_to_profile(struct ssam_device *sdev, enum ssam_tmp_profile p)
 {
 	switch (p) {
@@ -236,6 +255,49 @@ static int surface_platform_profile_probe(struct ssam_device *sdev)
 	return PTR_ERR_OR_ZERO(tpd->ppdev);
 }
 
+#ifdef CONFIG_PM_SLEEP
+
+static int surface_platform_profile_pm_prepare(struct device *dev)
+{
+	struct ssam_platform_profile_device *tpd;
+	int status;
+
+	tpd = dev_get_drvdata(dev);
+
+	if (tpd->has_fan) {
+		status = ssam_fan_state_set(tpd->sdev, SSAM_FAN_STATE_STANDBY);
+		if (status)
+			dev_err(&tpd->sdev->dev, "pm: fan standby notification failed");
+	}
+
+	return status;
+}
+
+static void surface_platform_profile_pm_complete(struct device *dev)
+{
+	struct ssam_platform_profile_device *tpd;
+	int status;
+
+	tpd = dev_get_drvdata(dev);
+
+	if (tpd->has_fan) {
+		status = ssam_fan_state_set(tpd->sdev, SSAM_FAN_STATE_NORMAL);
+		if (status)
+			dev_err(&tpd->sdev->dev, "pm: fan resume notification failed");
+	}
+}
+
+static const struct dev_pm_ops surface_platform_profile_pm_ops = {
+	.prepare  = surface_platform_profile_pm_prepare,
+	.complete = surface_platform_profile_pm_complete,
+};
+
+#else /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops surface_platform_profile_pm_ops = { };
+
+#endif /* CONFIG_PM_SLEEP */
+
 static const struct ssam_device_id ssam_platform_profile_match[] = {
 	{ SSAM_SDEV(TMP, SAM, 0x00, 0x01) },
 	{ },
@@ -247,6 +309,7 @@ static struct ssam_device_driver surface_platform_profile = {
 	.match_table = ssam_platform_profile_match,
 	.driver = {
 		.name = "surface_platform_profile",
+		.pm = &surface_platform_profile_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-- 
2.56.0

