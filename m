From: Marco Chiappero <marco@absence.it>
Subject: Re: Commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8
Date: Thu, 14 Apr 2011 09:37:15 +0200
Message-ID: <4DA6A42B.1000002@absence.it>
References: <4D9B4094.4010609@absence.it> <20110412152009.GA32032@srcf.ucam.org> <4DA5D45A.9070901@absence.it> <20110413165344.GA739@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:58466 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab1DNHhU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Apr 2011 03:37:20 -0400
In-Reply-To: <20110413165344.GA739@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <achirica@gmail.com>, Mattia Dongili <malattia@linux.it>

Il 13/04/2011 18:53, Matthew Garrett ha scritto:
> Can this code be merged within the next week?

Uhm, I don't know exactly but I don't think so.

> If not I agree that it'd
> be better to drop this patch for now.

There is no hurry, such backlight device is useless as long as the ALS 
code isn't included too.

> I think exposing the full range of
> (usable) brightness values makes sense, since ALS policy is likely to be
> determined in userspace - we'll need some way to expose the appropriate
> mapping, but that's something that needs to be handled generically in
> the long run.

Well, Javier Achirica and another tester already produced a working 
daemon implementing the ALS driven backlight regulation (and that might 
also deal with a few more Vaio specific features in the near feature). 
However it's not that plain and easy, exposing a single backlight device 
prevents everything from working properly because of some issues 
(currently we are using a different solution, with its drawbacks as 
well, but that proved to work well). If you're interested I can provide 
further details.

Regards,
Marco Chiappero
