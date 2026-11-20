Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204070;
	b=emlVHJgCX4u34ol9fwlrhllbeJMpbgLL8u2eb27WuyLReWJ84IAzU1iSj7Q7wZrp8zPt
	 A3KUlJPc1Twx58DMZ8Fra/hJcYx2FoRgUUdhtATGSqiFEJnS2HBY8vxvII90A34rfIkJ3
	 9bCCaxaT85ORIsK1G9NF/Idz2zCQ0qTmvjxQsSspRRze5Uh0X89gxio+KOhdrxbmYCdeB
	 Wsk+B9eFxCVFQHzJz3JCpjwG400demx5yaFtjQ8KlWuXsNq/YjJaXK+5zgBiYc1xuiTen
	 iKBEUinvPk/VL1mbPPSSG4IouBs//0i1/rG4IqtFvVauPVJItosTzDYhW7EZALvQRuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204070;
	h=DMARC-Filter:Received:Received:Message-Id:X-Yandex-Fwd:
	 DKIM-Signature:From:To:Cc:Subject:Date:In-Reply-To:References:
	 X-Mailer:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rzztrun33kXq/20M8LA+0lyG4Y2TyTI6BajsUtNZ7aY=;
	b=SgsSJ0Mhtr2N3LNUVLLrVN4Ixpl+tgkRSg0oI8gMabAnUR+P+CGLVBWGfw+34sA5OlBE
	 Q3Q90+koN/sweuxfl3UKcJIFBHKxMO99MrWlxkMjBz9THW3LdA6DqR82HDsKDQ3w8dbjV
	 fvhLG+L2VCy6bRQ3VNpALMKM7AFKv894XkS8NHiL0BnTlQn5fVCGEZiWS8e4BySDfLorH
	 ME4tVprmH4BKOFdH0r4NZ6Oo3hRsc+3UUDT2aUocTmuv5anGC706WGDeQczApvQJGSI2C
	 Xf9g8ofpBKGVnM/PqhWVybrGorQLJeMDI5RUSp/2zLSUuW5kys2fRXK6bvbalyfzUSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b="V+N3MN/9";
	arc=none smtp.remote-ip=93.77.172.86
Received: from forward501e.mail.yandex.net (forward501e.mail.yandex.net [93.77.172.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518B606A6D9;
	Fri, 20 Nov 2026 19:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C518B606A6D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=V+N3MN/9
Received: from mail-nwsmtp-smtp-production-main-83 (mail-nwsmtp-smtp-production-main-83.yp-c.yandex.net)
	by forward501e.mail.yandex.net (postfix) with ESMTPS id 08320C00E3;
	Fri, 20 Nov 2026 22:47:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-83 with ESMTPSA id VlimSwMddKo0-O6bPsGir;
	Fri, 20 Nov 2026 22:47:36 +0300
Message-Id: <20261120224736.O6bPsGir@f9680f72-138f-4a3e-af6a-afff4670403a>
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795204056; bh=rzztrun33kXq/20M8LA+0lyG4Y2TyTI6BajsUtNZ7aY=;
	h=Date:In-Reply-To:Cc:Subject:References:To:From;
	b=V+N3MN/9MnyyDdiDQCpnB5Cx5LalauNo9dS9JF7zSfjz5IWVXHtuoP2CxQDd/fRuz
	 WTH0nV/2tAC06k0lwVyuprpZCNsbe0jvY8cMB49lBGRxNpTKKdlK4REtEnM2s6HUbS
	 WyJg5dFa1i7y5KUjX/rtXEgLcX7owtbJkYcZrAQQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-83; dkim=pass header.i=@yandex.ru
From: Vyacheslav Vankevich <crazycoder@yandex.ru>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>, Luke D. Jones <luke@ljones.dev>,
 Denis Benato <denis.benato@linux.dev>
Subject:
 Re: [PATCH] platform/x86: asus-armoury: add power limits quirk for FX707ZC4
Date: Fri, 20 Nov 2026 22:47:31 +0300
In-Reply-To: <20261119191224.15755-1-crazycoder@yandex.ru>
References: <20261119191224.15755-1-crazycoder@yandex.ru>
X-Mailer: git-send-email
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

A short update after re-testing with the latest firmware, BIOS
FX707ZC4.312 (2024-12-03): the EC still boots with a 5 W package limit
and the CPU is clamped to 400 MHz until working limits are written, so
the quirk is still required on this BIOS version. The reported limits
and the requires_fan_curve requirement are unchanged.

Verified on both BIOS FX707ZC4.311 (2024-10-18) and FX707ZC4.312
(2024-12-03).

Best regards,
Vyacheslav Vankevich
