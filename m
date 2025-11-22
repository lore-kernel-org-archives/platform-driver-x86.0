Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3E2D839B;
	Sat, 22 Nov 2025 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843930; cv=none; b=AT9xfVoxAl+/fhEutziiH3ih2a+4Gl9ccCRoybYQpYweMxfgHV5ydd4+mm4T3I1cyqiJ1yAV+5o9MbzBUEgkm5VLMBl/2AqesKf842DV5quy+HVWmzyc6fwVc4h2RvLPFzmZD9ANrm01h37oGA9JieBGjLj/ZKBlNO4D7J57IlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843930; c=relaxed/simple;
	bh=TJgLzTksdV6FW6f/rYwBBRpRBJulZLasWdVu8QXIRik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y64ITQHF/aHnKyG/Qb7sjeLa61/1+L4KAAoUnjGSJKmrBXaWnwcDAkWKzMTaNx2rdzGhIsra0KGgU7QCmsl0i7EFQWd+7xHKTmtGZTD0mxHsr7u+W+do9ddlGYUk1jYWjMLN+g/fK1A1DzHHzNVuqfrIMj/SZc/ohBxt/K9p+G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rcEnFNPS; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rcEnFNPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843919; x=1764448719; i=w_armin@gmx.de;
	bh=my3Bwy9Nqnm5Ql6505L7xx+AOmSQ2MHcXjgLv2xvJRI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rcEnFNPSrFSdj6JLTZFStrd5U7+6QWHbW66vZq88t8vG2MPtdJ/Ik+o+bHc49/qx
	 +t0uqp4U4GT/R56w7da/W64JE6VSJjwJNZDwROnPmhcalS5rOobAj7Da4p+5QDFkJ
	 fZq/jpbdI8lhqx46CuZMIlenrB0xUTfSeTnLQDNpuy2ojk3Z3O1qf43jC+hD2IQ2U
	 2G9Anth02CgNzaH+z0I2qfxSp7dB7CE8uHSX266uR0ZZT7zC8QR5yKITZBcI3m2mi
	 XA+XC0ik3VHLYzLfxBnX4H/Bcb7p8+EMLS3xmz7aO1TNG+ldhmI4wxizNslcEkXoK
	 CVhK29G4fFvnyX1gDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M2f5T-1vPuue1FSJ-007r05; Sat, 22 Nov 2025 21:38:39 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
