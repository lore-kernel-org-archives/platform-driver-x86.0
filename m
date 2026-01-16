Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A29A33C509
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586812; cv=none; b=HeyAU2BXZ9HkyUEhS4CeQcFG9qT7gF04OmqWn6zg3KyPhX+urW4pMHVw031TBEQYXdtAkrqQbBWEgfMFm+JYmPDpyaUkNRcItxLHo2xGidoI2ID3GSFo7bYrV0Id7K7ac3QM4sWtmmbAOdA+xVTEgdbmnpqeFT/jaggC2Fkeji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586812; c=relaxed/simple;
	bh=936WuKCVuzUC/NCojUpi97EP/QU52zA1LikBBm9O6O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emTayVAlkZnptcRMFnWk6QcD5gjAKWi86j4XLKblHvfn/O/pStQFlubm5IqPGtOhkYph0QioGNt+RyWapJwaLVenmepXryuDe3GFwZe5uQJZM2Yh5DZ57oabGOgCKm5fORtQC0y1BCb+LiKZuoxXDoBM4LaM00dfks2EuxXWsNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NVy+SQop; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NVy+SQop"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768586808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tfi6ciixpcfoJFQG+W0Ph/lL7+MTU1iHJ25+3NZRZRU=;
	b=NVy+SQopP5KkuF4//mRQAlmoUd+dOaAOdyvYJkR11J7Skl/18H7hA+Nwd8d3ME58FwTQPL
	3wMsCj5CRSFIuXjACSGcXD3hFmPjaITKnxgNcvVVpJahuC4o+UYerCI/+BJjGZfTAy7dr0
	C13Nua36lgwxRtqQSzhcnwJYo+u3Y+M=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 1/4] platform/x86: asus-armoury: fix ppt data for FA608UM
Date: Fri, 16 Jan 2026 19:06:34 +0100
Message-ID: <20260116180637.859803-2-denis.benato@linux.dev>
In-Reply-To: <20260116180637.859803-1-denis.benato@linux.dev>
References: <20260116180637.859803-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

ppt_pl3_fppt_def and ppt_pl3_fppt_max are wrong: correct it.

Fixes: a22d893f490d ("platform/x86: asus-armoury: add support for FA608UM")
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 0063c64a7860..710eef74cdb7 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -611,8 +611,8 @@ static const struct dmi_system_id power_limits[] = {
 				.ppt_pl2_sppt_def = 54,
 				.ppt_pl2_sppt_max = 90,
 				.ppt_pl3_fppt_min = 35,
-				.ppt_pl3_fppt_def = 90,
-				.ppt_pl3_fppt_max = 65,
+				.ppt_pl3_fppt_def = 65,
+				.ppt_pl3_fppt_max = 90,
 				.nv_dynamic_boost_min = 10,
 				.nv_dynamic_boost_max = 15,
 				.nv_temp_target_min = 75,
-- 
2.52.0

