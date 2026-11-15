Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779327;
	b=Ij6wn0ngNYclkQyGbUVL2A7pqkawNdumFeki/78IhchKH4dNBXiIgN8Fbr4R+QkBDxKm
	 aiWea0Gq0WBcgDIwUe4XjvO6hgzzwVJNu39pCtV4o47nxksyJdH7RPbMuulpvv8fYBDCT
	 MOaA8DOhQQq2hIPptbC+LzJAqXaqH/8E5MOXWLH4XBxog+ELm1ODHReM7oWrFbN8CmdW/
	 fGCV4genIgtuQ3pJ64dMCiAZgAUjBorRUEcgXWGfdniUjg/dTOPHOojg8HdF3pbZqPJN4
	 pZAsda39Ztozq/qFMZQFlTEmF11qgAkilLkYT6b8mgWSQXLNQWCP9nNK/ab0/HI8B5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779327;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=lH0v+4LaMeUQXMee1pWPRIdtW92vCUvwQOMNRPhTm1M=;
	b=UvceJ/LoXLFVLt0IT66iMF8sVrmmdLqVhlYgF9lne+AL0zYggDPheVmnbnGanPW/Rt1v
	 8wc62alv3mN2v5ZBt9kiZlJa8wMxW88TC6v8kIu5Ke6Ra3j2XYzqoLm0zB5Fvd+G7KEq1
	 0msUhfYCddU9tsGXsh5gV0XB4IJFoqSvUye4jxIen5ZlJgygjMRFTx/9GRmMvX7wybulw
	 QWOsplWpHBE5MWa1ZryEd2bGZPaiuGomiAkS4ivwWBqvCRNa/NIkZyofgcPeDNztvN1Tl
	 LafjdKVykHnei17oENfdmfYpbN1zMvnCE8sc3UYMJC9w7TlvM3GVcosIBZFWHy3Jelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=D8iUc99w;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="J1fPd/ZS";
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FCF606A31F
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 21:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FCF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=D8iUc99w;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=J1fPd/ZS
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E5AEB7A0100
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 16:48:45 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 16:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794779325;
	 x=1794865725; bh=lH0v+4LaMeUQXMee1pWPRIdtW92vCUvwQOMNRPhTm1M=; b=
	D8iUc99wrKmNYm1S0lqN5bM1JKuuA7jRqNHHaeWGAhAu5/7ctYT512U7KN1xR+ue
	hqDOuMnPOEEXivns7sQHUsoVyu3G0aVjqTUiLLZThVBOPK1iXS8VSHbxZT7CaNoT
	6CwprmAjh+AMzfrkkv8VDOORi+QtMG6pFku1geFVwfYYPaTrvi8ujv5L+C3guDFd
	QkBagaWsBQ3pTreJdKca+55l4tL8JMiFD42bkD4ZANb3FWKMXnT6mzzbHw2wOieu
	mZNKlNgoKNczKc05vtzKa9gmMfpdLryjavuCuA+wjnH56aVR+8C9BpMLUJ9L6cOZ
	0qcJiA4eKYJqI1a21VR05Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794779325; x=
	1794865725; bh=lH0v+4LaMeUQXMee1pWPRIdtW92vCUvwQOMNRPhTm1M=; b=J
	1fPd/ZSDdHcgF7Jw8VI4ZZzFD1jE72yY7hthKg9RYkcP9zpiHra3iZElbqbnz8O3
	CE07Csm/V+NEygBx6oYpzqq7WOFRE57AY2A0ufIgPsWdbf5yinR2EnxOILJ3k7to
	bVdo9rKKEYyMJTiu9SBcU130NNG7fDJijEm8Fd0ghOHwT3fgN/90T+XR9A1Pnx2o
	hvrqQxswfxUG2/S8fzrCOYa1ewKjGhllq0u6Apc7GcQv/hmgY5C6uKbY+r4jn0v8
	SfZ/Te2aQFkS8Eu6n7sr8FdcYUiQyrg+ro+l2OiWjPLIiAvfh58lZdY2YHHED8eO
	4/kZCgx4ENnM3DtmLEJHA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794779325; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:cuawBS7SBwadDPMSnrCU3ARjhWmSsQIcMoSB8htOoZWnWcp
	4/BcMWvf4DQRr8EkaKOLP9hOscHJaZZw19BWPrGsGtwTXe+7baKSkgY6x+2buqVx
	IRQRDCMkqCT2E6cVoGOQXCaaW9Pq98Qo9yco44HG3Eb+ZuEkDj7inUwvC3G1cSe4
	QQOtYd8YkoOMKl6FetuxWiW1oWwD7YYLdfNzbsuE9ob+/uhL5ngu18ZsXq8XsPzY
	j4vSYPigBNcyDQI3wBrEUMawfoPaUN1ulgYoymOuFJUcbDcJnEiE3xp1yVOiNLD8
	cZbJcRJ8H582n2oU5kXWcAWJrYEEENZVFdpSOAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BtMXPaKdqYp5zbnPJ9u1IK1E4p4HJHTeU/mqJ8hkpDs=:nmiaNohX2pVWnzgiE6EE3nYzliJBfuGxk0RFDjdL2yc=;
