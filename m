Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F77F1D130E;
	Sun, 20 Sep 2026 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900526; cv=none; b=cHnVNVXIKH2qO2D7MxIYdwtt0y06MUV2eNyh3Ai8KfvX7iG9dq1WKu01Xwo0cBsOuTqE6zGiFAywxHeiyjEKL8wTAWeLFz+oVaIkPA3YkLTQHOKJiaNx1huIKzZQYr7uSXROWk8ho25zS2vY4KcK+ITKFASDFqHrOTCCR6Wi/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900526; c=relaxed/simple;
	bh=Fyw5JMLw28dvJTtO2NynmGcMCOJjg53gtdJpI0MhQT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSshYxX5LU1ToMCN4fDhOjHT4HKvHOB1iAlGdhhwfS+KU1wjznJHAWHCYJywko+zTfbDmdUOFPHz6/cHmmPWCY9zoH2Rzubs0BnNshcGiaItEiUB3HWYvYJH5Du2aNb9An+ufnzrRpM73M2dvCU0K5ZJ4xYcyd7kQhaVVDCaGuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+rjJgCI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+rjJgCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6542C1F000FF;
	Sun, 20 Sep 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789900524;
	bh=kdoiBNhba33kdp0HKlvqcqx5AWRomZp7kn5VJlFyHrI=;
	h=From:To:Cc:Subject:Date;
	b=k+rjJgCI8QDYqQ4DvpHangOCbQSgRB0txpvP1neEoKWF/kpB/QsOh5Z+0o92QBju/
	 jFg5Mi62fJlDcoKX9TQb7ywc0JcGSBWlH7k4sPkCrr4yO338bLHhCJ0/o8l4I01TZW
	 MmH0CQhFM8gZBIwg4ynHOQfhqxZbY7BVwrU0k/alTM7ZmET3LAO1+1/mTNre7zY8r7
	 TfHOy851aiWx6gxnREdD4DKZKH97TFMXfeqh/4CLatEHDu0lHHoT8aaJIzJ8xI6Uwx
	 ymtOta68k1E2rVE94If14PWBtetusnQDavdToxnuuJU6nhOGXf+SigdeEdPBvRcXi+
	 rJ+4o57PgV5IQ==
From: Thorsten Blum <blum@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Use sysfs_emit() in pending_reboot_show()
Date: Sun, 20 Sep 2026 12:35:18 +0200
Message-ID: <20260920103518.281843-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=blum@kernel.org; h=from:subject; bh=Fyw5JMLw28dvJTtO2NynmGcMCOJjg53gtdJpI0MhQT4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnrtz3bOf3kZrU9b6MDo9LrdKrfhryZs2PCJu4Vmd1SR 1Y9n1z+vKOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmonOI4X9i+U/3TgvmpMTX L0zkqxT28V98MyPA31lW/cnKmylHH0gx/M/YnfJKT8mtfeMxw4Tr39w8NvCemOIa8Jb7/C9GF46 NnzgA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in pending_reboot_show().
sysfs_emit() is preferred for formatting sysfs output because it
provides safer bounds checking.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/platform/x86/lenovo/think-lmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 3ddc1f5cec19..7b319601662a 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1281,7 +1281,7 @@ static const struct kobj_type tlmi_pwd_setting_ktype = {
 static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
 				   char *buf)
 {
-	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
+	return sysfs_emit(buf, "%d\n", tlmi_priv.pending_changes);
 }
 
 static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
