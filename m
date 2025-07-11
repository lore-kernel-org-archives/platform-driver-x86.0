Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035852192EF
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Jul 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752230496; cv=none; b=BgMqBcTEs5OYvpqzp7a/5J4ekLhKUdgAAkx7iB8htEq30AkQhUhGEkwlGtP6H71/jNOsyw2ubEZeVfsgswjfXyKJxkCXHv1Codh9ZhPMEKzW5qAKvqVfr8kMdSH9czdrZqMwzPTGs67n5J7mPB7Q91kRPfXflNfldHHel3OyGd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752230496; c=relaxed/simple;
	bh=k/tSKAjVcsQmyQjjLSrK4tDULBR2eOKAM46sj+SlHzo=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:CC:Content-Type; b=Ej1VaCs+d6JKT8MxYOBd7fvn++J17HvYxOlQ4WoGMnV0OZnE2tGbsdT0k/h3efFxZjRzTn/yHvgYVf/8/YK1/6Tqxu+vdfIai1OT5cgv3JJmB+iB3zTlZZzRSYgvKD0S3Mn5KOUj9PAjJMwBtV5YrENdTTs7p0kS8rsTM5cvjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=oYCKdiQT; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="oYCKdiQT"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 1584920853;
	Fri, 11 Jul 2025 12:32:56 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uT4eTf2gYQ9K; Fri, 11 Jul 2025 12:32:55 +0200 (CEST)
