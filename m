Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0C30DD2A
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871833; cv=none; b=mN4X7TrPBl19HcfE1o4ziXLPJ2F6/MF1kqJyg1Lp/Lpv+/iIDsyqSvM7ulN/Vmk0L3YeHf5olzM1WdsGakGEeJPiHVPEyx7xlzlJoejc7GQ6jOx65pm4PtIYA98Bt39/WXC/aMDXWMxMHtQOkVga81idzqAkDT7jSAaGVWmDduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871833; c=relaxed/simple;
	bh=fuuCUuLiiAlWj5O0MY2xcNWeQOX8xNIcEYxscbbpl2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVOOd29RrJdiv9kfyzlBOvGOPktJDLlO+UrFq/nbPqpy0apgsFUI9g6VetO7blm4tETXCTHNx4seltAEPp9JXKfoLrq77+MugTLItqPztYGrU7WBCEDj/F+MW8go3PCyePIsPCG4FVmk9Z4C4KXmMYVdUf2Zv29Kk6wZDs2TUSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1sn1VOL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1sn1VOL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a5174670eso6386538f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 01:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779871830; x=1780476630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLhH+O1MwJnv+XspZX5gRQeh6CPwGkODbhZWHr2vFMg=;
        b=g1sn1VOLh+c9hYnsCjEFFSjVAqyZchcm8aKSWtR0D74i47RQzv7Y0E9Vy6vGuH/bzE
         BBMkRziLYE40kmYkkh6CYQd12mlglG06GOD6yV3uqgjvNd3xVhCVyBzL6NWHFCWcsY8D
         RuXobc2vRqvsUXB1oNz0xevdAx5VugZ7mP3S/8/0XGQup5w82dUz0z16G2gRR/aE+Hgl
         V3+h/IwTdWo70Ph4fftDttnLoXGGx5DESCBz4xagzPjgCSiNcu2uG+BC3cs0geQcoHiz
         NwGmv8HEEdV+Nfln+UchE1kDLmo1WtuekpTp0/cjFU91BNWPcwFMmEi1TeuHOBwfqPzR
         GK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779871830; x=1780476630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLhH+O1MwJnv+XspZX5gRQeh6CPwGkODbhZWHr2vFMg=;
        b=c840uiVzL4PG62Doi+0uXBCCfOD8EiY4TULe2eavNG+nfkJMVfhPm3TUqXO4WdkkLA
         ovXJZZ8SgXXuL8Mef/4Sv4NZ5k4az9fkp9oZ3VbgJhbiI9l1yTCdomzlX7vRdw0uVACn
         ktFc2p+/CznUoqp+0es9RkCQiuhvXXSuETU14ZDVj96UwnGZyO1+ouqYQtalQYJQQflA
         e2lBkWB6ZIJrAxzU95F/lPBDtcvUTEDGCTxd7aXKpGu5bYDQONMpkC2yqhG2iXRdkuPP
         j6PUPuKSQWdA+sCyVx0Qs5P64jfFbGYS+n9HlvYT6BZpboPmuW57+HZ7L3Ox1Ja1t/5p
         j/uw==
X-Gm-Message-State: AOJu0YxNWnepX6VJEj6UUA/yFENuvu5wFkOHT/dIvFMsDtPwv1bY/GIJ
	YcnKD+fjaPM5kBijFB2uLVV3mKCp5ztmrI/Y2R1oDlgABjZAfb4qDsNq
X-Gm-Gg: Acq92OGnKLwSx/SUm6/4m3riId7G1QN3a3o7C7rYgZwEG6dJ2EYYO8b4nd/reNeyeIY
	XCVFA+SuySq9f30ltdUaGf2bQEBRUou451/Z+LF4kvROiG3lexb8GNx8f2Ukj5MdiknzykYOMmD
	AlY5PMO0In5WJLWQofZx8doWQ1hI2jbIm19QFuekSlVM4oNifDrxlHerqJ6+XDZq8WpDuzw+7FA
	1p2IS7KBTv4jhcX6+rIRo4VkEl24xgnMareBrUGQT6q0PGlulGJdul2dyNlW6vXFJAtVTWyvtlK
	GObjYu082pj3g8E9NgNKMshsKv76epU3nuJAtGMXkZinxLr+UakL8N0dVpai4kDdGN3TCV2ep/R
	jn/31YgSwAtB2DrOHbgusgT8itIw9h0D7h2VQw1/IIE3oPMvUFNl8nMuQRWJHLBjKk8wnzCcgVN
	/a0d+plC85RDxKbYFKZyIUcksRVBl8iGU=
X-Received: by 2002:a05:6000:400c:b0:45e:64b3:af44 with SMTP id ffacd0b85a97d-45eb38afcf8mr37447526f8f.36.1779871829913;
        Wed, 27 May 2026 01:50:29 -0700 (PDT)
Received: from reskoldo73 ([90.160.73.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb558f52sm4663347f8f.14.2026.05.27.01.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:50:29 -0700 (PDT)
From: Luis de Carlos <reskoldo73@gmail.com>
To: teackot@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis de Carlos <reskoldo73@gmail.com>
Subject: [PATCH] platform/x86: msi-ec.c: Add support for MSI Pulse GL66 12UEK (12th Gen)
Date: Wed, 27 May 2026 10:49:05 +0200
Message-ID: <20260527084905.17964-1-reskoldo73@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Luis de Carlos <reskoldo73@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f19504dbf164..1ce7963a207e 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -823,6 +823,7 @@ static struct msi_ec_conf CONF9 __initdata = {
 
 static const char * const ALLOWED_FW_10[] __initconst = {
 	"1582EMS1.107", // GF66 11UC
+	"1583EMS1.109", // Pulse GL66 12UEK 
 	NULL
 };
 
-- 
2.54.0

