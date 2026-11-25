Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643904;
	b=xHi977W/mLnP0RhuYOsDud/d1+VA4TVHHATMdQRJzxmCv31RLAf8SO5YYOFYa/bcGi66
	 zTJUO+4uGfwPlkSWTsZuaf+nDwCDT9eFjgxvEo4+SwWF2wJ+J8d4UKESIwj/ucu1iWhE2
	 /SyDoFsdraAjKeOaKsnIyUdma3qeeXCFKzBuynX/VCWBS/TEln5CGsKuRrmmIatVlUa7X
	 2plY5aIyUPJec/4/B5vHDHeuCs2dH/CWKbWUdjLc+2k1N1RX1wvuoOWRl6BBBnjQ5Attj
	 d3DR37QHQXG7L/JCtG9V+MHxe2lPOUAFzxYEP2U9m4oM/YasjE3RQv6c6ddjnx/J8Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wMe/x3b8Hh0Yr4sEQGRRrAWpmDptwcjQuUFjCdKAIsg=;
	b=D3OGjGBEjKL9/5nLPp+m2kt6yXacB4uMQlHbpViodNDM9Cml6dEebJjIKfxWDehwE3xY
	 PuGPUypeFAohYjwyOiaJi81TPJ4nRCO77EyfXgr3CcBpxLK2XiqOkZzC5H4blsEu1MGaK
	 s7pJawxV0BBNveQnbSSJif5+9dZdaWoDVJeRsr5VjdxXOhC94Uxde1X+K3LtI3UbPa2h1
	 25VVPSt8mFXf/IW36vf2gIy087eCVlJmhBzVDbyQ0XJN6vsUhAf+veN9qCbPmWDDtzlWT
	 NuR34Hs3EJjcIlIlJRc3B+NXHdICKs+1duNy4Bnsd+aTBOpkKtm+d43IwbJIy+4m1Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aK3qOe2P;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7286606A326
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 21:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7286606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aK3qOe2P
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f0621eec70so43983765ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643903; x=1796248703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMe/x3b8Hh0Yr4sEQGRRrAWpmDptwcjQuUFjCdKAIsg=;
        b=aK3qOe2PTZY925FSpuYuaunuHVKqarafoiJpBhjV+q6pSYltn6h5YZcXhRO6jsGRdn
         VhEUjRY0awK023iEb4ymzBo1AS002WiX56RownPiuwbztzrJ72rsT1CI2JGgNL10t2zF
         9xmyDRf8I3lr1S9IZddYCMfQY6mHFX6CUG3ngbr7LVBUrijtA4S27Y1I6ZvAVRSumR8y
         no4zFpq5gLBJK8FKFRwCp8f0aecda4hk6WTizgP4Sply8w/vlJV8eABwQ/l/yR88oF+c
         IvzHGoEoW0KXEbDHXWRq+Nt4HnGAAzvkZk+OSYp+tHb2MtuH1fELgCFbsee9V6YHRlzf
         9YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643903; x=1796248703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMe/x3b8Hh0Yr4sEQGRRrAWpmDptwcjQuUFjCdKAIsg=;
        b=rQhA8HMQawsf9hjjJdZ+YnhPQmebZWK/DuIheyObVpqz7wlsVWN+H1j9eRG2GC91KZ
         RJ1msxGtHuFWYiHDETx+74hOTWe9QyfJufUZxzXH+GiNJYvfRmDlorUHGiMgOjpG948e
         u1LKIP0e+9S6BvpSN4emcaPUyRQhARN4fwMNtDRPe0qJ4FEpXOG2WVTRSqvp6EfYR0W/
         HgghhjJoAebgLP1MpkrGqbLOwpK9fMDhBzoAtBYIJ20Y9+Y7Hp9SMya1y5b+eLBNKBjs
         C0lycf9m83HJ1y4od/CafW9W6UdSJL9XCMp6kIeIFW1hG/G+NDSqV/kVVfCTbRpsCD6W
         VcEQ==
X-Forwarded-Encrypted: i=1; AL+hErH3oBkNw2LFxJEPBcVtWE8n3bFw1/E09a17WEkQLg2Tou5X8n85aUpiXLXqd4FnP9380IcEaHSQyWDVKgd7XKTQ+j0a@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uo7Qb0dVwByLnVnOJ82bgpJ+DESY7DzdFgt/4y9oCY5pQP6si
	pcpjdVh+o4i2fKAxRbc58/GxaYF3hczPX01KePePvYTIdtLqHM00jaSo
