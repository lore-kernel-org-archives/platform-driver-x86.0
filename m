Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054943;
	b=AzbFOuKZ15JB2R9CuHQI5cvBrBtOHGFI9ZA0kW92Mm/W8ohtRmlUN8fw9sdnm3UnkLQE
	 K+ZjzahVjyrLoxBukiVFioQLWA7u1bHz/te9N4g/Ra7RZEfyEiJysrOQISwSrhNi0tYIW
	 +h7t1HJbpbrxCipDL+75pvnq/OqVGRO6mfVqlQXYhsAjM2I0H0HSgyMIXKV3qpUZ/NeVm
	 H0kq9RxB3AdJcdliOIyZsbjVi/sZyKVv2SCXRgE7wHJlq1XiWUcePa4C/xuj7HQPoNFOL
	 DNlrOghAexGmcQPGW6nTgFc10goBmD2pYoksGMCMzpuVxu+vKRXvBKnUDLzskgNpztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054943;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=3HAKt9ytOwBy3UWcnbBW84LS30coc/Nnfy3OkP9tKWI=;
	b=kkUNBiCJwL4uRroeOw3XZttpad32yDeb1nlXzn8eMiVsJJeWpbDR9syQKPU7Mx9C6OoM
	 QT8tDpHa892JMbUbU8OjbsJQceNN6FmJ44ge8gEuHHQ5lynOGTFn6kR4B9Zi+r1DHuCk2
	 EbJa9odxcqAiSruZJHEkyrBmcSmLmFFQDmnAWkyOusFHB7VNZRYeuIx3rNdYMYGRSV93B
	 C7EzSoZFBeNwB7NiHFhREhZOpDyHQjdHaATixOp7gwCxllYR/yv/N+kS2+1usa9DrrnMg
	 XY5VUl241gcSQ7YOCD0uQYbQkaKSmwSiw5ULiklZrmca3W4NS/kjTdVH4GLYyRaFqyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yosoro.hk;
	spf=none smtp.mailfrom=yosoro.hk;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=NxDXPqp4;
	arc=none smtp.remote-ip=43.163.128.53
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1418606A31C;
	Thu, 19 Nov 2026 02:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1418606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yosoro.hk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yosoro.hk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=NxDXPqp4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795054939; bh=3HAKt9ytOwBy3UWcnbBW84LS30coc/Nnfy3OkP9tKWI=;
	h=From:To:Cc:Subject:Date;
	b=NxDXPqp4m2m9EdNqCTKP5Zy/hPGnVx5TFDUtzbvHfq/65lhktnWR32rLkfzI0inYu
	 erCO4wup1MX7XKVF7xvajgKKcCJ+9uiNrtIHs5t2xzg/fiycUj+RG9e3ouXLE6oCS7
	 tXfI4yvdmPwI7Mzy2eCOFpqgnXy6XghqxMgT2oH8=
