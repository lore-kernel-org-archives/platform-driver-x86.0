Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0B28D850;
	Wed, 11 Feb 2026 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810930; cv=pass; b=qN+MiXaISv8rpieKA51HF0LD0yQ7P739oxMXP+2LY4vUi9uQrViWznsSIwPrBFkVPljWPaKFYDkaKmUCoEa73sB8UPch2rTbbxulblYj8bIkI4JqxGO8iuhEnQfUlR0FbHp2p6/9pUp8JIhgE+W8XX54O3zRi0f+Ld07MfND9mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810930; c=relaxed/simple;
	bh=BlUL40zymoazRH4lIEhZV9eUA/yHmZiVFkdacOfbSZs=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mV8aqXjacefXBUBLlXoeoNKrYm8ktkdvPHxlkJBJ314S6IEWhfJoNnz51lwVEc7iOTrF4x7Cx3u4xpdgPtWlLIHjiI1C1sexh9UxKxrx3o5N/qfcllAUs+CFg5xkDUwH6Rd+UncWnyMsqCQfG+5ChjweEc3tEJwKf1sOpXmxFn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=de7YiSUq; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="de7YiSUq"
ARC-Seal: i=1; a=rsa-sha256; t=1770810920; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m/huszTxo5Suw2Zm6ujjhcIkDixjVyivXtdENRJl/ZSRcVacOHP1ovGQbVShKzLUtOUVkOFYJfTRR/43isj0idkeaUBMcQqQVqlyG6CBQXs3EB0AywNUNs0xB7bINK9+vtPVhMoJKAAIxZ2HR6tBSDH4VvLbTxmQIW74NpN7wDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770810920; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kb6/qRa0YDVdSZgwqHQLDIq5zZTM+PupyBgPz9x3cEg=; 
	b=cNcl2ylp+L1O3jhVmsnDhdMOyCHAEyzmy0Lb4f/vUsxa7prwDO+kgYGjyqBxV820yevGSgH5Ewbx1dmczJ/Ja2aEb9pErjhuyy6XHKhkC4f26TBOns28Gqo37ryAuSx3FtfjJ64reAP097mHXED58oA0ABlnc5Uz67j3JKxnf/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770810920;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Kb6/qRa0YDVdSZgwqHQLDIq5zZTM+PupyBgPz9x3cEg=;
	b=de7YiSUqoxEUggdsdnRJSkxDz2HjyUNeE/S2tmgmFbaJ4KcLyGMwIDBL7angNK+m
	lmIUDZ3e9taSrLPaUuGdlf12ebD9dQg+rR2UQHGRlkQcVP66sq+pgAn/t/rMWG2dm3X
	LpGvlM6NNGuSu5oW+GvWf6vnPNkuwxKEFxTUFGrIJlVOuKBQBK8RYgLkmIbOusTbJR1
	QY/wxP0poceKi0JGp3s4RMB2oHKOpGxhbS8cGZnfY3+J9wlNYPUq8vMU4X91pZkZEeW
	+uien3PqpREcGiul79dBvunW3uA64j/n4u995ADzf/TBoLGPZgFX1OE5plRjcORtmZI
	db6TrOX5Zg==
Received: by mx.zohomail.com with SMTPS id 1770810918138515.5101214592495;
	Wed, 11 Feb 2026 03:55:18 -0800 (PST)
