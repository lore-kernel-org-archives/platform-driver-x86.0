Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A527874F
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727992; cv=none; b=aHDmHiDidIGldoU2+gaayQjniJigf4758mCNF87PSIQzNrxdF/oIcBFjiJVj3pIv/IE7baSHPVYobdt1y/7RURlE9HEr/VYTPVjo3ijgRGz3xXbtptNpl87Ld2e8SCxCkdyfs6iaXeDtYo7NsftP/MrnDlOTIca8njT2K8KjoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727992; c=relaxed/simple;
	bh=6jw/u5vIH35R8qLlvE3Um0akFrmXA2vW4+cLjyA378s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8Xk0NTC7KQWKaxgGdTSDbdfmOtm82z65JEljiV8deqC3wfRvzS5ydyGYHgsmdc9YPkYaV3PM5wc6ANDQqho/TeYkdyn8Ja7mnhqqJsgzfJosqqkQJx9YF8BcuRX49xsHnYEtEoV7y5mB9WRIrd8e+2+YVgczXV8dqudludLUwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke2sthrl; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke2sthrl"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b495ce059so11160841fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jan 2026 11:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727986; x=1768332786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q08Z5VZdPB//J6wj/XVZiP37K2TzNmSwnPy71Piw6vE=;
        b=Ke2sthrly7Wyy1db8F9qXfUreDmF/8KEs/CU8V70M3FSNKhmky4O6oIOUTt0j3UyAR
         hAtD3b4BW2l5SgDGEQdspR/WBl7tm32Newd8uW1T13hyrSssrD2ONxE2Z/mxthL5oFp8
         yrpXRgpNVM8khPMTv2SFGmT+Iirfxygt/BxjjppthBUm1p4B3XZIDsAxLAi6etTDDepD
         zclOe7/7fjFYi8AKrPYvodj3KbRu6km2jOpamzo2KgZnhhV+GQ2201hiBDkLIIXR3PuS
         xKKItOcK4cDXHvqgCOvtobwCTi6QQKV0IUqU+kOjbGKtDYM0Jv12GBtlCFgx7QFL2IQg
         GZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727986; x=1768332786;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q08Z5VZdPB//J6wj/XVZiP37K2TzNmSwnPy71Piw6vE=;
        b=Q+qslGUYVaYxB6B9pW63/RnNXEAu+GRWntlvMcDHm84vXabqn5/Jm3harb/DLK8kzS
         wioWVcn80Oj82u2QK9+SSzbd/jLOW4oxcVlajTOBztDTqQEo3QN/QB3ff6m5ddNqtwee
         aN0xqEnUANQ+7cdxUaLEW4OPCM4NgJcSy5pgDY7m49z2zMECPI7DisQZufjmCXthklfw
         4XEWS5MOnQT5aysDfOvXwPWwHvuEbfzq7cxC4AU+qrYfB+791paNE9qlE/xSz31o1Kfa
         WUy/fktPkyXrbKoCjy2bx4InoiSkVzNmPQpDgoKX89zERsNMDUVnIwMyOwBAWKs+bpLl
         2Hxg==
X-Gm-Message-State: AOJu0Yya91UqctHzIDdHJ2HWajD49UgPGsxFmaHfQhUAk1b78jgFuwKy
	OIAQqyDe8VEddp+f/QB1FY4AiVxwz2eDAUHX9ZImPh1nSGuFcYpSAbqLxSCeWCWoD0TKtLXlKD4
	RyN2QQ7dnmFQtPgVpxG/u+Y+PVlbSqDU=
X-Gm-Gg: AY/fxX7IoCC+2Rn0wEtKs8yKKL7Ro8HDY0nFbT6Z5b4HArKmMtrwKj9m24je5tMDC+j
	M64b1EEuq3OWYnlh3XHPCyuKP/wI36JyFE8nh2DKafD0gmrybT0isEnvQRePggq7BnyRmzyoYjF
	Hgnp8Ouddm9F79oi1SWM9f650FENhkvRZpfqis6CxP7eJCp1vgDpqghEy4z5LYrexwsj3iKSUU0
	lHL591E0sLENyJt/ndJKMd55zv0BXghNUUpMhS0IeQ0fmcxviztMIH8EM/6NsPGjPl1uQ==
X-Google-Smtp-Source: AGHT+IGJkbnYhVEP42Cvj26qWbuWoU7P5jTfKOjb9NoouK0+ehnxZlIU9wtrW4bXRDxbOIo8+Up49EY2kHhBYQRdt8A=
X-Received: by 2002:a2e:a88a:0:b0:37f:d910:e3e8 with SMTP id
 38308e7fff4ca-382ff843ce8mr190931fa.38.1767727986045; Tue, 06 Jan 2026
 11:33:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 14:33:05 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 14:33:05 -0500
