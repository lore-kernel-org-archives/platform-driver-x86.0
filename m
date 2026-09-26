Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DCE43CE7B;
	Sat, 26 Sep 2026 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424815; cv=none; b=iA0jSJfYuQjgpqrbZKMmjanEvfDZXLtMsvVp8h86xN0NH/kHFsUcDIjKQ4If/hkfXdQgFFvQd3LuUKV/6HbAA/lfxILFr5FT8xgQSJmQvcglkkm7KGMR2/z4ijd3A5wNDafp37nqV1QtSV1F7JUMYUNjSUHSMtuYrTCLmaUbzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424815; c=relaxed/simple;
	bh=ZwRXrmC6y1uKJTvpy1i+MgfzLXcaKJo3CA1zUqJoFp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LuXY5Z4lczZ9vnP5iH8y6KPYm+omkMZgEDy3uVx50fAY+FUdNUR8yVifpi7OUt5AaCiyJQZyL4o4b76eeiPWfFWX+vuPgQXEHkI5/7xK7PuweeYP5d+y1twial+bjEJXB7Ap/K5z5ds6LsR1WbDDvAmuy9RhZTNgg9NZ/MGxrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fz4e/qf2; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fz4e/qf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=p2
	QR1NHjS8Y0nFlEjMCQ/odtZcWZYWfePfPOvyn8mG0=; b=fz4e/qf2/F89t6r/eV
	dqm3qN/3yuFgsWdLEJ0GMzkrM4pfFlnGlcDo019fIvwLPbqnqIBWrTSQYTYLGIQz
	/M7Z/iciw93h73MFWy+xeSWhdnQ1mRakf288/X4sUk3ZA0KKytJkZyC845kvsTyZ
	as4KK0OaWrFJhy/v7glz51E88=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD338nKtrdqfXOcAw--.9011S3;
	Sat, 26 Sep 2026 20:13:01 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andres Salomon <dilinger@queued.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Fox <pgf@laptop.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/3] platform/olpc: Reserve space for a string terminator
Date: Sat, 26 Sep 2026 20:12:48 +0800
Message-Id: <20260926121250.3258285-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926121250.3258285-1-yaojiale02@163.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD338nKtrdqfXOcAw--.9011S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyUAF1kKF15try5Xr4xZwb_yoWkCwb_Wr
	9YkFWxJ3y8Ar4qv3WrAFWfWrsFkw18XFykur1fta4fAryaq3ZYvrsY934avws8JFsrCrZr
	Cw4xZFW3Cry3GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRHHq73UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w1po2q3ts0fvQAA3s

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

