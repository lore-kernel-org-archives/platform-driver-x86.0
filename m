Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2041D120
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800373; cv=none; b=d9yRG6zLvmtQZ2oPdG/HDNg+lDrP9viwkgh0V5CeanKxWFlpcYD4C9PLp5HHZCBYA9OfBDPO41lrcGM7f4472aWEQ498+hywzhw7JXBlsdFQ1sChbnaCsw5P+EEqetCTlIzjwr6+BwfsA1XNLsPUtopTBZK0WxFDJ0Qc3laQkpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800373; c=relaxed/simple;
	bh=FzePQHlEPWRZKRkjCI9DVfH999wh2P3kGecIiN7Wjvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+vFDdSpJWbTKhGknYIJfl1BNS9jDrzDybAYAR9GqC8Hy9ERkW503ud9DVMs8Rvl1G5s1A+lM5afizd775Dy5Ne2UXHLyQtqRU6D1RmVNs4oRDW/ZK5Yhoo07DfebdV/PISfMeCLp69MKZFk+ceMCaanwFg9In9y5hSerIF9MTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j06RS3Uz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j06RS3Uz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so24749505ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800371; x=1787405171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBgOSVuw8spjvLbhAcWL9ijCscqSXairX6O31hylohY=;
        b=j06RS3Uzu6tAT4CjfUf9lGr+mmyd5I+WX+TKmJnMiBLYayQ60bHRxY2R4aDz9IGMMc
         AoHAkPUIzrdnJZDAkOo3s3tmSoSzd8fTQCQWbeUCaNtifoNOMYIqalcOWgk61d3mKgYj
         eGn7FltFQg0Cjg1hDYn1tSanhJjkwzU/lvX08G+3wFVrCwwVKhJBKS/OQkplSyT4dpqe
         NOuDKxWN1+qIg4A+qWNbtMUuOTskfd08ECYqLJxEfAL4vLDOd4OQByFm29HQxs5Bo59D
         e3Rp4JNuzJZkwgPY1keJ7bnm8LqnMx8x6YiAwx0Oi5iglGLeuWv9Zaq1w/ze24gCakdM
         TIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800371; x=1787405171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBgOSVuw8spjvLbhAcWL9ijCscqSXairX6O31hylohY=;
        b=elZGJP58qE41j86luUl+DUOZZdC07cwF1Ld5rJdxFScjaL9XZSvY+CT1JQpiK3V5dS
         KeKlPPRMnlZoY7PK4zDlsATAYJOzLMbARBjR2FR4b6RSGOzj1Jz90SUDD79N/QzATe+y
         Xt2efeKK6758Pugf4bzIUUVoN+xKqFazW1t49aZnii+gFENpmsOb9MGqqJotrbikwyfE
         HsUcF83Q61Y7OYf0E7L6Rv/iDa1zjAwUnQATJOJer0BqbD4D94dPJV7isnFWI3eCoHA5
         T9ChBJyPh0Ye/rFeU1+RNBD4cwEnPZ1BFI8c4dCC4i1VJQFFKoV/cxXduEedcmXhSDIR
         mJtw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy+x4cGaMUo78lN9JU+Bn4ftmhthT+TwTd/2yPExSFlhj2V0XULwxB2auv9sppSBn1R6np4vXrSGUba+SWMwb1ZrbJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwXuvy81wYKkVx11elXDhdMJ5NgQnKaK5YvgMY0m+fWpNexKtQw
	pocCDNL2wFH0fTM/321eIZQl7K+t34JjIY4fVndGTGmICHzgmdwi+ObT
X-Gm-Gg: AR+sD11wJL1WiPWGFckQ3btiL8MGZl0WUdfSpVPqxkEuXnOaNl6WVPHGNVJpGGJQLJd
	bcst5GnzyFsaWBmX6trHiUzEacf4qfeZ0V8AgQkEZ3OZsvLnzwN+Pb8en/fOm/mmzY6uTe+nrSd
	JD6tWRv8Mn4dUd2lNQ63fF8I8Uhns6dTmKUnSFeN8Z0rF/7Bfu37vpP3aj1CvOnrf729NiuDJmy
	0FOw00OifBhVOl6yzOcVoNIzfrAI+HiabyEEKr7+idrVSQJJRI2/l/5nDpwMMLMeR62YLwCI/dE
	3lJrcND5FhByJRJjJb0BdlPdffVwB7KUm6Cs/839oN5pUtVA0ziXSzuO2+3oKq+f5qoRvz173Mb
	EZ7drUV4yxQneP3p/TwdWri6yanAFbfr+o/lJibcis4AAUS30wCTqlLfG+gkVQcDaL8lEY9iShk
	ClN/C5xFUmIdfy1u4pimAlokZQCvsrHrBGWJg=
X-Received: by 2002:a17:902:e952:b0:2cf:b23d:77f with SMTP id d9443c01a7336-2d3b0cc05edmr145190755ad.20.1786800371371;
        Sat, 15 Aug 2026 06:26:11 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm19433245ad.72.2026.08.15.06.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:10 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v3 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Sat, 15 Aug 2026 21:25:41 +0800
Message-ID: <20260815132547.29022-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations are not verified on real hardware, the operations are
reversed from the proprietary software (XiaomiGCommandCenter)

Additionally, this series cleans up the redundant Kconfig/Makefile hooks,
updates the MAINTAINERS entry accordingly, and introduces a newly reported
mic-mute hotkey definition for Redmibooks.

Testing status:
- Fully regression-tested on native Bitland hardware.
- Redmi-specific logic blocks are compile-tested only.
  Feedback from Redmibook hardware owners is highly appreciated.

Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table
  platform/x86: bitland-mifs-wmi: Add Redmi laptop support

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 -
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 559 ++++++++++++++++++++----
 drivers/platform/x86/redmi-wmi.c        | 154 -------
 5 files changed, 485 insertions(+), 246 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 967a69120f57273e2ea4396074eceb0daa35a9c4
-- 
2.55.0

