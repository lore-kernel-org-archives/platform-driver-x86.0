Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF63783B4;
	Sun, 13 Sep 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332713; cv=pass; b=ZWQrnbxGjnr9moWWrW6xqgye0quejNgp4wqjrImSB9zHdJ27UOhzOo+iKiArrjvsO3aXB1qed1H7sReUPWrFP8VhR/c4XgAIGHEGt5XjTz3LZajwBoZsWm8sNhQ2HbLv3rbWrJni7rq+QpFj7buYjFSuVGTtnku90uh645ur3tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332713; c=relaxed/simple;
	bh=LTvCzRp12oClqrWsnpeiVMNof0cHXe4KvDJEs3CMNjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAgVqKM51BcBuxjy8ksWX3KESIGY/rVQw57RJXVmjkKTwR3e9jXaQ6ybf7xI6auyXbeBieuN4ZrWWzkfMJsxXhRY0zDNgVeaLumupUEJbiofNmJRzXlW9k3ndkT4wSFlCaV9ThldkQJ2u81NlOZQOoPl8lSfJLi8W7xGYjthaQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=oOgaCkVm; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="oOgaCkVm"
ARC-Seal: i=1; a=rsa-sha256; t=1789332654; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mUxibGHOgRBGjz8kzT3K1fi6qnvQBLLSpH1gbf6RP4THSgrj9GYPgOAxatvt8WYivEjIHh8zOv0ZgcGdwLsF45bkpb3FVGapOY4GpFxuVQslp0UiuU6TWX2hl8b1ckXHVKStAjLz2J+UZnF4mkpknCGkkPVaP4sWK+TgjBAXNUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332654; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/9RGclajS9AMvJ5UjvGYP7NKToYvyMliQF8dgJQOqjA=; 
	b=FFwQKvskozk+b/B3B0hniignuVnObl5vx6+ysGH0ql8MWt56P0vli+N6uBlWie/9upqn3MJ/ljcn1FJhufyd2okvyCW8P4N7P5r0YLO0xpRD6vtkyKXxNVkwndTXolwyNyWcpQpSokYSz80oXMLfzyuJSqCyMDxY+bqVAmy+TVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332654;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/9RGclajS9AMvJ5UjvGYP7NKToYvyMliQF8dgJQOqjA=;
	b=oOgaCkVmveTKmpTj9wXZsrzKCjI0EYdvxObNMvycoFx5sMLNE8UjCxRppN1rIyA6
	dkkuzriHfjTerjV2caU5cCvWPJhkirMrxVYKBg3Z/CBkTwOW7LifQk15TeAKSZxkMP8
	+gwG7KRGd1M3gor1l0ECzMBxi8yANWXVDFdrOsxALG726naBrCMVntKPaeFPedtSXl3
	yqHFE0wX8afUDcYUYYMB7LzaZvSt1Z2gzbVY1qGDXQqVgQ86vYCIkxp+vVWL7dBm7OI
	GFaVz1Qz7dZVrGSM3cWitvlsoZ3S2SN5vzGhsRHqPWPo0IRZ1PJIY8DpKkuzgEZhvrV
	+UyiTH+Fnw==
Received: by smtp.zohomail.com with SMTPS id 1789332653249314.3828254721873;
	Sun, 13 Sep 2026 13:50:53 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:30 +0800
Subject: [PATCH 9/9] platform/x86: Add myself as LENOVO drivers maintainer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-9-7a400f2f69f8@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

I regularly improve LENOVO drivers (including lenovo-wmi-* and
ideapad-laptop) and review patches posted on the pdx86 mailing list
along with Derek J. Clark.

Add myself as a LENOVO drivers maintainer to reflect this.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
Signed-off-by: Rong Zhang <i@rong.moe>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..d69be560ee98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14805,6 +14805,7 @@ F:	drivers/usb/misc/legousbtower.c
 LENOVO drivers
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
+M:	Rong Zhang <i@rong.moe>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst

-- 
2.55.0

