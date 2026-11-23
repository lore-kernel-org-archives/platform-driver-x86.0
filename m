Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447456;
	b=BfITmEuyA4RA2Nyu4XgUYmwlqMOCsbi+C10mHRMvAEpzmc3kvpVTk8W5w8Ig0SgEh5eV
	 kNmD5r0TUn4lX+Bt1ejZOaKlAsvcFNr4LOva01/h/Z8bLhRhQgD4qtmefA+G6GxUg6XSa
	 Ul5lij2OJn2UW1lVctaTH9FD86mm+teTCRDbu8VxRUHeoVZyMevAouzQQ3pw8ZAbgCYzD
	 TGzuuCq+O/oL1N4JPDFMXx+577lANW7jcsAYYQf0CFiA9i9zvC9MhfBUtSoXZj9nZNXhu
	 GGtAX7Lz4Tx75MGg5Sqb1Ddt1GJlpyh57/drvF4MYOMLshZ4QfrrENvU3zPTdJNQ/Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=V/YFW5qCF7btgX2Qn6QYEq94stLmisR9BEmmkqSO0OI=;
	b=o4J+0bd/OZZdZlPmsHQ27c2zhzGZsgC9RCwXcDTePXA9r/+IekpM4i6mHROWBQTdvbl+
	 X7secOKTkhcQ54tZyJbFHx1wvjvHKSMKaFT+ix5rNYP5PgYQoARDOs5ff9NWjAmeX5CMu
	 70MXe+C0z2h1iyRnDQyfzYcIFJUwSigIwsu7GEpyWkUM52w2qqaNyJytzM9H9X+3gs5h0
	 ip4/MCT2dlzJfHG+X7dmrmYTHRn1zA0ix9ckO/POWbVtQ50wIc7/GiUkK8q22o8IkvvwL
	 GVIy2woOBr2al88Rm546b05bOZ5dniKtKjAZzvYX1llO9FDDkaMqq6D6AgLXP+lz1gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="B/Uubx5i";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E8606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 15:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B/Uubx5i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795447456; x=1826983456;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=n9eZAlJWL/lgMANaM+21eZMCCZI9YhOwfL1Wo/N0GJk=;
  b=B/Uubx5ir1ZEKLH9RcBIC20R9egueys5KlOLX3FNQOcde6IOREvsFSjF
   HI0jdBdkXZvpRuO6C5TA/E8qhcHCzfjC2lnb+DeTCevDuTmuVvZbRM1nb
   IKFiyQL/TqNjVyLTCM8E7eqxH77TusFiuOkKFV3dmx1EgkoiSmpMnvkul
   gIHGwp01UzyMkyiGLadlY4qjTJO31lHnJC4lT0Zgg4J/18fvzyQ/OntnD
   SSipWx6e279skm/T9/jVNwizvgY+NAbDCAP7ardocQSnWMAnwwlkHvw7K
   68oW2Oulpf3Z8VbK4x/ZiHqKa6NcGGoqooga2F0z8wtAoGLepVmCr/1Tc
   A==;
X-CSE-ConnectionGUID: ZrMfQYdCTv6XqDJH+iSniw==
X-CSE-MsgGUID: tEW64z/TRmyJdfA+WsSwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4161849"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4161849"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:24:16 -0800
X-CSE-ConnectionGUID: AXceoPCBTEq6DPexSTW2qQ==
X-CSE-MsgGUID: olZ/+d9lTJq5yIXU+KmZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13115310"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:24:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 17:24:11 +0200 (EET)
To: Felix Radensky <fradensky@nvidia.com>
cc: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v3 3/3] platform/mellanox: nvsw-host-spc6:
 Add support for SPC6 air cooled switches
In-Reply-To: <20261123151425.2617731-1-fradensky@nvidia.com>
Message-ID: <2b188f92-d0ab-1639-8668-16f730566a7f@linux.intel.com>
References: <20261020172756.4160946-1-fradensky@nvidia.com> <20261020172756.4160946-4-fradensky@nvidia.com> <7f7a0477-95b1-c2d8-a9ef-6b11b740a51c@linux.intel.com> <20261123151425.2617731-1-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1544127227-1795447451=:1065"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1544127227-1795447451=:1065
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Nov 2026, Felix Radensky wrote:

> On Mon, 23 Nov 2026, Ilpo J=C3=A4rvinen wrote:
>=20
> > Please check if sashiko's comment this patch is valid or not.
>=20
> It is valid, and it is already fixed, in the LED tree rather than here.
>=20
> The finding is that the ten fan drawer LEDs this patch describes are
> never registered, because mlxreg_led_config() decides whether a LED is
> present by testing a bit of the capability register, and these entries
> carry a slot index instead of a bit. The capability register of these
> systems reports a count of the fan drawers present rather than a
> bitmap, as the cover letter described.
>=20
> Nothing in that is specific to this patch. The same description style
> is used by mlxplat_mlxcpld_xdr_led_data[] in mlx-platform.c, which has
> been losing all twenty of its fan LEDs since the table was introduced
> in v6.16, so the gap is in leds-mlxreg and the fix belongs there. Lee
> has applied it:
>=20
>   68a2bfdf7b4d ("leds: mlxreg: Fix missing fan LEDs on systems
>                  reporting a unit count")
>=20
> currently in for-leds-next, so it is queued for the same merge window
> as this series. It teaches mlxreg_led_config() the counter flavour of
> the capability register, mirroring what mlxreg_fan_connect_verify()
> has done since commit 1e11552ee54d ("hwmon: (mlxreg-fan) Add support
> for new flavour of capability register").
>=20
> There is no build or apply dependency between the two. They only have
> to meet in the same release for the LEDs to appear, so this patch
> needs no change for it and the LED table is unchanged in v4.

Fair enough.

--=20
 i.

--8323328-1544127227-1795447451=:1065--
