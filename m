Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E208A40EB99
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 08:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227752; cv=none; b=dbqLPr2V1b0HZTjCHgTxSXp4NGzAMWa6ggn6SzEpyGfC2gtUmcMcjS8o27FNW88JjFaonpVvjMIoJ0uIZlU5mcHzMcyM+L8R0jS7idh5fPFWdQo1AlBExu/gkPRgAFJEHcvOoULglh1rY1iqRU1nETJcn5MBYH4OhPiFzbXDzGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227752; c=relaxed/simple;
	bh=azw4cWVx60tZteYkG5HNewmD7Ntg1IsbrViFle6npqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPavVIe55H5Mauoj1XrPvyx99Ks3SY7AUkJj5h+hmSaBLN0mq6e74Fwij+Ox+Lj08BWG8Uc7ZaAaTULJexvCyw9RfH0Se6hkh5ibemkBpRblf2HD47eHsYC9fWF5EDLSnVEOELm6Yfm2+BLO12k0Qesc7vcGzfkmMBE8w4kOQic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBNOApWz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBNOApWz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5084549a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785227740; x=1785832540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9G/wxWEeNDzEUMqOff92eWji7LEVF9MjxurifLY6lHg=;
        b=GBNOApWzA5fykrYGzLnf8EbAZSiM6rZg3p+MHV2wgS1QMDw3HszRr6HkhM+3i/PPaz
         BIVLTW/fISrkN35srmLpjiL0Zgo6I4Na2qR4vgGgZg3Az/F6wR2Sh9vXHm1J+ShE0gWk
         dO1Qqp8APnCMsmgJm4jKkHjFKuuksQHfyRpcCeMJdLVi9Y6jBU7I+JzUbMm+0FCP8wjf
         P2c3mbglk+k7hKhgFGfiQo5cBDvLsNDiKOrVtEPEivHOXqmZ5oljGVlHOlyZtpql1/KS
         xPzrQ14Vcp/XcBSJlPVK0kjfDuI2MY5ZaKzVV21fGmZtX74wj29t15J6fXA9/2Mkj5uV
         58Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227740; x=1785832540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9G/wxWEeNDzEUMqOff92eWji7LEVF9MjxurifLY6lHg=;
        b=cpgeLT0b1kJFoOBTX1QBe7Bv8bKop/czIEUYKYgBt9govZtboEjxzycO8SDOneGUE1
         zt+8wcSyd7GF4SSaV7XuaHOodYrq+Os9SJilIEO1SstRZoESYU0m8yJbb0ByWkohCknJ
         tCmTmGee24iLDUc8/yJOCvWIbRaRJGREfdaDdNAnO1wpE3QnRaospjtL5YZvI3akFz/E
         6P7b7Q6/Igk0ZezdVw2yOgJIUw+c1/mDU4QvkJCB+IXeSX/guExg0eeuzdOI7oiF+09q
         e5Csx49766lM13kTlWYeQmo+mC9ScW+WINPiy1K1kU9CRRsveMp6YWSbZ6Gfk3PI+aGM
         WOmg==
X-Gm-Message-State: AOJu0Yxwes47acRuQv5ltt+mr3frhD5z+Bq7F3wTiE+96uqnraxEZvhg
	WljkuVZRl70+uAtk8glWyKfDeFNwzdV/SHCNOumtJIuWABPxTJW1qRVBa8zFD3SwWUg=
X-Gm-Gg: AR+sD12JMBR86fJ2qzhCz4b/bp/kL2xWlM82SS8i8yRcj33olhwzKmtLFjf/JyoOxi4
	oZClMq9JnOUas4jej3Gxw1UB7izi5/aAblBbaHn2JV3pMGb4ex5MMLJSnXnhJkNobbtRP1rlL0S
	eh4fDLjETiK4srDplfIrs3YI9UBHCXbmrwVvFOzq4mOEstazMXXhrmPF5mKG0S3MKomwY2/f1Rh
	5CT9Z+SntcimbCo0vXfeevb/OoBVP9YwL7aq0S+oHl1vxPSUwLL0iMMK8CmMirbELnoCSzjqR8M
	xvr6joeaCj6blmJlU2HmDHSo9Ell6EOOmYhY3wUpadSV0VDftLiipOTB6SsM3hrRHqmBVuEnQZz
	K65c80eLend2Vo6RM7WMWPrfk/XQSNPb/RazlIvz6cjI6NaQ4UoOvbPVtuWk37AOoH6XKbsIKam
	/ENEk=
X-Received: by 2002:a17:907:72d5:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c1f71b3ca4cmr64666666b.0.1785227739670;
        Tue, 28 Jul 2026 01:35:39 -0700 (PDT)
Received: from fedora (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f19ad49f1sm353753266b.1.2026.07.28.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:35:39 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev,
	derekjohn.clark@gmail.com,
	samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: oxpec: Report tablet mode on OneXPlayer detachables
Date: Tue, 28 Jul 2026 11:35:27 +0300
Message-ID: <20260728083529.329772-1-begeebe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727215947.118292-1-begeebe@gmail.com>
References: <20260727215947.118292-1-begeebe@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OneXPlayer X1 family and Super X do not expose a firmware tablet-mode
switch. Add one based on their detachable pogo-pin keyboard devices.

I checked the EC alternative suggested in review. The Super X ACPI EC
operation region covers the complete 0x00-0xff register map. I captured 30
maps with the keyboard attached, 30 detached, and 30 reattached. There were
no stable attached-detached-reattached changes. The named ACPI fields KBFG
and SYSK did not change either. USB hotplug is therefore the only
attachment state exposed by this Super X firmware.

The X1 keyboard ID was taken from public hardware information. X1, X1 Pro,
and X1 Mini systems show the HAILUCK 258a:001e folio keyboard:

  https://wiki.archlinux.org/title/OnexPlayer_X1_A
  https://linux-hardware.org/?probe=517a6d5085
  https://linux-hardware.org/?probe=98267565ff
  https://linux-hardware.org/?probe=21f49ac935

The X1 family is included, but has not been tested by me because I only
have the Super X. G1 is deliberately deferred because of its different
keyboard layout.

Ilpo, comments on whether oxpec is the right home for this functionality are
welcome.

Changes in v2:
- add the requested Assisted-by trailer;
- split Super X from the shared G1 AMD board ID in a preceding patch;
- support the X1 and X1 Mini family using their folio keyboard ID;
- use driver globals and board switches instead of platform data and DMI;
- keep only the USB scan and notifier callbacks, with matching and reporting
  inlined;
- use generic keyboard vendor names and place the IDs beside their users;
- document the complete EC map comparison.

Alexander Egorov (2):
  platform/x86: oxpec: Distinguish OneXPlayer Super X board
  platform/x86: oxpec: Report tablet mode on OneXPlayer detachables

 drivers/platform/x86/Kconfig |   2 +
 drivers/platform/x86/oxpec.c | 116 ++++++++++++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 1 deletion(-)

-- 
2.55.0
