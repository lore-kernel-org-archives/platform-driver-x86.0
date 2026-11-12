Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794452067;
	b=BwCfmS+8BGASU+0b5EsoMTAQyE5+tH6xh5dyZZpY4JIwxKpKU2yLgHPH0LdrzigFKyOA
	 or4gH+aFbFppVK9Lv+XJxSlp5mxYUm0R4PP8WcUwt1qj6yO3CXVhxtqS6m9pjTZ7VS4x/
	 ZS28BMgZrcBLY2IQzZY1MU+j3WxEturhACMQ6VGMkrxKrgUUbHnNnW/FT0pnc6poji3HX
	 lUxJbDybUOI+KQwCSLpy+42J5jhrawCSaWH8ReoCHNEEa3oQGS0YbsCuz2dleqzjAt/yf
	 AROqLlP3AT+2bT1XJYXWy71IOgrDFhUXwCMgfYNCJ/bT8NVacibweF5hEChXWsyewzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452067;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YJ+EnuCym1YWz+DBXyHIchny29FUwy9WeDV3l4E/J60=;
	b=RMDKQJ+7pIViBgO2KXXCnFNFf4xLANqQ57ZK2DDfWFtsqwd5qmBIsCBv+kAAec4H36/g
	 ysIFquSEn9rR7sNr+ieQ8rm1n+jszbg1WRdErYJcWGe8aXDAXbpdTJludT6ltwBy+oGh0
	 Nktp7T0EMDr05ic+hiZEk1Nzeqo8XSsNgQr28D+m0G6OixOpOh7izMui5omM3fy2YnedO
	 dWdzRRDpmTdnmgHO0dMYRqnc/IXY8QTBKNFtEbGGmNUBogTELiinNmXN3OZP/gvSSsoqm
	 Eh2hGbSo+g9jLd4peiD/P9VdLraJAYS5tuLuJyBDxM5giBTdM6btGsGDf8LrmrGsfUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cG7McBUQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA8606A31C;
	Thu, 12 Nov 2026 02:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cG7McBUQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794452067;
	b=PAerUI0h1ljoPhgPluzUnNyVnbXnzPsHfbq1IvbmD2JehkH0vOfCUDUU3nAChEMTPXEA
	 QBt/N1YU4cE6GxR5eGTqNPCIfHOQyCJV8yBCxO6qAw2WNayV6STfUc8yC+cm4q0G3ZS7k
	 mMLj14XVBM+Y4d/hXthMJSwbs0rsEr58oCB5SD0KC5lKvbe3ZVIK7xEKA7jIzG0OJKbMn
	 DefrU+63pgZP0a0UjAK4gyyIAilIVnF28KLZXUD7ALzCb23A6usRuyim1YNnfb0TGK1bA
	 YZOK5l1j/zPLoDefPCIiiTb501WfFI/ByDd3udO3GLc6HtHre169FhbKJkLbbidIFdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794452067;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YJ+EnuCym1YWz+DBXyHIchny29FUwy9WeDV3l4E/J60=;
	b=M3PI7BF44KDnHjKgK2qaO/XUhQn/VNaov5AA2FHsc7pFp8VrWTbvz+cZDyGI+2Oqo2Ct
	 3i32ybwKfR7lw1YXDqVrNDhNCryRisY8kYTAZrYET04hJuDtKf9O+96ak8Ntrtg7P6Vkz
	 heK3XW57P0x2EKlNVfYkpM7anVeUIG6HBphzbFTHg2XDiOTQ4p/1XVl/VXfvcKA+eOYvI
	 b0VBt6P54+50lSGGJsMAioDYaT/cI5QXHCR3qRVpdO5Zdw/QcPgqBum/dLmEpAEH8e7wn
	 DnFQfJji4nQPeT4dRI+V6LMtYURHfyIIjtDsZxPLgck0VpG+NVdz0Qt85HBTfSLW1kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 972941F00A05;
	Thu, 12 Nov 2026 02:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794452067;
	bh=YJ+EnuCym1YWz+DBXyHIchny29FUwy9WeDV3l4E/J60=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=cG7McBUQgiSaUULvOLPM02d7OP7z8SEfNeHurGz+6mrB3x39YEkhppGNbFfGAkWTh
	 z8b9F1dda2+ynVc6zkEIR2Ym8+oBMKd06aCPBL1CmCSZN1M/04EdtV9zjht2BHtiZQ
	 UEG7Rh8PT4mAOpDP5Qg3HHIu5HUSPzTdHE/N5jeGvAQp4I/eIpg4Z0iX3gY7Duo5UH
	 XXoC+Hzo6vfbh+NsW/HwWgcv6WmEASMPn1Ori0Jm2BnAoAZOyn/ZzOYfJhHZJ5WbVu
	 IItfRHqNR1PBjlbigqjsFXihncjoYKDko8fzW0buJzvxJtxShlqzw41Yhdg+TbMs28
	 l+3KC+IFTFdZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2A80F49237;
	Thu, 12 Nov 2026 02:54:26 +0000 (UTC)
