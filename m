Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467962;
	b=v/CCP9sMNsjDYh/z4k3GMNNXrvf2HFNO7fK9OlGvbk5GiPiWaIg6i5h1tVIclSFIrYi9
	 l5HGA5hHzzlJE+NaX7So43APnOSqnh2rx0x7J3JPltH0llKYCh8DD/a3Gm2/Xsq24cgXF
	 2+SkYmH6kvCAeQKM0cs9oWBSYPuZQEtA1e4Q681D8WwybuuCLYPZWWdPV2Yxgl0eYndtQ
	 sFFG9PxS9I/7eeBqrfPRrsKgPrKspIrbKKunV7V8SWrBJmnDJrjOSa6/ddHswrFO4zZLR
	 5SbwaH546huJzHDuhc8DvMMnJO2bqSfLHI4cmjKeFEAAOLm/BQhACfYR3QCaAHoyTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XMBLf+oFpGY8ZXLOORoqNUv/sgwI+cM0AGAeYIAJOjc=;
	b=Er5bRUp4wLHJ+axzUp3ERPg+DgzlrEikleNt0qwuSobD88gk/0hjWnYvGsW/f3g4zYib
	 lCE3wr4jdz+KQvGdGP4f6U/9RPnUb1asS+Hkq/xzg+dEM0JbgRYtvzcv0jdCUuKmOlIve
	 mGOSoR2WL2rTlC3Mfg5bfovan1NmrrNb98LX3w+L9gAXV0Hd2XuXKx66wqQ0X5Uz87qRl
	 SlufWgj67w6uu30UHL8KVoGrzs4Rm3NIjP1dnwMpiqSRMhaP9cvfYamjBnTRsWgsFqgxX
	 9fg+c4qFPrAMp2Z7gY84DR5RyU7Iqq0jYzBG/CztE+pWBjnZsRvUJBjOa2RZQugRdSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsfX6eHx;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F4606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 21:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsfX6eHx
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78fb1fb9508so3742528137.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 13:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467961; x=1796072761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMBLf+oFpGY8ZXLOORoqNUv/sgwI+cM0AGAeYIAJOjc=;
        b=hsfX6eHxLkyGhzgsKpICfbUlsnibIJsum+dOlXFqR75aeGrldW8GcJu9Na4Jgh5P7Q
         pIOJHHcsOUQLl++F6NlxyD8UbBXuOgvaQA1y/+vpdgI4UfK33PHgusb8sxPaQPjxL+Xg
         kvLA5rIru92NfVYma+SI5rqAmqFCLfiddBQkR5euwO9ML0t5TUPSOlr520IaDDbwQ0Es
         ZjVC6X6NwsqkccF8Xpj4iIFlfFIHCfI5mINDY7PdZG+rSCU3QF2Cr9ZVak6hPACeWi2K
         8w22LpgurG8tu1Ie2v5OdWI1jwYx5iLY2YnlPIpditicXdq8Kqax2prXFVI3WWl1upJt
         L33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467961; x=1796072761;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XMBLf+oFpGY8ZXLOORoqNUv/sgwI+cM0AGAeYIAJOjc=;
        b=NcM51ufGVOTYIEbX0gV4d2wG4wbSOGczYz2NDLYPA/A2jNOG4rtI7LbODhIpZtyCbR
         pCeZMNRvqQ3fF/zZpOKjO/MEZPcW9r1oMwnDuCycQwKAOfIsh6bg3Vf5dD6kaoOXlSm0
         JC22W93FmeU/Yp9EyGKEWLCNk3mRryWo2mg7XZvLMuVDjc8ZEfYZ260HdtpZN5edMvhJ
         YX7TEpiJ5wtMA/oVH8UGSnsK6P5ljD8CU4jDy4/ZD3y4rFSPBAjOpBx/rLWdG9O6ZhDc
         Dopai6Oxvw6qe8laKwfaodXCkv+Q2MsF/9PtVvDJZSAFWfH20Pk0fSO0VZyvsFR4iJnr
         kE6w==
X-Forwarded-Encrypted: i=1; AL+hErG/cvvRgItfkv8bdDguf5dtbOk5MSrM2FO2HxGZh3fKKok5c2cRq4QOUjrdFfAbk98gG68DJNKlxFMTEZH3kb5vVb/v@vger.kernel.org
X-Gm-Message-State: APuU4Z8RX3uxpE8SqPRwEEbGnFL1YrW8ouM0j+InJjv5Q733+EjP55bP
	cIB4RvyvkJSzhROYty0jaTZGAA9Iu5MH3IbZNPl/C/NEgpCfy5qqfeVr