Date: Sat, 22 Nov 2025 21:38:01 +0100
Message-Id: <20251122203803.6154-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8K5Q700yXDq2bRh1HYOjWtFzDHSrZ97AOa3pRUvLJq//ByQE3DE
 uzHv963AIbnCTmh+/NTKSqNrqv/qX6aMS+DqGw4esbH6hjTKctT/cYL5K5dLpqLmk6Ay6tQ
 tol9kgSjfAklOYf+8+uXnIomOoORfMNll50DE6e9iK+H3yMdPvTG+sm5LqKilSTReGoTHF/
 sbu3S2ZWbvmH99HNZeseg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iuty40lL8Gk=;2LwTf9RqE5b8GbBZjXtpJekrb7/
 X1FVM64uSPdT7sxtAOj5DD7pkLLMHCJMO1T8zQDCdhxoWscdDhpOJhHXMGCT1jDADeK5mcRvH
 7QJZztN39HMgc4bbY0pfvOz9DILgF2OZYN6AQkfECVUjgnL3NMqmr6+M7IHLQGv/tlou7QdN0
 MSPfyhbe+LMzBr9o9H1rCOzowsJngMtThOKsZ5KybW0a4xH/JH9x14UNGnT36paal/aEe5Gjs
 IRB9sVZHYw+4Mj7DiBnTB7dwUJq+eRdn7kXjE31lHPI+W0PvTMJz5/Jhqh6j+1Q4rP2PHaI29
 zEg2Y0j3SFY/VLQ4WHIYucCr7ukscy17egnaCQdKGJ2aB5f8R4cX3ZbXvEZhDPw4v9pSdB2Gm
 tneGPWp6KXs/utVNX9gfR8m4b476WOdyNMpXxmqMsVX2+2UI+wrXvOyivbBfsrM5Qp92X1eoZ
 +fpyIGhucYX082YG3mVkN9gnh5MWncf58r8I/nXuCb3+UgFXPdqEkqigXh3V8ApaB7iwr3jEC
 kwer1vC6fR/X6EadHdv9kf7+dYc0fxA0SvkojD/cMc8/avGXt8zDhB6q9e0QccvPMXLCQmZGu
 +phwrostuQ1UtRIqiYbUdeW3x5YwhwQRiiW6XyotWMG2sy4UekMCmwk+bx3/anmJt5CV75jhN
 x7t+rB7rZXPQzSheuHt6AkxYxpuoOmApdY8E/NF/J/66yJHOLkHmjlXXHNL3CFMHMnxLk3LPr
 a2HwBX2LxQnce3yZwTocaG7eFdZLOjYC4c971unRE1FignkvQQDBISu7w9Ci2SwHpYb3CENWs
 hdAO5ZsbhvABgKFAVHQnSTotlNVfCvMpA51/acZRpZVeLkfPZ0VjuC65vo76bWGV704e6Kp4M
 awzHPzvZG/2++Qb0Wrx0nIjE/tZWKUid9Cql0HhF8T4tiRYtRCeRR0mUqsBqOYkApe2OeKElS
 lWSH+lYXzusrhl9pFLKjASsXdJP5tx4N7M9mV1r/r2Ge3dm4XjOKxwhgtL7SMM1ENzcJ6ISx8
 gNrZQhoteTUDvlHvwFHjsU5etggDGFGj5MZtAHnqZdHo84E3Ma87MMOYUrq7+otRVyY5P4DjN
 kiPDtUPiDTp3SeGvjJkCm9+IsiGzP2M7ZHITOgt6ONbAzapCjPGVYOxqwwAje5i10jhuKFuV1
 9o0yLYUi313B0TWPkJlPSYJQL+mTkL38zRPjRYiGJBmaWqXkuPsH4amH7sNzDCU00m9myX/Z5
 eD9HdZOUw03jyDX1N7KeJv9y4KFk4254HiNRRKTzb7XgiMDmDRtmYMxv/FxRZRzKu0/nFugW+
 rieBynjwD5emaNTWT6hiDYAdgbSxiAfHeHgZWLG/1npa+VL5mPvQAEgZzi2xeV0uhfONMotmX
 11dITtpIGso5gd+AxxUUrmNSwUxIud2kgOMlDkD9tcBFV195kBPEB3/rm3iH+uE9PmVpYqBZF
 G6GRKoFNQncsNttuhOM+bEueWsqy5XtfP2VGJR1k6vaE2qBHRYw7Z7Kf7XK+6CULg9iSD1s5Q
 WxfOqvsIzfYVOJxDTYLqPVEZP+1lh4wWhvqygpXaRklvk8k4T1I9R1vtRdK04I6CHkSOcw9kR
 sTYWgqzCOQGwqC1bNAtvN1OtF7nTN2+Eq+xRDchGSlO8y0kK5SixcRzCCcJgyho7uAf5/aA4u
 c16JVKroYA3UlQteosUv244Vb2SDXMGxOmxvyMfabslSNvof8uTCfNO794Ly67r905QCyk3TI
 71ueZIfyJJW/Un21rKL1Fj+4FoTzzyVRuOpu4NZnnfAX0H9PSvoL4XA/oRuJxdPFu6JtyaY6E
 H2jmnETir+Kk+CFD/v4UvU5pLCt8RFAHlfFU6qA1wA9bUZ2HrYV5BsdxaNo6DAvVjI6x8PGXv
 2h3ayBrpUu1msgiccuXdSCps7qkjWMh+/1lmcreMwYRpsaSykNxLLNU4ynUhTOydE1+5A1+Dc
 6R7faY06nPZXVt4DHixWINWYlGHTvo7JA4gBqal0h1veN2PochWG8cLYneqGapDTIWb+7PIxY
 StX2nVLS1VAGT2iraLUrDZNXofo4bB1Mg25fKW79M6S9v3D5UnkAaORW8dKTd6Svv5aAJH7PK
 t8wJQrLmZGoZELaiu7EdRrQ1TJGxqruTIPZOPBPV4aQ43QKAQ0/eYohRL4H8i7dlyJvRChL+F
 tQzs7LNCeSRf92GDpK4/bufbAY1Jd0RqiVQf7tjH7ijm54lR2vEDk3bkYWv9p5H4gRF1aVtUo
 EqH4GAfaPW679RB+xf8ovHoeC7Gu5XHt18KVYqbew/844F6KWNHDFEd2K5q09C+Gen9VEus6S
 uAnSruvnrXCAaVbfwB6Csj1Q3Es8hLrUTXhWf3ba2kf1ZDw6sA22grFVQzFLd4wZ6mbK6q3eM
 F9nnl9XMWftOZnH9ZyIiM4r7Mn5BqPbnB+o8N8F8dN+zVH1SHaerIwfsfwNh83y9Q3XA2H7bO
 LxCUfAycTDOUhhBa7gZ+BoP6Np2KNccf6WA8pCmbAkdjfcrB19UWgOD3F2AbTXRnUM/tOGQ7K
 gkIrrWxPv3jSqBZU9Sq+6MjJBfyti8mnrt9JsYUxlA8Px7UQeRJAbYjWOh26XRRpt1BWUHYxc
 kDGiTzlOB9GKtdCz0oH8EJWH4BZAPbtvtjzzQUDWxNTuUYEtJAWskusMR8iJEMXvphoGuNtZA
 qPMxSc3JfAQBQiNC/tmTC6SnTlKHN7mOaP5TjCzCqAYsyByooXGtGICfibuXCWpGuhSoibSSf
 8R6G7gqOb+D4PtOI3Sg5bojEzHru1GkXhA+S6HZnhp/+brxvcvLeFsuegMcOBeyZv6KanQRXN
 YLYkPz9QO8n9A90QrJCqQOFKij7Dc5Zg7fE5RuY1OQ8n0HbLldr8EnLjx3v6QD3DPGPlKXsVT
 h9mxBgDtpFMCx/OGKFXwV66+SHW9AQUow6PbxqXW6JBfI1d9xez/C5xZ+hpnpTsQ6u1wHcU1A
 SKWWdrFe4Gn0h4AN68gdoeuB8Jf36caxZaO5R3wATGEcB90sLgpPBt6TgZTVoreQjCKu0C7To
 qePKXU0Cx3pz9s4RpIKiQ9ETkgedkoSf8MiUj/8IAAFcx4gKD2l47EFpxdFAEKdLK0aIgw/xX
 FcQQF7djcqz2U1qiOs6prclq4jqb0nyW1x8rxmEIy8VjAzzmknxhX/6IxuSJWStS9M+TXDe2B
 ASnNla0dvqlv3xi0aw5NbqKoD2GK3KH6vzkmt7x/NZw2eu/wdeI4EhVF9aWsKIeJ9GzXiLJRm
 66rQtUmaTopTfEMIf6pMW0thlJDnedOnb/Tu4RNxhnqEQTuxwMC2gXQwD8QI6Z+JG1xIpCARb
 poxvLwsGDLHInofdVsWUc6L1EOWkbAxEVYGjVtuLDtdRNoz+vPwId1pr8+2HmEyI8v1XqR/9k
 mivEUBBYrOc83eoW1ddaUqZCyr2CcTIE5SqYLyZGenP3rBBrzz7IyPmdrsGcRNB56HGvF4tW3
 7r5QMFKYUPBXCPq54A7dzqpQEe/trRaMNvArY1ApM9nFPgUCLHhvi6PAUZDOsyzQmC+hPFEIU
 Zdtza1nlbeWpUxDFQDtxBSd4ijIox/kdGH1v0G3lOFVlulG5Up22PCN4Z1cTsVO/29mz61Pe6
 EdkUm8PF1jd0f8rHkxNYzdzU0ETn8iVGHIIzIPhf7L+OZFAiCHXMa02KtgLffIfl3dHpV/u3v
 DeG61cY0/OqeKBvuMqFU6NVGxmplKdkmL0eEDzo8nWxMrf1XNQO6x76Ur7c/PDb8czT3p1kZ4
 6fU1s3Hk32dk6QikHcb69/sO7DGi1L0WFcuzTRTaT/+CneSwiOpi4fjaAbhuxG81E0VQvaUQS
 PgsFdlRKkeuvP0Exz/xJL96ZEQ6vhOY87BaPdNm2Vt8nwuufFcDuxDL4OiolZOwtdmYVFD32j
 Ox+Ayb9qlWFQnQS7cmmUb+Uz6p3qfH8i4jhHtlxAzwroGk83BxcWZu/tCLLA6pfPSjhXNR3E7
 i7bWtUF5pJt4rq8Y6QvxJxd09naxC/hQT2OuJtOK+PphrAC/rinRbeMaPaXmev6YCJs68Nf7U
 DeKEsfWWnnxAlQKGMoNrtwreF/WUtlqrYExOT5q5T3yRWqmk0/rVKEl8BrwC+055HZIRuz0b9
 xLmHZjK9G5PP0kUhYjIj2bkQfs+0HzdDk38Car8/gfZsFYTFDFZtx4WnCH4XTU9nxO5Zstwhc
 G/6cTn07Kgd5VovhbiLy/GBHw6Uxs0kZZRVPI7NcDUhjnwBRfgxUtbkW7kmFboDkbV9h4un9l
 QMjEzjCZvSPSmKFVgznkHKVmxm3hIDuJlNW1hoHpF9zS74zTDH+sAgWO23YvcankCrZYoggpU
 JlhY1fwR+qRWxdcxZOgyfp4Ztpt5YlRKthm/IMNWjgZA8DlKvSgJ4DHimJZk4jyFrxZEVgNwk
 Nqj/u2pnSFyiaP7zKkA07JPasA64PkXyVFjq9kjke9bPSdAGHVIicWVB8lUUIdD8MmLpPiJyr
 ifBYRtFq4KAIV56CmdFX/BK23nmSUe50z5XOI/QiH27sWPkpHDUMmawoHFQIynSZXf/bcJElV
 gULH2hebKVzF9Xf09ZoCyTDijC4cANTb8XIyThkAo4800Lc6porDdMrws9pwfRws9uKXV9/ej
 Yyqar2lNCgjsko09E3AuAs1KdyFdVYCChFuRLGwhG0qej2FhBnM8vHcfsbM7g4XyZH500FeYg
 zlpS366JZO0kr+mONCMoyB5nPgN0zW9yjqPmHjBFvfivZIUKq1R4LqbYEQi2IfYsljh8SUjYj
 x9Oej5bVShFDxj8d5n4ZWE2RHKDhSObncsMoVCcIS2toUYiedG9MGN17BLglM1qP8ZnIIg/pr
 3fPtE7xnzyAMR8KR3fG0SGdoeJ5tW3VPvDhTBukIXZxQ7+9VPwH7xj/DM1M852YZGKw/PY/gY
 9HejSrM61RhECbp6Hx3+fDpS2hMgJdM9kZHSRP68A6xG/fbu3HLTSDQJTh8iiL/fmyzr15Otq
 q5CGYLcdLUOSGrx5hg6L/KX+Rb069PC//0yohUndFx8Sv41fdxj6y64TwfyvS1V+x5Hea4Ox1
 5lhFYU83RHNSVK6Ij1H+TS0CXyYYe6by/E9v0OZRUM6dkvneqKF6dSOVkZXtwCglDR5IEsl0L
 mdq3+RR7GneuiRLe/9BZ9lwB6FxoS+gRuH+E4l

