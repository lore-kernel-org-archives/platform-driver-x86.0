Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.109.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555894;
	b=15w5Nwj55mTjppAQYo38bqPFPeL6FH+bAJ37NaeEl5UFkGzlORP0am/vssKG7rJ428YQ
	 GqGrTHixJZmAXoSasWiG0fr3u3wB+10SHp0oQ6NwLUSh7rpwAg7Q2T+4yxqbBLfycxmXq
	 edJNa1kBJBreHibp1ymUoQ9XXy3Lj5wVHZo6eljO3XbFttQ+uCYsRa8yO9dr4eqctRFjV
	 kIG7o8QygCEs1MeIiuffY3h78XrA4VeO7QxavdQD0LrPWgdNBWDRQwCmhUYGW/d05Hqlk
	 gGp8OJskyNqPzIoXq0kf5W4kx3X06C77mmcK9hDYHIhN3uj1j/ho+0PfyM9fVyr3Lsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555894;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=geFjrhTrW/m8F1nN4gMrD2uUOWJQ73zEFUUwYTOtIgI=;
	b=zr5NM6pnJMUoPayNiS52yGlVTouq+wd1fPPj+z5c60QakLvgsoFaIq1QYIEJ5KcKFuFr
	 tiyZ4Qp+XURI3KA5YfKMAYQtX8JeLyi+0BiWv7LbM0p5GnKzzspD605lHo8Nf2MUTkj/J
	 f5xavgxhjgGbq0Idn91HtojjWy953byiQRtgifZlsjlmhirx63LrkXdniLR2yTbBN+tbg
	 CjDbsYjldsuN7Gny6kBvaDDAnhvuOoYqRVkZ4YagE7+kImLtaQvpQA914oKLfUXLxv3yJ
	 nR2/2Hi4BJOz2SaiZ6ME0EnhAshm68udplfuMlwRA2/dM31P3zI/ZcLEIjbforn2MFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Ukxl5whR;
	arc=none smtp.remote-ip=178.33.109.111
Received: from 2.mo583.mail-out.ovh.net (2.mo583.mail-out.ovh.net [178.33.109.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB4606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Ukxl5whR
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.154])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jQq65102Hz63Vm
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 07:44:45 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7045BC0105;
	Fri, 13 Nov 2026 07:44:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0035fd8fd59-fd24-4b76-b524-baffcc7691da,
                    F6EB7A3E9421D9EE3A955D9585EDAC62A977302C) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:37.47.248.243
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 13 Nov 2026 08:43:44 +0100
Message-ID: <20261113074347.2301465-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 13829710031199793135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGasz4azIijZcfQ44mRKseIDVRsJQHwcOwAbF4H3kx1SQD7h3hkz98gtOrr6Bng12qdsgmykVIz6lNsTPEFTmCD6ZK/Twk3VftjDcXmuV/25X9lwtOXhEMu52cE4AcRJk10sROmbG3Sgoi5fj+FqSZZhI3aMxRSsr4S0nblorxNaY6siLWkJ7gI7glRT5NcyzvfFnpqtj1OIBpWxKlgKoO+J1IYkAc8JIXvwvTuryUeHm1rK3hjDDSowqChUb86FY5dKt2QiORJ+XCwNsyKe87PpN6xwRVIJhlLPfpOxYH/PkgjadnZkuPXF2x+ZPDWpHRNbIJxa1RRHueD5rSGnveNpEAeL5V02yVQrpvAFr4e2fFgVoXqPlirEopcO3PwrXbou1ab78rlp+qnKcvYxsbeVPJbgRR37GnBn3IwRBlotTHrpmPKoOd9MM1xUKncRcpERR3eYrMuNydrJIl7pysmnMjuXP6HpuTeIM41o+yYnyp9tePAuAq9LWwNE4mcKm0AvwmmJwh5ku28PGgKZGBZL97++cnLfzBDZ5q/iNmi7mQnspTS5EeveYtLc3fydKZN/0cPVg+Hhb94lLfAG+jBTqrI5ZuXr1B/AgWKXbuxg96ujATquxjfkSWTyU9I7uhBHEBexw4YhNfyFAMnxOULHnxO/wvp9k68YUC0gvu/PQ
DKIM-Signature: a=rsa-sha256; bh=geFjrhTrW/m8F1nN4gMrD2uUOWJQ73zEFUUwYTOtIgI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555885; v=1;
 b=Ukxl5whRcGvht74lukK5aNZ2blRrCJrKkkhwNnyy32XcAcy9E08Ygu2tmMCNxSCu4Q09NU8+
 eAemVeV+FDFB3+hWHZsKfQG6HxRae8v8Y92O7COhncwCXdhjxwnX/0Mthd6nHoxaSmmg2LEMnx6
 nsXTqltJ5Kyly8YtPw3oaoFL2nXHIdG78cFJnyNXMh+xNhJiqkXHjzC5nmX7SSADO8c8QSCVr6N
 ySTrtpu8fOnRrUNhMxRLQdO434xZ8TYktROCwZ3K3fk4TlB/iO0Io17TL/0+S8EeHzEc1ScG5oM
 OBDRJYkE7kb1n7TGFc74kS6HC+qv/z2t5evF8X178M/zw==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 317 ++++++++++++++++++++++++----
 1 file changed, 279 insertions(+), 38 deletions(-)

-- 
2.56.0

