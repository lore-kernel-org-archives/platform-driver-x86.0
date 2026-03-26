Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0462402B83;
	Thu, 26 Mar 2026 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543189; cv=pass; b=QEvmoFYzyMqUkz1z7ihcXrQqr6qE5dbwyTtjVb1243RRMjGdZ+0QLBJPl6c6CpY+ax6OEJuEkrDpbVZ80HL5qjNhsmjUEYx2MXJOvcNS3z0eyju6AZTUtDN0QbDyuCPP2FNZp9GRLEkOOob5gIREdm5h5tZovbbt1VwdJIYPwZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543189; c=relaxed/simple;
	bh=1Zu/PM2XzKj4yRBJaAncsaj9J6+Huy6spuiFbFyE5bU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U5ml33UbOcVZdJ4a1sJP3hO3KAPK1mbxw7ge6Z6/0h4sfaGh2mLrBA/00t1kilKgZtLQ0zTxUk3CrD9C2G49BNM38vP4xxI2jtwIevWT7k/iQhxcI/rgG5L0CcEmC5gTLUC6Z7XxNfcImcK45ONy1TuLBCEcZ1XYOj22f1Gvp9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=g2WzIcVo; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="g2WzIcVo"
ARC-Seal: i=1; a=rsa-sha256; t=1774543178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FZbJRmnS5GdBlCSc7+z5kLTm/bW7mrAzHI9o9DIivHb/IrjS5F4vIY9PYM/jDiYmXk2KsgEYRAQMZOjgWWdAvF2Qn/rkemgl6EQQqxaFoYHaixsyEfuEl3i7QrxRgyC5o1gSY7EMcENnauNp+FNpHORkov7z3EwcZhVHXs9suPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774543178; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qkrny0BtQfCETePEtoGmJRSh8Xw2yKXcW/p75JIUT8k=; 
	b=KJRyvwmc9RlWI2um1rMwCsiEo53LmPjUGSyKvvW03r/tslsCn33mufPKpji+9WUmuoocQM72hrtRvFLRqIRJo900sVsDX3hAafw2kTy5pSIwxAfPb6ycsGB0G5IX596ETSSuhD9ni6uFajyu1vq4foxmEy6YpkwWlsX4MaD+4iE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774543178;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=qkrny0BtQfCETePEtoGmJRSh8Xw2yKXcW/p75JIUT8k=;
	b=g2WzIcVosrHiFCr/eTEp3/YvZHChStbi+aFY4CcPmA164br8Jt+8wbphbZBprzVz
	OZsYdIArVBe1vbbSlnyf5/KY9e+KV5KDIZyKNXV4R/EGYmmWl7UO6JRK/LaPQRV4xeo
	hdaJ2vWuLdSridcgFjrQeE31k6rHgnI3zDw8CmvmHpvJ7L/Xz390aXFwmlv8Q7CvjXX
	m36p9W/xS8Xuc2SS/ohoJI1KxJGhtT0EO1YTkLnZfZq7Jl03dTjh4lkmCrx2QsMwe7e
	gsTihmYU3rXHO8INsM/0Mi4HF3HSZk4AEQsYI59X+05gDyQLH0ubpnAO7q6Euoq575Y
	5ODUQ+uV4g==
Received: by mx.zohomail.com with SMTPS id 1774543176168783.9639861766072;
	Thu, 26 Mar 2026 09:39:36 -0700 (PDT)
Message-ID: <ed968b9c588bcc2793ea285c984b0cbc7c3c8208.camel@rong.moe>
Subject: Re: [PATCH 0/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <73cb6e393e152190a52910d32ae4226c0629facc.camel@rong.moe>
References: <20260210191938.137234-1-i@rong.moe>
	 <73cb6e393e152190a52910d32ae4226c0629facc.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 00:34:30 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi all,

On Thu, 2026-03-26 at 02:15 +0800, Rong Zhang wrote:
> Hi all,
>=20
> Gentle ping :-)

Sorry for disturbing.

This series will be integrated into Derek's series as they will
conflict=C2=A0once the latter adopts another fix patch.

See the discussion at
https://lore.kernel.org/r/861d0276a759461be446df8e996d196037c9b581.camel@ro=
ng.moe/

The fix patch is
https://lore.kernel.org/r/20260326161724.72186-1-i@rong.moe/

Thanks,
Rong

>=20
> Thanks,
> Rong
>=20
> On Wed, 2026-02-11 at 03:19 +0800, Rong Zhang wrote:
> > The Lenovo GameZone/Other interfaces have some delicate divergences
> > among different devices. When making a bug report or adding support for
> > new devices/interfaces, capdata is the most important information to
> > cross-check with.
> >=20
> > Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users ca=
n
> > dump capdata and include it in their reports.
> >=20
> > The output is like:
> >=20
> >   LENOVO_CAPABILITY_DATA_00[0]:
> >     id:             0x00010000 [dev:  0, feat:  1, mode:  0, type:  0]
> >     supported:      0x00000007 [ RWV]
> >     default_value:  0
> >=20
> >   LENOVO_CAPABILITY_DATA_01[0]:
> >     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type:  0]
> >     supported:      0x00000000 [    ]
> >     default_value:  0
> >     step:           0
> >     min_value:      0
> >     max_value:      0
> >=20
> >   LENOVO_FAN_TEST_DATA[0]:
> >     id:             1
> >     min_rpm:        2200
> >     max_rpm:        5000
> >=20
> > A helper function for creating per-devcie debugfs directories is also
> > introduced into lenovo-wmi-helpers in order that we can maintain a tidy
> > directory structure in debugfs.
> >=20
> > The series is based on platform-drivers-x86/review-ilpo-next since it
> > depends on a commit there. I am OK to wait until the next cycle.
> >=20
> > Rong Zhang (2):
> >   platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
> >     debugfs dir
> >   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdat=
a
> >=20
> >  drivers/platform/x86/lenovo/Kconfig       |   1 +
> >  drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
> >  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
> >  drivers/platform/x86/lenovo/wmi-helpers.c |  34 ++++++
> >  drivers/platform/x86/lenovo/wmi-helpers.h |   2 +
> >  5 files changed, 159 insertions(+), 3 deletions(-)
> >=20
> >=20
> > base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
