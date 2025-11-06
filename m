Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A72316198
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429828; cv=none; b=OgqEkamtU6chI3kfEQiUzeh4LPU6YZOn0FFs2UoGyRV6rYw43120Xu1d7DX5OHx6Wf0L3mtpTn4qGzhCOezaj/nN0DTUdwqQmCyrWdibPJNLYg5epSTPBG4VwSO4EioPTBp9yYah/TTQNZ3Sj+oezTlWaLQJ0o7c7rQ5e3wz9y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429828; c=relaxed/simple;
	bh=idiaX/gWz3AMWpxv7MKcRO9NN2Bi6JEpnyrix7xEc9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEoQg5DaF9bfkYAaf20DD2AZw1mFSJAz6ISEs6VdEtJER/Tqrc+weOtKFWgMVlNBCwuna33GdMVVEcD+p13bPjpxFkIwLz79g6XcAMEy3EfbmkmzQI9mbAs0NtD9ZdVkQCsQKwJjRRri1wdIGxUJAF3/reSh7wScZXVh4SF+wrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYWmk6Er; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYWmk6Er"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c82bf86bso620623f8f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 03:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762429825; x=1763034625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWRuUfqKu50X0ukGeF0JwsNbtHz7uehy/BvMEtKBGMQ=;
        b=eYWmk6Erz8RKOmlsBZOwlOBYWd8yshM5lYg4s2fshznyXO3Ufd/3L8CEccmLi6oUGL
         ioHip9kEgGqynyrSsJFhjS3Hl8IOzgzMQGaxSxKDmRmwqBh9KYNFerJ1M+l9iwm949fT
         /XHlDcUfc0rbdO5zNTKUGk5kCy2USR5j/d8Mz1WVgjdGaf1B8qRK7IzXbL28Bg/ww6nh
         RvbtzuAS/EV7kcQUlYS9o48N9qGwlA/OztbqdN52Rp2fSMtFaMQs5NVGqTKKUyckq7H2
         bekfN5/WRAMXEyee5U0SN6ye3q09OMo46s229mcBgVkmv8TQtfiOaX3hKIqhKAkPELol
         lgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762429825; x=1763034625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWRuUfqKu50X0ukGeF0JwsNbtHz7uehy/BvMEtKBGMQ=;
        b=rYWJMFRH+dYuAimNZiOgXDg8yLoZ0CSrcJRCDw1MJArohyM9s2b8Eeh7mdP3NXs8lC
         AyMUrux3JxX9QesRezn3W5OosZ/2CZOmOOw5zOvhU7VV9uAUOKjFPUYVP0cWFXvBdZu2
         QJrTDpqK2oOcQcj+lucDTF8/G/qM53aqORWj0L1ZO80P9Xf58bKREFPjs0l/E+l9ZIhu
         Lh/C74IjK6A10URr8h+a/Ieqto+ekM141ztKsDJCbOpDqHoYAFbTJ0+HFCObGzZYTzHh
         hFjJy6sn345ljP2jJakYUFvwYJjI+N3Rp+D9X3Z/qqz9Wowvk4R2IZhVDsKoiTkWlmo8
         VDCw==
X-Gm-Message-State: AOJu0YzjEx2t0uT3yMiUHFIkNPi3Fzci8aEes9GttkocrLL/8irjQbuH
	Mp4VkWPDx4uXMIvbW3tbLSIBJED5qrGuJ7VJ9X8a36q3UYTc1IqvHMliTmDmQZ/1
X-Gm-Gg: ASbGncvj+NeEl4KcJKRrBLaH1sWZitkHaGsGxUiFiayvPkf2yCEQ66FE7ApvE9Zjm3i
	raBSnAIXDjiqfhVq8B4BMFWBrWuBuq+/aed3vA434bJ3E2gTzldQW2aT/7VyOpKzoT+DJZNzbwE
	LHOyikmOZWvGNdMd+tVz1ZiDWJdsVQ0bY+rZRAjO3m4Pa32tDiCvEybxTMukeyVvPKe086P3z89
	LxNqFI27QE2Bc9GXPusM17vJxHcotcpS5Y/mL9HSkGsJXWohFUc3m4NBKVhRzVEYq+JIhHCeSSw
	5sIus/PDqeM5VY2kxmFRB1WhC6RvuGL51L47gdZbLNRY6J6WvLeU8kFFixOpTQGkjq4//rqrKPH
	Uv2ptZncjz20SMMLQjC0rIC3s7dXL0bqPu7t2q1PiLgiWCroJLKdTTHEeM/qa55Xdn+OYFZ/lAh
	QaumHEueO04lmP9f0PxSS3lCXXhAwknUvkQ/789rLK9XQDNM8w
X-Google-Smtp-Source: AGHT+IHfD5rSpu+N9VmerWwWNiplM719kFbGUdnkOgjVG0Ga6zoKscXvQpcnXkl1EBCkaYNnHd+oyA==
X-Received: by 2002:a05:6000:2210:b0:429:c66c:5bc9 with SMTP id ffacd0b85a97d-429e32edf3emr6986855f8f.27.1762429824508;
        Thu, 06 Nov 2025 03:50:24 -0800 (PST)
Received: from cachyos-x8664 (202.red-80-28-106.staticip.rima-tde.net. [80.28.106.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ebdab56bsm4212052f8f.36.2025.11.06.03.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:50:24 -0800 (PST)
From: Marcos Vega <marcosmola2@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcos Vega <marcosmola2@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Omen MAX 16-ah0xx fan support and thermal profile
Date: Thu,  6 Nov 2025 12:50:17 +0100
Message-ID: <20251106115017.77782-1-marcosmola2@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New HP Omen laptops follow the same WMI thermal profile as Victus 16-r1000 and 16-s1000.

Add DMI board 8D41 to omen_thermal_profile_boards as well as victus_s_thermal_profile_boards.

Tested on: HP Omen MAX 16-ah0xx (8D41)
Result:
* RPMs can be read
* echo 0 | sudo tee /sys/devices/platform/hp-wmi/hwmon/*/pwm1_enable allows the fans to run on max RPM.

Signed-off-by: Marcos Vega <marcosmola2@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8b3533d6ba09..270af91dc7d0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -68,7 +68,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
 	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
 	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
-	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42", "8A15"
+	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42", "8A15", "8D41"
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
@@ -92,9 +92,10 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
-/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops */
+/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops, as well
+   as some Omen boards using this profile */
 static const char * const victus_s_thermal_profile_boards[] = {
-	"8C99", "8C9C"
+	"8C99", "8C9C", "8D41"
 };
 
 enum hp_wmi_radio {
-- 
2.51.2

