From: Alan Cox <alan@linux.intel.com>
Subject: Re: Patch [4/4] intel scu ipc
Date: Fri, 28 May 2010 17:24:04 +0100
Message-ID: <20100528172404.267674c3@linux.intel.com>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A6@bgsmsx501.gar.corp.intel.com>
	<20100528135059.GC25798@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:32214 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754843Ab0E1RJP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 May 2010 13:09:15 -0400
In-Reply-To: <20100528135059.GC25798@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Ds, Sreedhara" <sreedhara.ds@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>

On Fri, 28 May 2010 14:50:59 +0100
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Fri, May 28, 2010 at 02:14:06PM +0530, Ds, Sreedhara wrote:
> > Subject: [PATCH] Remove indirect read write api support.
> >  Firmware nolonger support these api, security issue
> 
> What security issues?

It's just stuff that is gone, didn't work out internally. No driver
will use those methods, no public firmware will support them. Dead code
might be a better description.

It's not security in a Linux sense.

Alan
