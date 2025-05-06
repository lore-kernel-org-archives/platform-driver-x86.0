Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901178F5E
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536095; cv=none; b=NzujxQL8cuWFNKi4briO2GlfD54sbb1TBpMggngQXZB/mf/cddlsVr0RSL9Eu+vPMoEA9zCyTl+56aQbXKGcw7+mHqZT80Oy+gTxOobI/cPv0pjz2pHVVUOT41dEOpu3z2pQO47Die42r3Y1RItkM/9RwtLH+eLIJM5w9+44GlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536095; c=relaxed/simple;
	bh=kNqwpH9XIXSH09gCT0IBEaxg8YR6ixjb4pIqu1u8GKs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=E0HfBbszKTy7AsmvZy3RanvOpUVCHGVtKG8RsFZRojGuYFQaIm63e/iTTaAa8H/H+h7X7dmr/qNa0RPfq+n2a3fuHm59YpR1URMoc+xWJnFeUbKWHhg0T3ndec45Q3sULx1IvY07mtunxxaX6WzjekHKXzzxtWJNIE0U1Aqi+bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=t9INnkcI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hM0uou46; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="t9INnkcI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hM0uou46"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2114D25401F9;
	Tue,  6 May 2025 08:54:51 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Tue, 06 May 2025 08:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746536090;
	 x=1746622490; bh=gwt1Zxs9OoMssYsKs23HxjRJKclOrWACfGWXHk1RUSc=; b=
	t9INnkcIwlFecf8A+PTMUNBDG5vP86MpY/BvRncnmv6XVRdKPet8G7iho0225tqd
	J6SYxIfahVCuZiMFg9k2Y6Va0aHO0hk2L9f4in7rSM7Yy/6uC3y6JlMVouNhmamo
	Jgf+VFIwcRdDyeWEhyk7AWfF9AiJ0KMVsDejQsky5k+DQIC3qGIO9UI4gGGCu8gr
	S9j6shirnWzBoa7aVs/8h/wi+gmWX5IHVunl8JiLJNzyo89DjKTP4W+r9rA01kq3
	jST3GqjwkmGqxUItG4Nind2ORwYWeyyvDdIg00Gbuc/eU+V2vaTJRjyZdpqTWGaz
	RJDdcV3CW0aY3P919DYfrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746536090; x=
	1746622490; bh=gwt1Zxs9OoMssYsKs23HxjRJKclOrWACfGWXHk1RUSc=; b=h
	M0uou46a/3lh6DpMhELg400n0KoBeyqf2vpnKULIgT6t3J5dYbJIyWIb9c1w73vu
	D6qAbXTkWRTgcxzV2OGeTEwHYWLXtuVLknYVM+8wjF7bvWkxLBRcNjEQEnV3IoTC
	hZB/Ihb4mdWk4E76VV1UWGv+r5M2ks+xgpIOIurtRpT42FbNgfdlhzjv8D0oHDoz
	ECLDuaE94PGQUGOfOBxw5CKTpBMc33Be0OH6nx57gtIqCSf8CiQUKMP/ssZiPlp4
	iTrJnm2TI9zjmyPjiO1FrQHc6gTF3Z4aDttJqFGYIJ0MqNblHkkRx6mRjARlVbTI
	12d6sAJdXnVkwfM/+ZJCg==
X-ME-Sender: <xms:mgYaaAupBEw6_81Gl6Pg9C8ERT1LANe5ldxS-aJU35QWd4MMagY6AA>
    <xme:mgYaaNf39TUCwFPlREQ35l5SocrAFfD1SDFSgrfl0C9WlnpItObyYq4swqhTChQR7
    u1Bk-ZOHZO7UlTRzgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeeh
    tdehtdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehhmhhh
    sehhmhhhrdgvnhhgrdgsrhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlih
    hnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepuggvsggrrhgsohhssehrvgguhhgr
    thdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhorhhg
X-ME-Proxy: <xmx:mgYaaLwI-tlcKeC-tVZyw_-luyAAsgisDjfFFV1So19XZAUHfEidHA>
    <xmx:mgYaaDMMgs3XRMB-JPsOzKkiQABeGprEatHM1fbZJTdxzdNL9lEIeA>
    <xmx:mgYaaA_InAxXZUIcROgaLWPNVPJUQITDtYRn05OP_X8lcLP9e_Okpw>
    <xmx:mgYaaLVEOSvLpINTkJ6bg3OYrclGSOy-5NULLWFzxFkuGWxruZAm8A>
    <xmx:mgYaaGw1tovmkwj9rqhKYUUn807x9-xPFb5mk7aOXgO6iM1aq9uzkvKc>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0FD8B3C0068; Tue,  6 May 2025 08:54:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T82500c9561b4d815
Date: Tue, 06 May 2025 08:54:18 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>, "Armin Wolf" <W_Armin@gmx.de>,
 debarbos@redhat.com
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.org
Message-Id: <42a03b2d-ee9f-422f-994b-c245891afc33@app.fastmail.com>
In-Reply-To: <446ef648-60ae-4b66-8c80-1f692b6c9df9@redhat.com>
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
 <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
 <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
 <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
 <0344362d-66b0-4001-b115-65dbda31a149@app.fastmail.com>
 <446ef648-60ae-4b66-8c80-1f692b6c9df9@redhat.com>
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging states
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Thu, May 1, 2025, at 6:52 AM, Hans de Goede wrote:
> Hi,
>
> On 30-Apr-25 9:45 PM, Mark Pearson wrote:
>> Hi
>> 
>> On Tue, Apr 29, 2025, at 4:12 PM, Armin Wolf wrote:
>>> Am 29.04.25 um 20:08 schrieb Derek Barbosa:
>>>
>>>> Of course. I will label the two scenarios as Scenario 1 & Scenario 2
>>>> respectively.
>>>>
>>>> Scenario 1 (below 80%):
>>>>
>>>> Battery roughly at 75%
>>>
>>> I see, interesting. I CCed Mark Pearson, he works with Lenovo and maybe 
>>> has some additional
>>> info regarding this unknown 0x6013 event.
>>>
>> 
>> Looks like it is 'EVENT_SMART_OVERNIGHT_CHARGE_CLIP_CHANGED'. I'll need to check with the team in Japan what this actually means.
>
> From the name it sounds like it is an event to indicate that
> the charge limits (start/stop thresholds) have been changed,
> which is exactly what happens when hitting the toggle in GNOME
> which triggers this.
>
> So I guess we can just ignore these events.
>
Confirmed with FW team:
EC will send event to BIOS when customer set or clear battery charge limit, BIOS will send this event (0x6013) to hotkey driver to tell it that the battery charge limit has been changed.

I'll look at doing a fix for this, but it can safely be ignored in the meantime.

Mark
