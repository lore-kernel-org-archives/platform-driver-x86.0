Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B37346AC5
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071998; cv=none; b=jIXQi/rurwBz59G5gvVUUX1D8A7iV2AUO5V8OVPpW15uZToQdDd6gPexEEsmrkkvGWy2ZtoqNT9nC7NOBPEJGUyBUUzNeNNMIdzsdllUub9kGf7imnRkWq5dqsrGoO4loI2FFTsH3NpL3V56wx/yG4xqYMXLy5DTK2FCawkyvwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071998; c=relaxed/simple;
	bh=23ik7meSqyxNw0QOKML9zRQBtEHNNyA722wukvtNa6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1cnodsexRnOoQUaL6GXi0RiS0HRFBpMXT7YgjqiTLTjAbOYcbbYkO5kz4qsCeIZD1j04HWOMeCb5HEAj0+ODmYPQOQgsmTBn8n85jM48Lpuz/thvzFQtCNpqWr66YKjJWTH0tCX4cULtgvNcOJEM9UhqlulDuehdq0qJIoO65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MB/nKoUN; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MB/nKoUN"
Date: Wed, 6 May 2026 14:53:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778071994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/xjhAWZkgZ32t0p6N8mJ5N5UcFehbGxRD84PIIWoMA=;
	b=MB/nKoUNUOgD/JPdtpRnNHx7wfPf21mHO4tnj+PiphIDevyPH4FRcaFhywdAmW1NWrNfma
	ggpQhw6PfUL1wdqMCGEX5FHrgbGqKTNXDJMkkZ3h6ulh178R+QUpgCD0zh8ABfAp1le/qK
	Ai7zMM+jb9pdPoPTxL8JZo5o3SSj9AQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>,
	Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: use strnlen in
 strlcpy_attr
Message-ID: <afs5tVs4a59FRdzB@linux.dev>
References: <20260502165707.242332-3-thorsten.blum@linux.dev>
 <fcff1484-24b6-ce49-bb5e-f7da3e711eea@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcff1484-24b6-ce49-bb5e-f7da3e711eea@linux.intel.com>
X-Migadu-Flow: FLOW_OUT

On Wed, May 06, 2026 at 02:53:46PM +0300, Ilpo Järvinen wrote:
> On Sat, 2 May 2026, Thorsten Blum wrote:
> 
> > Use strnlen() to limit source string scanning to MAX_BUFF bytes. Return
> > early on error and make the "empty string means not applicable" case
> > explicit.
> > 
> > Use 'const char *' for the read-only source string while at it.
> 
> Hi Thorsten,
> 
> First of all, thanks for looking into these.
> 
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 +-
> >  .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++++---------
> >  2 files changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> > index 5278a93fdaf7..f6943301b857 100644
> > --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> > +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> > @@ -162,7 +162,7 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
> >  
> >  union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
> >  int get_instance_count(const char *guid_string);
> > -void strlcpy_attr(char *dest, char *src);
> > +void strlcpy_attr(char *dest, const char *src);
> >  
> >  int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
> >  			struct kobject *attr_name_kobj, u32 enum_property_count);
> > diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> > index 51d25fdc1389..6c9911accefc 100644
> > --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> > +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> > @@ -234,18 +234,20 @@ static const struct kobj_type attr_name_ktype = {
> >   * @dest: Where to copy the string to
> >   * @src: Where to copy the string from
> >   */
> > -void strlcpy_attr(char *dest, char *src)
> > +void strlcpy_attr(char *dest, const char *src)
> >  {
> > -	size_t len = strlen(src) + 1;
> > +	size_t len = strnlen(src, MAX_BUFF);
> >  
> > -	if (len > 1 && len <= MAX_BUFF)
> > -		strscpy(dest, src, len);
> > -
> > -	/*len can be zero because any property not-applicable to attribute can
> > -	 * be empty so check only for too long buffers and log error
> > -	 */
> > -	if (len > MAX_BUFF)
> > +	if (len == MAX_BUFF) {
> >  		pr_err("Source string returned from BIOS is out of bound!\n");
> > +		return;
> > +	}
> > +
> > +	/* Empty string means "not applicable" and is skipped intentionally. */
> > +	if (len == 0)
> > +		return;
> > +
> > +	strscpy(dest, src, len + 1);
> 
> And how exactly is this last line different from strscpy(dest, serc, 
> MAX_BUFF);
> 
> ?

The result is the same, but happy to use MAX_BUFF instead. However,
since we already know the length of the source string and that it is
NUL-terminated within the first MAX_BUFF bytes, we could just use
memcpy(dest, src, len + 1) directly.

> I agree something should be done here but I don't like this approach. The 
> length passed to strscpy() should be "Size of the destination buffer" but 
> your approach calculated the length of the source string (?!):
> 
> /**
>  * strscpy - Copy a C-string into a sized buffer
>  * @dst: Where to copy the string to
>  * @src: Where to copy the string from
>  * @...: Size of destination buffer (optional)
> 
> So, to make it safe and sound logically, to me it looks more like the 
> _caller_ should pass the output buffer's size to this function. Or 
> alternatively, this function could be wrapped with a macro such that the 
> sizeof(*dest) can still be checked to be of correct length.

I have some other changes queued up and would prefer to change this in a
follow-up patch since there are quite a few call sites that need to be
updated.

> Also, this function presents itself with str*() name like a generic string 
> copy function but what it really is more attr_check_and_copy(), it might 
> not copy anything if the checks fail.

OK, I'll take this into account when changing the function signature.

Thanks,
Thorsten
