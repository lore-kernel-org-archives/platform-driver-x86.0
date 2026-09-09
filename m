Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E981558200;
	Wed,  9 Sep 2026 16:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972594; cv=none; b=Rul6lDIZk8cmcumc62RmfoG1rmdXR8dfAz31ECjjR28CHAMRk2UyDYicbedYhzSgd7bS8qpjDHORnQPj0sy2jSyldOvRnS2oxIidUa0zRRR4noNFz6OrXuF3r5ZVKsEZuui5SwBv6vlCZTJRPfWbLYOBTzzrF+0jFT3auz4ZGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972594; c=relaxed/simple;
	bh=OUYePPaevWiw5zJaHm36L914ceMwDtozjQtedcNKVQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1HcXMZTy03rIhHTlOGgDQ9/pb+FMMXy6ZniEJYfMgpr/hYCIdH5Qs6FvQ4heVC/UeXq9RQBFZGKcbxduvQk7ZQkAn+fIQ5VSLPTOm5leLz6S0QtdrTMCuA6/czPwmFiAEegmu/CgDOA3wgnvrP23eaP25z881anxA2vDYmgIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ML1ozg7V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ML1ozg7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED021F000FF;
	Wed,  9 Sep 2026 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972593;
	bh=/QTXq5JkjQsJbXJORNnzSymarU5/NqZgo2qlaYhmOGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ML1ozg7VvYY8l7xIqENHlWc5AowZTlviG7M2gbywWNcCABnQ7uBP7eGXwagxp74Xu
	 CqgXmmHxkDh32V9YcO5FHrLqBkSC5Q9eiETuk2HtyMb277G1YgXhwWwHrsU2+qYIP+
	 jqy77g8kvE9S4m4Ll2VUKQ2evik6GSGAvm1B1aAoQIZw2a/60Fe+F+waSYAJplACIR
	 W093FT9Tf/KujoYN5qK7vIF4q4DkPA9ob7rUeWE27x1Mr+JQ8BKzMe3TtEyK9PM5Un
	 qJm+wpQpAdOY9joYNh3sdiiOzLM3VduLz810AWoN7QMA9lowEdP15znuAmcdDWjO6U
	 R2V62TmPWnCHA==
Date: Wed, 9 Sep 2026 18:49:48 +0200
From: Thorsten Blum <blum@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unreachable code in
 beep_read()
Message-ID: <aqGOLBx_hU3a7ADQ@kernel.org>
References: <20260907090103.352995-3-blum@kernel.org>
 <254d9c60-d21e-4ef5-b70e-89dd18ff7147@app.fastmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <254d9c60-d21e-4ef5-b70e-89dd18ff7147@app.fastmail.com>

On Wed, Sep 09, 2026 at 11:26:18AM -0400, Mark Pearson wrote:
> Hi Thorsten,
> 
> On Mon, Sep 7, 2026, at 5:01 AM, Thorsten Blum wrote:
> > The procfs entry /proc/acpi/ibm/beep is only created if beep_init()
> > succeeds, which requires beep_handle to be non-NULL. Remove the
> > unreachable code branch from beep_read().
> >
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > index 1082c36ae723..069c9f1c359f 100644
> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > @@ -5936,12 +5936,8 @@ static int __init beep_init(struct 
> > ibm_init_struct *iibm)
> > 
> >  static int beep_read(struct seq_file *m)
> >  {
> > -	if (!beep_handle)
> > -		seq_puts(m, "status:\t\tnot supported\n");
> > -	else {
> > -		seq_puts(m, "status:\t\tsupported\n");
> > -		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
> > -	}
> > +	seq_puts(m, "status:\t\tsupported\n");
> > +	seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
> > 
> >  	return 0;
> >  }
> 
> Change looks good to me.
> I guess the beep_write could be similarly updated?

No, beep_write() can be called via the beep= module parameter even if
beep_init() failed, so that check is still needed.

Thanks,
Thorsten
