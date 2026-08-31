Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2151A73E;
	Mon, 31 Aug 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189003; cv=none; b=R+JKXdrEy6OQtOFGEJ9gTqiwjdT8JpGSus3Sfuyn/u3vccHi+QrXpd4bAMdgJrVsdbiVtAHSfrH3pDMifTG60qdPfHwEVNU1int8BavbOa0Q0SDgvauIRaGmbrB3baYOssiwgcMMZ/QNw8+9PhgGORAmG5lfU4bnZK+6j3JhcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189003; c=relaxed/simple;
	bh=k3Sgh6jlp77nv2Q3n5CAW0/AQ3eATa8kbVi/iN+ImOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e9Zie3PbFWLiYTIm7Gyf67/q8bcli9ZViGkz3T3pj1z93R+2QbUYZCPs5FawCICWEChBV1+WWWIf29oO1VS8hiFHGBurtpdHnPkszJ91UQmnUkFcbErqawj9cSBCitvxoDQR92Q+aeTqlaj+MhUwhtmkrSs9dtYiy9Kc2P5Dwj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1788188979t91c88048
X-QQ-Originating-IP: Fn4x0VlqehPaklbz+wQwFxEwTCOqOl+DyOKnzBcXO4Y=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 23:09:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14263417380129783316
EX-QQ-RecipientCnt: 13
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 0/2] platform: arm64: Add Radxa SVC GLINK support
Date: Mon, 31 Aug 2026 23:09:31 +0800
Message-Id: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDWpkZS4ilhUOxgLpIM0EXdXL
 F/y8y8QCkwCTXZBoJOF1yWhyDNwk11GUuyTATUaXZeFCtZHq+R0ylvEATUZU1WQ+i3QwPF7td1
 vOfqZ3P4O4L4fcWj1Um0AAAA=
X-Change-ID: 20260831-radxa-svc-da22f20e6677
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=sophon@radxa.com;
 h=from:subject:message-id; bh=k3Sgh6jlp77nv2Q3n5CAW0/AQ3eATa8kbVi/iN+ImOs=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFlTZxqu7BbWZv78rurg8oPc/0VkvibMWvl/h3d0XaJ0e
 fVZw3bFjlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABNZ/Inhf0ruYoPsjKDT6ZHh
 Wzl0gqa9et6gd63s4r4Ev0cLLL9WajEybC94onZAffGexZybXO8lJF/fNuN7kcaSqWqnhOaqTHj
 jygYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OGq52OKtj47C+V5FLwM7ZcofQzkA/jGWdLAogAztdZLkCHF0e6JYEHDA
	kJRxeRqea/p312RvMV51eMKVEEkYH36W8w8lyiRpyLoIOwE8LpAdm9DTGM3Pedg0FoTf81g
	0UOyeaRyDhU39Ul75V3yXGlNll41886JfNuMzc4au0fyIfzhdBwKlJi0P5RIOrWutSYhp5t
	hENTQ5+zRYaoAAxIRAZsU9J5ji03HuAoAy+tRpXrLzz5GVap1ajFM+9zGGRM6dtx+Jr2E7S
	xTWptHSbzmVeka/gDWHLrPjPz+K1Fn0oA7e+d/D1WJWomKBYe+p/e1dEKlagbVhBX9uraRe
	orNLGIlBssNGOWa7ksVaNoucbDu+BAiUk65l7HCPgCkMamtI7CQwRKRppbfnou98S5FyKwa
	EImT1pQQevPmnXqQcoLdxSGLG5tErwoNyzOi+5VPVJFvPYJ0qWrbWp3G7jNexixAD2NJvS7
	sN2xf97RZT7tNatPsgHGQMbRVBrM39ZA6CrMU/fGM4p1MRugafAGrJTe8OggcxcG0DV2LOW
	Wtu6HR5QmJw+hB7ukkC53XflRLfBq28zKW3t9wun/a7vFZRB1Mp5UG6br/QwibsooiOvT3+
	4KEdu/JAUBT2ufAl9f3IyTV7ObvL/79O5gxNpXhGmLI1mvSCoS5t6fJjt0fq66199E+zL09
	C4fsFK/PWTwMdaHyQPe57Ge1abQ78NqtX8cixKJO1c0MwfkxCEjyv6rdaI3PVlVp52BoYRb
	4IRq/Tar8N1uSrex4WyhHaN6UBdsXPB4TiQOB0pPsPNwGWhANn+0JTy4K5OJUvPx0rPeNxs
	quXpJweW6bbZFjElNwUOEAfCnIAmltlM4aPX5AQjCRAPzAewhmmVFkWkaXI1cwLlc1ASjJ+
	UH5mPt7sohoAt8Daj9kIrFQb/UgX/ZjHEBHhpVFfUMBJkbsfBuXcyt6kTb2804pCWaTwSYB
	kxnVjK7+34rosmAw4o5xfCxOP8MpMR7WJz4LmquwxW1ui78E37mRqlTeQ7LP0SUeAnNvG7V
	S0zei5ppE645wZrH+fP21gXzz//LKd704SVnVmX7+647meiY1x5l3uJw0EoSFc1si/e91cK
	HGcqexn+EczDJAboGcVJqw=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Hi,

Add support for the RADXA_SVC_ADSP_APPS firmware service found on
supported Radxa boards using Qualcomm SoCs.

The service provides fan control and optional temperature, voltage,
current, and power sensor readings. These functions are exposed through
the standard hwmon interface.

The firmware SET_PROFILE operation only selects a fan curve and does not
change the overall system performance profile. The quiet and performance
curves are therefore represented as automatic pwm1_enable modes instead of
using the platform_profile framework.

The first patch adds the rpmsg client and fan control support. The second
patch adds discovery and registration of the optional firmware sensors.

This series is tested on Radxa Dragon Q8B (SC8280XP).

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Xilin Wu (2):
      platform: arm64: Add Radxa SVC GLINK driver
      platform: arm64: radxa-svc: Add hwmon sensors

 Documentation/hwmon/index.rst            |    1 +
 Documentation/hwmon/radxa-svc-glink.rst  |   41 +
 MAINTAINERS                              |    8 +
 drivers/platform/arm64/Kconfig           |   13 +
 drivers/platform/arm64/Makefile          |    1 +
 drivers/platform/arm64/radxa_svc_glink.c | 1205 ++++++++++++++++++++++++++++++
 6 files changed, 1269 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-radxa-svc-da22f20e6677

Best regards,
--  
Xilin Wu <sophon@radxa.com>

