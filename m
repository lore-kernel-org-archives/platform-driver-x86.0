Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792893464;
	b=PUIe7KtaKBMldMuXiBMgCvOAJPkncqyvQibulJREJuUbr1W8GDe7i4y7R0C/52Ib3xKw
	 YQ268xNtovjg78wLOj0wIWycpfRobGzpczSIvNSazEt6vJVsq0KiEWYbl1KL9G4OVBl3G
	 DL/G8Ifrovbzr/Nge8eLZB65hdQKLP+Rcru0atoPkS2JWwkBfmgKFp6ETYCaJwCP45j5h
	 YG5uWRVytC39lc0Xl3Qtl+eTrCucF7xqEgfAT2m/a4CNR+PB+wHkxwpo3bofQp1z8By1U
	 0qngAfz+F3O1fDWmSzuJWcIBaCQN/HazrYI4j2b8nGyM3XXbgco2QCtJdis3SRYb1CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893464;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=4h64vo79lK2wewb7d7GpVCiab3coj3gK3NzNyezcugE=;
	b=POudes++uiSmyZBM070rjAL728/0FdaSg3wfVcUNLb+BZbZ21pFO28z3+mRrvp0tImqW
	 wUwoqOohgUg82ubhE3DfwT2qieDtKw129DFiWpcDSIS8lnU1hioerjDr9NsltcgSLNTKg
	 2kxO6MD9C43Zjg/wuRSQ/C29KD8AcfR4UgZWG0jA3ziticf9yvCImM1NXGSGK7p++qMys
	 jMzHM14Mj8A/AtMqBfCiSRTzdNJlWha2EmG4/8jXohqF8+6LypMb+pdV+KztfTnE5jwp8
	 OlMAv7SOZk+gek/i1KfGU8fyDbHSywYAYZkn66zW5ae75UYZeEcA8EeDHFusuhF90rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="SJ3Yoku/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA4606A31A;
	Sun, 25 Oct 2026 01:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SJ3Yoku/
ARC-Seal: i=1; a=rsa-sha256; t=1792893453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bs7TuZH6QsjYYZKF+fV5lysLI3WTk5qyE6fFGqsdDTOyZiTyQQDjfHK1EmEEa9eWc6Kq/c22eb/d7+bRsIE7tkFkFnZbpuAu/MBleqHVf/iClLWkPqsK3kwKXoq0JXsL8pyspQjAg+tsUkjrJEkYBIO9I/Ro5R7Mvr/Jsi8/69I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792893453; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4h64vo79lK2wewb7d7GpVCiab3coj3gK3NzNyezcugE=; 
	b=fVKa6eB3gs1FkRsncasOVVyJR+9EOryCyLj+2Dw22xViT0jeZKPKvoYqUZk5MPPZWRdZx/3r0uWSiJkDra6Q4MMTKSf3ZrbFTNNwhZKtd1Sqajr1SH/NHCn3izjJU1iZuo9AuGWCCk0lQGDaSJatGVgwW3Ac5zdXxWlbwRE8Pm4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792893453;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4h64vo79lK2wewb7d7GpVCiab3coj3gK3NzNyezcugE=;
	b=SJ3Yoku/zH1DrKbtB4RwkYQIKeKE+tKNp0K0sKP160qxBiy6+fHlSbToZOURs//Q
	I6yV1yuANeKPOGSgAruMcc6oy8whSITKPDjn3w6NdS2/8gi8O6jynJ5wiOoLr8oNbU3
	6iMdcsSCW8Bt1gfT1DVpYT4l8vTFSWgj9Dg+YA9tm5sIt07aUUgPSknzsSncnYa8NvM
	r08M5jb+8m6us79O7W5FHS1Bbb3b2eCfH6QsETKaJ67i0KGBGy/Bf0Ms+5w5koRSe67
	HP9nJev8IJCTs1ms+9H7B3frr4F41h6XWmFjUD6L+viK0zHCixLUZFcQcq+NrbCkgAe
	zSj2IytWWw==
Received: by smtp.zohomail.com with SMTPS id 1792893452059433.2882272106049;
	Sat, 24 Oct 2026 18:57:32 -0700 (PDT)
