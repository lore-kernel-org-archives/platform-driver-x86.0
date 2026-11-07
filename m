Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794052271;
	b=fUUJtDTcWobCIGhc6/WcRkKpuC38tqy5vysoUAciEIELJ8W3KRrvq/A4I+C0D41jOwqb
	 r6VXA5XLqoDOByVkBeje//oEPj/22rorQJNtNMwQut9/uLqOhtQv5PPtEl30alH2haW43
	 DZijqaiEfVPiI5tArquXHmwf+V2kiOhyomT+8LaFQMISiAqF4eSLJLP7UlT6vuQDgKRBV
	 aHMbX2p9oq4mPNs2f0Lk3U57qiDHQv5cuACagGmKOiR7C9+eclzrXjcLhKtlqAzMB0RpR
	 /JusVw0bfWp0Eti3sWThohwGSYDUrFd7BsS0NJlZS+JckfIUumaWS9+xojQ2zh5ZMjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052271;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=wzNf0R8HXIUXQSXCUaFIslGp/QSSRE/+udoUQ+hnha8=;
	b=wn99Fj04nIyPCqoUe7XaxAgFQ52LMzS92XmCmXcwZJf2t2OmQzr3fDPYisHSdvgsTApc
	 CPs/gx4hjKWZ2uxRiX6umdPG2h8iGTz68XJij/kuT/hgI2uUFCHb5Kw0qfjCIZpmySOKq
	 qHH4C3qE+/kgdHCvj/VCyMnxzgiDgsEYw4p1MAbdplmSKUdH1RAlW/vIbiiGS8b5biTZd
	 PTkQ4jvWrtcti36NaKyxxpNJ2Qk6R3N3W8I4cSQ1T82p7KMx+oa3WOy4Mo2OvLi8ZGaua
	 KyvipNwFB8uiGVmblmhfZPWh/ejFN/4o4uSFyIhUpG75cH9qLxqigzUOWQQfsfdBdLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=OOYi6dly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE5606A326;
	Sat,  7 Nov 2026 11:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=OOYi6dly
ARC-Seal: i=1; a=rsa-sha256; t=1794052249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H+ReWpPyte4kMoxb0+/aRjSN1rze2SF1Cc7BLucx24vukE482+YyXpY+fKAAjkcXTqREZHTCPB9hkTT8AXPKdPf4c3b7Ex+BqrgMcM7mBmsOWgWC7et9DA/+3KuxJbJeyyJVwrBQcDEqQhVn29qI69TT3n0qkmuQ02+B1gKANfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794052249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wzNf0R8HXIUXQSXCUaFIslGp/QSSRE/+udoUQ+hnha8=; 
	b=H4z6NR0GijQs3SUT+g2dg3conj+TrrP5ynLg/7gLhELxZi7S8t4nAhqiq+wLmt2XuI/wd3ubi7Nbu8WchgqEWUnXyOA8K1ULrtzBIpc+005gS8BgbScYZFpXayPwWbKNDje+4YjCXNZaJBEH1AHq/wHExuVG62RqGHX8EYlVjto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=OOYi6dlyAffDoVFo6f+e/4pdVxNvrMhAGQ6//axGKnVIlYc4o41qRBJLq497u6EAqmGd0croTFQ6ah0xSR+OuqQyyoruZHAY1WonBhSk4VQTEmKQoARvpdHJGKnS7fIXFsK2Wp+Lc3KE37BMv6kSCsUSQ90t0N7tuZYc8BWyWUY7+rT4Cbmj/j0Lgc+7iy9IGlx1vQh0SRGR8bGQgrsLyCRhzoiR67ZyVrjOJMl9VKhd7oOHF92FVXbDn4D7YuekgPab1iXtNGYoURr+Nh8r0vbri2R1wGx2xJMxDYhVlIhFFcc8lnrEY/+p/ktcfo555JFCNQP4n+y+l2OTst5UPw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=wzNf0R8HXIUXQSXCUaFIslGp/QSSRE/+udoUQ+hnha8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794052248313533.5836605321382;
	Sat, 7 Nov 2026 03:50:48 -0800 (PST)
