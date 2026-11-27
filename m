Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.46.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769357;
	b=nURV2EC3hIAr57ibHxNkabRlKbBomrdWi/4xn9JKRHkpv1Hh8PuhVjwlY22iQRRQUJNS
	 ALEiI2S2Nmv8A3B6JMLnxBOY6lnYT8FFAYY05yylTwyJvE3aaYuskPKxYnGy8mQMbjIXR
	 EXNybsiGPw3KP3WacZOHTIRCS0sZbP/2AvQGU6LMcS8tQkVhp5yJgELTcuRXK79XP48Jd
	 Bps+GcgP+v4+RujmTwczwthdJSG/UQjkvj8IfZgpI3BNueBRMBAuQNsveER+LqxLJysxw
	 OI0yOZW6Viy6x6miUTvngPs8qHU1Z5ExRBtgIBMfjOaPW5RDoUwJk6S6SJQHw1xU3aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769357;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=Qpg3+IyjjXZz8rn5Pmt07Gcef7W6fRnRi3A9mUqgmMM=;
	b=pzXpiOZJYgHAj49dQlvhGESQnFO/AouO03lq/CyfekibWVOet+kPSgPMeMoekQJtGTjO
	 kxv+ERk3dbHPfqGl4PnLwXyoABSYcPn5AuY5n6S/ES9VoGEAIxhyDE+HvhmtmYW0AXXf6
	 c2l4KVB8N4+PAzX5dO0QFqCaGA0lhmjCPD//zX95FpCBKo0/anf1uYbBshmr/NRKkzott
	 DvLuPmdy3aoEpwKJ+9Q0v5OHgy+T5TPCSE7UG3Jsfe/ZEKswWLIc2OIREaPfhR3qqMpV9
	 ouHBZf/r7vohX848oZqsHAKxANaO6Xrwmv5aYSauTIcCZUXipsnuXBjq3M/kL8VapGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=NXqOf0Z2;
	arc=none smtp.remote-ip=178.33.46.10
Received: from 4.mo561.mail-out.ovh.net (4.mo561.mail-out.ovh.net [178.33.46.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39852606A681
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 08:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39852606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=NXqOf0Z2
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.54.111])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4jbRt10pgnz5wyR
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 08:49:13 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-bntqx (unknown [10.110.113.124])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4E30DC2A2E;
	Fri, 27 Nov 2026 08:49:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-bntqx with ESMTPSA
	id 3zMOCghECWtv1hQAXudyjw
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 08:49:12 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0043b4fcad2-0187-42ff-8b59-53cbb559db0c,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 09:49:07 +0100
Message-ID: <20261127084910.3355833-1-filip.golas@3mdeb.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4902449670733361135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTERgDH1wtn2aQmW7u1TE/Z35QbX8WazV7XieAr+Pb2q4d/9+I6TFTI+j9AVTXESVjomi7I+kQ9mS9nZE9uqjCE9yphG0p3wcBVKfhqP3OUm8dXZ4BGeKjUig6mnzEAiEbuR2vY3Eu54diMRxqGBikb1VD2nVtw2ZcURh5uJRmiiAzph08vl7W1Pnxq/bUpoQi7F1SRUxbXRBTTRu3TpsIlcNBWFkbO0uGuXQ3+/cp6bZmzW2/tGWf6EbMbJh6G1xGz0BC0HAqLS6iuqUkRClqBU19jqxQRMxZ5RIaWvBbZ03CZavGOgO/WEjjQK2RLvcx6itTPCHl1GhLRCc5bFJfVNGn9IGLztXC4l2dAVoau14Z4ovyMGJKGi39VW6DYn8tHWpnCYZE7NQZdWMknTenbC8SoLqo1kfbWxhzn6enrEdw6GWei19ZPgnHWmygCs+s9vuAR3C+FfTP4znrV8sE78uqgU8hLp08n8/LOAQrxAsunNM/BF2RtHCFvpJu8jCdd3v67IM7fCbd2Gu6bfnk5cMX2MmzQwGOb+QQdWxQegX7iPDSR4hqli6yrJBA8RnPLv0YZVw+GPgWfPlhcxWZSeoO1QjLSG9F6WVnEEGlQFxtAks8J8vw08iTVdSDm7UFKWYLi5GFJBS52/rG7whq4yVbj0HuscwI9Cw5Y1Oe8CXw
DKIM-Signature: a=rsa-sha256; bh=Qpg3+IyjjXZz8rn5Pmt07Gcef7W6fRnRi3A9mUqgmMM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795769353; v=1;
 b=NXqOf0Z2tPP4KviMZ/urBeTjGPTwQ8GLVD1HDQof+wzIkIdbrL0m0ry8ltQsRxMaoftOCYB2
 3qH+84ykqquiDYGvP7DcS92F8TceE0PBdNTPOCJ5EZY4pbv7TXoGN+BRiDtwOcKaJKdyDKOc8P6
 MZM5tpvgIhCpOoo9nL9zg4VOfM3axay9q/b5nmFjvhFWPDM7DnAlB06A7J4QW8UKEU0kJm2OO+P
 XbWg4QjMCxHtlSdi3oi3+4U9Erq6lwDChDpJGeEXEMeefi3UqJUN3nx8sxyXC3EXTYUjSJPuxi1
 ikOOGRWEWeSry1zDtEtECUZidcEE3HL1TKU7NH0xHAMGQ==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Link to v1: https://lore.kernel.org/platform-driver-x86/20261113074347.2301465-1-filip.golas@3mdeb.com/
Link to v2: https://lore.kernel.org/platform-driver-x86/20261123105821.305527-4-filip.golas@3mdeb.com/
Link to v3: https://lore.kernel.org/all/20261127074518.3244152-4-filip.golas@3mdeb.com/

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 413 +++++++++++++++++++++++++---
 1 file changed, 375 insertions(+), 38 deletions(-)

-- 
2.56.0