Message-ID: <06772053d9ea324117c78f83bad49e4f49222ff2.camel@rong.moe>
Subject: Re: [PATCH 0/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Kurt Borja
 <kuurtb@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <2A78CD4B-9D1D-4E7E-BEC9-E567A1DBE089@gmail.com>
References: <20260210191938.137234-1-i@rong.moe>
				 <DGBOH3NPCWFS.5SUAX6FZNZZ8@gmail.com>
				 <2A78CD4B-9D1D-4E7E-BEC9-E567A1DBE089@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Feb 2026 19:49:43 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek and Kurt,

On Tue, 2026-02-10 at 15:49 -0800, Derek J. Clark wrote:
> On February 10, 2026 3:41:31 PM PST, Kurt Borja <kuurtb@gmail.com> wrote:
> > On Tue Feb 10, 2026 at 2:19 PM -05, Rong Zhang wrote:
> > > The Lenovo GameZone/Other interfaces have some delicate divergences
> > > among different devices. When making a bug report or adding support f=
or
> > > new devices/interfaces, capdata is the most important information to
> > > cross-check with.
> > >=20
> > > Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users =
can
> > > dump capdata and include it in their reports.
> > >=20
> > > The output is like:
> > >=20
> > >   LENOVO_CAPABILITY_DATA_00[0]:
> > >     id:             0x00010000 [dev:  0, feat:  1, mode:  0, type:  0=
]
> > >     supported:      0x00000007 [ RWV]
> > >     default_value:  0
> > >=20
> > >   LENOVO_CAPABILITY_DATA_01[0]:
> > >     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type:  0=
]
> > >     supported:      0x00000000 [    ]
> > >     default_value:  0
> > >     step:           0
> > >     min_value:      0
> > >     max_value:      0
> > >=20
> > >   LENOVO_FAN_TEST_DATA[0]:
> > >     id:             1
> > >     min_rpm:        2200
> > >     max_rpm:        5000
> > >=20
> > > A helper function for creating per-devcie debugfs directories is also
> > > introduced into lenovo-wmi-helpers in order that we can maintain a ti=
dy
> > > directory structure in debugfs.
> > >=20
> > > The series is based on platform-drivers-x86/review-ilpo-next since it
> > > depends on a commit there. I am OK to wait until the next cycle.
> > >=20
> > > Rong Zhang (2):
> > >   platform/x86: lenovo-wmi-helpers: Add helper for creating per-devic=
e
> > >     debugfs dir
> > >   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capd=
ata
> > >=20
> > >  drivers/platform/x86/lenovo/Kconfig       |   1 +
> > >  drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++=
++
> > >  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
> > >  drivers/platform/x86/lenovo/wmi-helpers.c |  34 ++++++
> > >  drivers/platform/x86/lenovo/wmi-helpers.h |   2 +
> > >  5 files changed, 159 insertions(+), 3 deletions(-)
> > >=20
> > >=20
> > > base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
> >=20
> > Hi Rong,
> >=20
> > This is indeed very useful debug information.
> >=20
> > Once you and Derek agree on the approach for this series, I'll add my
> > Tested-by tag.
> >=20
> > One more thing though. Can you please explain the "supported" byte? Wha=
t
> > is `+` and `V` supposed to mean?

"V" means valid. It's consistent with the corresponding macro name.

> Kurt,
>=20
> It's enumerated in the patch:
>=20
> +       seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supp=
orted,
> +                  extra ? '+' : ' ',
> +                  get   ? 'R' : ' ',
> +                  set   ? 'W' : ' ',
> +                  valid ? 'V' : ' ');
>=20
>=20
> From the documentation:
> uint32 Capability //7:by project=20
> bit 2:  0: not support SetFeatureValue(),  1: support SetFeatureValue()=
=20
> bit 1:  0: not support GetFeatureValue(),  1: support GetFeatureValue()
> bit 0:  0: not support feature,  1: support feature=20
>=20
> I don't see any examples of the "extra" bit in the docs.

It's not a single bit. Instead, it's printed out when any bit other
than RWV is set. I added this when I recalled the definition of
capability 0x04050000, which has an extra bit defined:

   Fan Test For Diagnostic Software
   uint32 IDs //0x04050000
   uint32 Capability //9:by project
   bit 3: 0: not support LENOVO_FAN_TEST_DATA, 1 support LENOVO_FAN_TEST_DA=
TA
   bit 2: 0: not support SetFeatureValue(), 1: support SetFeatureValue()
   bit 1: 0: not support GetFeatureValue(), 1: support GetFeatureValue()
   bit 0: 0: not support fan test for diagnostic software, 1: support an te=
st for diagnostic software

(from https://lore.kernel.org/r/CAFqHKTkOZUfDb8cGbGnVPCS9wNbOBsiyOk_MkZR-2_=
Za6ZPMng@mail.gmail.com/ )

I assume extra bits are not standardized, and some (current or future)
capabilities may have multiple extra bits defined. Hence, I simply
named it "+". After all, it's just a reminder for us to check the
documentation (I don't have any, though).

Thanks,
Rong

> Thanks,
> Derek