X-ME-Sender: <xms:vCj6aic7u5yBdlS_IIHBHSejiK3i_11RXsIfnHxaZp4AToojGG16kw>
    <xme:vCj6anANYCgqdcrOOT1K5pvhu4RbZ7Qvc_muVBztEAWbqIAP3jaEZAbQVLq9846Fj
    v_IoacdMznITWNKfsJ9iiW-L9QMCF7X50TlzFvwUGvPZ9X52s7N_1U>
X-ME-Proxy-Cause: dmFkZTGXtmrORE9KLlFe3AQ4Z003yUeqKaNvRsjzuCX86JXLPrYrFcGMMS4w0Eo2BCqe4f
    wPtZBTtm0Jvc90XrSv9PztNDF99gH7AXNWxy8FxGeUaKtFMyD7KkoHs62JRvQNfrQaIoXX
    nTcq6w5oL+czpzGFPMKuAVhsNg5Q5bXkGFTkUb4vGRtGwvxWYslWkI8S2cfSg0CPxnX42j
    yvThAfse+iSfDgILY4QeSSAkJ4AviDcAn368FPJqCotfr+IZami5bRBlT6y4kFHhQzWDc8
    GIUPOXUEK0qI66SjJ1ta1rLt8e8+rfV3VOttLtcCka/X37stwp1+uDicSbthLEUItjmkFE
    0PUWBwabXNMHilNqDdRZeeC3oujrNpAOCmH5v1AU+Ajx7IpnmHNkSQgGM1TqefbLl5zVgg
    ehlIW6g4qbY7Fgt12wwuHnMfZ7kWf/qy80c/8seJm7RmojjWX4VYokYDrSoGAD/xghSInn
    rSQd+wk/meBTo9G7+Mw8od8YX83wc0RmMPWJb3GT0ma/h/4LidK7+trjljLW6xTnRlg+yb
    6Sdegl3LnSs2JzRH/Fzd4F6R1l3zzfjfK2yH8e60bKfHFE1PawdG02obOPgSWcnU955QZQ
    YQ4cmdJH88NMRlTVHQTJDFjSf3y4JnCzkZEfccFHnNoAAOz595DTXkcPo+FA
X-ME-Proxy: <xmx:vCj6atAV4fblTlPmJnCtycNkIJmuz-vWe2WGQuSsvr9vK-QFImO-4w>
    <xmx:vSj6ajs6oZVGZxrXuksx-0HBDxSu2sPRnHfSnIswtwTVisYr4Sljjw>
    <xmx:vSj6akKP1fH24Eu6LXPwuKY9j0G4erUIWxOhV3vEPrgwVwd8H_oW0A>
    <xmx:vSj6aibR84Wn7ElN3LE_OGbnMTN3PUNCwJAYBSxkBwk-xCXHfD-FhA>
    <xmx:vSj6an2MuYhaaut0SlQkeiDqRYubT1CmvnOKi-3r7OKtIsM3_mfKDamV>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A9A9F2C00085; Sun, 15 Nov 2026 16:48:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Ax2mwFUBx_DR
