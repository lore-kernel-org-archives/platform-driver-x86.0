From: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Subject: RE: Patch [4/4] intel scu ipc
Date: Sun, 30 May 2010 21:14:14 +0530
Message-ID: <0AE3E14D83C76F4994657326177D1FF9042CE9F758@bgsmsx501.gar.corp.intel.com>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F4A6@bgsmsx501.gar.corp.intel.com>
	<20100528135059.GC25798@srcf.ucam.org>
 <20100528172404.267674c3@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:21175 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752749Ab0E3PoV convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 30 May 2010 11:44:21 -0400
In-Reply-To: <20100528172404.267674c3@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>

Hello,

The description I mentioned is confusing.
As Alan said it is not Linux security issue.
Providing indirect read/write api exposes IA registers to user and firmware removed support for these commands/api

--Sreedhara 

-----Original Message-----
From: Alan Cox [mailto:alan@linux.intel.com] 
Sent: Friday, May 28, 2010 9:54 PM
To: Matthew Garrett
Cc: Ds, Sreedhara; platform-driver-x86@vger.kernel.org; x86@kernel.org
Subject: Re: Patch [4/4] intel scu ipc

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
