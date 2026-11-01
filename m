Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530026;
	b=Zr+tnCn8yqAOOmQlaoLkByESwKR5UBhZ/VOTN0FpIF+KEuIXiAB+zovDQ4eWH3pXqFw/
	 BKcaN/2VVKIPQzBm/YkFnLUj488LDcGJtg4dbBivUyYO/mJQmEauWbouU80/IR6wNkU0A
	 G4ahagw+PkYHYVlW5XbLvx8AdME4asOze86trjvQLbxry7HK4XG6PZ9L3JMAgdRVGUTb8
	 Qeq+m8R5ND9IwuPsv9OZe6+auv/mlaGFEySM/nfvLpzdT2Yc2NVLtzZv2TCCxOaRJm2iC
	 nkJu8ekFb4Zs1un9ilA8X4nuKn5bxNonjwVuARGkc8S0Kp3Dpv5kfOij7Hu9O//N3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
	b=ax9PRQf2hY1qKRe18TZKDUjXwhljpcoYlVvu1hs0yBzoxkxEAeaYjFBNfXdE4CKtuAIy
	 BvOrFYJoQR37C54I99WxptOUFb42d5lcmVfC04/ytiP037OXn6qTp4sHATrbDbfyTerX5
	 LEfG39X6SmXQx0U5KqpOHU1F1pog1dmuckizMMvEtK36NDTqqgm+EROiL9Xx1HE6kAxGD
	 SOqc7yEHrDl21ZKBnsP7kPRsQnnNSMQsmLz2bAygPmeyrhgfFNyO4xHSDPZA0qOW8kpVO
	 WkAfhz0PVXkF95Cs96WX1GZwmLoAEoQvzeEE7Rbc6W4f0Q7q0Aepj478UXwD+7n9A4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LRXwiP;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C42606A326
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 10:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LRXwiP
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2196858f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530024; x=1794134824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
        b=M3LRXwiPKbhRI7NfWThStz7qRQ/Q2Ot3G7Ckyrd07GYSGdOwzz5SawmvUxdoRb0/Vb
         TdewXzl1VPTSIz24ImXOJvjnDl8EyPSvY2r1Uz/Ne2f4aTf1dbs7zJ0s2I389z6DK2wg
         KwQJExxbCjWtrBMW9Ih8oNmFkPMq9mxv4vsTCxPlr4EVaqz0XDGgS0C1XCK4iU25lWLc
         vnsMRIJd9393z/ze9oL70LhbK7h4edt0hIwsXCrwZUI55DztUh0ofO9WtHpIeHLezn2C
         ittmTLRIFSqjS/odqePkaX3NPLVlmBw0AUoRdSWmkLf9gldE/n8kTmMUEEvJgq+KcckN
         nyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530024; x=1794134824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
        b=lmDr4TMgv3pvrUUJ5CwwELKYvlFdlIv255f40Y3ZNbzqjL6MgUGHzsMDYn3/Zbhdpn
         cMfxdKp7KjpkwZBnNytaa9uw6yZWqjT7u2GO6b6T/n6SyauUMcRavyEUP+uqG2NEmBRi
         mASHo38sCY7WE0eK0DBM8exQTN6k+kdj19dXhsclG0dH3Ch61FGal2PEWsUrJ1FeHcWV
         vDBpm/I/+j8WPV3blLZBaDDI896TUecvES9nSn8CK7TtU/ED06NQM+MBRofYrefLOmon
         t5uC0cZaquowQw5uCnZbfYQ/WGcjyZdE7RtCGrhPQfwT83kBVW3zO8hnC2TrYk+j75j4
         lKQg==
X-Gm-Message-State: AFq9FYK+kdFzBl8f7iJspjpqKNM4Vl7/l7sZI7ntqoiVYT+5NWoJ+t7R
	lebaNEIy0OUsSjDH1+ZolH0o1k8Yzz5KmbfhxK7Q4jmqHk2WuxO5JiHy
X-Gm-Gg: AYBFou0+ZPvg3WsXB9AELYeWdLjipww/IJrfVIjvPTyUEs3z40yRIVAlXonfecqGC0q
	SpFq4PRGATLj9h8bykg2XtLcFipnNDfShMK6K+VkSs9drDNWpMnUaIqXdDidX4y2yW19T0Jf8UD
	QRkGa3ZdrNfQZwPSX2nbwtCkefMqQ5UJ+M47FyWiGppNk5xGOCnLlAgV8b8Cp9JMtkUBgcxpGv5
	uK8OdM/uB5Wz0QnzkpMZObhwouscOjR87wSKpGs8OESeph4F3vPxS9XcNTGLdXpdArV+aGLwKS1
	2gRXbh8g/RFheVPthV/FDsS4akcmPBrYZhPhu6CAgVlQ+4Ic+2p3WUBYhxu5tc1kJ5isL5gNgcy
	SjCuRLXFFvn8/ZVswlFB/WV9s8ES6GM/NOlyjgCRx5RGCKgg8qkE1IZZ7H4olaO+Y5MU5jn7YIy
	1zWDgIpG2HgVZxLO5s/6Sjk05b+btpfvIZzKGZ2CaFSPgfmtSBJQt4heRtQXS7qNdyfsmlxB4eR
	CyISzcsD0laipwoMmG7h5pql+xpxJsVF2YhhYITlTuTc9OH9tUiyI6EQRg8Lulidkbx3ILPC0ux
	/UCp1ovtsgIC/qf39jk+yFUPIUU=
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr149859905e9.28.1793530024067;
        Sun, 01 Nov 2026 02:47:04 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:03 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:43 +0300
Subject: [PATCH 3/7] platform/x86: asus-wmi: define the fan floor table
 DEVIDs
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-asus-fan-floors-v4-v1-3-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

On some ASUS laptops, the embedded controller enforces minimum fan
duties on top of custom fan curves and reports them through three
read-only DSTS methods:

  0x00110026  CPU fan floor table
  0x00110027  GPU fan floor table
  0x00110033  mid fan floor table

The mid fan floor uses 0x00110033 rather than the adjacent 0x00110028.
On examined firmware (FA507, G614PR), 0x00110028 and 0x00110029 are
stubs; while GV601 exposes a GFLB(0x28) AML selector, it is unrelated
to the DSTS devid.

Define these DEVIDs so a follow-up commit can read the tables.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 include/linux/platform_data/x86/asus-wmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c81..44189c5e6f2cb 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -102,7 +102,10 @@
 #define ASUS_WMI_DEVID_MID_FAN_CTRL 0x00110031
 #define ASUS_WMI_DEVID_CPU_FAN_CURVE	0x00110024
 #define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
+#define ASUS_WMI_DEVID_CPU_FAN_FLOOR	0x00110026
+#define ASUS_WMI_DEVID_GPU_FAN_FLOOR	0x00110027
 #define ASUS_WMI_DEVID_MID_FAN_CURVE	0x00110032
+#define ASUS_WMI_DEVID_MID_FAN_FLOOR	0x00110033
 
 /* Tunables for AUS ROG laptops */
 #define ASUS_WMI_DEVID_PPT_PL2_SPPT		0x001200A0

-- 
2.56.0

