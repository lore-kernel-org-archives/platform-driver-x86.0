Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353BB32B9BD;
	Thu, 15 Jan 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465118; cv=none; b=rRCM7/4EFMRpVQmITCSWOJnRbeDlhM92hOHRWyPHYVFYr4dKY780GntpAu3UvOGw9KokYyG1Zbb/4vHFnH4FFu7PPquA5G5HmAp9m2QxFhrMQ5f2/gAKXXkeVZ74rRQbgKXtGb+cmWXklsCgSrLff7S8IlrmXor4yLnh5gMmtyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465118; c=relaxed/simple;
	bh=udHLRBVZSBvvjXSa2jYMIcC0XUC3xK09ybchmNCCbq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e+AQDeG9HNs+pzuSqxOlHI6hQcwccA7+HD1/VKonqq7SZsvTLOXZ09oZvm/VUWVn01DUhCLh4rgMB8cYRFTYo8Cu3c0NwEdvozHcDe2PlR/esbpKUFO4OM9X9hA2LU9CpwF6hd89c6IHI9Gcsv2ouzZSwHZMM/GE5tMk+FahkBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACHa+LMomhpmq04BQ--.64122S2;
	Thu, 15 Jan 2026 16:18:20 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: hmh@hmh.eng.br,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] platform/x86: thinkpad_acpi: Remove unneeded semicolon
Date: Thu, 15 Jan 2026 16:16:36 +0800
Message-Id: <20260115081636.164041-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHa+LMomhpmq04BQ--.64122S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DWrWDCF1kuFg_yoWDKFb_uF
	109w17uw1DGFn0kF12yr4fZr9xt3WxWFW8GF9ayF4aya4UZayUtryavFW3Jw45uryjyrW5
	W3ykGr9I934SvjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26rkl6F8dMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	c7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7sR_hSdPUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index a272f27e6227..6b0e4b4c485e 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11164,7 +11164,7 @@ static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_s
 			break;
 		default:
 			pr_err("Unexpected value %d in switch statement\n", pos_status);
-		};
+		}
 
 		switch (panel_status) {
 		case POS_LEFT:
@@ -11179,7 +11179,7 @@ static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_s
 		default:
 			*count += sysfs_emit_at(buf, *count, "Undefined\n");
 			break;
-		};
+		}
 		damage_detected = true;
 	}
 	return damage_detected;
-- 
2.25.1

