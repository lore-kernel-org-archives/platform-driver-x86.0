Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530022;
	b=KmGcd8ysi60E47kX0aCPDTILGSxj3EDQ5WbWglLMOnIE7DcRRlZjh8fgLcmw1PvDxmEH
	 8PZL2RJ1WXhP0VOQGJVLjnCSLlVTD+y6SXCFcSdTOIFVImssTvEOuSqXFUUUf44j2YL96
	 pe8EOlkIRyw/7aHnsdVoynBGIdm7Ivy3cUo61MyEhoSrwC9h2FQIr/aLDc6OdwwBwBSnG
	 gTpG0SYwM/Dxm8+UHbNj/gdB1vUz4c0NhcjVlvln6+/z2DEO+xuRe5KgGz/RQtNtfZKLs
	 C1qj2wFnAhxDMY4nyUyMmSdTxGBCOSvShNXB0DRbbFK6tDuIExcTy7YS+pUgJ9oHfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=hqMFp7OoaihnU8SvIdhdeXnsjyjS2fMQMMOIfDJThPc=;
	b=NlGFCE0iP9KnBwFvhnF8C8VCqwOC2Y3iN7zbrLOnqpvz7lYm48MMeq531/BokVZjA++2
	 0NsOKV3QC1Ebe2Q+scGK8bjbKHdq/TDlHBIM4mjU90X4azeUjIamCohKutpZF9U2z6MJ8
	 Lz8Tjgwt6ILv3gDQReOwcsNalJkaS/Zf0Fek22dgI8Cc5Geh3RzunBIEM1eZfZ4AP9lHq
	 zxb7/J1H1VWmde4T9r+h53UjLII7dBeDpnj0J8ew0JhH8KcCC2xd55zNvf4uV3rabwLq2
	 yCmIVnmRi22M/Yx1doxF6/t4DUJSewoECOom4/E4MDJq79X+inStYDrRrU/eaJ1EdwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMyzMMgo;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F29606A338
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 10:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F29606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMyzMMgo
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so21312865e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 02:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530020; x=1794134820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqMFp7OoaihnU8SvIdhdeXnsjyjS2fMQMMOIfDJThPc=;
        b=dMyzMMgoxz7oJACKph8xEWuaqrJKYCGA9WlXHE/rkVINGGmcpWoadzTxxGpjROCj8y
         m0o5xGih1eEtO7+IydlNA6ibzyL3dnkR9y5pGuNn4W/3MuOLzLrlRTswTRGPHwUuQ33P
         wxjiRMozLBjqwe5Ayk1dydUutBzLTPRMwjB6eEKu/vTNcNatIZ8gAJMmFa+etbwFwjLf
         NjWmXTdy5RIfpfj76FlRgqqRII4zS1j1AJkhlh+ehpej7x4SJrpAi67Dl3hv1pHytrTV
         KEoNeZJwAyM0koJaEVsl6TpYOBp5hQVNuOClY/A8qCEBZnvnSW4dXWMjFFVMD/2UScLc
         sehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530020; x=1794134820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqMFp7OoaihnU8SvIdhdeXnsjyjS2fMQMMOIfDJThPc=;
        b=m7YJUdj1KxLfnceCh/y5M1WlmAecYXfdon+jWuO4K6OUC2V1jkPvCGQEBTlhwIGTXA
         oPs9hjsiQbXokYmMQYvnmiO86dEkiXL00bHtMljlnwnM+XmqHks00/mvuUwxHivRfDd4
         oqEjLrfG71LHillDbDYllooilI9GTRrZj16oLWsJTGtlZGhpl/n5tbSOD9XThbk3u5oC
         EJMIqs19YKFbbbuQnNOQ7GBWfOZ8sPaZzZ/6qW1hv79ruI9ItKIGUZ0Ey7TxBIGY5mLr
         q6Sx3uOfwrLCjGBnNwy9fQgTW1y65gAkYPbJzYG+7qM5TQF55AVNygY9uSxq/FA04XlQ
         0WZA==
X-Gm-Message-State: AFq9FYI50h/RGOdGSrAz9E2pnFzq1fTgmglaUXNser4AH3CCBKmQFE9q
	Ijpo/fUOYwU/0mpWH5GJpmqBiiyHwJSeRCRP+AxHZLVywcZO1ZW2D/J3