Date: Sun, 15 Nov 2026 16:48:24 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hansg@kernel.org>, "David Cemin" <dcemin@nvidia.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Jackie Dong" <xy-jackie@139.com>, "Ike Panhc" <ikepanhc@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
Message-Id: <d04c767e-647c-4afb-bdd1-3d6fed5ed505@app.fastmail.com>
In-Reply-To: <206de2d5-ef5a-4490-b6b7-c0e98893ec5b@kernel.org>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
 <8aa1533d-8f9c-4c69-aa34-266ea3beb54e@kernel.org>
 <206de2d5-ef5a-4490-b6b7-c0e98893ec5b@kernel.org>
Subject: Re: [RFC PATCH 0/3] platform: lenovo: architecture independent home for the
 Lenovo WMI drivers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 15, 2026, at 3:12 PM, Hans de Goede wrote:
> p.s.
>
> On 15-Nov-26 21:10, Hans de Goede wrote:
>> On 15-Nov-26 16:33, Hans de Goede wrote:
>> 
>> <snip>
>> 
>>>>   b. Should the Fn key event handling stay a separate small driver, or
>>>>      be factored out of ideapad-laptop so x86 and arm64 share one path?
>>>>      ideapad-laptop handles the event only when its VPC platform driver
>>>>      is bound, and the arm64 machines expose none of the VPC interface
>>>>      it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
>>>>      it the single driver means gating most of its probe. Two smaller
>>>>      options: lift ideapad-laptop's own Fn key wmi_driver and keymap
>>>>      into this file and let ideapad-laptop register for the events it
>>>>      still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
>>>>      shape where a companion WMI module exports the event to a
>>>>      subsystem driver. The keymap in patch 2 duplicates entries of
>>>>      ideapad-laptop's table on purpose until that is decided.
>>>
>>> IIRC the ideapad-laptop driver is a bit of a mess atm, so factoring
>>> a common handling for the the Fn key events out of this and sharing
>>> that sounds like a nice cleanup.
>>>
>>> I see that patch 2/3 uses the new wmi-driver/-bus infra which is
>>> nice and clean.
>>>
>>> So maybe just keep your existing stand-alone driver for both x86_64 +
>>> arm64 and drop the WMI event handling from ideapad-laptop.
>>>
>>> I guess this may hit some problems where WMI event handlig is used
>>> in ideapad-laptops integrating with some VPC functionality.
>>>
>>> For that purpose I think that the new
>>> drivers/platform/lenovo/wmi-hotkeys.c could maybe expose some
>>> notifier and call that for events it does not handle itself
>>> and then ideapad-laptop can depend on some function to register
>>> a listener on that notifier (1) and register a notifier handler
>>> staying out of WMI handling itself.
>>>
>>> No idea if this is feasible / how clean the end result will be,
>>> just brainstorming and saying yes to doing some refactoring of
>>> the somewhat messy ideapad-laptop code.
>>>
>>> Note that https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
>>> has some mappings for "Ideapad extra buttons" input devices
>>> (+ DMI match), so if any of the buttons remapped there end up
>>> under the new WMI driver then that should probably give its
>>> input device the same name, to make sure those mappings still
>>> apply.
>> 
>> Also see this just posted ideapad-laptop series which does
>> something similar for handling YMC events:
>> 
>> https://lore.kernel.org/platform-driver-x86/20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe/
>
> I see that this routes everything through a new lenovo wmi-events
> helper which uses a single notifier to which interested parties
> like ideapad-laptop can subscribe. I think this models could
> be extended to also handle the hotkeys, assuming all the base
> bits are moved into the new drivers/platform/lenovo/ dir.
>
This all sounds good to me. I would quite like to break thinkpad_apci up a bit ultimately too....just tough finding the time.

The think-lmi driver should likely move here (and a newer version tlmi-* that I should be posting for review next week, fingers crossed).

Mark

