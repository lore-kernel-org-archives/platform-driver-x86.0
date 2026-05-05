Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3231F3921E9;
	Tue,  5 May 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981516; cv=none; b=RmM0o0gTvuYWdwRqaRq57qhgzaSOkkaFr9MRuj7kQF72wnxjZDcRm5La3hMfK9OTXMdDZcgz/QII2Rrkc0r12CN53XRfra7D1xrmpyaY1FErLfvtAAKtmZauFbaTepJpTlorCku4xvL36wzlKTTff8NSLl7nnTiDk1y4RlOg0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981516; c=relaxed/simple;
	bh=elvan3sjekKTWRYePDblXrLTHyXbkxnPYaHRwwUCXbI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=I1kK/kE4IZ+DUt4T+7DQLRUpPu2BAKXtipk7x04660Mfvuy8YijJAPWURmQTsAzNYCHXKd5iO9OclsHApMh1xtVjzvO4P4AbKaoLMyFCJTcCFyby8o0tCI8NECV5lFXzQJ6fJKjpWSIcmv/Fbmpx+y31q4W0pvVFKD8i4cAi0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Cqn7F3Iv; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Cqn7F3Iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777981501; bh=Qub+oP1KiTwvs67KA02nL9L7XIjze+F5ep6XPwl90O0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cqn7F3Iv0KVr8i74KD2mhp/32RswxN7Zp1k+WGWMfEfHtNUup5ped1fWxBPXdAm2w
	 VEM6/WKBkjJlBA2zPDYZv9Ma6r+0HcBWrDIkjdz+4B8SJo7F4YYch4KjekpP2YzFA4
	 uJlKEwl+A+g+fsXl6Z/nlp1jcYbUQLtJubfZjgDA=
Received: from hp-victus-16r0xxx ([42.48.237.151])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id B3B290D3; Tue, 05 May 2026 19:44:59 +0800
X-QQ-mid: xmsmtpt1777981499tjg77hi8v
Message-ID: <tencent_99A9EA72B4A101066BC4B6F391F41BB8E309@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJOSMQiQce72Fe52NEt4LQ2GQyESnm6bfFU0hdUgINozbP7C4R7g
	 k6fUhiBt/oCX5qXxTAGia+nf3fV5R8PH2tGS3eYIPhAY6bDabmISKNubRx3h7Y/MRVD0X6ng44CE
	 RtXUjesKL4K/4O6EfmqW3THvm9bLyEBZ3ov4fvBRpJSafHcK4gc+Lzwp2A4CGXQSv+p1ueHaEFa0
	 yZw1+9H5zlL0JZzoU9Z+TFv85O+vCYlnMEm2ldwnjCa9C1mXmh4kExZB0YBz2OgHTb8yMz6BeVJz
	 EdCawIe4PocBLUUaejXbzUr3S4DPkMCg7x80c5k5ro9v0MCWLxGfaf9hZVKZRWcQ84WjcEJrA3VJ
	 WJgUxGXjSZa9VGzNQ9u1M3BOQiPR88gJ2TNDR8pdVnhlstDqBLZ++quV1xcQeDQUcWjbfE8A+Mdv
	 MNvFuaKuhAJ6hkvbkORJ5Pv6QrBCkQwB84EM7UOcyOSgs4HnZZ1WQdjzEAI+3m+b4L6U11hgz5MK
	 o6eLVYJ5FgxjKbtmMBTIGmpNliZy0WO6o80q+VGy35PZh5EHWkca9SZiR/m0JtKQHvKRYaC+PzrX
	 xyhaMV065a1KvYZzS1EsKce76m3KvtygPXiLewNQ7jflcyJXhq9IvsSglzhqx9K16qwG5J3KHNDl
	 Y7tjRKypEN7+bM44UJ8ISmomnud8i4A/uZeJ7hW9Uqa+eu2D3B/LJaYlOcED/7cAaBYArkVuD/s9
	 EA5AxkKuYgY9nW4pmXjARUwD2mOi1gfUkS1Jknl+VfS7c9UbmgoY07C/7LK9eUOjwIlrRf8A5ncO
	 jXl4EC5AW3PSm3Ai8bzuvrKEiGbKh4gR5OwgSX9E7gC/28Sw19LA3qM1Ej5HUKSDAtxEBYNvLa8w
	 sKXPCQP/A2aKzYxkKY0pKPB8nI9X/1WDESFtRCMvAcOYnLTMv/z02/i8JUL1MoNVqVBQG/pcDt+c
	 EraOgOm0ErUT1qtLYbtzn5evm8l2uHWJiDrSBjKPt2RVSlPMz5ZltWjFurLAQ5LL3WvPqUiaI+FY
	 tkqYc1Qt3+8vFrt4crGdUthkNixx2D4/QEuhMqH1fqa7zx0yXCR33AgKvjPJqfv6uiHNfxJQVk2C
	 nh0W/uPOUR5Kcr9feqbl5Dbw2iyeNxWI6N/c14FhAX1ZOrhhbne28MQcn0ATwxC2/u0jWGHWGwFR
	 noxkF7kFhwq6p6otgWf+tyVPAZ
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Haichen Feng <2806891994@qq.com>
To: ilpo.jarvinen@linux.intel.com
Cc: 2806891994@qq.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
Date: Tue,  5 May 2026 19:44:31 +0800
X-OQ-MSGID: <20260505114430.309275-2-2806891994@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f1258e15-cd9f-c215-4cc6-0b3b282994ba@linux.intel.com>
References: <f1258e15-cd9f-c215-4cc6-0b3b282994ba@linux.intel.com>
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

