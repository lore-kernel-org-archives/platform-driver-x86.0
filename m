Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E0D36682B;
	Mon, 23 Feb 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871423; cv=none; b=MDUqGsTzJAmaxCMLZZjSJRJRzwdtLp5bbNrmXs0QjLQDKR2UyEoJSbf1KZM18sXhD4aCMlTO5XYfe28F+o/Bar1lJAjIvW0DLjRDp1qIlNsZXVuRo4+/YeJ7oIFPxVjdGwFNY7aHViX7TuUbqs539GB34+2EH9iU+VBjYiYzU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871423; c=relaxed/simple;
	bh=5n9k55j3CT5598K8B8vBY6stMjcEOsdS7hN9ikgR2CI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHkFttg3N2MkE1R1bqgImaoGfeHpFJaHyrV4dHH2uLY+KCvAUuPZ6ThuPR7Rh2zuvscmu39otAsfWQk5lMjZ0aCWmrvJf8mTDmjp+U/mK94KefMvwPQw/AFEH9rRanV+NxBzLwvGDg8iQz46ccNT/b2ULoMEUa1eaW77BJSzvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=L8KLk6Xh; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="L8KLk6Xh"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id C1977BBEF1;
	Mon, 23 Feb 2026 20:30:14 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id DE560BBF79;
	Mon, 23 Feb 2026 20:30:13 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0032B1FD767;
	Mon, 23 Feb 2026 20:30:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771871413;
	bh=1JBdONbi6warzMOeIa5vSjfM2wmhAX+qQZoGlS61TUA=; h=From:To:Subject;
	b=L8KLk6XhxzKrY+XtRmbDi7KOWK79HCuyrdn4xCYzT+8FbVqVPDwmtp8UnZkYjQ4Xg
	 X1l55ltokaTXfYld0MlwEWboycol1JMF2zmPG02UqEYS/IWbkQfxVRJbT9vIYKw48N
	 aanLlQ6R54zMlm4pyj60XMK7sbrXhmYS1bRRs1Puh9VtPe2jJw/X7QwH3z5lDiMzh8
	 gJWn6DGIc8Qw14/QwxB0oNmeud1W8lTNCvmYT7wbzbDDej90FcAOyIHMpQTYtmBtYy
	 U8u8ZnqlOQW8ssLCL+qkNY4Z4i5dPSx0Mgokt5C+lvC3IbohrK186LWS3lryPe4XHG
	 u9JuOt0cWXsnw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 0/4] platform/x86: oxpec: Add more devices
Date: Mon, 23 Feb 2026 19:29:49 +0100
Message-ID: <20260223183004.2696892-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177187141355.873602.9625271989191255355@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Adds support for the new APEX model by OneXPlayer, as well as some other
devices that I have collected over the last part of 2025.

---
V1: https://lore.kernel.org/lkml/20260218214919.449636-1-lkml@antheas.dev/

Changes since V1:
  - Reword changelogs to be clearer

Antheas Kapenekakis (4):
  platform/x86: oxpec: Add support for OneXPlayer APEX
  platform/x86: oxpec: Add support for OneXPlayer X1z
  platform/x86: oxpec: Add support for OneXPlayer X1 Air
  platform/x86: oxpec: Add support for Aokzoe A2 Pro

 drivers/platform/x86/oxpec.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)


base-commit: 57d76ceccee4b497eb835831206b50e72915a501
-- 
2.52.0


