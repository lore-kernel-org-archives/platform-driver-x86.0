Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8A51EF09B
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Dec 2024 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478537; cv=none; b=IjN7aQDACfbk8xbRCeYJEl+Y5hHQ8IT/fvpEG4EPkXwFWhQi/nOxOQvO58x8S2Azv4th3+r8iz1W5jIKOYD4bsrShHkR2L77c/o9282u61BIvBebZ3W5t5d6iQk/b9/4NE2hyY6dDSoVIIl1UayI0uoE78nmSA4DVYEEN56kNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478537; c=relaxed/simple;
	bh=tQT7gPj20AkjhJhxdzdzpxUxZ8eanLiPGKLGhYhe7c8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nL2b2SfePTOTAdXQGzhviYUjU5qjWPsMnLnrGy/zojU7yqPcJUcjReTCpgxavQTxUTxlrdvyJQcFdY9jcMsgQ7yu87DGaL8OLURcFwr9d2UxzvWtCYpMVOtF9/I4jtvlAU2UuOvw62NKvvCsN/QAisxXqnUVBr0fVDVHqZ9DN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=accsamQv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="accsamQv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-215936688aeso16639825ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Dec 2024 01:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733478534; x=1734083334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSxRSZAJYUL4Kzev92MLWSVY3zScSiJ+F5sCThGqLA8=;
        b=accsamQvxmrHVe67BKtcjtYgV1gbpAHrLS2w6YX36k1HSBzM7qL5CU9I7CHFLDISoG
         aYVIibJ7ULAZtqf5YLGBa7ax55mV0bO+Lm/n0C+3WEklfDDFI13NuVn/TLoP1cWkYwIh
         qKxk1DpWpuPbWSaurlzbILLFXi5Tk5OPcr8zlKhUSIsElqcNbzmm1xth4h8qabNByVx2
         H6oJGwhUCPWut6Us1/UewJFdjEF7SUIY/8Mz5zTkorHqlC0y8lsDg2MXXAK0nCOe3fsD
         r3zd3pSUY75BOWPoPfDAFvkzChh4MzFHHg0T1YYyTHY3iqE+t7GML9WqdXZp+4/Nkz4n
         FzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478534; x=1734083334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSxRSZAJYUL4Kzev92MLWSVY3zScSiJ+F5sCThGqLA8=;
        b=DT3w7tf2XlC+uL1Oygnx6E56G+0WlacDB737NPDNc88sslFJHUYr1Rxu9HZOudCK3Z
         cBSp+rRjxOCfy8S2YLFZewoaQz7fdbudorzilSRyzGlWxPLs8VxosiW9fuSg5W5PaDuX
         64238NFavhCeRqDunts1Ke/TCHulxf47Sof90g2i2nOE2kaEsdXUpBIbLi+kawUZsGPw
         K5KaeeLIqD/KR+jxir3Nd+4mX8earDWTMBspg9ou15HnNr9I9nlSstjnQR2JPf3AxLZv
         aX9feXlZZqPDtmwtWEPDQ0DI+dc0+kWWhT04ZPdkrwWSzY/RVfk++16AvdCC3llJeg+j
         csOw==
X-Gm-Message-State: AOJu0Yz0iaSjBcu/Go6Ya8xPK/v+sYyTu+A0xqz4fXUwdNVIpzIpm/bF
	AbrsZmB7313kuRXKEkEsXnDNJrR+Igk4X8VyLzKFkMm8y1cYhq5KaqkuYDhc97A=
X-Gm-Gg: ASbGncu2fATY4JwbRj72xOPfgobVVDjDXu70UdpPu/Gy2tpxmJ3Dm1MXhTRU6VHg1wa
	l7iiV0iqINHq6JocTFTrZUTT5nvseQku1fUoG+Cmj+1QE8yl23ONqX6UAdIz1qdbjVUsSgMdeDQ
	NJhSPKnkI3oNYYVW1Iug3rPum8jqKe1gdfMs9GseZKyPfqu2cJuYMxqaFZ84Jz3ZKdznpU/sT8j
	dc/UAnG3/S0ZHXDKiKv2VC1zqUNsn0vmBc7XjZ2vXJXGAyWtt5Z0dOc8onZcXCdy9/RT4W0EhrL
	Ukmj8zQTNvmQX/dI1mb4tVFswldmWrDs9CSe
X-Google-Smtp-Source: AGHT+IHUdMl646+Pp52IWgKKPeySsvGoniwqfsly4HSg3aBCd8YVrqwclEYt/OoqwVEBep762LCTlA==
X-Received: by 2002:a17:902:ce06:b0:215:b9a7:526c with SMTP id d9443c01a7336-21614d5d6bbmr34473025ad.25.1733478534391;
        Fri, 06 Dec 2024 01:48:54 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3faccsm25292905ad.42.2024.12.06.01.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:48:53 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Andrea.Ho@advantech.com.tw,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] platform/x86: adv_swbutton: disable wakeup in .remove() and the error path of .probe()
Date: Fri,  6 Dec 2024 18:48:48 +0900
Message-Id: <20241206094848.1650137-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe() and .remove(), which results in a memory leak. Therefore, add
the device_init_wakeup(&device->dev, false) calls.

Fixes: 3d904005f686 ("platform/x86: add support for Advantech software defined button")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/platform/x86/adv_swbutton.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
index 6fa60f3fc53c..523836be6d4b 100644
--- a/drivers/platform/x86/adv_swbutton.c
+++ b/drivers/platform/x86/adv_swbutton.c
@@ -84,6 +84,7 @@ static int adv_swbutton_probe(struct platform_device *device)
 					     device);
 	if (ACPI_FAILURE(status)) {
 		dev_err(&device->dev, "Error installing notify handler\n");
+		device_init_wakeup(&device->dev, false);
 		return -EIO;
 	}
 
@@ -96,6 +97,7 @@ static void adv_swbutton_remove(struct platform_device *device)
 
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY,
 				   adv_swbutton_notify);
+	device_init_wakeup(&device->dev, false);
 }
 
 static const struct acpi_device_id button_device_ids[] = {
-- 
2.34.1

