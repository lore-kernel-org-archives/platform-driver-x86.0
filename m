Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507B339853
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420444; cv=none; b=Y3LuB7nN2ECHzvXALgPxDb7edYne7I7ddt7U/7bwz5HNOIekee6Jp1InUlco0fFowrledSKj2W+CbV89ZFjFKFfIUlLtQVTKG+53gKXfYcJUrJ5xmr0aImj1+1/9ETXDPGPZsaKywpcrrXiDkxI/Q1NVHjbbQfuJr9IfIm6DYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420444; c=relaxed/simple;
	bh=JJ4OEJoTVA7usSNyBvksR+vRPVKv04k2B8kzU7yoLbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=caQNX2joScgfC/4umLva26XZEnYecGvg2RTraE0IBNGXyqto1PUCJVEgSjvJAT0l0GateqhQi5LJLMyv2WEJkOq35dst3IAlLszKJh4V7IIKmGu4QZzr73CTjhvND8Zs8ChTEgUONDWXlqoINbehGHvTxQgYib6MXEdcQ8aW83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEnt97Q6; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEnt97Q6"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-836c5b01e82so30526497b3.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787420442; x=1788025242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0QRqjqyP80D4SfeJZYeqsHW+gESwdL5qEj9PkLZ6bb4=;
        b=kEnt97Q6oolqFF1i1jC81LigHWEh7b+0DZ4bsLFauzSA5nRnSAnywbHqldTvpmOqp8
         WcBMaKsT4+zPVjNctayY5dixoow3htMUj4ciNAcNcb7dUc9/11mnj26+KPavKAI1Fild
         VaNDrH/4u/xu3uWJ9aKGMJalW2d+6wIR4jOjgBIA6C9CGc2rAwEGvLYTy1qhXn9zNDcn
         fRAzltajl7dRxG0nE+ZgS+IUlugLZIPncdh/fzk+NAQa5/mr3mLeuNhqilGIHOwXI7yM
         SiMaRimhdZx6ZvTKGZ8AKI3ebyblK/DkncGmqx/T2hM4mfRVMeMHZaYRNP3d+DdDBImp
         Cpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787420442; x=1788025242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QRqjqyP80D4SfeJZYeqsHW+gESwdL5qEj9PkLZ6bb4=;
        b=W6Y//sMalzcoHan8fSxVUsLj9d5drkRjLltEcoJn6dR1No4kgfX0G4WUTFzOIuyeES
         R6VBqnOI+ZcC9opWoRw7jx51I/BE4llzM9IRt6L2devbnmBWikSLuusMW1VNcNgnGyW9
         9984zsRn9tADAos3G2YAFZFEwnKbsiJL47bjthwd7f0baJbGcu3QMbdNw7VJ8rIoZtAb
         Tuj8OoLJAln0jAABR27nqiaiX/io/O2M9vMNE6xQrYFkLzooVdbmzJL3hyFuCC0jZ7ZN
         tFSEurYQaL4qAz8+XXfbkYL68NU50hkSv7NwIpIOx+RGVVICwqs6yOAfe+UDi69XVflq
         vMUg==
X-Gm-Message-State: AFuF++mwig7A45g7B0uljeHS4IujTUzsVX7hrHc3iu5Vt1vdLuAr5b9v
	YMmuRejYnJrnbvixP8WDUEywUdy+axjZOYWAvvOeuirCmmspIhnoceM=
X-Gm-Gg: AR+sD11D7I+EH/lA2ZzETxupmC+AG8I/qSqJseLjm07FaC1uLupT13MWdE5w87aWiTZ
	ywZeB6KU3tSI//vMMlT9UCyAy5pMGVi36+NU+BIBi6KmE19m2Z6pzYHbaFo9UkLjN0XC1Zp0rZF
	LCrQOVOfqRiIIcpXCBNI0USSakYrDZgxN5YsjFb4e/RAajH4GDYKNuYdikPKQuG9XEa1pGAzvk+
	XSMVy+ZMkDjP60qrKH37qPxHbQnm5mfRIRRzWONvJh5eYCFJah/C/ryDJSU5u8LfSo0TxbMu1V+
	Z4PxpPfEFNmNaVOQHPM/Eg6IwMfBo6XxQDRAx9vOtAjzgNc7YBQYtaj87azNL24foQcBaZsPbZE
	plbUFFXoOXYRWfpWbEvxcS6dgqUZKc6IMqa3chl2JyoTn6tQAMNHMfHogDtSP+X8HqIyYM6t2p5
	IvUzHZo8gjjs++33BcEmzQ8VjiIEu32dVYCMPpvHGgFQ0URYRQxkwQjQ==
X-Received: by 2002:a05:690c:c8c:b0:81e:9f17:8050 with SMTP id 00721157ae682-849f56333d3mr63896017b3.21.1787420442136;
        Sat, 22 Aug 2026 10:40:42 -0700 (PDT)
Received: from 3511.tail24ee18.ts.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5c2c861sm12816727b3.12.2026.08.22.10.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 10:40:41 -0700 (PDT)
From: svav2021@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH v3 1/2] platform/x86: intel: wmi: Use sysfs_emit in sbl-fw-update
Date: Sat, 22 Aug 2026 12:40:15 -0500
Message-ID: <20260822174038.619473-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arav Verma <svav2021@gmail.com>

Modernize firmware_update_request_show by replacing legacy
sprintf() call with sysfs_emit. When altering string,
corrected format specified from %d to %u to match u32 type of
target variable.
---
v3: Resending as v3 due to git send-email formatting error, no code changes have been made.

 drivers/platform/x86/intel/wmi/sbl-fw-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
index 62c9c7f1842ba..cfef71f4f3284 100644
--- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -61,7 +61,7 @@ static ssize_t firmware_update_request_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t firmware_update_request_store(struct device *dev,
-- 
2.47.3