Use the new buffer-based WMI API to avoid having to deal with ACPI
at all.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/xiaomi-wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/xiaomi-wmi.c b/drivers/platform/x86/xiao=
mi-wmi.c
index b892007b9863..badf9e42e015 100644
=2D-- a/drivers/platform/x86/xiaomi-wmi.c
+++ b/drivers/platform/x86/xiaomi-wmi.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /* WMI driver for Xiaomi Laptops */
=20
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/input.h>
 #include <linux/module.h>
@@ -56,7 +55,7 @@ static int xiaomi_wmi_probe(struct wmi_device *wdev, con=
st void *context)
 	return input_register_device(data->input_dev);
 }
=20
-static void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_object =
*dummy)
+static void xiaomi_wmi_notify(struct wmi_device *wdev, const struct wmi_b=
uffer *dummy)
 {
 	struct xiaomi_wmi *data =3D dev_get_drvdata(&wdev->dev);
=20
@@ -85,7 +84,7 @@ static struct wmi_driver xiaomi_wmi_driver =3D {
 	},
 	.id_table =3D xiaomi_wmi_id_table,
 	.probe =3D xiaomi_wmi_probe,
-	.notify =3D xiaomi_wmi_notify,
+	.notify_new =3D xiaomi_wmi_notify,
 	.no_singleton =3D true,
 };
 module_wmi_driver(xiaomi_wmi_driver);
=2D-=20
2.39.5