Received: from [192.168.123.32] ([2408:824e:2703:9a11:534e:5a92:e3f7:7e0b])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 591806B0; Thu, 19 Nov 2026 10:22:17 +0800
X-QQ-mid: xmsmtpt1795054937t2gsr1flo
Message-ID: <tencent_2751C9C0C0CAA52856E076AA078060A13B06@qq.com>
X-QQ-XMAILINFO: NeshAIv1+ONR97vxIg0WnjmjHGtq/jHYgJhm0gunj+48NIxImvJrbgzmyX5nv+
	 ojamBJMPnz+6iV9uqJUJMJvE4/Fka24IF8rtIyTAqhTMDhAxRNA5rld9d4zXUMUrDSFiiO7cesKv
	 q94+acCL3AUeWorPZI2ngidzw59ETLMdiqHsCKcMqew5aT7QtN1AqSDrYV9JVWSCS0yoEIw7mO6I
	 R9pDBc9HFEzROIvNkoG9JvkTaHEZlzzYcPBzt2ynTjYqQdsI/CIJPFstd9zHDQxHfaTJ5FRO7d+Z
	 NCx9G1aFWS1DLUqnJnaUSY+kz++V6JoyHOYWo7bPQiNsu2mAOUzPVQwxHsUoBEnC3xxO5Ozp4zku
	 B7KqDA8GlGpab8mJnkFS/sO3rogKlj+IcR63mQzjGvcLcNMvZkgZcIWvar7vso9zA79hovbV9K+f
	 wYlgQ5q2vJ552tfPVKBgAHBRkgIj31c8r0696GlIRANg6pITNV9mcMSv9UrE6IlrPf7aUp3aKVRy
	 q1uq78+zrpcpc3TdTW3afNzfGvD7r+0kB3DKKCYqv+Hv/z27Nay9XL5eqZYaAnelCWdaMFobYfbq
	 e4Qj3i2TnX/78KLIXyux7PY53lH6ljhzlFmEQgXFRR4lNYgN63co7o+3uy6Jle0pAHgIiiQMLCqZ
	 cA0dLFDNzl5CnNgEvO6UIw6qAL5Z5USqL4gUfs0RKUL66UXeJ3H0Ml/K5SwWPna/bovLAbDr2vtr
	 V3QkP+VkWlo3iUiAPjTK6guY8gZLowNyh/b4SkbmwZlMesPdiYAD//TFs8WihL9qXNZckGHJM0JL
	 UnOSlQISLemzQCooEAxT8gnvC+OMM9oqI4e1sVl4o6nhfSJzRcf5Yji0ynYcNO1+wMxZ3vZFW1AL
	 iQlKKQF10VbuN91plbprcUjFnrOzBTa4Sjc8P8/vDMTcf7U1YJhuzwzynCJNUsX5TfPRs38ig6ud
	 RgkG/pyVnXWmjOovkuncRmkD8wbnHDYpjIzXl0vw7Q5vTVfV7gm0feNVhxfHgW+mwz2CijZRZrFt
	 W2U0Y135Buw7haEU4L4CO5OhSu6f6cde9fXwpE9crkv/05NXAcSUUcmGD9CeQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: NanamiKite <nanami@yosoro.hk>
To: Alex Hung <alexhung@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: intel-hid: Add H3C MegaBook 14 to dmi_auto_add_switch
Date: Thu, 19 Nov 2026 10:22:01 +0800
X-OQ-MSGID: <179505492151.20561.5347119974562882327@yosoro.hk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The H3C MegaBook 14 is a detachable 2-in-1 device with a magnetic USB
keyboard, but its SMBIOS table reports chassis_type 10 (Notebook)
instead of 31 (Convertible) or 32 (Detachable). As a result, intel-hid
leaves SW_TABLET_MODE reporting disabled by default.

Its ACPI HIDD._DSM function 8 (VGBS) unconditionally returns 0, so
probing initial switch state via dmi_vgbs_allow_list would falsely
report tablet mode when booted with the keyboard attached. However, its
EC properly sends ACPI notifications 0xCC on keyboard detach (_QF3) and
0xCD on keyboard attach (_QF2) to INTC107B.

Add the H3C MegaBook 14 to dmi_auto_add_switch so SW_TABLET_MODE is
enabled upon receiving the first tablet-mode switch event. Tested with
intel_hid.enable_sw_tablet_mode=1 and verified via libinput that
detaching and reattaching the keyboard toggles SW_TABLET_MODE between
1 and 0.

Cc: stable@vger.kernel.org
Signed-off-by: NanamiKite <nanami@yosoro.hk>
---
 drivers/platform/x86/intel/hid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 60e6b47..b487739 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -242,6 +242,12 @@ static const struct dmi_system_id dmi_auto_add_switch[] = {
 			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32" /* Detachable */),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "H3C"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "H3C MegaBook 14"),
+		},
+	},
 	{} /* Array terminator */
 };
 
-- 
2.56.1

