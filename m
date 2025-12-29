Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ABA1C3BFC
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767027645; cv=none; b=jN9Ksz/IQZa2xi/OpoEDbMCjAECT70Fkb9otUvz0ATgt3h1zLH0xzNkb/3JD1a7APIESxSzL/1xkJhWM3qvyoFKDV31AXHejAMY0efz/6/qhaOXEeV0Ymt5gKQO0MmmXBsRrN4VsGU6Q5AEWBaYCojN3/8uHwCTpFdRQQdseU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767027645; c=relaxed/simple;
	bh=25/+DMaUI+Oy3bW3JveBjB/WDzI73ZfjVMNYCwz4egg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c6dNB/ziuyboFqu6ucZb6EUW4QHCtyVTbfE7Jet7lxwBpDL6B3Z2QOZ1OGQRWxgvjtm7uBFByDkc8JCuABobA/ZYZj0rNqekUhA70OVo6qvghreSH6y+9tO2wMY2tKE3WnR1041haeuxJw4ccldK7blFpDyRqeGIN/nNS50d/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE5kxxEs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE5kxxEs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so9508990b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767027643; x=1767632443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0kipFOSyX/QmlqE7kiSqoflDWxw7lXHztGm+cuKF78=;
        b=eE5kxxEsckcy+Na1HDVfHJkiacurn9fPhCZsRUhQaUW2bPlEII6lHFMBLZOp4RnEvF
         O77CAtOqOXSMG8SgQ2osrot7dPb4mNbf7cwqb2dzbXitdedbVLMPz5b5lPLlfltn4mbF
         V4h6xwKqO7CPTB6Ha3v6vGjv3uILwab46N8z4XBZJXA7cLOagzemHHSyWkSiXlP3V615
         Gou+kpYlcF53snVZ67ZbyCafTLGE99U/nqdoiYNCEB0qCx5mKtCgALz9fGm4bX+InYql
         km2P4SgakLBKprjkA9NJ6QKXQHiBNUsmPqfRJmkspVJTOgZ76anZ1xostsW89nXcGurX
         LElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767027643; x=1767632443;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0kipFOSyX/QmlqE7kiSqoflDWxw7lXHztGm+cuKF78=;
        b=q9L/i5+M4oBJ7SOrizK0NpTlxJ/1n7d2fty4x08RhSDQC+mlxzj/DH7q7bPpfdoHix
         4OtCEUZm7lSfw7Mz3ZB6Gy4MrcwU4LwSdtMqVN8HomeuzOgUv6MDkSXkAVXetMsY7dgp
         zvTmLwdQtNZTVD91bF+UtXE31Vr9EMThrwbVMR2jqEEiHN9euu3kkVn2DamZzyxBaEcj
         LVkF9ZqoqfcjGXdCuB4qCa3gyKFkIpS8NCq56p9USZa3rkvawCSFdZkKPNqoGvQ1ZyW0
         qD1b00RzeVE4t9SGdQ+jCfXXtqz3DtJ46fOtU3WA8PIDvPpmjZ1cx8bKYpMT9Y7UAiu8
         IWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUajgKLNPko5UeQuMrWlKf7pd/iieZOUeOi6AZ92aTsBWSd8pxLcrNdfA/UgOtlkhsnPyop72XVsMiiPXkHO9QweQa9@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWypKsHCdHNWdE6c/nWmIQwYJTcUKIlfD5D6UZJtK3Ns+9ssN
	LJWsvuSg3KooTv0qwD79EXfcEuZgs/RlUvj0eijxhvo3/AZlOATkbo6X
X-Gm-Gg: AY/fxX4LeE3EistBC+VptjKXM+faqFcS9+VJ14Tdddva1gGjK7QtyhoQbkTJ5rGAFvL
	tuuVr/+gTpgPTXImVYZ8XyaZmVD+iJWmO7Gh12pn8M8B1KkVMCvNXO/3eLsyYnah1SZfRIFR6fZ
	OJCRSQqhvfafFRnZ+VWCupSM9CFKS+jv8/hD1fxMX9SE1EWzVMBNQNFBTL5RReXrRFbVkRK+lIE
	P0vgGOHl0COy7WFwnC3GvdBK2aYHvmm8Tj/9+Uejqj7mwYwt8BhdXAAXdAfOQQ3VfOZGQPs2HqD
	bFHxTK4j9RPIB/qsU84Ff5KNz0ZWvA68liEM3HSTLn0MTSov4u4tw7PuJfl0adjDVPp2AsICTGk
	qtHeFNnmL3LAZukWlYdGFJoyRgg4FlErmG7HQHLSSV9IqFEeGMxvyP+MIIjm4ERC/AfiKJQXbmf
	L5alLgNLUokj1WCEWULL+mXGClZvrgUA==
