Received: from sender4-of-o56.zoho.com (sender4-of-o56.zoho.com [136.143.188.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8DB2DECBF
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005808; cv=pass; b=htno6cqnck+bLd679hXRUuDGPI0Q0TkPq7UyGBe7U8J2rd3/YpI4k3xczXuYcQN7zN+gvdeA31S9GWFThb72Pff6NYcH3HH0k48wxUAaE4CIIKZZUB4rSEjbOPBrFz6j3o2lgXex9kUn2lIzIsr/iGT0mhSyg9hdVdnlf5Qi1aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005808; c=relaxed/simple;
	bh=2ElekgoP82bRDA2XTPtDRvsB0NhhfFnhnDFOdTZZeaQ=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=qYITM0XnfwleRsEqW5ePA+FlsFL5R3jN7NnoTDTA5czW8lL265vBo4kvzT0awoTa30QnW8KmQnzkL5Wxgl4jXlVfPkm7BRjy1o+ks1H2Dpl0jE8fCEPHuvOaNRKv2AzxnPcYIkKO8tcoMBziJhaYsjJZQnN05iVWMDpKlDDKtLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=BldtF4tK; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=rNmQzgIF; arc=pass smtp.client-ip=136.143.188.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="BldtF4tK";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="rNmQzgIF"
ARC-Seal: i=1; a=rsa-sha256; t=1758005795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VlqzTWboknyVMS0wNolxA9qWvIVfJ63J4fUZteSuzhcAboOzRALvZx/ur5F2XVsw2E6dVQB+Ui097yM0bj9iCFDYntQWMivi7xM8cFBkr1E2Gz6NYLs3OQjZGMho5b9xIT1sUZU5QO5zbLPnhNRLZ/MWohHkhFtLFhOqbCPQsJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758005795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SPC/G5PnX/WQkOMXSnJNr0bQACNmAwA7EvPAc4AjU8Q=; 
	b=ZjcXpuIn0Ha4295GUJWX/SzhFnUSsmdksWrML9j9qe9Ywe4rl+fL/Tea7oBhiZr2wppJlGUPEA233JYXwJiApYN/ig//1vFFIo3NZo1e0IbcSi0OyAyEAYGWHAl+b86kDK7BtnSp5DddMdPMP5dCxFu6hY/gVJjzMNxw5fOijMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758005795;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SPC/G5PnX/WQkOMXSnJNr0bQACNmAwA7EvPAc4AjU8Q=;
	b=BldtF4tKZyZ2cbgNJvMxgu9P+01Hy20pCTqGdQQHrUov/p7YowjzxOWvdufkqAsZ
	nuH1WHjPhj/L3i+G1uVagdrh7WDhgR3nVcTgT/hkZGUXCG1rIONkxr4wp4Ky/Z4fq1l
	e3S+YeAEUS181Xo8cTJ2RLaAOuUml1dt9Xw3b1AM=
Received: by mx.zohomail.com with SMTPS id 1758005793969944.2437608825524;
	Mon, 15 Sep 2025 23:56:33 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 41531ECFCB;
	Tue, 16 Sep 2025 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758005792;
	bh=2ElekgoP82bRDA2XTPtDRvsB0NhhfFnhnDFOdTZZeaQ=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=rNmQzgIFZwWpAEvxS6D+D99hUDEDH8/KwlodjSFzesYbVl1KQTs/03qn4KKBnFznV
	 vA/FK46c8psMmRwTBdDvvgYmQHJC1qGxizsaQAhBJA2FBvKWL+Jpa+yC1H+3hDnO/M
	 McI5Z5WbuE5rjemnt2ISPUwsKMT6dceR9Xicofjqd41L4p2344r+HqHwYPs3EF0UwO
	 y0HyNueNiIfjCeJqOqlWA6HMptQ+XkmhY2PLR972hvvxRId3bm5jpL9jt6HWl1UyKk
	 q4ER/dCUteWDw/cpBS9HRD5Kp8Xs/E9QdSUE0pdfnrbmvAYcsscz1ED4litPVY7COr
	 nfBVBvmqX51jA==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To: <1e1-68c90980-99-13ea166@216761407>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>  <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com> <1e1-68c90980-99-13ea166@216761407>
Date: Tue, 16 Sep 2025 02:56:32 -0400
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Rahul Chandra" <rahul@chandra.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <10020-68c90a00-7-4ac6c580@106289939>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@chandr=
a.net> wrote:

> On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lkml@a=
ntheas.dev> wrote:
>=20
> > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wr=
ote:
> > >
> > > Added some cc's
> > >
> > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is=
 the same on the MA)
> >=20
> > I must have mistakenly thought that the important code on both devi=
ces
> > is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> > both. Can you verify which codes are used on the Duo?
> >=20
> weird,
> scankey -s reports
> 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set but I=
'm confused on the other 2 codes. the WLAN quirk definitely worked befo=
re (I submitted the patch for it for the CA)

It's for keyboard detach/retach, both attaching and re-attaching report=
 the same code.


--=20
Rahul

