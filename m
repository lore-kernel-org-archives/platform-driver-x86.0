Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D0261579
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Apr 2025 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096801; cv=none; b=SSa89mf7JUrE/Fe150URlKVsPfUK/X40tYpsnmLinxcs/mmvC6uPBeOr8G9/3ddDm33ED4b/IaRL9IPOQM1ZdRh+rrmYI6B/89bBXjOVIBN0rjqqXfrCAqkUKpnRmqDpxYwbvAk4jlzwOPua3ju5UWKJLYKdSl54z3ClAmqn0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096801; c=relaxed/simple;
	bh=v3f75qWk5UlBrcSxxHaEwlLhjR5ljzWaxIyurbTbotE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=djLNJs4u3I3Y5m6tVzBbjf1VA+3pt2pO4qa6pgLC3GKVuxciVpIvp3d+D6U80uXv4RPUxGlLfPBBM4lNqwV4P4V+I8+YPYhHQhqY2y3aivBl5DkOLEdx+MCepSpCPpLZG48ePbDvF0NtaWKQBj6MUrYGp4CtS5EtRUKMZ/tcel0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fNEuXXIx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fNEuXXIx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3217297f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Apr 2025 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096798; x=1744701598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7xbBtk4eC6fJYqAEYcPFUg2SaKE0i4AT0w2WPtrU1U=;
        b=fNEuXXIxmtgV+Ym0dn3ZWl2bqMwskR2yO+q2OAYOXt628nLOXjqheAtRuH9Q+aqp83
         yp1og/dXsGEUJxPh5nAjXm8hARGVm2z2zU5KXof8dX5BajB5S5f1i5FqcOqSxsJD8E52
         Oa4qbbCWd7TP46t4XeYa6jQEuESvPsOHAwYZ3+RsCOgJDQ0AbfM6a4fg/n9NnkQ62CtB
         GRlti7Pp12OHp2XVnCfHcW8hT6FbX3QtnVX0rNPRhxzUlKqFNK+wi/b4UbtwMFm1TWSE
         4kRvy3z67tI+QBYAZTNrmpulDoIfNcaF8SKFJJR93v43dxjzRKQrMFcSMcs9/4qZd4JL
         WUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096798; x=1744701598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7xbBtk4eC6fJYqAEYcPFUg2SaKE0i4AT0w2WPtrU1U=;
        b=lB75UgGJ0d8rn8Hkl3HtX7FFXixyQ8oq4iGuqmGRsdzefNUPRqlXIlHn29XZEpvsrQ
         xPBD6a2uizEUWHwgHUUO1VfVwCOZhiNsOz6ltOdqlGiRYjtsRj5nk3AEiioGyZX+lGuN
         pTgffg2L/ySSzPelr8QSBC8xIVQcOvX/8YOage/iHbEm+Z7D/lMx65AabCL/E3oyC6qW
         /EBrgly1vMCVgLtVZmfkm1omEGZPHT4mdxprP7Xv/tJSVIO1QxFxNzYCOfrG2W6KtbTI
         zQ4p4DUwwtN2Efs2nBwHBiz/FXPM80EAnfJr5OusS8UDPR90h8gHYvbkSyefownCLZlv
         zqqg==
X-Gm-Message-State: AOJu0Yyx0OSlEWHgFLEwVNsHqKg/gKFOjsP7MQ2BV0v/l7Y2Wg4TqoR4
	JcOB67gKR3e6MlYwNEmozIGJhmAh/bnngxCSPcdMNPmZRF46c5pc0lU5uuAH/F4=
X-Gm-Gg: ASbGncuCuGd1TZVyXWYseEogQ0ofl57V4qQISN/MChXrl/QImM9zoxfk47BWWFNZpQ5
	JlomexEZ8dpp+elWOT6Z/aU7/yYGCXlWOQRB/lVqDUZoTpY3GYm95NhlgB+55QI8RJOw69A/Y8q
	0LT1Sj45qyQ0vKSnLICI4a3poEtHcSTFn8g3CcZKunpjN2fAZTUCZtGqqMtH9MfAXTkgo/wSWNy
	eRf3MBSA55ljCmK3BLqNtrm/pANcJim4+9v4ifJKmRUtiEeS6ZEay3vOzU8+I3AkPs1Ka2V/Epc
	r5Ie0iyhr7c8+ef7O9vvLfk/LCv81cUbKPZOKQ==
X-Google-Smtp-Source: AGHT+IGMaGQ3FEHcV26y5/TeIOw4x15At8bWgEJ3u/wemW35qel1vSayovNdUa6Qrm0LxBKrb4hn2g==
X-Received: by 2002:a05:6000:2288:b0:39c:11c0:eb95 with SMTP id ffacd0b85a97d-39cb3595653mr12726016f8f.17.1744096798054;
        Tue, 08 Apr 2025 00:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6608sm13882872f8f.23.2025.04.08.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:19:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:19:54 +0200
Subject: [PATCH 2/3] platform/x86: int0002: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-platform-x86-v1-2-6f67e76a722c@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ca40BBLEcqmdb1vEhG5kN8vjSDgv85IwvijmxSpzX6s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M4bbIUEwJMcf2l8IfuRxNPaU/VQY/+uzcnav
 /IUUKIJIr2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOGwAKCRARpy6gFHHX
 ctg6D/9iXRGueeWhRok4PbRGqXtnn16SKVdS3udkt9Vv2lPh7+IKs+vXyhXQ9yensGBZIVI++TW
 nV7KYN2gVasndMxHedrKSlav5LvCe+6XYvR+C44JxDdVXgR4eNFyxyBSq0oVYtNryDOIK/aCKSd
 +lNoZkwQCzZjpAyVCwIM7uk8YcclteyzScOtAOMZn7MSXxDsHOpMDEuuewB05vUFSGibb3USlgz
 DPsaHK3KD1LL6UZ2G3E8GClROcT+EZySP7XhGSaAO4qTZByToPHhGprm8IriMQHPUyWbZf/nFhj
 JfkkRMrjMGl0Uxaz0XAsrRthsIAsdo/v4ixEjLWzRKz9n0zHqWSdL263Wg4ahr6jc5PeRhHz+SN
 Q8dGAaTmdpGOrZN8uZiwkHu6+wXfBWUJMQ32arHX+P9pJ/aEaPJJNjVTohTrbb99BV91K57h191
 /54kyatX4YUwahXaeISo2YOD820fGOO94rMMLhfAY+Ouun0ZHZKmB3NwAjJwDDeRtfj4ZjV2YdA
 5n+t14WM/GLZ4TVCgcxlLwum/nRLu/vhd1kYiDwlSQmyrFzHgz51MpAF3Cl+XkmtosX7P4LLcIK
 lPqjUmrGE7fYxy21TlaVuzUrnoMH75sKGLvkh19kCqi+AL5oWjmf4qzUIOAzAprCuchzW8cFkcM
 QbS1WMcoOodnEqA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/intel/int0002_vgpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 3b48cd7a4075..ab104fddee89 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -65,9 +65,10 @@ static int int0002_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return 0;
 }
 
-static void int0002_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
+static int int0002_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
+	return 0;
 }
 
 static int int0002_gpio_direction_output(struct gpio_chip *chip,
@@ -192,7 +193,7 @@ static int int0002_probe(struct platform_device *pdev)
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
 	chip->get = int0002_gpio_get;
-	chip->set = int0002_gpio_set;
+	chip->set_rv = int0002_gpio_set;
 	chip->direction_input = int0002_gpio_get;
 	chip->direction_output = int0002_gpio_direction_output;
 	chip->base = -1;

-- 
2.45.2

