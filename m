Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC86BFA3
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725481124; cv=none; b=rjt4Q3nqIMYk0o4d8JKwexyFngsL8bQO6m/YjIAxDorTKqGRIEVwPax/YkdX3p5P3ayeTQdphwD5hsNKWSy+RbJmK+xUfvU7BgUEttlO008kNrMQqfkTZlEpYcx5ORseSyvlpoEpDnHKmv2tgRUFaiSM/tkI924ooJANCPhcP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725481124; c=relaxed/simple;
	bh=k6RsXNwLgxov2po/iQNH02SOvV8DmDra4bYIETXKEiw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSW80IRSB2rs1CS/W+EkPYm4o/iL1O987kE7fWxgtcaJ6P8JeOwyNScPutaPi3ua/ePpQv+P3fDlboFK9SXXzPoX81vcTrI4af3V1kFKAFFW65xpNbX0WeFgrIPZTLPCNdtqA8Mvgg6na8UxtQ92nCqRKi/sC4x+9jR1W08l3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id dc229e1f-6afa-11ef-825d-005056bdfda7;
	Wed, 04 Sep 2024 23:18:35 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Sep 2024 23:18:33 +0300
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gergo Koteles <soyer@irl.hu>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: ideapad-laptop: Make the
 scope_guard() clear of its scope
Message-ID: <ZtjAmavK5tr4mvka@surfacebook.localdomain>
References: <20240829165105.1609180-1-andriy.shevchenko@linux.intel.com>
 <8a106cfe-f7cd-4660-983a-feba627cdcab@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a106cfe-f7cd-4660-983a-feba627cdcab@redhat.com>

Wed, Sep 04, 2024 at 08:14:53PM +0200, Hans de Goede kirjoitti:
> Hi,
> 
> On 8/29/24 6:50 PM, Andy Shevchenko wrote:
> > First of all, it's a bit counterintuitive to have something like
> > 
> > 	int err;
> > 	...
> > 	scoped_guard(...)
> > 		err = foo(...);
> > 	if (err)
> > 		return err;
> > 
> > Second, with a particular kernel configuration and compiler version in
> > one of such cases the objtool is not happy:
> > 
> >   ideapad-laptop.o: warning: objtool: .text.fan_mode_show: unexpected end of section
> > 
> > I'm not an expert on all this, but the theory is that compiler and
> > linker in this case can't understand that 'result' variable will be
> > always initialized as long as no error has been returned. Assigning
> > 'result' to a dummy value helps with this. Note, that fixing the
> > scoped_guard() scope (as per above) does not make issue gone.
> > 
> > That said, assign dummy value and make the scope_guard() clear of its scope.
> > For the sake of consistency do it in the entire file.
> > 
> > Fixes: 7cc06e729460 ("platform/x86: ideapad-laptop: add a mutex to synchronize VPC commands")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202408290219.BrPO8twi-lkp@intel.com/
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Thank you for your patch, I've applied this patch to my review-hans 
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Have you had a chance to go through the discussion?

TL;DR: please defer this. There is still no clear understanding of the root
cause and the culprit.

-- 
With Best Regards,
Andy Shevchenko


