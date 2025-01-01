Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC863207;
	Wed,  1 Jan 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735723667; cv=none; b=qKe5z2z1iv7+2gZsSmDT2aKCALz5ZCB0+FFhldQbZ2ryhgMF38njtyvg9P9iuOTJU7ks6+/rhI9l9dgPYa2KXlz0TOYpiCszrOXEepgR8jhuPnct/s9MumUqj5cG7jIBxiWH93sGqyt8rlk8+wbRMEtTC8kzHQrFkR20wZLoZo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735723667; c=relaxed/simple;
	bh=7BEIZOyfQREsK3yKOTfXYxIVcqf4vjErqs1rA1GtByw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUgBJBUWVs9BCRF/dmSMyPlN4HhMAd3ljPztxUpTJdfPyrDI9sx2i8UHFfTzVDh17iZndKOf73l5eWXp+he0LAJ79us3OA07UJDxlUIlFPjHQ5YDXXsn1L1VMumWdMVbVQPgsuMVifybeG5S/XAMOIkV6ZqL9ipa/+QjPBLoSYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRXwm59H; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRXwm59H"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2167141dfa1so138438015ad.1;
        Wed, 01 Jan 2025 01:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735723665; x=1736328465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gblQ2fahvEh9trckZJPo2LZE0BYb0Hq82UUGKz6pcTk=;
        b=bRXwm59HaOvCY/qGiPutPAs0TJl3Acgfc8JUO7vPVfOD8Gw5vOJBKFFggikK0TLhgn
         zlwbVIi+VlF0S+wyA6xkFKyp//P8qFFKcn1P4GH4nz+zG7f9xU815eev1Nw/jeihcscp
         fj5tGAz2EDzJjag7rmEThH/AiE/47PxhysL65ZArAxP0LAGrZrp6867KbTTtVPLUdVMH
         66HpaEq4613pmh25otf9tKK18UVVUOoJi4KlUU2IvTLMzgkveqKrT8N8vMY5NZh4U18X
         shOULcUN2QUTA8bmr+cLVXeeik3mIvBG78CQ8NuTBk9fjBt1bW1aY57X2LRuxFSyOgud
         SBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735723665; x=1736328465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gblQ2fahvEh9trckZJPo2LZE0BYb0Hq82UUGKz6pcTk=;
        b=H0okF1PfvESH/fj8g8AVmPyRWZdsJnx7m28aitIi1czKwTu4YaKT/TU4YTZdoFSivb
         GVuWX3S/37VX1HyiZ8eA8aIWeMVy6LvASQOCAsB9XC2wGJc6WoBEW7oKckVAuhPyI+6e
         Y5J5jV3fKgC509y+7TctduqVW93HyU0Y5gb2kE46AFjWdfAzVVIEXbIInUR98NaJ7TBc
         YAC9zW4vdz0KYuNAWlbd7G8HiN9BH2W+veWSxRlQ0ONTa9pKgVmPpJDJU+hTq/OjXXB4
         0aHzwKZSF8GHoNQdJIoE/l61lqmom8dHhUfoVyK+S2O1jctaV4Kb5CEqYGjUJUDLBjXj
         VIJw==
X-Forwarded-Encrypted: i=1; AJvYcCV4+DkwL1TmqKbAbTrPgdTFhVSGrTQmhd+vaovtODLh07sF/Jx8gRifec5M+2uJQBoD6sm+Vbd6OT/f78vx@vger.kernel.org, AJvYcCWF1j/xlpaDbMtvmWkFTbPWh4XKowZvdgXS7FA39LhDus2sCotTYJPD8CD/5rpuE00eGy1jK66R5hK48+jmPwuJsrHE6g==@vger.kernel.org, AJvYcCXnqbyuvKW08Bu6rZudNU69JR5TtkQ6PTNBjZZEzQOj3U2qM+3woNcOf+ALAZq7i0abH2EjSiF0yrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9RCV1bQXRJTbXpy5+2ainoPBTuQ6s3TTthWWs2px1WFkM3Xb
	09m0Hr3M8cKwIb984yvYdidB87P8gX/DOMkyeL+Zm0CdPGL0Ci/v
X-Gm-Gg: ASbGncty3rAthuzbgqFhGjP6t79zSEwgdYr5ED4SvE9yPgcl8YAwP2vD4FJelTSqbvD
	4HdM0it6GTQo2PbMulMLTXUMpVZYqim1MEzbrWT+k2VMtXtkMQmc0KS/RHPUZOYlS0goY5610+H
	8y8LgxvipvjrjvbEaqnG857zFC+6MhrJew08E433uULD5Libn3mYFYhBMmv6rlc+LZjMK9q+Y2r
	VVORBTeujskqapIrwpRDhBomcXvQnbOqW+THQL0Glp4bxm89l+K7Mfsb4Hu6r4Dglc01i3W4kY=
X-Google-Smtp-Source: AGHT+IEDuUDwvHyLny+l+shGKwUGQnJ95Mwn8E/IINK5Pn2t1JwwoYPrMjg5bMpKdAFcB/N0l7qtjw==
X-Received: by 2002:a17:903:90d:b0:215:5d8c:7e46 with SMTP id d9443c01a7336-219e6d6b689mr683337275ad.27.1735723664896;
        Wed, 01 Jan 2025 01:27:44 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:4f85:9b9e:7c33:d875:2ba6:356b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d44a0sm206427345ad.165.2025.01.01.01.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 01:27:44 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Hridesh MG <hridesh699@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Shuah Khan" <skhan@linuxfoundation.org>
Subject: [PATCH] docs: platform/x86: wmi: mention tool for invoking WMI methods
Date: Wed,  1 Jan 2025 14:57:29 +0530
Message-ID: <20250101092730.87160-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a reference to WMIExplorer, a tool useful for inspecting and
invoking WMI methods on Windows. This can assist developers in testing
and understanding WMI device functionality when porting drivers to
Linux.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 Documentation/wmi/driver-development-guide.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentation/wmi/driver-development-guide.rst
index 676873c98680..f7e1089a0559 100644
--- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -41,6 +41,10 @@ helps in understanding how the WMI device is supposed to work. The path of the A
 method associated with a given WMI device can be retrieved using the ``lswmi`` utility
 as mentioned above.
 
+If you are attempting to port a driver to Linux and are working on a Windows
+system, `WMIExplorer <https://github.com/vinaypamnani/wmie2>`_ can be useful
+for inspecting available WMI methods and invoking them directly.
+
 Basic WMI driver structure
 --------------------------
 
-- 
2.47.1

