From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2 15/16] samsung-laptop: tweak traces
Date: Sat, 26 Nov 2011 20:22:23 -0800
Message-ID: <20111127042223.GF17802@kroah.com>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
 <1322301613-8801-16-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:50554 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752983Ab1K0KWO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Nov 2011 05:22:14 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 60E7D21AA2
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2011 05:22:14 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1322301613-8801-16-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

On Sat, Nov 26, 2011 at 11:00:12AM +0100, Corentin Chary wrote:
> - don't output error when probing features at load
> - print the SABI signature if samsung_sabi_init()
>   succeed
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
