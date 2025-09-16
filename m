Received: from sender4-of-o56.zoho.com (sender4-of-o56.zoho.com [136.143.188.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD6262FF6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758007451; cv=pass; b=odNl544B/RDU/dBVOI60tZnw5lDYfwBzk4X9sElJ1tiWDhESRvHrUqZ/f1d1vX3VIRt7WRUQ1u3lv3wz+bmPfvot8zQEQOEHRyrDwPnMvGAjNkhO7JTRR15S44y2DJqg8kH+mXERaJYEZ6RTWYooIRMsC943XLu08F20ieyv5tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758007451; c=relaxed/simple;
	bh=dHojLd4bom4sYfRED/3/KmNrM9sgQ43BV+TtsGRSDos=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=TSvbR70uh0qWqmvOyLh9zkp6R81sK/fcc6m6A1cRxSqZrfkGf6rQV9BqmZZOKZ3TL0Jw6j+WKnRwjgrVE3UMFRuJOa7veWd0oS4FSDvM3uOMTyKRjq+yS0TV0WNXpcvxenFCN8H2naBRopBaluzg0svsfB07pynriHmP8m0I93U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=XyuPlo8y; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=nSuhsLjR; arc=pass smtp.client-ip=136.143.188.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="XyuPlo8y";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="nSuhsLjR"
ARC-Seal: i=1; a=rsa-sha256; t=1758007437; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R/4hnFLZo4FjGLgrqq+n2U1stnf4tNir1eBwiAGx2TRfRVS7FfOFLiYh7UkYlQmNToEPi83vsP9oAvxgu7x2xW16CK/k6M3TTeWL6M70xfQVWH5p7A94xtzaV474CgqZLMhhy40JTJBxdpUqrwRfxHZ2gVKu10DXjShpPWv07qM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758007437; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3MlozttnpuZIq9DCYcDepPgJagzg+606/aGtem5MZrI=; 
	b=BXm0/Dfx3sMUnTEgmqRB0zcR/a71da4K+VvjQCnASUv4gXZ19PGcvLN2ncnlQR75PiHHLWpMyfu8XM+QBFZXSIyeV66Xw5D+JNsg1gWktmPa5DRUFOgBQjrGbuYtXNlq6BUuErNxwiBtrzPwBq6wus2LGDkEhupr0otQDCVLXdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758007437;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3MlozttnpuZIq9DCYcDepPgJagzg+606/aGtem5MZrI=;
	b=XyuPlo8y5yPlOB9nq4MQLYKjbu4mOZHNkk1M+Tk/BbNH44as0EI6QDHqf+TtOm3Z
	0yqkm+xPP51ERalAEQOCoRHsaESQG3L/EJ5kxWfxARW8SVFiOO1W0NgHcPvOcPBPYPD
	oV22bZVeCyRJlVDdlJx5md/4yNa32OERbSoHiU0A=
Received: by mx.zohomail.com with SMTPS id 1758007434265178.90570354696524;
	Tue, 16 Sep 2025 00:23:54 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 885A4ECFCB;
	Tue, 16 Sep 2025 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758007432;
	bh=dHojLd4bom4sYfRED/3/KmNrM9sgQ43BV+TtsGRSDos=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=nSuhsLjRO4f+4i7NVxxZ+0pMt5QmmMCxLKtTIBdAgHhheUQM7nEWyiegWJ+yLilia
	 jJeHFE8rm2vbo1hcldMyg9gkKgOppP7/+rilZJ7F1Bkmo9Xx9mDoVdeEpbDQFdhAR0
	 C0VTYW63/kGNt2MqKpHLH2EyEjoSogRn7oJz0+bHfulSp6VIKvstYGZyoRB4uvoXdu
	 NkDaRS4EZaboMduaCZTvV4rHwZ6drK+E/rexC0gIeGnEfF1wc/mAfC+cgSIXBeNa0L
	 C3ojuD75Av28FEFKGa1GWzyFU5UYq7ziQbesMJvpIzqPxJK+U32d3OmjTGnIMrX3YG
	 vpuKlkcbmvPxg==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To:  <CAGwozwEzrkg1bbrfq8t+vDgag-H4CyzMonG6O3Td8iwNr6bh8A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
 <10020-68c90c80-d-4ac6c580@106290038> <1df-68c90d00-19-25b5f500@10458736>
 <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
 <1e1-68c90e80-a3-13ea166@216795694>  <CAGwozwEzrkg1bbrfq8t+vDgag-H4CyzMonG6O3Td8iwNr6bh8A@mail.gmail.com>
Date: Tue, 16 Sep 2025 03:23:52 -0400
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1df-68c91080-1f-25b5f500@10458835>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 03:17 EDT, Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:

> On Tue, 16 Sept 2025 at 09:15, Rahul Chandra <rahul@chandra.net> wrot=
e:
> >
> > On Tuesday, September 16, 2025 03:11 EDT, Antheas Kapenekakis <lkml=
@antheas.dev> wrote:
> >
> > > On Tue, 16 Sept 2025 at 09:08, Rahul Chandra <rahul@chandra.net> =
wrote:
> > > >
> > > > On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <rahu=
l@chandra.net> wrote:
> > > >
> > > > > On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis=
 <lkml@antheas.dev> wrote:
> > > > >
> > > > > > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra=
.net> wrote:
> > > > > > >
> > > > > > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra"=
 <rahul@chandra.net> wrote:
> > > > > > >
> > > > > > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapen=
ekakis <lkml@antheas.dev> wrote:
> > > > > > > >
> > > > > > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@c=
handra.net> wrote:
> > > > > > > > > >
> > > > > > > > > > Added some cc's
> > > > > > > > > >
> > > > > > > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, =
I assume it is the same on the MA)
> > > > > > > > >
> > > > > > > > > I must have mistakenly thought that the important cod=
e on both devices
> > > > > > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emi=
ts events on
> > > > > > > > > both. Can you verify which codes are used on the Duo?
> > > > > > > > >
> > > > > > > > weird,
> > > > > > > > scankey -s reports
> > > > > > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scan=
code set but I'm confused on the other 2 codes. the WLAN quirk definite=
ly worked before (I submitted the patch for it for the CA)
> > > > > > >
> > > > > > > It's for keyboard detach/retach, both attaching and re-at=
taching report the same code.
> > > > > >
> > > > > > Use evtest to find the MSC code that is used.
> > > > >
> > > > > Hmm it is sending 5E... But it is still activating and deacti=
vating and reactivating airplane mode (WLAN)
> > > > >
> > > > > Event: time 1758006247.925931, type 4 (EV=5FMSC), code 4 (MSC=
=5FSCAN), value 5e
> > > > > Event: time 1758006247.925931, type 1 (EV=5FKEY), code 238 (K=
EY=5FWLAN), value 1
> > > > > Event: time 1758006247.925931, -------------- SYN=5FREPORT --=
----------
> > > > > Event: time 1758006247.925937, type 1 (EV=5FKEY), code 238 (K=
EY=5FWLAN), value 0
> > > > > Event: time 1758006247.925937, -------------- SYN=5FREPORT --=
----------
> > > > > Event: time 1758006255.123129, type 4 (EV=5FMSC), code 4 (MSC=
=5FSCAN), value 5e
> > > > > Event: time 1758006255.123129, type 1 (EV=5FKEY), code 238 (K=
EY=5FWLAN), value 1
> > > > > Event: time 1758006255.123129, -------------- SYN=5FREPORT --=
----------
> > > >
> > > >
> > > > Sorry I'm dumb yes 5E is a new code forgot we had 5F currently,=
 guess we should add 5E then, can you write up the patch or should I?
> > >
> > > Cleanest patch is a revert of "Remove extra keys from ignore=5Fke=
y=5Fwlan
> > > quirk". Should work for both -next and stable. I can write a patc=
h and
> > > add a ReportedBy for you. I will make sure to list 0x5E as the ke=
ycode
> > > used on the Duo. It is not ideal those three keycodes are grouped
> > > together, but it should be fine for now.
> >
> >
> > Great sounds good thanks! What should we do about 5D? Just keep it =
in? I don't know what key on the board emits 5D (if any) since it doesn=
't have an airplane mode key.
>=20
> If you can compile your own kernel, can you check 0x5F is not used in
> your device? Yeah, let's keep 0x5D for now.


Yeah give it like 15 minutes to finish, just to be clear I am compiling=
 a kernel with 0x5E & 0x5D ignored but with 0x5F allowed and running ev=
test?



--=20
Rahul

