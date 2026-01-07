Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58C327C13;
	Wed,  7 Jan 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796522; cv=none; b=YCIpAPjhy5P2MXbbo2h4JTqu4HfXEXjY3mlzdPixUHstBh2q8JynvELvgKYuF4PlJoWnr14C6+ebjVgt3fwehcu3xb+yVuvY7Ycu+0kpy8kzSNQkjujtKxOjZkE1h+AmNHdC0METpCGryOBwUI7BTUV4us03o1Y/9J8haW2TmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796522; c=relaxed/simple;
	bh=yO97Nrx8YCWidMtqaYshdCjQc1eGrw86UtKIZtWfges=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=q9R8NGK7q2/2qz2Qopr8iFAyp/NaW3xCoUdCvl8rbm/L2yGamTpiYVr6Ye7fNjALk/kbD+FJ+phHmW6UOUI4Ugod51+bscW1KyJrTGTUpVpDyHUurJ8mSWkStWnEp5eVa2eFGf6X7iJlsicxm4WD0jLnF8DxkdzAzp9gUh5fMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Kt/eKxGN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=shiycZYH; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Kt/eKxGN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="shiycZYH"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 98292EC027D;
	Wed,  7 Jan 2026 09:35:16 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 07 Jan 2026 09:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767796516;
	 x=1767882916; bh=/i2fHWXueQm3P9uBj1GNiWu6B9bCTbAKWoDoS+0/okI=; b=
	Kt/eKxGNrtRwUEHY5OVY9O5Vgd4J+rrIuKhGq6BheSSRs0ApdK4fEdA0FGTaYzoP
	ZEwvpqYhQs20je0kNcVsCXZc8BOd81P+OGXqipprmSbO7+6Eo98lV7VnnBcHIIoM
	Gj+N5A2sqNsd17eiqh2tydo5GbchDse+odh7+m2wMCT9TgWu4s2si9H/yw1HOesN
	nFGfb8qr0rt00EK6WV5Zd+5mJjzuxYuzUQd+gj/9r1KSXmzR9pJ++kKWPzVGhXDh
	Z0caePHwVHNaiPl/8siWU2izH0HdTMNdklYFil/dxoxE/QTyPalZtDuoEGooyIR0
	m8lhTCiwEnbKmKUhj4gZIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767796516; x=
	1767882916; bh=/i2fHWXueQm3P9uBj1GNiWu6B9bCTbAKWoDoS+0/okI=; b=s
	hiycZYHeK0Ib+qSHhgwnoaZXiY7MGzTeY/3M5HiVjVqjeu3lbWxnDfIGkQv8RNC1
	+thQRD0CHREJKKzEiSYf0RWZKlh1cDrYnPBMCmGOCwE+HUesGm4vWrq3Ky4GJ2eO
	RSC7INWdyX3eY8Uqna6iv6TRft6rh8ZLkzNa7PK92Jifynkxub+tK7g4Sv2wjhRi
	dLcUO/Vrrdg/zvaoLaGdWBIfDD/EZ79dcfpXEsOtd2AeN12CLzg3dpi0SNFbt/T0
	N0/G/FWEOhQOkHyJY0CfpfOGcwzyIrl61BnUdfscHOnn5jdDdOCw5HDPn7Fzvk1d
	9bFBRsGQWFyPs6TnXzJpA==
