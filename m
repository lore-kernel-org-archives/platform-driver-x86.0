Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41331F6690;
	Fri, 17 Jan 2025 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101665; cv=none; b=tMEk2X++VUQKZh1sQxhKUIXWU0ecywwD0OuEKe+qB88qYSOqkbokpbs6G26YHp5SUWn6YSxwYyv89ebZtvQIwIEFxtCznYVFT61TJCHoAvhHMYFW48owadG0vrL2jybHCfXzmxdIx3wQxCknTOIGALIfGSMkAQ8w0yrW0v1uOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101665; c=relaxed/simple;
	bh=H6+qDRTk7GKPlG4ZVCOhh9RYdLkUK5uxpqGMyeaPtKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWdLEBAY8JCa0qa0QGxJeD+3BmgffLWWjNkrdz7Aqlli2r2uxZgj/VtbMQ9J0TIJBzGyhYSRjMAzLCEMoeyjEWo9XEhwfKzqwV4r+JS8ZDR4NzWq86NDD1p5tQPOWRKuUimestlF1iRU/NGpQgKBoQfMN5gHPZL5VeIppUpS+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IucmuOph; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IucmuOph"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c5d4f3d58so451223241.3;
        Fri, 17 Jan 2025 00:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101662; x=1737706462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbzo18MyG485ZbSUenCZCew9gDqCz7CvFfPIFIksHaw=;
        b=IucmuOphDB8Ki713B6z5m6FuaIm+fOn/0xI013u1WfkDQtO+jkNwMwV1AIYm4JGQUr
         Wcsmi8BrRxPHUxrOv+9uFtneJ45XJqnaimrKU3Hj4v8da4O1nyrm0i7EweUCIj0FpT5n
         l0dDNyToXCQuq6AuJJdbYdkEcDbmTuZIZ3yN62AjFb34a/H9cyNTls/yKJTPp741rRmJ
         GfaeeU/9ktHVO3URzAjwadJ2dSQyvZ0emr+brwB1bND2p+fs40Zqr+uqYZCMOQ19btfs
         zKDBk9yQiJU0TwpIUfku3YL9v+g6lKTR0ybTfw4VXQ46kbvImqWfTihBS/KLjGBq4Da+
         4LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101662; x=1737706462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jbzo18MyG485ZbSUenCZCew9gDqCz7CvFfPIFIksHaw=;
        b=Wd06Cyc7a8JZtBEwqZtabP4FYLhCkam6CBy1PzwB9xiR5vFVg0ntLlBTm5TpxAOMau
         KCgjvtvEdec420+qFbcI2I92/Q4PpAwMU3i7lk8JHwb7brxIjbHMmq5+PGfXAPmi7u4l
         MQF6ZpXBc+N5fewbz9yqGw/XWDM9M1I6tXoZRLnJJSMPCqwMIYg9SWrUua2sebzFs6f5
         88YRYJn7TFADP0xMzLsks+S8dpO+PmCdJiztOw5zJHuL/RUn1MQx9j5+m1aO3TF0mHZs
         LNwFFEDNNedeIxNuNkeV1gppDmavtmJE7aN1rBA3NZQDRLUlKand4+Q+DCvSVGubO7ce
         AQpA==
X-Forwarded-Encrypted: i=1; AJvYcCVC01XfZjNt8m/frbGAS8yCjI2QWFUo6gjT0c7Nuz8HHM0JWSiuLfFvkVVAVT26roqaHEwVmGywTde/YSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBe8pxR6+VuzSQJtWWaa3hv69NI+rN2sf1LHnSIgzyueYhFnR
	bxMwURPu+ZMfOdcka2KEdjL66I8XwVWvnl+L1V6wQh4cpapihAdLGHbzsg==
X-Gm-Gg: ASbGnctFgrXVEGK8rv+fLXOm7tEHxgcd5Pj4EbNKHAcVquICsMsKMQuTE8U6vydNRZk
	KGQs0DAAhk4vFBoRDrqbiBqY7RhgxBHGBkLAqO13HPSKsSHoAjCyBG3faYA2Hu505Gn7HJmWPvY
	o4dyFi9LnnUMttZEsemL0DCiNb7Kt+VM/HN29hp2w/iYiKxkVC8vmA+qHtR63UF01TmqT9zMniR
	GzA2fz+lpTnGpoHvaikoJlKG4sjXZxtIpittPS9Fmu6qQmN7kkXMNRRJ+Er3WLm
X-Google-Smtp-Source: AGHT+IH32d/LKVVoHFvUls3ybP3zkRBBSa+cuuWIbwdJTLTJ4/T4dhHec72YqC4mYDrFq+MEok3Dmw==
X-Received: by 2002:a05:6102:dc6:b0:4af:d487:45f3 with SMTP id ada2fe7eead31-4b690ce3acemr737494137.23.1737101662462;
        Fri, 17 Jan 2025 00:14:22 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:21 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 00/14] platform/x86: alienware-wmi driver rework
Date: Fri, 17 Jan 2025 03:13:33 -0500
Message-ID: <20250117081347.8573-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello!

I rebased these series on top of review-ilpo-next branch to pick up
platform_profile latest changes.

~ Kurt
---
v3->v4:
  - First 6 patches are already applied so they are not included

[01/14]
  - Reordered some lines in alienfx_probe() for aesthetic purposes

[10/14]
  - Removed pr_fmt from header file

[11/14]
  - Copy pr_fmt to each linked file

v3: https://lore.kernel.org/platform-driver-x86/20250105153019.19206-2-kuurtb@gmail.com/

Kurt Borja (14):
  platform/x86: alienware-wmi: Add a state container for LED control
    feature
  platform/x86: alienware-wmi: Add WMI Drivers
  platform/x86: alienware-wmi: Add a state container for thermal control
    methods
  platform/x86: alienware-wmi: Refactor LED control methods
  platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
  platform/x86: alienware-wmi: Refactor thermal control methods
  platform/x86: alienware-wmi: Split DMI table
  MAINTAINERS: Update ALIENWARE WMI DRIVER entry
  platform/x86: Rename alienware-wmi.c
  platform/x86: Add alienware-wmi.h
  platform/x86: Split the alienware-wmi driver
  platform/x86: dell: Modify Makefile alignment
  platform/x86: Update alienware-wmi config entries
  platform/x86: alienware-wmi: Update header and module information

 MAINTAINERS                                   |    4 +-
 drivers/platform/x86/dell/Kconfig             |   30 +-
 drivers/platform/x86/dell/Makefile            |   45 +-
 .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |  100 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  773 +++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1235 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
 8 files changed, 1515 insertions(+), 1262 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 81e8e5017f5de3cf28004ae2b628629ef4d43635
-- 
2.48.1

