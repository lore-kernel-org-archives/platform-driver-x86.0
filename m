Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D4F3F54BD;
	Fri,  9 Oct 2026 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550587; cv=pass; b=T+bdeKKFvF6PDDvonk+ITOsEioCzdJgux1zJAAegIBzi3Ffe7VSRlC85WAihA5dyEuzuHGXvZiRt0Er1lndcHFVIP2Lo3MBokr7fdl1WWVeVDWdWxuugcPGDdGyhisGZcSJUzapjE1oAqg6TID40+RUhjAPfDQ75xBr0OYEKXe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550587; c=relaxed/simple;
	bh=QX1Ng6UYlSkzsnVOg7lT/ha9YIU+XzvEkCZJBtVx9kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJyPOLROkIbSzBek0x1Scthd6/af1EkeKhCZeflTc5fXYH9l/5yKhQUDD3chvfe3GQBPnJFKGRfjpJpg9PmDSGBZ0+w4XSSa9yKmmnzGWY7uSM4/mQ0epo/bCut79+Wjdp9GZpIe/jt6NXU9YUJsSeOlIEnS/0tI1TIDeKgA9EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=d+APO6rF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="d+APO6rF"
ARC-Seal: i=1; a=rsa-sha256; t=1791550493; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DHOtUbILShknKosfChXDMIb+DwXiwjdLsqDZjJ8U2OF8IOP/RwvEKJTIlczhdBZ/OzCdpNnNhejk5fJY5lNHfIMA5ulx6+d2BTNIX1RtivoMecBBOA6mgHH8ADn8GlSICNxl0u/UgjP31Y4kfxUzMQoQaG+0a1ODV7t4nEB62iI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550493; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t2TzSpFyz3JcENf8gmzwfQ6e/Pqrx0H55RTixR3PUEg=; 
	b=DhNO6MHuSRXxA3rXMpNYsJOY02YhmTclmgaf2RcrvaMpr1kSDoT1EjNEanCMOXb1EomDCYrfKfTe15WHFNlcHTLi7zZOBMSlmJItQQRgB/mRLr4TfcjdJXPHd6lYKnihIjRsPjvd0D1txsxHCvDK6cqMLItNoYg7dJqKTTzdZmk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550493;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=t2TzSpFyz3JcENf8gmzwfQ6e/Pqrx0H55RTixR3PUEg=;
	b=d+APO6rFQ8H0xYw3rTCDo4e1Mve04zvdn5piErROyg7/7da1hGHUePbt2J1eOEbu
	3U8zuqhZI5fdAzJHMYoDvQaSWwa7vw4uUwVXvoXcY8NHRxDKiC+78NggG3t4WzfjAu+
	U6q7c0Mt4i4jNZi2EQ08gTE9ZoXrNPglb0JCYVnV78Cfvys9d1ODguUcaCCt1Ef8JhV
	Rytwa/lmRt2thhyoab8P/ekWE7Uw8HxFBcoiknYicOovPfcq+WuPaMT1NhDBTViJYtd
	CAdSPfd4MVZAW888PHPfObhDWE1v8a+blFdIikNrYcaoNeH3Ks1nvhSf1/yaTpq3LNZ
	PpdT/mGW7A==
Received: by smtp.zohomail.com with SMTPS id 1791550493164135.4886936038523;
	Fri, 9 Oct 2026 05:54:53 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:54 +0800
Subject: [PATCH v2 12/12] MAINTAINERS: Add myself as a LENOVO drivers
 co-maintainer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-12-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

I regularly review patches and resolve bug reports posted on the pdx86
mailing list or the kernel Bugzilla to improve LENOVO drivers (including
lenovo-wmi-* and ideapad-laptop) along with Derek J. Clark and Mark
Pearson. I've been submitting patches to add new features and fix issues
on my devices, too.

Add myself as a LENOVO drivers co-maintainer to reflect this.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
Signed-off-by: Rong Zhang <i@rong.moe>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..fa576b4b5919 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14808,6 +14808,7 @@ F:	drivers/usb/misc/legousbtower.c
 LENOVO drivers
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
+M:	Rong Zhang <i@rong.moe>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst

-- 
2.55.0

