Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF961212FAD
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 06:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775974287; cv=none; b=MBpjI65IU4wcUL7fAtlEsZ1QFODiTv9DY0m59nTXh01w78lo9R/mJ1xhkigKIgBB16x45GqitDolTW2E61pBXkZHkZwpWg5hWYqf5nLQmhOKVaMnFx7pPe82+sgX8UmRWJHNpn8xeZeBWshBH7YQzgBDG39+uNAbWqd2ggcyLXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775974287; c=relaxed/simple;
	bh=WFSGwgH02YFku0hSVSXCqcW1ONjlSGICutXtlrLEs3I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjIuMyFKCQlCNVhkOQCCZ8qcJ1EZimRaxRGAYg3MgodxXExTe9x2w4SroeoEsGerxhHjnCBHtv2Vu6mFIcqrxi0G6nOUuQqKkSCiBWCuALkgwSuA0U4DLsQIWd6gVIQn6WZ3g4gdXZXCG10ph3sFQlWeTyIl+8NcY3zpz4VE5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=code406.com; spf=pass smtp.mailfrom=code406.com; dkim=pass (1024-bit key) header.d=code406.com header.i=@code406.com header.b=XkDh6ita; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=code406.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=code406.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=code406.com header.i=@code406.com header.b="XkDh6ita"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c444dbe8eso1466409c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 23:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=code406.com; s=google; t=1775974285; x=1776579085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJnDCUlTGFnlijTfwOhFOapbEBc2V50kQ2M+TmS9vCc=;
        b=XkDh6itaJo2r151q0MDeBfD6S4JNq1nUzJ2wAk0jg1J+/rdnXgYgZcjTzmPkS01s31
         leETrmGRsvCjtdbLKVegibUSrpGn/qoPBRPCMm4Tbte2AlTZgEPKnx36JhrgYv2Go3oe
         B6BOeUgYcV7ssMRN7r3fAF8dgtwTEgujUK7RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775974285; x=1776579085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJnDCUlTGFnlijTfwOhFOapbEBc2V50kQ2M+TmS9vCc=;
        b=jGdDHwwuk0PDfTI02Y3u7hS+k5UPnuu9UqB6e+f4YBWfkX7+xszdD0sB/Rr3+e5c+/
         xdb4pxBHM8UxTdWRCZX5Nd+A8kvkYO5L14akuXFDooa2Cr8jfp1JaJB47zANFHv0fo9U
         ukrOoPDLgUBm+egjbNN17MbuDzifoVvI6tT/+Pudt82O+fj0HSYCJywIt25KmkdU1UQm
         jmV2BICZ/2t0gzQcMqw0kGB/smdxuVmzQ36FDPXm2tNnEXsHgInXiYU8xGfXhytgPJ7m
         xnmcyTsdgIpIcAmscnzRTemOwSZTIFQa1CSVosTziXRNUsruM2xl0y4u8T7aOKiJsklZ
         rmbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTlXC+AOrF6MdS0KGwzwUGExOi9s3Sx8hMZ3tbZMNY2X4W5/ME/e5f/SKeoM2InL1GHOPwXKDNotq0svwvgptg9G/R@vger.kernel.org
X-Gm-Message-State: AOJu0YyANYsijVoQsUkzj4WIS5ysl+rZtitN3LP80tobdB/8H0uVk1C+
	N/ZVExwbBYdxyUwdd+Ld5u2Vx134x2ahfJD+WOjyMmIiqx9gOdNR+eH17IZjL9hbRlptLs1JRJ7
	Vyi1Dbw==
X-Gm-Gg: AeBDies8xToSuYcbUA7fHXBixqWggPdLA0rfC/zH+PU6jnjR9feSo9JdPxDSHu5uKZH
	JMzf6IU+MPvO+maKnKeGSOOKa4I8VWRXM83hxymKzVHRY1h/Qk4W7PfvMbEoiHWtZqXIUFjK0dS
	xE1PauU827F6QK7xpPv/hxwNuBWvyoEuuwbxIiyUy0da2lu0gRvy1oxT4n4EHK3DHaVWRSULozX
	IanBUL6NLNcwKGFVR0vAzaHUQdclyhJNoZ1PTh6djgSvb6SUUSeBryyo3S1acLALLUdOUsI450v
	rezAPlPWdrnUtDHGSIULhuinrzMi8AFD5Z99xV7TfYixbQYo26/mCbGjfJJvAHbAyYreNdlIN6l
	P00dljttvsA5Wx9X6nbm9Y35U558Gdy7ub9vFis3ITprGd5iqSLloMGyLJRkFaSdoO+5BvTbyou
	u2VUZ6zOKoStJb7L1QJ2nXT34Iykevg/ORAWvFfnhGOm4XFrAmxxgtNd5iAs0gEqufMKOrqX+Dj
	RAHXYWqJV6FoZdhUVa1UlMNVyLkl64=