X-Google-Smtp-Source: AGHT+IHi/uCQxWr0OI9Jhn33vJs1LQLxjHLajerf3EgkyZqBW9hMCrMyy24A5hI/kmfmuLCAmzPhcA==
X-Received: by 2002:a05:6a20:a128:b0:366:14ac:e1f2 with SMTP id adf61e73a8af0-376aa1e793fmr31849114637.68.1767027642386;
        Mon, 29 Dec 2025 09:00:42 -0800 (PST)
Received: from localhost ([122.171.17.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93b41fsm29813298b3a.13.2025.12.29.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:00:41 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "Derek J . Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
In-Reply-To: <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
 <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
 <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
 <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
 <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com>
Date: Mon, 29 Dec 2025 22:30:39 +0530
Message-ID: <877bu5gr48.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> On Wed, 24 Dec 2025, Benjamin Philip wrote:
>> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
>> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>> >> This commit handles some column limit overflows (that occur after fix=
ing
>> >> their alignment), i.e. the following check:
>> >>
>> >> CHECK: line length of ... exceeds 100 columns
>> >>
>> >> by defining a constant opt, and replacing the offending
>> >> expression with opt.
>> >>
>> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>> >> ---
>> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++--------=
--
>> >>  1 file changed, 19 insertions(+), 12 deletions(-)
>> >>
>> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>> >> b/drivers/platform/x86/lenovo/think-lmi.c
>> >> index 1ada4d800383..07ba0d84720a 100644
>> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
>> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *kobj,
>> >> struct kobj_attribute *attr,
>> >>  }
>> >>
>> >>  static ssize_t current_value_store(struct kobject *kobj,
>> >> -		struct kobj_attribute *attr,
>> >> -		const char *buf, size_t count)
>> >> +				   struct kobj_attribute *attr, const char *buf,
>> >> +				   size_t count)
>> >>  {
>> >>  	struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj);
>> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>> >>  	char *auth_str =3D NULL;
>> >> +	const char *opt;
>> >>  	int ret;
>> >>
>> >>  	if (!tlmi_priv.can_set_bios_settings)
>> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct kob=
ject *kobj,
>> >>  			ret =3D tlmi_save_bios_settings("");
>> >>  	} else { /* old non-opcode based authentication method (deprecated)=
 */
>> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->passw=
ord[0]) {
>> >> +			opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>> >>  			auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> >> -					tlmi_priv.pwd_admin->password,
>> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>> >> -					tlmi_priv.pwd_admin->kbdlang);
>> >> +					     tlmi_priv.pwd_admin->password,
>> >> +					     opt,
>> >> +					     tlmi_priv.pwd_admin->kbdlang);
>> >>  			if (!auth_str) {
>> >>  				ret =3D -ENOMEM;
>> >>  				goto out;
>> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
>> >> kobject *kobj, struct kobj_attribute *
>> >>  				   const char *buf, size_t count)
>> >>  {
>> >>  	char *auth_str =3D NULL;
>> >> +	const char *opt;
>> >>  	int ret =3D 0;
>> >>  	int cmd;
>> >>
>> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
>> >> kobject *kobj, struct kobj_attribute *
>> >>  			ret =3D tlmi_save_bios_settings("");
>> >>  		} else { /* old non-opcode based authentication method (deprecated=
) */
>> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->pass=
word[0]) {
>> >> +				opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>> >>  				auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> >>  						     tlmi_priv.pwd_admin->password,
>> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>> >> +						     opt,
>> >>  						     tlmi_priv.pwd_admin->kbdlang);
>> >>  				if (!auth_str) {
>> >>  					ret =3D -ENOMEM;
>> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
>> >> kobject *kobj, struct kobj_attribute *
>> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(save_settin=
gs);
>> >>
>> >>  /* ---- Debug
>> >> interface---------------------------------------------------------
>> >> */
>> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>> >> kobj_attribute *attr,
>> >> -				const char *buf, size_t count)
>> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
>> >> +			       struct kobj_attribute *attr, const char *buf,
>> >> +			       size_t count)
>> >>  {
>> >>  	char *set_str =3D NULL, *new_setting =3D NULL;
>> >>  	char *auth_str =3D NULL;
>> >> +	const char *opt;
>> >>  	int ret;
>> >>
>> >>  	if (!tlmi_priv.can_debug_cmd)
>> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kobject
>> >> *kobj, struct kobj_attribute *attr
>> >>  		return -ENOMEM;
>> >>
>> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->passwo=
rd[0]) {
>> >> +		opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
>> >>  		auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> >> -				tlmi_priv.pwd_admin->password,
>> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>> >> -				tlmi_priv.pwd_admin->kbdlang);
>> >> +				     tlmi_priv.pwd_admin->password,
>> >> +				     opt,
>> >> +				     tlmi_priv.pwd_admin->kbdlang);
>> >>  		if (!auth_str) {
>> >>  			ret =3D -ENOMEM;
>> >>  			goto out;
>> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
>> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>> >>  			}
>> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> >>  				tlmi_priv.pwd_nvme->pwd_enabled =3D true;
>> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>> >>  					tlmi_priv.pwd_nvme->index =3D
>> >> --
>> >> 2.52.0
>> >
>> > I'll defer to the pdx86 reviewers for this set of changes.
>> >
>> > This seems to me to make things more complicated than needed, purely=20
>> > to address a 100 column limit. I personally don't like the change.=20
>> >
>> > Nothing wrong with the code, and if more experienced maintainers prefe=
r it, I'm happy to defer to them. Otherwise it seems to me noise for the sa=
ke of noise I'm afraid
>> >
>> > Mark
>>=20
>> An alternative could be to set this a constant pwd_admin to
>> tlmi_priv.pwd_admin. There are 13 other references to
>> tlmi_priv.pwd_admin in one function alone, so maybe it might be a more
>> meaningful improvement?
>
> Hi,
>
> The general theme in this driver seems to be that tlmi_priv.pwd_admin=20
> usually causes long lines so introducing a local variable for it in such=
=20
> functions would certainly help.
>
> This probably came to be when pwd_admin was migrated over into tlmi_priv=
=20
> which certainly was correct place for it, but case with the cost of addin=
g=20
> into the line lengths.
>

