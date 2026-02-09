Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF63803DA;
	Mon,  9 Feb 2026 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662683; cv=none; b=SNQ+fHJ1wPBK9cdbo4AZ+adys7VTciMIo5DZRIwFXlObuP3WzgWf5dy0rOjB2W/ae9v82gw0Wy2E+w70kFu7WbUh8PkpUp6PUIXMLS/axUwhsDUY1JslguHTaK97oeXrOUDjBpLdYlpKiHuyEDgse8putd1rJLABbw2yZe0Npz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662683; c=relaxed/simple;
	bh=jpkolb7VtiJWiFuZpF24sP3PWSwfNgJ99AeOJJYbVOk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VUix8hgk1MX+V0LZydmuxvZx+FmZvlNR/w25IXAMuHzWY3fk0M70dgYn/UkT2QebchPpqRpPg8heGZSh8kWa5tpOp634VEifIAVfEQmq1uN00ZWUohKnpDAp8OWIgyn9v0PazIW+WNpEpjMcj4VjqwaI2JD6KmNEaPTJggLdYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DRSo4+Xr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GLf/z7/H; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DRSo4+Xr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GLf/z7/H"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D397D14000A2;
	Mon,  9 Feb 2026 13:44:41 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 09 Feb 2026 13:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1770662681;
	 x=1770749081; bh=HVhhygkkbTYhnT8bUYBWhIB/JMubQNQ+fbcAH1FscIs=; b=
	DRSo4+XrtK0JC5WTK66BtSJA3ZlYxdVZy/q+L8kFO9I2/0JVpgfNepmAT02Gopcd
	7o6fQvVqkS/kuIq2iVFmPzWcpups+0Uj6NEdB10ZIf8lsr333F7bOY8ih+CcvECW
	0NjLRIVE9ydkXLQvJjdlfX642kjr9xHH1Gq9DOmlJisfzFtOHv3M2CM2h/WFn1RW
	bX5qwRF7Kr4/uSh1+2CfRE24L5QMvIK0UOzGnwdueDYfuBkRwnm04nlU2qX0qyMu
	o6er1lnU3bRf1Gl7r0WpRZ8vh+jipe6Ytvi4nq/obYkJeJOTmQczBN8GVV1t/2ft
	KMujURRtcdpD0Ua6oEj7fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770662681; x=
	1770749081; bh=HVhhygkkbTYhnT8bUYBWhIB/JMubQNQ+fbcAH1FscIs=; b=G
	Lf/z7/Hly2Sq5WkDDjkpNrpuxENzIrWf+a4Ujz5Pls0QBqcROhhqicTvcuC3Vjz3
	5acd158ettq+W13ByxX/Y62iclcv9seTwaxbGu3zNuTRgPeJWTUtCOFWD+t0BT8W
	NoJdgzRFyS5pnf+/aj1Klevu09V68K/2y3h1MSbV+Yw6kziFThRGDJeiKSbtCYwA
	F8sR35rXunncyVPPIy+iffcxuUuyoaRAbV9gefKXnvOFRyGhgDFjrqFWCEi9mQCa
	4AD78MHs+FTvI4qTmxbb5oeCWrOsLT7mYO+SSXs6lnR8PZJeeRIb1v4odKeIVPYA
	NuhS+Ar6GnktNklAge15w==
X-ME-Sender: <xms:GSuKaUDkzBCIYWrCDmXTWbFvSZ3K5gmPdxAgdALpzAKFvmo5rKWpyg>
    <xme:GSuKaRWD3QKnxXw62L8IksOAMj8Ks_dDizqaJsftXL5u0X2JPlLUnzuiYl6EnKMk1
    kT2qGnPwQCvQsP6EPFXRTpAKKz_1NXaC6l3gShlCbq2W9uibRK516w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleejheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeelvddvleeuieevhefgudekleetheffvdejiedtkedv
    tdefffehhfdvfffffeffveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtph
    htthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhh
    nhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehvihhshhhnuhhotghvse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghp
    thhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhsrghnkhgrrh
    eslhgvnhhovhhordgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlh
    eslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehisehrohhn
    ghdrmhhovgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:GSuKaRkpKfVJ1KidfRMCp6DupXrCgdutX2lu2DMKZgsoTwv3JzL28Q>
    <xmx:GSuKaYvIY-XuOUP1VPKziqejfpsrUhyB8u7kis-CiY2TMAd7mA0Yqg>
    <xmx:GSuKaUpgmIv4hRm1Bbt90HW4P2Z8692WnHXCWMVoqOmI7WZISuNYjA>
    <xmx:GSuKaWfmzAP4SHFT3KfNJP0O--cN9AhA4M4n-ys5HT9zUfZFvAEFlg>
    <xmx:GSuKaTpFKtrrSpHKsXFH0nVzukJJ1MD-0qVaVynqo3V0JrTBjWWzGpDg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 249982CE0072; Mon,  9 Feb 2026 13:44:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASaOPSC57OEF
