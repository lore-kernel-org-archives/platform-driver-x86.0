Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E219D89B
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104148; cv=none; b=BYBcCGy+FCZS4EAx+943z6wj0T7EyyTlEX3ph8HuJZ+d3rvuWn+dEMT2v+mNH09aTzOiBZWfD3bHJfG2GRBpK3p818huvPfPJQYEEYEGbXshun5ST1fmyao0z0AjJoom60xvvEG8lR6/OYz6sTYXgfxPWWPdEdoFwwQuilzYYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104148; c=relaxed/simple;
	bh=qokRPEJP9PQec7GABiKaYuvm5Au90GDWXU3eM1P/oGw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=P8sZfkXMnbqSUgTkB7/sC2kPvOrUByai+mRnyZf2q/yePfOoWdoUD7Q5kk1gKkV+dywCF2cO2DZsSTcdEgO8lKPUDj/L37D59C425nueBXFUvADazfZK7RGD4Bc7Nln+E/fJyQzh0iQGmqBtRnhPTyp2ToqD+atARIPm6eGt4BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ns7hUZ2N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UzZDQlbO; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ns7hUZ2N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UzZDQlbO"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 429FE11400F6;
	Mon, 12 May 2025 22:42:21 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Mon, 12 May 2025 22:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747104141;
	 x=1747190541; bh=P4WevnuksYfEoSYm3urIwWt/21y6uZFKLbOnG2sfaIM=; b=
	ns7hUZ2N16WWmqfzfh+oG3BsddNHFU8hzo9ik66xmKAB+nkVsjRAUWWKl6gOymtE
	y0eIeJYsqndqBUf5jY0yOcCUFqSO7QThJte8bDzKudJa8u9j9Go58YF4BHOI50/c
	tHodWA5DinUJs/loe4l4zAAYQG9ZFjCld+zvzY6OsOAAer9hb/Z44hOEsYcF63+1
	yjOf7RcDOyQl29B08+dCkr92tV0gmfSNPdbPraR6UmuHwS0tElgU0sRbzOvbr2ji
	oNO11DjfLKHeH1KyFOlycWjCsw3L8WXK0y3OOrv5p40pFt8LmAjPxzINY0/Q6GPN
	NrR48eKMuD8EJeTBE9nZZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747104141; x=
	1747190541; bh=P4WevnuksYfEoSYm3urIwWt/21y6uZFKLbOnG2sfaIM=; b=U
	zZDQlbO1tWwv8/1L+dNITg5gVe/DAx5j9NZHiCVodaBw56oBXabznQ+bBiXRdFdQ
	qC7PTDSTtqiYJMc7gzT3Xl2TYdTeCu1ZnoALb5yiyxweP2L1LoEzCx0bYKpTVp5s
	oMqHwgyRKqY9aljmd2Or1sMlKct4k+5CcjdTdo6a+pXjmheX0ZINUIZs/obL8eTo
	8SnnPH4+4HH+zj2NR6Jfuc2MONytd8SmVfvGoNUiQTP77Q43ggaMYbu0H2aMems9
	jjcersQQCmussqOxmIpKbEdwiNlyQyZp8bswUhvgcb0MbrY3YOGqVh4rbv2eP6+F
	tm3CdWAJp/w/OlCx2nwyg==
X-ME-Sender: <xms:i7EiaCSeSnmQ0sgtm26la67i2zMeUO4rgCjHCL8zAIdmZkRUPwLIqA>
    <xme:i7EiaHzJ__d3bxfiCc6MItXbM-Kbs93xWspeHG316by8YbvJxshoMkfP3bS9IxzxY
    j_ip1Lt2xQ8JtBuGII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddvleeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:i7EiaP2JnqR_bpRmLfF166rXS2Gu-zYAu14Utjh5q5QBZmri-gFPJg>
    <xmx:i7EiaOB6mWeXXWaBhkfw4L1KGSW3jDzHXuZZG5-G9UOr4Mw8a1wsdQ>
    <xmx:i7EiaLhVgsMbr-8tRPcuPiAYfC_S2IVOfjgnx47eduWNvX2Ru5SA7Q>
    <xmx:i7EiaKprCG5zysFWpJOsvt_cZa2CT3G42vK99vYijjAaknmgSMHchw>
    <xmx:jbEiaDXgV5dbuqO5WsxvcMK93HTlsiuFbRR1UWiyc9u5-IKqMf7G94B5>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C71983C0068; Mon, 12 May 2025 22:42:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T82500c9561b4d815
Date: Tue, 13 May 2025 11:41:58 +0900
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 debarbos@redhat.com
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.org
Message-Id: <7e9a1c47-5d9c-4978-af20-3949d53fb5dc@app.fastmail.com>
In-Reply-To: <846a8a5a-9032-4ce1-95c6-1b00bb4c42d6@gmx.de>
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
 <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
 <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
 <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
 <0344362d-66b0-4001-b115-65dbda31a149@app.fastmail.com>
 <446ef648-60ae-4b66-8c80-1f692b6c9df9@redhat.com>
 <42a03b2d-ee9f-422f-994b-c245891afc33@app.fastmail.com>
 <846a8a5a-9032-4ce1-95c6-1b00bb4c42d6@gmx.de>
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging states
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Armin,

On Tue, May 13, 2025, at 6:51 AM, Armin Wolf wrote:
> Am 06.05.25 um 14:54 schrieb Mark Pearson:
>
>> Hi
>>
>> On Thu, May 1, 2025, at 6:52 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 30-Apr-25 9:45 PM, Mark Pearson wrote:
>>>> Hi
>>>>
>>>> On Tue, Apr 29, 2025, at 4:12 PM, Armin Wolf wrote:
>>>>> Am 29.04.25 um 20:08 schrieb Derek Barbosa:
>>>>>
>>>>>> Of course. I will label the two scenarios as Scenario 1 & Scenario 2
>>>>>> respectively.
>>>>>>
>>>>>> Scenario 1 (below 80%):
>>>>>>
>>>>>> Battery roughly at 75%
>>>>> I see, interesting. I CCed Mark Pearson, he works with Lenovo and maybe
>>>>> has some additional
>>>>> info regarding this unknown 0x6013 event.
>>>>>
>>>> Looks like it is 'EVENT_SMART_OVERNIGHT_CHARGE_CLIP_CHANGED'. I'll need to check with the team in Japan what this actually means.
>>>  From the name it sounds like it is an event to indicate that
>>> the charge limits (start/stop thresholds) have been changed,
>>> which is exactly what happens when hitting the toggle in GNOME
>>> which triggers this.
>>>
>>> So I guess we can just ignore these events.
>>>
>> Confirmed with FW team:
>> EC will send event to BIOS when customer set or clear battery charge limit, BIOS will send this event (0x6013) to hotkey driver to tell it that the battery charge limit has been changed.
>>
>> I'll look at doing a fix for this, but it can safely be ignored in the meantime.
>>
>> Mark
>
> Can the battery charging limit be changed by the hardware itself or 
> only by the user?

Good question - I'm not sure and will have to check with the battery team. I assume only by the user but battery mgmt FW is getting more and more complicated so best to check.
>
> If only the user can change the battery charging limit then we should 
> indeed ignore this event. Do you want
> to send a patch or should i do it?
>
It was on my todo list but been a bit hectic (traveling this week). I'll get it done ASAP.

Mark
