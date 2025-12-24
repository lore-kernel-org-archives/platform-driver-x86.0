Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269632FA33
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576673; cv=none; b=iPFSodOr97ea3KIXFCSsIvcJRLxZKEMmYKIutDdqo05zqx2pjIhtAv6gc6uHo4Vd48UZ62kR23EV4fOIa2JuJKAB5dmJvH2rDHujyUamyj1suQxcj6xbuJ00En4gSkFfevAWZgOJiXIn8UmMff29DytkFILAaQdxn0Ouyc1o2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576673; c=relaxed/simple;
	bh=ZCG0kLeihQ11Tt+XvE5puYUQgOExSFDu4k8/qB0LMTk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMSN8vt5BU3mjieU8AVHCL5Hyh0DGVNi7yUrVM2Rwh7H6bOyzJq7OXfMXNqbmjMcRS7voeCg3STFpvFfvFEuzTMFw4eRt5f5r2qy/zlMTFjv6zyOWVkTKUZbJfUE27pv6c1eGAkLJNSmWfiO3FkZxRLQJTbjpnPKBLLarvXB7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vbh2uRRd; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vbh2uRRd"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37fccf7035aso47745061fa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 03:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766576670; x=1767181470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQpg98LuzzOr80/w9x7FZeu9zCg/gxqgklts1jEHpB8=;
        b=Vbh2uRRdqk8W6Xh8QAK63YWmNg1W7xmxgiqY+oo0C2EgYcr0sn4/1SN6iWI2y/Ua2f
         Dyb5Grj3ry7gqfoNn/XqaZRgJacL9L+LchOr4n0Qiny4Xqi9jYPCY4S0BE+XdLJseKj+
         uZnmyAjrJFRII4f96mca08HeEPzKaf8VfwX3UJPWoMne/QgEWrZjHnyCUquruO18DqLV
         H/lqDh4Y7I+BP999s02hoBcvbBr6AhZlxljxaIavujEYQ5l0o73P7FlpSdGgAvdSf98c
         JVyJJXCy10F4FqdSxn1iJ1XAaCj1YQWpkaz8oUbwOS/eIfcLRtre7XYhGfAGwFw0W6Rg
         ZK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576670; x=1767181470;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQpg98LuzzOr80/w9x7FZeu9zCg/gxqgklts1jEHpB8=;
        b=sooLxEaD3h61tpi4Vb1NgnGmOXx0Gk0D38P6pDvdYyNynz7ZUPBWfbmkK6IprSNHg1
         p57Y4A/RjAuzAeXsLpAOgolMb7JuLViY10cno2HpJVDLgk3AlOJivkWOl0o2ez2eQ7E3
         3mFKPA44bmRqObyFYXSF3DMWSs08vWyOXmtfbzLHoNw/JWpIkd+TdH4ApBE+0pan25t+
         gjdKSZTmdMjQ68eHeOSTw/UsbXK4RJypeksE2P3UG9er7blMM0g2/BFyP6VAYe/8/s30
         Dl5OMLiUjYnTibUzYNakKg97vLOgrT7YSrKFAp1qd3yZwz57NV4E5lwGTwIEyHMTQoVF
         ipNg==
X-Forwarded-Encrypted: i=1; AJvYcCU3UvpNByF9aU6thOPaktduAazRuVCaDBWd7WpTrVKQd9uRo2XWf6hnzAXb+JjcSX82LJ9Y/eieU4ICDktBpDqtrjUK@vger.kernel.org
X-Gm-Message-State: AOJu0YznjLoPH5q/O6qI7Q57BEwlWBitfyWTSYO2WtAq7L2AxAy+ohL4
	1xtx2mDcOjrDvPU6B716CaVq40iraDkODwWXHtgL82ageOz0hLvnfcWbvhEa4qW4MGypeZQ/XEg
	W+ST9Xkxpu5lHduhFfxNMaEJRCfoTOt8=
X-Gm-Gg: AY/fxX6d1Vytp5tCCEQ2JoTMhIW/ocrY8i4/hW4QmOfPWfNhqFCuxoNbfUKoq8qUo/H
	xgYrlPCuPUg3quMyzNsIaaFBfVOXpRNP1QzUlJzeW07kSqGmyYSdSlUJdKAkS6H2Ds4EszLSaFL
	+kakX4ywgg++oYGbOvbFCXlZQ+Vx9K0/QqytAl3aB9/yFSwSNocffvscoK9v2CxV9Bx5Iz6uxdq
	gn550Yfar+ZrDQyKNtBwkRWo7E1+Z9GBE17vcVtJFQCpN/i/vyur4ZE9EcPMe0XIPVuFYQ=
X-Google-Smtp-Source: AGHT+IHUhcGGVKGZqlBbern4YhsIk8FCDd20JU4TLgbhdUSXCPTXMubooKcvqiWEnLPIzuvWkzfER0lC7cc5M1ek1K0=
X-Received: by 2002:a05:651c:b23:b0:380:d5f:1b04 with SMTP id
 38308e7fff4ca-3812162218cmr51206941fa.21.1766576669727; Wed, 24 Dec 2025
 03:44:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Dec 2025 11:44:29 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Dec 2025 11:44:29 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
In-Reply-To: <ca3cca35-9f30-4c77-87c2-7ac3ec85d2dd@app.fastmail.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com> <CAMEXYWdFn05=kx-NYejm4nznbKQahHUJJDesc_W1OKk_X3OOgg@mail.gmail.com>
 <ca3cca35-9f30-4c77-87c2-7ac3ec85d2dd@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Dec 2025 11:44:29 +0000
