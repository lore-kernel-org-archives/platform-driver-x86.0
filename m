Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28962A41;
	Wed, 31 Jul 2024 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722384970; cv=none; b=gqUfGknv+h4kGY0Z8OvE9e8nZvBWvDF6WueRxQzndE6EbneHG3bdjCVN7lCoFAbHVa+wXgD+TQ5KR/cXJk9pH/+VkXUK9ZnO4tm/NKdK7w1n3JY+6eNgviMIdw/KDVr6+TahyNDyL8/pYNqylNFJa2kkpXovJAz+AUJK+I+IEMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722384970; c=relaxed/simple;
	bh=IgqLaxo/OHEm/D75VDf/y0x0DQoL9NGxFSzNrXGPcEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZGTpakr4hC0E6psKUoQYj9T701ulA0zBV+VOML2zBFgy4NErCXU8KI1BoORfQF3j6fUoBYRVojRwxwXeKiRXyKi91HU1VGJBGjxermR/9l8DfLR9nAM411lTs+mrYuRUIqpgU/Q0ynTow4aK7PAy2H+7Lw/eVsWPVlQ1yVGDoO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McuzqeQq; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McuzqeQq"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6519528f44fso36907407b3.1;
        Tue, 30 Jul 2024 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722384968; x=1722989768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwdnCsCQMNgwGC4xpVHvPeVi+xBLWUp6NbXom0FK2po=;
        b=McuzqeQqBX3QBxnMbU+7CllPvhvbVW406a8a6DUYWUnyFjk1NX+QshE4qnPihHZkGN
         yQSiPRFy7lzzMpFEU3H08dKOdFjyqiRi0vwnMETWzvQ9nkpuQL8Z7nLYl1fNc6R/u+dH
         K8T63zlPJuLW5g4FqxlpMtAICwha4JAYcyjX2/1/LJBLbbnBNH+aSCDY9zTLlIjVSB57
         jGJzfqSQzqErwSAVijCnGzOIeA21FctzKHWRLSL2V7VgHXQfKOMwAf3ry8pDUwitKFiG
         PKM0esw/IgVgSLjFwk0TBK4uX5YZvH/Xl+tjSvt47gIfaiKHMuhpREC4Pa0tDlAfcTqM
         yHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722384968; x=1722989768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwdnCsCQMNgwGC4xpVHvPeVi+xBLWUp6NbXom0FK2po=;
        b=eyoL+/qfzjJZEyoGLpkmMyEU1pEvGPp2gu1nfU6GhtxK2ZRfi74EfnUX6Gpo8FiAE3
         E6IcIQeG581H9cd7NBRQhZXQFDTBE0kkbwQBQOBy10hhBeEzu7PztrIQ2Q23sLnW1+c+
         O+1F6ZmoqWBx9CCSQ5IfDXb2sD3BNRPHPSEQuxqS7srsHwd3sUI97L5ETcvkgJYg81th
         I0JrLEP/YgXIMXyt9EqLpJaPfOpU0DIh4Wlydz3uBXhArFOWR1/o1VwihNn5h7IyijAo
         N0hQtqPNHCzPZl+TRXdRZj4zxW5NdZVBjfUv5ONEJPLl3Xg3IkdC8RdW2zjHm9n6A41Q
         8ulQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsmbZNv4ejK6uTbLJwadOJ4Tb/r6lPwOO8bctkKl++5NWvcjglUeg+Opf7oqf9xv3vWtZaLcjZSCJDoMDKRsLmW6pwyTYmB3wiy1ENGbYjXP61ZdESfSuo4FBrNNH2oXaTRK3b5evXHG+nMrQsqw==
X-Gm-Message-State: AOJu0YxIeT/VX9/8mBmV5/0ApSJSWKL1BaqkONVOJvCST6VqnpZjh7fq
	kehWo5WNpSEAzcbEZx71AaKgUA9zzqPaOBB1L2acJnYmSANeMO7E
X-Google-Smtp-Source: AGHT+IGxDCZIaBjQmG19x/rKvVdHhTyCGMhA3BdgvEkyguTA/p6nT7eLwvjd542OAvXKDGX+06G6uQ==
X-Received: by 2002:a81:a20d:0:b0:62f:aaaa:187a with SMTP id 00721157ae682-67a0672bd91mr138831297b3.14.1722384968043;
        Tue, 30 Jul 2024 17:16:08 -0700 (PDT)
Received: from x13.lan (2603-9001-2ff0-a230-0000-0000-0000-1896.inf6.spectrum.com. [2603:9001:2ff0:a230::1896])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b303ec6sm27468397b3.81.2024.07.30.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 17:16:07 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: W_Armin@gmx.de,
	corbet@lwn.net
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3] platform/x86: msi-wmi-platform: Fix spelling mistakes
Date: Tue, 30 Jul 2024 20:15:59 -0400
Message-ID: <20240731001602.259338-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were a few instances of typos that lead could to confusion
when reading. The following words have been corrected:
Binay -> Binary
singe -> single
chaged -> changed

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
Changes in v3:
- Address review feedback regarding subject line 
- Link to v2 https://lore.kernel.org/all/20240729223649.135639-1-luis.hernandez093@gmail.com/
- Addres review feedback regarding empty commit message body
- Link to v1 https://lore.kernel.org/all/20240729164721.125708-1-luis.hernandez093@gmail.com/
---
 Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentation/wmi/devices/msi-wmi-platform.rst
index 29b1b2e6d42c..31a136942892 100644
--- a/Documentation/wmi/devices/msi-wmi-platform.rst
+++ b/Documentation/wmi/devices/msi-wmi-platform.rst
@@ -130,12 +130,12 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
 
 Due to a peculiarity in how Windows handles the ``CreateByteField()`` ACPI operator (errors only
 happen when a invalid byte field is ultimately accessed), all methods require a 32 byte input
-buffer, even if the Binay MOF says otherwise.
+buffer, even if the Binary MOF says otherwise.
 
 The input buffer contains a single byte to select the subfeature to be accessed and 31 bytes of
 input data, the meaning of which depends on the subfeature being accessed.
 
-The output buffer contains a singe byte which signals success or failure (``0x00`` on failure)
+The output buffer contains a single byte which signals success or failure (``0x00`` on failure)
 and 31 bytes of output data, the meaning if which depends on the subfeature being accessed.
 
 WMI method Get_EC()
@@ -147,7 +147,7 @@ data contains a flag byte and a 28 byte controller firmware version string.
 The first 4 bits of the flag byte contain the minor version of the embedded controller interface,
 with the next 2 bits containing the major version of the embedded controller interface.
 
-The 7th bit signals if the embedded controller page chaged (exact meaning is unknown), and the
+The 7th bit signals if the embedded controller page changed (exact meaning is unknown), and the
 last bit signals if the platform is a Tigerlake platform.
 
 The MSI software seems to only use this interface when the last bit is set.
-- 
2.45.2

