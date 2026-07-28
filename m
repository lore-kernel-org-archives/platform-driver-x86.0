Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212933ACEF7;
	Tue, 28 Jul 2026 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261240; cv=none; b=Wus2ViSGI7fD4MAg65LG9BRCnCqPio+8PSuXZrK7J9jlX2WVcWtrdyx9mVpK5uwfipS6NEUgkWmqbakDU4Rr8b2S75tBM1jUS5Pl6YfBbaJ5TGY0KirpFXh+uHoIpEHU3KiUqPSE1VTEtZTGWXW10PIpoP/MQWtBXJIjZsP9Ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261240; c=relaxed/simple;
	bh=IOqHXwy0nTzpr+Gy9jFZyVS4nRwBwykl1MBWpX2Vt4k=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=onUaaH6ABaoUxj2s8i/ydbJWUgLTIKy9ztlCcZjkl8n7SM/JJDWfscFKhIahyQ2MhTyF36LowyGrOn51PzSQOrjKMVp4R+iPaS2BEW0v/QBazsOgnDpChJlA0jQXwhgEhGitnYI06CSIBUd+nPyRtezjseSg4nN9hweVN6CDbnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=xAo6fP9h; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="xAo6fP9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1785261230;
	bh=zaSHOXhbxmKpq4X7kC5pulq/XsdsBCN5jdbK0WGo86k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xAo6fP9hdppl1CqxAeQV5jrK8FtGWR2MXoGGc9HQJ2Cax+RiENvfZqqKkFSJoOdp6
	 c54XDjQqrKrMH4cFTxBm3nbabY65FKxORCj/UNbOPs8QVwwn9HheDJY0DwY+aqXcNu
	 w0NryVCzICI5h8NoV3vxgmapRVRDKA4bF+ViTdcw=
Received: from max-laptop-cachy ([240e:3a1:20e0:1ea0:2fa7:34d4:60dc:c367])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D6A85AE0; Wed, 29 Jul 2026 01:53:42 +0800
X-QQ-mid: xmsmtpt1785261228t869z3bnx
Message-ID: <tencent_C7412D2CC4F52FC5B1AD5EE71B002A91DD0A@qq.com>
X-QQ-XMAILINFO: Mmi7T32Ej4fw9SLIllBEXbjeHmvFJpJXMdDsZriUwzaJTjZLxZaE9cuiUWOxVf
	 AD3wfdty4cpvZNbwCIkhhjy83hoG1cZtZCwdcbeXte0x7RURfCJjNbhOOVnZdUfJL1zVL7bJ/Nz0
	 Q9hgg0BDt5L/3v3N6936yZuKTK4T67Jygs4ubztM+2aLPs6Wd7rj23DNa+iyaXjoT9OmBGtz/9ap
	 UJXUMHfBxDoeHtWGwGOyAX7WOwj8s6nYv6HaVIKie91b60bwOOBbbPZsXtnCgsxyAiacuK7eHXE1
	 Yw6/xoczolFEVpMFibnjRMbbYigqGvkJiolJWZa8Wbpt1qtFyki3zbqAHhgmrcWJ6kE93tfngp/T
	 1Pdx+IyC0SrfbuylGEAfFr1j+wsfU7JyTXWQkFcT+vNlQWj1AHTmVdzXlIwz2oah/xNRz81Oiixa
	 kSvsSuqIdY7wGppp+nj/f78YLl2/g7qIMEInkT6dT4Q0+HER6Tr2kzEEv3akFTOlcvJIIrsnfLc2
	 WwLulWkbZkYCgHHBILzEVwXQGVvw3mptwdABYC9giOLoV1ap/6svBXzpPWWwRFZoJoQeLp4myMXr
	 kv7eWE2DWzi/UGfmbJHxgpXz2Ey5T0mM2rjgBOuPKErhX2T3SU6LG9Bvqg75TQxAMUXfIP9PMTU2
	 RQA4BfGkNKPpcLByGU3OR+Rifq/qjVGfQnXW7gqakPSDvBpzbzlImRf1X57rMuA1yi+QkOs76W8z
	 fybfi1LnIcs8/uwe3n/QDALT7fGUyXxMseWxGUsW1mxOdfVlexKPtwjWTBtscBpI0zhwk1qb/YGy
	 WkuhwGxHy5HJIqXFgw7cOtWk31UAlrmc1t/9XiygG52x3+2vwgEsLHAZlexN+nmLdKbQECjEXuTg
	 UHPkvJLJwPrDKPGuheJR3bGgvlV+fLSfqQ9D7690/fveeU+mxIHBYkXzXlKrPqMBd2s9paJUtbiN
	 7Q4CKp/QJkiBMI/jb3VNGOa2QrZGHWysTJWVHMzXkz5aGQwsB/jbU16D7CsbniPLVu+jZWinTXvF
	 fgjsU3wOZZSW5cp815DsEeT3Fqrco27nkqew3+d+AEuk/QJSvkiu+amwn42W8DH7kdw9L2+gx8Jl
	 1o/W1S
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: wolf109909 <wolf109909@foxmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Yuming Sun <wolf109909@foxmail.com>
Subject: [PATCH 5/5] Documentation: wmi: bitland-mifs-wmi: document MIFS v2 firmware variant
Date: Wed, 29 Jul 2026 01:53:41 +0800
X-OQ-MSGID: <20260728175341.45927-6-wolf109909@foxmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728175341.45927-1-wolf109909@foxmail.com>
References: <20260728175341.45927-1-wolf109909@foxmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuming Sun <wolf109909@foxmail.com>

