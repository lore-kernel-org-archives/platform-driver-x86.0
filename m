From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] acer-wmi: remove threeg and interface sysfs interfaces
Date: Tue, 6 Oct 2015 23:39:47 +0100
Message-ID: <20151006223947.GC43526@vmdeb7>
References: <1444040262-6520-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40648 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752970AbbJFWjx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Oct 2015 18:39:53 -0400
Content-Disposition: inline
In-Reply-To: <1444040262-6520-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Martin Kepplinger <martink@posteo.de>

On Mon, Oct 05, 2015 at 06:17:42PM +0800, Lee, Chun-Yi wrote:
> Since v3.0 kernel, acer-wmi driver auto detects internal 3G device and
> provides the threeg rfkill interface. So the sysfs interface of 3G is
> no longer necessary now.
> 
> The 7b8aca65 patch added kernel information log to remind to user space
> for the threeg sysfs interface will be removed in 2012, then b58b9ffc patch
> updated the interface removing time to 2014.
> 
> I think the 3 years lead time is enough for user space application to use
> rfkill instead of sysfs interface to control 3G device.

Seems reasonable :)

Queued to testing, and then to next hopefully tomorrow.

-- 
Darren Hart
Intel Open Source Technology Center
