Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35982F5B
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Nov 2025 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763218617; cv=none; b=f0zBOUElmbgkGSIMmB96UemfYTfF/9+Wo8vM5LsQVr5rvfGzengYKx2q25TPYPjrELbi8OA1FKWvl0/yH9E/1gXHFOJ6FNGCvVXT1TXiRKkm0X8SJA4WBzeOCArwAcS0wJg8eJBrmE3z08VjySOGOvS/TXR1JI5kI20k8fkrh2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763218617; c=relaxed/simple;
	bh=5EnLX7TJ3If0naPVLlJ5YB5wndsX7mg2xeIAUOoH/aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUITkJvBXXeTf0rCUVWiOUiaIookXTjtt+XvAw7NzdJlRl8pIwRCI92yXPFMr3+zH7Ly+DlE6Np1pcZKfEngTGWpzsJXuCAYdtl50uyDYKiXftmdx6zoAwNoxij4Mv+0ws16C2lxcX+KBYfFQ4ZNLHtVm+/hGKuYRRISZ3XDur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=igsAoka9; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="igsAoka9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763218613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nSgi7CbKrq8XXGPUHFVJTiosGEXdDJm3AwmVzdS/zzc=;
	b=igsAoka9YoKj2xjgyPQjJpploGBVoWinjSiHpvR4cSJ6qsM9tYvyDu6vSLJKP6hXL2YQp9
	xVaTv2Q2DqJwfU1s1ZWS8xZN31L3YfHDAz+8M75DC7x5Bw2AZOvHytm961EHpX0j8XKWFc
	zBzUcZQiueuQ+TbUCU6YdptOCB0sFyA=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: fix wording of a comment
Date: Sat, 15 Nov 2025 15:56:49 +0100
Message-ID: <20251115145649.1174238-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Drop the repeated word "known" from the comment
"No known problems are known for this dev_id".

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 31a3046b7d63..c3026e1d3ce2 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -242,7 +242,7 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
 		pr_err("Refusing to write to readonly devstate part of unsafe interface\n");
 		return -EINVAL;
 	default:
-		/* No known problems are known for this dev_id */
+		/* No problems are known for this dev_id */
 		break;
 	}
 
-- 
2.51.2

