Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFA033D4E1;
	Mon, 23 Feb 2026 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870803; cv=none; b=t6pXPgbhX2hLwhYQnRTZb/lvPmFAEktUAWzPsXN5eKLot3kvQveg0dOl6jQxdsPS7Bp7Hq/lx9HSmpLBWQIXDGnVd5kC6pQKIbUYVKIUx1LQJTY7sppf0sKlu1b4+jQhmAY95QYI4RxoeUjkyDoH6jVNRJeIeuxJ0bm1r34UKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870803; c=relaxed/simple;
	bh=CzAKtTgCN63t8um2DE8GpLdhtb1O2+Q1Tc9gWtz0OgA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rXjBxMiJ7F4TDlkJUgIg7LudF3lkXiPYxnQjiw9EXTguiOo2wQlHsxM6gIGdjH/p+2Jzy2ZILF8/2E9WgEYHX/9qzyovixm/HeHalwIZ1/tmzyz4hB8NvxEmRI1v5M4Ty7NP0uEx1uPG4nFbPOopSC1XvDP3BgKedUlB5pWU04I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=sXkkILQE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HcXDV5SF; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="sXkkILQE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HcXDV5SF"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 67A9DEC056D;
	Mon, 23 Feb 2026 13:19:57 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 23 Feb 2026 13:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1771870797;
	 x=1771957197; bh=jYqYtWqmJgsoz4LZH+OHiZY6YJjCgka+8n42kN7X9kM=; b=
	sXkkILQEt69NB62IeJ4rnThWA0b3Ckm9AaGl7aQneuMC++wcZTL2VN6pZTMso9az
	9QmBYL7HPYPE8BYHi3yaOn1C3+Zv4DjyiZ8tDldO/4s1NpW5NpjUVH1PGgi/ssc8
	1yyRuUmcDnCeA3Bd5vAIrBklTQ/i+geEiuZRYuVje/fh9qjciUSb46kv0XDn4ELV
	V51Bnaoq9letd/oImGVyEFw0TGOV/YKPwUTxddeY7F+YB6wJAWQFgFFPjl2yw6Y/
	+L8cFxfVFbc8UootyZ16kAYIM4xZ8yUt83+ibeVllVYOA6wzRhz/42BrNluj1+wC
	9mdULnaLll8BKWAsTdy5ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771870797; x=
	1771957197; bh=jYqYtWqmJgsoz4LZH+OHiZY6YJjCgka+8n42kN7X9kM=; b=H
	cXDV5SF8uggUc9eDjGItEhHkWL9jytzGs1KkDVuQHknuWukuIjdPz2AZgt5LukRN
	HRuIZbv6Nem8IZAZKV7SAppInZ1jmsMO3KMteDOIvyUOzC62RGnjDABulL9vTLZD
	IXqaphRyBM8RCTX+vdbstlp23Pb6X6hnKXFQWJBmAWlmoFOorSR6pE1WdD1wVzH4
	QvyI2EfQeBelzzvCO0f9+GjgW3uMZCE3csCK8rDApqeOIZF5mf2rg1Uk7iGI8MO6
	nUfdLEY1fZXXJOL2S2UnvCdeZU3x72TvMHe8Bq2KGaeHI7CRnpamoIpvEBgVH3j+
	nXhLr0wjVUsMwBxk8bTIA==
X-ME-Sender: <xms:TJqcaQWY_XL7lcEepTcXGIY7MrwIUQNKlCCp8iWHrM1R_Gl-_7FuzQ>
    <xme:TJqcafYLuSIjg-oD2tRF85AlI1NyfY4KAT3K_ysurNaNh1OsNSD-3hQE41VS5gKAe
    fzBWOByWA0abcBee0RMpWSYIt9uK1EcGIs6a6QW0LO60bRXfrltjg1Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedtffevgfethfevteduvdefleevkedtuddvlefghefg
    ieekffejteejveffkedthfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepuddtpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepvhhishhhnhhuohgtvhesghhmrghilhdrtghomhdprh
    gtphhtthhopehhmhhhsehhmhhhrdgvnhhgrdgsrhdprhgtphhtthhopehhrghnshhgsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehvshgrnhhkrghrsehlvghnohhvohdrtghomh
    dprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgt
    ohhmpdhrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurh
    gtvghfohhrghgvrdhnvghtpdhrtghpthhtohepihesrhhonhhgrdhmohgvpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TJqcaX4dz4nXP0yaNs3VaqLYfqQA9TamQq1cIVtZ2hn8BR43vU8ZyQ>
    <xmx:TZqcaYyVuyz5YFVBZDIDgsp5KR5fMXIEdI0CkOKrpvWBbDuNGeGFow>
    <xmx:TZqcabePFak2QUiIVrHkQJPSleCkocorkgcsp9YNXJ3Hxyv7kijqUg>
    <xmx:TZqcadAFMkk45Xwf6TnNjxZoTprKCDj-ESaz68x0yLkUZqczH181eQ>
    <xmx:TZqcaVMacm8sXxC1qu2AGEbUSInGROE73ivLfhBtcrM23JvizfCKwf2i>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D81E62CE0072; Mon, 23 Feb 2026 13:19:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASaOPSC57OEF
