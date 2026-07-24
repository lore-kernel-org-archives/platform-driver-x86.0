Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800EC361959;
	Fri, 24 Jul 2026 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895961; cv=pass; b=ok9iGySsTPMZdRMkw6A1chAHYP2BDlpspNt5k+Xd2hEmk5xdji4cONeyKFGNHD+QHA7TCAyIOo8oQcb5RyoZW6qKQznp5RX0Nqso2pnUXgq1QKnww5Ynb7GQl8OZN+zLTDCQUaZIFYLORTBuhM54ZAFyyeVyPT/LwJmFIaw2eRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895961; c=relaxed/simple;
	bh=GsFoUUhalsYPUAoOBdM3rlHTu0neq3kPii7gWYC55mI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MtZWb4S0PMhHRaumYqkFt+K4E1c8K7OGDBcSxfTEQ5iJW/9rECA1j6UVqQ59Ek7eRyKL7+WfNVw6xi40UGAqMxQ/vAPhcptTj9RkzPp41AJ3IWHwTaeBbHIiUsU0VIRQVezN8+uiy2PENpGBRtJpguxXI9taIfcNua/hRf9oFE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=poiisgX1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="poiisgX1"
ARC-Seal: i=1; a=rsa-sha256; t=1784895950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KA7X5fVpHJvG8FfQOOtzqKGcZ1wKoy16gGicNVBbaScDJFTciN7j9yJN9hogIxnKcc5Oeq8uPk5/o3y/Xqf2h93HWNGemjl1AjJcqq7s2D0hnhLxEM56pfVmfWLXB+zKoHpuaYue89P+YmR1iQcPdOBRZVfyXGYu8QUjynf5x3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784895950; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GsFoUUhalsYPUAoOBdM3rlHTu0neq3kPii7gWYC55mI=; 
	b=A+FnjdbwMg6PBWmo/P1Qt8mlS+fTivvCwotVRc1w/URNsCCECBVb5OApwVyI6qKV5uGlI4tK7lgvLsY2NOGCMMslN1ufJYTrGcZNieI9rDREN0d7oDkb91aO7a46wfL8O50Nl0NPI7gSG7sucQOJqNlNRxLPbyWJ4v2cUB1r8hI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784895950;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=GsFoUUhalsYPUAoOBdM3rlHTu0neq3kPii7gWYC55mI=;
	b=poiisgX1VE80N4OXtArZQcoA46KlNyaB4G/5yFQVNzUjOWuC+psPHi12XmoU6gKH
	KcbDrZa7B9cJBK71p9i7vc6AtPQikpJhG8LHQNvj2JfIVAgzvbdX0UJnYsRpY9EVPXA
	iLlksSxMqH763WfwRLCBYeu42+fIhl39LYwyU9tS9YrufeLGiqH0gGoEzyJs0UiWVHI
	9gZNd1HBYon/mlSgBg4ZBJaxOBw3lYYrvx7cexATbNVbgXCmsn62ry4ftvdoLrIw4U/
	r1Ci+cpEC0IocQ/lmkZAZugpOYo7pd2vq+C4BRXHIoTE52iXv9YGRZlaWgnIZdeIL5N
	2QLZ4J3w4g==
Received: by mx.zohomail.com with SMTPS id 1784895948126737.8376542638955;
	Fri, 24 Jul 2026 05:25:48 -0700 (PDT)
Message-ID: <49f244c86972d839773960fed75028c4cee6298a.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Fix driver
 unregistration order
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede
	 <hansg@kernel.org>, Philipp Jungkamp <p.jungkamp@gmx.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <880d06c9-48d4-92e9-ede9-c34c0f107de2@linux.intel.com>
References: <20260723-ideapad-rev-exit-v2-1-9c31159022de@rong.moe>
		 <880d06c9-48d4-92e9-ede9-c34c0f107de2@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 20:20:04 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Ilpo,

On Fri, 2026-07-24 at 14:54 +0300, Ilpo J=C3=A4rvinen wrote:
> On Thu, 23 Jul 2026, Rong Zhang wrote:
>=20
> > There are two drivers in the ideapad-laptop module: a wmi_driver and a
> > platform_driver. The former is registered before the latter, but the
> > unregistration order is the same as the init one instead of the reverse=
.
> >=20
> > Fix the driver unregistration order by reversing it.
> >=20
> > Fixes: f32e02417614 ("platform/x86: ideapad-laptop: support for more sp=
ecial keys in WMI")
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v2:
> > - Fix a typo in title
>=20
> Perhaps too used to writing "dead" so fingers kept typing... I can never=
=20
> type "roof" succesfully myself, my fingers always do "root" instead. :-)

An ideadl root does not leak on rainy days ;-P

>=20
> Anyway, I've applied this=C2=A0but took out the Fixes tag, unless you've =
some=20
> real bug in mind related to it?

Makes sense. It's not buggy as the two driver has no dependency on each
other.

>=20
> I also added Suggested-by me to take some blame (if necessary).

Ahh, forgot that!

>=20
> Thanks for the patch and Mark for review.

And thanks for reviewing and fixing my patch ;-)

Thanks,
Rong
