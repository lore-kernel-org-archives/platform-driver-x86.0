Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE5437463
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953101; cv=none; b=QQ5BzW9EnctFK+LplYcagkozsEKAmzhGNGcBh9jqoFy3qtMjYPIjv6S3GQ6efSLm4s6TFrozDjdMULlD5dWMoj47JWMwRrJbP3p9lCaWTMp511qbQmKrxh8Ae2P1yET9kUO/VgByNqo0Eyby26miQo0ICjmzZb8CCN2IepR7ZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953101; c=relaxed/simple;
	bh=6FHB2KVdyCs7Ev/ACZ4h/nmqM0qYfR9aN11iuDUGpiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZyskR0JgjyexOvPkG0n6Sx3Tfu3J4vzB9OLuAY6kkh2Fi2W/lG9q//tdmAy1x1SSYOILFPsPApcfrr2HLMeURuG8fokmR0RJDdg6AQlFxtCcrhm0dZpxsx0EcXoO6rEiQy4uKJhHEwaQzUloAeOQzSmRRt9pwjbyGBNIJZ/ElJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUChr1s3; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUChr1s3"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92ed19f4d60so185813085a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783953099; x=1784557899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIvOAqP0mpaS0VshVHzhofdgPrfSaI1TpwUsXOmOKMg=;
        b=LUChr1s3kT54lHQQ8GH+n8GgrCcOkdcBcBB7i6ShAB8qkWPwN76Gw1b7oEDvQsQfgp
         FNUrqqZ2QwmAWhHe4SIoxVjWDmXYoR6dt0oRjbSY0yJ4D/y7+Q13TTsTzv8jTRpYld48
         TjM+5gvUGhdQVOtjIe/SnpA0s8UcVPqshKFEk1eIWNmrc2BGxMlAR1VIviWtV2uZfLb2
         rkHTFujbKMPo56ZbVxoXjG+sthjcNxxrjzvbPc3v+9ptcLQoIE+8IaB4LNOWr0490GjC
         lHDOv6xk5jCzMH20qmpQAiavVMLwQ5v5KKsxNF7uxdYpLmm5A/ATt6xiGUBo3ZQuqb+0
         Dqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783953099; x=1784557899;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GIvOAqP0mpaS0VshVHzhofdgPrfSaI1TpwUsXOmOKMg=;
        b=qfGexCfroi5ZwjtuenWGop1XQ4zaFP2wQH688v13iOuam7C1gIcVOFHu7uNdRITt63
         ZcprtvwoCv6ZzZapBS5IlOR40spQw75s/vZutD+sHADRiWBdG9Eyz/SuV81wAvFJzC32
         QvNWH/0InJukY1eWH1ZWK2d27MBuro7ntaV8ivz18bHs8nXz4RgPxU3sGWM/IYcfNL/u
         /LKMwO8m73YOXJmo46ujoxmmjEfxnkX3PV6F8g2doxJH7gDpZuDKKnz9538jPXqT4JBN
         UaIQZXNA/wmwv6EeZq0R6vFHO/rbRiRyBLdQPI0fmZglU3OfVvCPdPRB7rlWKtxCYSsY
         y2kw==
X-Gm-Message-State: AOJu0YxTHcXTa5o2xrq5Dsk2YLXnHkFa00yYbElUK7c/ThbBIyj6XwTt
	a+KkpLm0mpCS3QrclYcszlkuVxqSoyzloIXA6cLY4gw2lGUzhZ8XDkW/2TzKzvZH
X-Gm-Gg: AfdE7cnPZWdpX2HNJxAq1ybAmNNEPgd866fsi0PI544f7ZhPJkOFogz+5d8s+edRtNy
	xcH9+RrbSE2i+35znikrb4vThJdoiYuwdDDcl87zzLh0ha8Ds3htjf6HUqZaq48zZyfmWKvHDfz
	EjgVBa0NqwALeb03u7iCqIwg2ElK2EW7FolOTqK1FnmFF1Dx+KWdSLkZbjWCxfxQ/NL/SOzozs6
	APrXWVJTpbAcDDvXuZ2bx2DmB8Njl/PyFlKe72do+obAKWu8AjPNhzPctH+tk1328JA27Zc/Nor
	g68mOgpdILbWeBgs14Dy/Mc++cv5mo6z5yZry1/WIvvNLKLQCbR97AV12DKT8/LOCaQxte+WKt5
	sgo1DixyZOfcpnKJcJp6Fg1o6gcIJoryUxlaXBA10JrgHh7/GwxLKk2SavFBLDqNRhoKSTX/N9Y
	M6tHIgRqURx0vkhheNnZbTBEyrWn13UpY+vao1yYZD2Gq0A9t9seZmA4PE+Q==
X-Received: by 2002:a05:620a:1791:b0:92e:d7c1:b1e1 with SMTP id af79cd13be357-92ef3ed5571mr781093585a.28.1783953098625;
        Mon, 13 Jul 2026 07:31:38 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm1085295885a.42.2026.07.13.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:31:38 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	johannes.goede@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v12 0/2] Lenovo Yoga Book 9 keyboard dock detection
Date: Mon, 13 Jul 2026 10:31:30 -0400
Message-ID: <20260713143132.381808-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v12 (addressing Ilpo Järvinen's v11 review of patch 2/2):

  - Add #include <linux/sysfs.h> (for sysfs_emit)
  - Add #include <linux/types.h> (for __le32 and __packed)

Changes in v11 (addressing Armin Wolf's v10 review of patch 2/2):

  - ABI doc: correct Date to "June 2027" and KernelVersion to "7.3";
    these fields should reflect when the ABI lands in the kernel, not
    the submission date.

Patch 1/2 (lenovo-ymc) is unchanged from v10.

Changes in v10 (addressing Armin Wolf's v9 review of patch 2/2):

  - Update ABI doc: Date: June 2026, KernelVersion: 6.16
  - Add #include <linux/compiler_attributes.h> and <linux/types.h>
  - yb9_kbdock_query(): change return to pointer-out u32 *bkbd to avoid
    a 0xFFFFFFFF status value being misread as -EPERM
  - struct yb9_kbdock_data: add spinlock_t lock
  - yb9_kbdock_report(): hold lock across input_report_switch + input_sync
  - yb9_kbdock_sync(): return int, propagate query error to callers
  - yb9_kbdock_resume(), yb9_kbdock_block_probe(): propagate sync error
  - struct wmi_buffer out: remove zero-initializer (not needed)
  - yb9_kbdock_notify_new(): drop manual length check; use
    .min_event_size = sizeof(__le32) in struct wmi_driver instead

Patch 1/2 (lenovo-ymc) is unchanged from v9.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock |  19 ++
 MAINTAINERS                                               |   7 +
 drivers/platform/x86/lenovo/Kconfig                       |  14 +
 drivers/platform/x86/lenovo/Makefile                      |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c                  | 322 ++++++++++++
 drivers/platform/x86/lenovo/ymc.c                         |  19 ++
 6 files changed, 382 insertions(+)

2.47.0
