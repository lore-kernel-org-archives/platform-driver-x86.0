Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9423F825F;
	Fri, 10 Jul 2026 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722959; cv=none; b=Q2TSMr9Q4VXqFHvvmjdwnvybrknZR+U/bbIG8JQEvaFKhKHt6VH51InIyav3ESwk/l920xn2rGNxafVbcgy2afK4Y+PcNpqjbVg8mIDIhOhLb9bjdx/oiSrWKNgtYQK+NIzNpYqGuqvudm00SFiBGPgNgHlFt+dN3vXZXWTa7MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722959; c=relaxed/simple;
	bh=YaxrrLimz+VsjRAY4hQhNV6GwM/lL/kOGzA58EWkrUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tswj7335Vf9oxntyE02vOAyUzO9B+k/aMnRouDCnhCJEasTTlFaWuNBX0cIaLLfbWiKYzVBRBaCoryDyOMPl5B4QfBEeFIXNn8mHLn8y5rPFDrBjZer8JD5uoEGFKvZYUkX/carjRL1ZuzcjPImYN4AYTOGPY6G82jyOt/yw7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MFnHZF9L; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MFnHZF9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722947; x=1784327747; i=w_armin@gmx.de;
	bh=WRHLUNW5twJd4IM80Q38L+3XBLrBdfElE370ICcLt3w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MFnHZF9LqAD8ayGxWvRp7FKtsthLAGbWfzGHSl5W2PVqWs/9NnM35XivF9WfAiDg
	 wPg4Bx9bVuEkOX19VK2lS0hQd/LsA66o7OPLcj1OXNbjpuO94ibSRD7uw1gmpZ+OP
	 JpZcFPAypR4es+Cs5MKww1HDTMfOMqi2Zb+DFr4OXpE1BctDwrbcvA82QqH237rcB
	 tgVdEI3CY4l7H2swKBPNX8K+vLiQH9pDPOAUxNYmxmVeDXeEW2etmL7bpUMXksoZH
	 D7So8Z6egeeBKIKb5Y/RlyGN+FaSo0fYSYFaq4rqdEMePGf8DrPnI50lNCzqAb8Tb
	 6pisS26n+5tSSFSFUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1wQvGC23DX-00QA32; Sat, 11
 Jul 2026 00:35:47 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] platform/x86: uniwill-laptop: Remove single color keyboard detection
