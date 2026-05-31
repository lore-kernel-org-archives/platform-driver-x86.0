Received: from scc-mailout-kit-01.scc.kit.edu (scc-mailout-kit-01.scc.kit.edu [141.52.71.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81A34753F;
	Sun, 31 May 2026 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.52.71.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261646; cv=none; b=ESdM4w7Z5S3LZPMy5BM+hvH58QUIe9vADfNiCWJuMp1CUrWjuRwH03omUb029Lmty9+3B9J3eE9YRvsh+38wlIVTqRLMTBFsHTRN3fjD8osVzyRUJRz8/ILlQ/EQi1gJYV/R/Zpcr4VnabUPNQ3t0SppfD2UOcrwrJatPKdo7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261646; c=relaxed/simple;
	bh=2p0zgcGslWtW869QMpj7Wr6LFHhDYFbv8oJdtGa+DNc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RZIO0Sz3RePoosx/oABn7U9pGkj9knijzQthNT9S0ZfYuSrgS2fLCWibT8ctfc7mb9NHkIjuAhhw3EiaL5KLiYGfWzzcsi5Ez2moaHwbvdicTKtCuHLSZeeFXOKOZ13k0WnQykDNlw7phr+SA7rGsRpIEWoYU6dQ9x4+XxbYyL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu; spf=pass smtp.mailfrom=student.kit.edu; dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=A32M6h0L; dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=EnTrkDXh; arc=none smtp.client-ip=141.52.71.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="A32M6h0L";
	dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="EnTrkDXh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WK2S7lx0la0ElTp/3LNg1XYOP5hyF9BGGRTnPdTqhl4=; b=A32M6h0LGsRXohAYZz61hgaIFC
	ChC1vrBrx2mUmV/AyPd1WCTmFd45ixn4Q27JNBYBDl+/MQSm/35TQaKBPf/vA2OcEohuwOJ6NxwdG
	pAdGpwEE9ppwvZHHDt8BhGHzQcaGgAgEEeSGCgRiTgV8Cc9NSa6Au7/6xG4eJ4Vi2aNOs3vIAOxxx
	BR+DWzfC6Vdu3nY4OD+9V/bzN5xBM384SnaAHtWNFGb/+fqNgeele2r/Nd4F0bcDZEHcywB5WR5n5
	/xlLj4RbG8rD41YdN6J7EL0ZCQf39Gks5JVF3yLePN9hAFbVN4h3GjJ5WV8+35Xg09TM77rLEdrhq
	bPRCCnMg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2ed25519; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WK2S7lx0la0ElTp/3LNg1XYOP5hyF9BGGRTnPdTqhl4=; b=EnTrkDXhFzPn0b6cJo2pOtfkj4
	wXE3uQtZnEmkfh8pQKdCxPlXo+8NgqLHMtjVl6V+ufW+jsMCvXJwxj6KB8BQ==;
Received: from kit-msx-49.kit.edu ([2a00:1398:9:f612::149])
	by scc-mailout-kit-01.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
	(envelope-from <julian.haarmann@student.kit.edu>)
	id 1wTn8p-00000008Ujk-22ob;
	Sun, 31 May 2026 22:52:16 +0200
Received: from toolbx.fritz.box (2001:16b8:cbe4:7600:5f06:f91c:71b9:390c) by
 smtp.kit.edu (2a00:1398:9:f612::106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 22:52:13 +0200
From: Julian Haarmann <julian.haarmann@student.kit.edu>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J . Clark"
	<derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Julian Haarmann <julian.haarmann@student.kit.edu>
Subject: [PATCH] platform/x86: lenovo/ymc: Only match lower byte in WMI lid switch response
Date: Sun, 31 May 2026 22:49:27 +0200
Message-ID: <20260531204937.62049-1-julian.haarmann@student.kit.edu>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On newer Lenovo Yoga devices like the "Yoga 9 2-in-1 14IPH11 - Type 83SE",
the hinge switch WMI query returns extra data in the upper bits
(e.g. 0x50001 laptop mode, 0x50002 tablet mode, ect.).

The driver previously checked for exact matches (0x01 laptop, 0x02 tablet,
ect.) causing newer switches to not work.

Mask the WMI query result to only match the lower byte and ignore upper
bits.

Signed-off-by: Julian Haarmann <julian.haarmann@student.kit.edu>
---

Hi everyone,

I just recieved this laptop and am trying to get it to work.
FYI: To get tablet mode to work fully you might need to extract the
Intel ISH firmware from the Windows driver.
This is my first patch, so I hope the way I've solved this is up to
standard.

 drivers/platform/x86/lenovo/ymc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
index 1b73a55f1b89..ffeca452b392 100644
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -87,6 +87,9 @@ static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
 	}
 	code = obj->integer.value;
 
+	/* strip upper bits (e.g. 0x50000) on newer devices */
+	code &= 0xFF;
+
 	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
 		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
 
-- 
2.54.0

