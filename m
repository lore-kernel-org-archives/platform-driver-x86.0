Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C03AF646;
	Sat, 30 May 2026 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160914; cv=none; b=M1ZT8vhSLTheg8udblHvyqxmaz2yVbTrw0aH8dfGqdFSuA1uxEFxxFl0/EMWGmeSOiffDOeokiAtcawTJzdExCLL2nF0jv6NIaTr6fkWj67PVgwyLFr2Jb8CuJgNDPVrcAz8vEI7JSTZDLwMSqRAjWTaxUXqk8X58RTlWUVa7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160914; c=relaxed/simple;
	bh=DVvhHfc8Gqa6+4cP4D0jOAyaAIgSAtEWzaqhO85qePE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XAiU/8FWJ1UQwagC7rY13jF24XHQDMZJAl9+pTtQftlYcaP67LppWv6iR0jf9zCbvIwyW3jIqQwbQKp4Siz5qCPyf5MtMOcwuMYRoobmhiqY0NJn7OzE2KRnkAqlhE7gi35LxfzvucijQ+qKpKgavvaY//0CbuA+TgsypStNdSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fzgMzCzH; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fzgMzCzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160906; x=1780765706; i=w_armin@gmx.de;
	bh=/H6lCto0VC04416eEoUEzrwKbtqBdV9K42/LAfjX4gs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fzgMzCzH33JN130IgmP/2kv0uV9fcu8701mkPRAmKUZ1uQAb/hzkz2GiF2fq5mgG
	 UsDO+1GKxxpDUc9deTFgwg3DPFgRH0WlEPyKS8kW+gesDzQMLQON2UGjfL7Zeg/+p
	 vFvibHLoDz4YKeA5cq8ugD0pi19wwIDhizm1htackddsaTDOIkwUp+5S92MbPVsTe
	 fEvWOoTtWUxbmSWQVWgtc2CZnOhPY/NejnRozY+EHthZTFBL24ltZPeIw6F7jT1cB
	 mRh5K1buQM1n0fU2+VUqkbnvqqiI2JctJ18DDjNTrW/Rzu1oOfW52KTCnc/+u/8l6
	 bEmLhcBr2W0kqYnbCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1wyqZo2NHi-00mvy1; Sat, 30
 May 2026 19:08:26 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 6/7] platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
