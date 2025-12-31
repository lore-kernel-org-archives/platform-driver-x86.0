Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31D22A4EB;
	Wed, 31 Dec 2025 02:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767149289; cv=none; b=oGn3DbBmZamqOHen3/u5G6x0ox/A861XZzZrko/7YQrLbkRbE3rXo2gRPmdDtYnkZnnwFJQEwxZ7m1A7qEd3i9vkVjDn1XdcpPi2enZqNs80mHconMWXhM1mQNh3iNQncfmkTZuA7Ch2z6na5IuU7E9voOfqK/rW+wR1UpmOaiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767149289; c=relaxed/simple;
	bh=DkBhfst4lSXrDuTNtXJsfqGxKCS1IjLpqG2dN67AybY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=S+f6WTbrXtT0ot12eabGIY7wJ0UnYjn0mU020Dk2Fghf4uQie0gggVF0WfgOFoLpAwXPV4R8rYS+7FZTmaoKKjB7WUCmh9M9ZqWovnexDJn7YhkCF/fQE1Xm0YGZMRQYwpWxhZDOx2OOEa7OCPb51cGHNXfHBsxzLqPC5alffHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=UKma0h3H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dGXFv00z; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="UKma0h3H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dGXFv00z"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BAD421400114;
	Tue, 30 Dec 2025 21:48:05 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 30 Dec 2025 21:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767149285;
	 x=1767235685; bh=Nv7LoQXP3MJzznzVbZQAXOoI3zKhtz6pABTeClGqAKQ=; b=
	UKma0h3H08ZOmbHtFiSE52VM9y9CZ/eMx9FWBjF5TIX0V9ArexL6U/XC+7VrfHB4
	I6zIl6FnrksrPoyGlB+nEfQX3x0vf8KEHwPgTpG/RYiECQt83TjJaODF8yWqWoI6
	tGTUEty1ZO34lkpIVjaNVZmt12pIpoyMoPlwyslEQnruUVf4sBNtSBMDVGz7YTHE
	N5w3CXYeytipJru5ZYHCzVH6thHRuqjUyQsAOJYWJxap0OEMd58hr6zoY1iyTAJy
	Bzk0E1dJjzXCmyjz8es868Xf38rysADubchHIAG+f+oZylw9BF74/Vhu56rwWPgl
	CaIrysKkaY3n6SdMwoNl9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767149285; x=
	1767235685; bh=Nv7LoQXP3MJzznzVbZQAXOoI3zKhtz6pABTeClGqAKQ=; b=d
	GXFv00zOiRzkU25cRtozaDe/5d79rwuYBU7wf8Flxw3Ruval0mc1+9wrxHYiqnMv
	Rj1JuNKC7U7bIQe6qnogyi+IgqTGBddE9I+1BACFvIHJui2+rXrqQL3zouB2O7sX
	XyxVGMCUnDRJbBGsUVUqRvZe5r6kjdvt3saP0lIWQWw5dPN4MTbM6EWiIjEsWnQp
	gSfZ65PzJD5zz9T6G2XzgGyFYXSGUgijFwWBgk0qvQ8GlFZXj8MQoXo6oUEOO4HU
	YCh979gcz442P3815IdAPUCcSaBHdLy7TtSYFaANgtBHBjrIAhN9O7qgBw3c5mrM
	+yj7DO4XfPMXwEaOyVJAA==
X-ME-Sender: <xms:5Y5UaWyEvQNsmWtpN9aw2_OLeX-m0hU3UjrkrnVWUbbx8CGXFmQnqw>
    <xme:5Y5UadE9yXPcSSN5Klz7nqPF069e-AC4wSa9oQMhZRhsq4pd90B-4S1IAPk2RcbA6
    kAjJrbBM96n_eK0UBgEAxBHBmKxMfDO9GD1HFooes8eK39AKC0BvM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekudejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfevkeejueeukeefhfelleejheeuudfgteffvdetkeff
    jeduleffvdejkeefhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhjrg
    hmihhnrdhphhhilhhiphegleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgv
    khhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhrghnshhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhn
    uhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5Y5UaTWv9n9DZPVarZK8rJf-Rt7qjW6nuyNM3aKbl7j-WdV6wKNiow>
    <xmx:5Y5Uad07HJfAS71soffWj6nT4fMKK_XJ7m-lzYR3FO_2uzet3as1RQ>
    <xmx:5Y5UaRrnzXVQ0Azzfk2uLzXAFvmUH7Sp70-QFjnzIUdacw_iacm1HQ>
    <xmx:5Y5UaUUw9ExeOKm3FAw1I19YeDlvlx0z_Xitv0Pz8oXzJaB2oKUccw>
    <xmx:5Y5UaS50OEPjC9n_lNB6tHv8qmYkIDP_8r0AiEV42u-_YHp2dra4McU3>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 372812CE0072; Tue, 30 Dec 2025 21:48:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgG1KmZ3azLF
