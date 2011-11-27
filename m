From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2 03/16] samsung-laptop: don't handle backlight if
 handled by acpi/video
Date: Sat, 26 Nov 2011 20:20:30 -0800
Message-ID: <20111127042030.GA17802@kroah.com>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
 <1322301613-8801-4-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:41056 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752148Ab1K0KUY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Nov 2011 05:20:24 -0500
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8386021A84
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2011 05:20:24 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1322301613-8801-4-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Sat, Nov 26, 2011 at 11:00:00AM +0100, Corentin Chary wrote:
> samsung-laptop is not at all related to ACPI, but since this interface
> is not documented at all, and the driver has to use it at load to
> understand how it works on the laptop, I think it's a good idea to
> disable it if a better solution is available.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