Date: Sat, 30 May 2026 19:08:12 +0200
Message-Id: <20260530170813.10166-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SiNB0zI9HJYZs5j4b1qTn7qa2r55XqPjvTS4RlFL0SMVgRBrjAC
 jE7hdtX5vvO2mGJt8UrIjXm927ukXd6sOAJIBkC5v6A/VBRjt4vJl3oFHN0565+DyukWNnn
 AAgejozru2c2/tzjRZnR4JGIq3GGsZr6/NSeoTCQOJm6MeZ/dQSbC/L5lvDoMsuPMy1L0k/
 qx+R+tr0mRcAjqiai0h8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D9ghFFFpbqg=;w2woVOF/MJYrCQ34KTxhPR7EzFx
 k3IYjPSGEwyWj8dQ2W55EPFrCfTUj9PPoxFQZ2YevBksTIIT+lFnBrYSzIhJu8aQjkWvM4Cwg
 SuSYmGLzv1zl/HJwNVqrK2OZ19/SdFvwoUFqj7vgqen1kCfzqe/rScqhz4qlKF9OS73+Ue7RC
 igZPfCEEfwGOFvpqUasZbwNboMntGcngsUEIcE0NAL1JGhyC64gDsBx48YgoqqTllRlEt2Z92
 bhf+xpRCKLuGG41r/9YJRn2LtwAX7lCrpPzgB8++0Ch2BnCEarQf0ut3Li4LydMM4wRXiT5f0
 dmE2xBYcp2qZrSbxqgmMOgt7+ouMWBBqARzZf9gVqCZQOFcgaceGsYS255dmH71UPcyVxN8OH
 xFCU88vt7MHQ2xUbMhFWgMC+YH+KhFUf7TzCCHAmCrQknGDTzP/a58b012sA0aB09kkYwjF6T
 Nynj+n37AdteAUTTvUgeZSF/FtCcEFI23fndNuEeCY4JJDxUV/SU8t0u1IZnbce03KTtEUx+Z
 25JZc75jl4/o/ZT44OKYtpVdHRR1ny2CHjm9CmQoSe1B4U2hNWTHKNv3ANzm3F8xuawsd2bX0
 7kjwJmFfHbcDgIU1kXZrStb6WQNc04uKrLEBX3au0ux29vWjW3bXlJ2vcUyfirPK762nO0ZdA
 T0a3pTWVd7enkZtTIfZ7B6bbQN1akNEFAupfbgkQWTLr8Nl7Jd94JYBSiEtgoEnLvCRSC6DYS
 dR1lbchImPNO3wTfvRKDNsvvj9Fv99Pnlhnn8sQCknDHUtXyX4YbzJRQWaA5DrqUbQa0uXRha
 iemaB7lAIAD3vaLYpGXgMi7CDQEd9v1I8/k/mP0mYDkH5PkyGkGA5VxG0m5kRShcgXMO6+eEq
 sYIZR5+bGy+XnGnWSX0Ieau4pW7j/2hWYPntF3AHl/C3c9gdhxe26zKwn+jkG4rL38koMCxtf
 c6JjxRXNmlCn96/sSEHntvnqGvJ7k7ftyqZFLz1Nu1oBALm+6nVsb5qSqedxCUXeZdeUqTjL5
 M7NJozu7rIg9MINvYKy6CEs80bXMJbNlM1hit64E98PggB79mpcYk5cfGC0vwSf7lGhiAs45h
 MaTn0LQiwgb+CWkB2gP0t0C5MjNDNsRT2ZDkBEfzCuaGpWeqQRWA28ogA4eNzLEd4M86XpjCr
 W2b6esW43+shHEra33oww9BvR0V2Rg11RSLmhVOZAD6mmuiaf21HHO5r6FGaO1DpO7xBPMs0g
 B8p60ktCfW5avA/1t5QQ7F6hKBJqA3Eh58jKM3LfIYv90e1ohfB7YfIalrX+kFSxW/nsYff68
 HTHXyE0ZBQPGRgOj82HSdqinZ0B7EdEoIKebmhIWQq1xzSI47i00B8l5c+sB8TOZkWos9S42K
 irt80S0n4C65pyKsfFSrHSjb196QnkvD3KzqFeqm0IuIPY258xkK3xjRcG5ZDsAUz/Z9xgWHT
 nsFs+xIm1rLnmEfI5xKNQjkEJnZvtwSQEcafmAea2Fgvup1+6WzWAl8JHTyJ59vDf2fGnSaps
 1E4MMZ56t9n20rGHS8z+DDOZoAOYMyKiNCQ/f+qI0BUTrkdfThEjXDsHvLgGx1/qMi2TyXxMA
 x11NLWyghVflzchPry9UKPXgOqjkJvEeWVHCZf3qFyfSRzEwgmDwqTbKpA34umQC70tq5U4X+
 ZShj96x76ypyagbXP5c7YrT1fDH3CV5WM+mFGwNNRF+2DypUT9Bo6RzqwslrBEtYolatez6bH
 BP/6t4d6hmKuvHlPLXxcS/dArNpncAd1+TeIv4uonNOm0FYg7+f9xzVW8Hnpx8cYbldlnBHKt
 g3KEa01X1aRcIlIqQj5CSTfKLvH4LXgZdOcLlO86cP6MYDFcqPWWHunDzTgufOELXNruu7nuu
 2ddfsY/FUYDgVGf7zvCZVvsY6xO6RFBP6uOvbPsdLSOVk44A4jFlVR7o8fvZNu/xeFLBz4t/z
 kbDRRxEjDOm2kw6HqtySjrBGNeRyYl1knbxY7//F6ahH2Qh6g2PXPFwyyUxEsDzN1CEhCz0jj
 7h4MACVI0E9CKXYIZO1n702EtVSHUobkNHvSSWhhtHXClwo86n+pQoNS+kGCtzJP1FOGrpI9j
 3/NtpjQinJe5mKtFDe/+zMlar+hVDEYEbbw5L+KX/kIwhS24qzrnivXvivY70SaNUNZA1jE9A
 5BAZrVaZyAy01BDAwFvdy2tedxgNKL08DULeUJc1SMZAI+u5r29DqK7RV3jqA7nfe7rZGUdWp
 u08rx4N8P82UChBpEgVpmFOADPF1WEEtRNhtHb+lkENLLivx4LnRfbNncaOZwIv/67Lqubene
 8GxUUvolounEB6fMzgDBQek5SPSWT3yrwTC7zv71ldTzhqUbvTseog3i/DJImfoOR2eLVzodX
 wcZDwRVyhs3ZM34nnDXY1WnamU/oQASDAK+GTeF7zZtlnMCv9U647QFES8W65z1YkXu1KKM3m
 2TVLaF//pKiLTBFsobw3W7zPEMdNHpZ/JfYThKoSFgYZ6l/dnm2Td+4aB9Cspo4iECwRQxLhM
 478at+sFx9572cSWOSbC6qnYIHodhpaTsMPtMPvapIxpBe/tg4CL48RiKNXCXDHnybIrOvGnE
 cY7f61bjxvw/J4SBVBbFv82+/ui7lmS5bVlmZ0AxrkHT9D8P5upSML2epmRA7Sj2akw+GWLIW
 ZzTL+lug9KjnAfCu2sPjG/UWCOZXY6rvyF/3tDKPXDugt/Cy3TLEI089z37qKI5xigTItzmqH
 a6yazg7ewOy7w5OYLVuzK0haEhautqH1FiGBOZtGMexPBGaOv4yxHNzlhmoO4Sla9YZYVjxpz
 qbzEgVXPq/1KqUMK1yWK8OkiwQzzZACx+gXpOGbGJzosGymMKGLWx9e7eJqr21bX8QkmQrdX7
 ovbROWmj3toj0DJweP3TCATYKJzKdRQor4EaVeh7JB5aarj/+JrWg90Eaz471KB9/5VQMx68F
 s6F84y7YqFC/7hpLuCEckR5w2i1RfKF7XQix2WUjLsJ2wxYQCXDCdxCPc50jy/oVqKFKKvxjB
 kCYXE4vYtRrtb15AuYNQlFN5ksdS+x7A5W1Cj1/yvBTrI6BaonU0fUsEJChpJ/cw37vYUOlCY
 JE3u2bf8V+IyulAr61gCyrQhJNvs0rQxjBDHWlCfBZKP3L1yH0U5V33VIwV90rkwxLN9uFcmm
 DCA14SmrebWL7iaKhMVL6mPsuNwmi2sGI6rWKEztRAPtAIv4wVYCF0w9aRqq08InzkRnJT1pl
 6XBC4iiMUp313S5CeyQlgvXpKhfW5b0tdilCjGRYvHgt5UqzEx7HGKpaDkpSfTAFOKXh/F2j2
 KK7GMBxZZyIsuq0JgSFWL9ZSqn2fsjiXtg1wQxnrfX6ZZ+tHtbb+QPd7ZOYkLOY/VPduuws5t
 Hk5HwhWQkZ5S0awzlsq/MDVpgDyhbmFKfzxom+o8/qwKAVC1Lzs+tZTG2zdL7rzj/mibqDE9v
 p1NUUee2m5ec/LBVuiKMXEX38AzcocACbT/AvZoYuxD4g4OxVCxx3IcBaR7om2XP3NQHhX3sO
 6YMAudOw6gaakk8NI2X/RLZTMmMSivla3kH4PdwashAwkHSWqCrRYrqXstJFioeJa/OwZjUao
 sw57UFkdssPV1E3qvGlFL+i3EqCXzWo6L/vsehfkbWW/igNhaTkJkYPJq7KTYn7GkL8NNcbP8
 QcxADoYDnVtckbMq2vegKbQ+7aOHKVedyTI8HiyckL4SoaBtxGcPoq6TomGY38mDTskSlhReP
 7OayoSCKAuWyV9KMWWrKqMIvj662SC6JhwuRmJqRrMUllLzajemAR95Lbh0//6/aSuLFRQsSP
 ff04XzcH7UveBi2mgZIIAE5MlAUervCFSwL3pyDBaqiyCFBcgLYing1ZQH2B+68cwwTsWmz6C
 aicb9c76CHJsWyVPBTRPwopuSYrwJhb0KtRoY0TfgGqyH9iTefRDTJwgvo9uAN8M53xVz8VBn
 h9cXkRCJipR+py8pu8JXaK5PGP+HW/VYo5AyyeM/bLgN9Rnp0yhl5Ms9IZBOdvj2sEI/8viNQ
 XvapLZKmYEMpZMV7QKjoo66ar0i+rPz9ZOfA/UlO+tPiJC1kxrAQYW/MK2rWuQ8/qaayWOTXr
 6bJcbbQ8WX6WyoMbJfiUeXGV0GuaezOOahbVAmOD7QdeZVSme9KAdlx6UvDX5UIXpoJVk+aPf
 uEei3/A6Cp4XOve2m2fsAVq4pDI2KB+pPg0uXEzMGmTHJe3fiI3LAyVjSSX5Av7k4kth6P5Jz
 XtLfcvP5enhlFSgpIjJCY/wkfU83lXX2ci4tBL1uLj7dn9m8iGFsfQQmv8Le8a1SMhwbUkpED
 9tj5OCvLAjY0VOwgJpnf97HGXrDDPAbavc12piRrt2ht+oFcareEOuNG0TdzXvTPoJ6Ev1LiO
 EcytSFQc3S2ChyCbkOyPEjlREGUhNXUP/RR5e8sVKsnAZ7fu2jvJrEPh9LoEBU5NIfxA0NBlp
 p47RygNtKJ8xR1JVB+qPNN/1O9PIi0q6EZ98xjJ/UB0Ic+UGv7UH48ie3+tupNi2+/wOOhDUX
 5IVzQBlyS2bFtittHJMwfhbOc3b5ybX891w6/05IzHKnHpc6WbaFhG2nRhv1WLKSLy9rLUdX7
 +9PcKhPLR3v0UYSsHDJ/3cEcfnDDrWI9LNcuQZaA0ZPk3EeeO9dbI8QoBY34lPIphagqUdCHh
 mliVNlAr5dyblp5yiV6HnUgswYZUpYyw8ZVFFyfphkG1osvLw7B0pDL/ORzcbbxFRLLBej+7n
 SqrKDAIWSSH2wo/c0Ho5xufI7MvWygJ/eSOrFJa2h0WNB9DbsczZTS43BOxCKMEEKPHXjQgxI
 DDQ/kv93bwVSE8v8eFtU0CgMlBGYXmen+dXKwiaQlBnbjUxKNTzPOlNHtNPbCF9bINuhglq8y
 q9lAdlj+bU/1sEjSTHdM3y1mE3MdjuRuIoODk3Rr/j1dED5YeLFXOukAnqwCqCxv/MqNVkoUu
 L7CQsOh2xQ0iy+rSUn83+nFXC7eQMPZxPQQghXzVpKHYg8EyJZ0kLuk+2taOye8QjMpulnYJl
 w3nnWS3wAUAyFY1MCrtLT9NswoUDKnjRK8CCR1C6DP+1SybBjePsNqroBc6BDT7xnUwAeiOJV
 k5cV8Y5CZxhFnIY89cM50L/6p9Rqge9iYNDN+e6pp/qjWxzZ4/hniBhNWFf3sq+Ud029Ar5aF
 N7Y1yLkaKVTS4EnWo32bgycBKUKb/+sJWItiG32ltb5tQHmMVT7oXJ/Cf9F4c7IpPTEhKdMDy
 uH1rGbWKBzVFpkunNBriShVVCP3Y9WJzZGHDkoMTqpD9EyAU86MJNntxV3EWuWKrpdJEsGrO8
 uzETmdyY0kQMt7ZRpKheDVI/3E0XmyviF3gKkJE2MUoY+gO+ssMrqJeyjJO3cfNUEXPfxoOvw
 o+C/0fhnuZ/dXR3/FuxF5vJejpITBo/U0RzKBTpoxhCLJSIq5Qt0u8fFHktqN5K5kzC3v/Uge
 dgCtKC+AdjmWcmqnjaCAPWZqokQFMhbPBTpi5s4BG3IUi3lO1ByMzdANbxpIhzBb3RF/ySUkf
 pzY9+UF2etWt+w2Uum2eVj5ttfKFfmXGCTwaxUda9t0U2tSNuww8lA8RjDuqo8vF2IV2DxOVW
 1t2i4HDMJJ6T0Ind38=

A user has reported that the driver works on the AiStone X4SP4NAL.
Add the necessary device descriptor and DMI entry to allow the driver
to automatically load on this device.

Reported-by: Michael Seifert <m.seifert@digitalernachschub.de>
Closes: https://github.com/Wer-Wolf/uniwill-laptop/pull/10
Tested-by: Michael Seifert <m.seifert@digitalernachschub.de>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 0011c553c2cb..d688ffca3b5e 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2822,7 +2822,28 @@ static struct uniwill_device_descriptor pf5pu1g_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_PRIMARY_FAN,
 };
=20
+static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata =
=3D {
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_max_brightness =3D 2,
+};
+
 static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D {
+	{
+		.ident =3D "AiStone X4SP4NAL",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "AiStone"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X4SP4NAL"),
+		},
+		.driver_data =3D &x4sp4nal_descriptor,
+	},
 	{
 		.ident =3D "MACHENIKE L16 Pro",
 		.matches =3D {
=2D-=20
2.39.5

