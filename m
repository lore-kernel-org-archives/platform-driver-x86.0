Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70E4C8E
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042348; cv=none; b=sclteq7iuFca/BrwhCP1OuL1l6Ip5Q89sffyPA+FsH7bdAtiuPQr6TWk+kUssdaM0E2icskPi5HaPQ3zXJxXPbg8NWdvmnzpiCQUDGZw+LHMjgDvJ5k59pGzGf5qXvU+YMEXubE2qy3FPrCs5lbW9eVPw9ZmK1qipJYi9ROn07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042348; c=relaxed/simple;
	bh=hveVJ52GhSz5APaPE9E0An4NWJnbVYsuketVG4cbQMg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uq1+eluJftK9R5Z/FHCC0E+l5/JhbY8Kr5V82MctX/pihZJe0yTO76LBrMpHTj6DuRvlM0VtRTsjDBcekS+hN1ZzIf2cZ5pmAXjNlbBTBjch8ZZHVuxiZ0lNuFQQNA2FbbK+ab2IVn96mAyTNMvQYXwGt9sy/TFbIwhKVkjfdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=hsrqrpbt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Os18IlEC; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="hsrqrpbt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Os18IlEC"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D43711140267;
	Wed, 30 Apr 2025 15:45:43 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Wed, 30 Apr 2025 15:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746042343;
	 x=1746128743; bh=8mPLpqSmxmKWfwCeDR+2xH6dEFIQatWnt6A9nBRwfRU=; b=
	hsrqrpbtv1Cl+WIieCAZo3seASiQilsvSLyF50px/iYhiBUlHi7owyHVe8WgcXeG
	NpiUXwoJkCB12kzyL5FH31nw5qS2i0U06L4crgWCVBH7Gb6D652KEqdwkMn5xV0D
	OyxQ2j3KIO+0Z/jy+hOusiU36o98m8fjgAqmTvSFJXaYidyyha/d/hLjGlndIplp
	8QmQrI/pPMnbmLl7gYqgxiekI4gBvRJOvmZqg7X0DLc619UdeXJNRDX30DxV7mss
	ldhZHy2LYj7/afDCrXa03Q8xruKGGc4/xW5jQb0pv7cU6fSorGbegfcq2z58XI26
	KO7WsRcU9h3hhbQfvhGdGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746042343; x=
	1746128743; bh=8mPLpqSmxmKWfwCeDR+2xH6dEFIQatWnt6A9nBRwfRU=; b=O
	s18IlECwMZRlhusaSycnPU7mR29vC7ReABxZoCb6VD/QY6M+voHi64B0yshETjd4
	Wj4pGgNSIDscaKBfMjBUEQtpm19NZdYKr1LiuuZOnpnhe6vy9Gt/YGFsVVKYnzFU
	ZqWISUPs4chAOOMWBi9FRN2KllEdLUrPleQ6M5fAbF13+kV80Z8Fp9XcTLVTfsNe
	Dl16wBiZTHe3HELqI+9oN6Ns3N9SeT56AftySG26SIw5brRmP0BGqC+UIP4qKhjy
	pYNtwnhgBDS9wrg1FCHaTtZBJTzbLZXBTjXs18OxihtAU3pEmpalEgxtd7+KKhZY
	kW7T7BWVCbZAzVze9lj6w==
X-ME-Sender: <xms:5n0SaCFIurvTPsyxtdq-fZzbnto9_ZFjSU01I6VABPnFnl_ZMaBxMg>
    <xme:5n0SaDV4gK_QYgSIsLw8zznFwo9gx0j23jz90tHD6ScEl4nMabAj66rMx7QoI5RGk
    bkoVdQBjnA-NlDEIaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejheejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:5n0SaMIk7-MZTKf_e2yXXGFVVCACQ85xBe6i-b2X1BtmejRhSx8pMg>
    <xmx:5n0SaMFelEuIdg8ntXAEWRyqvnwXC_Zzyad7pLSJ7entdxEbQWNU7Q>
    <xmx:5n0SaIWCfW_vAW5nSOFPewsA5RVB3H8FMVaalMoKQI5G2Oame6sDzA>
    <xmx:5n0SaPOsNmXDAjQLDEjXOl7lkIfk9lC_mVw1TB-15_6AqCHjH5XM-Q>
    <xmx:530SaKKuQBds0RsRFyTQGa4z1a7BxomE35ERfyqlPkMWTJFkDwMSmrXs>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A569E3C0068; Wed, 30 Apr 2025 15:45:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T82500c9561b4d815
Date: Wed, 30 Apr 2025 15:45:22 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>, debarbos@redhat.com
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.org
Message-Id: <0344362d-66b0-4001-b115-65dbda31a149@app.fastmail.com>
In-Reply-To: <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
 <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
 <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
 <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging states
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Tue, Apr 29, 2025, at 4:12 PM, Armin Wolf wrote:
> Am 29.04.25 um 20:08 schrieb Derek Barbosa:
>
>> Of course. I will label the two scenarios as Scenario 1 & Scenario 2
>> respectively.
>>
>> Scenario 1 (below 80%):
>>
>> Battery roughly at 75%
>
> I see, interesting. I CCed Mark Pearson, he works with Lenovo and maybe 
> has some additional
> info regarding this unknown 0x6013 event.
>

Looks like it is 'EVENT_SMART_OVERNIGHT_CHARGE_CLIP_CHANGED'. I'll need to check with the team in Japan what this actually means.
It's golden week this week, so Japan is off - will update when I hear back from them.

Do you see the event continuously or just when changing the setting (I don't have this platform on hand to test myself)

Mark

PS - switched to my more open-source friendly mpearson-lenovo,squebb,ca email address. The Lenovo one is not very good....