X-Gm-Gg: AZFdTZdScATGW9cVPvJxtbZIk/RJdXd1Ct1joe9e7JO5avSCNw3B7aKOk6ViMtZGWn5
	9C3nD/hF/zz1U1W+6jYLewPRqnlLwBYGi18TEWOmZNYLZ4nDYB7/i3d6xbUPSy7dzca0Aeyc3az
	rCWWqMKSrhl0/ZY4bKBY//Ul8aYBtkeT1Bd90RTmk3VPMesLHZR5FqE47myFsyxZ6wRo8DhTKgd
	BuxEOldqysowsEkD5C2zcMQd+okQy70CbrF10rLD2qCU6R+Aq2rrsKrn0+JDIMTNsrdPgWH0C0J
	s3HtrP1xcfuPBiZaOc8KfoGcmDQ3wBqbg6MP5BTHkXHJcRkIi0XKDof1Ljc+GNmaHvaBUrbWl9T
	dIIQce6Kr8/FtzkyaQ86zur49Ze6t0BGeRiIC4tOVTuPgvE6E2ECiZYn7XlIgTjd2/iTAuAUXLI
	M8TP65TIv7pUrORUn8rU6Uj3oaNmZqWg7das7/PadX1lNm8CvS/Yf7BMCGfEWx07WB/5ZJDnt1/
	rkrXcmdqwqUMY+z5a/it8r6ou93LmeRwIui6kKMZWIcBO8O5xvbMXKXLJFGDEnFcPE5frgeM5xF
	1147aYObDd6TITMWWejpeE89
X-Received: by 2002:a05:6102:f12:b0:7a5:673f:9a37 with SMTP id ada2fe7eead31-7d73967451cmr4349495137.15.1795467960926;
        Mon, 23 Nov 2026 13:06:00 -0800 (PST)
Received: from garuda ([187.114.10.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm13041769137.9.2026.11.23.13.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:06:00 -0800 (PST)
From: Renan Biegelmeyer <renan.biegel@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Renan Biegelmeyer <renan.biegel@gmail.com>
Subject: [PATCH 0/2] platform/x86: uniwill: add read-only WMI EC backend
Date: Mon, 23 Nov 2026 18:05:52 -0300
Message-ID: <20261123210554.3357528-1-renan.biegel@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some Uniwill-based devices do not expose the INOU0000 ACPI device, so the
in-tree driver cannot bind even though the EC is still reachable through the
AcpiTest_MULong WMI interface. This is the case on the Avell A62 LIV used for
testing.

Patch 1 adds a read-only regmap backend over that WMI interface, makes the WMI
driver instantiate the platform device when INOU0000 is absent and the EC
answers a test read, and restricts the WMI path to the hwmon sensors (CPU/GPU
temperature, fan speed and PWM). All write-oriented features are skipped; the
WMI backend intentionally has no write callback.

Patch 2 documents the fallback.

The series is based on platform-drivers-x86/for-next at 2268d837d and is
compile-tested with W=1 and checkpatch --strict. Runtime-tested on an Avell
A62 LIV (i7-10750H, BIOS N.1.02) with the same change backported to 7.3.5:
the driver exposes fan1/fan2, temp1/temp2 and pwm1/pwm2, with values matching
coretemp/nvidia-smi (3157/3084 RPM, 60/56 °C, PWM 102).

Tested-by: Renan Biegelmeyer <renan.biegel@gmail.com>


Renan Biegelmeyer (2):
  platform/x86: uniwill: add read-only WMI EC backend
  platform/x86: uniwill: document the WMI EC fallback

 Documentation/wmi/devices/uniwill-laptop.rst |   8 ++
 drivers/platform/x86/uniwill/uniwill-acpi.c  | 138 +++++++++++++++++--
 drivers/platform/x86/uniwill/uniwill-wmi.c   |  76 ++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h   |  12 ++
 4 files changed, 225 insertions(+), 9 deletions(-)


base-commit: 2268d837dea13a78639fa3dad60472bb67478709
-- 
2.56.1