Document the reduced MIFS v2 command set found on newer machines:
QFAN performance-mode codes {2,3,4,9,10}, fan tachometer location in
the EC shared-memory window (no WMI fan function), the missing ECON
definition that disables the ACPI EC driver (and how the driver works
around it for the lid switch), and the WMAA reply status word.

Signed-off-by: Yuming Sun <wolf109909@foxmail.com>
---
 .../wmi/devices/bitland-mifs-wmi.rst          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
index 9e86ecc2..d019a4c8 100644
--- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
+++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
@@ -133,6 +133,32 @@ The driver listens for events from the ``HID_EVENT20`` class
 (GUID: ``{46c93e13-ee9b-4262-8488-563bca757fef}``). These events are triggered
 by hotkeys or system state changes (e.g., plugging in AC power).
 
+MIFS v2 firmware variant
+========================
+
+Some newer machines (e.g. Xiaomi Book Pro 14 2026, REDMI Book Pro 14 2025)
+ship a reduced MIFS firmware, called "v2" here. Its WMAA method implements
+only function groups 0x0800/0x0a00/0x0c00/0x1000, so of the command table
+above only SystemPerMode (0x08) and a few state toggles exist. Differences:
+
+* SystemPerMode (0x08) reports raw QFAN EC codes instead of the 0..3
+  enumeration: 2 = Quiet, 3 = Balanced, 4 = Speed, 9/10 = Extreme
+  (SMM-backed). The driver maps these to platform profiles and detects the
+  variant at probe time when the reported mode is outside the v1 range.
+* There is no WMI fan-speed or CPU-temperature function. The two fan
+  tachometers live in the EC shared-memory window at 0xFE0B0300 (DSDT
+  \_SB.PC00.LPCB.Q_EC region "ERAM") as little-endian u16 RPM values at
+  offsets 0x69 and 0x6B (0 = fan stopped). The EC controls the fans
+  autonomously; no OS fan-speed override exists on this firmware.
+* The firmware never defines ECON, so \_SB.PC00.LPCB.Q_EC._STA fails, the
+  ACPI EC driver never binds and EC query handlers (lid switch _Q0C/_Q0D,
+  hotkey queries) never run. On DMI-matched models the driver polls the
+  LSTE lid bit (offset 0x14, bit 0) in the EC window and evaluates
+  _Q0C/_Q0D itself so the PNP0C0D lid device keeps emitting SW_LID.
+* The reply status word (bytes 0-1 of OutData, SGER) is 0x8000 on success
+  and 0xe000 for unknown/unsupported functions; the driver turns the
+  latter into -EOPNOTSUPP.
+
 Event Structure
 ---------------
 
-- 
2.55.0

