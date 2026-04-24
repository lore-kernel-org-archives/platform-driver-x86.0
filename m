Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812593BED11;
	Fri, 24 Apr 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040356; cv=pass; b=eVC/MVu6VIykKMh7gRlBdwhJu/uDQiAgLdWIRGVwTOkvnynLCLRmOvAV7P2Id49oCFUafCYsudNAv59Bs4cWDqibZisKoqicvKWjcF+hBfsThzjdZsxDAedY63tmQBzq0XW70Oz/ECqYgfwqd1cWxef5MNfsidZVBnw2jQIm4gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040356; c=relaxed/simple;
	bh=Gk/CQdTl+3t5LyU+lz/w3T/JPgOx6+dI4gjo17S5SDE=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jk4d2D4hkH/e3tmgvpo8MWpq1LPqB2b0ttHbpYyWSqTixCQsygKR7dPZ0waTRCsX9DHtpxM2ov6hIccFc6O+a7D0DHbCbkt4bkGjGttjFsmyj8bE0QCsT0QVkIKr6i0/dGRb3jnPoYjxJsgelxzWlFTgRTMvEpALBfRWr9Sa5kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=CiQsp3T5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="CiQsp3T5"
ARC-Seal: i=1; a=rsa-sha256; t=1777040344; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WBUbZzCKTRet2w09ZC79ZDLxoF0ZRk4BDetj0Nkit1ATPl2FeruU38BKg7Ylzt5ROARwIuzzX8C1UU+35+akomtAmtoztfp9eZBoHVltG8pgDBn5ag68x9VMg3YKrZ1j4M75O0FpRLdbDhOJJSOzP0HCEsVA6EVZJIOwyDmJnSs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777040344; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gk/CQdTl+3t5LyU+lz/w3T/JPgOx6+dI4gjo17S5SDE=; 
	b=QSlPQ30g2nJOC2d5+8k4aJ0y0x2quT2xO9bG+z9ZJv+k9Flzyo7/BIwaog97Zr9RH+LpF6JjoNZ0qLD4FuXtH5R72sJYMMj1dUnfoec8VtMMDKZwLaMae69m66VBxWGbmC2MJQWngMMzz53pcHfLUfmmUfRsHiDFnzDDdb8wxcw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777040344;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Gk/CQdTl+3t5LyU+lz/w3T/JPgOx6+dI4gjo17S5SDE=;
	b=CiQsp3T53e61u/xazFhyJIjAtvRMX4jauusm9m1wAUO3+xEhcCPCV2+0GGofMT6F
	/CagGmrJ0yrd3JvBoUPunEaE9F9DiVGYer2/mNEaOixlyGgCoaNydF85xH0hassDHEk
	erlS/8tFRfkJFaMK85bFNSMgSI93s2hMhQPITLq524+H24eXSDujwydF7UKU7PWmq4q
	W8x+eT1wcw6Jn0/oksF8p7xvlVZbrtWY02BrlYO2wF/ksKqL7jrbRYij/IBnzeCIdjw
	UT9rtBVXE5ijz3RAeMUhOZSJTFhgp/XSyTKDwhGtxCujOjgEX+A5lyy28Z5GmSI7GUU
	+HtKh2/DqA==
Received: by mx.zohomail.com with SMTPS id 1777040342126337.57437464993177;
	Fri, 24 Apr 2026 07:19:02 -0700 (PDT)
Message-ID: <abeb3afb91753aa1efe023ad56f17505868ef57f.camel@rong.moe>
Subject: Re: [PATCH v9 14/16] platform/x86: lenovo-wmi-other: Add WMI
 battery charge limiting
From: Rong Zhang <i@rong.moe>
To: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,  Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
		 <20260411162334.25682-15-derekjohn.clark@gmail.com>
	 <09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 22:13:53 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi N=C3=ADcolas,

On Fri, 2026-04-24 at 08:50 -0400, N=C3=ADcolas F. R. A. Prado wrote:
> On Sat, 2026-04-11 at 16:23 +0000, Derek J. Clark wrote:
> > Add charge-type power supply extension for devices that support WMI
> > based
> > charge enable/disable.
> >=20
> > Lenovo Legion devices that implement WMI function and capdata ID
> > 0x03010001 in their BIOS are able to enable or disable charging at
> > 80%
> > through the lenovo-wmi-other interface. Add a charge_type power
> > supply
> > extension to expose this capability to the sysfs.
>=20
> Hi,
>=20
> this is not the right uAPI to expose this capability.
>=20
> If you check the ABI description for
> /sys/class/power_supply/<supply_name>/charge_type [1], it mentions
> "rate" and if you check the corresponding enum definition [2] it
> mentions "speed", so the charge_type uAPI is very clearly meant to
> expose the the charge rate/speed/current currently configured, with
> Long Life specifically meaning a reduced charge rate, rather than
> reduced charge capacity.
>=20
> The uAPI you're looking for here is
> /sys/class/power_supply/<supply_name>/charge_control_end_threshold [3],
> which very explicitly exposes the charge threshold in percentage. You
> can then accept only 100 or 80 as valid values and configure your
> hardware accordingly.=C2=A0
>=20

I am not sure if it's viable to do so.

The charge threshold may vary among different devices. For ideapad-
laptop devices, there are at least two variants: 60 and 80, without any
programmatic way to query the threshold. I guess that's why ideapad-
laptop "misused" the uAPI.

Since some devices actually support both ideapad ACPI methods and
WMI_OTHER methods, I doubt if the WMI_OTHER charge threshold also varies
among different devices in a very similar way.

Thanks,
Rong

> Unfortunately there's currently no way for
> userspace to know that these are the only valid values (which is
> something that I want to look into implementing soon), it can only read
> back to see if what it wrote was accepted, but it's still the best uAPI
> for this.
>=20
> I see that there have been 2 commits merged last year that make the
> exact same misuse of the uAPI, which probably contributed to the
> confusion here, but the ship has sailed for those.=20
>=20
> [1]
> https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-class-power-=
supply-supply-name-charge-type
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/power_supply.h?h=3Dv7.0&id=3D028ef9c96e96197026887c0f092424679=
298aae8#n45
> [3]
> https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-class-power-=
supply-supply-name-charge-control-end-threshold
> [4]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dde2884c6cdd3d133704ce37393590dd1c761500c
> [5]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dda8f2708f9b69707f4efeb432a18395e46b4666f
>=20
> Thanks,
> N=C3=ADcolas
