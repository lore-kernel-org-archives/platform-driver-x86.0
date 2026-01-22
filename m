Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4F35B651
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097326; cv=none; b=AxvtC2N7Ut7Jf47zBjPostvNDRXZdshwLzxRHKcTwAL6PKHKGQqSb8PXhIg5KTA5l5GHlv34KFXBtCYO11w6Bw0iWNl3z/mS99V468yjp4qTh0lK54meYk0JPCPPXlItGhrQ/7ZxzcEJhkbO2jolJD1gfkeh9TBOT5QOVSAEyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097326; c=relaxed/simple;
	bh=1lJiiqWoJdn86LEsDUwKr3hpmoTFDu27DtAns1UCABk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e32sUzjnaNRKBhdxknKPrRIDEsLdotB0IKg0cukY/p4ZR+p9m2FWjDEaf4PQxReDeG3/TQ9Cf9DXc4uCSUQfVNMzpfy1e6y4C8aL4S4Q4E0vnQop57Et32i1jOOzC1X+vW7Dg5yGLydrGQ/5vmSkngB85ogK5DZwDirDdk7livM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ih16WRW0; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ih16WRW0"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1232d9f25e9so208441c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097309; x=1769702109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTnCx05EWycA27LR6+sAdSVg/yTmd3i6OMWgoqxWzqk=;
        b=ih16WRW0cv9YjOZIbz2XI24d30Af2NGcOuJap7sybeUGYVwdjQVF7GNFrK55T6mVJX
         qdQG+xmG8TfMmYgt/zAn7CHi8rREmmzW32dHazaoJdMxBHtsLG4e/zJW0wGFMhW25kFL
         qYRVSvebKiOrTz7pxfVafJRS5Nv+bVkM0T1/FSEFw442aiXO6HqUywGrrGaKpZdNOpn/
         MWLzEF9AImYKLjh+l9kFR8IAi0jtxUbfEbtrlVQ7gJ6Y1Bip9R2bZ0HiDoUNuZSpbAcf
         UWU3AywwQcM3ParyEgMp1E0CpfL0Q16ZJk3u+bCGPnx1RjRgYAG2sBnUDDeGwQSCMwTe
         M50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097309; x=1769702109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTnCx05EWycA27LR6+sAdSVg/yTmd3i6OMWgoqxWzqk=;
        b=oFaAVNnW/i02pncvJKwgEveRVoeU+MyIqZ3THkaWW9orgZRSDqeQvJsF7THGptTIeB
         lTLJYpw0oWqDK0gA882GjubCXq97R2tQsZKEzZAekUNtzPI5QO1yEoAcRHkImI6t1R0R
         LpoIU5su87DiUoslex+rt//0FPjUZl44ZHTRuV29p6/qJthqXHhLyioTBn0Aa2SUtCB6
         wKQdXaiv5i0QQdDtPno6jm27X3RMpsni9TYyP6lFchISiBaGduqXT0FLmy4Sg5EskDMv
         Fue26louQUUSo9dTJi5WrNX+CjJ9aB6ktzEstS4gEESYs4v2M+b0Wrujzkh+2bG/jWuh
         egSw==
X-Forwarded-Encrypted: i=1; AJvYcCXJxr0mIRGGn83fb04aQ6CaNvKE/I4iGVY33UXxOcn1iPLR2O1Ze+vS8QpsB2wmoiuDGvVyIyRdeRY3OxuOje7pb+KL@vger.kernel.org
X-Gm-Message-State: AOJu0YyoGIA8nJbUcKNDNqaMnKGqIet0I9kAt5rIglo12r6PrYs2VltQ
	Bxyzmt7791fDXr2cG4UCViUwT8axRJrPeG0XyqOngw/23BA0nLtczhT7aB/9Bg==
X-Gm-Gg: AZuq6aKJFHz45wiw9yC6F9Xaiix5pOJ61W3iOp6GzVG5QKEZPOlRj59G72WQoZKfHuQ
	aN1cg8iamMoByDMDGp0UNmzU/68yM3ESOPRtc7Wf6UywDtvF8HND+riAvJJKsnRJe6mwGuziRnD
	qY0yFUyCSW4KDLYXb0JIF2JyIbSrJGDBnuT1rkNFrejnUu+NJ9HSkgJRt/LO6IsTvD/go6HnYqK
	5LPMuNJlMHpZk//u4Jj0iFLhn/HDJj1fPk29VyTN6eejJ7UMsJmX6G92jeJKWaqO26t5kznlCDC
	DmH+O22qDotORPuKLc6FpEx9q2dshzJBqNCk0Nc1/T9bhp2S6AgrN/KK9KCxeQM9cgEjxEzDhxl
	6FPwMGOrzJ5uBKubxsYYKTakgUsuCNEfQ/NDSMdJXGKqBFX83rOjtwTLByQmVCk8rtXb+Pe3voU
	hxzXpShrS47yUNxhSYRXWyakChhiTG7aYA7+mKREJuYMDctH91DG46
X-Received: by 2002:a05:7300:e8a2:b0:2ae:5d5b:4ed0 with SMTP id 5a478bee46e88-2b6b40d9dadmr16548799eec.21.1769097309215;
        Thu, 22 Jan 2026 07:55:09 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:08 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 0/4] Add quirks for MECHREVO Wujie 15X Pro laptop
Date: Thu, 22 Jan 2026 23:54:57 +0800
Message-ID: <20260122155501.376199-1-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds several quirks for the MECHREVO Wujie 15X Pro
(AMD Ryzen AI 9 H 365) laptop to fix issues with the keyboard,
touchpad, power management, and headset microphone.

The laptop requires:
- ACPI IRQ override for the keyboard.
- i8042 quirks for keyboard/touchpad stability.
- AMD PMC quirk to fix spurious IRQs during suspend.
- Conexant codec quirk for the headset microphone.

Changes in v2:
- Added Missing Signed-off-by to all patches.
- Wrapped commit messages at 72 columns.
- Unified author and committer email to 550230171hxy@gmail.com.
- Properly formatted cover letter to improve threading.

gongqi (4):
  ACPI: resource: Add IRQ override quirk for MECHREVO Wujie 15X Pro
  Input: i8042: Add quirks for MECHREVO Wujie 15X Pro
  platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro
  ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro

 drivers/acpi/resource.c                   | 6 ++++++
 drivers/input/serio/i8042-acpipnpio.h     | 7 +++++++
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
 sound/pci/hda/patch_conexant.c            | 1 +
 4 files changed, 21 insertions(+)

-- 
2.43.0