Date: Sat, 11 Jul 2026 00:35:43 +0200
Message-Id: <20260710223544.49602-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710223544.49602-1-W_Armin@gmx.de>
References: <20260710223544.49602-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NHVrKK4ePJ9czKx8sFNZyo+qznPaAbaFGcf3wQLGf7NC3T+qM+o
 aW0P+MToiFOxVDv8fa9B9FGQIcP2fVRQYo8vqjzYlni0vVmWPcws9heLMk2G+fFkSRswSFZ
 J1IovyHnZ/avdvkM10TbOm/u+LWZpi72ey6vAhoAIP88MaSwx/1Oy2yU3xmvTP++aqjOFRp
 NSWh4m4vYIrQtH7Ks5hsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PLWgrlAsaEQ=;ZRYIGUrhHMd/qJwj35FjFWMELB+
 PhHQgPqwIlPJXUc2atAV5opZ6CY5CgQSDFkvvBTmzkAFapypH41QinCgZA7eorXsLks5DvoRy
 /2smqmxWq18XkCQnl3K9rBhYmJ6QGCOPW4iiiiGPrwixfXeIGi5O8FRuqrntgAhdRR2PuHJjv
 eXNNF5XpE3URaV5nbu93RGZUNIIV71hPns7r2XqA7PDm3dosCrgYHM87Oo8erNmif3wQNM/uD
 ltjr3aK4BpK+VvF/1Nz0HKlph2Z46XXHqvglW5QPZTmyweqx034+YArISrHpelNYYsVlBkT+i
 fx68HfJHqYpRyDw8DLHwP+qRwfA1NtRpuxB4bs+G6tEdB7xckwO3kcmwFOulBnQYjDQjQ0TA/
 pb/pztIFVz26b55hHGgNpSalamCcx7pAu9yHB7lYiQ3Ij7PENwcPoBMIRSXSBpY7om9FOjXQ0
 n/X3ny/vblem5EKIEZhKQ7FV4flzQmzTOE9NA6kONxweTX2TdyojerdFcBfXuFnajzpDeCwx1
 OhbEnjXZG0RwmZ87p4LC/6zCaUQjnf6m/4FbxbUqwg++ktS2b1pBlwFUbrY+SomIuJFQ3L3hR
 bfinHMZu/GyM0iVTmT9oL1t+qUtHUQE1FQYbyNEh43GOHMjMcbjewvb4AY+0lIe0TJqoGi3T3
 edJEAZEJ67BnPdAju9GaXvXHKF7Dz8OCwl95HyJ/QotgO2vzMVnuh83cNisEFJVgGHyKdiP+d
 LkSo9A5VfGoSZCnEjA6a0ug4HlPzOSKsg9yVM+C44SPBcYELgCVZnZuWPwVw9rGV+FPlJfvO0
 DZ5Bwfma5q2EtC/myDgpXNYP24LPMdE6lccgWuNep++iGkS0rcsBoeQBFNQ7H4TWidXbMaxn8
 t88LWMEznfe+RdyES7T5rqlD3muov0qTAXHe/hCx7rfz4GYUiNyLlS6kzY2+fuWL5LjGI92vV
 jsyTqt2nZCWxZytF54lVwpn+PEZonqevY92pygtbF1EPE9ePJ7X0ilGr+bOWhl+7QcSP5zBuT
 K+zu83dk4fRdcQRdVq+nHvJqNbdpW5eyJ2eLZu+nMWTI3ZrySOvMytXytk+ev42sougXgsjLu
 ir20l6oJvEKemCF6a050ZMcG7aY7FfM7gPEyFvxB3jJx+8B29x0+U56UpDBJlzUufsb/I3JI5
 moP2mtr6GjJaMo+6WIt9wjv/OH8s39Ar9dcE285+vqL5UlOVxDqtnQzClya9RCz11mC/fDx6X
 u+VFuUs8ACPtDI+HqqH7SI/4IusWWWERqlVkgejRlJiIqOW/uh7WTAeUHnXmfwwLuRQWyUGfZ
 Lb0XaRbLrelfn/nCXfY5Qbq4LYs7Yd/7jNktZJByccWXRSSzd/hzZwudviKF20PwMaHtcHeFV
 kvhF3abgOT9GkWgtiWZkiVdDtoRxfV0dMYGuwtHsAJ94oHI8T4+XSPf5LrvWQMuQGbj8aDuvZ
 0h7rWkGMcC8oVcQBFQPuQB1gAKf3EQZ5MBzIjMGhVROBzI9DLu2PFlsGQuo7lYUVBRU1QhrZD
 FrhypggXL9/x4u90IbBvub26xfn7ZfHTWEXLQhlJ7bmEFNerdszyseTlLeUwhA1myXBXaqC7Z
 gdfy74cP/ufp9bI3Ajl61VOseHbFYJ3OYOcHARmnJbQ4+/qiCJuh2RkV4LSXaGbdHRW595gPN
 0Tmj7GIKZMN5EHLGO1q2LetBccqn3DmtTCELKGmAuWzF5Hkhz470XzEDUrTfGPrHpD+SNSFtx
 JGczPRLOVjJAZRiOK6jTVT0yCP0KK1ft2jJO5rr09WAt8r5Eo3m0yHoGwzadN5fxCs/fDIWR8
 +hmlUze7ncxU0ibXqBOhmUklnaRjDl5j9XvwO6A9xK5bQnqif2yqpYBi+9fimlD2Cz9h8wEDo
 gmQCnBEUCnF+w/F6bkRyiaf2dCihMQ7njbf1Ug/JzJ6RKeKfPvMQ5rhlX5+hRTVoWoXYf9TW0
 Eb3XTP3IsJrZ4TGv89oZq8cvlYjPDTHedCHJomgugIDpQRXzrqsxbjnIzsc9cDn5SXCmmkpHi
 5UbD8wMZDY5ZsJ3X4HkFU1GMBLSr7RrnKSr1TCtXiqe72CZM5WMm2ZT3hctKUUaOkqn7zWupf
 b7DiuEYl/5aqFF0pJWyLY2GNmEMFWasSlOAesqBESaQg3u1/bFjRNfm08YwPC+XWoSh/kzp04
 fdYPuPdwW7+s+1w1nIdHeJPaHropFpo6+BvNYU7TGUhyRT1ZdG8HUJizAEB9N3Zrm0iM7O3UP
 YTaxOND+u60EhW+9g1W6Yu4aAq/YTPQuSDReU649diNnh8CXQYo8EgvuEGWEkjGUE6f7DKk0x
 FH8ZoeQe/X0h15mgtZvzc2K7jlUSk4h6FbAnq6vbZcXVmdKM1UIFAWJOoeZ0DC9HXvHjyqH/m
 tE58HvsKlUqeJlwdQM7DuVG0grvmt1enRku27R/3Ji8aKjoxsxPOk8mRMUjgK0/EA6a06nsKj
 2DHdRyhNWK2gocS7k/c3VkIU2Wmbi3G2T5n7d5uHztn1Qy5hJIHbDqNaDxg5iSzJpd6NKz3LI
 DveqaH+eMuUt8+IpAth2FOsVY7+4/zigYy4BhH2dHjNJ0zBoiaibPewO/v/WaY5/ml+Ng5PQm
 VKm2SftLlsdBTAyyhwJP2+rDmN3D0yfuk5d0DOB4y3pNCA3okG1Jr84//ZUaL2zmLCUDf57fk
 KqONj6iR/JKtR0twPsF7uwcQzYgAe4cEZU4J2AzNgChq8/wvD8Wt2BNq1Ox++e8d2x6y6DNwg
 07IktosKBKW7aohuqB+XT9p9VRIXkm7BeWIpOIsem0KcVVMr0Wkj0XChN40AGHXpLaFFGOFfA
 vsMnQklbBaYKLO05LegDiuKxyGWe4bXIgnTX2j1b5XciJArL8ulRHDwa7CUvFiFeOvixnlVUO
 f57gzo1ttTtGYB5GImqchJiXSUz6o5dwv3vcUNeNCoDAhCOfY4eJO3HzTJ/uB0shSQBgv4FYt
 0Rsd/Hwg8dhumMr7RLk7R3arUB9CBm6PGJzMTqDvge0gS+aO2JuaWBWyFBxfntmVxFlsMG1Zk
 xrZ/vCWvn+ppjGSP1dJkWmFoez2vzDEURq9BRkN7gpEhwBsXqYuHvarBihB3X+2JaUkXYlEM2
 sTwg7hi5Cci6KZbMkWMEAJg683bsYA1uWTuV2wLH6msWb0GZat3jzlvtPthOqRm4S52D0SksA
 lcbB2rE9mPbV8aX5Z20xJfHHt1W48qwLvKfWw2kL5vNWd1OUKU5NZcEwcMWVv5yDlf6YnpB2M
 Lq36CD4+NL6BI317jdiiK1bY1rJRHcBRUDcdI5Y5Jmv1iN/ufqPRoi9eGP+ZxaYJlJ6Fvmh3o
 ZtnGTZLE1fopRedifTjdzlTcCUaTqZE71iwS2HlcHn7j9NcwNMfp+Yj9vaU+3Lj/b/vh5TRHf
 zjBviz64J9YhSwtdRogKdxAqr5MZka8pFfVXYK4qHP7kzH2bIJV8gHhxrSIMs+dpJMjiuz5DU
 jW2UjXDXoqKo8KPTK6jWy5lxfo3RRzZ7Dc6SORg4sreeos5FD11ky+LOFsLEi7e5k3ZJdE0ZI
 jHae5V0f5akuMStapyeDpIjMIeJnfqWNngQuosChxVAA9R4lHC1qZAItpTPhSMlE/1GsKMC6d
 zDB3Cb9zebRi+z82JAKOMFZz3YHEclKarnWPEOADqS5+StYTfKNmHrxm0UPH83Uencv8wtD1B
 EMfnBLSPmJujFfSEoDq9mNEZK1T4OIhgzXk6JY7olwP20jX6B/NOSEyvCb/g+lHN36sej4iH2
 xH9MWCLKlWC4NVMzAfSdJJ10ZMgEA7MyoV+qNTKdBKMOly69IYEC+yh1zUcrOM9rdl6xVLVWl
 z9w69hUeZttrvObA2ZYPBhHwcm9Gvl1LUqLpNQcFB8WPOnlDQZaRuSk3Bigsw77z4a676bSRQ
 cR122o9U9UP47M54Rc1zC1LH8QzakZtwwJ3hgOFk6KnkQx9Mzz5w7VjEkw3OI/GQoYUdysfG0
 fhR40BKxBTYAI6SlBjl7r6eyXf0lSjsShHCu4FBNWE2uvlwjpL9T8GNU1iE2HOH1Gwm/kBXMj
 Us+qP7HBkphSbHQsJ93zyqNY/k5SjfxVZGn0DmAdR65iPEYvbpAD/Ah0YncZheBTAG5Q+3VdD
 xt5Oav2Qd0DQSnrPO3malZz2ndXC5ZW7Pu1PGKVVgLv+6TkAsWtGjC2xFAFbhcYdJ2t6ERNJA
 JGzh5xlBL5XBPAxxL+fVgKSoYwuj4OsiNMRQmvZ5tmTfQYkEGXMguFjadSCXzJb49pH1FMhTQ
 Vm0poFwTX6oAdFi+5ARCn1J+E7whSAFFHh6QW8/4UJz6ffI+pMeLMQQ8yAlPK1F39d2N7xPq4
 ssjKD1lgdcV6UVXv9bZ72E2L3n6sP+mUrVmFKHpT1QjYgFIJ7Z+E8kB7ehR1LjayI2qPxQNRP
 gKD/A9gWqsztP5KYvFOUcnArfR7htgtkh41rVrNpKxnwMYuxhFPPwwC3W2dvUNmqh90TGOWUJ
 WWXY5lQ/rtW2Y9BudxO4ChCsqryQGWL2MSpLBuoE57sEaogvhQhPySp5E5hs4YaqG+rTIwHjd
 OGvSWgzPzWlemFUY+9oou5g6hxJnV5d3uAmNscV6aOf0RhdzMk90aQPmdqljRvxbtDvmHuC5B
 Pr+A6aVinSP9TqJ79W+BqrBBw3VkFcRz2Ggms9Uu6YQBPVRBfcTg5TXH0caCxYT+iqM1YdIoE
 aUD7ZJbli3JG9V0P0L1Q6GK0MPomcOeVX0JSQz12etZGk5hz6yXqq6tQSQCUV1wamvvfRBE20
 Ez4U3xNfLWQdwWmp5io0MkM8xwxolooO6U6E8Moy83Tp9t1lGPv7cEmhr8GZuIgOeLdx/+6a/
 Mcr3OUOVKjbVzcQfIIOBgW6xMQ69K9mzncHnvxf0Fmdp/lD6S1dIM3i9KAyY7WDksS0xYModK
 RvKU29rOz6i38VcsRoS3nwwsSfARwfOY9u5UVEi5MbUymC2s9Uq4CNsc7JnXxdRNS9WL/BDsk
 brtWR9/FkSJFptobMcagQTIIrgszl7lcYqbGNr8gRlU4dCTmvH9jn3DaKbypP6I6C3Y07I8X6
 4WW9qKx5a2P0NF5TLBR2vnzwZ7g8S8e/UziPTHEyNwAGmTU7GGey3fgQl6YNVowRUvNM1yaCX
 zgyvtneMKUrNp5GU29sMJFd8Bs3xR4xq+8/4AlkL09luHAPBFhgUUhidG/4iJAIwVL+sQMHrz
 hndTszQdwsr5TjIAODg5BXmxgY0aXBrGCNBC0KMYuvDg2YcAo9GtQrHxqg/JrBq9a4OVLDXgZ
 T2s9iITyl1prLnF1bCSDS+ebiMEOPABoM1nSpMcXLXQeH2IfH7l3yvTfHMrcxxELE1mZAOOla
 rx+0cGEjw8qKqUcG7vrp/56R4bUT90M66dzw7ggW8imFDnUa1uszQ0roxyfxtlv5iZENTh1y9
 8DQO16rTyqXFtTAnhGwVHlfMmLGZTIcQIm2O/rOu6j/igj72GyEovoUWkq1zBiKSl9AyHXEk7
 +scekFyJY5N5m8AyQioZy62SQBn1ZWEsnHLUzkUUtCSM8iwcqcfG2HdBPxRWDSEqq+EsUgaK/
 ztQlrxFPB+Ka3tTUVQ3E2x40WQ447jiA/9OUpz6akRojwF9+BLTKWLEPyDC4d9h+8MBnRqTe2
 65cPMRoK9LtD8ss6VI/vwlhSDNxHRpo+0ihap46PUVMQs9cv4/6sOcMcFeEnTernoul21/X57
 OUZ3OYX/iE+CWS3a/njgTYaKAXz2RgmmR2+HMzEdczmOZwbtQNnLl3JpjSaY6C1kmhoOG1crr
 isXNtfywoy/HYgBdViR5BOZyRMd8n62RgZvrr0QaBcQ==