Date: Mon, 09 Feb 2026 13:44:19 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Hans de Goede" <hansg@kernel.org>,
 "Vishnu Sankar" <vishnuocv@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Vishnu Sankar" <vsankar@lenovo.com>
Message-Id: <1acdc04a-e692-4ea6-8580-13f0b6d24f44@app.fastmail.com>
In-Reply-To: <69b9a9df97f4d10e2d11d6b0eb81bbf41fb4cbde.camel@rong.moe>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
 <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
 <69b9a9df97f4d10e2d11d6b0eb81bbf41fb4cbde.camel@rong.moe>
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic max_brightness
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Rong

On Mon, Feb 9, 2026, at 1:14 PM, Rong Zhang wrote:
> Hi Mark,
>
> Thanks for your reply.
>
> On Mon, 2026-02-09 at 10:46 -0500, Mark Pearson wrote:
>>=20
>> On Sun, Feb 8, 2026, at 3:58 PM, Rong Zhang wrote:
>> > Hi Hans, Vishnu and Mark,
>> >=20
>> > On Sun, 2026-02-08 at 11:54 +0100, Hans de Goede wrote:
>> > > Hi Vishnu,
>> > >=20
>> > > On 4-Feb-26 00:22, Vishnu Sankar wrote:
>> > > > Dynamically detect keyboard backlight capabilities and set
>> > > > max_brightness correctly (2 for old models, 3 for new models
>> > > > with Auto mode).
>> > >=20
>> > > Thank you for your patch.
>> > >=20
>> > > If I understand this correctly, writing 3 as level does not
>> > > make the backlight more bright then writing 2, but instead
>> > > it puts the backlight in some auto mode ?
>> > >=20
>> > > If I've that correct then  userspace should keep seeing
>> > > a range of 0 - 2 and the special auto mode value should
>> > > be reported / be made settable through a separate als_enabled
>> > > sysfs attribute under the LED class device. See:
>> > >=20
>> > > Documentation/ABI/testing/sysfs-platform-dell-laptop
>> > >=20
>> > > You can add extra attributes there by setting the groups
>> > > member of the struct led_classdev, see kbd_led_groups[]
>> > > in drivers/platform/x86/dell/dell-laptop.c, except that
>> > > you should use a .is_visible callback to only show this
>> > > on hw which supports it and you only need 1 group with
>> > > 1 attribute.
>> >=20
>> > When I implemented "als_enabled" for ideapad-laptop, Mark Pearson
>> > suggested it'd better to introduce "something similar to
>> > LED_BRIGHT_HW_CHANGED"=C2=A0rather than using custom attributes, as=
 "this is
>> > going to be a common feature across multiple vendors it might need
>> > doing at a common layer". Also, auto mode can be activated by HW as=
 a
