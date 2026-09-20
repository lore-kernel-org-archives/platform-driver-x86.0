Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779621C84A2;
	Sun, 20 Sep 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900268; cv=none; b=gp6rMg7IOoNCueSjLHUPquuq0aAWLL0X4XEFkv0tq/3wUfdQ+5sGj26wSYpjXlutUn//Vu6PL+UFMKq59Eyfi+zMb42LlSiaoJu0E3VgN1k/sGCa3EGggBXV/jVOWJNuCbxSymbaUVn3YI44aMYtXs5FQpw+QEbiLCaho51GS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900268; c=relaxed/simple;
	bh=bV5pgsM5t3O+8DvlLoBGaMdQrxZ2V8X3oC/YkNqn4CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+HvZRuXrtpt2VB4nacErz557/OjbpaHsj0PGepuIwq7GVJ5r0TRix+xQDZyiCwBt0Eojtn1qPlrd239xGHt3jeF9z0K4RWAHn6HxZhm/Q/F97H3Q6qHdrAQk8cB3+tnE8/ch8zQt11xk+72j9wtieWbkyKXf9ABs8urgN4GB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6SDOMxw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6SDOMxw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B3C1F000FF;
	Sun, 20 Sep 2026 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789900265;
	bh=lxhA0eACSdWo4aOttrFwtziIlarFVMJZSAckjMYOgiw=;
	h=From:To:Cc:Subject:Date;
	b=K6SDOMxw/a2pttRIlbfaAE5lTsioQT6vViKMILGR8VsTKchwXJ+EnbdDyGvycu7/x
	 Vl0XVyLWvfq5ynOdvz3txiPB/7O/2SA00vXNlXi76GHmYVLGLFx90XPVHZHQ63B028
	 XuTwEPtK0wHrk+7Eb8+ZKAdxSKBiGLQdZ67AFT9XXQA9R9n1rEjGXusYpmuAE9Ca2X
	 zzXxPjt+Nmf8hKJ4DYHaeguy1LHOwzLnAo+MOEkomkWISTp7DwsJBLDOvpdzhCm//r
	 Sg/0+1dC5bDB6SrNH/NYxNWbrLUjiLNMAS+glubsQeuaqe7z2UCYFOtb8ITnoAgabr
	 Bzjcmu/PdFnoQ==
From: Thorsten Blum <blum@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Use snprintf() in new_password_store()
Date: Sun, 20 Sep 2026 12:30:36 +0200
Message-ID: <20260920103035.281573-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=blum@kernel.org; h=from:subject; bh=bV5pgsM5t3O+8DvlLoBGaMdQrxZ2V8X3oC/YkNqn4CU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnrt55mXRlsPUeJ94XvNJUZea5XsxvkP79Z/f7opkXb1 hn0TTuxsaOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmkmXIyPB23vxcnhWzH4YI iOTMu8z1wd9tSsB2oc/+mpKcx3Z1/hdl+MPdzFN/bcPqE37vHCuUVltw9dTFvHJK7X3IUeq7480 5Rl4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

While the current code works correctly, replace unbounded sprintf()
calls with the safer snprintf() in new_password_store() to follow secure
coding best practices.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/platform/x86/lenovo/think-lmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index a0e3fa766e37..3ddc1f5cec19 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -487,16 +487,16 @@ static ssize_t new_password_store(struct kobject *kobj,
 		/* Special handling required for HDD and NVMe passwords */
 		if (setting == tlmi_priv.pwd_hdd) {
 			if (setting->level == TLMI_LEVEL_USER)
-				sprintf(pwd_type, "uhdp%d", setting->index);
+				snprintf(pwd_type, sizeof(pwd_type), "uhdp%d", setting->index);
 			else
-				sprintf(pwd_type, "mhdp%d", setting->index);
+				snprintf(pwd_type, sizeof(pwd_type), "mhdp%d", setting->index);
 		} else if (setting == tlmi_priv.pwd_nvme) {
 			if (setting->level == TLMI_LEVEL_USER)
-				sprintf(pwd_type, "udrp%d", setting->index);
+				snprintf(pwd_type, sizeof(pwd_type), "udrp%d", setting->index);
 			else
-				sprintf(pwd_type, "adrp%d", setting->index);
+				snprintf(pwd_type, sizeof(pwd_type), "adrp%d", setting->index);
 		} else {
-			sprintf(pwd_type, "%s", setting->pwd_type);
+			snprintf(pwd_type, sizeof(pwd_type), "%s", setting->pwd_type);
 		}
 
 		ret = tlmi_opcode_setting("WmiOpcodePasswordType", pwd_type);
