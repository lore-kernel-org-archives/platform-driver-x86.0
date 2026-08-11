Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38620364053
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480257; cv=none; b=ka0uifNIUlLoC5wEgdBMNj5xKflDFp/UgRsWjOk5MqF3xn5s5+BidmJVNu8Bqyq9uRCWp4VR70FMWEP8O8bGYecxA7yymNt9PF0kJyPRjuskBddnIW4b/FKB3G4nYVf2BMhlu4myvch1Ua2JUJVc744aGUewqC2cu3DzUQ8//j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480257; c=relaxed/simple;
	bh=6FLMk1CW9YlVJ9RGsJMh3VWQtIBat+G1BEoDnDetDSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1KQZW7Mkj8ZNZvQK+uEAGKhLKc6yDYZd2u4RE0qYOHU6EX3JbxEu9x4jAY1B8NcFIoIt5Qtdm5O+xwfz5aBIz9mkMOQvrFjS4wZQtMuEjGF/KNgoc6r0MxzwYXvrJ8lxoI8QWVVD9V66E6lFuWgdIlkN46Kp165ZhSTUmFOL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o89PiBwQ; arc=none smtp.client-ip=91.218.175.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o89PiBwQ"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6FLMk1CW9YlVJ9RGsJMh3VWQtIBat+G1BEoDnDetDSM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786480253; v=1; x=1787085053;
 b=o89PiBwQH+QIbveMQaM0V+b3A6EwA03YY47Ut41U8tJt/WuF4Z/g+I5lRK1rjYZHasOgmQlF
 O12+wGSOmVau5yJOVSAJpxUPjYVTGq7xYdvKQ4JavJnYjt/ruzQb5D4kd3ozejajnmPDUFsmMmF
 1kvvucEZfkK7C8FTD70c80Zw=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from linux.dev (62.216.208.217)
	by mta11.migadu.com with ESMTPS id 34279d6dc1a838cb;
	Tue, 11 Aug 2026 20:29:37 +0000
X-Migadu-Scanner: mta11.migadu.com
Authentication-Results: mta11.migadu.com;
	none
Date: Tue, 11 Aug 2026 22:29:27 +0200
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org, Mark Pearson <markpearson@lenovo.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: think-lmi: Fix current password length
 check
Message-ID: <anuGJ59lNNX7YouI@linux.dev>
References: <20260810132018.156868-3-thorsten.blum@linux.dev>
 <15a1d7e9-f882-44ce-a24f-89b266e80efa@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15a1d7e9-f882-44ce-a24f-89b266e80efa@app.fastmail.com>

On Tue, Aug 11, 2026 at 03:29:28PM -0400, Mark Pearson wrote:
> On Mon, Aug 10, 2026, at 9:20 AM, Thorsten Blum wrote:
> > current_password_store() checks the password length before removing the
> > trailing newline, which can reject valid passwords that are exactly
> > ->maxlen bytes long.
> >
> > It also passes ->maxlen to strscpy(), which truncates passwords without
> > a newline.
> >
> > Use strchrnul() to measure the password length up to the newline, then
> > copy that many bytes and add a trailing NUL terminator.
> >
> > Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface 
> > support on Lenovo platforms")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  drivers/platform/x86/lenovo/think-lmi.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/think-lmi.c 
> > b/drivers/platform/x86/lenovo/think-lmi.c
> > index e215e86e3db7..860224dc8c21 100644
> > --- a/drivers/platform/x86/lenovo/think-lmi.c
> > +++ b/drivers/platform/x86/lenovo/think-lmi.c
> > @@ -436,16 +436,14 @@ static ssize_t current_password_store(struct 
> > kobject *kobj,
> >  				      const char *buf, size_t count)
> >  {
> >  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> > -	size_t pwdlen;
> > +	size_t pwdlen = strchrnul(buf, '\n') - buf;
> > 
> > -	pwdlen = strlen(buf);
> >  	/* pwdlen == 0 is allowed to clear the password */
> >  	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
> >  		return -EINVAL;
> > 
> > -	strscpy(setting->password, buf, setting->maxlen);
> > -	/* Strip out CR if one is present, setting password won't work if it 
> > is present */
> > -	strreplace(setting->password, '\n', '\0');
> > +	memcpy(setting->password, buf, pwdlen);
> > +	setting->password[pwdlen] = '\0';
> >  	return count;
> >  }
> 
> Change is good.
> Only minor note is that I hate to lose the comment explaining why
> we're losing the CR. Can we put that back in above the strchrnul
> operation?

I removed the comment because '\r' is CR and '\n' is LF. Happy to add it
back if needed, but maybe a better version would be:

/* Strip newline; setting password won't work if one is present. */