>> > result of user input, so we need an approach to notify userspace ju=
st
>> > like what LED_BRIGHT_HW_CHANGED does. More importantly, the read va=
lue
>> > of the brightness attribute becomes nonsense when auto mode is on. =
This
>> > matches the semantic of hw control trigger.
>> >=20
>> > I agreed with Mark and had a proposal of allowing HW to initiate a
>> > transition from "none" to hw control trigger and vice versa. See the
>> > thread in
>> > https://lore.kernel.org/all/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@ap=
p.fastmail.com/
>> >=20
>> > I hadn't push it further due to other things taking the priority,
>> > though I already had a PoC back to then. I quickly rebased the PoC =
with
>> > some cleanups and put it here for preview:
>> >=20
>> > https://github.com/Rongronggg9/linux/tree/leds-trigger-hw-changed
>> >=20
>> > I will find some time to refine it and send an RFC series.
>> >=20
>> Hi Rong,
>>=20
>> Thanks for highlighting this (have to be honest - I'd forgotten we'd =
discussed it).
>> I think my suggestion may have been understood and I wonder your appr=
oach is more complicated than needed.
>
> If there is a mechanism to set the brightness on specific events or
> conditions, it is a trigger. If the trigger is controlled by hardware,
> it's a hw control trigger. That's why I propose using a private hw
> control trigger to represent this to make it semantically correct.
>

Ah. I think it will be confusing for most users. They're not going to th=
ink of it as a trigger (that's my guess anyway)

>> I was thinking we add a new flag to the led_classdev. e.g
>> #define LED_AUTO_BRIGHTNESS         BIT(26)
>
> Implementing it this way is still complicated as far as I can imagine:
>
> - A new attribute to expose the capability as you've said.
> - We need to extend brightness_get/brightness_set[_blocking] interfaces
> to accept/emit a special brightness value to represent auto mode.
> - We should handle brightness setting requests from usersapce and from
> led triggers separately: the former can put the LED into auto mode
> while the latter cannot.
> - Deprecate brightness and brightness_hw_changed while introducing new
> attributes. We can't extend existing attributes as I will explain
> later. That's the most frustrating part :-/
>
> And this approach becomes a bit weird if a future SKU comes with its
> auto mode tunable: you will have some device attributes which are only
> meaningful when auto mode is active. This is all because they are
> fundamentally trigger attributes in the first place...
>
>> Then the platform driver can set this flag and in led_classdev_regist=
er_ext we'd handle it appropriately to create a sysfs (e.g. auto_brightn=
ess_capable) node so user space knows auto is supported.
>> Other than that:
>>  - When the brightness is read and auton is being used - return "auto=
" instead of a value. Hopefully that doesn't break anything for user spa=
ce?
>
> It will likely break something.=C2=A0We can't extend an interface with=
 new
> data types.
>
> For example, existing userspace programs may have being using these for
> long:=20
>
> - POSIX shell: [ -eq, -ne, -gt, -ge, -lt, -le ]
> - Bash: let, (( ))
> - C: atoi(), atol(), atoll(), fscanf(), vfscanf()
> - Python: int()
> - Regex: [0-9], \d (PCRE), [[:digit:]] (POSIX)
> - ... And more similar things dealing with integers
>
> I think it's not worth deprecating the existing interface just to
> introduce something that is not fundamentally "brightness".
>

Yeah - that's fair. You're right - we shouldn't change the brightness fi=
eld.

So, how about adding two sysfs nodes to the LED class?
 - auto_brightness_capable - indicates the LED brightness can go into an=
 auto control mode
 - auto_brightness_enabled - indicates if the LED is in the auto_brightn=
ess controlled state or not.

Then it's up to the individual drivers (thinkpad/ideapad/whatever) to se=
t the fields appropriately as they change modes.
User space will need changing to handle these, but such is life.

>>  - When the brightness is set, you can use a value or 'auto" as you d=
esire (Documentation would need updating to allow this)
>> Really I was just looking for a way to advertise to user space that a=
 auto option would be supported :)
>
> That's my goal too.
>
> I admit that my proposal is complicated and may need a lot of time to
> make it into its right path. It may even be rejected by LED folks. But
> it's the best approach I can think of considering our requirements on
> the interface:
>
> 1. It shouldn't break any existing interfaces.
> 2. It's exposed to userspace for getting or setting its status.
> 3. HW status transition should reach userspace (similar to
> LED_BRIGHT_HW_CHANGED).

Just to check - for #3 do you mean it should report the brightness chang=
es when it's in auto mode (i.e. if it got brighter or dimmer); or if it =
should just report it switched in/out of auto mode.=20
I don't think we need to report every brightness status change - and swi=
tching modes should be user directed so is no different to currently. Am=
 I missing something?

Thanks
Mark
