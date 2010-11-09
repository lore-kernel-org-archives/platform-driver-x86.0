From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] intel_scu_ipc: fix signedness bug
Date: Tue, 9 Nov 2010 13:40:50 +0000
Message-ID: <20101109134050.1ad58680@lxorguk.ukuu.org.uk>
References: <1288246119.5153.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:47969 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751959Ab0KINmc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Nov 2010 08:42:32 -0500
In-Reply-To: <1288246119.5153.1.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Sreedhara DS <sreedhara.ds@intel.com>, Alan Cox <alan@linux.intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thu, 28 Oct 2010 14:08:39 +0800
Axel Lin <axel.lin@gmail.com> wrote:

> busy_loop() returns negative error code, thus change err variable
> from u32 to int to properly propagate correct error code.
> 
> Also remove unneeded initialization for err and i variables.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

This was already partly fixed in my tree but added the other fixes.

Thanks
Alan
