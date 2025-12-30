Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A641BAD5A;
	Tue, 30 Dec 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101598; cv=none; b=NI7Q4O895ar5u9KmNPjCKVAWmQ/B3lBHW1u8VloZMgqsmb4OW3HaHcLIso2KmhmCiQoyChvW0RApObokCpO+I99tCXP9b1vvj07B5QS6r7BrHNnDhU9580Yv2UYSMDe1/xeAw9iRrpAgU4zfFsufLzl3ZbOZ5Obr7MXgT9iMzJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101598; c=relaxed/simple;
	bh=tTZzxgFggrL4Iw35RbpAx8HlLtOVoNB6gRTHqSEJLPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dK2Ry+TfJyOsVEnxVOfGqp777WKguIwzwuVUtYnz6Q4gEIO/74p6YVZNyowNA6DJqeoPKFZiPAjEK6BRo/2M5pdiUHGdBJZWONdb85az/kuhslVIf2+7Cc51d6tt392MzSr9iPbZs350Ha4ncbhb+TyTMAeUAzGixt+50AY2gA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=THMWgYcp; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="THMWgYcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=hAU4V2qKUA/Q5uYVmkNHQoQDejwOVYlLr9gSDVOUD4o=;
	b=THMWgYcpvnl6O7FObvCeI9sxgWIbiRA9SZJPxoL28hq/ni+fO9ouELRyUVkxAW
	IsMtnmpwg2nfLhnSrGY2hPX2PdOg9ZhrqSaNmFnX8aGrW/Sxc0YG0rJvvpwbE07M
	Mff6P3n6y4bGMDl1V4atyGgIUwmqIXjcp3KfWEPDhS8no=
Received: from haiyue-pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3PzoX1FNp+gj5DQ--.11944S2;
	Tue, 30 Dec 2025 21:31:05 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-doc@vger.kernel.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Akshay Gupta <akshay.gupta@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD HSMP DRIVER),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH v1] docs: fix PPR for AMD EPYC broken link
Date: Tue, 30 Dec 2025 21:30:50 +0800
Message-ID: <20251230133101.14362-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PzoX1FNp+gj5DQ--.11944S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw15JF1fGFWDtF17Xr13Jwb_yoW5JFW8pa
	y8Cr12gwnxK345XryrGF17Zr43Za93C3yY9FWYkr10q3WDWa4ktr4ftan5X3WDZry8CFWY
	qrZavF1rX34jy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zimhF7UUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC8Btq1WlT1BttQQAA3N

As 'AMD Documentation Hub' [1] announced: "All technical documentation,
including for AMD EPYC™ processors ..., and more is now hosted on the
AMD Technical Information Portal (TIP) [2]".

By searching the No.55898, update the new URL.

[1] https://www.amd.com/en/search/documentation/hub.html
[2] https://docs.amd.com/

Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 Documentation/arch/x86/amd_hsmp.rst    | 4 ++--
 Documentation/misc-devices/amd-sbi.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index a094f55c10b0..8bb411f0d70d 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -14,7 +14,7 @@ set of mailbox registers.
 
 More details on the interface can be found in chapter
 "7 Host System Management Port (HSMP)" of the family/model PPR
-Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
+Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
 
 
 HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
@@ -185,7 +185,7 @@ what happened. The transaction returns 0 on success.
 
 More details on the interface and message definitions can be found in chapter
 "7 Host System Management Port (HSMP)" of the respective family/model PPR
-eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
+eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
 
 User space C-APIs are made available by linking against the esmi library,
 which is provided by the E-SMS project https://www.amd.com/en/developer/e-sms.html.
diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index 07ceb44fbe5e..f91ddadefe48 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -15,7 +15,7 @@ and SB Temperature Sensor Interface (SB-TSI)).
 More details on the interface can be found in chapter
 "5 Advanced Platform Management Link (APML)" of the family/model PPR [1]_.
 
-.. [1] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
+.. [1] https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
 
 
 SBRMI device
-- 
2.52.0

