Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D131D750
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 23:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371402; cv=none; b=YyqTY/IHINd4VcUATUuQUmhHLow0U8HR6SXwQRRy85Cpyd5GZCtHbDx/gMar2d8EpF64C/COQIq7Jkf8HkOQYD+J/Z4RAI5/ItQhuttS+Ai9wBaQFWxvBTSkIFGwpYd7zpPG9tuMXZERHGhBLGwAf4C54zRJ38ec4WUZvYbCzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371402; c=relaxed/simple;
	bh=sgIpvh+m9Wz9/nz+rdz9lGzM13kJCd3D4TAIzE6Rl6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byltDgGqQBg9Y9sKIFb3zpE5RDfmFWmb72CKE0imasA9S9xEJWDoDv87LBPwtGDopn8Gb8odm/IOcpzn/4oOHxZyLNyDb+SiHteGt2pqqHM2uJZ3xOwLXCFUIqvDJeDxl78ur63EC5X6Nojuupe9+fwvrNwWRvtfcSjUD8gOCUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cn5xeq78; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cn5xeq78"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so6897388a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 15:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771371386; x=1771976186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QA6h+mIm/9IU+L7HW2ojSJobzTYQGIQhMs1G/Btbfyg=;
        b=Cn5xeq78JPYL4CUmEXyNpkN30s1qVW4G/epPPpCMeorKcZecmWLJz2proUXUWoc4VW
         lw1QqrIZiqNY1X9hjXhmRj1QQ7ukEIq4Xyb9gfkHocE4+SbMrWM4rqg8I+LqdysV7tpj
         hv/+3WagvSsDGKcuK5EekCw4B+A+9hyLGZhsserd7e64QsfLJ+l3XL8yYPV+L/QsWVO5
         bfYc//LJJpL8ADxrLympPbEq+tYwC5a32TFjKj0aOnX9TZcLq+ay3j5FoVj5wEVpwNWD
         ckzJq0jTsgEiGD434W4SSCdzTt4GiEeZ2RlXjSaDA63NWnk2tDONOucWn+47y/kCC6Q4
         WwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771371386; x=1771976186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QA6h+mIm/9IU+L7HW2ojSJobzTYQGIQhMs1G/Btbfyg=;
        b=D4btyxAbUvETUUOibqqdiAFMgbcG5hMg3WS71P20+JbJ47Wu6YjK8HyahAvs39Zsl/
         x61nFG2tsZZZEfF8LVaAEnQx7cCYgnD40Zd1WQwp0reK8iGH68fXquVsCl7zm539hEu9
         PGQeGjBSvR46H7aU3UOhpjn/iL5P5vJZI+pLu2sRnE2TpQD+fRePtMKQgIbvBHL8sQfr
         U0jsajYIzdEIo5DNOws37ifliPN9w5k6BeuyXavvE6Ap9SOLE612J7ak3rxTIgubcEtN
         8yI7pEW2RRC+ifm312ofW3p/V5ZV3+IISgx4F58ECFvphQPz4ruk6ac9REfOjuxnLdWh
         EmEA==
X-Gm-Message-State: AOJu0YxXPCaom3RNtjIIbkpBXZvWMvbdv2L1QXvh2xmPCmGMoSCFCBNC
	vh7BYStFEvjr35roE/yWdYdfS+SaYZxL1KG/QZ/UJocJQ68WGfYmIyzZRVVBNQ==
X-Gm-Gg: AZuq6aJTi82Wxqcj0N7xjHxQ9qzxuoK2LJN5ewr5LQ6OngA0u/2B49t/eBgTHhAktL6
	KomW7HcwbfdEoY8l0xSYJHwC1ln6IFZH5O+OSriEGGMoDvkpukECBVKUz4jV++SXpZQoeZYvPvE
	fIb7lGkjtQPI7f9mO8Jxo3rMTeH4eWW2KEunWL9yCD6KEvbI/5l+rSo2XjxSIypy5gtWYn9ZdXE
	kATXFYH9hVl+pji/6/h+5aWbEnl36ug+wHgqBr25HwPBjMbb9Qc0XH0RxEMHeIV7f/oG/Fh0ip2
	kS/3QlAmO4FVs4ziDsB/OePrjzSmzBMkqKFyXDIkiX4nVhV9ODiMBXcSEMcqT+ZGpDSzoQI8QlD
	M0l1XC4P6hTtzu/crfqAV5bhfmASGiXA+kFNf6FXEvtRcypN877o90wk3LKehAg8xZG0qNlgqLT
	kxjzwxcA8lZiCxbs9ocu1b0mEM
X-Received: by 2002:a05:6402:1cc1:b0:65b:ec2d:e60e with SMTP id 4fb4d7f45d1cf-65c76a484e4mr93756a12.34.1771371386420;
        Tue, 17 Feb 2026 15:36:26 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm2858775a12.2.2026.02.17.15.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:36:23 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v1 0/2] x86-android-tablets: Add sound and haptics support for Lenovo YB1-X9*
Date: Wed, 18 Feb 2026 01:36:16 +0200
Message-ID: <20260217233618.1324550-1-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defines I2C board info and properties for the DRV2604L haptics driver used in
Lenovo Yoga Book YB1-X90/X91 tablets.

Depends on the drv260x patch series [1] for enabling ACPI support in the
driver.

Defines sound devices for both models: rt5677 codec and TS3A227E jack
detection IC. Depends on [2], machine sound driver implemented in [3].

To simplify the sound driver, the same set of properties is used for both
the X91 and X90 versions. For X91, software nodes with such properties are
attached to the ACPI nodes.

1. https://lore.kernel.org/linux-input/20260215141435.727872-1-jekhor@gmail.com/
2. https://lore.kernel.org/linux-sound/20260211002255.4090440-1-jekhor@gmail.com/
3. https://lore.kernel.org/linux-sound/20260217231324.1319392-1-jekhor@gmail.com/


Yauhen Kharuzhy (2):
  platform: x86-android-tablets: lenovo: Add Yoga Book haptics entries
  platform: x86-android-tablets: lenovo: Add Yoga Book YB1 sound card
    info

 .../platform/x86/x86-android-tablets/lenovo.c | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)

base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
message-id: <20260215141435.727872-1-jekhor@gmail.com>
message-id: <20260211002255.4090440-1-jekhor@gmail.com>
message-id: <20260217231324.1319392-1-jekhor@gmail.com>
-- 
2.51.0

