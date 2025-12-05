Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB6362AB2
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Dec 2025 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960646; cv=none; b=RiVOBMvy/OmUIIWSnUvD9BcZzNCriMBSUwzr/2VhOFp/d3Ymn38u8fAMFcEW6je3MSEf5ZQyHFbJquK54gJUGnYt2voha3hVD9Qf2BqyJiXqf6Ys8HOvYhxD7fSD377vV9PHhlFsutKSkQ4ZFbVIwrPtuvbVZM3uBy3SJZ4vupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960646; c=relaxed/simple;
	bh=6iGgmquBb2OQMyy4OCnTzg1W/C2l8RhX58tZjEEgFL0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cKyOamEFCkmdCEM43+4+GtC6uAPHtn2WH/c0icu0rKyilPn05zgqG4OpTcXH5vB81rRXZXio16LSdGpzVKQrKbdsd6vgUVe5Mk8/PAnx9/kR/yHiXnLYn4PMhYZolgYfb00GXfHW52Bh6utab78y7Rxif0T+7jEcfqnbxPbibeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqx+zF//; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqx+zF//"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64107188baeso2226828d50.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Dec 2025 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764960643; x=1765565443; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VmOeFvGS/shn95dKI0JtWqVywFDHQTTRXmnRsDr85GI=;
        b=dqx+zF//utaPQ+CH9Tsu9TLKyRfWWUjOVgifYF5c7wGrtyc38jOLyI9y5+uZB0q2Zg
         0CQrGUCJs5ajdTP3aOATmTZI7AF5N1/U8TYhXPXkcVjDHuIMrELVKTFWADKbN3RanydL
         NrrKCWXp9qFQXT68vgeZ0Gsfbm+4ePfhtysGwqSaiwsvjvo5N/OFcabV5YM5XsakGzpG
         LDI0/rjRradO2NyQYvjrWZo6yEqifG/H/MaxNB/pl9YxSa8Jm/pmXf7sqFBgV630MURj
         EAMnUqFXMw597UvXMYgb6d9pLd2PtMz1IBdViabpTe0dqIeElGsayQ2XMBI0tNFAsHpf
         qjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960643; x=1765565443;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmOeFvGS/shn95dKI0JtWqVywFDHQTTRXmnRsDr85GI=;
        b=SOctmj9l0cUX0qpGL4FSkbhPuohhoBsfIOlJ4oyXIe6/zwVvg9MG/JNqBQ/J+flB72
         SvWwbdV5tPsWs997NZQF3gaJHgQBShAZfXq3v4xdGj9NbI2/RSqGhY+2BJq3LKCsqk6t
         By/BKGDr52CrsNkQmHV8Hh4gZ1IX0azDjRqYrbrFGD7/bhBWgW1Hgruyx00pV5d5RK4W
         9btQ6FlFvzuZCjtx8nu36rCIsEKNdgiJ2NpY/LD8Fvl2ZpulZkN2QcYIB0lb1enVWPEK
         b31EsKNxpjnGGAQIVB5LU1dzV9oybhIYEqD+MOdz0Nv9v2pGjr7+5Fem6gM2RXJdbU0+
         t9jg==
X-Gm-Message-State: AOJu0Yw2gXsutbW1FqXt2YG/twpVCUd5V1j4/ZLY6RaG1F5c546754IW
	KdfYgR/8GJLmtuqCyn8c3oKbn3FMR3P8Mtyvx1P49P2FOXDU+0+udH4h
X-Gm-Gg: ASbGnctH9YXih00Tr705P5joZvlipS7vjjIJCVyEeKmyASdP4V22ssvnfM84lcbEPxL
	7PkoGCikc+/+UkdMl5Hj62FT+As9MUpTbD4uF6bE3EUZ3IgtF3EFpf0LNNpgfWPFYtixQhp4RDu
	to/vkYq/WPDvXq6+TrpR9LudmFHjDL77kFHjqMbQu/KbHptOInjRKOfAVKRz3TZXjubO3O0LJDr
	jYx41Ui2DuZqPReAcjsk0fE/hDIjuaxpkRa0Tn7rEIilWGV8znJI5k/npiCHk3NVSn6Tibq58Mu
	A03fsSduA1zMn4aSF+aj87csecfxD9dGoF67eLwJR1pNTx/o4QCdER7Tpdpr60z8aYqIvTC6GQP
	xU3yg/51+KrFx9Awh6bidkW9gNsu1rw1qIZPTq7MoLSXtTZpI60xJmdXcvWjYMRO/Hzr52sGe2t
	a15QvBBjKFpVFA
X-Google-Smtp-Source: AGHT+IG61DsBhh1ZgcKsskQQratX9ekKOF2MgGuutbt6NmFhXG9LVlbqb6z7YZyFCrS+rxydsl4mGw==
X-Received: by 2002:a05:690e:1507:b0:644:4771:2d34 with SMTP id 956f58d0204a3-64447712e56mr1909415d50.61.1764960642815;
        Fri, 05 Dec 2025 10:50:42 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c2f0aaf83sm4586407b3.32.2025.12.05.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:50:42 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/3] platform/x86: alienware-wmi-wmax: Add support for some
 newly released models
Date: Fri, 05 Dec 2025 13:50:09 -0500
Message-Id: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEpM2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDINBNLEpN1DU11DVPNUs2MjUwTDVJTVICqi4oSk3LrACbFB1bWwsAvi9
 vEFkAAAA=
X-Change-ID: 20251111-area-51-7e6c2501e4eb
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=681; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=6iGgmquBb2OQMyy4OCnTzg1W/C2l8RhX58tZjEEgFL0=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnGmnUV53fyBCTVFXnPsD+29LN9xazpL9bF2S0sEuZJC
 eY6z7m2o5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACaSe47hryh71vwdM78yvzod
 9G1t4c0DMceiDZtaNW4ZCGd9qT+lqMPw3+t24ZbDa5afrY2QT/spXb2G+eDmI1oclnHxzisCFoY
 W8wEA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi Ilpo,

I managed to get my hands on acpidumps for these models so this is
verified against those.

Thanks for all your latest reviews!

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (3):
      platform/x86: alienware-wmi-wmax: Add support for new Area-51 laptops
      platform/x86: alienware-wmi-wmax: Add AWCC support for Alienware x16
      platform/x86: alienware-wmi-wmax: Add support for Alienware 16X Aurora

 drivers/platform/x86/dell/alienware-wmi-wmax.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
---
base-commit: 9b9c0adbc3f8a524d291baccc9d0c04097fb4869
change-id: 20251111-area-51-7e6c2501e4eb

-- 
 ~ Kurt