X-Received: by 2002:a05:7022:20c:b0:128:bc19:813d with SMTP id a92af1059eb24-12c34eefa5bmr4678519c88.27.1775974284847;
        Sat, 11 Apr 2026 23:11:24 -0700 (PDT)
Received: from rasputin ([2601:645:8a00:6e44:21b5:a2d0:e6aa:2a9a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm11472896eec.14.2026.04.11.23.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 23:11:24 -0700 (PDT)
From: Josh Snyder <josh@code406.com>
X-Google-Original-From: Josh Snyder <josh@cod406.com>
Date: Sat, 11 Apr 2026 23:11:22 -0700
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Josh Snyder <josh@code406.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: fix heap buffer overflow in
 security buffer
Message-ID: <dtfokh4rcywrav7eqddh5ruij2uyqxcw2raxhx6iu6cxjult55@2j6dqjzjvxfr>
References: <20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com>
 <928a6f5c-6f94-5661-d95c-03e310abf7bb@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <928a6f5c-6f94-5661-d95c-03e310abf7bb@linux.intel.com>

My apologies! It's been a while since my last kernel contribution, and I'm quite
unfamiliar with this driver. All I can say for certain is that this patch fixed
the error I was getting when writing to my homelab PC's BIOS variables, and the
bug looks like a heap overrun to my untrained eyes.

I'll walk through the code as I understand it. The relevant code in
hp-bioscfg/biosattr-interface.c looks like:

int hp_set_attribute(const char *a_name, const char *a_value)
{
...
        a_name_size = hp_calculate_string_buffer(a_name);
        a_value_size = hp_calculate_string_buffer(a_value);
        security_area_size = hp_calculate_security_buffer(auth_token_choice);
        buffer_size = a_name_size + a_value_size + security_area_size;

        buffer = kmalloc(buffer_size + 1, GFP_KERNEL);
        ...
        ret = hp_populate_security_buffer(start, auth_token_choice);
        if (ret < 0)
                goto out_set_attribute;

        ret = hp_wmi_set_bios_setting(buffer, buffer_size);

As you can see, it calls hp_calculate_security_buffer() and then uses the result
to decide how large `buffer` should be. hp_calculate_security_buffer() serves to
predict how many bytes hp_populate_security_buffer() will later write. If
hp_calculate_security_buffer() under-estimates, then
hp_populate_security_buffer() will over-run the kmalloc'd buffer.
hp_populate_security_buffer() has this logic:

        if (strstarts(authentication, BEAM_PREFIX)) {
               ...
        } else {
                /*
                 * UTF-16 prefix is append to the * authbuf when a BIOS
                 * admin password is configured in BIOS
                 */

                /* append UTF_PREFIX to part and then convert it to unicode */
                strprefix = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX,
                                      authentication);
                if (!strprefix)
                        return -ENOMEM;

                auth = hp_ascii_to_utf16_unicode(auth, strprefix);
                kfree(strprefix);

                if (!auth) {
                        ret = -EINVAL;
                        goto out_buffer;
                }
        }

The existing logic in hp_calculate_security_buffer() doesn't match: it has these
two early-return guards:

        if (!authentication)
                return sizeof(u16) * 2; 

        authlen = strlen(authentication);
        if (!authlen)
                return sizeof(u16) * 2;

The second early-return, in particular, means that an empty `authentication`
string will produce a buffer that is 16 bytes too small for the payload that is
ultimately written by hp_populate_security_buffer() and sent to the firmware by
hp_wmi_set_bios_setting().

The net effect is that my homelab's firmware saw an invalid payload and refused
the write with error 0x04. My guess is that this bug will hit anyone who doesn't
have a BIOS admin password set, and the logic had only been tested with HP
BIOSes where the admin password is set.

> >  The NULL check is preserved since hp_populate_security_buffer() would
> >  dereference NULL via strstarts().

> What NULL check this refers to??? For which of the inputs?

Yeah, that sentence could have been worded better, I admit. The existing code in
hp_calculate_security_buffer() has two early-return guards, and that sentence is
attempting to answer the question: "why not remove both of them?". The answer is
"because we don't want to pass a null pointer to strstarts()" immediately
beneath:

        if (!strstarts(authentication, BEAM_PREFIX))
                size += strlen(UTF_PREFIX) * sizeof(u16);

But now that I give the code another look, my mildly-informed opinion is that it
should be hp_set_attribute()'s job to ensure a non-NULL `authentication` value as
a precondition of calling hp_calculate_security_buffer().

If any of this "clicks" for you, I'd be happy to reword the commit message to
incorporate whatever portion makes makes the most sense. I'd also be happy to
just contribute a bug report, and have someone with real understanding of this
driver do the actual patching.

Thanks!
Josh
