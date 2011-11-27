From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2 14/16] samsung-laptop: dump model and version
 informations
Date: Sat, 26 Nov 2011 20:22:10 -0800
Message-ID: <20111127042210.GE17802@kroah.com>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
 <1322301613-8801-15-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:34601 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752148Ab1K0KVz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Nov 2011 05:21:55 -0500
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 786FA21AA5
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2011 05:21:55 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1322301613-8801-15-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Sat, Nov 26, 2011 at 11:00:11AM +0100, Corentin Chary wrote:
> We still need to figure out exactly what each of different fields
> represent, but they contain at least model and version informations.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
