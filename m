Received: from sender4-of-o56.zoho.com (sender4-of-o56.zoho.com [136.143.188.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7728C864
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006504; cv=pass; b=BILEIeijg+HHkIpWGsoSQmZOgw7rmzjAxjasl07AuhfRtPg6VrmqZuppS+OROYOQPlN/8MZX8gVzC0nIalS8Kk8m0bN+D8E7ehuxG2j5LIPqSqCXasS+7WF2ip3L18RD9XCCnGneOHLdWgt2saNM1hQnlc6PkmQG3UaUTjfKPQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006504; c=relaxed/simple;
	bh=hGYPPTIfuCTULY1aM2GXZvrqk9l3nhTrd0AvYSXThNA=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=DetYZYKtc0noTgJQcL9veenzO7Kkwa4HWzGlAEzXCtTCsWmxLu6xcammkKkIKQqNwxU9wVFh+8gTUCSNgxiuMlUBAy+KRziB9OFDbGDViJVVyBtvPEIK5OR+VJbf1NwkmGp+8qKzFqrMZ6mwwNu2PdKYhybkjIzkybIBaLnDYRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=T2TA5CFU; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=euknYp3g; arc=pass smtp.client-ip=136.143.188.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="T2TA5CFU";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="euknYp3g"
ARC-Seal: i=1; a=rsa-sha256; t=1758006490; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FgtGVv7e5LIzJKHZ5+NVju1T75Rf8z1d71+twrCFFtBg1jDQhJrxj1SvtWu1/1ORj2ro3pCNZTVb4b2PWGS/2sRwlhhSxuxXtrbqrdWq2vuFF68LOkpqKPMbx/hr+oSyQNQc+khOxAEt5py37wnC2/NbO1OWrZ3eJ4GlXD7G/38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758006490; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZVMk8BDb35HK188mbXNP9oGYw4b6xQY2iP3YIbUdK8A=; 
	b=c+CqBwNquInHa8SeXbKY6A5+HrvmgWlcPdqGo1L78vJCuw5l+YXvNQGp1Eo7NV8f9QuNtNdUsuUszUeHMNrfoEUUU9lM+Uw8Aq0XAWeywcxwUIUqw8DWOE1Au8oEXZIWSKuoxVEK+9sH6VoqeumjvweJpV36v1L4zhG+m8a1vOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758006490;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZVMk8BDb35HK188mbXNP9oGYw4b6xQY2iP3YIbUdK8A=;
	b=T2TA5CFUnKAKfkqG9IkkCzhj9gRebhffxkyjA1CDh+ZQEHgtBXEABNTBLHx1G1Wo
	FcoDoWUGRG6wQI3xSdJ9kUjG50Fc9Q2Wz5LJG52XItKvVXTTBD9AuElROVhD/V692jn
	dQ8HF6JBj7c2L1lqBxytx9wBbvXvmvZnV/gVnmEc=
Received: by mx.zohomail.com with SMTPS id 175800648908429.206656951030254;
	Tue, 16 Sep 2025 00:08:09 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 63849EAF8B;
	Tue, 16 Sep 2025 07:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758006487;
	bh=hGYPPTIfuCTULY1aM2GXZvrqk9l3nhTrd0AvYSXThNA=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=euknYp3g2cdwc/JW1dT2868XFItZf9iyHV+8WeoAu7hFnNhU6QB79KAnrcl+55w9l
	 Cp1TjRQXwGPA3Zvuvcngff4B8KId0OAtVnS/bB40RjjSunutFngBqRSA6H9jDZA2D6
	 qRRAkWToGih0YoXzfHA10jM8SP9Puo7XX5IkPJMA5ko22C3CH5Ro9W/Ki+Qw9lt+5z
	 P+SsYrU6xoMFE/ronyyTNZTQKXkwCrJbR/qBzElaDQbh2hDpyFZS0UmYu3lq2WyaP/
	 bm6KYtTN/ZXPAEEnIFUzAdkrFfFZqq80HdjTiLP2KgaKf6tny4OCMspiWkhZ0o9atk
	 EHDoU2lVrWD2w==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To: <10020-68c90c80-d-4ac6c580@106290038>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>  <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com> <10020-68c90c80-d-4ac6c580@106290038>
Date: Tue, 16 Sep 2025 03:08:07 -0400
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Rahul Chandra" <rahul@chandra.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1df-68c90d00-19-25b5f500@10458736>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <rahul@chandr=
a.net> wrote:

> On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis <lkml@a=
ntheas.dev> wrote:
>=20
> > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net> wr=
ote:
> > >
> > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@=
chandra.net> wrote:
> > >
> > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <=
lkml@antheas.dev> wrote:
> > > >
> > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.n=
et> wrote:
> > > > > >
> > > > > > Added some cc's
> > > > > >
> > > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume=
 it is the same on the MA)
> > > > >
> > > > > I must have mistakenly thought that the important code on bot=
h devices
> > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits event=
s on
> > > > > both. Can you verify which codes are used on the Duo?
> > > > >
> > > > weird,
> > > > scankey -s reports
> > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set=
 but I'm confused on the other 2 codes. the WLAN quirk definitely worke=
d before (I submitted the patch for it for the CA)
> > >
> > > It's for keyboard detach/retach, both attaching and re-attaching =
report the same code.
> >=20
> > Use evtest to find the MSC code that is used.
>=20
> Hmm it is sending 5E... But it is still activating and deactivating a=
nd reactivating airplane mode (WLAN)=20
>=20
> Event: time 1758006247.925931, type 4 (EV=5FMSC), code 4 (MSC=5FSCAN)=
, value 5e
> Event: time 1758006247.925931, type 1 (EV=5FKEY), code 238 (KEY=5FWLA=
N), value 1
> Event: time 1758006247.925931, -------------- SYN=5FREPORT ----------=
--
> Event: time 1758006247.925937, type 1 (EV=5FKEY), code 238 (KEY=5FWLA=
N), value 0
> Event: time 1758006247.925937, -------------- SYN=5FREPORT ----------=
--
> Event: time 1758006255.123129, type 4 (EV=5FMSC), code 4 (MSC=5FSCAN)=
, value 5e
> Event: time 1758006255.123129, type 1 (EV=5FKEY), code 238 (KEY=5FWLA=
N), value 1
> Event: time 1758006255.123129, -------------- SYN=5FREPORT ----------=
--


Sorry I'm dumb yes 5E is a new code forgot we had 5F currently, guess w=
e should add 5E then, can you write up the patch or should I?



--=20
Rahul

