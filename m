From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 00/11] ALS and other new functions
Date: Fri, 28 Mar 2014 06:23:31 +0900
Message-ID: <20140327212331.GA6203@taihen.jp>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:59199 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756794AbaC0VXe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Mar 2014 17:23:34 -0400
Content-Disposition: inline
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Mar 21, 2014 at 08:01:11AM +0900, Mattia Dongili wrote:
> Matthew,
> 
> This is partially a resend of the previous patch-set (first 7  patches) plus
> additional changes to queue up for 3.15.

could you pick up everything but patch 9 and 10? I'll resend those when
ready with the changes that Jonathan suggested.

Essentially these two should be skipped for now:
>   sony-laptop: als support
>   backlight: introduce inter-driver notification of changes

the latter could actually go by itself but without any real use it's a
bit gratuitous.

Thanks
-- 
mattia
:wq!
