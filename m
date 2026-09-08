Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE2501F36
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859154; cv=none; b=TJuZdwL0zjF21FcYnz5wRIGGd6wo2PiXrk4t/i1mIOs+fq2nC8EpuKFb+YuRnoXr85e76GFKCSOc2816rLjEnUkgmiHju1yneLdk1Oizz2YvhlO82zJmF7PGrfKq/Ju2MR1J9ArqZD/nJPNDER6/24YgnFF35FlIBPDu4f60qzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859154; c=relaxed/simple;
	bh=EOqJI9MZnPG9vnd83QLlsMYprwkB8rHcdGTbGbpYSwU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EYLMzbn53lcunmp7AIvVazHNDPWudwO2kRFCqxZCw+WhYlT3Dnif/5db0GuzVJIVa/062IHyHcySVgQ33g24fBW7V6x3nl/tp7z+z2dZPcYhb8YrSaGs4XWsmuR7ClDWZNiwG6IJAHbYQEAIsnmxAluNSAbOT0ebl7qaGZtNJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=IorLEUr7; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="IorLEUr7"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f4f824de5dso1711797a34.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788859150; x=1789463950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QXUyU65N52Uw459Zinbm+Pr5Fsq2Tqkqfad8gCtB99s=;
        b=IorLEUr7hqiHK10DjAqMwPHHz9sq+PDUAu2wjNgwozKkmha4Ywc76IZOGWlu2MHlhk
         XQw10zTfumCikRg+hwPlwV1FNTgpGvr3YMT4QgL1RRcvzqoQRglJpGOLSIPLOgGJmaDl
         O+Kl6+Sn/95/txLEWbrQWw1cyEJ1A7gQ1m0ijsf3/TyBZ8zykpCNJGFDRuk6Dkwuv5x7
         oxubn4gK+Fbs1+j+bOiTLfawlXYNQrZpcvF+dF4fdIY8dGq5Rj/qCRTtsy/FX9qJwv2N
         IZVxixcVmCI9IySBSfhPFeezqraolthq/OMnIC05dM1/pHIkSXV19KoZInwm9tVvH2GB
         WZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859150; x=1789463950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QXUyU65N52Uw459Zinbm+Pr5Fsq2Tqkqfad8gCtB99s=;
        b=SV7iNaE2wnJ1/tA2b0b8HfarCg+Ub/0pT9IS3tLjZoaCdUb5ZZfZhQxQ9mdVfovEjj
         Pv/qlQ9ZAVHFLprxIkuPfFxWAURVFWS1yvsqEaVZ3wIqXzv9M/2b7n545toM6oTY20eV
         KLEBVcME7gd10zX2jnjdl16WLTbO2EWPPuQioK5q82kKjfu7zTpr83xIzVsKyqNWRSiU
         OsC49gCBSTGYuafMKiCS99lfPUBPv2mcFR2m7DZb0f7Q+FCYXtyyA0Dthr6Y8el28Hhc
         /5YWN0YIQBYg0raaainzFx3/URsY2pInYedqZ/0PJGkF/PanZg8LylDcEzjVVCp4V/96
         UTcw==
X-Forwarded-Encrypted: i=1; AKwUvBy/Kovy7Zqvglpz6ZJw+o7g1UT72qw0AIDQLqc2RPSmWsEdRzgTPEZKReNHn8WD0grEARKOYLckW3QeGGFnQXap/coG@vger.kernel.org
X-Gm-Message-State: AFuF++nVyP3J998WX7rvFsI2K231OYn/tv10mRgaqf3u9jBhcQM1q0sV
	NO/JHU0F06JAb4CmC73u+O8w4zSZ+8nKcVNA+ML5MY/xkUjugep2squrB3YQvCksN8iPV87Ibr8
	noTDaKTd0dg==
X-Gm-Gg: AYBFou2nBcJqHzo+W28xkUckxPRLtvLYYZpYQ0cgAEVXUCW06I0qP8cs3sSFklpjase
	OTlSDBEebpx/kPEl+o6h944Y5ZtRnmP3DjF6/3w0QlXMH425bpm70WThO8kzFZ3ZJzUrnXcgQLX
	AwMc4vA6Fuy7fGcfuODnA7YdZDNaNpig2t70eeYFfok56fVAiTXXPAy0V5THLHL+QlQePgKLwF+
	j1ha1lNfVOuJS86PA5c+2uklzms9TeRCvwy2QtDAzP3+HxzzVHUlUKhYwIUpubwo8jFoSee/UTh
	cVCNlYcNqktp7KuriRkaY7kzQUdfYq06MrPjSVnKSg2h/P8OTs61iucM62x+Dl5K0AuQsSmy5c5
	2JQP6H8lq94odfjJzeO7CvAWJBRMqrwQ+FZb/kDyNNUTiI5B0Y2L7i/DnlL2FhH52Q7wxq1k8sB
	0BV+zuM0Iv3JbkxTa48DksnspiTqnWIk4uuVZkwNYKplsqyU7tsl/kcGx9Xz04cllGFERY0miUA
	L1RGA==
X-Received: by 2002:a05:6820:179b:b0:6ae:9815:7c8e with SMTP id 006d021491bc7-6b6fd2cea24mr16150573eaf.21.1788859150240;
        Tue, 08 Sep 2026 02:19:10 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:75be:f01c:dde1:cb38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm32015722c88.14.2026.09.08.02.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:19:09 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/3] HID: use designated initializers for acpi_device_id
Date: Tue, 08 Sep 2026 10:19:02 +0100
Message-Id: <20260908-acpi-hid-v1-0-08df24c4b139@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbTn2oC/yXMyw5AMBCF4VeRWWsybnV5FbGomjIWSItIGu+uW
 H7Jf44HR5bJQRN5sHSy43UJSOII9KSWkQQPwZBiKrHGSii9sZh4EHmGhVZlaVBJCPlmyfD1XbX
 db3f0M+n93cN9P/sQ4iRsAAAA
X-Change-ID: 20260908-acpi-hid-4305ca77f0a6
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788859148; l=2194;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=EOqJI9MZnPG9vnd83QLlsMYprwkB8rHcdGTbGbpYSwU=;
 b=xj3U/HxJDcFZwrdg12xIzZPS/28bBExBN6geCDSnsaMPjJfcsJaUG0gmBLrn+8euCSV+s2dTj
 +oLb98Ep6ZBAV7AkYxO66fhkcEGKypgzqQqkzLdqMpvk5bgZjWSkYu+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply here in the HID subsystem).

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc2.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (3):
      HID: hid-google-hammer: use named initializers for acpi_device_id
      HID: i2c-hid: use named initializers for acpi_device_id
      HID: surface-hid: use named initializers for acpi_device_id

 drivers/hid/hid-google-hammer.c       | 2 +-
 drivers/hid/i2c-hid/i2c-hid-acpi.c    | 8 ++++----
 drivers/hid/surface-hid/surface_kbd.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 28924df2a08f440c73991b83028032c901de2ae4
change-id: 20260908-acpi-hid-4305ca77f0a6

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

