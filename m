Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F5377EBF;
	Wed,  1 Jul 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923506; cv=none; b=AAtnZFxOEMeKAsCqypPRCTd42sKz4TW6F4hjlsxQOKHQ9Rkf3oyfJNp7f7DVL3X3XEG41wYgSHeeI2y+5xkEZ4N93AC4XeGBkxx3/PCvuD0XC1ndZrOMALp8lqlrxisKaYZlwSuOny013VUM7zEn40PQWS74chUUQVJi+ib416c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923506; c=relaxed/simple;
	bh=Rnvo/273pD7AIh48O8xxw/7d/4otQ7WV+Lo/8ySinmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiQJdOtSBBxGwICG5KmbxrRnELT0ZXdO+LSZaT32cWnnjgmN1mkEM8CWdaf7PMaTCCOmkxZ+m/PS/naOn2Y0SDBsMG4JGXNfAd5TCA1pmmjkBY7pfRGulKr4noXYUzNRK7rb5N+Yo0y/uPOTOJ76zIR+jZOiQL7N6H/Q2GvFFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Abhg4auq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Abhg4auq"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9F9E48412A;
	Wed, 01 Jul 2026 18:31:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjZPusmrKsf5; Wed,  1 Jul 2026 18:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782923494; bh=Rnvo/273pD7AIh48O8xxw/7d/4otQ7WV+Lo/8ySinmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Abhg4auq46IfPv2PCfgEcgrVe7xV1t9pJdsFN5M/Qr82SpUA0m/bl12TUD+HPB21f
	 +Auj/q4VoFK2MODPfBMbKtPOBVGd9EyGdFmdqUksuQjOi4rkK6gSbFxIEumM3IF0h/
	 aOaaK2itI2dMFFejxVABSuIBr/mPnb5JGQuhF3PmQeErkndzzYvel5ItJuBMtvqQIn
	 mA1mCeWfM4brrKvCI24u8pgrbSHYz+OkpwlTnl0aj1sNCOqey8HX+myX74Kauh/F33
	 zduNjKKXo/lO1/UElyJSzi9mAVCutVDR/il1ckAeXoKt/YBXkpZcOEjHfqtmFesVkl
	 njoHq7Fccwb5g==
From: Marco Scardovi <scardracs@disroot.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject:
 Re: [PATCH] platform/x86: asus-armoury: fix Use-After-Free and memory leak in
 driver init
Date: Wed, 01 Jul 2026 15:25:42 +0200
Message-ID: <IGLRyNPIS6-bIiJOwf3pHw@disroot.org>
In-Reply-To: <f1c70b62-7e5d-7ed3-afbf-b80e3a0f2daf@linux.intel.com>
References:
 <20260614163717.74732-1-scardracs@disroot.org>
 <f1c70b62-7e5d-7ed3-afbf-b80e3a0f2daf@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

In data mercoled=C3=AC 1 luglio 2026 13:01:12 Ora legale dell=E2=80=99Europ=
a centrale, Ilpo J=C3=A4rvinen ha scritto:
> On Sun, 14 Jun 2026, Marco Scardovi wrote:
>=20
> > ...
>=20
> Why do you need to set these to NULL?
>=20
> I'd also prefer to use goto + rollback path pattern even if there's only=
=20
> one entry at this point.
>=20
Hi Ilpo,

thanks for looking into it. If I have to be completely honest is because
I didn't think at it as a solution: I'd also prefer to use goto + rollback.
I'll open a new thread with your suggestion.

With best regards,
Marco


