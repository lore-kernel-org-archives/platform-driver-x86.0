Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468570;
	b=fU81VhUkdJr12hPv9k/DGzT7Cva6rrdqjasM8R5ociXwL7Kd4BJ41E5ZYQu2deGQINt2
	 yHwBjhb/UYNPlE+VgR+9rtDtIXh5vExt3oYmghL0I6tQzcrTvez9wtMda1psNfMlSgTBA
	 TeszHqTh5qGAvd39//0F0rW28aJqrk6rsZavCDC6Vla0Rbr9UCMXMViQ63YlOaBzU6vO1
	 Dz/NoJz6a+C0c1IYv9xMShVvsvqxKDXmePSaOHfirCjWliG9vfO47APk/nUuytpk037kk
	 czcmFCY010Uu6ydhkxUkQdXe4Z4Mp9a88lmh2BMn5aNik/LhgBD+nMpyHDlB4RsSKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468570;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLGnmizI0rQhqsNKClm0H53LdDa4BKTqazSRRlghGiU=;
	b=ZkUSRmYAOTboXRQu64kdLgg5SYipclSp/ov66EXjC+faV2xvh7zUtVYVNXDZ55BZOQri
	 Kp3aDzS1VkEpF/CkWBWnqQ8ovXKkc+LuCAI9JP/x9Dr35zOrjfTxXaOFPbrKo7GJNPKqT
	 3cKA/oQz4DkO3QcAV6GQbjXLld8QijPVE2cW4extO2Mr2XEVQrhRbJ5ik2Sgevo9uFis9
	 5jv0eoppxPzsFI2/ECCMeV5PO2EfVWqNFmuLmm9WjomGKA/Jx0QfxA5OokmozUd47wSM7
	 jIyzzk2YJ/cY0kTmXI0WoOn2KzKOf2StYHIP489XLWXS/w0cwFPvGzMvsgXafUvMU1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n86VbwA3;
	arc=none smtp.remote-ip=91.218.175.41
Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8B606A31C
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Oct 2026 17:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n86VbwA3
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v/vwC0I5TFCZ5/5X6X4jA8IEXevOgfqLa3VQQEnVcIo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793468568; v=1; x=1794073368;
 b=n86VbwA3d6t459rBFa2Czer9dgoWgU7asDo6OOFo+ty03cQSk2hLMKhxzzy9wpnmyNf/RKSA
 NZtcrSKl/Mz10IspkudWgCoPOlcEdLYOxFKHzHVaNWqRuktRFSwDMauCdZdYjBZI1qGX98MT9Il
 ied/Lfcra4aEexHG6BSWyinM=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c4da3dbea52248b5;
	Sat, 31 Oct 2026 17:42:48 +0000
X-Mizu-Trace-ID: c4da3dbea52248b5
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
Subject: [PATCH v12 17/17] MAINTAINERS: add maintainer for the ASUS HID driver
Date: Sat, 31 Oct 2026 17:41:30 +0000
Message-ID: <20261031174130.208240-18-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261031174130.208240-1-denis.benato@linux.dev>
References: <20261031174130.208240-1-denis.benato@linux.dev>
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
better: give hid-asus.c and its sysfs ABI file a dedicated entry
and list me as its maintainer.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a69da715c58..3dbf491046b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,6 +4135,13 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/asus-ec-sensors.c
 
+ASUS HID DRIVER
+M:	Denis Benato <denis.benato@linux.dev>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-hid-asus
+F:	drivers/hid/hid-asus.c
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-- 
2.47.3