X-Gm-Gg: AZFdTZdi0CNP70S30QLnXs3bzwoQ6roQ6q546/UvqH+RW7K5sQcZQIOzss+qirQQc/E
	9/l0XIqdp2J249a4lETWMzpPxBSuPq2STehKjSs3NTmVTPEGBoBE2bJxT3+gzrImfy7GlUW969S
	qL6Ru3IpmuGF2V/1MPNf4679+ltg+aPLQsGXzA+7c/8jLzIWuf2HuDGnthELTsvKNM6sQhb3dVf
	EaMCsIPiJJZViEcK34XJVzALh0j4eBA39ZDiQ28sZEBP5Yx8cpSr8lT2rov9A2qJSMBlAOrp4LF
	2Qe0l8Z2AmBGs1mpQlrWXtgrtYYwZq6lLCHYVnJbX34+QyOxmk5KdCXiGCg3Jsv3IIxMLRugONY
	sUgyPKLcApvcOljEbgnx8kmueSKhgkMqpZq6nwP+/R79KogXO8Cm6AtZnseDtbqfRw+wdr6krrw
	L9f2S10fpER0j9zV0rqTIbWTBAUsU96jp38l//1HjP+UlP6AYxMOXDwh0a5rzoawpypkHhaRnyV
	S/T9gMfwsOCJNxgJyIuECR+LEywH6U2p2QmICcZoydF5YL5/NrCcx6fAMNZURsho0JWvElqCwFh
	ct13NjPHMOpDeWf2PiN0dPtOl7g55casvgpOkyQ/DF0OjJlgxI/djc3IxpWHYs5JWuzBIklr80q
	E4VjP13hhqMcLg+kvt2GP4PmWIT21PvC+8XpbDzSxh6c=
X-Received: by 2002:a17:902:e5c5:b0:2ed:a96:8a03 with SMTP id d9443c01a7336-2f03f27e77amr175474885ad.55.1795643903239;
        Wed, 25 Nov 2026 13:58:23 -0800 (PST)
Received: from localhost.localdomain (74.82.221.43.16clouds.com. [74.82.221.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm91547365ad.3.2026.11.25.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:58:22 -0800 (PST)
From: Nikita Ivannikov <www.nextry@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <chipang_kao@asus.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Ivannikov <www.nextry@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: cover all files in drivers/platform/asus/
Date: Thu, 26 Nov 2026 00:54:31 +0300
Message-ID: <20261125215431.120307-3-www.nextry@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125215431.120307-1-www.nextry@gmail.com>
References: <20261125215431.120307-1-www.nextry@gmail.com>
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

Commit ef696e89f836 ("platform/asus: Move ASUS platform drivers out of
drivers/platform/x86") moved the ASUS drivers to drivers/platform/asus/
and updated the ASUS entries, whose patterns only match *.c files.
Before the move, the remaining files (asus-armoury.h, asus-wmi.h,
Kconfig and Makefile) were covered by the drivers/platform/x86/ pattern
of the X86 PLATFORM DRIVERS entry. Now no entry matches them, so
get_maintainer.pl returns only linux-kernel@vger.kernel.org for a
change to asus-armoury.h.

Add the ASUS headers to the ASUS NOTEBOOKS entry and, as the drivers
are still maintained in the pdx86 tree, add the new directory to the
X86 PLATFORM DRIVERS entry.

Fixes: ef696e89f836 ("platform/asus: Move ASUS platform drivers out of drivers/platform/x86")
Signed-off-by: Nikita Ivannikov <www.nextry@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba7650cb86b0..3ee17232ac0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4227,6 +4227,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
 F:	drivers/platform/asus/asus*.c
+F:	drivers/platform/asus/asus*.h
 F:	drivers/platform/asus/eeepc*.c
 
 ASUS TF103C DOCK DRIVER
@@ -30433,6 +30434,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
+F:	drivers/platform/asus/
 F:	drivers/platform/olpc/
 F:	drivers/platform/x86/
 F:	include/linux/platform_data/x86/
-- 
2.56.1

