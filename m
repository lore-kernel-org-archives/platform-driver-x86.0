Received: from sender4-of-o56.zoho.com (sender4-of-o56.zoho.com [136.143.188.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE832773E9
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006425; cv=pass; b=UnBjRba7EPfakn/wQ7pW068wn45Uak75sotB8VQCfOJS242k7m+IDO2myd0zsZmgBJE1q5mSgldM8aEI0Bl8Kz0IUveCl7zfBDrj4e5gRcevhfkxLv+22gSD3QG6TsrZRyFdHu2nWgdsI5HG17fBh8OiXFn25hhmNkooFDNFwfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006425; c=relaxed/simple;
	bh=w0uSnYaBNvD/94TSsLPj0Rv5BxY0eO1cY9RylXIb53E=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=HcKfKvM8fP82f+VfMvcWlVlDoUWJZ5553HkeXJbjqiy+piEDt5eXaLFG0ZufLucrjHMZdLmtqAwi4wum1fNfdITScdUpGi5nWBfZTtk5TGktdZB+zDRSbHmOrUwwpy6FIZxrjBBK8sAORwqGFuXfdjmTJW1jo/SKABTt5dOlxao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=dSklz80+; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=N4BURdhB; arc=pass smtp.client-ip=136.143.188.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="dSklz80+";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="N4BURdhB"
ARC-Seal: i=1; a=rsa-sha256; t=1758006410; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1sIayxesP2WpBuadBExt8SiSS1FWvzr7+NCe3/+oo04ipZyBkA7hdl4V1qHUuTNnjX2hR9StFmAtzXsbDHitISEtfxrUnEh8Cpst37gLiR52yu172+Ab1Rl7ELecE1mC1tf+3lpNw7+EsKyWSpo2B+VSRF54pKqr8bFDfP4G2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758006410; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3LWYDAgvFfbNlW3AonaYNpF/4FNW7/hUBogYPXMdiL8=; 
	b=AQPPI0lwQiz7JqCA76VLuer9TXXN4lqU1SEI5WfH69M05gyO0X3sd6EFvOWhkkh7R1K3bEBTZQ9UPQ2kgF8uhHCn0NpChUz8rmgm1GLCoUie92IglQzDz9sWZUIPVEVsFOEBbCKt5CVc164pOtO5PWjVDpZt79CarvhXc3kOFEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758006410;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3LWYDAgvFfbNlW3AonaYNpF/4FNW7/hUBogYPXMdiL8=;
	b=dSklz80+0mg+pUzcmyvlrr/fev0I++v1OwWfgHthHaMfqdULRI2qlwCsIRgvgkL6
	zxPutUUgP0WABz7S8os9jkn8vEo6stUD3FPRTrOLKsDgDQAqHNe3tIYZ0df5zO9vWFz
	hwQZXWFBZf5TBj7/rY6h5cH/UzhUBKnq0j32gWEI=
Received: by mx.zohomail.com with SMTPS id 1758006406985124.95066733427052;
	Tue, 16 Sep 2025 00:06:46 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 5770FEAF8B;
	Tue, 16 Sep 2025 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758006405;
	bh=w0uSnYaBNvD/94TSsLPj0Rv5BxY0eO1cY9RylXIb53E=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=N4BURdhB+0uFaLgd6hMEIrFquUQaKUhCHwHWSX1673hDQ1i1/WahbxUC9XVgxEbIb
	 ATRckmK7lKWuTynmDtGHp785aDeLKGXBCVZm/ujmA/Bu13llJgJMwqBVK1XRXpGnPX
	 xGxXBeg0puO0vpuqpeGMsc4XlZnWUNOMtDKpiAbUCWz6+12OlR1lTqVD7ZY0X0mZ1h
	 gZt6cbZgInsCxf6o75H6gq72ekvp33ej2C0V9nHfgj5hu3uDllnpbN9FW9X1y7NX3Q
	 hpccma07i9L4P6vv8DfKIG14zQRd1WO7RFCSUKsndOLCjBg8XbI/ZV/S61Ah7xZijn
	 KJs34NmQ98A3w==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To:  <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>  <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
Date: Tue, 16 Sep 2025 03:06:45 -0400
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <10020-68c90c80-d-4ac6c580@106290038>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:

> On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net> wrot=
e:
> >
> > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@ch=
andra.net> wrote:
> >
> > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lk=
ml@antheas.dev> wrote:
> > >
> > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net=
> wrote:
> > > > >
> > > > > Added some cc's
> > > > >
> > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume i=
t is the same on the MA)
> > > >
> > > > I must have mistakenly thought that the important code on both =
devices
> > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits events =
on
> > > > both. Can you verify which codes are used on the Duo?
> > > >
> > > weird,
> > > scankey -s reports
> > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set b=
ut I'm confused on the other 2 codes. the WLAN quirk definitely worked =
before (I submitted the patch for it for the CA)
> >
> > It's for keyboard detach/retach, both attaching and re-attaching re=
port the same code.
>=20
> Use evtest to find the MSC code that is used.

Hmm it is sending 5E... But it is still activating and deactivating and=
 reactivating airplane mode (WLAN)=20

Event: time 1758006247.925931, type 4 (EV=5FMSC), code 4 (MSC=5FSCAN), =
value 5e
Event: time 1758006247.925931, type 1 (EV=5FKEY), code 238 (KEY=5FWLAN)=
, value 1
Event: time 1758006247.925931, -------------- SYN=5FREPORT ------------
Event: time 1758006247.925937, type 1 (EV=5FKEY), code 238 (KEY=5FWLAN)=
, value 0
Event: time 1758006247.925937, -------------- SYN=5FREPORT ------------
Event: time 1758006255.123129, type 4 (EV=5FMSC), code 4 (MSC=5FSCAN), =
value 5e
Event: time 1758006255.123129, type 1 (EV=5FKEY), code 238 (KEY=5FWLAN)=
, value 1
Event: time 1758006255.123129, -------------- SYN=5FREPORT ------------



--=20
Rahul

