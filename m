Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227821DDA3D;
	Sat, 21 Dec 2024 23:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734824915; cv=none; b=rKHtstVmzfxM4uJL34tnJDTv6aPJkx4sbJoMkFITnP3OvOJcLWHRmcnkLn0cZ+M8kuqC2HAuDRPJqGrYfDGiz6xs75MFbJ9kMR5UmL6Bl8mUN43Xw+XAba6ZJDiPmIJuk3nt/7sOcSpVXoSaq53GGQ8oTuCfPC3f4kwiw3cHels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734824915; c=relaxed/simple;
	bh=yyXL8wC1svgoxMWpIYgxrNg6Ye9lioMjpZflvH9Sxhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIIZK0VzsF4oR4NZuOMymt7CuPI2fotWqrvT6a2p/Fzx1JkIFoTn+epYdv2+w3l7T/1w6ft9Aq0VxaANGOirUFKeV9CAbtB0ZuvLnoGMv+QOAw1QLW5vQXWSx2ZVx1ksoiKLo9wjshqyio41vlDv14tecS6jyvh6Zbpte+RFNOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=OD90Y62G; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="OD90Y62G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=jLowNkxFSj7gomFayWzjIsagfJjfrmO0WwNQjHuRGNA=; b=OD90Y62G4mBiJhfT
	+u2mxxEGJY9GuRBvAFecuhAHYJHxaql1BttEVl3RocBY3xN6kjGDMyJwSNSsKfgkVCCDs56jZcy2J
	CHdQnegG1Q9j4PbVnOVgSHOlyngqbKZl4WXVj5jh3zfvXHKMg4AOiwDeGpikKh+C+QBKlBK0ulmrw
	DbpvJTKMAGkvecRisdW83jXNJWQ3v1l5/0jjfLuXEuLenMSYlpFyw+p+h2ONmudn4B7/eOL8M9N5n
	QTkgPb+QhxmIKMw37wX8O9xZdFRBiBzTZ8u1T3HE+5E9b34jSkjG72PsLgl3lvxb/bhxDTbKAI2al
	x4zV6/c+LB6XGSD5Eg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tP9Cb-006iK2-1m;
	Sat, 21 Dec 2024 23:48:09 +0000
From: linux@treblig.org
To: qipeng.zha@intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: x86@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] platform/x86: intel: punit_ipc: Remove unused function
Date: Sat, 21 Dec 2024 23:48:07 +0000
Message-ID: <20241221234807.160473-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

intel_punit_ipc_simple_command() was added in 2015 by
commit fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/x86/include/asm/intel_punit_ipc.h |  7 ------
 drivers/platform/x86/intel/punit_ipc.c | 33 --------------------------
 2 files changed, 40 deletions(-)

diff --git a/arch/x86/include/asm/intel_punit_ipc.h b/arch/x86/include/asm/intel_punit_ipc.h
index ce16da719596..1f9b5d225912 100644
--- a/arch/x86/include/asm/intel_punit_ipc.h
+++ b/arch/x86/include/asm/intel_punit_ipc.h
@@ -80,17 +80,10 @@ typedef enum {
 
 #if IS_ENABLED(CONFIG_INTEL_PUNIT_IPC)
 
-int intel_punit_ipc_simple_command(int cmd, int para1, int para2);
 int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2, u32 *in, u32 *out);
 
 #else
 
-static inline int intel_punit_ipc_simple_command(int cmd,
-						  int para1, int para2)
-{
-	return -ENODEV;
-}
-
 static inline int intel_punit_ipc_command(u32 cmd, u32 para1, u32 para2,
 					  u32 *in, u32 *out)
 {
diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index cd0ba84cc8e4..bafac8aa2baf 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -130,39 +130,6 @@ static int intel_punit_ipc_check_status(IPC_DEV *ipcdev, IPC_TYPE type)
 	return 0;
 }
 
-/**
- * intel_punit_ipc_simple_command() - Simple IPC command
- * @cmd:	IPC command code.
- * @para1:	First 8bit parameter, set 0 if not used.
- * @para2:	Second 8bit parameter, set 0 if not used.
- *
- * Send a IPC command to P-Unit when there is no data transaction
- *
- * Return:	IPC error code or 0 on success.
- */
-int intel_punit_ipc_simple_command(int cmd, int para1, int para2)
-{
-	IPC_DEV *ipcdev = punit_ipcdev;
-	IPC_TYPE type;
-	u32 val;
-	int ret;
-
-	mutex_lock(&ipcdev->lock);
-
-	reinit_completion(&ipcdev->cmd_complete);
-	type = (cmd & IPC_PUNIT_CMD_TYPE_MASK) >> IPC_TYPE_OFFSET;
-
-	val = cmd & ~IPC_PUNIT_CMD_TYPE_MASK;
-	val |= CMD_RUN | para2 << CMD_PARA2_SHIFT | para1 << CMD_PARA1_SHIFT;
-	ipc_write_cmd(ipcdev, type, val);
-	ret = intel_punit_ipc_check_status(ipcdev, type);
-
-	mutex_unlock(&ipcdev->lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(intel_punit_ipc_simple_command);
-
 /**
  * intel_punit_ipc_command() - IPC command with data and pointers
  * @cmd:	IPC command code.
-- 
2.47.1

