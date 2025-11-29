Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC11A294
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376277; cv=none; b=des04nrT2WM6eZSi1WMimtEh2YRoVUpf5OtoBSyZluK0QsVQMDh31syR5bHO5kH5kycbSTcIA8EIDDXhBfttwQnfld90Vbv/onNEe+5F4wTzf0CM6rmY/oYsWxxOBcKr3Q9Y3p7MyyF7QS9hglF9pd05LmmgMLrCn9x6RfmSt80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376277; c=relaxed/simple;
	bh=f5ajGLywqacetvO5aZlhvTWE1cr9omxu7IqEe8Fzakc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xa31432g29mOfMeF7hcN4eHe1oLKC4nqAqQUVGn5xR6GIuSGIAs/M/OQrGOzYXK/mU3A9Jbm/yLv/NoVKyBPGUVKgTS6Ey1VNMJtPhXKL4+vPHRxE9aCMN7ZeFsMDnfg6j4Adt7x5YmR71mw60Vfma+nM4DKKJCxqWVX79obdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqDA+WME; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqDA+WME"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297dc3e299bso23283365ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 16:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376274; x=1764981074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+fCjN5ZvI1tFg9f4Onw94iBdBKzIF5T11o6ts8QCmI=;
        b=XqDA+WMEmWIIoxG6GXI5u9ybfdaHaBeMPA8d/rUnHlR20+6eooigaa7NIo5J7SbuSA
         twvmMNWyIK56AiFQlxvnpqZwh4S+7p2RNaSwpPWQP69Y/X4SljZFknl7+uRL7aQeAGUN
         Ssc/bGjIFO1x2B46P0IyAUq1hirbpHnABE5TvBuhiwNLi1F32G4QYXfw1FNvdJSc0mOX
         cqMNyY0GUewVp+BghCyE6YygzJWLDPY1YLHBv3lfyi6UUD+KkpZhS+KHWELzaqlszbon
         ocUKv/clNTwUjByIO6owbOQjBDQ1nJ7wqawwOJZ6TPVaFPw5qHWerA7DISy61px0ikP7
         k3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376274; x=1764981074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+fCjN5ZvI1tFg9f4Onw94iBdBKzIF5T11o6ts8QCmI=;
        b=MEUCr++loEdOplk4FHTeUz/7U2j/KlXL370CX+kbrwTHNmsqXV/6Y3BEHaqmX2h1Dl
         ou37XnKXv3ynZUnlm0TamjdHpQ9aJNguc+Iyp6Of5g8UAqZPz6eIQzEN9j6lDCC+GJqO
         JoFktBTiZQYhQfcVaulSwPSGjMTOG2R+NnzgVW8eRKAQff864fb8Kk+0movAL548UGmv
         zfeihGqqSatPhUBGy8XwGG94udyPfN6F4emqyL+Y3DFa4COw4k9VRTQNcHs2d8URy90a
         d7sQ6HfR4E8x6MG8+i991S9IL9VBCPtH+9bmytDEK2NTwoj0A7/X7pNbwk7lscleOvk5
         nMpg==
X-Forwarded-Encrypted: i=1; AJvYcCUj8oNGzCQT1dlCEyrvlLNMv+wmJ/NOqTqTcGMoxXF2P7R7+xuI/owjRuU5WIEkdTi4/W+gUqaBceIuXwLFJGwK4vYd@vger.kernel.org
X-Gm-Message-State: AOJu0YzvnWmbMc8qPIjIcVMX9TaPsYzdC1LccpX3UQgJSBiPCkvAaPFB
	YiK4TISDOfM4o5m1vqHhugSQ5sqbVz+JeNRxCHW+Q5AkIK8MoSz2nGM4
X-Gm-Gg: ASbGncuWf0HOlk+TOcnenO3hjuV7ocfHgEBbgmQ4NQrQF99Q8yonRgjlZcJpIs+yDK2
	pcvT0aKaJ9ks7frfeBoJbSmCXJJ+iEkcmA3pq9LKA8kqOtVkkmx6OehUfPoZB7866mk9vLjZXDo
	U+xu62lFwrrBi8JZyxYr0YCo5t4MlBxVMenehl8obXzo6YnWF+4DdkE5aqnat9BEVZvt5Cb630w
	GGEMcbhz4uAhxFzRceCNjtwLIa16hqNwGZ3llbIraGZxbtGfe0umjuA+LfZOo5dazy5c+7wfXuh
	XVMzGEF+Zgp9+aPSWsn9tkf2uW1NY+y7QvIKpCz7hLqT6hp1k0Gqt+bJZrZIJ1tLOdQ4dq5Teeu
	U8XyfUoGyp3ZrmaKzOZwaEYyQhlVp+/ZRd7xz8NYcxId8c6W4KdHhy8mI6BHlL7Tox5dkSAFQ4r
	gRMLCB5qUI36vVxDClHc3kppKncUq3TdUn0Fa45yho3dmBNP98rnfHsKriiyROtUSsJA==
X-Google-Smtp-Source: AGHT+IH+svOzJyTxN6FrP355nvW2jyLTDFPrgoSEepjsq9Yu90iGPCoNap//9fhBPgDitqVWdz56mQ==
X-Received: by 2002:a17:903:1108:b0:297:f09a:51db with SMTP id d9443c01a7336-29baaf7be8fmr183413715ad.15.1764376274087;
        Fri, 28 Nov 2025 16:31:14 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:31:13 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 0/3] TrackPoint doubletap enablement and user control
Date: Sat, 29 Nov 2025 09:25:30 +0900
Message-ID: <20251129002533.9070-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds doubletap support for TrackPoint devices with
a clean separation of concerns:

1. Firmware enablement (trackpoint.c): Automatically enables doubletap
   on capable hardware during device detection
2. User control (thinkpad_acpi.c): Provides sysfs interface for 
   controlling event filtering

The simplified approach follows KISS principle:
- Trackpoint driver enables hardware functionality by default
- Thinkpad_acpi driver provides user control via existing filtering
- No cross-driver dependencies or complex interactions

Changes in v4:
- Complete redesign based on reviewer feedback
- trackpoint.c: Simplified to only enable doubletap by default
- trackpoint.c: Removed all sysfs attributes and global variables
- trackpoint.c: Uses firmware ID detection with deny list
- thinkpad_acpi.c: Added simple sysfs interface for event filtering
- thinkpad_acpi.c: Uses clear naming (doubletap_filter)
- thinkpad_acpi.c: No cross-driver dependencies
- Documentation: Updated to reflect simplified sysfs approach

Changes in v3:
- No changes

Changes in v2:
- Improved commit messages
- Removed unnecessary comments and debug messages
- Using strstarts() instead of strcmp()
- Modified is_trackpoint_dt_capable()
- Removed _BIT suffix and used BIT() define

This version addresses the core reviewer feedback by:
- Removing dual filtering complexity
- Following KISS principle with clear separation
- Providing immediate functionality without configuration

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi - Add doubletap_filter sysfs interface
  Documentation: thinkpad-acpi - Document doubletap_filter attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++
 drivers/input/mouse/trackpoint.c              | 51 ++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 54 +++++++++++++++++--
 4 files changed, 125 insertions(+), 5 deletions(-)

-- 
2.51.0

