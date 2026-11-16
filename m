Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873328;
	b=0wQZSfoQfaR5Giv7bj0lGMXXQvlvzYLRF32pNXWyZ3eIWuFbcPy5MgfpA7V0tbEf3bkk
	 Fabiqw/kOO0/W2XV9jC/6wIjF7+MWTvi19rClJEYM9Ezget52JHn/WIuMfh+YSUKr+Xcz
	 hqKb8/mC+HSy/IhQb2Ih608AFYm/7rOKztxmvFjnl5h8jKZQtVu5OoTRYxftpzyAWRUa2
	 EyxrnitjM7hdpSDdIlCwDIlKALhVoXE5rb5ZIyOAeK8jKgx3y0Q4+BKvP/tYW//3jy/+x
	 kBHwSwsXn4Yb/j1AN8f0spM2OXy7K2bV6XghaWeX+dtmQycm/aBEQlMx6Lhev0J48BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ckCbddSccGn+TCw4/9XDo5VD+jZbU6iRbkZtTKkyKJc=;
	b=VbB3WRLQpB1loEAk8xtMiu0jWcuG5C/QyGYdBZiFMqw55zhXx8S7yIc5qXNcMGZsJorD
	 BdBOdM0RI8Mrh7pDt1Mc1p55nZAMckq+I4sC/7ALS0ovDMx4pFEIryK2FEGG30KqxdIKa
	 P39HVKYBoF5Sg5RVK9kNsb/uAMoHYANHGbcyc1y6cyh7t0rh5LwNTwZiLRd98lrJ9Wq8D
	 h2crKjRtrSdBrADXnnB6y7x53hrNnSZ3946qvnYaQiqPsw4r/Gs+jJ1jcTxnTBFr+dKFV
	 nmK+fHh8K0VsojxtN9/nXL15Ziie6b50eusbfuBdHXPV6lvceBgQybU8TjNBajIkMfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C977l5Iw;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87E0606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C977l5Iw
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso4886714c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873327; x=1795478127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckCbddSccGn+TCw4/9XDo5VD+jZbU6iRbkZtTKkyKJc=;
        b=C977l5IwnmG1zEO6uIvIBHzsdrt3fn8Vh10gp7NOtyB81eDM1BW6VwJnhGkL91Q6d5
         j7zdIGznF0evnrkY0oAMyGMbk18n1gbfedRb/CbHhAW98RASvAUqJMDwwYQUjpUurSaP
         aaQF0HCtLhaL3Ap8vb3ntbD7NdrElb6BBVYlF9YxIl+nW9QQuJUsIsB1kOXuXLvm6mE2
         hqpc1qFUPQtNprb+jkGZ6bMUIDpl3mdU84Mev7MHor4RJKx9yIBgWJXrRlPTWudCML2I
         M+g79v3sKL+ACI4xqtCjtUzFG5GGa+pgVhC5FkpgMh3zMitxdIRCP+3pqBxjIqyOc3jF
         j3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873327; x=1795478127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckCbddSccGn+TCw4/9XDo5VD+jZbU6iRbkZtTKkyKJc=;
        b=oI7Srjhjn1WKA0gDYUobuFljPHuarWZ4nl3dtZxD8VsAhL66plXBz36yEsvkoymuT2
         3Rqeoqdua67LdGOon4uRx7kUpcpbbmDaSh+exw26IODvw/3gwcWm2sidsM1PPelbCDEW
         h/2UZZRaK7kQtNE9FFcQYO+e+mrh+qYn4lZ8Hpti00mXxzGW+ho2iy7AkaS3ZYrEJ9sG
         x1RGUCD19ECK1JWcO9++iwHk1qI1Rzq5h1CZPPNZfG1T4JhpphmM/uaBZH4ZK6oGqLWh
         jfd846I7X++gzIpYKCRHbmFEZeMbtVjyeXxCsIt/aOVKEIcY/WGSe6Emozm7pahjLng1
         OnyA==
X-Gm-Message-State: APuU4Z95NTeIJjDlYSx50+fc5eFj9wHvMLKhwpSYxK/bdPqPKsxzl/Nx
	fN/p7EyeFscSHltyhqMOfdz0hil+2OlQBhdiAmdnefMx8BZWpiAXWHLl
X-Gm-Gg: AZFdTZe6XwXQZvRw68TBS81zjzdOC5wj4pzqbr4OmAxyE8dMNt6KUhUn1qoQJ0IJ4Zt
	bnTtiYrS9VE8T/KAtq8WY/aulP2qMT9nt2bopo0yXs9iHSPxgzuEJWFE9hY1GnCStvxFZWgoP0a
	iHIEdWJecK6xD6xB/drV/i7WFnh/Z815cCoIVHQ+zs0KfWT6YmvEsJBJdF3s0jya6Lsctv9Vupq
	eSLyHdjfr/lSRIra2rmfqpxhJ6sczdT04kaJXnovpa2XrPVvaVeh3sh+KN6MX+WTexGViCp4mIg
	Hs8xMUiAtgJIN07EBvIIFmj1qK/+ka3zYvGCOualN4OY0sjVGtXJB6G3A00UFAT+wmE7C6C5dTJ
	qHRAYdzJV7fgwu/bu0pY7sLYKW8Tbwgm+T0lM7FCd5iCTtkr1oZ9x1tE/dhKp6mcbitn2/K+Fvm
	azxU8Ye7WdT194SICV/zLt9yQceiDn7duBJJQkYXqhdFUpsNWXxEgKVbaAAC/SUdoLtf7BBYn7J
	RM3Qp5vRN7YABMZ12i4l0RxA3VuIj2dGsq5zb5xf58mYskWjS5hJidU87LPoxojrrOAfo6Dn4Jg
	/Q1Vj8IsMsR5wMkaMjVY3G9Aozl+EJA8N2J4eE2K0oVLONZ3KflDF+der6MC/M6H78TEMWNKEub
	YlCAWJ2vt2wuvB4R2hGWUtv6dE/W7ngg2rBUQEx82CBXo79qpDmK7RXTWlnhwgMavOaBQ/LRY3g
	wWPg==
X-Received: by 2002:a05:693c:83d9:10b0:36a:3453:a356 with SMTP id 5a478bee46e88-379676faa73mr11482783eec.36.1794873326922;
        Mon, 16 Nov 2026 15:55:26 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:26 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 09/16] platform/x86: dell-smbios-wmi: Don't unregister a driver that failed to register
Date: Mon, 16 Nov 2026 15:54:53 -0800
Message-ID: <cefad161a3107bfa117ab99f89311edc8a04854b.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

exit_dell_smbios_wmi() only checks wmi_supported, which stays set when
wmi_driver_register() fails. dell_smbios_exit() calls it unconditionally,
so if the SMM backend loaded and the WMI one did not, module unload
unregisters a driver that was never registered.

Clear wmi_supported when registration fails.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index 7a5c6d7730ab..e126fb4f048e 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -308,12 +308,18 @@ static struct wmi_driver dell_smbios_wmi_driver = {
 
 int init_dell_smbios_wmi(void)
 {
+	int ret;
+
 	dmi_walk(find_b1, NULL);
 
 	if (!wmi_supported)
 		return -ENODEV;
 
-	return wmi_driver_register(&dell_smbios_wmi_driver);
+	ret = wmi_driver_register(&dell_smbios_wmi_driver);
+	if (ret)
+		wmi_supported = 0;
+
+	return ret;
 }
 
 void exit_dell_smbios_wmi(void)
-- 
2.56.1

