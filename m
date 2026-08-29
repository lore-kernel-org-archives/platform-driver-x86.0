Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C1641D626
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044255; cv=none; b=Fbs+WMsdbF1aI4B5CpkzMdsLNnIAdyeqmpbC9gxRozSntm1ceZwUxMS3ScxPpvMd05zSQV0jXbYdaQ6IvyKv+S5Mk0qCs0jMwhy76A5xbsL3oeueoFyZNfTcpCXLWkn+ED5Os9FLO3aVCwgotmgGb7J7L8x1upxls7xWMRRKTqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044255; c=relaxed/simple;
	bh=Z6iAHN7f3v2qJZDWLBrgfCSFCZC8Je5UhoAFvCrNcKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8sC67/un4imX7lCpEeriSezWuIHS9OP9qwbq+fqEdyyg2+vpa4f+YFi6uGjo4KLSCHU2oirPPSjktGiLJdbE6MIuoM7eLUoiD8I+GVtbwXIega2BvsbXCRkMjCEGdoq8cBZCb+EFZbH0LKUxluiYxqBEoJ3imsKEcskXwCV8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEDQi5VB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEDQi5VB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499840a2575so13632705e9.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044252; x=1788649052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtlM88NQidqFT8NjUtWtKrEvDDJn026XfxLb81ixvB4=;
        b=TEDQi5VBqTiSY9vz4peEgTUhey2dAo0/WVKsP7wpP8tRNkF5IXVbWbRa4Cu8aX0EFy
         FL1nfs6ne+3AvZvOswUzuKmu15pL6RvZVbCwTlR8Fah9LIfljO6EIluQiQKLwzuayofD
         XGF5Q8U9iD9iB1d9Pt0V1MlHqbcI4VA1zWC2GsTrr61cuO472gP93a4CaB3vYWd4KQ/W
         WFLse14wIFBsY6S5lLUfouJxu61beRFP3Rx5afwvtRfKEi9KyDyx1Xye35KlydmWclH9
         n4DukdbIyqtg2aAtoV0SyRmSiVeeWG328k/uhXLLTHlpn42mpiL2xX7jE9ODpzB8/x9x
         WiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044252; x=1788649052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtlM88NQidqFT8NjUtWtKrEvDDJn026XfxLb81ixvB4=;
        b=orMvLyRB67dWEs9eRQh5ottIqCssVN453RNfdiF/fLPQ0Lcdy15JzA4AV3fBQ/bcj3
         EmSypE9H7yrD8sjUMHHB8sY4bfYTnvWPfa10syL+oOyi3q8cKWiwJSVr6BVCuX1M7s0C
         qTZ2rQRv1Pu0ZAGsCu6qx9TFRI0FlUU62p/KQKm7XIDlup8xCKCyJDh62WRkKNHgPe3+
         60GQaQNtFmdgouaEeunEwrhCVGjDHiCZ0T+gSqpAcijwcsrs/iV179TTWcaBTtFNiiUm
         DWAMrFOrmdW4nuaCg0jwLTn5LJwMe2HX4mn3qehGuKN48vgI7SZJyhkhpvpI8TRkMXqy
         lMGg==
X-Forwarded-Encrypted: i=1; AHgh+RoTJ6Njo3N9dsd8Wu2sOxui8hCAvqV5fu3VSGPZ6AC4BjytRE3UlwQgWlip33IdfqfpATNtE5Lzl0H4W/75JxVtyREb@vger.kernel.org
X-Gm-Message-State: AFuF++l23/h27S34gfPYg+hnnXwZxXVIvatD1SgTpMO89+0PERMCkRa9
	PPhFPAGiThqmTmpycoOTw+yBCQy5gMnhZ2xhHuRMncMIi35+t7lXJxFa
X-Gm-Gg: AR+sD122jmNI+NAbYjr4VSaDjZav7CXE/Ukq3VUMKIP3MOaI/tZ4bzZCtuGW1Vhi0ax
	fHg85m8ux1yN2OjnQ7Y2fl4T/ycADJigkBbT6K/Hw2WuqEk9c9MUCvu6bXFxem8C4LhLqiAESWw
	E7Ob7zU/ahqAaO3IkrhbJVVBp6DQfujCvsTJe62CwpNhWwBJms0e+NBPzEnTbvmuIA6qklntEaH
	ZwcnUby3b3wMoo2RiaR/TbQ97du5dxfx417H20YMVezrLOSABCD5C8exqn1e1n4zQaatNhKmnpL
	WFMwquEPNBaB587qUWz0Xht5kdpHjxr8of70cktQSfLFoTkzxvHXw4IVBI01Ju1NcuSZCJkf4Jl
	4Vm+YphIl/LeSOHVnnHW+QfFx9ygLHIuxX/5XhsMdMZX8MjWa3TGgTFAi/ZEWOUUSkUgiC3O1KF
	R1grq9rricTZJ6XmF+AWL9ZJO38cOqyZ/LUkwQyFCvnnVP6yr9D6OrUHSnxpnk8fCozwFgpO6Ty
	u+fYxU5KncPk47q9l0Oiu+tFt/lE3QAtbG763Gg5lo9
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr214245935e9.14.1788044251665;
        Sat, 29 Aug 2026 15:57:31 -0700 (PDT)
Received: from 1Z10 ([37.161.113.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm60751835e9.0.2026.08.29.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:57:31 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Sun, 30 Aug 2026 00:57:26 +0200
Message-ID: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apLZF6b3F39z6bUc@google.com>
References: <apLZF6b3F39z6bUc@google.com>
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
attach software-node GPIO properties to the RT5677 codec for the second
speaker amplifier and headphone path.

Changes since v2:

- replace the RT5677 GPIO lookup table with GPIO properties on a
  codec-attached software node, as suggested by Dmitry; and
- reprobe the codec after attaching the software node so its GPIO
  provider is initialized with the new fwnode.

All three patches pass strict checkpatch.  They were built and booted on
a Lenovo Yoga Book YB1-X91L.  Both haptic devices played effects before
and after s2idle.  From a fresh boot, the RT5677 GPIO consumers were
present, GPIO2 went high during speaker playback, GPIO4 went high during
headphone playback, and microphone capture succeeded.

With Best Regards,
Maurizio Casciano

Maurizio Casciano (3):
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/lenovo.c | 188 +++++++++++++++++-
 1 file changed, 187 insertions(+), 1 deletion(-)

base-commit: 32e17ef088fc55858886738d0b904248e98b30e0
-- 
2.53.0