X-ME-Sender: <xms:JG9eaTQkUcue9ItwPiI32Ycag4Vy2ZR7ECSZIauSlN6npVjFAfPaFQ>
    <xme:JG9eafn1kcv_nXpXPmovzM7X0TfHQFORofZpfYtHJ8-7tyd4SOs4frmfPb2uINRkt
    j9BfB9WGnxeG6w4WP7w6pm5_PeKXutxVbXanDLNywj4SwYmPZXSpR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeffedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteek
    ffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsvghnjh
    grmhhinhdrphhhihhlihhpgeelheesghhmrghilhdrtghomhdprhgtphhtthhopeguvghr
    vghkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrnhhsgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhv
    vghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JG9eaX0IJ9j6pM3tA5-qhaufXHXnZGEQpuK5A7bY-VFG9Q94r_u7Dg>
    <xmx:JG9eaYXvSFJDW5gtmafnVJ4xNjeOJeBhBUSaqBWzm2O-4i_HXFQKyQ>
    <xmx:JG9eaaJVH6AMfZQSdJgUPlw-G1Nw2CdP9JtuoboDudjaX--nkdVgqg>
    <xmx:JG9eaS1wTlA60nzUF3IU0iqxX1JcliefStAacHSl2l94HvLU4TJ8Mw>
    <xmx:JG9eaVbZo1FbPv1IVQ_Tsy_71bB21-O0zVTJ8aorN6W_yWk0sudyT4zP>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 181E32CE0072; Wed,  7 Jan 2026 09:35:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgG1KmZ3azLF
Date: Wed, 07 Jan 2026 09:34:55 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Message-Id: <5518eadd-0e37-4d69-8e83-19a99b91cb40@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWfmHDr_WqjGd5u7MPF4=MyNnLuDrcL6p+1JzSrtB7spKw@mail.gmail.com>
References: 
 <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
 <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
 <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
 <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com>
 <877bu5gr48.fsf@gmail.com>
 <69c27b14-5943-eab1-407c-209d8d484bc1@linux.intel.com>
 <05eb6019-5ed5-463a-b556-27792ea43568@app.fastmail.com>
 <87344shcsi.fsf@gmail.com>
 <d182f05e-2a26-4f0a-af2f-dcecee25fc95@app.fastmail.com>
 <CAMEXYWfmHDr_WqjGd5u7MPF4=MyNnLuDrcL6p+1JzSrtB7spKw@mail.gmail.com>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026, at 2:33 PM, Benjamin Philip wrote:
> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>
>> On Mon, Dec 29, 2025, at 10:24 PM, Benjamin Philip wrote:
>>> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>>>
>>>> On Mon, Dec 29, 2025, at 12:32 PM, Ilpo J=C3=A4rvinen wrote:
>>>>> On Mon, 29 Dec 2025, Benjamin Philip wrote:
>>>>>> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>>>>>> > On Wed, 24 Dec 2025, Benjamin Philip wrote:
>>>>>> >> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>>>>>> >> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>>>>>> >> >> This commit handles some column limit overflows (that occur=
 after fixing
>>>>>> >> >> their alignment), i.e. the following check:
>>>>>> >> >>
>>>>>> >> >> CHECK: line length of ... exceeds 100 columns
>>>>>> >> >>
>>>>>> >> >> by defining a constant opt, and replacing the offending
>>>>>> >> >> expression with opt.
>>>>>> >> >>
>>>>>> >> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.co=
m>
>>>>>> >> >> ---
>>>>>> >> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++=
++----------
>>>>>> >> >>  1 file changed, 19 insertions(+), 12 deletions(-)
>>>>>> >> >>
>>>>>> >> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>>>>>> >> >> b/drivers/platform/x86/lenovo/think-lmi.c
>>>>>> >> >> index 1ada4d800383..07ba0d84720a 100644
>>>>>> >> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
>>>>>> >> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>>>>>> >> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kob=
ject *kobj,
>>>>>> >> >> struct kobj_attribute *attr,
>>>>>> >> >>  }
>>>>>> >> >>
>>>>>> >> >>  static ssize_t current_value_store(struct kobject *kobj,
>>>>>> >> >> -		struct kobj_attribute *attr,
>>>>>> >> >> -		const char *buf, size_t count)
>>>>>> >> >> +				   struct kobj_attribute *attr, const char *buf,
>>>>>> >> >> +				   size_t count)
>>>>>> >> >>  {
>>>>>> >> >>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_settin=
g(kobj);
>>>>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>>>>> >> >>  	char *auth_str =3D NULL;
>>>>>> >> >> +	const char *opt;
>>>>>> >> >>  	int ret;
>>>>>> >> >>
>>>>>> >> >>  	if (!tlmi_priv.can_set_bios_settings)
>>>>>> >> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(=
struct kobject *kobj,
>>>>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>>>>> >> >>  	} else { /* old non-opcode based authentication method (d=
eprecated) */
>>>>>> >> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_ad=
min->password[0]) {
>>>>>> >> >> +			opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>>>> >> >>  			auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>>>> >> >> -					tlmi_priv.pwd_admin->password,
>>>>>> >> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>>>>>> >> >> -					tlmi_priv.pwd_admin->kbdlang);
>>>>>> >> >> +					     tlmi_priv.pwd_admin->password,
>>>>>> >> >> +					     opt,
>>>>>> >> >> +					     tlmi_priv.pwd_admin->kbdlang);
>>>>>> >> >>  			if (!auth_str) {
>>>>>> >> >>  				ret =3D -ENOMEM;
>>>>>> >> >>  				goto out;
>>>>>> >> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(st=
ruct
>>>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>>>> >> >>  				   const char *buf, size_t count)
>>>>>> >> >>  {
>>>>>> >> >>  	char *auth_str =3D NULL;
>>>>>> >> >> +	const char *opt;
>>>>>> >> >>  	int ret =3D 0;
>>>>>> >> >>  	int cmd;
>>>>>> >> >>
>>>>>> >> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(s=
truct
>>>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>>>>> >> >>  		} else { /* old non-opcode based authentication method (=
deprecated) */
>>>>>> >> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_a=
dmin->password[0]) {
>>>>>> >> >> +				opt =3D encoding_options[tlmi_priv.pwd_admin->encoding=
];
>>>>>> >> >>  				auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>>>> >> >>  						     tlmi_priv.pwd_admin->password,
>>>>>> >> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>>>>>> >> >> +						     opt,
>>>>>> >> >>  						     tlmi_priv.pwd_admin->kbdlang);
>>>>>> >> >>  				if (!auth_str) {
>>>>>> >> >>  					ret =3D -ENOMEM;
>>>>>> >> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(=
struct
>>>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>>>> >> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(s=
ave_settings);
>>>>>> >> >>
>>>>>> >> >>  /* ---- Debug
>>>>>> >> >> interface--------------------------------------------------=
-------
>>>>>> >> >> */
>>>>>> >> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>>>>>> >> >> kobj_attribute *attr,
>>>>>> >> >> -				const char *buf, size_t count)
>>>>>> >> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
>>>>>> >> >> +			       struct kobj_attribute *attr, const char *buf,
>>>>>> >> >> +			       size_t count)
>>>>>> >> >>  {
>>>>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>>>>> >> >>  	char *auth_str =3D NULL;
>>>>>> >> >> +	const char *opt;
>>>>>> >> >>  	int ret;
>>>>>> >> >>
>>>>>> >> >>  	if (!tlmi_priv.can_debug_cmd)
>>>>>> >> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(stru=
ct kobject
>>>>>> >> >> *kobj, struct kobj_attribute *attr
>>>>>> >> >>  		return -ENOMEM;
>>>>>> >> >>
>>>>>> >> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_adm=
in->password[0]) {
>>>>>> >> >> +		opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>>>> >> >>  		auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>>>> >> >> -				tlmi_priv.pwd_admin->password,
>>>>>> >> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>>>>>> >> >> -				tlmi_priv.pwd_admin->kbdlang);
>>>>>> >> >> +				     tlmi_priv.pwd_admin->password,
>>>>>> >> >> +				     opt,
>>>>>> >> >> +				     tlmi_priv.pwd_admin->kbdlang);
>>>>>> >> >>  		if (!auth_str) {
>>>>>> >> >>  			ret =3D -ENOMEM;
>>>>>> >> >>  			goto out;
>>>>>> >> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_de=
vice *wdev)
>>>>>> >> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>>>> >> >>  			}
>>>>>> >> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>>>> >> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>>> >> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>>> >> >>  				tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>>>>>> >> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>>>> >> >>  					tlmi_priv.pwd_nvme->index =3D
>>>>>> >> >> --
>>>>>> >> >> 2.52.0
>>>>>> >> >
>>>>>> >> > I'll defer to the pdx86 reviewers for this set of changes.
>>>>>> >> >
>>>>>> >> > This seems to me to make things more complicated than needed=
, purely
>>>>>> >> > to address a 100 column limit. I personally don't like the c=
hange.
>>>>>> >> >
>>>>>> >> > Nothing wrong with the code, and if more experienced maintai=
ners prefer it, I'm happy to defer to them. Otherwise it seems to me noi=
se for the sake of noise I'm afraid
>>>>>> >> >
>>>>>> >> > Mark
>>>>>> >>
>>>>>> >> An alternative could be to set this a constant pwd_admin to
>>>>>> >> tlmi_priv.pwd_admin. There are 13 other references to
>>>>>> >> tlmi_priv.pwd_admin in one function alone, so maybe it might b=
e a more
>>>>>> >> meaningful improvement?
>>>>>> >
>>>>>> > Hi,
>>>>>> >
>>>>>> > The general theme in this driver seems to be that tlmi_priv.pwd=
_admin
>>>>>> > usually causes long lines so introducing a local variable for i=
t in such
>>>>>> > functions would certainly help.
>>>>>> >
>>>>>> > This probably came to be when pwd_admin was migrated over into =
tlmi_priv
>>>>>> > which certainly was correct place for it, but case with the cos=
t of adding
>>>>>> > into the line lengths.
>>>>>> >
>>>>>>
>>>>>> In this case, would you prefer that a local variable for pwd_admi=
n be
>>>>>> introduced instead of variables for values in the long lines?
>>>>>
>>>>> Mark who's the maintainer seems to be against it, so I don't want =
to step
>>>>> too strongly on his lot in this. It's merely my opinion how we nor=
mally
>>>>> handle cases like this (I probably didn't express that clearly eno=
ugh).
>>>>>
>>>>
>>>> I don't have a strong opinion :) If it's business as usual, then it=
's fine and we can include it.
>>>>
>>>> From my perspective, it would be useful to know if it's been tested=
 on real HW, and (if so) which platforms. Unfortunately Thinkpad, ThinkC=
enter and ThinkStation all use this module and all have their own little=
 quirks.
>>>> I'll do some testing here (soonish...) to confirm they're all still=
 sane after (they should be) and throw in a tested-by tag.
>>>>
>>>> Mark
>>>
>>> Before you do that I can send a v2 with the parentheses changes remo=
ved.
>>> If you can point to the tests in particular you run, I can test on a
>>> Thinkpad as well before sending.
>>>
>> OK.
>> Testing - nothing too exciting, just check that everything shows up u=
nder /sys/class/firmware-attributes and check a setting can be changed b=
ack/forth.
>>
>> Mark
>
> If you're just testing the sysfs interface, why not write a kselftest?
>
> On a side note, looking at tools/testing/selftests/drivers/platform/x8=
6/
> I noticed that there are only tests for some intel driver. Am I missing
> something here? Have tests for all the other drivers been left out due
> to time/resource constraints, or is there some other reason?
>
Honestly, never really looked at it - time/resource constraints is proba=
bly the most accurate excuse.
I also find, for most of what I do, that testing on real HW is better as=
 that's where the problems show up. It's also where we/Lenovo can add mo=
re value for the Linux community (we have the HW after all).
Specifically for this case, reboots are needed when changing attributes,=
 which I'm guessing could be tricky.

But I should probably find some time to look at more testing....I shall =
throw it on the todo heap :) Thanks for the pointer

Mark