X-Gm-Features: AQt7F2oNsHgtn6xfc9oD-9i9D7QlRVB0MAXcg0rGYHkzFEcyvswicHwxef4ruDI
Message-ID: <CAMEXYWfXFFyzQ65tGsBjYkecFCnB568531KEXoV5+Q1TksR0Zw@mail.gmail.com>
Subject: Re: [PATCH 2/5] platform/x86: think-lmi: Remove unnecessary parens
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

"Mark Pearson" <mpearson-lenovo@squebb.ca> writes:

> On Tue, Dec 23, 2025, at 2:23 PM, Benjamin Philip wrote:
>> This commit removes any unnecessary parentheses as flagged by
>> checkpatch in the following check:
>>
>> CHECK: Unnecessary parentheses around '...'
>>
>
> Shouldn't you mention that you also corrected pieces of code alignment here too?
>

I must have included them in by accident, since they share the same hunk
as a parens fix. Maybe splitting the hunk and then moving the alignment
changes to the last patch would be better?

>> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/think-lmi.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>> b/drivers/platform/x86/lenovo/think-lmi.c
>> index 540b472b1bf3..1fac8986d077 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.c
>> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> @@ -440,7 +440,7 @@ static ssize_t current_password_store(struct kobject *kobj,
>>
>>  	pwdlen = strlen(buf);
>>  	/* pwdlen == 0 is allowed to clear the password */
>> -	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
>> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen))
>>  		return -EINVAL;
>>
>>  	strscpy(setting->password, buf, setting->maxlen);
>> @@ -476,7 +476,7 @@ static ssize_t new_password_store(struct kobject *kobj,
>>
>>  	pwdlen = strlen(new_pwd);
>>  	/* pwdlen == 0 is allowed to clear the password */
>> -	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {
>> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen)) {
>>  		ret = -EINVAL;
>>  		goto out;
>>  	}
>> @@ -859,7 +859,7 @@ static ssize_t certificate_store(struct kobject *kobj,
>>  			signature = setting->signature;
>>  	} else { /* Cert install */
>>  		/* Check if SMC and SVC already installed */
>> -		if ((setting == tlmi_priv.pwd_system) &&
>> tlmi_priv.pwd_admin->cert_installed) {
>> +		if (setting == tlmi_priv.pwd_system && tlmi_priv.pwd_admin->cert_installed) {
>>  			/* This gets treated as a cert update */
>>  			install_mode = TLMI_CERT_UPDATE;
>>  			signature = tlmi_priv.pwd_admin->signature;
>> @@ -881,7 +881,7 @@ static ssize_t certificate_store(struct kobject *kobj,
>>  	} else {
>>  		/* This is a fresh install */
>>  		/* To set admin cert, a password must be enabled */
>> -		if ((setting == tlmi_priv.pwd_admin) &&
>> +		if (setting == tlmi_priv.pwd_admin &&
>>  		    (!setting->pwd_enabled || !setting->password[0])) {
>>  			kfree(new_cert);
>>  			return -EACCES;
>> @@ -965,13 +965,13 @@ static ssize_t save_signature_store(struct kobject *kobj,
>>  static struct kobj_attribute auth_save_signature = __ATTR_WO(save_signature);
>>
>>  static umode_t auth_attr_is_visible(struct kobject *kobj,
>> -					     struct attribute *attr, int n)
>> +				    struct attribute *attr, int n)
>>  {
>>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>>
>>  	/* We only want to display level and index settings on HDD/NVMe */
>>  	if (attr == &auth_index.attr || attr == &auth_level.attr) {
>> -		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
>> +		if (setting == tlmi_priv.pwd_hdd || setting == tlmi_priv.pwd_nvme)
>>  			return attr->mode;
>>  		return 0;
>>  	}
>> @@ -985,8 +985,8 @@ static umode_t auth_attr_is_visible(struct kobject *kobj,
>>  		if (tlmi_priv.certificate_support) {
>>  			if (setting == tlmi_priv.pwd_admin)
>>  				return attr->mode;
>> -			if ((tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT) &&
>> -			    (setting == tlmi_priv.pwd_system))
>> +			if (tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT &&
>> +			    setting == tlmi_priv.pwd_system)
>>  				return attr->mode;
>>  		}
>>  		return 0;
>> @@ -1216,13 +1216,13 @@ static struct kobj_attribute attr_current_val
>> = __ATTR_RW_MODE(current_value, 06
>>
>>  static struct kobj_attribute attr_type = __ATTR_RO(type);
>>
>> -static umode_t attr_is_visible(struct kobject *kobj,
>> -					     struct attribute *attr, int n)
>> +static umode_t attr_is_visible(struct kobject *kobj, struct attribute *attr,
>> +			       int n)
>>  {
>>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>>
>>  	/* We don't want to display possible_values attributes if not available */
>> -	if ((attr == &attr_possible_values.attr) && (!setting->possible_values))
>> +	if (attr == &attr_possible_values.attr && !setting->possible_values)
>>  		return 0;
>>
>>  	return attr->mode;
>> --
>> 2.52.0
>
> I prefer the brackets as they were - for me it's clearer and removing them adds little value.
> But the changes are fine, and I guess it's preferred overall by kernel community, so shrug.
>

I find the previous style clearer too, and I agree that this change
comes down to pedantry and offer no real readability improvements.
Nevertheless, I think there's value in enforcing consistency and the
popular preference.

Note to Mark: Resent with the Cc: list included. Ignore the private
copy. I'm still ironing out my notmuch-emacs config :)

-- bp

> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
