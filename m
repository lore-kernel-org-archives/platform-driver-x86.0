Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1BF390C8A;
	Mon, 19 Oct 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391205; cv=none; b=ThS/+v+nrRQSMikdDQGC+YIU//ar2Zy0tIWoa7kmaOp09U6Ai1BCXIjhicVexse0GaGYx7eg21MvHiE7e3JxGZLn1X/4JNhc7fNlJi6lKTkHbOWM7DzDUggGgvk6VpimySwlfq4ojaaiVNFusOpiSy5Sk47tlOJVWOBYFPzTNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391205; c=relaxed/simple;
	bh=U/ncPMi8AfkPa3bR1bJFQ1O5+hoo502VXFi6m7pg24E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aUiPLUoM0ATBDp9IvXD1b3OBKOYcGvXwCmtNApg94wBtxDFInM/q+FjTlpiMcxO7o+joN/WSYM4olfs0HJRQXiUfaPNFdhPkGkEREQYdD7idz2U7NirYsuis+yEbzceFLoNLxojitsbXCglM6ybk5OnE0LUEo/N2hyA5bap+xXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGLz6g8w; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGLz6g8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792391204; x=1823927204;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U/ncPMi8AfkPa3bR1bJFQ1O5+hoo502VXFi6m7pg24E=;
  b=MGLz6g8w50zHiJVOZfSf+zCzNeDoBDhk8boWJvkNU4PwYlTYi/gMfVT5
   Vh23io52vdlJl3+ZcgG4iShQ0GxbNXVYzeMKb4YDZ2ZLl74Eu4Rac7BJC
   ICqVfXru3EMEajfs9FhUIdN0R4Y4axjSr2fXpe2G2tn04ju1+O+pIJaAE
   h6Jmr3CB8YPPcpRSKrLQLkLLpJYc+GqHW0vICOI9XUUnxRsAOibSMXNyK
   CFkxgi3aibzvtfwjfRC1dq6oyNZJPkdhfHG3e1Fn2h0Mc4yaTApkoCvjn
   aBfDa639Nc4Q4/B/hF7xV8C3Jsb6NKhPojqReWm/wKpIDLnsDEQ1x/LoG
   w==;
X-CSE-ConnectionGUID: CzBHrSCVRZaAxn99xTeikA==
X-CSE-MsgGUID: gUP/8J8eQACoalqBmto/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1081713"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1081713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:26:43 -0700
X-CSE-ConnectionGUID: fjQXSwv8RtC+vz7f5suDsg==
X-CSE-MsgGUID: Ik6LpyuiQWi7n8/2QZ5FqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2432998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:26:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 09:26:33 +0300 (EEST)
To: Chris Taraszka <chris@miget.com>
cc: TuteMthCD <matias.civadda2342001@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Mingyou Chen <qby140326@gmail.com>, kento@kekto.ru
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
In-Reply-To: <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
Message-ID: <f9da7ec4-2a89-fdd0-b60e-7f7b97b97e05@linux.intel.com>
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com> <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com> <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com>
 <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1414911651-1792391193=:1469"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1414911651-1792391193=:1469
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 17 Oct 2026, Chris Taraszka wrote:

> On Mon, 12 Oct 2026, Ilpo J=C3=A4rvinen wrote:
> > I've not seen v2 so far, has there been some progress with this?
> >
> > (Not having the generalization seems a blocker adding many models.)
>=20
> Hi Ilpo,
>=20
> Sorry for the silence. Mingyou's v12 5/6 ("platform/x86:
> bitland-mifs-wmi: Add quirks table") now has the {value, profile}
> pair table I described, plus the no_set flag for GET-only values and
> accept_zero_function for SET replies without a function id. That
> covers what my v2 generic patch would have done, so I won't post a
> second one.

Okay, thanks. I'll go with that series then.

> I'll test v12 on the Xiaomi Book Pro 14 and base the
> model entry on top of it.
>=20
> Mingyou, one issue in v12 5/6, in bitland_mifs_wmi_call():
>=20
>     memcpy(output->data, payload_data, sizeof(*output->data));
>=20
> data is u8[28], so this copies a single byte. laptop_hwmon_read()
> reads res.data[0..7] for the fan speeds, which would then come from
> uninitialized stack. sizeof(output->data) is what you want.
>=20
> Kento, you're right that the match has to be on board_name TM2424.
> Since we have the same machine, let's send a single TM2424 entry. If
> you rebase your v2 onto Mingyou's table, I'm fine with it being yours
> and I'll test it here on BIOS XMAPT4B0P0909 with accept_zero_function
> set.
>=20
> Matias, sorry for the delay. I think your TM2107 v3 can go on top of
> Mingyou's 5/6 directly.


--=20
 i.

--8323328-1414911651-1792391193=:1469--
