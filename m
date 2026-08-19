Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662282641C6;
	Wed, 19 Aug 2026 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151783; cv=pass; b=s4tgnCzA/rZX4NwLgFGbQ8afla8ZzCFN+qZMBF/JsJmbPRGAes3seGjNKswmLdQ6Wyqrz09zhHPJsBkZcr0PL/7cvzSLEFEdY4y4wTUpQa60XqMSx2Z4ZGLNnMqwX6QtrCSMtGB3+zOVf0Q3qhu5uxEi8TmGIfV71W49bAj2KbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151783; c=relaxed/simple;
	bh=SMO2MHJbq71fyxP8ZjUE5Nl1oUxYu8pFzMmNXFs8U7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fahs8J5D/jaKC0l6A73ueIxGArHWlG6IAAjvJoADR1G6ib7zhXYDa7OlVLsDciPCOkrBV+TLHbbemyx8BAqgFaWHEpSixs0mcHszo8y9RFov2gHVgrsEGrxVDygs+SCMJZ3HJpPRyzrnIxTXl4LF3z+X5bgHFYIRXcTO93s43oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=N4ckAWhU; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="N4ckAWhU"
ARC-Seal: i=1; a=rsa-sha256; t=1787151775; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AwCwsVy3rVmxC3J/F/6f3guV/CsZLJsM+ARmMwMouNJ5RHNdJcazVpGRxmtK2yvHVRYs5vf8XW8uuSiocFkpeAjsLbTtGwxT+OGppZe0LMRCUWMQQ/q66DCiUON1blG20TaQR1x54uL64kfF7BuYlSo0BbilhRpPAR9yQ3LzKuc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787151775; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3MNqYbFJnKy4NPdfL8vs1fXxa91OFs319jHjqVyMIZo=; 
	b=PRGGaK2Pv7ZGDqms1mq3rR54bCUPd4YTrQNfDdA6J46HTEF4rQ3/Wtbh7AhEdosNr32vMnsrvKDQFJqhNn0nmsw8yyGTMzJLWXeI0iidollETbjaxiI67UW48Hl2v+mWJN9nQUT3GGk5z3ETZmFi7dU+G4nBTxwWjETS7CxX6JI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787151775;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3MNqYbFJnKy4NPdfL8vs1fXxa91OFs319jHjqVyMIZo=;
	b=N4ckAWhU2hT7FELq5zOGtK4T5mQ7Zhj07ShH90LVbRStoYCq2A7F99C8dIbPgTjn
	jFwKvQAe5d3ps4mZCkU1TehrxVABzCgKWx9rhMo3xZ1BtNs4mEefrPgNM51jTSMDAVn
	guFD5eYB+7UO8newTS1Q6SOjA85vtAVdmMHC4bRM=
Received: by mx.zohomail.com with SMTPS id 1787151772568510.72067280081603;
	Wed, 19 Aug 2026 08:02:52 -0700 (PDT)
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohsen Tahmasebi <moh53n@moh53n.net>
Subject: [PATCH v2 1/3] platform/x86: acer-wmi: use bool for boolean quirk fields
Date: Wed, 19 Aug 2026 18:31:56 +0330
Message-ID: <20260819150205.19453-2-moh53n@moh53n.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819150205.19453-1-moh53n@moh53n.net>
References: <20260819150205.19453-1-moh53n@moh53n.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Use bool for quirk fields that only represent boolean values.

Signed-off-by: Mohsen Tahmasebi <moh53n@moh53n.net>
---
 drivers/platform/x86/acer-wmi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d0..00c3113c4cf8 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -400,11 +400,11 @@ struct quirk_entry {
 	u8 mailled;
 	s8 brightness;
 	u8 bluetooth;
-	u8 turbo;
+	bool turbo;
 	u8 cpu_fans;
 	u8 gpu_fans;
-	u8 predator_v4;
-	u8 pwm;
+	bool predator_v4;
+	bool pwm;
 };
 
 static struct quirk_entry *quirks;
@@ -456,34 +456,34 @@ static struct quirk_entry quirk_acer_travelmate_2490 = {
 };
 
 static struct quirk_entry quirk_acer_nitro_an515_58 = {
-	.predator_v4 = 1,
-	.pwm = 1,
+	.predator_v4 = true,
+	.pwm = true,
 };
 
 static struct quirk_entry quirk_acer_predator_ph315_53 = {
-	.turbo = 1,
+	.turbo = true,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
-	.turbo = 1,
+	.turbo = true,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.predator_v4 = 1,
-	.pwm = 1,
+	.predator_v4 = true,
+	.pwm = true,
 };
 
 static struct quirk_entry quirk_acer_predator_pt14_51 = {
-	.turbo = 1,
+	.turbo = true,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.predator_v4 = 1,
-	.pwm = 1,
+	.predator_v4 = true,
+	.pwm = true,
 };
 
 static struct quirk_entry quirk_acer_predator_v4 = {
-	.predator_v4 = 1,
+	.predator_v4 = true,
 };
 
 /* This AMW0 laptop has no bluetooth */
-- 
2.54.0

