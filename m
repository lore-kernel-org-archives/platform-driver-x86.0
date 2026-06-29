Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459892FD69E;
	Mon, 29 Jun 2026 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760439; cv=none; b=q74VoYx0mVDicOMnYD6L79zn6SuovIx63wPnF7Nu4g8Z52heRMon0OXXN5RlXx2mNvrKn9sxiJz8LAxvGB9MKmJ642yhqFDPhhymtDexolhLq4al++Huo11SeXp6sK0l4Zh5H8PqcYerxRg2aRkCqpOOa4Un9iRw6TU0RmSo5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760439; c=relaxed/simple;
	bh=ZhbsruenRIkBh3y1/wAoZmOEP3soV5ZsuqSibbDVuyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nc4korYd859FdI96B1rVc3NnlQTgHAdm4GrK8+OItJYfvGbpoRGBadN2YCfWkcj18oGnK7iWAgXrpw1TZoAXXkfB2hcfWYUOW9iuaY1BONwmC47I6XTVTsGAMNQSPfe23AY0heeLWenY8ZaIef/dv+vHfSVt+5y5mN3RKdwDCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=LLk/N6M4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="LLk/N6M4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5BDD026F02;
	Mon, 29 Jun 2026 21:13:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fww6oHSy-hHH; Mon, 29 Jun 2026 21:13:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782760434; bh=ZhbsruenRIkBh3y1/wAoZmOEP3soV5ZsuqSibbDVuyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LLk/N6M4sUgi4vvIHKYEgLz9luuLSJI2CpnTQkZuVHZh00lhmDX7rbkA/V6NOHJlm
	 azPEcmjRwgwRLKXywM9Ij6HXhsKApKL5UFPMhlddMzj09NXMeKYd0vGFmjyhn3jYji
	 Fgv7s9jmjptopVyJCpaJ0RKz5WD2WLPqqbBDAADLJQ2UJe6W0rRNY+SGRNFkhdCymX
	 AmkgibruWW/QZIJ7khRJfBhHNwlqtsvremdz4GKu3+ZFCpnzRY1YDMyi2++jtPfJ4Y
	 oKRzvJOZUw/45MCZE04KHlP9MiUUcshedcQCR1eD7tPBVRz1hVyZTVSfer/oFffOUN
	 56Mi9zJ4qLY7A==
From: Marco Scardovi <scardracs@disroot.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: corentin.chary@gmail.com, denis.benato@linux.dev,
 Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
Date: Mon, 29 Jun 2026 13:27:56 +0200
Message-ID: <w5lQn2_tRS-_d31lk_IeWw@disroot.org>
In-Reply-To: <e7d71740-8e69-0433-aa49-d5023bd59a98@linux.intel.com>
References:
 <BGkkBwKuSFuGPnRJO3Lg1g@disroot.org>
 <e7d71740-8e69-0433-aa49-d5023bd59a98@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Ilpo,

In data luned=C3=AC 29 giugno 2026 13:04:51 Ora legale dell=E2=80=99Europa =
centrale, Ilpo J=C3=A4rvinen ha scritto:
> On Sat, 27 Jun 2026, Marco Scardovi wrote:
>=20
> > you around? I'd need this to be fixed to set the correct values.
>=20
> I'm not sure what the context here is, whether you're just asking for the=
=20
> patch to be applied (which is entirely unnecessary, as long as the patch=
=20
> appears in the patchwork's queue, I've not lost it), or if you're saying=
=20
> there's a problem in v2 patch?
>
There was a problem with the v1 patch, where I wrote 4 values wrongly,
so I posted the v2 with the correct values.
>=20
> Usually, the merge window is quiet time anyway when it comes to applying=
=20
> patches so don't expect much to happen for them until clearly after rc1=20
> (=3D not right after rc1 has been published, because the piled up patch=20
> queue will take some time to drain and there are other things to do aroun=
d=20
> that timeframe as well).
>=20
I see, sorry for bothering. I'm new to the kernel patching workflow and
still learning how it works.


