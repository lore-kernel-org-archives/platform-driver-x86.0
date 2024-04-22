Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832214CB2E
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774304; cv=none; b=OaXPah1av5Yc4y0bw5X35AEMCjb3dXVVOlI9i9Ct3FdNBEYBhUyyt1dqHExb0KEuoBdDS3XuXgyKV27cBiDVgfVVSE5Y0hg0l8tWDIlnR6oTyGR5WYdU1/zKgqeMpXzFWfTYBZt+37VU4VOH+Z6EFSNKc0auYyBy+kb1pPNYdlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774304; c=relaxed/simple;
	bh=ZZUkxcd5HRPlU6HRuiPzN1HLyYZMGypeXh5z5HcjtyQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XyB1oUbckDN83Wi7ChQUsfrHdS/DROe3I/JfiUyefjlOeA2/KaPq8kv7N0XHLTeatYktKqzPcsjGfOsEaFVs98UfBavWW+lJOdnQUMScTJIzk/BXso/3ziAWfq6SyMAf5QBT3vww3HL+x8LUZLIPMxZNEfaelziGKJ3PvgZgQkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIcEwcUH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIcEwcUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713774302; x=1745310302;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZZUkxcd5HRPlU6HRuiPzN1HLyYZMGypeXh5z5HcjtyQ=;
  b=kIcEwcUHoB5WWnBSAkHPeylUD0aL1vPrSpFkcY/WzAp33ELAR25SG1NR
   kGwFGyHQWHIs5iMbd9mLjIviBMs3IiOeCdWiQiiHxr+lGBbNBYCP280ZZ
   ZCGupkIAibzRSsPvvEUCDW1h/4kw/T4eiYxqO5ZoJ7MLskO3hSZnPOHek
   gYhxYRMNMXouFiV/uyoVkWc8ifL9Rc6Lb+XqfxDRnNgjda79blFli+oYh
   gy4w5+J9FhqlfQ4XDOU9XNk4vYvb1Z7GSpCZz+5kTWMayXQ7vCVXQsRaj
   jgxyDm3TAR5uefQndk/cP0n4pPngn/oM4CDs8p0Ef1eFI9MPjkth54EoR
   Q==;
X-CSE-ConnectionGUID: cfxxCprXRR2IyJBcLNt7ug==
X-CSE-MsgGUID: vLFzp8MzSHCfWOeVTzAc7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="12239459"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="12239459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:25:02 -0700
X-CSE-ConnectionGUID: Tbutb64/QoW53S6iE2h1ww==
X-CSE-MsgGUID: ptqU0Hl8RGKNHlqLRXBcGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="61382338"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.39])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:24:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Apr 2024 11:24:53 +0300 (EEST)
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 03/24] platform/x86: thinkpad_acpi: Drop setting
 send_/ignore_acpi_ev defaults twice
In-Reply-To: <CAHp75VffM9nygSf-5Hn7wvo-sE6awma2VoFumnV9Xjj5d_d-pw@mail.gmail.com>
Message-ID: <3e005949-4319-5b16-c52c-c8bfd366e1b4@linux.intel.com>
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-4-hdegoede@redhat.com> <4f62150d-da65-7ecf-fc5d-50afa5dfccb3@linux.intel.com> <CAHp75VffM9nygSf-5Hn7wvo-sE6awma2VoFumnV9Xjj5d_d-pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1812511948-1713774293=:2288"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1812511948-1713774293=:2288
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 22 Apr 2024, Andy Shevchenko wrote:

> On Mon, Apr 22, 2024 at 11:07=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > On Sun, 21 Apr 2024, Hans de Goede wrote:
> >
> > > send_acpi_ev, ignore_acpi_ev are already initialized to true resp. fa=
lse by
> >
> > Wording here is odd (but I'm not native so could be I just don't
> > understand what "true resp. false" is supposed to mean/fit into the
> > general structure of this sentence). I could nonetheless guess the
> > general meaning of the sentence despite that, but you might want to
> > consider rewording it into something that is easier to understand.
>=20
> I read that as "true and false respectively", which is probably better

That's what I expected to see (although with a comma before respectively).

Looking a bit more into it, it seems the placement in the middle is=20
probably an artifact from another language (claimed to not be correct=20
English):

https://en.wiktionary.org/wiki/resp.

> to be spelled this way.

--=20
 i.

--8323328-1812511948-1713774293=:2288--
