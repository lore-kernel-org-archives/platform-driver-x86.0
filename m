Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D33090FF
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576004; cv=none; b=bZ+fIjlrcwnCZKNR7RzDAllozS3sCquNCG3VcR6RPi7C+I9r5jWLFkkKtq4x8IzIz4TYRpsQF2vSRiLhjKJLh9whXJRzu/Y+d75biEnQgnUyn82CeYRZgTt11D/69UNW2zW3k5SZLKhG4MHO3/QAM9/GLhhRU41MkManW/Xl4W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576004; c=relaxed/simple;
	bh=rbo5nMJSwgGFUXNPpqBM4A3bkW7GHCprfG2RrSmaZJo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ws2s4tUQYn86qdLPCORtXye+PIc4Eaec+Cz/YdzvtMjrlVC4HuPfEIdrzgps8y+hZ+gYT3tlzhC3QXIrhkjhyN+I1SgSVsIZd849CRXthEBfm5wULnyCnddLdchamTD0y0FddUDFHXzZoEq/j2DU4cl71ALZZMWC8XhTHf6ZqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHqaU9jx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHqaU9jx"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5942b58ac81so5054134e87.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766576001; x=1767180801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ1KV9C/f/PiFx/DNrtIQveUhvwKbDLgrTookKgtC/U=;
        b=DHqaU9jxQGRC2Ls8R/gEXNJDGTiOspm8SpQ2v4Yt4R4rs8/PWjJSFyN1+CVnt7vN1D
         200gXFLWwi6dDKgCtLg1KP1VQxHQh0Zx/KZIExoZNJ/ro30mTjQHBMkOtU/pkzNYV2qF
         QvgYvqNpm/rgnsswbOnhCYrbXF3WzoZLcQb4vpfj6caG8bj4g7CzZnnP6rhoyJJAtOU1
         muS4qJhGrltD/DekwgIJ7UhC1M1jMWs2/dO5jndZEpzLVUstGGp3hroyXZw1ObY6yeF8
         LnMhyNwH4/xlcvVphW21vEJ/QvkgcshUu4IY9qc9VXKq2/nsyv2I032j0Kg7CKcVsCwR
         Ak+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576001; x=1767180801;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ1KV9C/f/PiFx/DNrtIQveUhvwKbDLgrTookKgtC/U=;
        b=Y+2zH71BysvVdn00S11N/YqeECWW1UThpCgP4o6x5TYjXV2diq91+8PqjYPga0/vyw
         go2PoOa4yuYBRa8vS7ERwUwTj7uDlyupcm4+NS1+WACDVKmaXxmxGsGa5cJhIIhA3bck
         LMGRh1qZqpc53JdpLqhhXlk0q10sXEicOZApB8JBTDYGJymR4zgObByjc15Cy+G8aBN7
         j+/xj180yAwz6MDzwQvDTj9dTX7tgKSDCCr8q02aqXXNax5oPFQKVPnf+RdrEidQz051
         YHrtvUqf/0e869KszjVW5JMj2ekgcWZPTEsjbnczLtxPw6YnhzMt6SeHo6D53TbadUHV
         +9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXv5slaawxfejdo2COpfo1kJiq8dm4mlOQe2nvLMjfca/TyR5BCVJ9D68eVVM3vlpNfISV48ItXXh1Xqb4cphpHArl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxV8TMVAM+2z3SnHZ+If8UvjK5VhZiooHUs8BXv5AgTJ1YI6piS
	9hWDqbjpPW1US/BuU06aasxlwLZ7Y8f/cTdiQ9go2qi0w5eG87uX4oB3X4TMvi74+3QyWnn34qU
	wzU91Xbram8oTWAHDD1YQ03lfuLepBrs=
X-Gm-Gg: AY/fxX6gp6P8K5i+uv4BAHy7cy8+hQ4ESG+XhySH9UAaf1ZjwX5OLkpkyLZEHB5jt8W
	Ox6eIXVo5xYy5baySZtqDWoBzBrThlB1O4CM1MKMEbyWucdYLaS4DqVo0djQejmomR/JbKGAwTc
	rzom0yOqXzePFbc0cS8M+l4xZwV1fHvZ3OcRSY2zpw1oOq0vwkCDtPSXL51nDrAT9ef0KlJdeHe
	aXJvwkli0pvKwtkyQ+h4awgeTmwF0mZO6ssPZ7YKZ1+aqOqbmPMLape38INzIrhCBwPRg0=
X-Google-Smtp-Source: AGHT+IH1pji4j1n8BkHd20Z/BEPqtB+/CQHasJecjKHqu/NHt/cExQav8YC7z8ptIhR4VDrsDJmqEtHfoyWISUPYl4s=
X-Received: by 2002:a05:6512:3c8f:b0:594:39bf:6d4b with SMTP id
 2adb3069b0e04-59a17df1e07mr4434996e87.46.1766576000416; Wed, 24 Dec 2025
 03:33:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Dec 2025 11:33:19 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Dec 2025 11:33:19 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
In-Reply-To: <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com> <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
 <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Dec 2025 11:33:19 +0000
X-Gm-Features: AQt7F2qAZExd7UlTWDRMYArYhV_cyOjP0a9fiXSHq35MsPkTAJoqi-K__ilgUkg
Message-ID: <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

"Mark Pearson" <mpearson-lenovo@squebb.ca> writes:

