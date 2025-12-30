Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D70C2DA742;
	Tue, 30 Dec 2025 03:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767064078; cv=none; b=W1Aj3S+sr69C/yyMTWRtW4tf+hzjhVO4DzLSMHTO2nAEZ8eOCcI6fJAkShfHlLuO/lHLE5jJTZUtE6kHgTvuc6Pjqzenz3G7baOqBliLTTyJoEPOUPrlwFiIIUGMH233/f4Ssu9lnMJ7ZkwfrO4mjw0n8ufZPxMMM18jFwgj9nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767064078; c=relaxed/simple;
	bh=iq9iOzJztU1qTK0k7VX53eNOepDoL3yKFERgee8ACuU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e0NzXOGDufKA5kJjTBFB5CT+4EN5pSg/zSsbOxsuzOdfjbiYAvBzGObJN3NXmiI4j3qxhqT46cTIjHihQ1PTQ0t4/A4W1ec2QofFyxppqlTI5MC0Q+ODDfBVnGNjYLWu4nrTcV+9F9HFl390T16w9VnIG7U8D33WJ93vvdEii0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=thiwzAxg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qnlm5iDu; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="thiwzAxg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qnlm5iDu"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A52E4140014C;
	Mon, 29 Dec 2025 22:07:54 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 29 Dec 2025 22:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767064074;
	 x=1767150474; bh=TVr7ArUr37OKRVN60PXzHdLsZ3cUyxRAkpJrkGLHwX8=; b=
	thiwzAxgKlq3eeJQcfvYFLb/I+YHk2E8Ao+26zPFpJiubi62giY6liND4ExA5J/4
	CXNq3SkX2qgCk6XZlcfgHPRlD5wK8waC6/OEl5HGaDZEeDqjiMAcBRiZtsvwTHp0
	cUxHvcJkIotENE0irHeTs4RQsVwfav2v7AjTgjyq0WvYask/+4yD5W10hJxi7u8L
	gYdHsu/TqwswnWSbfCuURRhkziE1C7N7nuB2rjk3QTs8PqOBulcKgoP4CvAyLYXN
	yuP4oku9XfJMmbSyx2DJTQTpN25qQt1WMHf0QGIINklA9anEOuohKYcrOoHqwxcQ
	02uFTqTYhPtYkYNOjT6UnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767064074; x=
	1767150474; bh=TVr7ArUr37OKRVN60PXzHdLsZ3cUyxRAkpJrkGLHwX8=; b=q
	nlm5iDu7MF4Qua/BX0J7I/NwA5tt0hfykOeDNsmh/bgN7V5m9F5mnrhkJZONn+8/
	4qFCVQEcCMzmC54ZrBtNCT99Sy9rLwYrDGxtAXpSFcjnPHcSZ9Cu7zDMLiQswN54
	4ebNMjaDAElJLQLPEbw/wYJUMTG31uekZTY2u6j+HCZmTjkY20QJTS75Y+jOYYtD
	PChpc+q7vl2APH//ZsHsUTrrxX67QlbhyzPVIr/GeS/TZvOWC3qQPjeurrTivejZ
	O80xyPy2UMXFFet8ZzK0onEtuhUjWoW3uyIsoMaHt+vmBxMpnK8D2jekdg9Ny5E9
	Gr+xX5V34/+rrkWf0Tk9A==
X-ME-Sender: <xms:CkJTaSnyDCyk0K6IlMnqiugaa_Tzg84wvG8j9p1JDXJoL_S2L5SqjA>
    <xme:CkJTaUrFbgocobvUbEl5-UL5xsNgHe2OqoLalW9YlrD-f-GDPPwuDSKxLrYO019Ad
    wGkENyUU-5QqAVjykxKaItfjXkXiwDWxZKmcja1sju71YZKudKIm_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeeltdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:CkJTaeJadQwSgXa2Mam6WULPhie2yoVgItW_vRneT4HrvVpnWHHjNA>
    <xmx:CkJTaYbCxIDpkpQ9AmGGkqPRLauadf7NqmSKlqhonnXPGX6k6jDANw>
    <xmx:CkJTaQ8TVw2LI9Nfen7eIAYwKrl6RFTkdMzM9VBFL22LCobhuA8QrA>
    <xmx:CkJTaZYFtgtJFvNY5mOlOHGxN1xxosla2AWUzMUEmdHqfpBy1tElLQ>
    <xmx:CkJTaceTPPkNBED9DAguTsAnRESf_oQkJi6Px8HovLb95_9_718Uz7vS>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EB0062CE0078; Mon, 29 Dec 2025 22:07:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AgG1KmZ3azLF
