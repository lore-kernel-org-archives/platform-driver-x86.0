Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3F321420;
	Sun, 30 Aug 2026 23:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788133867; cv=none; b=Q1tTFMei6txtBQDXVFzgwGpUQAQHGoBD1SRIqc0hpvs4Z0TIpfigaXLlL8n79KKgwZGjnzaprgm2ePg3+LComDliq2kqDPbEp7YvrdzY1EPykb5OaJjCExt7tXGFO/yQEAWz3LgNHczgDBcbAXJGKJZv9DN6oNXtFK8NL2hDWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788133867; c=relaxed/simple;
	bh=Klvav2SQ2GK9boISU4gK6vqd/HdTRLikIcmpIy9K2N0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L2Y0XFUDpW8glAGsVBvZt0j8kIwQ4dbQAmiL+GLBOuHm0hDF0BCDzJubUoFe6wMGa+eRB3XJ9l5UNUQ65zvRjIHtX2LhWZGPYhgQxPoTGNBkXRR+aWDtuljyXE4Br99Q0OCc95Ot4J8cLzmqWGn8hRtyLkeFmosX3l/82DbQmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=W3TvHMhL; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="W3TvHMhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788133862; x=1788738662; i=w_armin@gmx.de;
	bh=efg/d9H9Pex/57CbcAyyXpEMY1VlYUes/msd/tKwx1A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=W3TvHMhLgFj0GOv+lcuc8upILkvLgtVttdIQLxNSYK8BlZHlPZqWrgW76igsF0Pv
	 mqLOESCyvIEjxII7NV3w8J81a09hH6FFuzi8S80TG0NNCjilQa7Ke5EfpQCCqAH+4
	 OZ5TzPnD+MTSSeGNWeAsJgkNIqR13Tg8Y0ivU5uuwCI3kIp65vljHxoaxo+EEb56+
	 /Ex/4NPxDYb8rBYGu4E5FA7yV8C2gU7mzMsDJ4eOzJy/P1AcAvsEt6r6krKj2YymX
	 8Toq5WDM31OEdAVyv8Gy2Wdkvemu0C/6sA1iqLzkJRoek2/qSx/OnZlUZxRokZvxg
	 rcTpBE6IvJXXLFNB6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWici-1xP13O2aKW-00LPXh; Mon, 31
 Aug 2026 01:51:02 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	royclark086@gmail.com,
	rafael.j.wysocki@intel.com
Subject: [PATCH] platform/x86: asus-laptop: Fix ACPI event handling
Date: Mon, 31 Aug 2026 01:50:58 +0200
Message-Id: <20260830235058.324140-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xfZ20wSa3yxi/WtEKcq0JrUlhN5QOhr04k3mPnPfKl24zSUDMm2
 NJx3uzuc2KbnTpLScSCnwyT2IHkYlurQD4W6CW5pjYhSnpCNOmDLBnZ8XE3ASz1xw22P5t9
 4eLPBU1rCoydIY0xK60FuK5Ku/W8682TKOpzMUi+cAkJ6DzFaK2mX9ZGQFxBTpA0uK/Xh1d
 MPnzivwU9hLsrp3hkRnrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Scf6CjNVWSQ=;/u5RPUOvlo/CM70o8btG57gzVCy
 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

The event codes inside asus_keymap[] span a wide range from 0x02
till 0xC5, but using ACPI_DEVICE_NOTIFY prevents us from receiving
event codes below 0x80.

Fix this by using ACPI_ALL_NOTIFY instead.

Fixes: 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify hand=
ler directly")
Reported-by: Mo Jun <royclark086@gmail.com>
Closes: https://bugs.debian.org/1146124
Tested-by: Mo Jun <royclark086@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/asus-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asu=
s-laptop.c
index 449addd1ac7a..79a575d0f5b4 100644
=2D-- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1882,7 +1882,7 @@ static int asus_acpi_probe(struct platform_device *p=
dev)
 	if (result && result !=3D -ENODEV)
 		goto fail_pega_rfkill;
=20
-	result =3D acpi_dev_install_notify_handler(device, ACPI_DEVICE_NOTIFY,
+	result =3D acpi_dev_install_notify_handler(device, ACPI_ALL_NOTIFY,
 						 asus_acpi_notify, asus);
 	if (result)
 		goto fail_pega_rfkill;
@@ -1912,7 +1912,7 @@ static void asus_acpi_remove(struct platform_device =
*pdev)
 {
 	struct asus_laptop *asus =3D platform_get_drvdata(pdev);
=20
-	acpi_dev_remove_notify_handler(asus->device, ACPI_DEVICE_NOTIFY,
+	acpi_dev_remove_notify_handler(asus->device, ACPI_ALL_NOTIFY,
 				       asus_acpi_notify);
 	asus_backlight_exit(asus);
 	asus_rfkill_exit(asus);
=2D-=20
2.39.5

