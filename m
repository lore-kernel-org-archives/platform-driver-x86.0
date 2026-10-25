Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972398;
	b=dwTHx86mbl+cCRg2yFb5XDouCITwOAxyhgTtLpEq7r1hC8Bk7Zkogft3dT8Hl1rvxg85
	 ZlACrlkl2zgKuGQq3zn/SBSo/eCSRRNaeqL1OSaJ8hBOS+aPXWMSgD+E0ueNGxDFldHFp
	 vTRqZQM+1VU+d8XqB/tqBN0FzFo2joxvXrM52B5WuOdfw3StvxWQYswfWRGbzJEtXU1PU
	 rlBWmBsNfgY4gyR0pvgeaTxoVCG2HvjvRmRHLmTfkroiOLHSsQeDXnoNQxy3sh0qGK0g1
	 VqnlZkw+2EMqStrRSmCdFTzoK9PypPujEojeUgMkUdmT2yO0JQvZ5ITPyi6x3ZcqxLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972398;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kOShCq2U4JEXiRarVFOrZYdD4vx45blyVPCctjn43nk=;
	b=mEHigves/eBOmuLcXNeShnPcTrsnpabZoLe/pn13yZy5JtbUGwMRhVsLzUGIl2Pcl0jb
	 wxckdGsUqiYllIDlt88KzBIO+ITcHMfJaGs2oT9xgBU/fCsurXTN18o24uIwzDgv4jOKX
	 C8yDSLNVsIdCfxemi3FvZuuspMCBguCi81+NYquyR1EbIeW7tPvVbZdWxmnDzfhhwNC5c
	 Z8D5Dqd1MezAnR/o2URRrS7nuqVWahC1J6wY54Ojcar/PLE+ZEd9NJOK0TWq4WGqbVLNz
	 ACacpLox9mNmMZdHtXB89f4wXJLVq5ip0Xeq2cy4MJKjloh76bwpUOxL/5ZYlb50t+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VB0ui4T4;
	arc=none smtp.remote-ip=91.218.175.207
Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E460A5BE8
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 23:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5E460A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VB0ui4T4
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nn6GkR6sKN00vvch3hLPYNcxKz8wsGc6g8V7oTwW2ns=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792972396; v=1; x=1793577196;
 b=VB0ui4T4N8GnBrQqNo+cdnUJoDVPGr1N9abN5+a61ZiRK43CsmRGqoPyKN6I9F/xEfyi0+uk
 9hCHWSd1+JbQ1sRHFNek+bhZDgRTSGArN/Rs9PcQzMzHJE7gFramnOwMgRJ63oUXEzfrvmVQwTe
 KoGrzl8rENnRhx2rf/Ezh5NU=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9d5c2c34b647df5;
	Sun, 25 Oct 2026 23:53:16 +0000
X-Mizu-Trace-ID: a9d5c2c34b647df5
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v11 18/18] MAINTAINERS: add maintainer for the ASUS HID driver
Date: Sun, 25 Oct 2026 23:52:31 +0000
Message-ID: <20261025235232.129945-19-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025235232.129945-1-denis.benato@linux.dev>
References: <20261025235232.129945-1-denis.benato@linux.dev>
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

I already maintain the ASUS drivers in platform/x86, know these
devices well, have contributed in reviewing and bugfixing and have a
lot more work pending so I volunteer on helping making this driver
better: give hid-asus.c a dedicated entry and list me as its maintainer.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a69da715c58..1a3cca5c5f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,6 +4135,12 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/asus-ec-sensors.c
 
+ASUS HID DRIVER
+M:	Denis Benato <denis.benato@linux.dev>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-asus.c
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-- 
2.47.3

