Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615474DA9AE
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352072; cv=none; b=s8Q5KkYQMQ+7kBWyURY18AE7+Z8A2EBav4QFm+tFuuzyO8Zp8KXGXbL7MYBFss3SC4ZG/Of+h8FFoRp4dvEaR1CB7SoHS5Z0ZAJ5dCLUQ3F9161c5KNjUyJjnel1LpPnhbSHPxCeUci8LljDBYJZuketygJXe53OphL/36qnwno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352072; c=relaxed/simple;
	bh=zf2UtTbZ4zkmMe3Ssj+l3BU0kjyOxR+iP8Kz6p4QUmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lY9KlwQUOgdqfLnt4tPwilLAbkTQ7qAOHTIRFzLWPeYckNUdSzmNaHLfb0vbMiH2d9/v3DTWqTl1tU++0UEQGYzkXsGhotn6g3j/yoImfzs4uNm9qlYfnBq347EFpW0mC969FrfRo3lyeRGcFxXyiFLfjUFciRp6B+f2WdunPW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ksxKdkJ0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QtG+Cvk7; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ksxKdkJ0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QtG+Cvk7"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 2D1AD1D000CB;
	Fri, 25 Sep 2026 12:01:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 25 Sep 2026 12:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790352069; x=
	1790438469; bh=edD9mBF1zaoADesSfW/vNA6p/11JAhVLOeQkcWpHZYA=; b=k
	sxKdkJ0B+8ZYyMxTA+RJch0CLQ0/krXY77w5JEZcsWFCwH/WHuG9dAkCK8I/tMt/
	PPw/XCyVpn3R12aW+VNL46KoZQvbx+WodDekkUcRHKHUvsvYHsQQsgJC6D7Q5VBh
	IL4DEqYeMW8/Af8XDHZUS6iPD1cect/E+EFldV+4MdCwDcbx18Vxqxg7VKvi0XXG
	efiYCjxxdOWY80Nfp3W0B+bP3hNLw4atn93Zj1NHNFFWFzglK/5xFlIexr7Uwvv7
	ur/UznNOz0Fek3T+U2gVSx7Z2CR5MoM/RgUbK/hzmooQhjVxSYkpe4N+nxsy8N2c
	FJ5wAuwM+hF9ntaJ6kF4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790352069; x=1790438469; bh=e
	dD9mBF1zaoADesSfW/vNA6p/11JAhVLOeQkcWpHZYA=; b=QtG+Cvk7WXOEqNDnf
	e8kg02gVRcqoheEUrL0AOn1NzepCK+6J4fNCd3pCGUZ/GmkNP9ofG3+76mqKE5iB
	McP8J7CVHu0qVElD7jS+tdQKwHfyATYgbLgGtQa7mbUnsyWrKoqEDievpOt7Megu
	kYvOYWjbzvygyaWLAQhVX7DiqdTCufpPQwGscjXL4XFP1OT/R1TMwCECeOuwXIk4
	dk1ksdtBz5sZ5l/4OKqDe+fse2q03t96kNpDW0H7CcdBuLxj2iTtE0tTgTA9bwXm
	jfsG0waUSmgGP+EPTTEJt2aIJAmPsG6tQGoHa8ma01pFc6G2sQ3A1WSPeeJkV9L/
	Aa2Zw==
X-ME-Sender: <xms:xJq2avPoDpmNUzA1fPKQmUm0RosDN2S3-KjvgddKdPpwOWmsCjHkhQ>
    <xme:xJq2aj-fkH8H1wTSxgTl4bgP_tNDa2D0WVcwNRmVJ3jbl7EMRW2BdPMwURXX2PsTI
    qRHWSCB57qMjVydnrbVBmac8LdpeLkYjpdCOra84mNbUjnhtknxtRE>
X-ME-Received: <xmr:xJq2ak72-NexfNJdpKqJZQTAGBosqvxBV3htscuyN42w4Go7CKDREoVoapeH-RTCchJaawzVKhEE6Ntdino>
X-ME-Proxy-Cause: dmFkZTFYJrEAHLfmv/xW2vCYxkhRzd0z8ADSnf4TBcdobqlWz8GWyX2UReT/wzzNzhYlQU
    Cql5Xpv0FvXpdK6aVcPrZ8vqYvDla8e5Jij4et5G3e+aS76BjYZOXhVu5k6SEoBoJ51lBQ
    /pZDlBlZuR5n1+2uwVwZ2zbyEfozSs9O1e2ybX+q7y+7fFtVtvbM13SAPD7jqMS3WlIf2E
    9vBsJMGfgv5eTXo5GH1gdTNALAo1h9vrpqeZYvQZqtzVZRETcIqbawitK+x+IY3tfoGclu
    qUddPMfTaSOLnT37RtH2oy7XmGY+2pOz6PUZNnEZH+vKBMqm/i8yo7sOeGMSt3gP5EQ2NV
    855yvvCU4i+l+z/PdQR7Mf44W1MlLWE1XOrzZX2Snu18yWd9olRG0HAh1vaBQnLzAwSzoG
    yuId0KpFP3pT3C4xeTCxk7bxoQd2fgr4kswnCXfNbF5q0WdQhRQ57K+4jGlZlqTO2PUZeM
    G71Teg2koiR4IkOiM6JtXP2ZAqULDBnwSyDgFpxrDKrLQSH0tGkaZcKlikdrrRQc/rVJyl
    6vYH7IH9Z2Fk/j53aJQS+/BdJsmpDaCR5Dc1H2yB7lSEhp1cqahb8hJnSLUXmXTN4lUE7s
    kAmf5AzDbkk5wvEO6J9DTYbCqTNrbIQVj1PKZFwIl9RR0SH2aSNUEe3xlmZw
X-ME-Proxy: <xmx:xJq2ah7x6jYrEaIA8deHwmCMp6Heysp9N-bXvxdO3HLP5u9gUJiAZw>
    <xmx:xJq2alruFEVol2jmYz4r4Y5pVQvecQJHyauy4Aqmn6K75t2wwMZd4g>
    <xmx:xJq2aqM4ujFqiHCldmVNSCjg2fmSXdrMIC_mm11v2HC1v9tPnZSvxw>
    <xmx:xJq2al1kjpJ8f_xwqlWDwpRUvNGcSoxtM9UcVDQHN1QN12T15pp57Q>
    <xmx:xZq2aoB0jrtuDRVTQf-qxXjogGvcDyUgqo1LsbfRnu1OmKrMcpbIetyK>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 12:01:07 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: prasanth.ksr@dell.com,
	W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 1/7] platform/x86: think-lmi: rename think-lmi to think-lmi-v1
Date: Fri, 25 Sep 2026 12:00:29 -0400
Message-ID: <20260925160047.2063361-2-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preparation for introducing think-lmi-v2 - rename think-lmi as
think-lmi-v1.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/Makefile                        | 2 +-
 drivers/platform/x86/lenovo/{think-lmi.c => think-lmi-v1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/platform/x86/lenovo/{think-lmi.c => think-lmi-v1.c} (100%)

diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 91a9370f11b3..98a3baa45fa6 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -4,7 +4,7 @@
 # Lenovo x86 Platform Specific Drivers
 #
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
-obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi-v1.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 
 lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi-v1.c
similarity index 100%
rename from drivers/platform/x86/lenovo/think-lmi.c
rename to drivers/platform/x86/lenovo/think-lmi-v1.c
-- 
2.43.0

