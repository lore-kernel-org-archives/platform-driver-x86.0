Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CCA406269;
	Sat,  3 Oct 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021582; cv=none; b=DIKDJFO+ovX8aRLbNTFMeODx2tuUeGw3zRyZ8pb9E7j4SeWQBg9BoMY6cax4iEr5WKkxQ7IIKWjreVK4kl9zdHDIyznUtT3j21L05N75C1nbwwFWgNDodmMYKJq5D64Ll6O4IkEJEPUSeJMV0T1wA0w7Hthie1MSZ1pZpofcjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021582; c=relaxed/simple;
	bh=ZwRXrmC6y1uKJTvpy1i+MgfzLXcaKJo3CA1zUqJoFp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=psw1Gl+AE88GGH1WQQvGDdp1JAUEOl0cEd6aAFwAgDYZa+oEuLJHQLqGiUOfAk6kT3DFQZgkpEe39yctSnWbzab+aIgOgiaac6nQ7p0CHejB1piVVtrgvl+XkgQzCY9Wu4tzKr2sjY/VufgPgAtYSI2uEerJwFIvo2VUx5fEE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fQ7xmfrz; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fQ7xmfrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=p2
	QR1NHjS8Y0nFlEjMCQ/odtZcWZYWfePfPOvyn8mG0=; b=fQ7xmfrzGySrNUJwjV
	Dpf+pJhhEM0NBZDWMvlDPotnqfcdc8mfI0ztraI3yUtWqwZLRlwkL4MKQ+g1dmxL
	S5jedZC3hcl2fiHNQKqkXzJySQoMCaHZBbDTldh6AOMwPW9mN5BbDRTYllEWZPrk
	CMQRtuyetMxp6eRF7SDDkEcsM=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDX8L_o0cBqNGACCQ--.27866S2;
	Sat, 03 Oct 2026 17:59:05 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Andres Salomon <dilinger@queued.net>,
	Paul Fox <pgf@laptop.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] platform/olpc: Reserve space for a string terminator
Date: Sat,  3 Oct 2026 17:59:02 +0800
Message-Id: <20261003095902.574873-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDX8L_o0cBqNGACCQ--.27866S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyUAF1kKF15try5Xr4xZwb_yoWkCwb_Wr
	9YkFWxJ3y8Ar4qv3WrAFWfWrsFkw18XFykur1fta4fAryaq3ZYvrsY934avws8JFsrCrZr
	Cw4xZFW3Cry3GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRufOwtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQl5s2rA0enydwAA3Z

ec_dbgfs_cmd_write() copies user input into a zero-initialized stack
buffer and passes it to sscanf(). A write that fills the entire buffer
overwrites its only terminator, so the subsequent parsing can read beyond
the buffer.

Limit the copy to leave room for the trailing NUL.

Fixes: 6cca83d498bd ("Platform: OLPC: move debugfs support from x86 EC driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/platform/olpc/olpc-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
index 4a2d36f7331e..063f7e55c421 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -269,7 +269,7 @@ static ssize_t ec_dbgfs_cmd_write(struct file *file, const char __user *buf,
 
 	mutex_lock(&ec_dbgfs_lock);
 
-	size = simple_write_to_buffer(cmdbuf, sizeof(cmdbuf), ppos, buf, size);
+	size = simple_write_to_buffer(cmdbuf, sizeof(cmdbuf) - 1, ppos, buf, size);
 
 	m = sscanf(cmdbuf, "%x:%u %x %x %x %x %x", &ec_cmd_int[0],
 			&ec_dbgfs_resp_bytes, &ec_cmd_int[1], &ec_cmd_int[2],
-- 
2.34.1

