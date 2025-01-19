Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A927450;
	Sun, 19 Jan 2025 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324357; cv=none; b=lyclWeoLdtCitf7ElnPKXSUH46wfu7qN13qfOWiRg+FJOaY4N4JFU6H1IDxLH6xe7yZPPj5OopIO2GGfVvPoFknEhHkwDbkM3wuTE2jkvu92G2dXBs592qJFU3ADWLIQPgJqW8z1uW61uhnfBQ6/GzNLdNthrDh9bvY95iwNgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324357; c=relaxed/simple;
	bh=XJjNtNthYOdM27Krj2crDd78gpfooucyrlWv4c8XkbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FIuL8nm8H2XdQS6/NuDv0gcRAUD5kjJE/lMBhBQnf+hKj60AO2IT5CYF7sJUz6pV4ZlyvGD9pK7zfX7NhRXo4KkcFUaNvTsg7kUgEuG9tYCgMADCunfRKbL9PVXNIFtrnmcqkF4Gc05ZLvdkKORHkfO7rq77zHOZusFLYE05T2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5Q1afTI; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5Q1afTI"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6e8fe401eso367789685a.2;
        Sun, 19 Jan 2025 14:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324354; x=1737929154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS8eVGHIoAfg/4BULTt9cTL6z0rNEmRH5R6DrJPYFgQ=;
        b=C5Q1afTI/Jzc7HvorRP7azKr15q6hr9VEJ4dCvbToY5NEH5mOrwZ83mMnpNMmWkVwe
         PBxOf58O0gyaBgFI/oayGqSasyP++Jf4FhKBEykM34b7L9wfDZU6Rmo9w4mT02ImleL7
         bEQd42Q8Vc+OilXg5lI3836qpc2T72NByuhnQN4lCkyXoqDGl4/NPd3rKS3aZebLEXN5
         bbsEi8bxJPQluv7eIRk1Q4qWRSkYjcAl8w0tafWL94lwt+gwCFlgk7AVJA+0DmDHx+KZ
         rBZlw14wpOHvS2mGkv3V3yHLvaAAEmeeprcpfEt3ZCKPzwI3X/5/tWV6XP0/FbSJ2xG7
         qh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324354; x=1737929154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS8eVGHIoAfg/4BULTt9cTL6z0rNEmRH5R6DrJPYFgQ=;
        b=iudiAd3+fjQBWM6dR5oGt9X21fJ+jxI8+NyC/2AptlA9qz5OAHiR/OhdTOw9+xC1iK
         NB/6ejM1M/w9InK9at22nEUsFMlfklcTCETBuHOtfHOgEyrIQrjiRZGlB9raeK4Av7FF
         1M2jLpDCnDq4VqZ+2dFer/g1hBtxYsxwWlGvsy/j3BWy2PI7YZhH7TDIbi18X7wRbcOB
         VIs2BXIDopO0/52I0GJ1xJTid1t5p+pecsx3HMHnvKCjYg/esaDlig6PcgYxX7pU5z+u
         RMLnnWFkZrpIF6/w/1qSBVqRnTcxYw1ADtLKG3UX9QkbfA/ZWgMy/mpdFM1cdB/G9yAu
         TCXA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ej3XikunB9Z8zOCLPSBbl5tTF1PDFCwfDSK65i0qR5zMSvEiOvO+ZLz+V+j8q1QiF8XN4RwqfSxfsN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHtig8knHXwP+WLYwuBsTpLSHP2vwpiFhU32tvXV7UH1BjjCMp
	dT7dQtKQ6r4TYj6qjlbovN7KESidU94rZoXpxiWpjIYMpVrfgyijkMPjpg==
X-Gm-Gg: ASbGncua1Z8asN6g0n0+LFcMJBEahWyCAN6P9ea3ujHPuw4Uy0sveJF2NjGqQTD1DLF
	UtugZ9/gqZeHRsOCa0DaOIHEBwKx2JxcUGnnAM0YTgjJYr6UVSRbUuiehSEZOQLZefNSrMcWvoJ
	butkIqwcW0jcoRlt532Xdm9+Vw97n3Rw8ubAjTn18d9SAJZgLhzIv07RuZugOzCQ9Me3+sRNx5y
	OOse/7yPTGYfYyJoVqcPpKt1XmN3fLxRtk2P7O2+gxLpiODDhYV3SWs3LIx7vhYm+i5DVA7kDaT
	QA==
X-Google-Smtp-Source: AGHT+IFBWEhuIeghynBxvVGy8GOiF14hLfhdn7uV/n6v3pq7Sl3SZBb633pYYHwwbCRzaCVs18LUTg==
X-Received: by 2002:a05:620a:d8a:b0:7a3:5004:43dc with SMTP id af79cd13be357-7be63278ea6mr1883275185a.40.1737324354204;
        Sun, 19 Jan 2025 14:05:54 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:05:53 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 00/14] platform/x86: alienware-wmi driver rework
Date: Sun, 19 Jan 2025 17:05:28 -0500
Message-ID: <20250119220542.3136-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Based on pdx86/for-next branch. Tested on an Alienware x15 R1.

~ Kurt
---
v4 -> v5:

[01/14]
  - Remove mention to visibility methods in commit message

[02/14]
  - Register driver during module initialization
  - Make wmi_device_id tables const
  - Add .no_singleton = true to WMI drivers

[04/14]
  - Return -ENOMESG if out_data is true but obj is NULL or not of
    ACPI_TYPE_INTEGER.  

v4: https://lore.kernel.org/platform-driver-x86/20250117081347.8573-1-kuurtb@gmail.com/

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
 .../platform/x86/dell/alienware-wmi-legacy.c  |  101 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  774 +++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1235 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
 8 files changed, 1517 insertions(+), 1262 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: 4055e18bfbb7cf077da2bfd74615604b6ca51c6f
-- 
2.48.1

