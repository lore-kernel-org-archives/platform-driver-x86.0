Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597779;
	b=xvFwI2PecFC4X0jZ9cEOLdRISrv3JI9YstkhiPDBaiYJWp8R0kjGnfLFOKLmyiHbGPm/
	 rrGOsLrwFaFm0hVtMqebn/2qCMr2MBdfPDcoebGmaOzFatmdOClVLuoGiJn+B5RGL+yMz
	 362EEMmR+cpjabp3+4J6TpTxjyTYsA31ViTE81hAYn2Q81DRoIg2SeJrpa+IWurlHTXbq
	 xkTlReBx61aCtORHq0uyGqDjWVG+IzJxOOVE/8FOEhpgYsupzkQZmBkci/QCzbOzLepdk
	 4uEyqX8YC7NP+7uUusQ3B/EgxwRpQTG3t3znMgC5j4DZU5mThBGFe9ihK43p/HLtIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597779;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=atA20MoJCKOu8hezGD9x11s/X5t0L0tiUzUV7Xg5yA0=;
	b=CJ9MgwhNr3vMybXNsRWYRidJIR2sj1Iew9ivsUdi+A031FRGEDTiQcF3VhZJdAxqsTBY
	 b8/sZbpfSIlW3cxwh3BIuTdY+1Ik97VOA7H8UiD8Jn5XRiADwN2O8TE6LmU35bxLmKIvM
	 NEzqFDg26fiaOrI27Q595wIPzmNh9AQRwinl/ktrPgZi14uHWw1iQeWyJaGYu9Hng8Uy4
	 I1P9SHOiFmP10h516g1P1QQUX8UASbTJZ+ogKfyXRh7uytDC8omRG9GrnvJgALAwj0EsD
	 BBZZN/KyOL9xG6FGU/9oNU9Zs6Mru7RGrklvbFovoAa195XYAW7eYEGZEb4mMm8Oj5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="rQhU9a2/";
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCCF606A31E;
	Wed, 25 Nov 2026 09:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCCF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rQhU9a2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1795597776; x=1795856976;
	bh=atA20MoJCKOu8hezGD9x11s/X5t0L0tiUzUV7Xg5yA0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rQhU9a2/ZrgHQcCSn7A+tDJRx7mN2T8RvxF6JMmcj9/9MflOI4cpPhTwZ6Acu8zq6
	 zFkedFpYp5HFS0fOSoDbq5JBSOuCMygSfDtHuhcTPEwanrI7tru6tZkK7AA8LpHvg2
	 IMy2nJU+hHe6OkUi3ID7jHfkzOthET3Q1iotYlzqHW0vaPsa2yCT4G5hr1zjudGMBR
	 G62G5FWE1lVnZ6TcT0J28bvHCv1yfrZ5VB44eYCWFhZG2zhNYFL9lbEIJaRvEVBAoH
	 15WB84B2Q8GAdA92PPPjQWO12pyVinAdaM+fQmcQUNdk6Gfa5I+UkNZGpZaa8gM4nm
	 5yx4qu7AkEU7A==
Date: Wed, 25 Nov 2026 09:09:28 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hao Yao <hao.yao@intel.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: int3472: Use actual clock frequency for DSM method
Message-ID: <20261125090921.46652-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 30ca2397b51263ce57e2d4ad33e31b19f083b272
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

From: Hao Yao <hao.yao@intel.com>

The third argument (args[2]) to the _DSM method was hardcoded to 1,
which selects 19.2MHz. A sensor whose SSDB asks for 24MHz therefore
runs from 19.2MHz, and everything it derives from its clock runs at
four fifths of the expected rate.

Pass the frequency from the SSDB instead, with 19.2MHz as the default.
1 selects 19.2MHz everywhere, but the value for 24MHz depends on the
platform. Where the frequency field is one bit wide (Tiger Lake, Jasper
Lake, Alder Lake, Raptor Lake) it is 0, and 3 would also set the clock's
enable bit again when the clock is turned off. From Meteor Lake on the
field is two bits wide and it is 3; 0 and 2 leave the clock unchanged
there, as measured with an oscilloscope.

