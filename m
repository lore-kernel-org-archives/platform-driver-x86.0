Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF71C2324
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155060; cv=none; b=GFKkC7swnx2fCbs7CJUcSntLVoilI9xETukG+TTmajh8X6o/ZY7bsYyF7dFDa9Mjq+cwi+fHfcNP6Kh7hLKmF1x0cf9gj5ZNGAU/b083jCPKauTEiul9+xJgOvgH5oJD2bcVXB7rUQ0EUsNYybjcRXN78Xn4IuQEYTaE4mLi8gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155060; c=relaxed/simple;
	bh=QL2Q6znCXijD6enFZDJMIOaOf8peNpHGtLos9K3RVxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/WFMHS670CnwfKfeFUzCAUzmsNDUi9ijfuyGPHafcIZOfLev9td1OC3y2blPDVubf6GIEsqcCioimgCipCRnLJvJNUhF/ALyR4Z64uMUKWbeBBpHIkMNiRuOK4i9GC49JKP7JyT2Ctfx41OZJ0/e85ZiGjn0EhaFV3Ob6OvK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTYXnud4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTYXnud4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso31461095e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782155057; x=1782759857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIdFp1y6C9M5AK+aZgErDVJD9llkNcU+k6yHQJt/n8Y=;
        b=NTYXnud4njNgaATKB/8md33afcqyMtyRPxcRCpEcSn1rpLYuPy5c+H4lL2ZNRBPNwb
         Xdu1AIYIBJpAVsyTOwtRhG79vI9mvP5nSbEGsJWRqsLAnYXowvPosYnQzpUAQbAbxvSd
         exTqzbM7uZ8T+cjz12llkBIZxLADC6eEHxR8D2PbjRuFI2zSV0+Te2b3CzOxOynPhKm7
         aGCzFU/RSwO7anvh2jEQsRtj3Cs4K7cforQ8VDn2bCZu7Vt6851Y53O4wpCvAg59eJdF
         ssPEa31WNDb1a0Qx2/2i1qybWObflXdhRX3FrQ56ZTqvvjIG/xnAfzm3Lm6otdHSCHWo
         /1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782155057; x=1782759857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MIdFp1y6C9M5AK+aZgErDVJD9llkNcU+k6yHQJt/n8Y=;
        b=ejE+Keea3xGH4/UgpiIWhHeHtVu4Oun3Yo31G2uIy2zyTXSkSG02VFH8EJcY/zXvQB
         8po20wZJhl6yxsEu0Qc1Z+HZG5LNMiS5pQq9ToubOnqYusTNHY3BFU4oOLZqn2fkLQKW
         PF8AUyKrsMuNDUekYeo7izy/vf0hvJ+vn3hk+L0spU0U3cCWT+IHVKtubBOFLGR0YT8j
         S4QN3WQ4sRirx81I2RRfey3jEi1VtU65bRSFXYay49P4+YMxkig03xS165ZYAmMVtupd
         6r0aHWhPM+z4MH6OvzdkrwHKUFF+CSFZVPGstZwrWd8YpcauDheYTIrRD62xaD0FAcHI
         Pavg==
X-Gm-Message-State: AOJu0Yzk9a29JgcUhcLJloGIgteUlEGcjvRBAm5PPb2BV0eXE3YPr4VB
	O+DKj5ow4yebl9hvTReILSUXFOiG81NL7Ti43tWq+SpKDQqB/YbZGkdR
X-Gm-Gg: AfdE7ckHj3ML49jy7d18vdSyHt/rcOrqZhoLcr6pBY+KozpqNRdYZnoS+mo13JOswXP
	U8Mrc+D23SsGajhdsqjCooVNXW/O0zazectlWpBATNDre/hj8ayaVM5uUBZLBg4ZiIXfeX1VAmM
	iuYOC5xtf3DcZULnUQIUtCzALjPknJUUoumRJK8lq0UGSJaDa2+DJjjCTtMgWim8XS+kk9HDJXN
	7lMN8D2P7SudLTS4hkzTnQ4G2o5+/eIHtMaxblcalAx+f73VSbt3hzynd55gPY79y2j/qEFzpNS
	P2dib25rfDalrWfp9Kea6vLZaHXiSPDwblJMB8aaeX+sB5JjwD4l8/Og1hpexbBFwNsXUH186VO
	qBhsuiXx+IUfi73/1lz0y+ctYkoUSK3HT7tWkUH5gLvhbEcooTg/BzN1KovalKmK/VURxcOdWA6
	UvA7AL6iYdYGY=
X-Received: by 2002:a05:600c:6211:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-492490af44amr172136995e9.27.1782155057246;
        Mon, 22 Jun 2026 12:04:17 -0700 (PDT)
Received: from user ([104.28.162.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466667881bfsm30154422f8f.22.2026.06.22.12.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 12:04:16 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v2] wmi/core: fix use-after-free in wmi_add_device()
Date: Mon, 22 Jun 2026 22:04:09 +0300
Message-ID: <20260622190409.17268-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8b505aea-2c76-4868-b30c-be34ce0eb761@gmx.de>
References: <8b505aea-2c76-4868-b30c-be34ce0eb761@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Hi Armin,

You are correct about kzalloc_obj overriding wblock and
I apologize, However there is a different use-after-free
specifically in wmi_add_device() function, where if device_add()
fails, the function forwards the return code, then the caller
function parse_wdg() frees wblock from memory, but doesnt remove
wblock from pdev's list, thus if pdev calls wblock for any reason
like suspendension or similar activities, it will call freed memory,
hence the use-after-free.

I propose to fix this by adding device_link_del() function
if device_add() function fails, remove wblock from pdev's
list, thus avoiding a possible use-after-free.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/wmi/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 5a2ffcbab6af..8c9b7ac2e5d8 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1261,6 +1261,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
 static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
 {
 	struct device_link *link;
+	int ret;
 
 	/*
 	 * Many aggregate WMI drivers do not use -EPROBE_DEFER when they
@@ -1275,7 +1276,11 @@ static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
 	if (!link)
 		return -EINVAL;
 
-	return device_add(&wdev->dev);
+	ret = device_add(&wdev->dev);
+	
+	if (ret)
+		device_link_del(link);
+	return ret;
 }
 
@@ -1418,7 +1424,7 @@ static int wmi_notify_device(struct device *dev, void *data)
 		return 0;
 
 	/* The ACPI WMI specification says that _WED should be
-	 * evaluated every time an notification is received, even
+	 * evaluated every time a notification is received, even
 	 * if no consumers are present.
 	 *
 	 * Some firmware implementations actually depend on this
-- 
2.54.0

