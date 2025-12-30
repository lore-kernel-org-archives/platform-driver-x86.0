Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4F7E0E4
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767065091; cv=none; b=agEKdONwgNZ0fqaQA8m+I1ainJ4YMh72WhMTDtRlz6plSnFKcwMU5pLLJWduy0muzX3Q3YzKg2hA6GbLK43DYgLErguilaGlLqr0DpCRlSadHBn+KJaX7Y11J1IM1eCku+d1dStO72lcqN42vAnZvyQSYimWMrH0L40ZVoJ15DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767065091; c=relaxed/simple;
	bh=9XQdciCytJhAc71p6vjgd0nKeVEzMgkhP1l2A4GPfNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WCtTyfkjZcYQ9/MzZLbxvqr9IuoCKvYE9zTpDx0iq9jsfL82P1L31yRUmTwnv2velzQ7Jjrc5f27IouK8DsVSTWgRWpwd8f+4fX6IdTNzmj8vRr0DW71uLVCTS+O25bcBBecZHZBv4+aoaICqdEL6Tkpnk4aitleqAC1WFFcMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0txs+jk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0txs+jk"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8035e31d834so7065455b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 19:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767065089; x=1767669889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBDDXn0zo1TMjAj2Kmc85XzkuK69M0l2fFk+apAXil0=;
        b=S0txs+jkhcstekdVNQ3gu5bETt+JqTet5QwL1wpkk4Bf0iGKKVGiUhw3TD4QKx25I8
         9XnaWSGRfc5ry0SA5tvr5baTQIRCTIkst+m+QIU2rE2UwiDMANGkLVXP4cnLtxdw4Rbt
         Wo0UWU4nx+1GG67jhB/L24WmSIGR4eSt53QelK1/hszDNZDI13LmlU7MxJwc1kXqTDIi
         hkdR5uEV4sHRr47Ebv5LzV90YJjj2foOGxNg/R2FAhQNdqZI7R50BjcPiVt53795KhrU
         UdAib25u8PLi0Bii2iueLXI0g46MjWQpl1tVXsDcKdDiwDsPQyrYPRYuGwGobpi50V7B
         CU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767065089; x=1767669889;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kBDDXn0zo1TMjAj2Kmc85XzkuK69M0l2fFk+apAXil0=;
        b=KwMh0bUUrTAFaAwYsRCzDXE47BAMAXg1iGOEqf+EXHQfF0Qs5z6SNdhwqFN3i3qW9A
         LQBJWvck3XIIYoKNvqQl2GfTqYLiNfn2PUH+SwsRvup8ly0Ux9U/2/KdwLgGCiYUHrLf
         XloVF2XbWzaLCAjB7AQxDLjUK3cqnSAOUAP/qSOUzklb9zGSp0xzCUPItbPFVlKsSHiE
         hjlkljCk0fG37WWzZ98F9ZhxyLVSCOIdzbGww2H3hh61XC3GtGTE5RuvOssTXYmKF6/W
         OcC2EFhSwC6UjzJNuaYXk647zbfJ53G+oMxxL9Akn76OmpKeu374g8VysulHbLGFnWAy
         aWsA==
X-Gm-Message-State: AOJu0YzgguTHW0+VSDiz8bGXK8w8zbXJEXGpRSyecZs9ndtCj650CzJS
	n5tTOPis5Rcqo30Ubmn5MYC5AL4XtjepNufQJIwyJ7SRp0uwePq+caRF
X-Gm-Gg: AY/fxX46jkFj/NMyMTDY+Gbyt4cjwiYtXfl8+VG0kUtmqtD0EaPsQXdrqdln+sn6yHG
	VLUGEsYYvCRka/RlM/UojxmoeoOvx1DDpB5Bz6LZFi328T3+Tal7cMcG2MJHnRw7OFzwGiPqmJc
	+4iZfQj6+cyTqijQ5doe7nqVwGcs/j7Xxp2ivzNdcWV+ENItON9kidkMH8EpCwqSpH7P/arRMKH
	eG/U50VlGaGNpJo1snJ7/WE2vvrKm+3OWfOZVHzx+uVhhX6PGrj20YUd124c687czzFmGbPgkrO
	P/ia6FPBLMjxUBNpNupjIQ57iQ9F78UgRK21XOa6dUhBqqQjd/ZnZa156r/TFEExLURSQuy3ONV
	ejMbfwDVJ5X5TN7PnyGjp42VMZ7W94rU11qAZayrwitzVPstxDR+EYxa0zXl8vto3WcWG1a69ez
	DS2tC3GdIdVS+rSOwMm/oSXwrieRaWpaE=
