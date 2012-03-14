From: David Rientjes <rientjes@google.com>
Subject: Re: [patch -next 1/2] drivers, samsung-laptop: fix initialization
 of sabi_data in sabi_set_commandb
Date: Wed, 14 Mar 2012 00:17:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1203140016070.21777@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1203132258160.5229@chino.kir.corp.google.com> <CAHR064gzke5o4C8cg2qH1d4VuXTMmqV-sAaiOv5O650qjc01sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:65196 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752288Ab2CNHRb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 03:17:31 -0400
Received: by iagz16 with SMTP id z16so1939685iag.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Mar 2012 00:17:31 -0700 (PDT)
In-Reply-To: <CAHR064gzke5o4C8cg2qH1d4VuXTMmqV-sAaiOv5O650qjc01sw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 14 Mar 2012, Corentin Chary wrote:

> David, just in case, I found this mail in my spam folder, probably
> because your smtp server is not allowed to send @google.com mails.
> 

Known gmail issue for people sending emails to LKML from google.com :)

> Also, with which version of gcc is this necessary ? Old version worked
> with 4.5 and 4.6.
> 

I'm using 4.4.3.