Message-ID: <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
From: Rong Zhang <i@rong.moe>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
In-Reply-To: <au5nUp4extfupCpS@localhost>
References:
		 	<a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
			 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
			 <au5nUp4extfupCpS@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 19:45:12 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Josh,

On Fri, 2026-11-06 at 15:48 -0800, Josh Triplett wrote:
> On Sat, Nov 07, 2026 at 04:48:44AM +0800, Rong Zhang wrote:
> > The term "unsafe LED" exists because LEDs are write-only for software a=
nd
> > fire-and-forget for the EC. By taking the control of an unsafe LED, e.g=
.,
> > attaching an LED trigger, any warning signal from the EC can no longer =
be
> > displayed by the LED.
> >=20
> > When it comes to battery LEDs, they are definitely unsafe to override.
> > After all, batteries are dangerous things when they malfuction. Thus, I
> > don't think it's suitable to enable it for all users.
>=20
> Choosing to not report "charging" vs "full" vs "not charging" via LEDs
> (as opposed to on-screen indicators) is not in itself dangerous. If the
> EC has something like "battery is damaged/overheating/exploding" to
> report, it had better do that by some more effective means than blinking
> an LED, or the message is going to be lost.

This is not in contradiction to the fact that blinking an LED is crucial.

When the EC "does that by some more effective means", it will have to
rely on the OS to ensure that the message is delivered. It's both
effective and ineffective.

>=20
> I can't comment on what *every* ThinkPad EC would do, but at least on
> this X1 Carbon Gen 11,=C2=A0
>=20

That's the whole issue. The patch unlocks charging LEDs on all models,
while your ThinkPad can't speak on behalf of other models.

> based on some (LLM-assisted, but all of this mail
> is 100% human-written) disassembly of both the ACPI tables and the EC
> firmware (EC version 1.22 specifically), the EC does not appear to
> report any battery states via the battery LEDs other than:
> - AC not present (LEDs off)
> - AC present and battery <90% (LEDs yellow)
> - AC present and battery >90% (LEDs white).
>=20
> Critical battery diagnostics can get reported through ACPI, and if the
> firmware reports one of those, it appears to lead to tpacpi reporting
> "THERMAL EMERGENCY" and sending a userspace netlink message. (As an
> aside, AFAICT a system running upower and GNOME doesn't display that,
> unlike low-battery warnings. It really should, in a hard-to-ignore way.)

That's why relying on the OS to deliver the "effective means" can be
ineffective.

>=20
> Some other models (e.g. the X1 Carbon Gen 12) can emit other kinds of
> diagnostics via LED blink codes (
> https://download.lenovo.com/manual/x1_carbon_g12/user_guide/en/help_troub=
leshoot_or_diagnose_problems.html#t3
> ). But those primarily appear to represent pre-boot failure states where =
you
> won't get to an OS, anyway.

Again, "some other models" can't speak on behalf of all models.

>=20
> > Since not providing them via the LED core does not really prevents user=
s
> > to control them, I am also thinking about adding a debugfs attribute th=
at
> > unlocks unsafe LEDs and taints the kernel.
>=20
> I'd really love to not have a tainted kernel
>=20

A tainted kernel isn't something really bad. It just provides a signal to
the (upstream and distribution) maintainers that something outstanding
has occurred.

OTOH, CONFIG_THINKPAD_ACPI_UNSAFE_LEDS should taint the kernel on the
very beginning.

>  just because I'd like to
> not have a bright LED in my hotel room when I'm trying to sleep.

That's why I proposed the debugfs approach. At the cost of tainting the
kernel, it can hopefully enter all major distributions, making it widely
available. Users with some sensible reasons (like yours) will be able to
unlock any LED without rebuilding the kernel on their own.

Thanks,
Rong

>=20
> - Josh