> On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
>> This commit handles some column limit overflows (that occur after fixing
>> their alignment), i.e. the following check:
>>
>> CHECK: line length of ... exceeds 100 columns
>>
>> by defining a constant opt, and replacing the offending
>> expression with opt.
>>
>> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++----------
>>  1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
>> b/drivers/platform/x86/lenovo/think-lmi.c
>> index 1ada4d800383..07ba0d84720a 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.c
>> +++ b/drivers/platform/x86/lenovo/think-lmi.c
>> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *kobj,
>> struct kobj_attribute *attr,
>>  }
>>
>>  static ssize_t current_value_store(struct kobject *kobj,
>> -		struct kobj_attribute *attr,
>> -		const char *buf, size_t count)
>> +				   struct kobj_attribute *attr, const char *buf,
>> +				   size_t count)
>>  {
>>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>>  	char *set_str = NULL, *new_setting = NULL;
>>  	char *auth_str = NULL;
>> +	const char *opt;
>>  	int ret;
>>
>>  	if (!tlmi_priv.can_set_bios_settings)
>> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct kobject *kobj,
>>  			ret = tlmi_save_bios_settings("");
>>  	} else { /* old non-opcode based authentication method (deprecated) */
>>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
>> +			opt = encoding_options[tlmi_priv.pwd_admin->encoding];
>>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> -					tlmi_priv.pwd_admin->password,
>> -					encoding_options[tlmi_priv.pwd_admin->encoding],
>> -					tlmi_priv.pwd_admin->kbdlang);
>> +					     tlmi_priv.pwd_admin->password,
>> +					     opt,
>> +					     tlmi_priv.pwd_admin->kbdlang);
>>  			if (!auth_str) {
>>  				ret = -ENOMEM;
>>  				goto out;
>> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
>> kobject *kobj, struct kobj_attribute *
>>  				   const char *buf, size_t count)
>>  {
>>  	char *auth_str = NULL;
>> +	const char *opt;
>>  	int ret = 0;
>>  	int cmd;
>>
>> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
>> kobject *kobj, struct kobj_attribute *
>>  			ret = tlmi_save_bios_settings("");
>>  		} else { /* old non-opcode based authentication method (deprecated) */
>>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
>> +				opt = encoding_options[tlmi_priv.pwd_admin->encoding];
>>  				auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>>  						     tlmi_priv.pwd_admin->password,
>> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
>> +						     opt,
>>  						     tlmi_priv.pwd_admin->kbdlang);
>>  				if (!auth_str) {
>>  					ret = -ENOMEM;
>> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
>> kobject *kobj, struct kobj_attribute *
>>  static struct kobj_attribute save_settings = __ATTR_RW(save_settings);
>>
>>  /* ---- Debug
>> interface---------------------------------------------------------
>> */
>> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
>> kobj_attribute *attr,
>> -				const char *buf, size_t count)
>> +static ssize_t debug_cmd_store(struct kobject *kobj,
>> +			       struct kobj_attribute *attr, const char *buf,
>> +			       size_t count)
>>  {
>>  	char *set_str = NULL, *new_setting = NULL;
>>  	char *auth_str = NULL;
>> +	const char *opt;
>>  	int ret;
>>
>>  	if (!tlmi_priv.can_debug_cmd)
>> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kobject
>> *kobj, struct kobj_attribute *attr
>>  		return -ENOMEM;
>>
>>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
>> +		opt = encoding_options[tlmi_priv.pwd_admin->encoding];
>>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> -				tlmi_priv.pwd_admin->password,
>> -				encoding_options[tlmi_priv.pwd_admin->encoding],
>> -				tlmi_priv.pwd_admin->kbdlang);
>> +				     tlmi_priv.pwd_admin->password,
>> +				     opt,
>> +				     tlmi_priv.pwd_admin->kbdlang);
>>  		if (!auth_str) {
>>  			ret = -ENOMEM;
>>  			goto out;
>> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
>>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>  			}
>>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>  				tlmi_priv.pwd_nvme->pwd_enabled = true;
>>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>  					tlmi_priv.pwd_nvme->index =
>> --
>> 2.52.0
>
> I'll defer to the pdx86 reviewers for this set of changes.
>
> This seems to me to make things more complicated than needed, purely to address a 100 column limit. I personally don't like the change.
>
> Nothing wrong with the code, and if more experienced maintainers prefer it, I'm happy to defer to them. Otherwise it seems to me noise for the sake of noise I'm afraid
>
> Mark

An alternative could be to set this a constant pwd_admin to
tlmi_priv.pwd_admin. There are 13 other references to
tlmi_priv.pwd_admin in one function alone, so maybe it might be a more
meaningful improvement?

Then again, the question arises why we aren't following the same pattern
for all the other heavily used fields under tlmi_priv. Adding more
constants seems to be wrong way forward.

Another option would be to move repeated functionality into other
functions (all the column limit violations seem to be identical and
involve encoding_options and kasprintf in the same way), but a refactor
of this nature seemed *way* beyond the scope of a simple code syle clean
up.

Thus, assigning the required value to a small constant seemed to be the
best immediate solution. I can see why you feel it adds complexity.
Typically in a dynamic language (or even in a declare-as-you-need code
style in C) this is a trivial change, whereas in a top-of-block style
this does seem to add some cruft.

Perhaps we should drop this patch for now? Nevertheless, I think the
column limit violations, long functions, and repeated lines are a sign
that some refactoring is in order.

Thoughts?

-- bp
