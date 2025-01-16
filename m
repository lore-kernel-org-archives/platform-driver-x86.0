Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71821D63E6;
	Thu, 16 Jan 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014937; cv=none; b=hbjzhxsMcS66ve2TA1/SUgpf4qk5vFzOwavFI84WTksdZhLZgU0HywgJFEyK4yzuRvTuvQ7Zx3N3EK8QVu6ViYNwDUL+xTzBxlzfer75yvlT2qXmqUETTH4z0qzxC/Pe/AMp4tnRsHmE8rKTZBM2rEHZjkcy8KAJmjzLJOXjzqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014937; c=relaxed/simple;
	bh=1/DGKxDwdX4wCZMUVDlyllphmnN4FHenlOooAm2hE6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wl6zYWd7vSvRxmQiQ6zYi+hCgl+AQ80J/Ci8YHLVMXCor1mgCmkEPLYHX5YMz18nbN+qDcJhfdAKdEIg191okt0XnnajWw8vrAh9QRiPB6nez7hpAtrFcgS2Vibhg08tW450EQPeyq18ZCE/pspCZd9/SHEEqYg6ZSZ4ocoRUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1a15f53ed3e111efa216b1d71e6e1362-20250116
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6a3345d3-6a5f-4e9c-bee3-da9d69cf07eb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:6493067,CLOUDID:040db45fe433cacb708913901df194cb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1a15f53ed3e111efa216b1d71e6e1362-20250116
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1744565988; Thu, 16 Jan 2025 16:08:43 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id DCFB516001CC7;
	Thu, 16 Jan 2025 16:08:42 +0800 (CST)
X-ns-mid: postfix-6788BE8A-746674942
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id F129F16002081;
	Thu, 16 Jan 2025 08:08:41 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] platform/mellanox: mlxbf-bootctl: use sysfs_emit() instead of sprintf()
Date: Thu, 16 Jan 2025 16:08:35 +0800
Message-ID: <20250116080836.2890442-1-aichao@kylinos.cn>
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
 drivers/platform/mellanox/mlxbf-bootctl.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform=
/mellanox/mlxbf-bootctl.c
index a2011af48201..9cae07348d5e 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.c
+++ b/drivers/platform/mellanox/mlxbf-bootctl.c
@@ -177,7 +177,7 @@ static ssize_t post_reset_wdog_show(struct device *de=
v,
 	if (ret < 0)
 		return ret;
=20
-	return sprintf(buf, "%d\n", ret);
+	return sysfs_emit(buf, "%d\n", ret);
 }
=20
 static ssize_t post_reset_wdog_store(struct device *dev,
@@ -206,7 +206,7 @@ static ssize_t mlxbf_bootctl_show(int smc_op, char *b=
uf)
 	if (action < 0)
 		return action;
=20
-	return sprintf(buf, "%s\n", mlxbf_bootctl_action_to_string(action));
+	return sysfs_emit(buf, "%s\n", mlxbf_bootctl_action_to_string(action));
 }
=20
 static int mlxbf_bootctl_store(int smc_op, const char *buf, size_t count=
)
@@ -274,14 +274,14 @@ static ssize_t lifecycle_state_show(struct device *=
dev,
 	 * due to using the test bits.
 	 */
 	if (test_state) {
-		return sprintf(buf, "%s(test)\n",
+		return sysfs_emit(buf, "%s(test)\n",
 			       mlxbf_bootctl_lifecycle_states[lc_state]);
 	} else if (use_dev_key &&
 		   (lc_state =3D=3D MLXBF_BOOTCTL_SB_LIFECYCLE_GA_SECURE)) {
-		return sprintf(buf, "Secured (development)\n");
+		return sysfs_emit(buf, "Secured (development)\n");
 	}
=20
-	return sprintf(buf, "%s\n", mlxbf_bootctl_lifecycle_states[lc_state]);
+	return sysfs_emit(buf, "%s\n", mlxbf_bootctl_lifecycle_states[lc_state]=
);
 }
=20
 static ssize_t secure_boot_fuse_state_show(struct device *dev,
@@ -332,9 +332,9 @@ static ssize_t secure_boot_fuse_state_show(struct dev=
ice *dev,
 			else
 				status =3D valid ? "Invalid" : "Free";
 		}
-		buf_len +=3D sprintf(buf + buf_len, "%d:%s ", key, status);
+		buf_len +=3D sysfs_emit(buf + buf_len, "%d:%s ", key, status);
 	}
-	buf_len +=3D sprintf(buf + buf_len, "\n");
+	buf_len +=3D sysfs_emit(buf + buf_len, "\n");
=20
 	return buf_len;
 }
--=20
2.47.1