X-Google-Smtp-Source: AGHT+IHFSchWpu3jBu742g2oby0FyMJZr9NqGx24qRFZFYxKxuGdmCLVIo2Pr+HQguIP/mLm9o/J+A==
X-Received: by 2002:a05:6a00:4295:b0:7ef:3f4e:9176 with SMTP id d2e1a72fcca58-7ff6735ea43mr29851157b3a.49.1767065088764;
        Mon, 29 Dec 2025 19:24:48 -0800 (PST)
Received: from localhost ([49.200.103.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797787sm30648650b3a.60.2025.12.29.19.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 19:24:48 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "Derek J . Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
In-Reply-To: <05eb6019-5ed5-463a-b556-27792ea43568@app.fastmail.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
 <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
 <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
 <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com>
 <877bu5gr48.fsf@gmail.com>
 <69c27b14-5943-eab1-407c-209d8d484bc1@linux.intel.com>
 <05eb6019-5ed5-463a-b556-27792ea43568@app.fastmail.com>
Date: Tue, 30 Dec 2025 08:54:45 +0530
Message-ID: <87344shcsi.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Mark Pearson" <mpearson-lenovo@squebb.ca> writes:

> On Mon, Dec 29, 2025, at 12:32 PM, Ilpo J=C3=A4rvinen wrote:
>> On Mon, 29 Dec 2025, Benjamin Philip wrote:
>>> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>>> > On Wed, 24 Dec 2025, Benjamin Philip wrote:
>>> >> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>>> >> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>>> >> >> This commit handles some column limit overflows (that occur after=
 fixing
>>> >> >> their alignment), i.e. the following check:
>>> >> >>
>>> >> >> CHECK: line length of ... exceeds 100 columns
>>> >> >>
>>> >> >> by defining a constant opt, and replacing the offending
>>> >> >> expression with opt.
>>> >> >>
>>> >> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>>> >> >> ---
>>> >> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++----=
------
>>> >> >>  1 file changed, 19 insertions(+), 12 deletions(-)
>>> >> >>
>>> >> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>>> >> >> b/drivers/platform/x86/lenovo/think-lmi.c
>>> >> >> index 1ada4d800383..07ba0d84720a 100644
>>> >> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
>>> >> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>>> >> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *=
kobj,
>>> >> >> struct kobj_attribute *attr,
>>> >> >>  }
>>> >> >>
>>> >> >>  static ssize_t current_value_store(struct kobject *kobj,
>>> >> >> -		struct kobj_attribute *attr,
>>> >> >> -		const char *buf, size_t count)
>>> >> >> +				   struct kobj_attribute *attr, const char *buf,
>>> >> >> +				   size_t count)
>>> >> >>  {
>>> >> >>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj=
);
>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>> >> >>  	char *auth_str =3D NULL;
>>> >> >> +	const char *opt;
>>> >> >>  	int ret;
>>> >> >>
>>> >> >>  	if (!tlmi_priv.can_set_bios_settings)
>>> >> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct=
 kobject *kobj,