Date: Mon, 23 Feb 2026 13:19:36 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Hans de Goede" <hansg@kernel.org>,
 "Vishnu Sankar" <vishnuocv@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Vishnu Sankar" <vsankar@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <4f6cac56-7176-4a77-859b-45ce0178c7ca@app.fastmail.com>
In-Reply-To: <f54339a7-5410-41f9-9e82-c7732a568b80@app.fastmail.com>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
 <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
 <69b9a9df97f4d10e2d11d6b0eb81bbf41fb4cbde.camel@rong.moe>
 <1acdc04a-e692-4ea6-8580-13f0b6d24f44@app.fastmail.com>
 <79e768d8-5c09-4d77-8172-3f43fe5ba0fa@kernel.org>
 <a539da08664a2903420538b75de8dd512344a3ad.camel@rong.moe>
 <f54339a7-5410-41f9-9e82-c7732a568b80@app.fastmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support with dynamic
 max_brightness
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, Feb 10, 2026, at 4:17 PM, Mark Pearson wrote:
> On Tue, Feb 10, 2026, at 11:11 AM, Rong Zhang wrote:
>> Hi all,
>>
>> Thanks for your insight.
>>
>> On Tue, 2026-02-10 at 11:31 +0100, Hans de Goede wrote:
>>> Hi all,
>>> 
>>> On 9-Feb-26 19:44, Mark Pearson wrote:
>>> 
>>> ...
>>> 
>>> > Yeah - that's fair. You're right - we shouldn't change the brightness field.
>>> > 
>>> > So, how about adding two sysfs nodes to the LED class?
>>> >  - auto_brightness_capable - indicates the LED brightness can go into an auto control mode
>>> 
>>> There is no need for this, the mere presence of
>>> the "auto_brightness_enabled" sysfs attribute (which can
>>> be in a sysfs-attr-group with an is_visible callback)
>>> is enough to indicate that the backlight is auto
>>> brightness capable.
>
> Good point - agreed
>
>>> 
>>> >  - auto_brightness_enabled - indicates if the LED is in the auto_brightness controlled state or not.
>>> 
>>> This is for auto-brightness based on an ambient light sensor
>>> (ALS), right ?
>>> 
>>> My vote would go to use "als_enabled", just like is already done in:
>>> 
>>> Documentation/ABI/testing/sysfs-platform-dell-laptop
>>
>
> I didn't realise it had been done before (2014 too!)
>
>> In my previous reply I said 'if my proposal is rejected we will have to
>> continue on "als_enabled"'. But after some consideration, I have a
>> major concern about its naming: extensibility.
>>
>> More and more devices already come with a human presence detection
>> sensor (HPD). Suppose that a future device implements auto-brightness
>> based on its HPD, the name will be irrelevant and we must introduce
>> "hpd_enabled" then. Userspace programs must be rewritten to handle
>> both.
>>
>> Mark, do you think such devices may appear in the foreseeable future?
>>
>
> Not on my radar....but I also don't have a crystal ball.
>
>> Another concern of mine on the approach is that it may lead to chaos if
>> a future device implements auto-brightness based on multiple sensors.
>> In this case a well-defined interface should have an aggregated
>> attribute^ simply representing whether auto-brightness is on or off.
>>
>> For this reason, a sensor-neutral name will be better if we should
>> stick with the device attribute approach.
>>
>
> I'm with Hans that if it's been done before then consistency would be 
> nice.
> But then again the Dell implementation is Dell specific and we're 
> trying to do something a bit more generic so I don't feel strongly 
> about it
>
> What about "auto_enabled" and the value can be "off" or "als" for now, 
> and if some other mechanism is added in the future it is extensible to 
> other control mechanisms (and they could be multiple - e.g. "als,hpd"). 
> I'm worried we're over-thinking it though.
>
>> ^: A private hw control trigger is like an aggregated attribute while
>> it can provide trigger attributes for fine-grained control.
>>
>>> adding new sysfs attributes to a LED class device although
>>> possible is a bit frowned upon though.
>>
>> Yeah, That's one of the reasons why I made that proposal.
>>
>>> In that sense using a trigger is better because it more
>>> closely matches how the LED class API is supposed to be
>>> used would maybe be better.
>>> 
>>> So I've gone and re-read Rong's trigger proposal:
>>> 
>>> https://lore.kernel.org/all/a90584179f4c90cd58c03051280a6dda63f6cc1d.camel@rong.moe/
>>> 
>>> Rong, previously you also went a bit further with implementing this
>>> already which you described here:
>>> 
>>> https://lore.kernel.org/all/8a132e7473655ca0119af10339c63beb4df7c201.camel@rong.moe/
>>> 
>>> One of the problems you encountered there is what to do if
>>> the user actually set a trigger themselves and the EC moves
>>> between fixed-brightness-value <-> ALS .
>>> 
>>> My first idea was to just always override the trigger with
>>> the special ALS trigger or none.
>>
>> My PoC does the opposite, see my explanation below.
>>
>>> But thinking more about this this is wrong. E.g. there
>>> are triggers which turn the backlight on when user input
>>> is detected and then off after a while, which would be
>>> a perfect reasonable thing to use together with a kbd-backlight.
>>
>> Yes, that's why my PoC intentionally does nothing when an other trigger
>> is active, effectively allowing the active trigger to override the ALS
>> trigger. See led_trigger_do_hw_control_transition().
>>
>>> Thinking more about this triggers are typically for deciding
>>> when to turn the LED on/off not for controlling brightness
>>
>> The trigger "pattern" can control LED's brightness.
>>
>>> many of them actually allow still writing the brightness
>>> sysfs attr and then when the LED should be on according to
>>> that trigger, the trigger use the last written brightness.
>>
>> Thanks for the information! I didn't know there are triggers behaving
>> like this before.
>>
>>> Looking at things this way ALS is not really a trigger, it
>>> is more of a brightness control mechanism.
>>
>> IIUC, being able to control something that is not capable for a general
>> purpose LED trigger is the reason why the private trigger interface
>> exists.
>>
>>> So I think the best and also KISS solution here would be
>>> to go with adding a "als_enabled" sysfs attr to the
>>> LED class device, which is only visible when support,
>>> just like is already done in:
>>> 
>>> Documentation/ABI/testing/sysfs-platform-dell-laptop
>>> 
>>> I would also call led_classdev_notify_brightness_hw_changed() 
>>> when the EC moves between fixed-brightness-value <-> ALS.
>>> 
>>> Userspace will likely already have a poll() going on on
>>> the brightness_hw_changed sysfs attr, so this way userspace
>>> which is aware of the als_enabled sysfs attr can also check
>>> that.
>>> 
>>> You can then report brightness_max as the new value when calling
>>> led_classdev_notify_brightness_hw_changed() since the ALS can go
>>> up to brightness_max, likewise you could also always return
>>> brightness_max when reading the brightness value while in ALS mode.
>>
>> Makes sense. If we decide we should stick with the device attribute
>> approach, I will adopt this in v2 of my ideapad-laptop series.
>>
>>> The only real question left then is what to do on brightness
>>> writes. I would do the same as what triggers do here, ignore
>>> writing non 0 values and turn off the backlight (and thus also
>>> ALS) when 0 is written.
>>
>> I have two concerns on this behavior:
>>
>> 1.
>>
>> IIUC, there is no way for a LED device to determine if it is attached
>> to a trigger. The LED core does know this, but it won't tell the LED
>> device driver.
>>
>> In other words, we can't distinguish trigger requests from userspace
>> ones in our brightness_set[_blocking] callback, so we have to either
>> ignore both or none. As a result, we can't ignore anything and must
>> blindly accept any incoming requests in order not to break triggers.
>>
>> That's another reason why I made my proposal -- it must become a
>> trigger in order to be aware of other triggers.
>>
>> Am I missing something? Or did you mean we should add the attribute to
>> the LED core?
>>
>> 2.
>>
>> I quickly rechecked the LED core's code, and it doesn't behave as you
>> expected. It doesn't ignore non-zero written values when a trigger is
>> attached to the LED, and it will set the LED's brightness to the
>> written value despite the trigger (it will be discarded by next trigger
>> event, though).
>>
>
> I'm a bit confused here to be honest.
> If a user sets a specific level - then it should disable auto mode shouldn't it?
>
>> When the effective trigger is a hw control trigger, LED core's behavior
>> effectively disables hw control. Hmm... it seems that this side-effect
>> has been documented:
>>
>>    When the LED is in hw control, no software blink is possible and
>>    doing so will effectively disable hw control.
>>
>> So in my perspective the hw control trigger approach is semantically
>> correct here (in an unexpected way).
>>
>>> Note as for actually allowing "auto" for the brightness value
>>> (read/write) that would break userspace assumptions that that
>>> file always contains an integer, so that is not an option IMHO.
>>> 
>
> Yeah - I think we're all in agreement that it was a bad idea. I have 
> swept it back under the rock it came from
>
>>> Regards,
>>> 
>>> Hans
>>> 
>>
>> On Mon, 2026-02-09 at 13:44 -0500, Mark Pearson wrote:
>>> Thanks Rong
>>> 
>>> On Mon, Feb 9, 2026, at 1:14 PM, Rong Zhang wrote:
>>> > [...]
>>> > 
>>> > If there is a mechanism to set the brightness on specific events or
>>> > conditions, it is a trigger. If the trigger is controlled by hardware,
>>> > it's a hw control trigger. That's why I propose using a private hw
>>> > control trigger to represent this to make it semantically correct.
>>> 
>>> Ah. I think it will be confusing for most users. They're not going to think of it as a trigger (that's my guess anyway)
>>
>> I guess most users simply tune the keyboard backlight via desktop
>> environments, so it won't directly make them confused. When it comes to
>> desktop environments, this is precisely why we want the interface
>> capable to notify userspace about HW status transition.
>>
>> And both `cros_ec' and `turris-omnia' have been using private hw
>> control triggers to represent auto mode.
>>
>>> > [...]
>>> > 
>>> > I admit that my proposal is complicated and may need a lot of time to
>>> > make it into its right path. It may even be rejected by LED folks. But
>>> > it's the best approach I can think of considering our requirements on
>>> > the interface:
>>> > 
>>> > 1. It shouldn't break any existing interfaces.
>>> > 2. It's exposed to userspace for getting or setting its status.
>>> > 3. HW status transition should reach userspace (similar to
>>> > LED_BRIGHT_HW_CHANGED).
>>> 
>>> Just to check - for #3 do you mean it should report the brightness changes when it's in auto mode (i.e. if it got brighter or dimmer); or if it should just report it switched in/out of auto mode. 
>>> I don't think we need to report every brightness status change - and switching modes should be user directed so is no different to currently. Am I missing something?
>>
>> I meant auto-brightness on <-> off, or fixed-brightness-value <-> ALS
>> in Hans' words.
>>
>
> great - makes sense
>
>>> Thanks
>>> Mark
>>
>> To conclude:
>>
>> 1. My proposal:
>>
>> Upsides:
>> - mutually exclusive with other triggers (hence less chaos)
>> - semantic correctness
>> - extensibility (through trigger attributes)
>> - acts as an aggregate switch to turn on/off hw control
>>
>> Downsides:
>> - complexity
>> - needs approval from LED folks
>> - (I admit both are major blockers...)
>>
>> 2. Device attribute
>>
>> Upsides:
>> - simplicity, KISS
>> - no need to touch LED core
>> - extensible as long as it has a sensor-neutral name
>>
>> Downsides:
>> - must have zero influence on the brightness_set[_blocking] callback in
>> order not to break triggers
>> - potential interference with triggers and the brightness attribute
>> - weird semantic
>>
>> I am actually OK with both approaches. If you still consider the device
>> attribute approach is better after reading my concerns, I will no
>> longer insist on my proposal.
>>
>
> My (limited) vote is for the simplest solution - because it's just a 
> keyboard light. But I'll defer to Hans here - I don't think I know 
> enough to have a strong opinion.
>

Hi Hans - do you have an opinion on the path forwards? Would appreciate your expert guidance here :)

Mark