Date: Tue, 30 Dec 2025 21:47:44 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Message-Id: <d182f05e-2a26-4f0a-af2f-dcecee25fc95@app.fastmail.com>
In-Reply-To: <87344shcsi.fsf@gmail.com>
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
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Dec 29, 2025, at 10:24 PM, Benjamin Philip wrote:
> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>
>> On Mon, Dec 29, 2025, at 12:32 PM, Ilpo J=C3=A4rvinen wrote:
>>> On Mon, 29 Dec 2025, Benjamin Philip wrote:
>>>> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>>>> > On Wed, 24 Dec 2025, Benjamin Philip wrote:
>>>> >> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>>>> >> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>>>> >> >> This commit handles some column limit overflows (that occur a=
fter fixing
>>>> >> >> their alignment), i.e. the following check:
>>>> >> >>
>>>> >> >> CHECK: line length of ... exceeds 100 columns
>>>> >> >>
>>>> >> >> by defining a constant opt, and replacing the offending
>>>> >> >> expression with opt.
>>>> >> >>
>>>> >> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>>>> >> >> ---
>>>> >> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++=
----------
>>>> >> >>  1 file changed, 19 insertions(+), 12 deletions(-)
>>>> >> >>
>>>> >> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>>>> >> >> b/drivers/platform/x86/lenovo/think-lmi.c
>>>> >> >> index 1ada4d800383..07ba0d84720a 100644
>>>> >> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
>>>> >> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>>>> >> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobje=
ct *kobj,
>>>> >> >> struct kobj_attribute *attr,
>>>> >> >>  }
>>>> >> >>
>>>> >> >>  static ssize_t current_value_store(struct kobject *kobj,
>>>> >> >> -		struct kobj_attribute *attr,
>>>> >> >> -		const char *buf, size_t count)
>>>> >> >> +				   struct kobj_attribute *attr, const char *buf,
>>>> >> >> +				   size_t count)
>>>> >> >>  {
>>>> >> >>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(=
kobj);
>>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>>> >> >>  	char *auth_str =3D NULL;
>>>> >> >> +	const char *opt;
>>>> >> >>  	int ret;
>>>> >> >>
>>>> >> >>  	if (!tlmi_priv.can_set_bios_settings)
>>>> >> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(st=
ruct kobject *kobj,
>>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>>> >> >>  	} else { /* old non-opcode based authentication method (dep=
recated) */
>>>> >> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admi=
n->password[0]) {
>>>> >> >> +			opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>> >> >>  			auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>> >> >> -					tlmi_priv.pwd_admin->password,
>>>> >> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>>>> >> >> -					tlmi_priv.pwd_admin->kbdlang);
>>>> >> >> +					     tlmi_priv.pwd_admin->password,
>>>> >> >> +					     opt,
>>>> >> >> +					     tlmi_priv.pwd_admin->kbdlang);
>>>> >> >>  			if (!auth_str) {
>>>> >> >>  				ret =3D -ENOMEM;
>>>> >> >>  				goto out;
>>>> >> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(stru=
ct
>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>> >> >>  				   const char *buf, size_t count)
>>>> >> >>  {
>>>> >> >>  	char *auth_str =3D NULL;
>>>> >> >> +	const char *opt;
>>>> >> >>  	int ret =3D 0;
>>>> >> >>  	int cmd;
>>>> >> >>
>>>> >> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(str=
uct
>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>>> >> >>  		} else { /* old non-opcode based authentication method (de=
precated) */
>>>> >> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_adm=
in->password[0]) {
>>>> >> >> +				opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>> >> >>  				auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>> >> >>  						     tlmi_priv.pwd_admin->password,
>>>> >> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>>>> >> >> +						     opt,
>>>> >> >>  						     tlmi_priv.pwd_admin->kbdlang);
>>>> >> >>  				if (!auth_str) {
>>>> >> >>  					ret =3D -ENOMEM;
>>>> >> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(st=
ruct
>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>> >> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(sav=
e_settings);
>>>> >> >>
>>>> >> >>  /* ---- Debug
>>>> >> >> interface----------------------------------------------------=
-----
>>>> >> >> */
>>>> >> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>>>> >> >> kobj_attribute *attr,
>>>> >> >> -				const char *buf, size_t count)
>>>> >> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
>>>> >> >> +			       struct kobj_attribute *attr, const char *buf,
>>>> >> >> +			       size_t count)
>>>> >> >>  {
>>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>>> >> >>  	char *auth_str =3D NULL;
>>>> >> >> +	const char *opt;
>>>> >> >>  	int ret;
>>>> >> >>
>>>> >> >>  	if (!tlmi_priv.can_debug_cmd)
>>>> >> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct=
 kobject
>>>> >> >> *kobj, struct kobj_attribute *attr
>>>> >> >>  		return -ENOMEM;
>>>> >> >>
>>>> >> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin=
->password[0]) {
>>>> >> >> +		opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>> >> >>  		auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>> >> >> -				tlmi_priv.pwd_admin->password,
>>>> >> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>>>> >> >> -				tlmi_priv.pwd_admin->kbdlang);
>>>> >> >> +				     tlmi_priv.pwd_admin->password,
>>>> >> >> +				     opt,
>>>> >> >> +				     tlmi_priv.pwd_admin->kbdlang);
>>>> >> >>  		if (!auth_str) {
>>>> >> >>  			ret =3D -ENOMEM;
>>>> >> >>  			goto out;
>>>> >> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_devi=
ce *wdev)
>>>> >> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>> >> >>  			}
>>>> >> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>> >> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>> >> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>> >> >>  				tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>>>> >> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>> >> >>  					tlmi_priv.pwd_nvme->index =3D
>>>> >> >> --
>>>> >> >> 2.52.0
>>>> >> >
>>>> >> > I'll defer to the pdx86 reviewers for this set of changes.
>>>> >> >
>>>> >> > This seems to me to make things more complicated than needed, =
purely=20
>>>> >> > to address a 100 column limit. I personally don't like the cha=
nge.=20
>>>> >> >
>>>> >> > Nothing wrong with the code, and if more experienced maintaine=
rs prefer it, I'm happy to defer to them. Otherwise it seems to me noise=
 for the sake of noise I'm afraid
