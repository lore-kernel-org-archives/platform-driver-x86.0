From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Need help to understand USB driver mechanism
Date: Fri, 22 Jun 2012 09:48:53 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1206220947010.1578-100000@iolanthe.rowland.org>
References: <CAKB833k1Q7LoJWxDp6AHdq5H=w=LeeeRQ3sRC_1zXcJ_Lp9mNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:43640 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1762192Ab2FVNsy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jun 2012 09:48:54 -0400
In-Reply-To: <CAKB833k1Q7LoJWxDp6AHdq5H=w=LeeeRQ3sRC_1zXcJ_Lp9mNg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vishal Nandanwar <operational.people@gmail.com>
Cc: Linux USB <linux-usb@vger.kernel.org>, Linux Docs <linux-doc@vger.kernel.org>, Platform driver x86 <platform-driver-x86@vger.kernel.org>

On Fri, 22 Jun 2012, Vishal Nandanwar wrote:

> Hi Alan,
> 
> Thanks for your reply. It really helps.
> 
> What approach one should use to learn the device drivers?

Many of the files in drivers/usb/misc would make a good place to start.  
You can also try to figure out the usblp driver.

Alan Stern
