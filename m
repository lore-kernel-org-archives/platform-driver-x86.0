Received: from sender4-of-o56.zoho.com (sender4-of-o56.zoho.com [136.143.188.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522062E92D6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758008246; cv=pass; b=hXiLxpPo6tlgMcQSY1xyORcBQ2y87G818AV1cv9e6s5+j55lC2A8WHpMc7Po5lMYs4qWbRZEoUib6fr6vzvjZEI0WzOqrWH+jM4a18xOsW1ym+lA0zdGRY4chsZy36SzMZTq96ViNgIBD54cZt5PFy/Fw3cFlOmWilVlXZHffNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758008246; c=relaxed/simple;
	bh=u4Nn8GG86KZIB3AiZ5vx4em0kut/8t0+jx8fbL+wkjQ=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=euKcJ7vJ8u9LxeArSHYvmwJ7fEm4/aWaZDpo7qH1VLhr5/510Zs42Z1h7mPgA1UCuseSWtuvRaUkpk0udOekgWir4PdLbA/1F+Pq59AxCYO2BHG8ZC/cGKx3IUGL7Gq9ejLntJHTlo8uhMJIxUDMqaof1CSwNwXN+BL7fzip/E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=KayKwPQk; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=BUahSSsB; arc=pass smtp.client-ip=136.143.188.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="KayKwPQk";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="BUahSSsB"
ARC-Seal: i=1; a=rsa-sha256; t=1758008230; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f0kgeLU3KLkY88cZs4vZwgFpQoJCOoAQxDK2Se0GhlDXrztCeDZKYlsQwLYDxu47mjsFxPJKealHSanSOoKl7tJ7Le/QeHKdLPaKFtmtKvsRZWSZsBkj0sdmy00dI5SBcmDBhM/ANhzvEEV4m65gkEVddELxdx4tFtwyf/CKGz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758008230; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WI3edm056e6icAGKQAkR3z7O8wZM+ycHXpe5Iptg8Cg=; 
	b=l420e+o5YIwH1ewvo8c7yxTnyaYDe5qK565NCPvg9jcb1cEFOZxVs6S3K5lYRtSF8AZJFiS1vhl7I/pXtFUuRMUzidm7f7usSHUZN9sc8vQkwRa9WDPjf57ZBaPyJIz72jNLXbG6hQ5SQqKrjWT2s3z5RSxa3SFa7iXPcE1Cb4c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758008230;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WI3edm056e6icAGKQAkR3z7O8wZM+ycHXpe5Iptg8Cg=;
	b=KayKwPQk5HkZChXpQVjiN2z4aohPl3K0AqDPqTcqj3geUfg+XYj0S9bRxL7NQAqk
	SgEpD3HSEQa2XiamaWvEmPxUKafjsrm+Oz6gO3RfWw+xGuJ3ciHE0LWxMe8dBWD0LwP
	LXUuwpsjpzOebsUy9eCMHdWDJpNAO/vzcsquHH/w=
Received: by mx.zohomail.com with SMTPS id 1758008228002895.3955202551084;
	Tue, 16 Sep 2025 00:37:08 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id 2716DED080;
	Tue, 16 Sep 2025 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758008226;
	bh=u4Nn8GG86KZIB3AiZ5vx4em0kut/8t0+jx8fbL+wkjQ=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=BUahSSsBsdpBGdT4xaV16vsYlaUsqHY4UNUk8SQrbZd7jYgXWslUki7CTv22wcTR4
	 Qc25cqIL41RaG8RuZdvAe/Dk93inrNh4D2KQvwwe5OHFB/QdB5bCtBkoV4az/2C0tB
	 ZWpfCnmARd7Wcm6vIanDqQO8+DkKmovS1anMgocDEzkdGayhaHYX2bXx+FZiy8Ef4R
	 kpwdeZKqspR2RW1DEreHFse4SEkN5cRJ1vEabyZLlpMCFDYNAnQSO/fjhwGHIEwHhb
	 ZdohnGdfnn/gVLFqEd/brpoPb340z/LSZcpJsHkJ3Iw9pQVBw1vAu3t++oj37Moq+D
	 HB/BgI8y15IIw==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To:  <CAGwozwHusY+Ri_Wt1PujPcdGiBZ3QrpUNKUrZUhGwcuaZ2TLqQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
 <10020-68c90c80-d-4ac6c580@106290038> <1df-68c90d00-19-25b5f500@10458736>
 <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
 <1e1-68c90e80-a3-13ea166@216795694>
 <CAGwozwEzrkg1bbrfq8t+vDgag-H4CyzMonG6O3Td8iwNr6bh8A@mail.gmail.com>
 <1df-68c91080-1f-25b5f500@10458835>  <CAGwozwHusY+Ri_Wt1PujPcdGiBZ3QrpUNKUrZUhGwcuaZ2TLqQ@mail.gmail.com>
Date: Tue, 16 Sep 2025 03:37:05 -0400
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1df-68c91380-23-25b5f500@113479119>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 03:26 EDT, Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:

> On Tue, 16 Sept 2025 at 09:24, Rahul Chandra <rahul@chandra.net> wrot=
e:
> >
> > On Tuesday, September 16, 2025 03:17 EDT, Antheas Kapenekakis <lkml=
@antheas.dev> wrote:
> >
> > > On Tue, 16 Sept 2025 at 09:15, Rahul Chandra <rahul@chandra.net> =
wrote:
> > > >
> > > > On Tuesday, September 16, 2025 03:11 EDT, Antheas Kapenekakis <=
lkml@antheas.dev> wrote:
> > > >
> > > > > On Tue, 16 Sept 2025 at 09:08, Rahul Chandra <rahul@chandra.n=
et> wrote:
> > > > > >
> > > > > > On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <=
rahul@chandra.net> wrote:
> > > > > >
> > > > > > > On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenek=
akis <lkml@antheas.dev> wrote:
> > > > > > >
> > > > > > > > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@cha=
ndra.net> wrote:
> > > > > > > > >
> > > > > > > > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chan=
dra" <rahul@chandra.net> wrote:
> > > > > > > > >
> > > > > > > > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas K=
apenekakis <lkml@antheas.dev> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rah=
ul@chandra.net> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Added some cc's
> > > > > > > > > > > >
> > > > > > > > > > > > *Note I have a UX8406CA (the 2025 Arrowlake mod=
el, I assume it is the same on the MA)
> > > > > > > > > > >
> > > > > > > > > > > I must have mistakenly thought that the important=
 code on both devices
> > > > > > > > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it=
 emits events on
> > > > > > > > > > > both. Can you verify which codes are used on the =
Duo?
> > > > > > > > > > >
> > > > > > > > > > weird,
> > > > > > > > > > scankey -s reports
> > > > > > > > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended =
scancode set but I'm confused on the other 2 codes. the WLAN quirk defi=
nitely worked before (I submitted the patch for it for the CA)
> > > > > > > > >
> > > > > > > > > It's for keyboard detach/retach, both attaching and r=
e-attaching report the same code.
> > > > > > > >
> > > > > > > > Use evtest to find the MSC code that is used.
> > > > > > >
> > > > > > > Hmm it is sending 5E... But it is still activating and de=
activating and reactivating airplane mode (WLAN)
> > > > > > >
> > > > > > > Event: time 1758006247.925931, type 4 (EV=5FMSC), code 4 =
(MSC=5FSCAN), value 5e
> > > > > > > Event: time 1758006247.925931, type 1 (EV=5FKEY), code 23=
8 (KEY=5FWLAN), value 1
> > > > > > > Event: time 1758006247.925931, -------------- SYN=5FREPOR=
T ------------
> > > > > > > Event: time 1758006247.925937, type 1 (EV=5FKEY), code 23=
8 (KEY=5FWLAN), value 0
> > > > > > > Event: time 1758006247.925937, -------------- SYN=5FREPOR=
T ------------
> > > > > > > Event: time 1758006255.123129, type 4 (EV=5FMSC), code 4 =
(MSC=5FSCAN), value 5e
> > > > > > > Event: time 1758006255.123129, type 1 (EV=5FKEY), code 23=
8 (KEY=5FWLAN), value 1
> > > > > > > Event: time 1758006255.123129, -------------- SYN=5FREPOR=
T ------------
> > > > > >
> > > > > >
> > > > > > Sorry I'm dumb yes 5E is a new code forgot we had 5F curren=
tly, guess we should add 5E then, can you write up the patch or should =
I?
> > > > >
> > > > > Cleanest patch is a revert of "Remove extra keys from ignore=5F=
key=5Fwlan
> > > > > quirk". Should work for both -next and stable. I can write a =
patch and
> > > > > add a ReportedBy for you. I will make sure to list 0x5E as th=
e keycode
> > > > > used on the Duo. It is not ideal those three keycodes are gro=
uped
> > > > > together, but it should be fine for now.
> > > >
> > > >
> > > > Great sounds good thanks! What should we do about 5D? Just keep=
 it in? I don't know what key on the board emits 5D (if any) since it d=
oesn't have an airplane mode key.
> > >
> > > If you can compile your own kernel, can you check 0x5F is not use=
d in
> > > your device? Yeah, let's keep 0x5D for now.
> >
> >
> > Yeah give it like 15 minutes to finish, just to be clear I am compi=
ling a kernel with 0x5E & 0x5D ignored but with 0x5F allowed and runnin=
g evtest?
>=20
> Allow all three, see which does what. I am finishing the patch.


Just tried it, still just 5E can't get 5F or 5D to show up.=20


--=20
Rahul