From: Benjamin Philip <benjamin.philip495@gmail.com>
In-Reply-To: <d182f05e-2a26-4f0a-af2f-dcecee25fc95@app.fastmail.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com> <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
 <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com> <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
 <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com> <877bu5gr48.fsf@gmail.com>
 <69c27b14-5943-eab1-407c-209d8d484bc1@linux.intel.com> <05eb6019-5ed5-463a-b556-27792ea43568@app.fastmail.com>
 <87344shcsi.fsf@gmail.com> <d182f05e-2a26-4f0a-af2f-dcecee25fc95@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 6 Jan 2026 14:33:05 -0500
X-Gm-Features: AQt7F2r4kwFKEmtDd-vMwsEMSOVmpWtyv3nTKz1je2MG-KfI6Wp2GkQhnbXe1nU
Message-ID: <CAMEXYWfmHDr_WqjGd5u7MPF4=MyNnLuDrcL6p+1JzSrtB7spKw@mail.gmail.com>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Mark Pearson" <mpearson-lenovo@squebb.ca> writes:

> On Mon, Dec 29, 2025, at 10:24 PM, Benjamin Philip wrote:
>> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>>
>>> On Mon, Dec 29, 2025, at 12:32 PM, Ilpo J=C3=A4rvinen wrote:
>>>> On Mon, 29 Dec 2025, Benjamin Philip wrote:
>>>>> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>>>>> > On Wed, 24 Dec 2025, Benjamin Philip wrote:
>>>>> >> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>>>>> >> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>>>>> >> >> This commit handles some column limit overflows (that occur aft=
er fixing
>>>>> >> >> their alignment), i.e. the following check:
>>>>> >> >>
>>>>> >> >> CHECK: line length of ... exceeds 100 columns
>>>>> >> >>
>>>>> >> >> by defining a constant opt, and replacing the offending
>>>>> >> >> expression with opt.
>>>>> >> >>
>>>>> >> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>>>>> >> >> ---
>>>>> >> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++--=
--------
>>>>> >> >>  1 file changed, 19 insertions(+), 12 deletions(-)
>>>>> >> >>
>>>>> >> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>>>>> >> >> b/drivers/platform/x86/lenovo/think-lmi.c
>>>>> >> >> index 1ada4d800383..07ba0d84720a 100644
>>>>> >> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
>>>>> >> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>>>>> >> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject=
 *kobj,
>>>>> >> >> struct kobj_attribute *attr,
>>>>> >> >>  }
>>>>> >> >>
>>>>> >> >>  static ssize_t current_value_store(struct kobject *kobj,
>>>>> >> >> -		struct kobj_attribute *attr,
>>>>> >> >> -		const char *buf, size_t count)
>>>>> >> >> +				   struct kobj_attribute *attr, const char *buf,
>>>>> >> >> +				   size_t count)
>>>>> >> >>  {
>>>>> >> >>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(ko=
bj);
>>>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>>>> >> >>  	char *auth_str =3D NULL;
>>>>> >> >> +	const char *opt;
>>>>> >> >>  	int ret;
>>>>> >> >>
>>>>> >> >>  	if (!tlmi_priv.can_set_bios_settings)
>>>>> >> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(stru=
ct kobject *kobj,
>>>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>>>> >> >>  	} else { /* old non-opcode based authentication method (depre=
cated) */
>>>>> >> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin-=
>password[0]) {
>>>>> >> >> +			opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>>> >> >>  			auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>>> >> >> -					tlmi_priv.pwd_admin->password,
>>>>> >> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>>>>> >> >> -					tlmi_priv.pwd_admin->kbdlang);
>>>>> >> >> +					     tlmi_priv.pwd_admin->password,
>>>>> >> >> +					     opt,
>>>>> >> >> +					     tlmi_priv.pwd_admin->kbdlang);
>>>>> >> >>  			if (!auth_str) {
>>>>> >> >>  				ret =3D -ENOMEM;
>>>>> >> >>  				goto out;
>>>>> >> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
>>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>>> >> >>  				   const char *buf, size_t count)
>>>>> >> >>  {
>>>>> >> >>  	char *auth_str =3D NULL;
>>>>> >> >> +	const char *opt;
>>>>> >> >>  	int ret =3D 0;
>>>>> >> >>  	int cmd;
>>>>> >> >>
>>>>> >> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struc=
t
>>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>>>> >> >>  		} else { /* old non-opcode based authentication method (depr=
ecated) */
>>>>> >> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin=
->password[0]) {
>>>>> >> >> +				opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>>> >> >>  				auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>>> >> >>  						     tlmi_priv.pwd_admin->password,
>>>>> >> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>>>>> >> >> +						     opt,
>>>>> >> >>  						     tlmi_priv.pwd_admin->kbdlang);
>>>>> >> >>  				if (!auth_str) {
>>>>> >> >>  					ret =3D -ENOMEM;
>>>>> >> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(stru=
ct
>>>>> >> >> kobject *kobj, struct kobj_attribute *
>>>>> >> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(save_=
settings);
>>>>> >> >>
>>>>> >> >>  /* ---- Debug
>>>>> >> >> interface------------------------------------------------------=
---
>>>>> >> >> */
>>>>> >> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>>>>> >> >> kobj_attribute *attr,
>>>>> >> >> -				const char *buf, size_t count)
>>>>> >> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
>>>>> >> >> +			       struct kobj_attribute *attr, const char *buf,
>>>>> >> >> +			       size_t count)
>>>>> >> >>  {
>>>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>>>> >> >>  	char *auth_str =3D NULL;
>>>>> >> >> +	const char *opt;
>>>>> >> >>  	int ret;
>>>>> >> >>
>>>>> >> >>  	if (!tlmi_priv.can_debug_cmd)
>>>>> >> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct k=
object
>>>>> >> >> *kobj, struct kobj_attribute *attr
>>>>> >> >>  		return -ENOMEM;
>>>>> >> >>
>>>>> >> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->=
password[0]) {
>>>>> >> >> +		opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>>>> >> >>  		auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>>>> >> >> -				tlmi_priv.pwd_admin->password,
>>>>> >> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>>>>> >> >> -				tlmi_priv.pwd_admin->kbdlang);
>>>>> >> >> +				     tlmi_priv.pwd_admin->password,
>>>>> >> >> +				     opt,
>>>>> >> >> +				     tlmi_priv.pwd_admin->kbdlang);
>>>>> >> >>  		if (!auth_str) {
>>>>> >> >>  			ret =3D -ENOMEM;
>>>>> >> >>  			goto out;
>>>>> >> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device=
 *wdev)
