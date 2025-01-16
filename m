Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187B192B95;
	Thu, 16 Jan 2025 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015014; cv=none; b=cdwzwLURaXGL06pU1CVnT3H6WHUb24c/zGUD1OTxbzbBOkfALbPpldpYGO7fGxEqlLN45dP+JDbh73RgYHBxiF9slEkNY67at+Y2EKC+RnLZ/a5MtJqBJ3Z4HHG9vQZo1xixU78+k2t+H73mH4/HFQo+uEB/K8vGJrJSv9yXr+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015014; c=relaxed/simple;
	bh=ZZrsfuMHoQfnmCTI6GiCBad+azMuT6SoI6F6HrDQ/rM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBOr1o0310vj2FoL7KGJRQc+YDge7/Fv/4uNgxjMjgarl02gAcj0i9vnD5vL4+Vqwn+Z8UuSgON9NwZ/KOdg4O8kcJjjYsb9kbns3KONp7EwG1f2ONz/pK5qtUE/ukyicWO4ZpdASdfvArCNfi8+bIE0VQJ1/7WcUJyyLeMHTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4a24b26ad3e111efa216b1d71e6e1362-20250116
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e3c509e9-1693-4882-8515-9b4fff253ccf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:6493067,CLOUDID:80d3018f048e9c1414990a9458445ad0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4a24b26ad3e111efa216b1d71e6e1362-20250116
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 86922413; Thu, 16 Jan 2025 16:10:03 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 7801016002081;
	Thu, 16 Jan 2025 16:10:03 +0800 (CST)
X-ns-mid: postfix-6788BEDB-308954957
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id D25ED16002081;
	Thu, 16 Jan 2025 08:10:02 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] platform/mellanox: mlxreg-hotplug: use sysfs_emit() instead of sprintf()
Date: Thu, 16 Jan 2025 16:10:00 +0800
Message-ID: <20250116081000.2900435-1-aichao@kylinos.cn>
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
 drivers/platform/mellanox/mlxreg-hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platfor=
m/mellanox/mlxreg-hotplug.c
index 6aa2a4650367..b347000e4329 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -232,7 +232,7 @@ static ssize_t mlxreg_hotplug_attr_show(struct device=
 *dev,
 			regval =3D !!(regval & data->mask);
 	}
=20
-	return sprintf(buf, "%u\n", regval);
+	return sysfs_emit(buf, "%u\n", regval);
 }
=20
 #define PRIV_ATTR(i) priv->mlxreg_hotplug_attr[i]
--=20
2.47.1