Date: Mon, 29 Dec 2025 22:07:26 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Benjamin Philip" <benjamin.philip495@gmail.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Message-Id: <05eb6019-5ed5-463a-b556-27792ea43568@app.fastmail.com>
In-Reply-To: <69c27b14-5943-eab1-407c-209d8d484bc1@linux.intel.com>
References: 
 <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
 <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
 <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
 <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com>
 <877bu5gr48.fsf@gmail.com>
 <69c27b14-5943-eab1-407c-209d8d484bc1@linux.intel.com>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Dec 29, 2025, at 12:32 PM, Ilpo J=C3=A4rvinen wrote:
> On Mon, 29 Dec 2025, Benjamin Philip wrote:
>> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>> > On Wed, 24 Dec 2025, Benjamin Philip wrote:
>> >> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>> >> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>> >> >> This commit handles some column limit overflows (that occur aft=
er fixing
>> >> >> their alignment), i.e. the following check:
>> >> >>
>> >> >> CHECK: line length of ... exceeds 100 columns
>> >> >>
>> >> >> by defining a constant opt, and replacing the offending
>> >> >> expression with opt.
>> >> >>
>> >> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>> >> >> ---
>> >> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++--=
--------
>> >> >>  1 file changed, 19 insertions(+), 12 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>> >> >> b/drivers/platform/x86/lenovo/think-lmi.c
>> >> >> index 1ada4d800383..07ba0d84720a 100644
>> >> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
>> >> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> >> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject=
 *kobj,
>> >> >> struct kobj_attribute *attr,
>> >> >>  }
>> >> >>
>> >> >>  static ssize_t current_value_store(struct kobject *kobj,
>> >> >> -		struct kobj_attribute *attr,
>> >> >> -		const char *buf, size_t count)
>> >> >> +				   struct kobj_attribute *attr, const char *buf,
>> >> >> +				   size_t count)
>> >> >>  {
>> >> >>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(ko=
bj);
>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>> >> >>  	char *auth_str =3D NULL;
>> >> >> +	const char *opt;
>> >> >>  	int ret;
>> >> >>
>> >> >>  	if (!tlmi_priv.can_set_bios_settings)
>> >> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(stru=
ct kobject *kobj,
>> >> >>  			ret =3D tlmi_save_bios_settings("");
>> >> >>  	} else { /* old non-opcode based authentication method (depre=
cated) */
>> >> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin-=
>password[0]) {
>> >> >> +			opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>> >> >>  			auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> >> >> -					tlmi_priv.pwd_admin->password,
>> >> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>> >> >> -					tlmi_priv.pwd_admin->kbdlang);
>> >> >> +					     tlmi_priv.pwd_admin->password,
>> >> >> +					     opt,
>> >> >> +					     tlmi_priv.pwd_admin->kbdlang);
>> >> >>  			if (!auth_str) {
>> >> >>  				ret =3D -ENOMEM;
>> >> >>  				goto out;
>> >> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
>> >> >> kobject *kobj, struct kobj_attribute *
>> >> >>  				   const char *buf, size_t count)
>> >> >>  {
>> >> >>  	char *auth_str =3D NULL;
>> >> >> +	const char *opt;
>> >> >>  	int ret =3D 0;
>> >> >>  	int cmd;
>> >> >>
>> >> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
>> >> >> kobject *kobj, struct kobj_attribute *
>> >> >>  			ret =3D tlmi_save_bios_settings("");
>> >> >>  		} else { /* old non-opcode based authentication method (depr=
ecated) */
>> >> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin=
->password[0]) {
>> >> >> +				opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>> >> >>  				auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> >> >>  						     tlmi_priv.pwd_admin->password,
>> >> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>> >> >> +						     opt,
>> >> >>  						     tlmi_priv.pwd_admin->kbdlang);
>> >> >>  				if (!auth_str) {
>> >> >>  					ret =3D -ENOMEM;
>> >> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(stru=
ct
>> >> >> kobject *kobj, struct kobj_attribute *
>> >> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(save_=
settings);
>> >> >>
>> >> >>  /* ---- Debug
>> >> >> interface------------------------------------------------------=
---
>> >> >> */
>> >> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>> >> >> kobj_attribute *attr,
>> >> >> -				const char *buf, size_t count)
>> >> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
>> >> >> +			       struct kobj_attribute *attr, const char *buf,
>> >> >> +			       size_t count)
>> >> >>  {
>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>> >> >>  	char *auth_str =3D NULL;
>> >> >> +	const char *opt;
>> >> >>  	int ret;
>> >> >>
>> >> >>  	if (!tlmi_priv.can_debug_cmd)
>> >> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct k=
object
>> >> >> *kobj, struct kobj_attribute *attr
>> >> >>  		return -ENOMEM;
>> >> >>
>> >> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->=
password[0]) {
>> >> >> +		opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>> >> >>  		auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> >> >> -				tlmi_priv.pwd_admin->password,
>> >> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>> >> >> -				tlmi_priv.pwd_admin->kbdlang);
>> >> >> +				     tlmi_priv.pwd_admin->password,
>> >> >> +				     opt,
>> >> >> +				     tlmi_priv.pwd_admin->kbdlang);
>> >> >>  		if (!auth_str) {
>> >> >>  			ret =3D -ENOMEM;
>> >> >>  			goto out;
>> >> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device=
 *wdev)
