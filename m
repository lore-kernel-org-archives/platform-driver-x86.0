Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87C3E3D80
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270321; cv=none; b=XtXXUtF3HzmDfQMpGaq08afooRHGRDBgtP4rv4ugRaKDilqeQxpeJsVQBEvyIj6q7+wLzaCiKK+F1Fa94cj4Otnr6L2M1Nu7SsOGJfNGOxVD5g+q7rflHig+QwWzzAGBdctGX9Nxew8xvQF3HL2aDaDTpYfSZx9TDB02AUXneKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270321; c=relaxed/simple;
	bh=CuWf6bIbnFzPU8Tz7ealvUYWxfTcqU+KRdD3Eedm/EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0mY8wTN65yPvfe8qNMeydqeSf+ZoWYK6cxXIAMzfNTmo/yaU2HIU9+U+CLuyVmWWNqvrSkPtmZEvJx1+YUxmDdac1lOjl+SZ1CNNNu0YgtObp1/rfKgXVgeIgwhId4K7/V2g/7rqEqwsRFWiZCm0xswXMMEAsDgv4HD5g7/+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rH66j2Vn; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rH66j2Vn"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so71392e87.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270318; x=1790875118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jaNVgej1eYyUenr+3JdrpjMj0Wif8qNYfBEtB/czvbU=;
        b=rH66j2Vnhi8DZe2aE5pmqmY0YygLx86PGmx3XMD+MF2YK3IDjxuIeQo9OrJtFh0Jaq
         DjIBTTuJUeob7eLfIId3IzTF6vUK/3NziLRe9CqUnaHIvr3LVEiwr/hixKeGXmrmvy4t
         S8r53RSn53YnM2a2eRtwYnsXr3uvX8pDd6j8KjbK51qxkiOmzvFWP+i1ZysX0JiRUSEv
         dfHEWAPhcdywEgEG9T9UUwYIfP/YmeDZsFoiAaMy2+C0b3odsEGBokLnXkIuNC0QDDjl
         bF/4e7ifCWINZBXeOWfGIJKh/xWNSmaDKS4qMDVbRFWgH/bKm+uzUiu1tOjtn8NP5Nj3
         gFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270318; x=1790875118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaNVgej1eYyUenr+3JdrpjMj0Wif8qNYfBEtB/czvbU=;
        b=X7Uipz/COwZaBa2wUWvo7j3d/QpAtPWB4Y4lBXTYgnHWVpqT8b/Vl5SLw1pbuGMwVD
         8/Br9CgvLUpPiQBuu8IU8toF++jQLW3Pb+9EVtApkjdwT5i2tbTDMH+a1UsmsRV4fqN/
         c/4WzRlJLViTfODOB6uFEV+b61AccBkrTtX2yrHmMj/EPmZHkSFhyci1AczddJL58hNO
         P8HiQhgKNGXHhmuSVg751tMfswY0ApTJVYY93Z6pPgbN8/5JyInN5iKLERm3buJ3vJeR
         HEeXtYneDNLepGyZKNNrFx/cq1QzX5sSdzUW1JacCUK1+VRQu6E4MSA8YTWW9qZpH+M1
         R4Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwWQl+JW0fdL/8mW7Ly1sg6dUd2Wj0vfQ1z7LTc9PSO++Oh26b0f++jMShYRfKxC2rXSYlMLA8rIf5BYHsSFdO8gAbG@vger.kernel.org
X-Gm-Message-State: AFuF++mTljJlxWofVyaZZTcrMwcKn4datWbyDBMNQROPipncHUSAHF0q
	nUMkisaKBfwSIZInPCYX00L0bM+mqQoLBS3wmU2az6jDMl9ToNFngbCV