Message-ID: <cae0b78ac544dbc78242d55fe370a0eb7926825b.camel@rong.moe>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
From: Rong Zhang <i@rong.moe>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede	
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <ab1d30eca12d5e7a764da99b68d0e229@gmail.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
	 <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
	 <7b21717e80a7b779ab94d964ca40ee68@gmail.com>
	 <5bdb870be988333df200ac7d4904dd1bda6ef52f.camel@rong.moe>
	 <ab1d30eca12d5e7a764da99b68d0e229@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 09:52:27 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Dmitry,

On Sat, 2026-10-24 at 16:13 -0700, Dmitry Torokhov wrote:
> Hi Rong,
>=20
> On Sat, Oct 24, 2026 at 11:30:06PM +0800, Rong Zhang wrote:
> > However, the methodology has been changed from hardware-based to
> > software-based. Because of the fundamental change, it has the potential
> > to break something if some users depends on the side-effect of toggling
> > the aux port.
> >=20
> > While my device never needs the quirk, I can think of several useful
> > side-effects:
> >=20
> > - pause the interrupt (and hence pause event handling) to save some
> > energy
> > - prevent the touchpad from waking up the platform
> > - reset faulty touchpads
> >=20
> > By switching to the software-based methodology, all these capabilities
> > have gone. Of course, relying on these side-effects is a misuse, but
> > relying on the parameter itself without reporting it to the mailing lis=
t
> > is also a misuse! More below.
>=20
> This reminds me of https://xkcd.com/1172/ ("Workflow").
>=20
> Also note that I8042_CMD_AUX_DISABLE / I8042_CMD_AUX_ENABLE only toggles
> the AUX clock inhibit bit in the 8042 controller; it does not power down
> or reset the touchpad (psmouse is unaware that ideapad-laptop poked the
> controller behind its back, which is the whole problem), and i8042
> already manages the AUX port and wakeup state across suspend and resume.

Thanks for the detailed explanation. I agree that there should be no
outstanding spacebar-heating workflow depending on I8042_CMD_AUX_DISABLE.

>=20
> > A completely new behavior reusing an old knob is always prone to break
> > *something* in a obscure way unless users are notified about the change=
.
> > Breaking something with a visible warning [1] in kmsg is much better th=
an
> > potentially breaking something in radio silence.=20
> >=20
> > We don't want to support poking i8042 anymore, so the use of
> > 'ctrl_ps2_aux_port' is anyway becoming unsupported. The parameter was
> > introduced only for debugging and is expected to be removed at any time=
.
> > If users don't report their use of the parameter to the mailing list,
> > they are already relying on a broken setup.
> >=20
> > By renaming it and breaking the unsupported setup loudly, we encourage
> > users to report quirky devices, as well as getting rid of an outdated
> > parameter name.
> >=20
> > [1]: ideapad_laptop: unknown parameter 'ctrl_ps2_aux_port' ignored
>=20
> We already have DMI matching for this quirk (ctrl_ps2_aux_port_list[],
> which has only ever contained the 2011 IdeaPad Z570 since commit
> c69e7d843d2c added it in 2022), and the module parameter simply sets the
> exact same priv->features.ctrl_ps2_aux_port flag as the DMI table.
>=20
> Intentionally breaking the module parameter for anyone who might be
> using it for its intended purpose (making the touchpad toggle hotkey
> work on an older IdeaPad)=C2=A0
>=20

It's the flag's intended purpose, and never the module parameter's.

The module parameter's intended purpose is only for debugging and bug
reporting. And its name and description describe the intended behavior.

Renaming it does not change either of them, while reusing the knob makes
its name mismatch the intended behavior.

> just because of hypothetical spacebar-heating
> workflows does not make sense to me.

Using the parameter without reporting is also a spacebar-heating
workflow.=C2=A0That's why the description asks users to report to the pdx86
mailing list, so that we can add a new entry to the DMI quirk table. It's
similar to sysfs bind/unbind to a certain extent, which recently gained
TAINT_FORCED_BIND.

We shouldn't create a divergence between the intended behavior and the
parameter's name simply because such a workflow either.

Note that we've broken another module parameter before. See commit
cde7886b3517 ("platform/x86: ideapad-laptop: move ymc_trigger_ec from
lenovo-ymc"), which moved and renamed a parameter.

Thanks,
Rong

>=20
> Thanks.