From: Samuel Wheeler via B4 Relay <devnull+swheel33.gmail.com@kernel.org>
Subject: [PATCH 0/2] platform/x86: hp-wmi: HP OmniBook Ultra 14-kd0xxx
 (8EB4) fixes
Date: Wed, 11 Nov 2026 21:54:25 -0500
Message-Id: <20261111-omnibook-8eb4-v1-0-3127f45cc338@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVREcpVxKJlMEQrLSJpenfF2
 32L93twaAkdNIkHixc5MjqCpwn0s9QTMhqiIc/ykscxs2lSxqxMoCpYJUTNMasKyUeIn93iSPf
 Xa7vf7lQL9scbgRAeA9uN6HEAAAA=
X-Change-ID: 20261111-omnibook-8eb4-78891e074a1f
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shang En Sim <sim@shangen.org>, Samuel Wheeler <swheel33@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794452066; l=1572;
 i=swheel33@gmail.com; s=20261112; h=from:subject:message-id;
 bh=Y4xTG+8RxmiuTXb8mMsG5seOcwWC4EfIZOX+4VckSBk=;
 b=HwgbCzhMGJBDO+FlTWk1qVHPMAeJTtMjNLT0MBjnDZpGXIPHT5YyytGhU+TdHhBb0PwdJHMrX
 ex1CXT+aqiWAJH/GNnnmm1cKE/uGnTDnhX51ZpSmkLjDV4f6sI3xOge
X-Developer-Key: i=swheel33@gmail.com; a=ed25519;
 pk=cokeT6B31W84o+Gc4wuP2okLF8wShbbGQ7pb5h5JPXg=
X-Endpoint-Received: by B4 Relay for swheel33@gmail.com/20261112 with
 auth_id=1494
X-Original-From: Samuel Wheeler <swheel33@gmail.com>
Reply-To: swheel33@gmail.com

Two small hp-wmi changes for the HP OmniBook Ultra Laptop 14-kd0xxx
(board 8EB4, BIOS F.06, Panther Lake):

1. The thermal profile query returns status flags in its upper bytes,
   so reading the platform profile always fails with -EINVAL. Use only
   the low byte.
2. The laptop has the same battery charge mode interface as the
   Spectre 8C15/8C17. Add it to the charge_behaviour quirk list.

Both were tested on the laptop with the same code changes applied to the
hp-wmi of a 7.2.15-based distribution kernel. The patches themselves are
against pdx86 for-next and build there with W=1 without warnings;
checkpatch --strict is clean.

Patch 2 touches the same quirk table as the pending "platform/x86:
hp-wmi: Add OmniBook 7 14-fr0xxx to charge_behaviour quirks"
(https://lore.kernel.org/r/20261102155409.3061761-1-taranarmo@gmail.com),
so whichever is applied second will need a trivial rebase.

The ACPI analysis, the changes and these descriptions were prepared with
an AI coding assistant (Claude, by Anthropic), as described in each
patch. I reviewed them and ran the tests myself.

---
Samuel Wheeler (2):
      platform/x86: hp-wmi: Only use the low byte of the thermal profile
      platform/x86: hp-wmi: Add charge_behaviour quirk for OmniBook Ultra 14

 drivers/platform/x86/hp/hp-wmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)
---
base-commit: a514d723595bd8e5ce926a7fea148ceb3c26915c
change-id: 20261111-omnibook-8eb4-78891e074a1f

Best regards,
--  
Samuel Wheeler <swheel33@gmail.com>