X-Gm-Gg: AYBFou3uJ2C8SqR15gkcJBmHitqcWCaUJcBtawG/X0sj5Eakd1sgu6ZcbetSqx/RVkW
	x3PXTHgOoA/2q9xsgDZN6+NMcjaZh37hZmAiG2dmnbi764Jy88lqlYeN17sGvzg4b6htJP9fQKh
	yqvokfpeJavnptEIxw3v573P9RsaLuyvY/VZuzBMlsxEO3kAiTKHzfi1IWePETpiLlMLNeBlc+S
	KVsW2OixsNvTy1qw64ZNX6WLezeBurhRhDbVZDqSsDi9Guz+usm2kkkLXhXRgGccRwq7+vTuuEB
	orqnBAV6Zu49cm7smyWk9zN+wAtWoHy5yIlNDBnSbIU464kstuGOswNLHR3+24Alg1RmOBzuval
	iq7XeHVfMOdp4eeNTqq4AiuClIQylYSGv+N7qhb5HX3EIayldaqxe12TDpaipPELjqT82MG06uf
	/8gyoDgE7YnCzkO6U06ptCN1NP+UcLX44G5oKA3q1IujgezgtQMQyeq/zQajkkTVUocBX2nyWCK
	1mVn2AfVXhM5dAL8OZOoTYH1g==
X-Received: by 2002:a05:651c:2127:b0:3a3:37fb:27b0 with SMTP id 38308e7fff4ca-3a63bdb364fmr8599461fa.0.1790270317587;
        Thu, 24 Sep 2026 10:18:37 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:18:37 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 0/4] Lenovo ThinkPad X1 Carbon Gen 14 IR camera: ST VD55G1 on Intel IPU7
Date: Thu, 24 Sep 2026 20:18:16 +0300
Message-ID: <20260924171820.1179823-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad X1 Carbon Gen 14 (Panther Lake, Intel IPU7) has a second
MIPI camera for Windows Hello: an ST VD55G1 monochrome global-shutter
sensor, enumerated by ACPI as TBE20A1, with one CSI-2 lane, powered
through an INT3472 discrete device that provides a power enable GPIO, a
reset GPIO, a privacy LED and a 19.2 MHz clock. The RGB camera of the
same laptop (Sony IMX471, TBE20A0) is already supported.

Patches 1 to 3 wire the sensor up on ACPI: the INT3472 supply mapping,
the ipu-bridge entry and ACPI matching in the vd55g1 driver, which also
has to defer its probe while the bridge has not attached the endpoint
yet. Patch 4 adds monochrome pixel formats to the IPU7 ISYS, which only
offered Bayer, YUV and RGB formats, so that a mono sensor can stream at
all, and keeps the mono codes out of the Bayer order conversion in the
CSI-2 cropping path, which warns about them otherwise.

Tested on that laptop with Fedora 44 (kernel 7.2.5 with these changes
carried as out-of-tree modules): the sensor probes, libcamera negotiates
Y8 and streams 804x704 at 58 fps, Y10 and Y10P stream with plain V4L2,
and with the IR illuminator on the frames are good enough for face
authentication with howdy.

Peter Marshall's series "media: i2c: st-vd55g1: Genericize driver and
add VD55G0 support" (v2 on linux-media, 18 September 2026) adds the
VD55G0 (SMO55F0) to the same places: its patches 3 and 4 add entries
next to the ipu-bridge and INT3472 lines added here, patch 6 drops the
endpoint check in vd55g1 in favour of the deferral done by
v4l2_fwnode_endpoint_parse(), and patch 11 adds an ACPI match table.
The overlap is a few adjacent lines either way; if that series lands
first, patch 3 here reduces to adding TBE20A1 to its table. Patches 1,
2 and 4 do not depend on it.

Ruslan Koreev (4):
  platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
  media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
  media: i2c: vd55g1: Add ACPI support for the Lenovo TBE20A1 HID
  media: staging/ipu7: Add monochrome pixel formats

 drivers/media/i2c/vd55g1.c                    | 15 +++++++++++----
 drivers/media/pci/intel/ipu-bridge.c          |  2 ++
 drivers/platform/x86/intel/int3472/discrete.c |  1 +
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  5 +++++
 drivers/staging/media/ipu7/ipu7-isys-video.c  |  6 ++++++
 6 files changed, 26 insertions(+), 4 deletions(-)


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

