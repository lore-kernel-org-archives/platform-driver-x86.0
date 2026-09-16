Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2E34B1A3
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580939; cv=none; b=CsiO7RDXarIMEk/T9d1MhImH6EAj6WjdHVGsKQwBB0feEvVhj0CdxmKyu6c9uJIuQw/z38HzjNEcngWuOmvvqLMYUMTwtZq/+JT0IrnPOImSYdEu/EaddskJuiNv8gmN+g0XeEJ9lSgUVU1hudXmzpWvWIVOmEcjivwJODAdRqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580939; c=relaxed/simple;
	bh=yFEBDTHLm27tGKV5vt9Tu/3K8m3JL0Xv1esWzL+iZlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hTPGvEun0l53r2fgkvGffh4fOP7f92SjV9BIfKYfCjmvH8cpg6mjwpzuZTGHn6KkjqBaP++3DzwZxrc0b/jf1SO/rgL2ePtYgsOzvhE/5Dsdpsk4INGOHVTvL+96cYDqkvf3KmlmjWVjNRkkaT+72gkHsga1kEFYyXdndNFuATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEWvwuDD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEWvwuDD"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eefae4so3499505ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580931; x=1790185731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tX/P6iDiknOSkE6HIRfZmXdsK+EZB3PqI+j0tRbaNG0=;
        b=QEWvwuDDWBUjSl9ErHnpI1YiB9iPXM/4zs2QdbNmyxR5VQnfkuZlqoIJ6SBOYjL0BZ
         O5xLIy89CDA178TUyz4xrdm7s3Iqbv7VvIavfMMehIse1nsrjVDqSvEpK0X9fCWOy99U
         X5WZgH33QQx0liqpkMkJL7OZeNB3wWVYinsX3R8e64yoSG9+k4mau/4x0mNvuga5frck
         6gEzAgjdYBligc+xhy7UJ9JA2VwTkL6UL6OkEQfYSvlrA3tk8eY7lWjypKIWdUrSLXht
         jYWIJ2QPQC+HWp2bHb8NYsCXePFr5WTBMucD2jMo5dlADCcft8nKlrI1zg7dRHpChFIs
         mlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580931; x=1790185731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tX/P6iDiknOSkE6HIRfZmXdsK+EZB3PqI+j0tRbaNG0=;
        b=VbXPaAAkCj8AZxLPY5iul6QMTGfv1FE0g8H4bvV2/Hz82FdRLY4qlMMcx7QX5H5b2s
         X8IS+cz00yEHc9WNaxIZhmGnBgkANM7aXMW6bYbMnCt+jr9TPFHz4fhdC8K3tbcG9Hmf
         6OqA/6JSx/Wmom5tZOcmpWuiuDDPWCUEnxcFoHGO4fmHcSKzGHaqAXq/mqxyDX44Uzr5
         zWCoswNrkNyGDnbERhHbSHBfsIAjbvVAQTtylQZnCxZ5N3qqB53jilh9tj1dGp20Yv8x
         J5/uButwNKRyr8mzajox+9ZQXd3jCc7imBv0EAFFpICQZOxdlL4hIs+K0ODxyml0M9e2
         YSiw==
X-Gm-Message-State: AFuF++moZbo0hj/0zW1Pyac9pkRrqoBtJ09vd/G3P20KkjymHQvu0Nh2
	b3FcEX2U16EKI8nshBnJB5EaGV08W5Mcwid7nKbZ41+dSIgveuMaPpCe
X-Gm-Gg: AYBFou3P00UDqbXV+PXT3rD4q79B9KemtpuVZCgXkLXo+nW1VDmn1s9WyTm71Wn/DtF
	lvDBYWmp2E9i+LGjClYciZDVnasJxKlgjTL8cztEZrQSzV1doDIqw7kOQtVJHLUv+l5wfeVFYEf
	wzJ1MSSNO1eggZY1wlYptOjcJEC6HhIr5fjWF0lyn0dvI6PJte+IfSFKeeNXXeOEN5FfKmIEf9l
	5jPAUf9OP02oczRGBubZd8GjZEQVlYfQ89XQd8eXu93DfFeGJh25tuiI8AZnbn1TB9uNcF7+P3f
	lrNDfrDL3Nijbb6GKOySp/+jKwMoihHdTveQLmr6Uiltf+qiRakoLdFOp0y2imFbWubEA6HUDUy
	1uSqB+oEV62megEZ7RcROWn+7BzXPChk7Rvti0Jca+eGvgQGdCpwcN26lGFna2A3TgHJAyFmnUQ
	aHIoF5CnCBavGeCUfysuBcRmmr00I8uAO6Wj7OO2fmtMHH7tRQikiW4ysGWPGEPIsKK14JfoY0V
	LpJ
X-Received: by 2002:a17:903:b90:b0:2da:fa62:4aee with SMTP id d9443c01a7336-2dd9c7b71ffmr7717775ad.1.1789580930906;
        Wed, 16 Sep 2026 10:48:50 -0700 (PDT)
Received: from arch ([2401:4900:ccd2:8875:9d19:1309:9e6d:8926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89edef89sm15919995ad.49.2026.09.16.10.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:48:50 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daasaradhi Mannava <daasaradhimannava@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Add MSI GL65 Leopard 9SCXK EC firmware
Date: Wed, 16 Sep 2026 17:48:30 +0000
Message-ID: <20260916174830.11620-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the firmware string '16U8EMS2.100' to the ALLOWED_FW_1 array.
This enables Embedded Controller support, including battery charge
thresholds, for the MSI GL65 Leopard 9SCXK (MS-16U8) laptop.

The EC memory layout of this firmware matches the existing config:
the CPU and GPU temperatures at 0x68 and 0x80 agree with coretemp and
the NVIDIA driver, the fan mode at 0xf4 reads 0x0d (auto), and the
charge control register is at 0xef.

Tested on MSI GL65 Leopard 9SCXK with EC firmware 16U8EMS2.100 and
BIOS E16U8IMS.504: with AC connected and the battery at 18%, writing 10
to charge_control_end_threshold stops charging ("Not charging", 0 A),
and writing 100 resumes it.

Assisted-by: LLM
Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 566dfc73c..7c84ddd7e 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -122,6 +122,7 @@ static const char * const ALLOWED_FW_1[] __initconst = {
 	"17F2EMS1.104",
 	"17F2EMS1.106",
 	"17F2EMS1.107",
+	"16U8EMS2.100", // MSI GL65 Leopard 9SCXK
 	NULL
 };
 
-- 
2.55.0

