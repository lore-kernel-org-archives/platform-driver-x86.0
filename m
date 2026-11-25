Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623018;
	b=hz9DUymi18rfINuQ0tw1W6gAcdnjEJjiPtiwxo2dMbV9FHLrHkyoX4DnYssvyV8vArPR
	 RwN7Gl6id01Bo3vqhpjto9I1Ym78JtBj6kvF1ysGA27D/8/2AU0vqXSkZTtmlHupaJAbq
	 f1Ii4WKFfpFiuaoY3T7PfgLt6Nvp9PHk5+m5mu1zJUox+fTKoKbb8rWH2XgdOwewGQFrQ
	 MFGK1N6gVu/LeUxzAG9RnoNaTcKntJMYdwqP5taack8Mm3FX12IMpWZmTs4XIOMEGuMvC
	 PntD4GH2GgrDn74/Yev5VRO/qzsASgpqLquvQ19QDTspH5U/TtHhthaXR7As5UFGQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=x5yHdiGlrkU/Nuu/+FJFLSXIV1EPwrfgxxUc0g5c+fk=;
	b=WBWz/fCMP8ornMVtsUVxveKaQp9WWbkdKsESyyZ5Q5oyErkRf1Ifghgyx0pOe+GP5Pyr
	 yEfV2wxP+GGiCcn7F+wdo//p+0TdcyCN7crYAXUGS8JNaPceNhx0V70KyGwE+bEUtCpqo
	 AYSjydhVCY0e5JouaHXhHxj3K/0LT/Wwh+9Xd1yLYwS3phGoFPLDiCkoioX9aZHEOORgM
	 +wrCojL+FpYmxTDGM0zeYUw4VDUgnGUsdA3MJvHOJs9/DKYcUnm17/39dTdC30ztXkAzy
	 dsY0PQadyElxNB+JIrp/9FKCucY5umaNt3pFydPVQl5JofaZY+ki+hlmj/vBJNLSy2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4s3woIP;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775FE606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 16:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4s3woIP
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67da564d9f2so8033990d50.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795623017; x=1796227817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5yHdiGlrkU/Nuu/+FJFLSXIV1EPwrfgxxUc0g5c+fk=;
        b=o4s3woIPIOuKQcTwwjUjRAxAm/KEkHXcpll84LVxQb9xyBondXgN6L85wLH8XTjQCZ
         dqzAumOjdgq7uPwhGpZqCRpy7qEULCHGsIn6tK83Fj7gjXTUOQ+q0oWlZujw+k3CGs5u
         VKTqYt5dNQOb6BHHSB3XDhZOhh+3fN2k7H+rZkhX5MCfszMA8n/HGoDIUW3fcwuJ7ZQb
         AVA1JSHny1y2YJN/lmE/Sg5i0YrMwa19EIYqJ7HPwbLTzP2EagluFt81mq+jupnfQVXO
         nNebUvlaYg1bfNQ+ufxW0NVQqbaku5mnH0INCfwbr83beOMS8ehLDhJuI7/EEgv2jU5r
         ok1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623017; x=1796227817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5yHdiGlrkU/Nuu/+FJFLSXIV1EPwrfgxxUc0g5c+fk=;
        b=1eIupAGTGT1CMIVzLUsEGmc63ZDnVoEbcSee+11sq3y/MWQeFdwvvxlYMSbexFrN3v
         rfK7DVAUeb+BqGqEtDO97Rmz2DmaJG/bO04dFTGFgy+oDAcLStoC7zHfF4tQxV+GaUgH
         EZ2dldsoVQinipsPd5et2rkAd508b4GOdCPe/q62biT9WAuVN18EBu7PPiafISS9pnKS
         YdSot8yk0dS13Z5tFyyLtzv/RTCNlmwQrqlVZoM1pWNXOdLHpSRs8fjxHl2D23XMaB9A
         Egp2zvsSOsqJbsq/oUmaDBeBllB94XHaZHtvyxXvYknSE4/zBoanRmKliS7d97Vmcv7G
         V2iA==
X-Gm-Message-State: APuU4Z8LJZEABP3CSLtNTQ5qvssK+2/nJ5BzJGKHgiOnxxA0W7oWKk6j
	0q8f0oqxa2PtX5b0dvbV8y5Tew+PghxuwMdV+JivKKVr1cxYYd5tx9A=
X-Gm-Gg: AZFdTZdyxxYj3xM+zuKharwX+jIpfha3WZq1I8WiuYVK+oEKDl2v1YRo77Vdhv/mxaq
	ISi6XMEJweKodHhU1m5NMxflOrrmY0tQkcUzhcf2zvA/OomI8pKxryEyjr5aa8a2RBVI8bJw2ue
	PoVnVIOV4CCGdQ4HNo8vjOSPX3W0EsbsM8C+Zlxn0XS3whWGkSBewGfRlsiZR3ETB4GoEYJzveA
	4K3vgdIOEmtaC/nWtJtLIDKPiVN2He2FULTdEuuzI+HTQiN8xkweHgdZekOY7Qd/jzhRTLypBTB
	PJYsCqIuERDe2dAM45zQ4iwHSUuS+2eBPa9L0VNdZ2eNoHq3UbNBgLFHPvtgh1DivIx7oDTIgD2
	6n1MtK8q8KRbAKQ3LUZHP8r5VE9LBYj/05u2ZkhxFvWD0QskCZPMpqb0CvFpCCDCYFr8KEVLHXI
	JFBXGNGNfvzplD3XvH4V5HMl4G2b1L5qgL92ep0UvuWE3/TOrX5Cn/OJVlTTD51My1et+tavFz3
	nOfGW1J2xJgLfdX4wBTQLQfzFVEWwwIURMd8RxuiCT0GKm4kgOtdbj7y/VJTw+t7FzYL7919zdY
	8AW44H3SZmKnPw==
X-Received: by 2002:a05:690e:1916:b0:67d:bbf9:11f1 with SMTP id 956f58d0204a3-67df440ed3bmr7211709d50.47.1795623017463;
        Wed, 25 Nov 2026 08:10:17 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3354415sm8960040d50.11.2026.11.25.08.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:10:17 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH 1/2] MAINTAINERS: Add list and ABI file to Intel WMI SBL entry
Date: Wed, 25 Nov 2026 10:10:15 -0600
Message-ID: <20261125161016.781273-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The entry for the Intel WMI SBL firmware update driver has no mailing
list, so get_maintainer.pl does not route patches to
platform-driver-x86. It also does not cover the sysfs ABI documentation
for the driver.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291ff..18c0428913b2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13887,8 +13887,10 @@ T:	git git://linuxtv.org/media.git
 F:	drivers/media/pci/intel/ivsc/
 
 INTEL WMI SLIM BOOTLOADER (SBL) FIRMWARE UPDATE DRIVER
+L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 W:	https://slimbootloader.github.io/security/firmware-update.html
+F:	Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
 F:	drivers/platform/x86/intel/wmi/sbl-fw-update.c
 
 INTEL WMI THUNDERBOLT FORCE POWER DRIVER
-- 
2.47.3

