Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF62FD66D;
	Wed, 18 Feb 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451372; cv=none; b=Nga9heLM2s7kiW8thubCb/8+sKUyeOUJXI+j/asTIKsOmJ+TVkk/ImVtp9jVYOyWJ4qJHWKzOHIsHFUqR3KwxtIU9GiDDsL+Srj6792g5cRojq7KjUbHxFo7kRjtL4o1eRq1tsFZOZXG7ka54+f+lBt5W+LvxJK2z5FMqKe+LtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451372; c=relaxed/simple;
	bh=d9B4emxrv/CJtViO57fedGNKjVf3vwQI+JFeSXKYe4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwRkn/4f7G76L2aniPkr8+kgArrN3BCZewA/C3g2x8L6CXd84lbvDiVslsghgWbfcXrEZ6eBqEl8fDQag+OXsvUO4s79vMjr9SslJnwol2XHP4CvONdabTusKQGwtbXLcHHc9NOEEuDDWWkH+8EPpPcNSY9shO0YR5KoEhwtDbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=oUb8ij9k; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="oUb8ij9k"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 8A6245E63E;
	Wed, 18 Feb 2026 23:49:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id AD11F5E5FD;
	Wed, 18 Feb 2026 23:49:22 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 608A31FE9CB;
	Wed, 18 Feb 2026 23:49:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771451361;
	bh=GeIpGx2SPwbBIam5Hfz8EkwUhqcnrY3SBhO5xEiJTBM=; h=From:To:Subject;
	b=oUb8ij9k6+8TCN9Gkp8mu1mmbcEUIY8qtea9oQlFGxzWynh6s1cPP0aZZ8DG7+xle
	 nseKtER2zpRZ5QwUL1qjocl6WOgxIxVHMqVmRzm42jdt/5t0gnP5jJSbmO9ZJsG2Ak
	 HrN5IJGpnRD5lJzRACVzJJ69+M/JTfyntp8STnUvYCi2XuQ7sK0P7qrrpE4JH6TO9m
	 hDPvolejS3z38omP8BzMDMOYQYMfTRSjbfx2hpWn2clRkTfC7C3ECFo2+UWD8Aw41J
	 VOlo6jQaj9UPnjGEqofeISuxQqpyLe316f53iRdNIJ80H2JyHgEKIHDo/Xp224R0ec
	 51OB/aiF3dWKQ==
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
Subject: [PATCH v1 0/4] platform/x86: oxpec: Add more devices
Date: Wed, 18 Feb 2026 22:49:01 +0100
Message-ID: <20260218214919.449636-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177145136187.2900385.12863326973986908731@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Adds support for the new APEX model by OneXPlayer, as well as some other
devices that I have collected over the last part of 2025.

I am still waiting for a verification for APEX for battery management, but
fan curves, fan speed, and turbo button have been verified to work. Should
have it by the end of the week.

Antheas Kapenekakis (4):
  platform/x86: oxpec: Add support for OneXPlayer APEX
  platform/x86: oxpec: Add support for OneXPlayer X1z
  platform/x86: oxpec: Add support for OneXPlayer X1 Air
  platform/x86: oxpec: Add support for Aokzoe A2 Pro

 drivers/platform/x86/oxpec.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)


base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
-- 
2.52.0


