From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2 12/16] samsung-laptop: add true rfkill support for
 swsmi
Date: Sat, 26 Nov 2011 20:21:11 -0800
Message-ID: <20111127042111.GC17802@kroah.com>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
 <1322301613-8801-13-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:41610 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752983Ab1K0KVA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Nov 2011 05:21:00 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id AF0C721A94
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2011 05:20:59 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1322301613-8801-13-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Sat, Nov 26, 2011 at 11:00:09AM +0100, Corentin Chary wrote:
> The wireless status get and get commands seems to use one
> byte per device. First byte is for wlan and third is for bluetooh,
> we will have to find what the other are for.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