Received: from cas-essen-01.secunet.de (rl1.secunet.de [10.53.40.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 877C9207B0;
	Fri, 11 Jul 2025 12:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 877C9207B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1752229975;
	bh=uOChnz8FWpVqKCJmDgnHzfgKu0rM6HY+/2NIaSmRGIc=;
	h=Date:From:To:Subject:CC:From;
	b=oYCKdiQToQgGZCCtUkwCoSfk4+mz7JHuwj2kTseQtA1UCEABxt8w1KC2Ocjz0k2gq
	 D0rk8ePT4v77jqMH10e8o+Sxh4SUrcyWU/X4S39tmq2bxSLBzgXUmJ/ziUlNXA4Q4V
	 0uzXaYvqR9XNobIXhtNeEtgSCF9GR13SsfbrkK6IhR7OdvIxT9OZnsO5Y913E4+6Zx
	 VMZqYk03leSxt+xgyYBOivCZYSfv/Xfte0B92cC4VOt4HL87oq9xbWSrKInp8ts+ZZ
	 YAY5Gg6YyfEnNLHzlHsehAx3KTUKwijHN7cgffRTSgAVilHt3UXv4Gj1Mni8HLvWNg
	 c1OhQEx89/ncw==
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Jul 2025 12:32:55 +0200
Received: from [172.18.150.65] (172.18.150.65) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 12:32:54 +0200
Message-ID: <7dce5f7f-c348-4350-ac53-d14a8e1e8034@secunet.com>
Date: Fri, 11 Jul 2025 12:32:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Content-Language: en-US
To: <platform-driver-x86@vger.kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<linux@weissschuh.net>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Hans de
 Goede" <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] platform/x86: Fix initialization order for
 firmware_attributes_class
CC: Wassenberg Dennis <dennis.wassenberg@secunet.com>
Autocrypt: addr=torsten.hilbrich@secunet.com; keydata=
 xsBNBFs5uIIBCAD4qbEieyT7sBmcro1VrCE1sSnV29a9ub8c0Xj0yw0Cz2N7LalBn4a+YeJN
 OMfL1MQvEiTxZNIzb1I0bRYcfhkhjN4+vAoPJ3q1OpSY+WUgphUbzseUk/Bq3gwvfa6/U+Hm
 o2lvEfN2dewBGptQ+DrWz+SPM1TQiwShKjowY/avaVgrABBGen3LgB0XZXEH8Q720kjP7htK
 tCGRt1T+qNIj3tZDZfPkqEVb8lTRcyn1hI3/FbDTysletRrCmkHSVbnxNzO6lw2G1H61wQhw
 YVbIVNohY61ieSJFhNLL6/UTGHtUE2IAicnsUAUKR8GiI1+3cTf233O5HaWYeOjBmTCLABEB
 AAHNL1RvcnN0ZW4gSGlsYnJpY2ggPHRvcnN0ZW4uaGlsYnJpY2hAc2VjdW5ldC5jb20+wsB3
 BBMBCAAhBQJbObiCAhsDBQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEJ7rXZh78/h8+tIH
 +QFYRQH4qh3WagcmjbG/zCe2RmZZePO8bmut2fAxY04aqJZGYUBxb5lfaWaHkstqM5sFD8Jo
 k1j5E7f1cnfwB21azdUO8fzYL889kdVOzatdT/uTjR7OjR59gpJMd4lx7fwFuZUg8z6rfWJ3
 ImjxxBgaJRL6pqaZ9lOst82O0qJKEFBR+HDUVvgh4n8TTOfKNv/dGPQhaed+2or98asdYRWo
 S/zc4ltTh4SxZjLd98pDxjlUyOJoMJeWdlMmLgWV3h1qjy4DxgQzvgATEaKjOuwtkCOcwHn7
 Unf0F2V9p4O7NFOuoVyqTBRX+5xKgzSM7VP1RlTT4FA9/7wkhhG+FELOwE0EWzm4ggEIAL9F
 IIPQYMx5x+zMjm8lDsmh12zoqCtMfn9QWrERd2gDS3GsORbe/i6DhYvzsulH8vsviPle4ocU
 +PaTwadfnEqm0FS7xCONYookDGfAiPS4cHWX7WrTNBP7mK3Gl1KaAOJJsMbCVAA9q4d8WL+A
 e+XrfOAetZq5gxLxDMYySNI1pIMJVrGECiboLa/LPPh2yw4jieAedW96CPuZs7rUY/5uIVt0
 Dn4/aSzV+Ixr52Z2McvNmH/VxDt59Z6jBztZIJBXpX3BC/UyH7rJOJTaqEF+EVWEpOmSoZ6u
 i1DWyqOBKnQrbUa0fpNd3aaOl2KnlgTH9upm70XZGpeJik/pQGcAEQEAAcLAXwQYAQgACQUC
 Wzm4ggIbDAAKCRCe612Ye/P4fEzqB/9gcM/bODO8o9YR86BLp0S8bF73lwIJyDHg5brjqAnz
 CtCdb4I+evI4iyU9zuN1x4V+Te5ej+mUu5CbIte8gQbo4cc9sbe/AEDoOh0lGoXKZiwtHqoh
 RZ4jOFrZJsEjOSUCLE8E8VR1afPf0SkFXLXWZfZDU28K80JWeV1BCtxutZ39bz6ybMbcCvMS
 UfwCTY0IJOiDga1K4H2HzHAqlvfzCurqe616S4S1ax+erg3KTEXylxmzcFjJU8AUZURy/lQt
 VElzs4Km1p3v6GUciCAb+Uhd12sQG2mL05jmEems9uRe3Wfke/RKp8A+Yq+p6E0A0ZOP+Okm
 LXB2q+ckPvZG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

The think-lmi driver uses the firwmare_attributes_class. But this class
is registered after think-lmi, causing the "think-lmi" directory in
"/sys/class/firmware-attributes" to be missing when the driver is
compiled as builtin.

Fixes: 55922403807a ("platform/x86: think-lmi: Directly use firmware_attributes_class")
Signed-off-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
---
  drivers/platform/x86/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index abbc2644ff6d..bea87a85ae75 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -58,6 +58,8 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
  # Hewlett Packard Enterprise
  obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
  
+obj-$(CONFIG_FW_ATTR_CLASS)	+= firmware_attributes_class.o
+
  # IBM Thinkpad and Lenovo
  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
@@ -128,7 +130,6 @@ obj-$(CONFIG_SYSTEM76_ACPI)	+= system76_acpi.o
  obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
  
  # Platform drivers
-obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
  obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
  obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
  obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
-- 
2.39.5