>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>> >> >>  	} else { /* old non-opcode based authentication method (depreca=
ted) */
>>> >> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->p=
assword[0]) {
>>> >> >> +			opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>> >> >>  			auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>> >> >> -					tlmi_priv.pwd_admin->password,
>>> >> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>>> >> >> -					tlmi_priv.pwd_admin->kbdlang);
>>> >> >> +					     tlmi_priv.pwd_admin->password,
>>> >> >> +					     opt,
>>> >> >> +					     tlmi_priv.pwd_admin->kbdlang);
>>> >> >>  			if (!auth_str) {
>>> >> >>  				ret =3D -ENOMEM;
>>> >> >>  				goto out;
>>> >> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
>>> >> >> kobject *kobj, struct kobj_attribute *
>>> >> >>  				   const char *buf, size_t count)
>>> >> >>  {
>>> >> >>  	char *auth_str =3D NULL;
>>> >> >> +	const char *opt;
>>> >> >>  	int ret =3D 0;
>>> >> >>  	int cmd;
>>> >> >>
>>> >> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
>>> >> >> kobject *kobj, struct kobj_attribute *
>>> >> >>  			ret =3D tlmi_save_bios_settings("");
>>> >> >>  		} else { /* old non-opcode based authentication method (deprec=
ated) */
>>> >> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->=
password[0]) {
>>> >> >> +				opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>> >> >>  				auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>> >> >>  						     tlmi_priv.pwd_admin->password,
>>> >> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>>> >> >> +						     opt,
>>> >> >>  						     tlmi_priv.pwd_admin->kbdlang);
>>> >> >>  				if (!auth_str) {
>>> >> >>  					ret =3D -ENOMEM;
>>> >> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
>>> >> >> kobject *kobj, struct kobj_attribute *
>>> >> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(save_se=
ttings);
>>> >> >>
>>> >> >>  /* ---- Debug
>>> >> >> interface---------------------------------------------------------
>>> >> >> */
>>> >> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>>> >> >> kobj_attribute *attr,
>>> >> >> -				const char *buf, size_t count)
>>> >> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
>>> >> >> +			       struct kobj_attribute *attr, const char *buf,
>>> >> >> +			       size_t count)
>>> >> >>  {
>>> >> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>>> >> >>  	char *auth_str =3D NULL;
>>> >> >> +	const char *opt;
>>> >> >>  	int ret;
>>> >> >>
>>> >> >>  	if (!tlmi_priv.can_debug_cmd)
>>> >> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kob=
ject
>>> >> >> *kobj, struct kobj_attribute *attr
>>> >> >>  		return -ENOMEM;
>>> >> >>
>>> >> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->pa=
ssword[0]) {
>>> >> >> +		opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>>> >> >>  		auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>> >> >> -				tlmi_priv.pwd_admin->password,
>>> >> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>>> >> >> -				tlmi_priv.pwd_admin->kbdlang);
>>> >> >> +				     tlmi_priv.pwd_admin->password,
>>> >> >> +				     opt,
>>> >> >> +				     tlmi_priv.pwd_admin->kbdlang);
>>> >> >>  		if (!auth_str) {
>>> >> >>  			ret =3D -ENOMEM;
>>> >> >>  			goto out;
>>> >> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *=
wdev)
>>> >> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>> >> >>  			}
>>> >> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>> >> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>> >> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>> >> >>  				tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>>> >> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>> >> >>  					tlmi_priv.pwd_nvme->index =3D
>>> >> >> --
>>> >> >> 2.52.0
>>> >> >
>>> >> > I'll defer to the pdx86 reviewers for this set of changes.
>>> >> >
>>> >> > This seems to me to make things more complicated than needed, pure=
ly=20
>>> >> > to address a 100 column limit. I personally don't like the change.=
=20
>>> >> >
>>> >> > Nothing wrong with the code, and if more experienced maintainers p=
refer it, I'm happy to defer to them. Otherwise it seems to me noise for th=
e sake of noise I'm afraid
>>> >> >
>>> >> > Mark
>>> >>=20
>>> >> An alternative could be to set this a constant pwd_admin to
>>> >> tlmi_priv.pwd_admin. There are 13 other references to
>>> >> tlmi_priv.pwd_admin in one function alone, so maybe it might be a mo=
re
>>> >> meaningful improvement?
>>> >
>>> > Hi,
>>> >
>>> > The general theme in this driver seems to be that tlmi_priv.pwd_admin=
=20
>>> > usually causes long lines so introducing a local variable for it in s=
uch=20
>>> > functions would certainly help.
>>> >
>>> > This probably came to be when pwd_admin was migrated over into tlmi_p=
riv=20
>>> > which certainly was correct place for it, but case with the cost of a=
dding=20
>>> > into the line lengths.
>>> >
>>>=20
>>> In this case, would you prefer that a local variable for pwd_admin be
>>> introduced instead of variables for values in the long lines?=20
>>
>> Mark who's the maintainer seems to be against it, so I don't want to step
>> too strongly on his lot in this. It's merely my opinion how we normally=
=20
>> handle cases like this (I probably didn't express that clearly enough).
>>
>
> I don't have a strong opinion :) If it's business as usual, then it's fin=
e and we can include it.
>
> From my perspective, it would be useful to know if it's been tested on re=
al HW, and (if so) which platforms. Unfortunately Thinkpad, ThinkCenter and=
 ThinkStation all use this module and all have their own little quirks.=20
> I'll do some testing here (soonish...) to confirm they're all still sane =
after (they should be) and throw in a tested-by tag.
>
> Mark

Before you do that I can send a v2 with the parentheses changes removed.
If you can point to the tests in particular you run, I can test on a
Thinkpad as well before sending.

-- bp
