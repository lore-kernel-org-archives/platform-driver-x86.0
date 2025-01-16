Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98D19AD8B;
	Thu, 16 Jan 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015104; cv=none; b=TvTd0Q0GRD1XL+A+UgPqq7CNf9dVYvxuk6Jbt9J1fzftjGXRKq2ikmqdNV+m1vVgDR3M+gY2MgSqAPJztSWrdBtTdWK+k3iZLvEGNXcsiWMVD8HkAmPjQOFyb8rkO21pYLxX0//pLQ9Uw/fEcG5V50mtRQk/r18lYI7E8lVTEaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015104; c=relaxed/simple;
	bh=PQq3YycNFyEg3B642GCLzYOt8BH4SWFs97dvbrrpIzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGBtlNEXpRckn5nRR67ky8WpdWI9BhurHnBUhejcL95Kx3Y1RJVV2b6OQ2ixal5qy7olgsxLo0yLxTHnX0wACe9XQlstEg8NLIYnBxG38MkxdER7/kYClroKpC1o39eL5+EgcxV43nRvRCBj3XXsUdKiiK+rBWkq7fpqiGDl0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7f441062d3e111efa216b1d71e6e1362-20250116
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c8f92dd4-0f6c-43be-8922-28d94d0a9316,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:6493067,CLOUDID:e4742005471d5ff98a43fbe171330e06,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f441062d3e111efa216b1d71e6e1362-20250116
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1110600460; Thu, 16 Jan 2025 16:11:32 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 9969416002081;
	Thu, 16 Jan 2025 16:11:32 +0800 (CST)
X-ns-mid: postfix-6788BF34-485254975
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 0DC3216002081;
	Thu, 16 Jan 2025 08:11:31 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] platform/mellanox: mlxreg-io: use sysfs_emit() instead of sprintf()
Date: Thu, 16 Jan 2025 16:11:29 +0800
Message-ID: <20250116081129.2902274-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/platform/mellanox/mlxreg-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mel=
lanox/mlxreg-io.c
index 595276206baf..97fefe6c38d1 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -126,7 +126,7 @@ mlxreg_io_attr_show(struct device *dev, struct device=
_attribute *attr,
=20
 	mutex_unlock(&priv->io_lock);
=20
-	return sprintf(buf, "%u\n", regval);
+	return sysfs_emit(buf, "%u\n", regval);
=20
 access_error:
 	mutex_unlock(&priv->io_lock);
--=20
2.47.1

