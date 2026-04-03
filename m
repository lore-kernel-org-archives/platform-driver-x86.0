Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4577397682;
	Fri,  3 Apr 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223774; cv=none; b=liXf158yLI63H7FB89AcDi3Us423O+rQ6sfvsWntM91HN8UuqiZJeVrKqwL5nBLa9Qc/a2PqcmWVLSDiLW/iWSx1s/GJ2I6ZYSQ1/E+eiAbpBhMNxUTQFSTY6kTKEpyPHFkq2R+E1L8ga+TXYpaOwsvA5tFMPSQ2IWmfgFUXPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223774; c=relaxed/simple;
	bh=58FogJwp6kt0Jz2aKs/s5YIdUuZBZ7Bq6z6rinCZAZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tw1Ne/k/b5o8CsFL1fbCWT1/1FjhNLx4aMlyCpsV/53wlfGQmALU7O5ebUf4uKA8Yf3pu3a86OFJF/r9/+nwKBtlu+L1A2DU+KLa8GqS8Wbe8+jh0IkgJaMSFGcH24i37jX8BaOjA+SjXr/c5FHkKlH2Qks78+nnBQz8QB2V67o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=Im46FUaU; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="Im46FUaU"
Received: from debian.lan (unknown [79.139.252.175])
	by mail.ispras.ru (Postfix) with ESMTPSA id 3BEB845A1D06;
	Fri,  3 Apr 2026 13:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3BEB845A1D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1775223769;
	bh=jEj2aboEYwN0n7zclUNeus9u6hlRWPOvjZYyp5tsL8U=;
	h=From:To:Cc:Subject:Date:From;
	b=Im46FUaU9GAY9ZJriNvyaMUppWCqUAvLDdRJZ/myqolhkZjfyMqW/mnFAKY1YBlup
	 BZguLunXYeo2iaCsSjcG1MuWd6n4Yg0xQI3qEO1OVJ4cUnwin7KqJYaFPaDyYkyqdI
	 /N8ZVdoHUBrUDIzOtKS0lj5AEThMBWT5x7sKjyWM=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Hans de Goede <hansg@kernel.org>,
	Andrew Morton <akpm@osdl.org>,
	Abhay Salunke <Abhay_Salunke@dell.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] platform/x86: dell_rbu: avoid uninit value usage in packet_size_write()
Date: Fri,  3 Apr 2026 16:42:39 +0300
Message-ID: <20260403134240.604837-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the temp value has been properly parsed from the user-provided
buffer and initialized to be used in later operations.  While at it,
prefer a convenient kstrtoul() helper.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: ad6ce87e5bd4 ("[PATCH] dell_rbu: changes in packet update mechanism")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/platform/x86/dell/dell_rbu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index eb50f1d75d0c..225c318d4b44 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -619,9 +619,12 @@ static ssize_t packet_size_write(struct file *filp, struct kobject *kobj,
 				 char *buffer, loff_t pos, size_t count)
 {
 	unsigned long temp;
+
+	if (kstrtoul(buffer, 10, &temp))
+		return -EINVAL;
+
 	spin_lock(&rbu_data.lock);
 	packet_empty_list();
-	sscanf(buffer, "%lu", &temp);
 	if (temp < 0xffffffff)
 		rbu_data.packetsize = temp;
 
-- 
2.53.0

