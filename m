Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0621A2C0B
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 Jan 2026 00:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767400672; cv=none; b=Mt8L229B0SKkZUqlE+mDHseDbv+/rn7yUVjCVVjBr831yWijVF3p2HmK1PhDOzlj/ALgdGwCeTBHWQMMLwdDkO4tbvkkluIGb6pesmsFIZ5fE5FFfjL97G7WkgEYVUePb3nE4L1+SSxg5jsJPwoYiEFjtTvo/sk6BUOUxYIYLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767400672; c=relaxed/simple;
	bh=5/U/3dWPqiQ36pxMHBPy3hGEFv4y45X7+3RVoGlYcA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6iUNhMLmL5LU9/KzhWuHW04xmue4cbwbs3YSYK6LPhiIsh4QSXrDLc4TxTPSCpiETWMuVTba7ZuKgbFBVhF2tP+0zMGSR6Dllp98psETG5mjOlxjMkmuV9CIXCQAfrO/vVbvrNyQ9QKG0ZFjgt2aDqPrGTinuIYyYZ4jGCTJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=igaO/lB1; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="igaO/lB1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767400669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9pJcZgif0ugC0AhM15bX6pjGeVTDbWzSHuZihigM2c=;
	b=igaO/lB1L175Y8zAW4tXZPvCG/tpHSkufNEc9FTx7/cdkWw1uIjom37IgUU5QkO4rmdfLb
	n+yfoDNo88pOKX+91CGfu52ai1CwWf5/5Fw7QHs0+sGsg/cnK28BbuilxkeOZefpzli3zL
	MDwAaoTZeTqFMyY7vpyTyLIKi1Ki/fc=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/3] asus-armoury: fix ppt data for GA403U* renaming to GA403UI
Date: Sat,  3 Jan 2026 01:37:30 +0100
Message-ID: <20260103003731.404383-3-denis.benato@linux.dev>
In-Reply-To: <20260103003731.404383-1-denis.benato@linux.dev>
References: <20260103003731.404383-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

As some GA403U may have different limits restrict the DMI match to the
specific GA403UI model.

Fixes: 39ae6c50e599 ("platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs")
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 8184107e565f..774aa696be4e 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -843,7 +843,7 @@ static const struct dmi_system_id power_limits[] = {
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
+			DMI_MATCH(DMI_BOARD_NAME, "GA403UI"),
 		},
 		.driver_data = &(struct power_data) {
 			.ac_data = &(struct power_limits) {
-- 
2.52.0