>>>> >> >
>>>> >> > Mark
>>>> >>=20
>>>> >> An alternative could be to set this a constant pwd_admin to
>>>> >> tlmi_priv.pwd_admin. There are 13 other references to
>>>> >> tlmi_priv.pwd_admin in one function alone, so maybe it might be =
a more
>>>> >> meaningful improvement?
>>>> >
>>>> > Hi,
>>>> >
>>>> > The general theme in this driver seems to be that tlmi_priv.pwd_a=
dmin=20
>>>> > usually causes long lines so introducing a local variable for it =
in such=20
>>>> > functions would certainly help.
>>>> >
>>>> > This probably came to be when pwd_admin was migrated over into tl=
mi_priv=20
>>>> > which certainly was correct place for it, but case with the cost =
of adding=20
>>>> > into the line lengths.
>>>> >
>>>>=20
>>>> In this case, would you prefer that a local variable for pwd_admin =
be
>>>> introduced instead of variables for values in the long lines?=20
>>>
>>> Mark who's the maintainer seems to be against it, so I don't want to=
 step
>>> too strongly on his lot in this. It's merely my opinion how we norma=
lly=20
>>> handle cases like this (I probably didn't express that clearly enoug=
h).
>>>
>>
>> I don't have a strong opinion :) If it's business as usual, then it's=
 fine and we can include it.
>>
>> From my perspective, it would be useful to know if it's been tested o=
n real HW, and (if so) which platforms. Unfortunately Thinkpad, ThinkCen=
ter and ThinkStation all use this module and all have their own little q=
uirks.=20
>> I'll do some testing here (soonish...) to confirm they're all still s=
ane after (they should be) and throw in a tested-by tag.
>>
>> Mark
>
> Before you do that I can send a v2 with the parentheses changes remove=
d.
> If you can point to the tests in particular you run, I can test on a
> Thinkpad as well before sending.
>
OK.
Testing - nothing too exciting, just check that everything shows up unde=
r /sys/class/firmware-attributes and check a setting can be changed back=
/forth.

Mark