It turns out that the code for detecting single color keyboards
might not work correctly on future models. Remove it and use the
device descriptor instead.

Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index d27f316800f6..4591ee299a90 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -255,6 +255,7 @@
 #define FAN_CURVE_LENGTH		5
=20
 #define EC_ADDR_KBD_STATUS		0x078C
+/* Unreliable */
 #define KBD_WHITE_ONLY			BIT(0)
 #define KBD_POWER_OFF			BIT(1)
 #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
@@ -400,7 +401,7 @@ struct uniwill_data {
 	u8 lightbar_max_brightness;
 	struct led_classdev_mc led_mc_cdev;
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
-	bool single_color_kbd;
+	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
 	unsigned int last_kbd_status;
 	union {
@@ -426,6 +427,7 @@ struct uniwill_battery_entry {
=20
 struct uniwill_device_descriptor {
 	unsigned int features;
+	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
 	u8 lightbar_max_brightness;
 	/* Executed during driver probing */
@@ -1629,7 +1631,7 @@ static int uniwill_notify_kbd_led(struct uniwill_dat=
a *data, int brightness)
 	struct led_classdev *led_cdev;
 	int ret;
=20
-	if (data->single_color_kbd)
+	if (data->kbd_led_single_color)
 		led_cdev =3D &data->kbd_led_cdev;
 	else
 		led_cdev =3D &data->kbd_led_mc_cdev.led_cdev;
@@ -1858,24 +1860,7 @@ static int uniwill_kbd_led_init(struct uniwill_data=
 *data)
 	if (ret < 0)
 		return ret;
=20
-	switch (data->project_id) {
-	case PROJECT_ID_PF:
-	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
-	case PROJECT_ID_PH4TRX1:
-	case PROJECT_ID_PH4TUX1:
-	case PROJECT_ID_PH4TQX1:
-	case PROJECT_ID_PH6TRX1:
-	case PROJECT_ID_PH6TQXX:
-	case PROJECT_ID_PHXAXXX:
-	case PROJECT_ID_PHXPXXX:
-		data->single_color_kbd =3D true;
-		break;
-	default:
-		data->single_color_kbd =3D regval & KBD_WHITE_ONLY;
-		break;
-	}
-
-	if (data->single_color_kbd)
+	if (data->kbd_led_single_color)
 		return uniwill_white_kbd_led_init(data);
=20
 	return uniwill_rgb_kbd_led_init(data);
@@ -2351,6 +2336,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
 		return ret;
=20
 	data->features =3D device_descriptor.features;
+	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
 	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brightn=
ess;
=20
@@ -2580,7 +2566,7 @@ static int uniwill_resume_kbd_led(struct uniwill_dat=
a *data)
 	if (ret < 0)
 		return ret;
=20
-	if (data->single_color_kbd)
+	if (data->kbd_led_single_color)
 		return 0;
=20
 	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR,=
 RGB_APPLY_COLOR);
@@ -2687,6 +2673,7 @@ static struct uniwill_device_descriptor machenike_l1=
6p_descriptor __initdata =3D {
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
 		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color =3D false,
 	.kbd_led_max_brightness =3D 4,
 };
=20
@@ -2869,6 +2856,7 @@ static struct uniwill_device_descriptor x4sp4nal_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
 		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color =3D true,
 	.kbd_led_max_brightness =3D 2,
 };
=20
@@ -3363,6 +3351,8 @@ static int __init uniwill_init(void)
 	if (force) {
 		/* Assume that the device supports all features except the charge limit=
 */
 		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
+		/* Some models only have a (white) single color keyboard backlight */
+		device_descriptor.kbd_led_single_color =3D false;
 		/* Some models only support 3 brightness levels */
 		device_descriptor.kbd_led_max_brightness =3D 4;
 		/* Some models only support 36 brightness levels per color component */
=2D-=20
2.39.5

