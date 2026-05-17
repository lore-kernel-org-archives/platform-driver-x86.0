Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743E25D527
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055226; cv=none; b=LS0SRs/qtzDm4Lga15u/jiFTdDJN8MRdFtmCUxNTX9va3N/t8krc3kcjJ1xGJUAHsklyznIgcWDi3fWKmc0fdnmZb4EOiQuFsC+b1aKa3G1QI4+czFitK/I5ldF2CDg0tJ5JiyOIefwic3G5sxliUVbERnNoEaoe7LeHImnbQ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055226; c=relaxed/simple;
	bh=imBci71fP7NKEgdDpOjamKBb+78fJjLTgCTNumWSu30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/XkHe4c2bRd/50+KfK0fqKjlLa5jAJ5JmisnM7RLYnJBHJjqOTMrnY1amtpGL5aFeTI6XX29RyOce1L348Xz1r4ryEBc+B0ofnVhrt3gVyw+EX7bhWPM6+KuULh3mskZgvGL4TIsNR4DcRs2dWNTVqd00w1QsEq0U/cJoVXk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EbECt2t0; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EbECt2t0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779055222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vbpLW7wCPywcwqku0IsbuuOpJGYTcYVX7JOmiFCfvw=;
	b=EbECt2t0pQU+Ln2rvLwxnuPGwyOSYfXzyoZ3YuSAow3qDeDs8EbeoQSg2yo6prW71o2yY8
	mVDT6dIVhZjUr+NB+cOhLMUkOn+RX3SivOyzrmID2iq587PEGDMIk6wJ49iDvu63bvIuJm
	13dttWdBR3mQLawYQFUJrxsPJuGil3o=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 3/4] platform/x86: asus-armoury: add support for FA401EA
Date: Sun, 17 May 2026 22:00:04 +0000
Message-ID: <20260517220005.4594-4-denis.benato@linux.dev>
In-Reply-To: <20260517220005.4594-1-denis.benato@linux.dev>
References: <20260517220005.4594-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model FA401EA.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 6c8f46d289d8..71df2ca061a7 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -346,6 +346,29 @@ struct power_data {
  * _def is not required and will be assumed to be default == max if missing.
  */
 static const struct dmi_system_id power_limits[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA401EA"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 95,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 100,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 71,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 71,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 71,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA401UM"),
-- 
2.47.3

