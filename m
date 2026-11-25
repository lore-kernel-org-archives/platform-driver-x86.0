Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631815;
	b=T3WSKDLm3oLT5kywoU0JfOTvE3LDBhjo7oz52UlnPeSwcbeTa2Gq+FoWNEjFnyfA+sUe
	 n2SMoB6JBtKNB8I82FCkQifEdC7zhXiy1sZWHT73nfyWFfvLuSvMjeuWZTkO2uJ8kyC6j
	 wlt7Zoam91xENJoC5wizJh56brrpb31Cw1Gnb/cLhLMHy9riu0Vwn+3yx7ETpLMiptnNX
	 XNJPTPP5nvj8pWFlpKrAZpk84wrMjbrvJgqgHjGAwdZoexg4VUFzLJJRk0a5fysmh1sFv
	 mPV/w9LEUo/RYooISJOF68Bb63Y1JtriL53zegTpekLCdM68IR9GYbqG6qCwWFZR4zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631815;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4sMJhG92fZVYaL8+VRxqyfAp5ptidXmv3kWnDhr83Pc=;
	b=qrJlN9Atc7KSC8PQ3uU6U5/bmQdEZBktPCItpwjqWRfIXVHVcd0oudU2d896puLXVKEj
	 npqlnVOyptvZxls66ChFb7aAmAZwSBO/ghXDRwAli90Wj2Suw665ja2sf+ObYiuG89BsC
	 5A1moj12IcSAjOLI2EdD3CIPerJ+roYdCI5O+0qK4E6bqWRJQWp33tqpkQJTxzuVsWzg2
	 o/X+SRjgC3AFiG2jcxSkaq4vb9RlYkALpV/S2oS72kliSmezPBbX34xPv6BcmSe/vTqxP
	 OmWrjpwXhVVy3Lc+8cYXkixwG062RD1HJJU4esCRyvaEdG/ZM12eAFga1ai0JFCf8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ghoul.dev;
	spf=pass smtp.mailfrom=ghoul.dev;
	dkim=pass header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b=DWPmTrF5;
	arc=none smtp.remote-ip=185.70.43.97
Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE8606A31E;
	Wed, 25 Nov 2026 18:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FE8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ghoul.dev header.i=@ghoul.dev header.a=rsa-sha256 header.s=protonmail2 header.b=DWPmTrF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1795631808; x=1795891008;
	bh=4sMJhG92fZVYaL8+VRxqyfAp5ptidXmv3kWnDhr83Pc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DWPmTrF5xUeiFIFebSf49A/bDHLquWFHn3zQH21OtXhDcQRx8WIJdroS3cgaDVZ3+
	 tSvRVlQH7alTWDn3mIHHGj3yjYKRAmoKmo8BrwY3XtpVsBlJP64lXHOzzJmqnda033
	 zn3D64bHVLHpyuIqliOdmjoVQHRCt4fPqXVDMBA66Pk8v41k2DP8xiX3taIauA4ZsK
	 lWa0JUqW67yRNM2um4uVA6RNO9b2JUPs5jOXR288Gc8p1J7mDfxPF3h7rSWqn1feOw
	 fLHoIkzBdpC4Qa5VUjsGtqEB8ijt71Nt/ipi6PWzpZKVVV+0FS81ofOHPTHOCqznok
	 4eJPKlJfLnPuQ==
Date: Wed, 25 Nov 2026 18:36:42 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>
From: Yaseen <yaseen@ghoul.dev>
Cc: Denis Benato <denis.benato@linux.dev>, "Luke D. Jones" <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Yaseen <yaseen@ghoul.dev>
Subject: [PATCH] MAINTAINERS: Add Yaseen as co-maintainer for ASUS notebooks
Message-ID: <20261125-asus-armoury-maintainer-v1-1-053e67858be4@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 37332f76180950c39611765c696e091e075fdfc2
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
DRIVERS" as privately discussed with Denis Benato.

Signed-off-by: Yaseen <yaseen@ghoul.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba7650cb86b0..ed7c9a249db5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4223,6 +4223,7 @@ ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:=09Corentin Chary <corentin.chary@gmail.com>
 M:=09Luke D. Jones <luke@ljones.dev>
 M:=09Denis Benato <denis.benato@linux.dev>
+M:=09Yaseen <yaseen@ghoul.dev>
 L:=09platform-driver-x86@vger.kernel.org
 S:=09Maintained
 W:=09https://asus-linux.org/

---
base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
change-id: 20261125-asus-armoury-maintainer-59689b2f2db2

Best regards,
-- =20
Yaseen <yaseen@ghoul.dev>