>> >> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>> >> >>  			}
>> >> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>> >> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> >> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> >> >>  				tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>> >> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>> >> >>  					tlmi_priv.pwd_nvme->index =3D
>> >> >> --
>> >> >> 2.52.0
>> >> >
>> >> > I'll defer to the pdx86 reviewers for this set of changes.
>> >> >
>> >> > This seems to me to make things more complicated than needed, pu=
rely=20
>> >> > to address a 100 column limit. I personally don't like the chang=
e.=20
>> >> >
>> >> > Nothing wrong with the code, and if more experienced maintainers=
 prefer it, I'm happy to defer to them. Otherwise it seems to me noise f=
or the sake of noise I'm afraid
>> >> >
>> >> > Mark
>> >>=20
>> >> An alternative could be to set this a constant pwd_admin to
>> >> tlmi_priv.pwd_admin. There are 13 other references to
>> >> tlmi_priv.pwd_admin in one function alone, so maybe it might be a =
more
>> >> meaningful improvement?
>> >
>> > Hi,
>> >
>> > The general theme in this driver seems to be that tlmi_priv.pwd_adm=
in=20
>> > usually causes long lines so introducing a local variable for it in=
 such=20
>> > functions would certainly help.
>> >
>> > This probably came to be when pwd_admin was migrated over into tlmi=
_priv=20
>> > which certainly was correct place for it, but case with the cost of=
 adding=20
>> > into the line lengths.
>> >
>>=20
>> In this case, would you prefer that a local variable for pwd_admin be
>> introduced instead of variables for values in the long lines?=20
>
> Mark who's the maintainer seems to be against it, so I don't want to s=
tep
> too strongly on his lot in this. It's merely my opinion how we normall=
y=20
> handle cases like this (I probably didn't express that clearly enough).
>

I don't have a strong opinion :) If it's business as usual, then it's fi=
ne and we can include it.

From my perspective, it would be useful to know if it's been tested on r=
eal HW, and (if so) which platforms. Unfortunately Thinkpad, ThinkCenter=
 and ThinkStation all use this module and all have their own little quir=
ks.=20
I'll do some testing here (soonish...) to confirm they're all still sane=
 after (they should be) and throw in a tested-by tag.

Mark
