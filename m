Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43C1B4F21
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 22:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.180.31.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740002897; cv=none; b=CKW589PjEOCioPgtoUL3CfqlCGESIo/lbj+1zWhagSf9aX17IARX9HP6F8O5Jk0hKPg52G8sBuUmpEKaRB47h1QSKOVZ4/iFdrFUaBBo6M35nl/CeHxWHyO6lbFTnyNDB2aoqqSwbhZC47hHzymRUhZEYFOutRAd905pSnSLZTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740002897; c=relaxed/simple;
	bh=8zdfuEZgx24AjSZ2AAvXc2A+5n7sOVtex6AUsK5M2hA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:References:To:
	 From:In-Reply-To; b=cTupkTq9UU/oHiS+MULeEImErRnN8bfinl1oi+Wnme8JWx0+BPu36x4Whwe97jef2vLNh/R0LAEMPnKLh9Bckp46Mhs0Tr/+P9Pd7Uo8Orxjksywv5LW8n+dSC54Bu/8Tj8XxfGxK8Kzz/FO2OjldZBPCsttGfYMK4tMDyv3yII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-systems.ee; spf=pass smtp.mailfrom=d-systems.ee; dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b=rWe9YJiw; dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b=rWe9YJiw; arc=none smtp.client-ip=213.180.31.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-systems.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-systems.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b="rWe9YJiw";
	dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b="rWe9YJiw"
Received: from mail.d-sys.org (localhost [127.0.0.1])
	by mail.d-sys.org (Postfix) with ESMTP id E6FA36097F;
	Thu, 20 Feb 2025 00:08:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740002892; bh=8zdfuEZgx24AjSZ2AAvXc2A+5n7sOVtex6AUsK5M2hA=;
	h=Date:Subject:References:To:From:In-Reply-To;
	b=rWe9YJiwUe5O+CA6PSSp7DOUh9FYzjCbdGTvvSqYOW7h8NUdvC2tdNbXvTN/WuE94
	 M8TnUPbosfWOOshqrI2/C8WQiIlbxL+J5Si/Agl1gVsY8+OFlt3ns5dPm81QJB5OCK
	 i2tgHDfIzdoWTBfee7+IY9yGJ8mCi5i1/yr07jrDxHakWy3Fn8yH0UR1l7kyTYnhLY
	 x/Zi3GlRHOqFlRLDYmNriCH5RFRAcG8Yxt/X0JDLhgA7ItsP8iVliJ8Z56T5TLrHRq
	 koLEc8tIq41uI17NjuXffvPDGNOnK26sIMC2F96IaTjLk2mu3KmehRIDG4HjdEHXDD
	 iijmwW4MzK/PQ==
Received: from [10.255.10.44] (GW.ds.local [10.255.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.d-sys.org (Postfix) with ESMTPSA id CD6CD60655;
	Thu, 20 Feb 2025 00:08:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740002892; bh=8zdfuEZgx24AjSZ2AAvXc2A+5n7sOVtex6AUsK5M2hA=;
	h=Date:Subject:References:To:From:In-Reply-To;
	b=rWe9YJiwUe5O+CA6PSSp7DOUh9FYzjCbdGTvvSqYOW7h8NUdvC2tdNbXvTN/WuE94
	 M8TnUPbosfWOOshqrI2/C8WQiIlbxL+J5Si/Agl1gVsY8+OFlt3ns5dPm81QJB5OCK
	 i2tgHDfIzdoWTBfee7+IY9yGJ8mCi5i1/yr07jrDxHakWy3Fn8yH0UR1l7kyTYnhLY
	 x/Zi3GlRHOqFlRLDYmNriCH5RFRAcG8Yxt/X0JDLhgA7ItsP8iVliJ8Z56T5TLrHRq
	 koLEc8tIq41uI17NjuXffvPDGNOnK26sIMC2F96IaTjLk2mu3KmehRIDG4HjdEHXDD
	 iijmwW4MzK/PQ==
Content-Type: multipart/mixed; boundary="------------AY0c00WoB0ADLtlWIEQWGxrr"
Message-ID: <c455b3c7-f408-4d7c-979f-83f07f94e845@d-systems.ee>
Date: Thu, 20 Feb 2025 00:08:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
References: <bea773df-9fd0-455e-87c9-d46f9d5b6feb@d-systems.ee>
Content-Language: en-US
To: ilpo.jarvinen@linux.intel.co, platform-driver-x86@vger.kernel.org
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
In-Reply-To: <bea773df-9fd0-455e-87c9-d46f9d5b6feb@d-systems.ee>
X-Forwarded-Message-Id: <bea773df-9fd0-455e-87c9-d46f9d5b6feb@d-systems.ee>
X-AV-Checked: ClamAV using ClamSMTP

This is a multi-part message in MIME format.
--------------AY0c00WoB0ADLtlWIEQWGxrr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Volume buttons on Microsoft Surface Go 4 tablet didn't send any events. 
Adding Surface Go 4 to button_array_table fix this.

The patch is attached.

Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
-- 

Kind regards,
Dmitry Panchenko
--------------AY0c00WoB0ADLtlWIEQWGxrr
Content-Type: text/x-patch; charset=UTF-8; name="hid.c.patch"
Content-Disposition: attachment; filename="hid.c.patch"
Content-Transfer-Encoding: base64

LS0tIG9yaWdpbmFsL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2hpZC5jCTIwMjUtMDEt
MTcgMTY6MTA6MjIuMDAwMDAwMDAwICswMjAwCisrKyBmaXhlZC9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9pbnRlbC9oaWQuYwkyMDI1LTAyLTE5IDIyOjIyOjUxLjY4MjM4MjI0OSArMDIwMApA
QCAtMTI4LDYgKzEyOCwxMyBAQAogCQkJRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJT
dXJmYWNlIEdvIDMiKSwKIAkJfSwKIAl9LAorCXsKKwkJLmlkZW50ID0gIk1pY3Jvc29mdCBT
dXJmYWNlIEdvIDQiLAorCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9NQVRDSChETUlfU1lTX1ZF
TkRPUiwgIk1pY3Jvc29mdCBDb3Jwb3JhdGlvbiIpLAorCQkJRE1JX01BVENIKERNSV9QUk9E
VUNUX05BTUUsICJTdXJmYWNlIEdvIDQiKSwKKwkJfSwKKwl9LAogCXsgfQogfTsKCg==

--------------AY0c00WoB0ADLtlWIEQWGxrr--
