From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: olpc: make ec explicitly non-modular
Date: Tue, 16 Aug 2016 17:08:13 -0700
Message-ID: <20160817000813.GA81374@f23x64.localdomain>
References: <20160815222517.1348-1-paul.gortmaker@windriver.com>
 <20160815180120.24e46394@e7450.queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59105 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752922AbcHQAIZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Aug 2016 20:08:25 -0400
Content-Disposition: inline
In-Reply-To: <20160815180120.24e46394@e7450.queued.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andres Salomon <dilinger@queued.net>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, Aug 15, 2016 at 06:01:20PM -0700, Andres Salomon wrote:
> Fine by me.
> 
> Acked-by: Andres Salomon <dilinger@queued.net>
> 
> On Mon, 15
> Aug 2016 18:25:17 -0400 Paul Gortmaker <paul.gortmaker@windriver.com>
> wrote:
> 
> > The Kconfig entry controlling compilation of this code is:
> > 
> > arch/x86/Kconfig:config OLPC
> > arch/x86/Kconfig:       bool "One Laptop Per Child support"
> > 
> > ...meaning that it currently is not being built as a module by anyone.
> > 
> > Lets remove the couple traces of modular infrastructure use, so that
> > when reading the driver there is no doubt it is builtin-only.
> > 
> > We delete the MODULE_LICENSE tag etc. since all that information
> > was (or is now) contained at the top of the file in the comments.
> > 
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andres Salomon <dilinger@queued.net>
> > Cc: platform-driver-x86@vger.kernel.org
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Queued to fixes for 4.8. Thanks.

-- 
Darren Hart
Intel Open Source Technology Center