Fixes: e4543de8b6ff ("platform/x86: int3472: Evaluate device's _DSM method =
to control imaging clock")
Signed-off-by: Hao Yao <hao.yao@intel.com>
[Sergey: pick the 24MHz value per platform]
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v3, sent by me as offered in the v2 thread, with Hao as the author:
- The 24MHz value is chosen per platform. On a Surface Pro 9 (Alder
  Lake) Fernando Rimoli measured that 3 gives 19.2MHz and 0 gives 24MHz
  [1]. coreboot's camera_clock_ctl.asl has a one-bit frequency field for
  Tiger Lake, Jasper Lake and Alder Lake (which covers Raptor Lake) and
  a two-bit one for Meteor Lake, Panther Lake and Nova Lake.
- The Fixes: tag and the note on 0 and 2 that Ilpo asked for.
- v2's Reviewed-by and Acked-by tags dropped, since the code changed.

Tested on a Surface Pro 11 (Lunar Lake), with the module built from
Ubuntu's 7.0 source, where this file is the same as in media-committers
next. The VD55G0, whose SSDB asks for 24MHz, streams at 59.14 fps as
its controls give, against 47.29 fps without the patch. The two 19.2MHz
sensors are unchanged. The Alder Lake branch has not run as posted.

v2: https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/
[1] https://lore.kernel.org/all/20261026111012.33347-1-fernandorimoli11@gma=
il.com/

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

 .../x86/intel/int3472/clk_and_regulator.c     | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drive=
rs/platform/x86/intel/int3472/clk_and_regulator.c
index 9e052b164a1..47dc23c5184 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -10,6 +10,9 @@
 #include <linux/regulator/driver.h>
 #include <linux/slab.h>
=20
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
 /*
  * 82c0d13a-78c5-4244-9bb1-eb8b539a8d11
  * This _DSM GUID allows controlling the sensor clk when it is not control=
led
@@ -19,6 +22,40 @@ static const guid_t img_clk_guid =3D
 =09GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
 =09=09  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
=20
+/*
+ * The third argument to the _DSM method selects the clock frequency. 1 is
+ * 19.2MHz everywhere. 24MHz is 0 where the frequency field is one bit wid=
e
+ * (Tiger Lake, Jasper Lake, Alder Lake, Raptor Lake) and 3 where it is tw=
o
+ * bits wide (Meteor Lake and later).
+ */
+#define INT3472_DSM_CLK_FREQ_19M2=091
+#define INT3472_DSM_CLK_FREQ_24M=093
+#define INT3472_DSM_CLK_FREQ_24M_1BIT=090
+
+static const struct x86_cpu_id int3472_dsm_clk_freq_1bit_ids[] =3D {
+=09X86_MATCH_VFM(INTEL_TIGERLAKE_L, NULL),
+=09X86_MATCH_VFM(INTEL_TIGERLAKE, NULL),
+=09X86_MATCH_VFM(INTEL_ATOM_TREMONT_L, NULL),
+=09X86_MATCH_VFM(INTEL_ALDERLAKE, NULL),
+=09X86_MATCH_VFM(INTEL_ALDERLAKE_L, NULL),
+=09X86_MATCH_VFM(INTEL_ATOM_GRACEMONT, NULL),
+=09X86_MATCH_VFM(INTEL_RAPTORLAKE, NULL),
+=09X86_MATCH_VFM(INTEL_RAPTORLAKE_P, NULL),
+=09X86_MATCH_VFM(INTEL_RAPTORLAKE_S, NULL),
+=09{}
+};
+
+static u32 skl_int3472_dsm_clk_freq(struct int3472_clock *clk)
+{
+=09if (clk->frequency !=3D 24000000)
+=09=09return INT3472_DSM_CLK_FREQ_19M2;
+
+=09if (x86_match_cpu(int3472_dsm_clk_freq_1bit_ids))
+=09=09return INT3472_DSM_CLK_FREQ_24M_1BIT;
+
+=09return INT3472_DSM_CLK_FREQ_24M;
+}
+
 static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
 {
 =09struct int3472_discrete_device *int3472 =3D to_int3472_device(clk);
@@ -35,7 +72,7 @@ static void skl_int3472_enable_clk(struct int3472_clock *=
clk, int enable)
 =09args[1].integer.type =3D ACPI_TYPE_INTEGER;
 =09args[1].integer.value =3D enable;
 =09args[2].integer.type =3D ACPI_TYPE_INTEGER;
-=09args[2].integer.value =3D 1;
+=09args[2].integer.value =3D skl_int3472_dsm_clk_freq(clk);
=20
 =09argv4.type =3D ACPI_TYPE_PACKAGE;
 =09argv4.package.count =3D 3;
--=20
2.54.0