X-Gm-Gg: AYBFou1Qx2+892H3i8yp9nVcPh05GOTmHzVW9ugiAnPJ9IEhxRyt0gz2xUi9iAZNqeS
	SP1by2AVZ86QXFgUcHGAGfD1Ugg3ekElivOz5SIJxrIYObGEpZO/pYDuIBoM585/EvLmuS+TLDA
	DCA9z/vIGuIZPWKsepDpwwvDEPod3ztYkEc9FpZfHZFLI82cR3X8GQ86J0p8xTTTb4wpWHgFQwR
	qnAEfxDKrP969TZgEj+PTl4U3h9qopn4SW7SxobyprQE1VbxFTB0Maeq+KgCaebJHjgEygp4wOl
	6aDO9xKOJmnYyiAgAmF6lmPcCJwGW0NjzR3SRtXo6/4CRh6qzKGdhMSMIPwWNqJnbSmTaUL/eiA
	4QoRSiwsZHbJXxbezNTCX8Ls+sBY+jH7in+mbEO25bM0jUAMVttkif4N5oVNr1zhx/12X425yG7
	YijbOUrz3ZwUPkVVPfY4fHfDP28LiohqWy6YCsfqYYUbZBGvuRIQs9l+NMbdgGKgetw/1aDMZDB
	z2yduwZLU6nZ1tX+Cz24u+YZfXGRGughbnVPBul3O75j77Se8oTa6Cws2m7oJUhKFr3rH1J7+Gv
	Ik5Vsrh+GNgrf840Ipxuyu+/GQQ=
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr156760555e9.14.1793530020382;
        Sun, 01 Nov 2026 02:47:00 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:00 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:42 +0300
Subject: [PATCH 2/7] Documentation: ABI: document the ASUS custom fan curve
 attributes
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
Message-Id: <20261101-asus-fan-floors-v4-v1-2-b8d1c31a99a9@gmail.com>
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

asus-wmi has exposed custom fan curve attributes since 5.17 for CPU
and GPU fans, and since 6.6 for the mid fan, but the sysfs ABI was
never documented.  Document the existing attributes before adding the
firmware fan floor tables.

This includes several embedded controller quirks: point Z is limited
to the temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
degrees Celsius, the EC clamps uploaded thresholds to that decade
while reads return the raw byte written, fan speeds step without
interpolation, and downward transitions use 5 degrees Celsius of
hysteresis.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index f9825c6150b5c..775ea88625c0d 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -238,3 +238,62 @@ Description:
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
+
+What:		/sys/class/hwmon/hwmonX/pwm[12]_enable
+Date:		Oct 2026
+KernelVersion:	5.17
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		Enable or disable the custom fan curve of the CPU fan (pwm1)
+		or the GPU fan (pwm2).  Reads return 1 while the custom curve
+		is enabled and 2 while the firmware controls the fan.  Writes:
+
+		    * 1 - enable the stored curve,
+		    * 2 - disable the curve and let the firmware control the
+		      fan again,
+		    * 3 - reset the stored curve to the firmware defaults and
+		      disable it.
+
+		Enabling validates the curve: temperatures and duties must
+		not decrease from point to point, otherwise the write fails
+		with -EINVAL and the curve stays disabled.  Writing any
+		writable pwmY_auto_pointZ_temp or pwmY_auto_pointZ_pwm
+		attribute disables the curve, so a changed curve has to be
+		enabled again.
+
+What:		/sys/class/hwmon/hwmonX/pwm3_enable
+Date:		Oct 2026
+KernelVersion:	6.6
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		Same as pwm1_enable and pwm2_enable, for the mid fan (pwm3)
+		of laptops whose firmware exposes a third fan curve.
+
+What:		/sys/class/hwmon/hwmonX/pwm[12]_auto_point[1-8]_temp
+What:		/sys/class/hwmon/hwmonX/pwm[12]_auto_point[1-8]_pwm
+Date:		Oct 2026
+KernelVersion:	5.17
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		One point of the custom fan curve of the CPU fan (pwm1) or
+		the GPU fan (pwm2).  _temp is the temperature threshold of the
+		point in degrees Celsius, _pwm is its duty in pwm units
+		(0-255); the driver scales the duty to the percentage the
+		firmware expects when the curve is enabled.
+
+		The embedded controller binds point Z (Z = 1..8) to the
+		temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
+		degrees Celsius and silently clamps the threshold into that
+		decade when the curve is applied, while reads return the
+		value that was written.  On TUF series, the controller steps
+		from one point to the next without interpolating, and a point
+		is left downwards with 5 degrees Celsius of hysteresis.
+
+What:		/sys/class/hwmon/hwmonX/pwm3_auto_point[1-8]_temp
+What:		/sys/class/hwmon/hwmonX/pwm3_auto_point[1-8]_pwm
+Date:		Oct 2026
+KernelVersion:	6.6
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		Same as the pwm1 and pwm2 curve points, for the mid fan
+		(pwm3) of laptops whose firmware exposes a third fan curve.

-- 
2.56.0

