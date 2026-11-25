Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623019;
	b=nuUwmn+EYCZpi57n8ZhM+hpgtlAgqKwp4JNsAGMcQo56pK9eNVbfJJYNCR9Ff9RPH2Ld
	 VgJgeTzp4GHaHVfcvRxmyd4e4E7/3BSAbR6f7A0kdrL6dZl8meJvc+hAZOqPaRU6PRYXe
	 JbZjZYVLZ9YmSPWNKXyyXMfzgHgc2rRO/Vm7/t6+OlazwD6WN/ck0Wx1PZGB7OCGqmGmc
	 fbYAaUp1iFdtn2Ykg23hv9FDY/LK5F3eClxmcai/hr6H8Hhsz8joojBlEOTzbkwitOfiC
	 z87Ob4PSfM5SCN1u1wTMGnnSs7eYyKVvvELBw8YpgvDX2Px6fX3MDFM7Xqkc8TMtFyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yu4ougEj/Ep72fcpNBcXogN1OvBzPZQsjitN8cqwc5o=;
	b=iYAVYvLBh0uRATn3lffOnqjtsi8rsZgAh9lJ81P925nupIrpctc0jHx3HBdo8+5PBoCV
	 T9nhOl4TLM9zvhvh/NLOnA0VFIhFRwCKoCNZG0GFvLOO4/TnDBtAerC3npeOlpDGozla1
	 6lgX4zGPWTGyNaWQhLXi1lYdnCX1Q6/BV+DHVyf52o/kRhiRwiIImql/aiULB9eb0bpm9
	 hCySg+953rjiIrJF2//U+jVFWaqAwEZNtce7qqcy+MYQCb35WVG42kwwubS0OqSy/IXnj
	 N1qrz4o3WB/pakKzgX+0svf/KTbWsQc4pXfEP32RlC7AzN+ClAYjyjQk0AFo4YuLY5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaDoZZzt;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDFF606A32E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 16:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDFF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uaDoZZzt
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso7079596d50.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623018; x=1796227818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu4ougEj/Ep72fcpNBcXogN1OvBzPZQsjitN8cqwc5o=;
        b=uaDoZZztDrUPOP2qNMy5PAa++OCYDKHx9wU2snbN35Ewqdp7Ow5UsWexXVDC2ivM4Y
         flyPYI4NBCYrVTdxQKt+aDbkYnlYZxI7FRLUoDWTLAx89vLMdI/2hCIkWyhvb6Co0qvA
         05a47VAX063Uej55XX5ourl+iEzrNtsZzyYpLGrR+RNpmCgb3oA0XtYSOCZRNpXuytB8
         Eg1eQrWsWnmU08eRLeSGe7hS/Uek4xk4YkO17Qnn3ITee63BaEOYpzZocVftoX0qf0P0
         eKSEYc3u3iSZ2xsrCKX32Ecg0KEqcgXR+SfM5uDToCDyEksZ1aW2r4x9m7cKZZ7pshdc
         ptaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623018; x=1796227818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu4ougEj/Ep72fcpNBcXogN1OvBzPZQsjitN8cqwc5o=;
        b=erKRaWFZfjURmSgkauQX3gA8GMllzVsz9YfH4jDdcBYHjyJ7ddgtILvNXEL2pbQiFS
         JMSw5teJ9tP8+b5we9tDY3eCVWP1q/75O62W4r+Q3Jnl9c0FSbLngzyKrwmJ+O5feTV3
         EXG1um9tTtkf5pO58wX73XZJnIo9pSltmgbTTxaqiedaLehRvYemUWZMY2Bf35bKKJh8
         oYllQB8+ZbWwQaBgQNICipj4nvXtYN6JHimvPhdDjhjRLjQ1Ypdx8zNnjRu69S33lXq9
         dziSRw7V27p0PXxCBZix98vgChYSGkYgU00lEbjYcZ/72reJaFm1NtObiouIaCK7SUAv
         RXTQ==
X-Gm-Message-State: APuU4Z+2+X/ih87NB1re1M9waJJdK+O4OECWBdpQLxs+GgYjuNDsiI77
	sk0kyiyBV6LzQpTyoGNjekqJde3fphoGm6G6636m1yp644G4Utk0cn0=
X-Gm-Gg: AZFdTZcL/K3pEr2/kTSA6h95EmfcfT/wBaKwgMnshXBXFg3lhS3sWwoxGF8zwITB2HH
	aRUD2z6n6JmFRIg1OO66Ic0nCZbJNjV07HZ0fmtl/Edl/S/m6/cbGtOg50JPhdwoOnp5DVg/OuU
	7XKUBCN5Sv2v30KjYxtMpZehXViT/zO+6Tg3xdO0Ejp4d4+AyWjqNpp1OSeMAFQH6g/Apw9onF/
	b4SJUegLFZ3vTxeakcLyfPykHrnVgL5nHLWX3kX0mA+BaSo8aA+I3MpuFW+mDDJowvLK81U8g5P
	c/O2fVBeTHBCLod91nU7a9ZjD7r0iwHPVYRybeAmBrq6IDrgsbAqop8RgZVZQhzzvdOj4oObA9X
	B0FiJC+WYxgzvUnXMDdu6e2oTv+Ve8yKO3cupVmpiccZhV4NU87ka4b3TtyorrczTiQ3CniqoMe
	GD3DmmbkpiIhD2ppd3kUDjBcnY0clqwklXPX89AzyICsmSdG1jyApdW8o/Xd4HnUHk6bzBAlrNc
	bzkAAkW55wRLSn45FKelvWZ+hKHGZxtrVz7GyfJv7+bttO9zVwx/rsdNAbDK/fNoThLen9ZTok8
	sLO6cnLPsiT97EIl6wmfPGH9dvZBLxwqStc=
X-Received: by 2002:a05:690e:1c08:b0:67d:a95a:8e1a with SMTP id 956f58d0204a3-67df44273aamr6039215d50.71.1795623018097;
        Wed, 25 Nov 2026 08:10:18 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3354415sm8960040d50.11.2026.11.25.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:10:17 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: Add myself as maintainer of Intel WMI SBL driver
Date: Wed, 25 Nov 2026 10:10:16 -0600
Message-ID: <20261125161016.781273-2-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125161016.781273-1-svav2021@gmail.com>
References: <20261125161016.781273-1-svav2021@gmail.com>
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

Add myself as maintainer of the Intel WMI SBL firmware update driver.
I have contributed to it recently and, because it is currently
orphaned, I would like to help maintain it.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 18c0428913b2d..03ea1ee0a8360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13887,8 +13887,9 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/pci/intel/ivsc/
 
 INTEL WMI SLIM BOOTLOADER (SBL) FIRMWARE UPDATE DRIVER
+M:	Arav Verma <svav2021@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Orphan
+S:	Maintained
 W:	https://slimbootloader.github.io/security/firmware-update.html
 F:	Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
 F:	drivers/platform/x86/intel/wmi/sbl-fw-update.c
-- 
2.47.3