In this case, would you prefer that a local variable for pwd_admin be
introduced instead of variables for values in the long lines?=20

>> Then again, the question arises why we aren't following the same pattern
>> for all the other heavily used fields under tlmi_priv. Adding more
>> constants seems to be wrong way forward.
>
> Locally it might make sense on case by case basis, to me it looks=20
> business as usual to store things into function local vars to control=20
> deref line lengths.
>
>> Another option would be to move repeated functionality into other
>> functions (all the column limit violations seem to be identical and
>> involve encoding_options and kasprintf in the same way), but a refactor
>> of this nature seemed *way* beyond the scope of a simple code syle clean
>> up.
>>=20
>> Thus, assigning the required value to a small constant seemed to be the
>> best immediate solution. I can see why you feel it adds complexity.
>> Typically in a dynamic language (or even in a declare-as-you-need code
>> style in C) this is a trivial change, whereas in a top-of-block style
>> this does seem to add some cruft.
>>=20
>> Perhaps we should drop this patch for now? Nevertheless, I think the
>> column limit violations, long functions, and repeated lines are a sign
>> that some refactoring is in order.
>>=20
>> Thoughts?
>
> As a general note on these changes, I'm wondering if you're planning on=20
> doing these checkpatch cleanups for a large number of drivers beyond thos=
e=20
> you've already submitted (which you likely won't be able to test for=20
> real)?
>
> I'm asking this because "fixing" in-tree checkpatch errors/warnings is=20
> generally not considered something one should be doing without other work=
=20
> on the particular drivers (which normally implies proper testing beyond=20
> compiling). Checkpatch has its uses, but this is not one of them.
>
> --=20
>  i.

As of right now, I planned to send a checkpatch cleanup for
thinkpad-acpi at something point, but nothing more than that. I
understand why any fixes imply proper testing. In the case of this
patchset I can definitely test the changes, since the machine I created
these patches uses this driver.

I would have thought that checkpatch "fixes" would have some value alone
(although minimal). I'm guessing you do not encourage coccinelle, sparse
or kasan "fixes" without prior work as well?

I'm sorry if these cleanups have been just noise and a misuse of
checkpatch. My intention with these patches was to get a feel for the
development process, the code base and the tooling before moving
towards any "real" contributions.

-- bp
