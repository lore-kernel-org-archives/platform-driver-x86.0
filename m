Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1979D383C7C
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872628; cv=none; b=ZAWF9DtL7wd8bnnRfhZJI+vattbFdqkPoBR8yY9lC6QZ5QwP5YtfVbDHLBV0JXeowmgW/MNQJ+bK5DULi3aN8CQZfG4OS5ggZHU+15INEx+r4Qld94NJIy2WC5+MxBfnnL4NqxpuxIfL+ovegESiW8mVAQuEqJjCpOs50FkC13M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872628; c=relaxed/simple;
	bh=0IcqWLf7L8S0MlLzNjuxD0rmD8XYPScBl5AUEe9QPLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bCtuHHhqjxnnzFtR2ja5iupn3HtykSHqKTCDW+ERuqv4AsCJDSI+HnS2NbQFS5m0TpuHDN37h9ZJF+gNGC7YYH4Z3J7fLLNS46Jv7oAvyZCf17bQsnUomkChj6wTThDAHJYHJreQg815qVkEebBOmFkjh2ud2vFC+R9yEMSboQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpEyqN1q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpEyqN1q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2866755e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872625; x=1788477425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LHKsLnjj7ap2tlzqHIXkE3UP9uvV/zfChnrGJqcK0s=;
        b=jpEyqN1qc0OZGGCNycQzDRd2ijzJgSB/2xQq+0tNO/iL38F5cfDJi/FGvgYsqVrHMD
         CAtrlcUQ0au7mGA9T3QjKbPX4RJr14Ck6Ky3OzPhe8Yl7PKetoDnptieVILVoW6QuOY0
         1LI8w5uH30OD8t0JUeyPwm7kqMFY9qhEzF3x20wGp6diM8xRG7tIndboAxgzyJFSe+xZ
         fsUQdT1qTS8fBa6Nozo7AHMde8voQkPZy4XrGtCcx0N0B1ngbl6cox/whl+6FK8ylM01
         MZBl+5ttpIOQIKH1hJ+LR8GEewU7gCIjwDLApRaNjAqf5vRqnLFn5SV3ek5YXgVo/zA/
         Fk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872625; x=1788477425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LHKsLnjj7ap2tlzqHIXkE3UP9uvV/zfChnrGJqcK0s=;
        b=fyNTtp7nD+vxcIcCUlKAu2Wr8OYsBf4DCSbRyrGU0gndpwd4EMyyiMWehBbzIl8LT4
         vFj2qJgZVyx0LE4EOiCRRdDf3bo4cGRKJ1NGvC0DeAhJqy7SMOnnZqbiPhlmpLnxqzMA
         VxJBTSj/QkCWnPfDK65x7Rl2NLO4K2N/eqzgs4Yu8Ubl0KxGxvbliiFcJmmWTAwhnFqJ
         vluzZqEqDcxaXYz0JXYyo4qdRyAxFUY3RLJjNt3u9EBsx2y/ZVLqLGDBHN0wEE1eAOn0
         yiqiWbz590DdVar3el3NpZYASj4iRkydx8Wtm0GepBRYBUPDqNUa2sgSBDzEgqdqXL5u
         c2aw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5J+/03PucYno2KsWNBWXSurZU+pCTGH+1Hg61wQl0wNRWEtNBYOfSIz5Qd9Q7HkoK6Bbg4o48a4srbQGiMQRrpFUd@vger.kernel.org
X-Gm-Message-State: AFuF++mxJ5YStnmUv7k0c7SpVZjB3n6i9cJRS6XJX+sPVgKBPZDN6OFR
	jm+kpD90VVv8bNvqH41y7YYWSTzaJnYlpY9tr7j3ZzBRf9G7ImCHWPQB
X-Gm-Gg: AR+sD109EgfwUds7Td5s70PH5IZ/0ty6Xxk82Ll22RHrjhXfEg+KJqruMcufkDcilH6
	wbnvx+XGMqnuxoov5Wz06l4OARk0PUfqD8p3pwL6YVDoVK/HnxAD4L4hwHyK23vQba/LnEoyVuf
	MKczvE3t+gf7p6+gHuWdlKzn7xevkrTohvbpNk0HCXwc5fHuMaqENg7uLn0sy6YkZsay7z89tQl
	orqXYGw9q6RnP5K6eoAnOomHZIjnhSdCCH0/1BpSnKjXqHObYvik3K1uIZzpVmSl7aufjhBJhnl
	Le1fDFYsBhgMPE3hT0cf2iRVgqvjC6iYEcC2EZIqV8uHT0WF3na9rP8Q8IykZ0PvnTyKOC362jG
	hx9gJcqozA+2hofYmdDGIUFwZeWhONYqyHGk7LAGduECXuXxpoR2IFu7RUXDz8xasoVwrVdraXc
	DR4fiMrCogU0MQACjReRR/UmZzpguEBuHY4BmUPuY6TVv461w/6vP43/4T3Wy/soig4NpvGSKaZ
	z8UcJKTXF54J72U80WMGJ2ibhDeB+CDdAc80bDDgQmO
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr25378385e9.10.1787872625080;
        Thu, 27 Aug 2026 16:17:05 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm10900940f8f.33.2026.08.27.16.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:03 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Fri, 28 Aug 2026 01:16:57 +0200
Message-ID: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L firmware omits software properties for
its two DRV2604 haptic controllers and does not instantiate or map all
resources used by the RT5677 audio design.

Attach board software nodes describing the DRV2604 mode, waveform
library and enable GPIOs, instantiate the TS3A227E headset detector, and
add lookup entries for the codec GPIOs which control the second speaker
amplifier and headphone path.

Changes since v1:

- move the enable-GPIO mapping out of the generic drv260x driver and into
  the Yoga Book board description, as requested by Dmitry;
- attach the software nodes to the existing ACPI-enumerated I2C devices,
  reprobe devices which attempted to bind before the nodes were available,
  and retain the device references until removal; and
- remove the dependency on the withdrawn optional-vbat Input change.

All three patches pass strict checkpatch, W=1 and sparse v0.6.5-rc1.
They were tested on a Lenovo Yoga Book YB1-X91L: both haptic devices bind
and work after suspend/resume, while speakers, microphone and headset
detection use the described audio resources successfully.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (3):
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/lenovo.c | 140 +++++++++++++++++-
 1 file changed, 139 insertions(+), 1 deletion(-)


base-commit: 32e17ef088fc55858886738d0b904248e98b30e0
-- 
2.53.0
