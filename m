Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E718E046
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Oct 2024 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239844; cv=none; b=De7TKE245tCUwr286FpEhqKpbAQlcjedr/XO1Ru5BKHO6mRC/MAsuQedfF+NQb+24GmKE2ymXjS5tPExQ63uqO/crIrbx+IAkZa7dBZBUsBQ1mczTxjMs5B7LQklAjHqExFFlXphfoVK2pbrNSixxghAm33gUWNu/KhBvjEwSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239844; c=relaxed/simple;
	bh=0U5c7OgeSX4AMm4+F/GH1eU8FK140EtKaAQWvNr/C2g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V4BZM6pmhGYp3l8jOPfB8mvD00Nc6VAFG5uchvfXg33T0wWpaRtaZAfZaCQmhx/yzNBUUpgCd/fjLGnqAcJB8coXU9ge5tmgpo0zUq/0rOWRERDhYxwd5z8hs9XtdugTgBU7DQ/s2seDWf2aj3w4zv5sZgBIKMDD8UfklE4ssuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMffoAcB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMffoAcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729239842; x=1760775842;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0U5c7OgeSX4AMm4+F/GH1eU8FK140EtKaAQWvNr/C2g=;
  b=SMffoAcBoyKkmzzQUFV/P5pKv6QhPGvLUpv7BBQTzUWDXjtRgR6fJGz2
   FGrG9I5Pp2EzBVc1i99JaDUyHiWxoAWX1wvZziEcbKUnejiEuAn6Btme7
   WebJ9WIgPAvl4BKeRWBK0OABGsfap82YgbX3dVc6A4PN/gsYiB8gvNWEW
   A98kW5ABLjRcEJRHUh0mAR3M7Y/bMDwySaKP5pshm5EPjL26grU/QHzeQ
   SubMwtLYalLAwJJ25ActJHZcQ/yl7xqiC6g+RxGXCOEcJARmBYECc+rij
   Si0OHMz3bPKVMZXYKQA3GCLXG+FoUvdLXJufwgOuaG+arsVao3Dz8uVJd
   g==;
X-CSE-ConnectionGUID: wCxHUFptTfmNLCescF6HwA==
X-CSE-MsgGUID: HeAZ+ReJTi+shTzdvveJpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28638627"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28638627"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 01:24:00 -0700
X-CSE-ConnectionGUID: Vv03jCjLQTq/SXGkbooZ0Q==
X-CSE-MsgGUID: LQ6lf8XORJub+bMIoB4rIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="83578978"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 01:24:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Oct 2024 11:23:56 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Switch back to struct
 platform_driver::remove()
In-Reply-To: <ge3xoxfiobwm5z572tdfc6rueikxlqwivngruhysdw5gtoif67@wagx5eid4bjy>
Message-ID: <8dd95728-484e-05a2-8b89-cf320296a8ab@linux.intel.com>
References: <20241017073802.53235-2-u.kleine-koenig@baylibre.com> <734d8937-a111-789a-4e0b-83c623408255@linux.intel.com> <ge3xoxfiobwm5z572tdfc6rueikxlqwivngruhysdw5gtoif67@wagx5eid4bjy>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1834622462-1729239836=:1141"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1834622462-1729239836=:1141
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 18 Oct 2024, Uwe Kleine-K=F6nig wrote:

> Hello Ilpo,
>=20
> On Thu, Oct 17, 2024 at 12:52:44PM +0300, Ilpo J=E4rvinen wrote:
> > On Thu, 17 Oct 2024, Uwe Kleine-K=F6nig wrote:
> > > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > > return void") .remove() is (again) the right callback to implement fo=
r
> > > platform drivers.
> > >=20
> > > Convert all platform drivers below drivers/platform/x86/ to use
> > > .remove(), with the eventual goal to drop struct
> > > platform_driver::remove_new(). As .remove() and .remove_new() have th=
e
> > > same prototypes, conversion is done by just changing the structure
> > > member name in the driver initializer.
> > >=20
> > > While touching these files, make indention of the struct initializer
> > > consistent in several files.
> >=20
> > Thanks.
> >=20
> > I've applied this patch now to review-ilpo branch, it applied conflict=
=20
> > free (unsurprisingly).
>=20
> Thanks.
>=20
> > Next time, please make PATCH x/y out of indentation or any other unrela=
ted=20
> > change (I'm happy to take them too). I often validate large-scale=20
> > mechanical changes like this using tools because it's harder to fool=20
> > a pattern matcher than my eyes/mind. Any unrelated change creates noise
> > I have to deal with.
>=20
> I'll try to remember. But I already now ask for forgiveness because in
> my experience trivial whitespace only changes are not so well received
> by most maintainers and in the past I was asked to squash these cleanups
> into the functional patches. Do you know about git show -b (and diff
> -b)?

This was not a functional patch but large-scale mechanical change (ie., no=
=20
function changes).

I understand it might be hard to navigate various preferences of different=
=20
maintainers (and I took your patch anyway so I can hopefully remain
reasonable next time too :-)).

I know about -b, -B, and --word-diff (these are actually among "tools" I=20
use per usecase).

--=20
 i.

--8323328-1834622462-1729239836=:1141--
