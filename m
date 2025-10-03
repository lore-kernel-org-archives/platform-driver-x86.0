Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98427456
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Oct 2025 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517407; cv=none; b=qEexFyY/W6mFA2WnKGWleiuJDbr3ZIO7LaGhLFhOFUu4fVh3YGNlErg1XAGMcp4FUQy+2Wo9D9yHe5728TwWxZEwltSHZv/KtXOAPs39h6cIjJFZZ1yPsBcHwcEJl5bAANFbXWx5if4VST1UvS0iW5dnf3nasQLy17ZhVKPJhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517407; c=relaxed/simple;
	bh=ywiJuy3pmEwKeorAfmmSATa6Sd7OYA3LtfXbIpEBw5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DFkfH0zi6wU8+B/vT20xP8L2DrvjIqd1yw3RCxcKUZ4kv25d0tPOx+Xo/eKaf/dFoYD/JO+jQeRr4Fgj9qyF+/FWEgR1X8VhVFBsG5tsujoYDYrmbz4YkMGzFHgQje33n4WCCYllKpgtHrzTt4Qd21eaUnffD7siyS2O3sv+VQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4y9T1N6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4y9T1N6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e52279279so17378885e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Oct 2025 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517404; x=1760122204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8e2Y8kozAGCLrKRppo5kaXt5Ne+CwrCg0AGCxQGa4iU=;
        b=O4y9T1N6dRQHCUFirmuBEggbIPsa9IPx2IrEVIe4akFL4833Sti/IOif7fTUIp/SrV
         v1gxbKg1CzPNKA7TcwfGfJ5InS42lW84aVSVwlylzh9MnIvsgQBvx+1uXg+gum1slP3T
         zJv7XFJ8ewP8+e9ruspC2qNJtoE9RBj4v4Z5gASWuQiaQcjRr4vw6yd3bZXNxkdL5daC
         Vn4AOAzyY58OHPHfr78MB19ceP6acZdnlQhUUppY6LGDFx6/N5fwrfAezTNz1iSw8omV
         iqI0PEsoAzuMVbau8ziyhve9lPyfzJveeUMyFONLUzxY03dYTBH6ryphyNOfadRsAT88
         4s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517404; x=1760122204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e2Y8kozAGCLrKRppo5kaXt5Ne+CwrCg0AGCxQGa4iU=;
        b=Z3wtgDk9wmfAOFhQFPhkt2UQh4NWCi7WCvJ0bcPAjOMzRc4foX1uWgH9fWZnyO+piV
         3nYtWvp1DeHjgnk2HQZUxc7aubh2A90KYSrNzB2B0Fiz2VQ2Q4UlRTqMRcHfzV/wm6FB
         dSTECPPMjo5ODg4+Va8N9fsXkRaBfhQauFrdnB1s484Otzx7zcuJFZoDTfKTVcMNMJgM
         acGDa7iI4LHN4fOqTHWBKsDpjTRytN63hAWXygKWXgC/UG1A4aSgiGkNn/PHSdsFhJUG
         tKVljvgH2PYXidrEt4UgbPtVy7b8GH1GMYpfBz1xM/VVsXa4FWuxzesKn1Ck1N/5vp+x
         f7Qg==
X-Gm-Message-State: AOJu0Yyx2yUGDZi8QGI/ik48FoojgynN4u8C2l6Bqy2FRznp5B44tO+O
	aLRdjzj0GzsnBWYLsXAoCHZa2xfXS9l1S9b69R4jPYPSqL7YQN5kuN/dllPLiBCz
X-Gm-Gg: ASbGncvBSUcPsOwo0+PF+YtiVjqskuNDGMZMUiKf4TsaCNKwwiZOaMVTppyI2kQmeu2
	7pPVOIp4949UvzK1ceBrpFj8doxt/Q3xlt5XnAxicIL1KMEcckBOtKKe//kYx0ECVKIikYHbYsc
	v+UJuv7qYWuvdXiwut4nTFRU1kdXmQBHP4G4nEAftNIjqMf/zVWPKfuaxykqakVjxS8WuzkM0fj
	AmPCmExMtkfKnNVHm4SUEbxqT31+3SUIHLi4x+CVS/PuFMaNqZ7ArPz7aUX+X2WVcxRw6vfF17B
	5jnlP74fMASpY9S6ns8HBbcfVgBg+izuyXpJLqijR8ad37EsTDBHRsBLnBzqTQMaX2Pu/etriPZ
	1OCrZejtCm4WaRx3mIof/BFJo8R8TrlP6YCWbNT6jOP0hWxlSgwPXf0WzMySaVg==
X-Google-Smtp-Source: AGHT+IEgME5bYkEgfz/T2ZtHL3Pwl9xYIPrKdRMudCiAH8y7dfmZc8ndWPPFdPqrOP0ghZNalxyWiA==
X-Received: by 2002:a05:600c:37c3:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-46e76871edbmr11187935e9.2.1759517404373;
        Fri, 03 Oct 2025 11:50:04 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b577c87sm86877405e9.0.2025.10.03.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:50:04 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH] MAINTAINERS: add Denis Benato as maintainer for asus notebooks
Date: Fri,  3 Oct 2025 20:49:49 +0200
Message-ID: <20251003184949.1083030-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
DRIVERS" as suggested by Hans de Goede and Armin Wolf.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Link: https://lore.kernel.org/all/8128cd6b-50e3-464c-90c2-781f61c3963e@gmail.com
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 156fa8eefa69..81bcb934748d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3841,6 +3841,7 @@ F:	drivers/hwmon/asus-ec-sensors.c
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
+M:	Denis Benato <benato.denis96@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
-- 
2.51.0

