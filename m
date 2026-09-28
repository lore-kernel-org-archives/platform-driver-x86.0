Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBF04EBAC5
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 22:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633672; cv=none; b=rPcUe9o5z25ck9Z6wEvB8+zhHD3Uk+pgSleJFNPvnaAFhv+bl17D9/1KetiIUQBgA2JA6DY8K4WvUP+v0pdGAPiAxNO3QAcIUjS7VUfNc9iJ7CeQzSblPUohZgzm9X4hWQfL9RY83JdONX2NgeA1vRnyrRORc6IQxr5yxfxQy6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633672; c=relaxed/simple;
	bh=aCLapVh/orO0cgLznT150hK/QFDCCG13haG83K/faZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I7WotAYNs5qBZML9mQOPOTDGyK1qPkK1M75f1zTch/0bA9yXWLrF2JxlRV7cAlijs5nm8XnwXNpdDJh0ost/FNHEIZzlk10eDl5ZtqG+sUpJPvWyQAy4ozq6teKFdRuB7AG0IsiSAY/YGDh3F8oFzgngG0Jy89ofDFbZi8mKILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kgBdoR14; arc=none smtp.client-ip=91.218.175.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kgBdoR14"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aCLapVh/orO0cgLznT150hK/QFDCCG13haG83K/faZI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790633669; v=1; x=1791238469;
 b=kgBdoR14hOs5Y50gHLshXoaOE5695GPneudkGzGtxpvitM3DcxdifcDLiE0e8/TgfHgsgMcc
 mC2ogS16ogtJu/OoCd1e4UsZc357XzalCI718HFYEFQTBRkT3hQqY9SkwFieBPBwRpY3jkwtMbO
 dPkVIkv30G92T8GtKfuHI3NQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id bec94aa221f2e130;
	Mon, 28 Sep 2026 22:14:19 +0000
X-Mizu-Trace-ID: bec94aa221f2e130
X-Migadu-Flow: FLOW_OUT
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
To: ilya.gladyshev@linux.dev
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	qby140326@gmail.com,
	W_Armin@gmx.de,
	uselessfire@gmail.com,
	vlku.milos.fun@gmail.com
Subject: [PATCH v1] platform/x86: redmi-wmi: add display-switch key binding
Date: Tue, 29 Sep 2026 01:14:17 +0300
Message-ID: <20260928221417.37875-1-ilya.gladyshev@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As reported on the mailing list [1], on the Xiaomi Redmi Book Pro 16
2024, the display-switch key emits 0x101 as a WMI payload. Add a
mapping for it to the keymap.

[1]: https://lore.kernel.org/all/CAFsq4KBXCB=aK8ENHx__6+RcC-ybT7eKjcgsa3TgcJ54x-PLEg@mail.gmail.com/

Reported-by: Антон Карасев <uselessfire@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222062
Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
---

This patch conflicts with the unification of redmi-wmi and
bitland-mifs-wmi [2]. However, that patch appears to be stuck for now,
so updating a single mapping in the old driver seems acceptable.

Cc its author, Mingyou Chen.

Also, I can only test that it doesn't break on my hardware, so any
additional testing is highly welcome.

[2]: https://lore.kernel.org/all/20260816100813.300450-1-qby140326@gmail.com/
---
 drivers/platform/x86/redmi-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
index cc82ef502002..155777bf90f3 100644
--- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -22,6 +22,7 @@ static const struct key_entry redmi_wmi_keymap[] = {
 	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
 	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
 	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
+	{KE_KEY, 0x00000101,	{KEY_SWITCHVIDEOMODE}},
 	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
 	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
 
-- 
2.55.0

