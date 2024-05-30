Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8914B953
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097323; cv=none; b=WEX5Glj8LQPS1birLyyUHxdLeapzVxxkSz3Waeiqwq6we11LXZzGt0FrLAh5SDGT6tOxZy4IvGHeJTIimsmnK5TTgVtAyLAppVbk8d2DN6NjP7OFdHWI8LzKdK61Bs7iJzL1TGucmgDbfBuubspHsa3YWU09UljlhKNeYNOt7vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097323; c=relaxed/simple;
	bh=JJhS1pPURI+aQlYnA8wo8o0Excof0LOY618hx1VqTvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL0LsraCv5lzjC+BrMCzJVZhC7qbFLA470iYtvaU9a1qFoq68+SpL7lk5dqvnri2H5CYob6kq2r1+VJY1dgbQ5A8QhAiY+inX7RuXjkrZrzpgAwYZIRDOaz/lwbp5TEn/rEy5Vp7VbbDk/L0Fub/9rTBEvKb0a4dF3ZRyyIKP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSOloOcX; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSOloOcX"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso12957751fa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717097320; x=1717702120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkBHvViNRUO3vQPOWF9hByywaR4nvfvUm5Gui6RAYuk=;
        b=fSOloOcXNXYxjmiGVNhuY9XV2m89Kq35vZE6kqgq3+cvDLroE+jm6izLHUcJIjEMe0
         ZHZgTYLFndK5txYHWfNEaFyqthvanH/pwRQqXLZXRA94wEZs0iqRwmuEGjRwLqL5rvFU
         hNLiKC+Qv0JeDWL/BMbjOol1e8T3HcwotIOpAchxK4s1hKA7aL2B6DxJ2xwzzbkhFl2q
         QTFjN2fgApUF1U6e4xRof73xvvfNVhmw1wtfTCwN2TmfI8WmCV+aDvC3WFQS+/8ebHKH
         EZv7qbWYmEdrvy5lkGhze+LwqviVAbeN+xwk3VAt4nFYRRmryley0+c3rg4yHKzlXFDF
         m8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097320; x=1717702120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkBHvViNRUO3vQPOWF9hByywaR4nvfvUm5Gui6RAYuk=;
        b=AjFRbRX63VX2J/HgTz5hQcVTPHPbw3J0E/j9xYutqvTAMOISMjb2QAo70OLBks+4MP
         n6TR6FkW8cheE7vIFZoydXE/W2iIQlLl2K3t8wDgl/T4DEjZFs+q4UJMXV+P3PhLh3oj
         dPDSt37/5J5150eSQfZ0GLLQN047lAcAgkE+VR19AAHFYNHsm73PGe/ucgpMXw1RnvzH
         PpFFx+Fb6PQvtX7w0Jx07K0+qoPnW2zb5bLaw8Pk3cGUisCIsnFjKFqNiprYBnIRjCGH
         SwkavSnAdF0LRucbSx1CoPDpGtMqc+c2XDv1vJOi39s2uHTNcmLfuxMT87fNTeX1I1ak
         Igxw==
X-Forwarded-Encrypted: i=1; AJvYcCUSzu3dSDBK5YXPW7/Sgsmekmr3Fz5rjHL6B/8xZ2KAndovjzXwd92a1Sc9q1OPWWSpYUwtZH04Dt7YP4rvY0BaO0dzVDGdcGkGYDa0kxjkMca8ng==
X-Gm-Message-State: AOJu0YzVfDFY3tYmVryM8Qw0mGco+so8Ztsug3dWrjs6Gj+8xd8Cr7cg
	yxNKy+Iv9XK/OvxAN8kiJF/+YtjHEPLiMKB0EFwYTKqcU6DpOJdwwkh3zhsb5uU=
X-Google-Smtp-Source: AGHT+IF/S3+edrbcvaVlQXG/c5PQFdSIR94fq5kVS7yYYPf+3CZ7HSU+p3YnKFoMkQ0CRC40m/czSQ==
X-Received: by 2002:a2e:8792:0:b0:2ea:83c9:2560 with SMTP id 38308e7fff4ca-2ea848493c5mr17255771fa.46.1717097319718;
        Thu, 30 May 2024 12:28:39 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c6d4b6sm131122a12.74.2024.05.30.12.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 12:28:39 -0700 (PDT)
Date: Thu, 30 May 2024 22:28:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: markus.elfring@web.de, Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Use memdup_user()
Message-ID: <1512f46e-112c-47ef-8620-add0f04ce86d@moroto.mountain>
References: <50d10f0b-d108-4057-be9c-a90e2398e810@web.de>
 <20240527083628.210491-2-thorsten.blum@toblux.com>
 <4c2c8a76-17c7-4dbb-96ff-8488c8e953ff@moroto.mountain>
 <1D5BDE66-ABB3-41D9-ACB0-FBAC207D55DC@toblux.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D5BDE66-ABB3-41D9-ACB0-FBAC207D55DC@toblux.com>

On Thu, May 30, 2024 at 04:15:51PM +0200, Thorsten Blum wrote:
> Hi Dan,
> 
> On 27. May 2024, at 12:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Also this check isn't great:
> > 
> > if (dev->policy_sz < header->length + 512)
> > 
> > header->length is a u32 that comes from the user, so the addition can
> > overflow.  I can't immediately see how to exploit this though since we
> > don't seem to use header->length after this (by itself).
> 
> How about
> 
> 	if (header->length > U32_MAX - 512 || dev->policy_sz < header->length + 512)
> 		return -EINVAL;
> 
> to prevent a possible overflow?

I've been thinking about this and actually we could do something simpler:

	if (dev->policy_sz < size_add(header->length, 512)) {

> 
> header->length is used in the next line
> 
> 	dev->policy_sz = header->length + 512;

Yeah, but it's not used by itself.  The "header->length + 512" has been
verified as a valid value whether it overflows or not.  Only
"header->length" is wrong.

> 
> and if the addition overflows, we end up setting dev->policy_sz to an 
> invalid value.

regards,
dan carpenter

