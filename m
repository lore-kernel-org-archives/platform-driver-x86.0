Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=15.235.45.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363021;
	b=mRlihNdWrNU2N9mg5EcBbACk3nzDL3RDm95yMjbdz60gkfdhc0OQRUbQ96KdV1Kmims9
	 hgy38Mi5uYObAj82x3wj8d+zpvLYWOavEsOZro3f1wR4R1StIsPhU78Yv+NPeeBsDML9l
	 25DaGXOCvLsC0uGgonaN+avJuJsM1a1//qcv0z39ymKfsCSD1w40U0kci2uYWcii4VhBH
	 eolXYLynSW9Gx7CzitJjEVRlskV6v4KYdosigRpxAgjaYcC7Q4Xbt0izFTzefkBLXu2om
	 9huvwTdx/28c1MikiO8ihYvOJ0TubVI4mWw88vzBEgWCZd1HN5Hynl+d7yaEOoM7jnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363021;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bljdDP0J8cGmD5Ze7ZSDDjJrcj4ZS9RwkHJlhWIc2yg=;
	b=QkuR0kVAr7hZTMlidHEhG+4T76INzp+m4KYqm0V5uGEZT23kE7MgmE+/L/eIm530+n1U
	 cuJSWQNz9T9dGZKQSBaJov+snBnPASIjwy1EF9TeKo26+XEq/K8C/acwqoN+PB/bD2Xnf
	 5gO0pBjr//xHwf1GJltDLHfE/EWmVtTxG2kGA3fdSBa/QnyU5V0n0IEsWpmWXhCGWozHW
	 D7GHuIYdyKvKZ5MCGcJYmuG9zLYyxs3rIaJ9N7wuyUXEMpLn9OQ4qtyW5PpczTncJvtj1
	 8d44HThOSaUdL+PWwocxXTTwku1n+Y0sYL2Hn/s98CdD72F8rlMz6QivMqGPo9BorwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=petermarshall.ca;
	spf=pass smtp.mailfrom=logotherapy.ca;
	dkim=pass header.d=petermarshall.ca header.i=@petermarshall.ca header.a=rsa-sha256 header.s=mail header.b="imT/S0lK";
	arc=none smtp.remote-ip=15.235.45.126
Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B426606A321;
	Wed, 11 Nov 2026 02:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B426606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=petermarshall.ca header.i=@petermarshall.ca header.a=rsa-sha256 header.s=mail header.b=imT/S0lK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1794363013;
	bh=HfH7duKrrnrrYTPCewFBc2T2XUbHFFREaVLbLPKqtg4=;
	h=From:To:Cc:Subject:Date:From;
	b=imT/S0lKWSEEgtwChNjp97z3AM5hEJUrk840uAOKZxQ0jOjUdJZyVDqdEGI85PQnc
	 mhSsjKIOPoYyEYEeI9NvuWUDcFTNA2Pbm1M9mvrcWUa3oe6G2q4lZsFo3BPyQynX4U
	 6ELWxtYCOtim0Er5sNQPLe5ulFtIseDs9EscIzOHlqJ/AFOB3UTGYF55fZc98nQ5cP
	 4Ee73fZ8VkHePHBjRL67SBXdEwjWvgMUPwNlzxxaXXWs9BjXl8sQqv4riTZc/0ST5v
	 E2haZmbsUide92kVSmYjf1Y0M6KBr5UkMos5Mz8bbMRimQDD5wnCNMoLZV/Vv5rHkX
	 IclV+KvJpstTw==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id F2DC820554;
	Wed, 11 Nov 2026 02:10:12 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: [PATCH 0/1] platform/surface: platform_profile: handle fan standby state
Date: Tue, 10 Nov 2026 21:09:15 -0500
Message-ID: <20261111020916.3557508-1-pm@petermarshall.ca>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch extends the Microsoft Surface platform driver to signal the
system's standby state to the SAM, stopping the fan during PM suspend and
restarting it during resume.

Without this change, the fan continues to run during suspend as if the
system was still powered on, and takes a few minutes to slow down and stop
as the chassis cools.

Tested on a Microsoft Surface Pro 9 running kernel 7.3.0.

Peter Marshall (1):
  platform/surface: platform_profile: handle fan standby state

 .../surface/surface_platform_profile.c        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.56.0

