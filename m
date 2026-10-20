Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525944;
	b=UxMxMRTzP9d7mjqREgL6H/CDDOOc60+jSb6df25epKcVBaBzgWjdmvgYzWBHaGH2ca/S
	 bNMxi67KIsaMRcx1N8bTcwSTfYl6BrSZ+bgdDazMOUJF50vMBe/4B+FmpRlTJccx00eAm
	 0kasDDCc7WT13cgUVDc7bjRtqERzkoi6zE7K62Ic1Ce2ic0rBJZbqOdD2LN7dE9/togC8
	 vW9VFoLsaCHVP0cRz9r9YjRuSTzgMEZ7DenQ6e6B8+/wEyLJ433in0HM/rDhbpZo4Oq48
	 xjCfBoZYnuWdReqI+xT8Xv4RA59P1aSl0z5HdBd+vLUqKdUAf6JCfQxlwPUZZrCKvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525944;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Q5geQhSaUMcBKm3V6iRugKSTwuUl/zsp5Eqqm07A3Q8=;
	b=o5OqefIMJAbP5s7o+eQimT7vM9MW+S6xTSUolgy2ZPh2E7JHjdOfD+jbahgrNbO7cyLD
	 ZPw21MZwXJ1Ro3lXXSBL7FP70F7jIra+HRoQZJqSPKwNQKJfV8fvN4M40915Ticds/t1t
	 SRXd4xjUDRxSODqkkUA+D/9zGaIgDU6kssgYV6nNqgdDdpoILOIkT7w1AW9joP9Bf2J/H
	 Ehm+I5HP+aN2a8TvC6GGI9vYL/S6YZIq59KAafODdHOPqcPd1CCSAUp0TmiT47gXo74Fa
	 FnDk3t39dbjeQk7XvRv2LqDERJRTdKXF+Kbb+AtQJZa7lqAU0XOYR2pKGOf+R+pkv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arsOYYln;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6A606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 19:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF6A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arsOYYln
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792525944; x=1824061944;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Tm/uWlFvL0XKQlsLfD3gUIh59sB8w7QbDcT9dI1HLqI=;
  b=arsOYYlnRm57f7xvxQAQOmfM1g135ACgjGRRCN1WlehJcs9HkOBC+vF6
   h3jLyIAtphbHUmC6+IrFihbmYnr7MDMDp18svdo+Hm2uSDSd5f9RcJ/af
   mCEX785NMLZPu8HiIpqhjFmGTUku/m5szW8+up5RLxlJ9Y1PEEiz77J4p
   +ERE7008xgZrPcq5mQYxlabSnUZQv3u2ZGpc7dLTtGbnOm/LnWyKbrSCG
   7PLSpU+1kPPZ9jwr8vtrGsWPkpIXA5cs6CHRf3LoTGDbYaLy8xi9KwmO8
   BjTYKCP8B+tErPeMwJTvmtZVwNdlZ4u28gFOu3uUDrd/Lezs495urCCt2
   Q==;
X-CSE-ConnectionGUID: R+uKZDAUQJOSEOWJjLbi1Q==
X-CSE-MsgGUID: a7e9jcYqRvKqJSpkrV9iOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1137950"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1137950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 12:52:23 -0700
X-CSE-ConnectionGUID: iw5PJhAiTteAa/FtA/3XEw==
X-CSE-MsgGUID: X3jFAT9WRYWPRdq2S5qgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3235393"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 12:52:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 22:52:18 +0300 (EEST)
To: Felix Radensky <fradensky@nvidia.com>
cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 0/3] platform/mellanox: Add nvsw core
 and SPC6 host driver
In-Reply-To: <20261020172723.4160326-1-fradensky@nvidia.com>
Message-ID: <968e6968-f849-c3ff-2a60-569b2fccb420@linux.intel.com>
References: <20261018101156.699575-1-fradensky@nvidia.com> <274bb540-5f61-d343-173b-a2f46f7ea69a@linux.intel.com> <20261020172723.4160326-1-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1188746168-1792525938=:1177"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1188746168-1792525938=:1177
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Oct 2026, Felix Radensky wrote:

