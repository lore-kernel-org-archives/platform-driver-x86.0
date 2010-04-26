From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
 platforms
Date: Mon, 26 Apr 2010 17:28:00 +0100
Message-ID: <20100426172800.5405f352@linux.intel.com>
References: <20100423143037.6744.87450.stgit@localhost.localdomain>
	<20100426150934.GA9422@srcf.ucam.org>
	<20100426155534.6dcaca0c@linux.intel.com>
	<20100426154300.GA10782@srcf.ucam.org>
	<20100426163958.2b5f16b7@linux.intel.com>
	<20100426162202.GA11755@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:11836 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752916Ab0DZREB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 13:04:01 -0400
In-Reply-To: <20100426162202.GA11755@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, sreedhara.ds@intel.com, mingo@elte.hu

> I'm really not terribly comfortable merging enabling code for an 
> architecture if there's no clear plan for merging critical parts of
> that architecture.

I'm not interested in playing graphics driver politics. If I could do
something short term about the graphics situation I would. Furthermore
there isn't anything I can do about it (even if it does involve its
own *clean* mode setting to keep KeithP from exploding) until the
core merges are done.

As has already been pointed out large parts of the enabling code are
already merged into other bits of the kernel.

Alan
