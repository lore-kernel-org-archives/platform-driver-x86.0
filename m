Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA2421F12
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599844; cv=none; b=WDAGFtzAXINrQEIrnSOpR/mloBJZJGBRR/GPiQs5ResK/cmjuSMfL4Gt03Ud1fizJAotf7AM1fl9zlCh47XqRf33mTWIHPhOwRmiWY9ERld1E7U5TCxNyGE1hTVsPJsGZswWScBauLFie2q4mqjE9oca5D9jmB/ACD1Je8UMSf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599844; c=relaxed/simple;
	bh=j6hpa3baxv+OI+PlzZazzSx3l0J49kUW/RyqcCaQRGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRs3AxCYhmTVGaYv9Id5a2v45fNrY4vEUKquCyC7ashjPS48pCqegK+qhyXrkY1OWTkkta/4LllNPpMs5zcbY1xg/hdTc0o7RsZfD1r52C1mVUscXf0tNipKMgyVW2zg/0fzHOTKQZAMziKhA/G4xutxgadQn5AiQCNQtoceq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAIykwpC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAIykwpC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84864b41100so211707b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 05:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599841; x=1784204641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GMnAuFP2xR6XtEQULhoDX9bk8ncfyHBTeVWDEqgfiM=;
        b=pAIykwpCF+wyqkhixxOKjvF6OH5uNTEGCf1XDJP/WzLI2AkQVXzM+vzNZP0worHGND
         hqAQcjM17UDQlKDYJRsvd9FF0zaMxv7k3MhY7G7YeU4rBI/CE1jRrTYvOFmSumfcrjG7
         DJP6AIdawfgk1U/ef1b9P+mw9pwt+pWUqim61t/CyTYaKzay3jVID1juGehWliq/4I0v
         GGpoJpU9YFnGHYO8Z19QbpjtCbqchFw8j8z/1GsggffZnnNbACeUMhNCC++JXTADEvgx
         E8YfpNqI2slWbas17KmegMnXxif9aZfzhJBzFAJKTn8UNM4IQuZirvYI2MGCmWq98AnG
         8Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599841; x=1784204641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GMnAuFP2xR6XtEQULhoDX9bk8ncfyHBTeVWDEqgfiM=;
        b=KVkYYePgukkeMQB8RtFjT8ySCOlmnhfvVRmBZq+5eRwcBRklUntqlKPIbytNmPAqZB
         w2kZGCTRSPFm125R45R1u+FZHmfJflXs8vlaNRKEefU7sS8V5dFU7QlMz1bccZBZ/VyQ
         e6rLDxH/MfPwP/nfNuYCFle0WcI1GKrbc6XkR5Jji7JCXWAIXf3ExptaXmgqQBlabJZt
         A5AMbVMnfGJzRzkm+MTvB58aWicp5g5/MIwacPJTwNvvC4iwul+XUqgC33oIfLlWe3hH
         INkT4wvqwnJPwfQSOKy4k0j3/HnL6fRgGRQ3ML46PeIwF+2ZkJHF90ylpBEziLiK4vab
         tGfg==
X-Forwarded-Encrypted: i=1; AHgh+Rp11xbDJY9I0R+myh/ifJIyLQyWx+uUQoE6BJjhFZnkC2qsqAG7OrnlDG6xpohC6INTWB7TH+IevUgcpHjcXQ0rqnWR@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsr12GDg0pgg4HuFjKxVH8xDEg7FFxc5eDQPabLLV120mqJru
	Jc6SP5RFW/zW7XC47HlBIhKn3eBs+c4nN2uwgrZ+LMi+CTus8X4MNITn
X-Gm-Gg: AfdE7ckHUpwbfKJ+e6xdMVnhCTd6YC0pcxDv75K4PjwToDQMjDhn6QMVfKhEzJUI0UK
	TkefrulOnHQlkvVOekULqBIb7K7aWntFTYcwQ+5B22Zgk40/qxSQQCO1etRfuMhA8MOA6xMQZEA
	MZ7JS6KagWsXPTAMo24yjnaWjkr7nGlmsBaZKNsLho4+/WhwTqZ3osJfiyu2VpHWSkbdZtt3iZN
	0hy5zU0fG60jOzzb5sxwsR0pdpg77XK4+JnrhIlBnQfkLuwrd1kDgLhn0hyFV9ReX4m6N3HULU+
	+Gaj7P8wa2EHr3H/2xFeQ3V/7MAwP/eMhfnsHO7ekl33/NpZKflqWxF8l9wB8RXooHTKv0likik
	+vx7oE265uH//NmTSXHErYJjlqPLNhVPet1q9Jcd6lScaPllB/NKJ2aib59P3hvs=
X-Received: by 2002:a05:6a00:4292:b0:847:9745:2f83 with SMTP id d2e1a72fcca58-84842ee321amr7397128b3a.18.1783599840948;
        Thu, 09 Jul 2026 05:24:00 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484f973c4bsm1672517b3a.25.2026.07.09.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:24:00 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 0/4] Merge redmi-wmi into bitland-mifs-wmi
Date: Thu,  9 Jul 2026 20:23:33 +0800
Message-ID: <20260709122337.17417-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

To safely merge them without sacrificing the high-level platform profile
and hwmon infrastructure of the Bitland driver or breaking the fine-grained
AI button toggles from the Redmi driver, the unified driver transitions
its sparse-keymap matching to a 32-bit little-endian scancode layout.

Additionally, this series cleans up the redundant Kconfig/Makefile hooks,
updates the MAINTAINERS entry accordingly, and introduces a newly reported
mic-mute hotkey definition for Redmibooks.

Testing status:
- Fully regression-tested on native Bitland hardware.
- Redmi-specific logic blocks and mic-mute quirks are compile-tested only.
  Feedback from Redmibook hardware owners is highly appreciated.

Mingyou Chen (4):
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 207 +++++++++++++++---------
 drivers/platform/x86/redmi-wmi.c        | 154 ------------------
 5 files changed, 134 insertions(+), 245 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.55.0

