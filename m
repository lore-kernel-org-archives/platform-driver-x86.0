Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D0348C48;
	Thu, 18 Jun 2026 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812462; cv=none; b=OjR5XGwyAJbhZfXDdhZezYlZnQiXq5+nOTBuP3l4j7QRJznncvqxfRrnkLEc/U2Q+qCCbLksuXa3wPFGXzW5uN0Mclk0sqxaPvX888PyzGJ3sBKn+cqk2V5Zl7bbxJMuA19+N1EghyW55JmwFPrt18ED/ek7Pq1x37X2Tf+c1MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812462; c=relaxed/simple;
	bh=Tc6rupLkU/1twU2Sr/Bn4wkFXjPggYUY6d3AROtggtk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TGHV9LOOEGIOJrIsB2sNWF4EBjUX2HEqx/SyxvPoerzJBTy1iy+5+Iorc7vqMElbEiEOw5i1KpxUg/u21JMoZoGREJX8wK61BbEYnIDkVxMSZlAaZR6ADqiP4Z6HpydH9Zi4g8mEamXCoQ/UcwT43mzT3TnK60oTPLFYIBZ5qaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SVVrGsfA; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SVVrGsfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781812451; x=1782417251; i=markus.elfring@web.de;
	bh=DkxZvz/jjc2Tf2wFmi5Fhf29cUaz4898Ff7O81XPmW4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SVVrGsfACug0sNfbin4c+AP0JbZIh0XxqJDAH3izdW+AFlPIGqgABm/UmHbatI5D
	 W1ucfN3RAdxkoopfTs0CAQ0sdzNDikboR2C8Bh0V+qB/NWr5B1G7SET22ejyddG1P
	 Ajru7G3x3wQDZgwgECZ6qyMUaIsvzwBVMHk/VLy3ej3jjVKJe14QT/NLbUm+6cFOD
	 AmqdUItCmTQNEbJ/HjdnZOVea3HNGzNEFW9yzH1TzjnaqT2MnqMjmDw5yNAjeA1sO
	 PCCowdVgsSErCLAPERbGG1T4SdahczK9cjnAilJ4xjmvCrd6qN6wLxALyr07KdtE0
	 ZuUk2utP9Jaz5emBuw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1woXLr2K0S-00OStL; Thu, 18
 Jun 2026 21:54:11 +0200
Message-ID: <0b2257be-a509-4c86-94ec-3f23847c9626@web.de>
Date: Thu, 18 Jun 2026 21:54:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jorge Lopez <jorge.lopez2@hp.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] platform/x86: hp-bioscfg: Use more common code in
 hp_init_bios_package_attribute()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YVJ91mPTX2dhKN6bwyRKo5Sq6kpNwISFi1J/yM+UhHEqp9YboNQ
 qsD9/J1jxtxI0DZ/zK72ORxBazmHkjFs3rGXtIWRjQ+vK9gLYP4F0sZs5P5tZiWm9ftQgCl
 EEIc62JKNSFHS3ui/6dc2ZhwsMeadX7FDytHFOR8Nb8tPZ6KxfMbh8CseY0uu321ZjBJgnl
 k4/60AHfpmKdi0BFFNnEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JXzzgzhJtao=;Shz7DGSVTV2jCpePfX7W90x62ir
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jun 2026 21:42:27 +0200

Use an existing label once more so that a bit of common code can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platfo=
rm/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd21529..819313a4425a 100644
=2D-- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -692,8 +692,7 @@ static int hp_init_bios_package_attribute(enum hp_wmi_=
data_type attr_type,
 	if (ret) {
 		pr_debug("Failed to populate integer package data. Error [0%0x]\n",
 			 ret);
-		kfree(str_value);
-		return ret;
+		goto pack_attr_exit;
 	}
=20
 	if (!str_value || !str_value[0]) {
=2D-=20
2.54.0

