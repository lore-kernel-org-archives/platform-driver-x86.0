Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE48313277;
	Tue, 15 Sep 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503952; cv=none; b=MLAghuc8EEWUBQUMnTBdzzp7ZqZvPWA2+PYOg5A30OpxlxvgTXItPSr8BTYM8vOeYgR8UJRVeNKr4427Iapx/X4He7Jd3dGOTKBVCC/St/biWB0f2jTjSH71yGTbnHIHH5KKf/4TRLAY4eFsgfV7+hFl+pjbWUGNVylHr6QRGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503952; c=relaxed/simple;
	bh=NONeWx/h8YN8IsCmmRa7XUyLcVTvkA56m/uw9zg9Kvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ytg5Tmf3HWqK7bgqjRfo3+NXtOqVqwKW4aVNZisR3x7MtcUpCo4qgsTz2XT4s+hKjp9b2WeVuYOKZmLieVqjHrX1+GeJMLALpLw/kjrJd69rhrdT+LS8Wthc0i/wiDdB84+WJVnFKXl1G7QofzZffcbwn9BwGYmnU9fmgLcBJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzoLendN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzoLendN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36A21F00893;
	Tue, 15 Sep 2026 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789503942;
	bh=qm4u5TidfLOOEEqRoGutd2iVNen2KogAhIL6T8fu5CQ=;
	h=From:To:Cc:Subject:Date;
	b=YzoLendNNfy1RFtVRH/t+WC59koE2zpEz1UCX1lzLAbg9zFs/cFvmB/IfJ+8Ku3Sn
	 AvgLIJp8RNuvTrCnpBO4NIaWiBk/TTvBiJ2RDD8QIyZ0mNJb6rYx9yMwGFtxSJ1QO5
	 9VDbso+szm+zxWJe7b3Bn1jT7T0Peq0+AFKIgBGWI8nk8uT2cf4INUAtDtYKQOYqyr
	 GvZYAGfie3DJBwxYgiXjXcIkPE5Vwyag+fEKMfTG43yyMrWwCe1x10uSuexXPmpgba
	 yv2/YWnGceRCh7sVWOGWkGGvCySEKDJKb0OQ7g8oNU4BdI6DXqrM/KFwwWDP3YuQbH
	 cqML2yaB+9OpQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: fix compat ioctl handling
Date: Tue, 15 Sep 2026 22:25:20 +0200
Message-ID: <20260915202535.3689880-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Build testing with -Wpadded shows a structure that is incompatible
between 32-bit and 64-bit x86 userspace:

./usr/include/linux/amd-pmf.h:202:1: error: padding struct size to alignment boundary with 4 bytes [-Werror=padded]

Use the 64-bit padded on all architectures here to avoid both
the warning and allow compat ioctl handling.

Fixes: 98432eec3180 ("platform/x86/amd/pmf: Add util layer and userspace character device interface")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/amd/pmf/util.c | 1 +
 include/uapi/linux/amd-pmf.h        | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 4d1a61e4f1b9..2befc1b14842 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -123,6 +123,7 @@ static const struct file_operations pmf_if_ops = {
 	.owner          = THIS_MODULE,
 	.open           = amd_pmf_open,
 	.unlocked_ioctl = amd_pmf_set_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
 };
 
 static struct miscdevice amd_pmf_util_if = {
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 24cf9926dc59..151f264cd7d6 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -199,6 +199,9 @@ struct amd_pmf_info {
 	/* BIOS parameters */
 	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
 	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
+
+	/* align to 64 bit boundary */
+	__u32 __pad;
 };
 
 #endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.53.0

