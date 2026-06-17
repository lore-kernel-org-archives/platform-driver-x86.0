Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F839D3F1;
	Wed, 17 Jun 2026 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687227; cv=none; b=lHJudC9E0MhvnwWnb01y8V0fQ6HnPfTZmTMyWHoI4kyu/FdMCrOLs6aH7N5l1JNbAjTrCAzzX2NuIR9xxbCT0/jw3gk1bixLVzmiNeV1fZdrepRx9saziDGN8clr4dIjqb+YUty3YKGi3LNIjwqnaNPhpR1P7+QtI05jLjTXjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687227; c=relaxed/simple;
	bh=zGPKYIwbCEQwW8h8an7tlnoCrxZzg4+8UQlWu+a4cAg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=vDZmlcBlYItUsomiB+mSqZdJYlUVrGwG63glJjcrprwdt8kAC4v8sO7KqOqg/x/OurbyDdIiiC95tQXNZq5jhbMdAxs1olAHh1YYjF5yq9Vt96iUfmEulf31khLge3vh98rw0W4Vy3QtkXges6++FN5rCaL3XUhR0uQ0Nvo1ygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fETtJl5S; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fETtJl5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781687214; x=1782292014; i=markus.elfring@web.de;
	bh=tU5APMX14nCfW5voKT2IcbS1bVgk77UiUdVZmnM3qSg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fETtJl5Synj/pAq8USM+srns3EcGr7mKHtqK/A3Tlbn58jOXXMaGu7xvOoGufpeL
	 ZzdW5+OJsEtkP2Tr7tvf5g/6BUS6hZ0MaYvq0+4E3GIe3ibFNT9xGbrUGgMcp23jj
	 bT+Vp2+USsWi1SUj1vUzC+lMGReoxY8jahHg/PiBOlLwpTT1UdXrCHI4CHm5X3eq7
	 RuLJ3zX6+mPaGZOd7mZkk/SaF1CJofWG3Pgi9StBrrXklUtHiE5JdpC0h4NL3awT6
	 DgcloL5c6I/k+zEpyVfvkkiL31Au0pVzR6kFFgT7m/x+xujxzW70RPTpesT/KdCnk
	 QnnufSS7uEds9SwbWg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N01di-1xMoO02s8U-00uAkb; Wed, 17
 Jun 2026 11:06:54 +0200
Message-ID: <fa7a5865-6dda-4305-ab48-e0c9310520c8@web.de>
Date: Wed, 17 Jun 2026 11:06:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: platform-driver-x86@vger.kernel.org, Azael Avalos
 <coproscefalo@gmail.com>, Darren Hart <dvhart@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] platform/x86: toshiba_bluetooth: Use more common error
 handling code in toshiba_bt_rfkill_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8b+szA5fVJ9+tFNMDpGY/Ptnw6YASQqR96380A2B6CsmIKYUvzQ
 UqzUqvuy9Wl4SSKnnFwJ2GbQ+nqi6/ECQ0hnv6rGy0kc6be8rfEc5l15lc3nc5BSRDhwPib
 3HrYIf7INPouk4UAVKiReqhBmB8CTw9Wp7BcgQlJhPMJt95tBMN5pjiaKUP5yL/9ky9VAZ2
 JKtVIgcskc4hN4osvsD7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y+XH9etJaBc=;R8iE7/Yiu41Op8DtRHFiJl+zSbp
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 Jun 2026 10:50:15 +0200

Use an existing label once more so that a bit of exception handling can be
better reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/platform/x86/toshiba_bluetooth.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x=
86/toshiba_bluetooth.c
index e00abba58c7c..bf199fba4999 100644
=2D-- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -252,10 +252,8 @@ static int toshiba_bt_rfkill_probe(struct platform_de=
vice *pdev)
 	platform_set_drvdata(pdev, bt_dev);
=20
 	result =3D toshiba_bluetooth_sync_status(bt_dev);
-	if (result) {
-		kfree(bt_dev);
-		return result;
-	}
+	if (result)
+		goto err_free_bt_dev;
=20
 	bt_dev->rfk =3D rfkill_alloc("Toshiba Bluetooth",
 				   &pdev->dev,
=2D-=20
2.54.0

