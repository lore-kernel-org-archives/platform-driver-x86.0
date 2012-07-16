From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 0/7] sony-laptop fixes on 3.5-rc1
Date: Mon, 16 Jul 2012 17:03:35 +0900
Message-ID: <20120716080334.GA6369@kamineko.org>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
 <20120626183732.GC29375@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:40439 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122Ab2GPIDg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Jul 2012 04:03:36 -0400
Content-Disposition: inline
In-Reply-To: <20120626183732.GC29375@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jun 26, 2012 at 07:37:33PM +0100, Matthew Garrett wrote:
> Applied these, thanks.

Hi Matthew,

what's the status of these patches?

At least the following 3 commits would be good to have in 3.5.
The last one expecially fixes a bug that will break backlight control
detection on a relatively large number of vaios.

c7a2918373983b32db3ca35823d930641747e26f
56f4a9f76d8ce7c7cef92905c909aad0c7e5c9db
a1071a5abf1f4d4a7f8324e21b8b32b1342013c7

Thanks!
-- 
mattia
:wq!