>>>>> >> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>>> >> >>  			}
>>>>> >> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>>> >> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>> >> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>> >> >>  				tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>>>>> >> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>>> >> >>  					tlmi_priv.pwd_nvme->index =3D
>>>>> >> >> --
>>>>> >> >> 2.52.0
>>>>> >> >
>>>>> >> > I'll defer to the pdx86 reviewers for this set of changes.
>>>>> >> >
>>>>> >> > This seems to me to make things more complicated than needed, pu=
rely
>>>>> >> > to address a 100 column limit. I personally don't like the chang=
e.
>>>>> >> >
>>>>> >> > Nothing wrong with the code, and if more experienced maintainers=
 prefer it, I'm happy to defer to them. Otherwise it seems to me noise for =
the sake of noise I'm afraid
>>>>> >> >
>>>>> >> > Mark
>>>>> >>
>>>>> >> An alternative could be to set this a constant pwd_admin to
>>>>> >> tlmi_priv.pwd_admin. There are 13 other references to
>>>>> >> tlmi_priv.pwd_admin in one function alone, so maybe it might be a =
more
>>>>> >> meaningful improvement?
>>>>> >
>>>>> > Hi,
>>>>> >
>>>>> > The general theme in this driver seems to be that tlmi_priv.pwd_adm=
in
>>>>> > usually causes long lines so introducing a local variable for it in=
 such
>>>>> > functions would certainly help.
>>>>> >
>>>>> > This probably came to be when pwd_admin was migrated over into tlmi=
_priv
>>>>> > which certainly was correct place for it, but case with the cost of=
 adding
>>>>> > into the line lengths.
>>>>> >
>>>>>
>>>>> In this case, would you prefer that a local variable for pwd_admin be
>>>>> introduced instead of variables for values in the long lines?
>>>>
>>>> Mark who's the maintainer seems to be against it, so I don't want to s=
tep
>>>> too strongly on his lot in this. It's merely my opinion how we normall=
y
>>>> handle cases like this (I probably didn't express that clearly enough)=
.
>>>>
>>>
>>> I don't have a strong opinion :) If it's business as usual, then it's f=
ine and we can include it.
>>>
>>> From my perspective, it would be useful to know if it's been tested on =
real HW, and (if so) which platforms. Unfortunately Thinkpad, ThinkCenter a=
nd ThinkStation all use this module and all have their own little quirks.
>>> I'll do some testing here (soonish...) to confirm they're all still san=
e after (they should be) and throw in a tested-by tag.
>>>
>>> Mark
>>
>> Before you do that I can send a v2 with the parentheses changes removed.
>> If you can point to the tests in particular you run, I can test on a
>> Thinkpad as well before sending.
>>
> OK.
> Testing - nothing too exciting, just check that everything shows up under=
 /sys/class/firmware-attributes and check a setting can be changed back/for=
th.
>
> Mark

If you're just testing the sysfs interface, why not write a kselftest?

On a side note, looking at tools/testing/selftests/drivers/platform/x86/
I noticed that there are only tests for some intel driver. Am I missing
something here? Have tests for all the other drivers been left out due
to time/resource constraints, or is there some other reason?

-- bp
