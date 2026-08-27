Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64BB44E671
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854594; cv=none; b=nQq1KpXvm9q2aHSreP0+LNkocdMtihzMyRcS+Za4GbCrYcwKorzxuqPwy3j95UC8VuoAHGcuoQHLMlBrYfmt2BVSvgcShJ34/mvEF0jl7ER98x3fMzW83yt9Uo4KKb2bu+f52UK156AoRA6U4aOp94P+QHU7bvlB9IkiNgRMTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854594; c=relaxed/simple;
	bh=PHLMa4XZVjmPRjtdmBXR+zEWA0beFIl9FbfG/7boLNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8i8NU/z1k5Ox5xh5waXNFe2praE3Y+XSuCYIo710510Bi96w5X5ZKGKTTpv5OYXIzLalhQ9wnZYlgVR3kzBsRMblbXr/UQJx2Bh6vbWXzVWiv/tgBmsPUDSrBxHr1IphkCEoTxyKcSXWZsQnmwb2JM76C6qAXHD7peKuf8v3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNmtb0nA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNmtb0nA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8861615e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854591; x=1788459391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xVBS6M97uJu4LLSv9OF5qRTcgC+W4QPIoPufud/sHo=;
        b=BNmtb0nARwSai0CU1zbYHFYaJxXpMppmYBImePevuzzMchU1S1kiHEkF/AmFx4+gnK
         gYOjDsPOUX3km6EHD1fqMqc+VHgPKdnU1tEXH1czuB9eqNQyq7nPpcz4iJe/FN4EabM1
         wAEilHA2ZJWa9nSwlzt5EeX9XrOWrMtVeofJhoikkWMiCMXRvgDz0NAslX2132kPh4v+
         RUvKQb11tl22RE5HJBuL5llAP/aPQIIelzLXodrWgfdlNsAzOvzSRFwt3NSkbBPKFREo
         1LV2AdBFN5g3hbu5I8y9cJ+AdTaE9O8HesBD+VRLuPVkg+PvAZLQo//WGRoKABKWjntC
         4ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854591; x=1788459391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xVBS6M97uJu4LLSv9OF5qRTcgC+W4QPIoPufud/sHo=;
        b=sIpVU6umILG4a2UXWsGpzS6J/c3k4piNF23wEEfvHuEZy+/n3jIS2UTAFC8YChtznF
         YfJXtCF3tRIJkfRCqBmQrC6asWFOfL6Rzyi/Vs4WlTqDunrTDEaXmUKao6X3wqzjJSut
         xGlKS27sMUtJFSj5/7Uk9vfTOz855iD9Bfu+y2hy9Boj1pJ7S/6WhDDQan5nBOkaDGYB
         FXNMOg7YuwNiZ+bNeZyd8UlMSHwNGORNVyvGXe4iQepcf6EVKhNt2mcAxXWE/U4wLyXf
         UDwjqUsyTTAtT6Cwu7O0tDN3skT2nBkaZNKb0MJRBc9EKh0c+176BpoE7hBHZZQZpVMz
         rOzA==
X-Gm-Message-State: AFuF++mCKQvLYo7EkxzCa/b6YZS0WvIAmYzl4oonN9JAr2AHxUv29PdR
	ry/Bf4hJ09V6qNKIkRv/fFPsRzKAPWdrWmE4gTO4WOrAU5roABCq/q/lTbQyakD1
X-Gm-Gg: AR+sD10gd0q5NpLKfykY9WJjxoLaueYj9B5xyK/DuJCs1QxBZj445EA8jvsEHgWXb5T
	cVTMu995zUAM0GfrcaXLPBHBBgnfN3KU6CNw8Mk9EfbAsaxQaAlbhcLNV4pIsnQ6+l0V2dFCKfJ
	LnQhN66DGeapPvQpNoYG6FWnNGnQUXNrV0Kb629MRjV7GGCiPLJLF9EofLGMzJlz1/pCpbMhoMH
	shkjRxcDlJEoPqztzz0qdSEaWRPCf47Be3rWCh4zHFV0oWZUIwY838w4HNCbQDBlGLxVeeYrD7c
	IpotkWF0GbOQvw5Wz9yCZDBUKEzf3Z1XzuENEWsiFIq0B1lHZG9vU8Q4MzAfec8du3A020LQJLR
	D+Edv+j211MckvC9oIV0MfsI/De2c8lX5pGZmCCgnZbowAyTGRSKJ65SAhxp/hTx95akV8uCrx1
	avodyAutQdwdzXc2gptT/STIs0od3RDKHP+0XD3A/9Y9d/OphQV2qdqUAx7ysb8F5wJdfi1hDhi
	h7NpFIkvVATc9CXSv/wNLxBFf4NdY4CqgK4c65gBsRQ
X-Received: by 2002:a05:600c:55d6:b0:49b:914a:94a2 with SMTP id 5b1f17b1804b1-49b914a960emr24543115e9.1.1787854590678;
        Thu, 27 Aug 2026 11:16:30 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:30 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 0/4] platform/x86: Describe Yoga Book haptics and audio resources
Date: Thu, 27 Aug 2026 20:16:23 +0200
Message-ID: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
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

Attach board software nodes containing the DRV2604 mode, waveform
library and enable-GPIO mappings, instantiate the TS3A227E headset
detector, and add lookup entries for the codec GPIOs which control the
second speaker amplifier and headphone path.

Changes since v1:

- keep the missing enable-GPIO mapping out of the generic drv260x driver
  and provide it from the Yoga Book board software nodes, as requested by
  Dmitry;
- fix x86-android-tablets GPIO-provider software-node matching by
  attaching the secondary node to the matching gpio_device;
- hold references to the existing DRV2604 devices, reprobe after adding
  their properties, and detach the nodes in reverse order; and
- remove the dependency on the withdrawn optional-vbat Input patch.

The series is based on platform-drivers-x86 for-next at 5b05bb3f6c57.
Strict checkpatch reports no errors, warnings or checks.

Runtime testing used the integrated series on a Lenovo Yoga Book
YB1-X91L. Both DRV2604 devices bound and accepted separate fftest sine
effects, with physical vibration confirmed for each side. The TS3A227E
and both codec GPIO lookups also bound in the validated audio stack;
speaker, microphone and headset routing tests passed.

Maurizio Casciano (4):
  platform/x86: x86-android-tablets: Fix GPIO software node matching
  platform/x86: x86-android-tablets: Describe Yoga Book haptics
  platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
  platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs

 .../platform/x86/x86-android-tablets/core.c   |  21 ++-
 .../platform/x86/x86-android-tablets/lenovo.c | 140 +++++++++++++++++-
 2 files changed, 152 insertions(+), 9 deletions(-)


base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
-- 
2.53.0
