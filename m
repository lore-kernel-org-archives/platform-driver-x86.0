Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831683FB7CE;
	Thu,  7 May 2026 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162572; cv=none; b=olZ1f/mX706CqfeEwkIGTUjdeHyaQDhjLpJUmAlp0asXa03Yn8wipThlcNPYmzmUV9/6xgTfVT5qkhKt89aIWeSvJQczuxLq9VH00/vqAAQjN6E+zYOR0XTqXU4XsTZ1iVZks1QyXi+RYsWmrPTyj/Vz0x5frsbiGKxW1tIt+Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162572; c=relaxed/simple;
	bh=elvan3sjekKTWRYePDblXrLTHyXbkxnPYaHRwwUCXbI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=myFsW1DUBTYnA3EQXgPW0eSEVau0y5BHfp7cWTe3plOYhfXQ3cXtWMjofscKbxLt0itaiePjId/97wkU1DOJqnIPbAsGk+R2wiQOvrwvY2SCG8++LJGM8Nd+sF+DnLYUoUN9AMRVCbNAzGWDO3PWA6HjKxy2fiSfld98AAyhjmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=j6ajYSEP; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="j6ajYSEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778162566; bh=Qub+oP1KiTwvs67KA02nL9L7XIjze+F5ep6XPwl90O0=;
	h=From:To:Cc:Subject:Date;
	b=j6ajYSEP4QgRXgyMbFd7viuojF7yZfYRFAlMCKe31LWjJXcxxzyHkAY3rFTwOIA4F
	 +KByG/pM4rPiQGR+IhaldEDA+qZ/csA6DaYE8lI33YB/flNji5LqNfCSHJdGEroZwu
	 LubKzjfjoI4JS5CtT77upVuwB36wlA6J9mcgy3QA=
Received: from hp-victus-16r0xxx ([42.48.247.160])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id AC2C491; Thu, 07 May 2026 22:02:44 +0800
X-QQ-mid: xmsmtpt1778162564ta3n90oam
Message-ID: <tencent_8E29805D8DC7B6005244C3433C62DD9DF606@qq.com>
X-QQ-XMAILINFO: NMOcRb7Tb1o3FJABWIGQFXt4rLoAj2kmEjAzPXzaiMe16RJJ3L9R9zHRThzzWR
	 exB7wON6NfO7g5aPggtTLO/ZtR48eqbl2XpdZDXyjbREAC9GZx2SEawKvG118bhLxMi+GG8BrztL
	 bCcb6Pp5LNFcwprfo1Oc2fJTrqVXVGXKgGcfjAlQ8pFWvYpkAxi6/wMlMJYmzg1jhDupnAZGaBtj
	 Wylr7fOlxphLkjyHGcL6oEBxi3GKZzIOOePtf7wOpWwpR8kIwIgpKoRtWL50LLujlzQFKXYm/lRo
	 t0o9495brz527I6OIxbceXb7qfo6l0UfeFOVpnux8hnohYBH4dDDlbvEpcTs6ddZzNk24F8titMx
	 rNUNmPh774MiNCV9DcvKo4R8rLUD/M3+CUsTz4VHWklooWdTgkjjc0mlaMrHrlz0NvB7z/bGNd30
	 Ib4AZZLQCQ7DQrVJQUq8npdjCkIYvnxEguiTOtUGj5odzqWU/PLVCtW2WzKKUk7sPhGMcriZ6xHL
	 dh1Fh+a9unmj55YTosdYx6ODruQR1xHne4bXGVksM2Iw6lt7W0MJosphBX6ZcXzpen/zE1S0hcXn
	 fCD5a55UAuvROZZahkgO02FDb1bgeFCGOPW8cI/t2upitzST0UPblkkRVHN1AcqOnG2u9b2zO7v/
	 jlkEZUibPHWhJRpEAIkz7b0g3hpwhhQvmqUU7avAfsrlFhHc51DenNcwIRhZbFSi+Xy0VCFokOAE
	 WkDyyFvzqQAy2Xvzwdfn3tsSlCHEhfYR0SxDpvs8HH08pdgKR77xE+FA1xWd+wWNOE14c3wrM07r
	 ZBJfk7fcivRdfLQTPpw/LHRh9sjMzcMkeF8E7Tg39fiKlm2QA1hSg12ohoheBwSdWo3GssFLRa8n
	 EXcksN76hfOvkAQs1fgxYoiYir0xXrUJCbhwj8yz4+md3qY+xOC0+Wc64i8Zn8b4ExIGBFBkhiXp
	 SZM7Z4xbfZGhAhkOBcwdsh20bkA2AMFGhPMXlpIUTNWroVTqp+22J4e5sqg01838scg78OWI7JBe
	 DOqmZ/qjKUquRqlrwY6K7d1f4qY75V1VK5y55Zv4gtWdmpmvqOOLXQjvXCVf/adhPiVFR2HUSTnH
	 T/rNHax7K8DQntRu5kLfFEuvwpdNYf4Hk0EwRJjRF+5pmfyJ1nUyBEx5kXgZh05kFhMd+R
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Haichen Feng <2806891994@qq.com>
To: ilpo.jarvinen@linux.intel.com
Cc: 2806891994@qq.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4] platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
Date: Thu,  7 May 2026 22:02:42 +0800
X-OQ-MSGID: <20260507140242.698525-1-2806891994@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 16-r0xxx (board ID: 8BC2) has the same WMI as other Victus
S boards, but requires quirks for correctly switching thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on board 8BC2 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Signed-off-by: Haichen Feng <2806891994@qq.com>
---
Change in v2:
 - Move code to correct place
 
Change in v3:
 - Move code to the front of 8BCA
 
Change in v4:
 - Add explanation about this patch
 - Insert a space at the second parenthesis in 8BC2 line
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d1..71a2093cc 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -205,6 +205,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.54.0

