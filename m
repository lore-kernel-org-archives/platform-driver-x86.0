Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F5408028;
	Thu,  9 Jul 2026 11:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595377; cv=none; b=Ts4tvYY2YLiTtgUFQ/SHSElSqeRkrn+QK6gEDyPRmfp0tCti+uZ9nWMf4RomAjcB86hfIt1ffbA7fbHFSksrLeu7ZDqG/45sHARb5btNTmx7PXoyxa3vDMffGcvwxVVJdGn0Wi6YRhSA02D30eQiT6goANU4+mSfvmFRR8E0V74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595377; c=relaxed/simple;
	bh=Ue5hcU+QQTJgDTVLdijsMzbco4ejZMsE3DyoBeiZktk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WMDWBu1HqatHE3ws3Q9J7GO+xWQH4FDKdR6kkxUtQfTZHBW18H1s+pOMEI8uxfCKMbaBit0gjx7uPYVbTlv7hTcM6cSOtSndPaGrtOpf1/gYjsJ7gsXe0wMIJyeefkOfJmR4aQdKfqgZZRRpDYVLRI6/pPUrHR3xglao3pZ7UjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjfhRmNu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjfhRmNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783595376; x=1815131376;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ue5hcU+QQTJgDTVLdijsMzbco4ejZMsE3DyoBeiZktk=;
  b=LjfhRmNuaD7+gfLAndW/seSk20V+Wv2gMGpkEhUPreWGfvh2hvWBQyqX
   q95cnWsBAYsw+81AbX6zxLeGI2R8bI8iiAGcrbHwFMvNMmmLVbqM4IFkH
   h4Yw33RE6tHZZZ6Ze2M+SptTxuX7nkfI20IyRPhnl0t5d/MUa4bzxtMjy
   1YZNHyo5G7kv5/K58KrdSmos1gHhfvqRTZECussBWqJYs7w0jNMKoQJTa
   R0odg5U5wVQMqQSl069IqIE94Eo2Kkxcs4orz7aG6xMCY3z0Hzu5pWkrc
   cstTnUuSVuaQJVc73XyvDEZjk6eNkflH4Udh6VTS79VzHFhyhfCBhufYW
   A==;
X-CSE-ConnectionGUID: c43YGzGOSzibtKJc5tmdWw==
X-CSE-MsgGUID: 274g+dHfQHKaHHBFyMMztA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95427077"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95427077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 04:09:36 -0700
X-CSE-ConnectionGUID: +UrXa26NRYSN26w1LcjJ6Q==
X-CSE-MsgGUID: 9CflS2teSCGNIzHWqsEAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250155629"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 04:09:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 14:09:28 +0300 (EEST)
To: e314eebf-06ed-44e5-9cd1-35d60d02df8c@app.fastmail.com
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, raoxu@uniontech.com, 
    shaoyang@uniontech.com
Subject: Re: [PATCH] platform/x86: think-lmi: Fix "Call Trace" error
 warning
In-Reply-To: <9E24E598526FA2CD+f70e445c-e32c-4c1f-9001-1b19be021838@uniontech.com>
Message-ID: <145261b0-e0d3-70dd-8cbb-ec1d32597fc7@linux.intel.com>
References: <20260707091555.71007-1-goutongchen@uniontech.com> <e314eebf-06ed-44e5-9cd1-35d60d02df8c@app.fastmail.com> <9E24E598526FA2CD+f70e445c-e32c-4c1f-9001-1b19be021838@uniontech.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1587894116-1783595368=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1587894116-1783595368=:1261
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 8 Jul 2026, Gou Tongchen wrote:
> On 7/7/26 21:31, Mark Pearson wrote:
> > On Tue, Jul 7, 2026, at 5:15 AM, goutongchen@uniontech.com wrote:
> > > From: goutongchen <goutongchen@uniontech.com>
> > >=20
> > > The maximum BIOS password length returned by the Lenovo platform BIOS=
/WMI
> > > exceeded the size assumed by the think_lmi driver's internal static
> > > buffer, causing the driver to trigger a WARN_ON() during self-checks.
> > >=20
> > > Increase TLMI_PWD_BUFSIZE from 128 to 256 to eliminate the recurring
> > > Call Trace warnings.
> > >=20
> > > Here is the kernel warning triggered by the bug:
> > >=20
> > >    kernel: WARNING: CPU: 4 PID: 665 at
> > > drivers/platform/x86/think-lmi.c:326
> > >    kernel:        tlmi_get_pwd_settings.constprop.0+0xe6/0x130 [think=
_lmi]
> > >    kernel: Call Trace:
> > >    kernel:  tlmi_analyze+0x31c/0x640 [think_lmi]
> > >    ...
> > >=20
> > > Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo sub=
dir")
> > Minor - but I don't think this is really the culprit :)
>
> Gou=C2=A0Tongchen - Because it was initially discovered on an older kerne=
l version,
> the path hadn't been changed at that time.

Please try to find the commit past that. You can use e.g.

git annotate 651b57dd4087^

to start annotating from right before that commit.

> > > Signed-off-by: goutongchen <goutongchen@uniontech.com>
> > > ---
> > >   drivers/platform/x86/lenovo/think-lmi.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/think-lmi.h
> > > b/drivers/platform/x86/lenovo/think-lmi.h
> > > index 017644323d46..d643cf3b81b0 100644
> > > --- a/drivers/platform/x86/lenovo/think-lmi.h
> > > +++ b/drivers/platform/x86/lenovo/think-lmi.h
> > > @@ -8,7 +8,7 @@
> > >=20
> > >   #define TLMI_SETTINGS_COUNT  256
> > >   #define TLMI_SETTINGS_MAXLEN 512
> > > -#define TLMI_PWD_BUFSIZE     129
> > > +#define TLMI_PWD_BUFSIZE     256
> > >   #define TLMI_LANG_MAXLEN       4
> > >   #define TLMI_INDEX_MAX        32
> > >=20
> > > --=20
> > > 2.20.1
> > Which platform are you seeing this on please? The maxlen for passwords =
from
> > the BIOS is supposed to be 128 so I'm intrigued as to where you're seei=
ng
> > different. It maybe should be fixed in a platform BIOS?
> >=20
> > Mark
>=20
> The=C2=A0hardware=C2=A0platform=C2=A0is=C2=A0a=C2=A0Lenovo=C2=A0X7h=C2=A0=
with=C2=A0a=C2=A0Hygon=C2=A04=C2=A0CPU.=C2=A0The=C2=A0specific
> model=C2=A0and=C2=A0BIOS=C2=A0version=C2=A0are=C2=A0as=C2=A0follows:
>
> kernel:=C2=A0DMI:=C2=A0KaiTian=C2=A0/LXKT-HG4M-X7,=C2=A0BIOS=C2=A0W0WKT1F=
A=C2=A011/18/2025

This kind of information should be in the changelog, but lets wait a bit=20
if Mark wants to check this internally.

We'll probably need to make this change anyway to avoid triggering=20
the WARN_ON() even if it would be fixed by some version of the BIOS.

> I=C2=A0found=C2=A0through=C2=A0kernel=C2=A0log=C2=A0printing=C2=A0that=C2=
=A0the=C2=A0BIOS=C2=A0returned=C2=A0a=C2=A0password
> length=C2=A0of=C2=A0255,=C2=A0so=C2=A0I=C2=A0increased=C2=A0TLMI_PWD_BUFS=
IZE=C2=A0to=C2=A0256.


--=20
 i.

--8323328-1587894116-1783595368=:1261--
