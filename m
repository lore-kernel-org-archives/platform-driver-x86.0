Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD791BC9E2;
	Thu, 19 Dec 2024 23:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734650453; cv=none; b=TPv1CZzJ+LnDz45ay/qYB5gr2+iYoC2GtnkSmqVI6XGZsa1SoMzB4x9bZ/ZOo0O5+VsS1qYU5xmUdDQ0e8jW9jc+rIFl/YSBBZk3fojdmcjHmToyEMu6yCA69wxokv99RVdb8BjOerodqzwjjG41EMxHKFUvrWxzgTBvqaHKD9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734650453; c=relaxed/simple;
	bh=PyAv8DfuTTRxWly3wwtgaeWFbM6URK4ZQI9Kpqky42c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDAoFNrC9k7fCXCres7yOTnJLKs0ZVpX47qzwVefr1iZVi7bwVqlaROE3vCiLyHEei16RiPuEPepmiwQmE4pjr5hXHgbUg+yA2YMiXFi+9SLRiJjEfz2knw6cp/UIXdnzUYkDB1ouXVrZtuD+mb08U5OsTytUtvNO+gVRCrq+xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiELhGy2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiELhGy2"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e384e3481so1143436e87.2;
        Thu, 19 Dec 2024 15:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734650449; x=1735255249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGNaK0SKBtxWvolKgkKBNrXPweprdag50UbzPfvkQzc=;
        b=eiELhGy2izAqtvz4iHpprWYoTRZat6/MkVCm1XNlDmFbw9Xhlw9llkX/PtRBu8ynea
         TipprFQ9MJP3sBteGSaarq/Y0G3lc8xNXCj6BSNKXl/qcLOMsgxSYwSeZtl/8roFe3/E
         P8A9Op1Ij4sztQieh76rxoANJ/bW4K3PQKaXDnPzQ2I7/P4vhJNsV3mFWcLMX/qoiQeU
         GnZdViuUGsMt5sSTFWZ4T1VOEVGarT/YHvE800dM2mCisSct8ZxeaIv/olMBjDwwBmd0
         FJcfnmYxJe6wmjrdzIvnDjzy/IsgBuDfocSzA7y/4I2WOY5Loe/OHlFCuQ0IXWAIfO3U
         9aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734650449; x=1735255249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGNaK0SKBtxWvolKgkKBNrXPweprdag50UbzPfvkQzc=;
        b=uFm+UfLcwZOlW/YG2nIX51Z/79hlcCF/+y0yaAxgryx0/v12Swla4xR40TXagiVOrD
         BU7I6s3UIiyfm1Lxk1fZHtpk15xtJeA+4S3Fg1WBdXLcbHZQv0QnAqi5hgdQPeZQkiX5
         gMKjmh4L00CqRLJab3p3cNEmycWN8uH/8PQuA4rxC0OXx5sPvnzW14Q9nq3E+bOMlNpV
         99pOwkaXzOP/UBrS0Fpphya5c88ImVtgbp5yJSwiS8nV1/A+My+hB1aN/CeDy60wk6o/
         6AurjwUi6fFP+SnT26Bytf3/hedIULBjRLiwb20jZj8qW0mGWp/EGdnqmAmd9DKQYIUp
         vFJg==
X-Forwarded-Encrypted: i=1; AJvYcCU/VzC2dE+i/M/msU+cPe5+StBKZ4M/9psVJ8EbQxRzl3cCJpeHAtnnVn8dOstXhEMbRvWOb4WcNo8251PcDHXj0a076g==@vger.kernel.org, AJvYcCWH1Jix4CSLIsB7FVvW70Q9P0jvdz7KCDvMMC/q51kn9QH43QYG3E03hXA/Aj/HeDSOURr/Z5dRM9VA26I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzElG/f8H7GI9j94D6RZANqPxPNHQmLhj3IIDS/nUNVhrgC0TIw
	U8d55WnU5zwRADNYDaEdwOxxxLEcE8tElcknd088iCqxMjXybU3I
X-Gm-Gg: ASbGncsdZbIgc/1rJEzS0dPZwgHDHHdOKoxMHNAIOmZWGhNeeG8sngOenjJeUSv4iNy
	zSS4MKdAiKwxfI8R3qhyLhaGDNikDEE7lonSqlIlMOQIRCWBLXU5EgMZInJVD7t4XCIDJIsnd+W
	ZgEU9ELZZhKgm5njtlVHE4vs6NLgTQuiScYtwQsMiYTOyC84OF39+9kLnH0NmZUURHd6PZ/B8GZ
	23+sLd2hkfvr35rrYOYKJGEeOEomh6nCsVUNWviua7bUrEBPWjMFi8WPvexfWVNifleb/6+8iph
	aG+HoA==
X-Google-Smtp-Source: AGHT+IGO09JSKhQ5zt0DCXHuoQZ294XE/49OW870wNkyjwTRJfz/3m+B4aM+prrQBAgC6nKrSodzlg==
X-Received: by 2002:a05:6512:6d3:b0:540:3561:8897 with SMTP id 2adb3069b0e04-542295619e1mr102153e87.39.1734650449219;
        Thu, 19 Dec 2024 15:20:49 -0800 (PST)
Received: from localhost.localdomain ([81.195.143.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832bc5sm307783e87.257.2024.12.19.15.20.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Dec 2024 15:20:47 -0800 (PST)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
Date: Fri, 20 Dec 2024 02:20:45 +0300
Message-ID: <20241219232045.51792-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pmc_core_ltr_show(), promote 'val' to 'u64' to avoid possible integer
overflow. Values (10 bit) are multiplied by the scale, the result of
expression is in a range from 1 to 34,326,183,936 which is bigger then
UINT32_MAX. Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
---
 drivers/platform/x86/intel/pmc/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 3e7f99ac8c94..f06ba9636b03 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -660,12 +660,12 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 			if (FIELD_GET(LTR_REQ_NONSNOOP, ltr_raw_data)) {
 				scale = FIELD_GET(LTR_DECODED_SCALE, nonsnoop_ltr);
 				val = FIELD_GET(LTR_DECODED_VAL, nonsnoop_ltr);
-				decoded_non_snoop_ltr = val * convert_ltr_scale(scale);
+				decoded_non_snoop_ltr = (u64)val * convert_ltr_scale(scale);
 			}
 			if (FIELD_GET(LTR_REQ_SNOOP, ltr_raw_data)) {
 				scale = FIELD_GET(LTR_DECODED_SCALE, snoop_ltr);
 				val = FIELD_GET(LTR_DECODED_VAL, snoop_ltr);
-				decoded_snoop_ltr = val * convert_ltr_scale(scale);
+				decoded_snoop_ltr = (u64)val * convert_ltr_scale(scale);
 			}
 
 			seq_printf(s, "%d\tPMC%d:%-32s\tLTR: RAW: 0x%-16x\tNon-Snoop(ns): %-16llu\tSnoop(ns): %-16llu\tLTR_IGNORE: %d\n",
-- 
2.47.1

