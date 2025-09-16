Received: from sender4-of-o56.zoho.com (sender4-of-o56.zoho.com [136.143.188.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41027A12B
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758006943; cv=pass; b=UNmF//i7p6ZFYnkWWyQvcj2O5E0457Cn2vOutSt1GfOKdx3pPf91K5fMA6REYbLeYaftrrOMqQDKT+8lCot3u8Hk/KD8BHm8j3CYi49bU6a2TDKX/YlLWAvdZ+4Wf7/s5eP9UDuaqVXnYEEQoIigVdnP4qYCyJXeyuhiS7+OpKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758006943; c=relaxed/simple;
	bh=IFv9OMSti0X112c3xTUh/kP8aOV7SfBurHSHR+XSfSs=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=XQsAEzb2zFtEXfVoxTogI8Ii92QOH+t1L1y4WxEb0/Ax8ufPBYQvlTn8xDie/0ynb3gU5fotcBh6W4ca1Woup9DYxixGIpwoBG5fs2Eo4VG4SDUYwbicb3lYcr5SsovZ44o2Sk1n/V8niIX8qfE7a3y5rqaafFKF0urTp86bW3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=d5O0jt09; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=fUmGfAFJ; arc=pass smtp.client-ip=136.143.188.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="d5O0jt09";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="fUmGfAFJ"
ARC-Seal: i=1; a=rsa-sha256; t=1758006926; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SoOWBkuPMBaUHfxPdU/tj9cI9qJR3W9Gtmm9hIk2vBx7p+x2qvV0c9cHJEjJObiFG+vjFQEh9ETVCqDy+LhBIBdvmiT2u8MeoHyozRIig8yV4toDxb02uPXgnOTSAEUA9c2v7upuk3z+RrrApjcGs/QOVM3ByvHBbXX7Li64BcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758006926; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7AyaLdT/hiOo5XcG1AwdqCFV0tXR+agAuYnaU0OdjKc=; 
	b=OHlVJEf2iu/y8pqX7PoKv0rGGg4jgPEHoh36VbfalbK/VOpkAClyck5Q5XQVztwwjZQ7PYbMfPLOgVa9dUkrMbWBo/SPFQN6iBUEZmVEMVjraAC534JbIhXwEMIanjWr6xpvEcuJzwTPFTB3I/7UoQUmMltLML0wuefkd/TsQ/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758006926;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7AyaLdT/hiOo5XcG1AwdqCFV0tXR+agAuYnaU0OdjKc=;
	b=d5O0jt09qF4gD0VPJIxr14Rl/drEsfcA6AMD8wqFs/gVCE1fFbBdyQPYXXzegGdo
	JAw+VEDRBqLhWmrgLV4fnIu1dDK5wWGZlOQWx9oYrxmDS3hXSIDH8liAIaFy7T6GuEY
	bQloaX+gWQJSdHVEKtbNU7pVPfDPX2+zD/HrmOUE=
Received: by mx.zohomail.com with SMTPS id 1758006923537706.3042761772776;
	Tue, 16 Sep 2025 00:15:23 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id DFD09ECFF7;
	Tue, 16 Sep 2025 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758006922;
	bh=IFv9OMSti0X112c3xTUh/kP8aOV7SfBurHSHR+XSfSs=;
	h=From:In-Reply-To:References:Date:Cc:To:Subject:From;
	b=fUmGfAFJvxLtz+w7ZHyf8ioFveDRzJoY6e3cWhiheVwIWFgViv0efHbrDMdRBUNRI
	 Wol+4uQ3H/17QInmZaYHe6OuPxwGlYOjxNyrHVcm5Sk3iu2hCUECa2r/qpKNjbDs2W
	 sw5IOekRSQ82mGhGJqSejWrb3YNPEKBzVk3HvbSZtumqx++wLCip3kt53eN9fqjpXq
	 XYT1OxOCR0k5MS9++47ROU+DnEXUKKJGduV6hzzK5lxQ/IJRzd1U6a3a7YevAOZ0Bc
	 dJshlnT7P1uroMJ0DSOqIVSC0TFDMNub8hccLZpCW4wYbhynU+n9NRcMzyT0te3vmJ
	 TutMUVZu3P4+g==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To:  <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
 <10020-68c90c80-d-4ac6c580@106290038> <1df-68c90d00-19-25b5f500@10458736>  <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
Date: Tue, 16 Sep 2025 03:15:21 -0400
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: "Antheas Kapenekakis" <lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1e1-68c90e80-a3-13ea166@216795694>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tuesday, September 16, 2025 03:11 EDT, Antheas Kapenekakis <lkml@ant=
heas.dev> wrote:

> On Tue, 16 Sept 2025 at 09:08, Rahul Chandra <rahul@chandra.net> wrot=
e:
> >
> > On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <rahul@ch=
andra.net> wrote:
> >
> > > On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis <lk=
ml@antheas.dev> wrote:
> > >
> > > > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net=
> wrote:
> > > > >
> > > > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <ra=
hul@chandra.net> wrote:
> > > > >
> > > > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekak=
is <lkml@antheas.dev> wrote:
> > > > > >
> > > > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chand=
ra.net> wrote:
> > > > > > > >
> > > > > > > > Added some cc's
> > > > > > > >
> > > > > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I as=
sume it is the same on the MA)
> > > > > > >
> > > > > > > I must have mistakenly thought that the important code on=
 both devices
> > > > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits e=
vents on
> > > > > > > both. Can you verify which codes are used on the Duo?
> > > > > > >
> > > > > > weird,
> > > > > > scankey -s reports
> > > > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode=
 set but I'm confused on the other 2 codes. the WLAN quirk definitely w=
orked before (I submitted the patch for it for the CA)
> > > > >
> > > > > It's for keyboard detach/retach, both attaching and re-attach=
ing report the same code.
> > > >
> > > > Use evtest to find the MSC code that is used.
> > >
> > > Hmm it is sending 5E... But it is still activating and deactivati=
ng and reactivating airplane mode (WLAN)
> > >
> > > Event: time 1758006247.925931, type 4 (EV=5FMSC), code 4 (MSC=5FS=
CAN), value 5e
> > > Event: time 1758006247.925931, type 1 (EV=5FKEY), code 238 (KEY=5F=
WLAN), value 1
> > > Event: time 1758006247.925931, -------------- SYN=5FREPORT ------=
------
> > > Event: time 1758006247.925937, type 1 (EV=5FKEY), code 238 (KEY=5F=
WLAN), value 0
> > > Event: time 1758006247.925937, -------------- SYN=5FREPORT ------=
------
> > > Event: time 1758006255.123129, type 4 (EV=5FMSC), code 4 (MSC=5FS=
CAN), value 5e
> > > Event: time 1758006255.123129, type 1 (EV=5FKEY), code 238 (KEY=5F=
WLAN), value 1
> > > Event: time 1758006255.123129, -------------- SYN=5FREPORT ------=
------
> >
> >
> > Sorry I'm dumb yes 5E is a new code forgot we had 5F currently, gue=
ss we should add 5E then, can you write up the patch or should I?
>=20
> Cleanest patch is a revert of "Remove extra keys from ignore=5Fkey=5F=
wlan
> quirk". Should work for both -next and stable. I can write a patch an=
d
> add a ReportedBy for you. I will make sure to list 0x5E as the keycod=
e
> used on the Duo. It is not ideal those three keycodes are grouped
> together, but it should be fine for now.


Great sounds good thanks! What should we do about 5D? Just keep it in? =
I don't know what key on the board emits 5D (if any) since it doesn't h=
ave an airplane mode key.



--=20
Rahul

