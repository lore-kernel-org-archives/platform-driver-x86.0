Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9D3ABD8E
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 03:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787455821; cv=none; b=NAm5Grm4nfkC+eNtnK7i/GeEqZT2WhbsCJWt8h+CftDT/Bd6b24cLKZawPlHqhvMfptIE/3Rap3HRMYhbq8cibxJ9iWSEnvQn5J9DpJkDIxekAh7wPv24Y/v8u8Fmk4tBHW77R0870aeBUt6gyKT2HrfTa2ezfQnzICSXjRSRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787455821; c=relaxed/simple;
	bh=odra2VZjpA+fNo6c1sHn1YdBhevb290OHSdsszE1tR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDNV5Um2rcSQvK2FFNOWcyH5w427pu4RWOAig1Yof3xqX+Xs+BNBclcFw9mM3bQ1M2XUOd4R453lSsf0UOS6kqF8hTkBOD4zhsGnhXHBbu9lhR1QDkDm6WWCuedXxIi8fC9HzbxtmoGc3XpKIDFCZKHRxY6UMs5px5WP2pLSYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+Bxvo9u; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+Bxvo9u"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf27856f9cso25301065ad.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787455819; x=1788060619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stLZT/okqSNFXuljKE8tIV/AU6lfezXDB7JUzrH4ujw=;
        b=h+Bxvo9uG8oRyD9F1wmvLWyuP4iaPPcwTq5srStnEvFZC7lCerjAqLu826MENlzkS2
         mJBIjQRBOeM1mitPmnXO8e1pHTztct29V+goIremNuB42uCtZ2dWnNACm0oTgDevvhDk
         pnAY9TlIqroqJt7i8n8YV41sGEXb7SFub0qWJoc2ChE4yvdP697J5YFyeobTggtVYjGo
         uukuOLmOTpPVO6OCKf01vFbewj2UF5ANjAZdBCUh7yeQlFVypK2ulTgvO2E0atzHtw/z
         NfvdLUP8cxc9jWdMrg4YyL5gkuTYuQJW4Ty9vhZ2mQ2vTO02EwV1WiWa9YfXFGy9Zoac
         0FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787455819; x=1788060619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stLZT/okqSNFXuljKE8tIV/AU6lfezXDB7JUzrH4ujw=;
        b=r9rCMpowbU68TNjjMoF+Pdk6r6/s2sRPvsN+AbSkb96qv2hwoJnNKfLuauwEPQU3d7
         l/POuBcWOYY8eD4RseKaMaM6yQGnFj8dF3Z1GDhywF7kL6y7DkA/HjoM6677d2ybiC4L
         XZz7Z3XQ0AXO8L4EhrqRhT+kQwjFMwTDSKhiyDeNP2/n/AXI1aCjjhs/daKuzS1re14B
         PHAibSmBzItFwwX5jXVgGL4snz/VKPhgb4ZoNuSmKyQ3fl6cmVRZh+G6uaGwbz8WaLI/
         YHHcRmzG/tJ5pulprUzQVHL2kK4OVdXUBgOrkd6/iXYPL8rb1NjtJmkV5ELjXHKOtxCt
         RgGQ==
X-Gm-Message-State: AFuF++mpXTwEkaHcsrASiVEhx9Y772k6DF1WAoo16JjNJuenRk2RRfOd
	N0v160Fuu3I3BuVFUUFC2U4i/pI/MuoTBDQfZcNmz7pa0ufPNV4p/ZPE
X-Gm-Gg: AR+sD10iB3jA7IOxVuFF9C4GRPRptp3vXsr6gcWJDfvLEw28hDyESIQI/hvcoFvKp7e
	Aq8MepWP3vLtJlVvpGa7J6++ecGRjFx4tV/iESbN2j0nvTETQ88eAOv8uW7yHHbrh8TqGwjUvea
	H1wBHXPDE13C54/Uno8Nz0kE2ifvmzwoXT3I6Ut+Jfd6cYbT1cosRMGjGm2bO9ZX5UYC1IQZsQP
	KDPXEuFLMfsXocsOjtk4BjuYZr4x6a7lU3QB+BU+Xt5l32+y+i3HNG8eZxHcgUsSZaJqFU3dOEM
	ybd8lfyZk6t6+7NGmSGj/NAFEgiGNd3b8b27lyiBqXf6MlToqm1YwYawfzZTWUsp8yFHMZRGGmB
	wlPDA3wuINPZ1JbhSSeuLD0m/9YoYx0LPBZjW3rcbC6NgSzTxrFPBSIvtL5+p4aGoK0Wa/lhKD+
	ytz4oPe87ZL1sxJIyndxmncCuDWa94Nim16fzKsjyFTISbGZ/qLpcMijc7mPTVDU8vi51fKm2O3
	edNtFLDRgwbQb5foP3bWYWl5F14cKSpsUgM8zc=
X-Received: by 2002:a17:90b:5288:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-395c3368e30mr34024160a91.4.1787455819561;
        Sat, 22 Aug 2026 20:30:19 -0700 (PDT)
Received: from DESKTOP-NUG3VVK.localdomain ([39.117.86.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8d26sm4601465a91.10.2026.08.22.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 20:30:19 -0700 (PDT)
From: Yongho Park <yhpark7i@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yongho Park <yhpark7i@gmail.com>
Subject: [PATCH] docs: wmi: fix spelling of "frequency"
Date: Sun, 23 Aug 2026 12:30:06 +0900
Message-ID: <20260823033006.45651-1-yhpark7i@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the Lenovo GameZone WMI documentation.

Signed-off-by: Yongho Park <yhpark7i@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 1769ad3d57b9..3579aa32c5d6 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -152,7 +152,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
     [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
     [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
-    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
+    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 OCOffsetFreq;
     [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
     [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
     [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
-- 
2.43.0