> On Mon, 19 Oct 2026, Ilpo J=C3=A4rvinen wrote:
>=20
> > Also please check what sashiko.dev has to say about these patches.
> >
> > Note that sashiko is an AI review tool so please apply healthy bit of
> > critisism to any of its findings.
>=20
> Done. The criticism turned out to be necessary, though not in the way
> I expected: none of the seven findings was a false positive, but three
> of them pointed at fixes that would have introduced bugs. I checked
> each finding against the CPLD register map rather than against the
> code alone, which is what caught those three.
>=20
> Also, on your comment in patch 1: the label is gone and
> nvsw_core_init() now returns directly when
> nvsw_core_mux_topology_init() fails.
>=20
> Three it got right, fixed as suggested
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - pdb1_pwr_status..pdb4_pwr_status were exposed 0644 over
>   NVSW_REG_PS_DC_OK_OFFSET, which is not listed in
>   nvsw_writeable_reg(), so every write returned -EIO. They are 0444
>   now and the ABI documentation says read only.
>=20
> - The air cooled pwr_cycle had mode 0244 rather than 0200, denying
>   read access to root while granting it to everyone else on a write
>   only attribute. The liquid cooled table already had 0200.
>=20
> - Patch 3's commit message claimed the air cooled systems expose power
>   supply alarm indications, but no attribute is described over the
>   alarm registers. I dropped the claim rather than adding attributes,
>   as we have no plans to expose the alarm registers from this driver.
>=20
> One where it correctly refused to guess
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> It flagged NVSW_REG_FAN_OFFSET as being used with two contradictory
> polarities: my ABI text says bit value 1 means the drawer is present,
> while mlxreg_fan_read() treats a set bit as "FAN is not connected". It
> presented both directions without picking one, which was right, since
> nothing in the patch settles it. The CPLD map does: the bits are
> FAN1_PRSNT_N..FAN5_PRSNT_N, "'0' - Present, '1' - Not Present". So
> mlxreg-fan is correct and my ABI text was wrong, fixed in the
> documentation with no code change. It also noted in passing that
> psu_status might have the same problem "if active-low", and it does,
> while psu_ac_status and psu_dc_status sharing that description block
> are active high. The polarity is now stated per attribute.
>=20
> Incidentally, mlxreg-fan.c has a comment claiming the presence bit is
> one when the FAN is connected, which its own code contradicts five
> lines later. That is probably where my wrong ABI text came from -
> happy to send a trivial patch for it if you want.

Sure, lets fix all problems we know of if you have time, even if they are=
=20
simple/trivial. :-) You can send it separately as I assume it's not=20
related to this series in other than that it was discovered while=20
reviewing this series.

> Two where the problem is real but a proposed fix was not
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>=20
> asic2_health..asic4_health were broken: the masks sit at bits [3:2],
> [5:4] and [7:6] but all three carried .bit =3D 1, so ror32() shifted by
> zero and they returned 0/8/12 and so on instead of the documented 0, 2
> and 3. It offered two remedies - set .bit to 3, 5 and 7, or move .reg
> to NVSW_REG_ASIC{2,3,4}_HEALTH_OFFSET - and the second would have been
> worse than the bug, since all four health fields are packed into
> 0x2550 and 0x2553 is the ASIC thermal status register. v3 sets .bit to
> 3, 5 and 7.
>=20
> The fan drawer LEDs are accurate against mainline: mlxreg_led_config()
> gates on (regval & data->bit) and never looks at data->slot, so with
> .bit =3D 0 all ten are skipped. But giving them a .bit would be wrong,
> because the capability register holds the number of fan drawers rather
> than a bitmask, so masking a count of 5 would register drawers 1 and 3
> and skip the rest. mlxreg-fan already handles both conventions; only
> leds-mlxreg does not, so the fix belongs there and we will submit it
> separately. The LED table is unchanged in v3.
>=20
> The one where the fix was to delete the code
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> It reported that nvsw_core_reg_def was unsorted, so regcache_init()
> logged "Driver needs fixing: Unsorted reg_defaults", and that its
> entries never reach the hardware anyway. Both are true:
> nvsw_volatile_reg() covers every register the driver declares, so
> regcache_default_sync() skips all of them.
>=20
> The obvious fix is the one mlx-platform, nvsw-sn2201 and mlxreg-lc all
> use, looping over reg_defaults with regmap_write(). Checking the two
> registers first showed that would have been a mistake. Neither is
> relevant on SPC6: 0x2537 is not a PWM control register on this
> hardware, the name being inherited from mlx-platform, and writing the
> 0x00 default would assert two active low signals that reset
> de-asserted; 0x2543 is the low aggregate interrupt mask, which
> mlxreg-hotplug programs from its own .mask_low when a board describes
> a hotplug device, and no SPC6 system does.
>=20
> So v3 deletes the array rather than sorting it, along with the cache
> configuration that then has nothing left to hold. One side effect
> worth flagging, since it undoes part of what you asked for in v1:
> linux/bits.h is no longer included in nvsw-core.c, as the GENMASK in
> that array was its only user there.
>=20
> SPC6 does need one register default, but neither of those two: the
> CPLD can override the fan PWM and drive the fans at full speed on a
> fan fault, and mlx-platform clears the enable bit for that override on
> every system it supports. On SPC6 the bit has moved to a different
> register, so the write is done from the board driver in patch 3,
> through the set_reg_default callback the core already provides.
>=20
> The finding was real, both halves of it. But the fix it implied would
> have turned dead code into a bug.
>=20
> What the tool was worth
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> One finding it did not make, which it led me to: following the same
> reasoning as the pdb*_pwr_status finding, I checked all 85 registers
> in nvsw_writeable_reg() against the register map and found one more
> mismatch, NVSW_REG_FU_CAP_OFFSET. Dropped in v3.
>=20
> So: every finding described something real, which is better than I
> expected, but three pointed at remedies that would have been wrong,
> and each of those would have looked plausible in review. Worth
> running, but not worth applying without checking what the registers
> actually are.
>
> Thanks for the pointer, and for the review.

Thanks for checking.

I'll try to go through the updated version still in this cycle as the=20
series seemed to be in relatively good shape already (but no promises as=20
merge window is already close and it is still many lines to read even if=20
most of them are trivial ones).

--=20
 i.

--8323328-1188746168-1792525938=:1177--
