From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] asus-nb-wmi: Add another wapf=4 quirk
Date: Mon, 24 Nov 2014 00:11:55 -0800
Message-ID: <20141124081154.GA97532@vmdeb7>
References: <1416824792-4842-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49546 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbaKYGsu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Nov 2014 01:48:50 -0500
Content-Disposition: inline
In-Reply-To: <1416824792-4842-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org

On Mon, Nov 24, 2014 at 11:26:32AM +0100, Hans de Goede wrote:
> Wifi on this laptop does not work unless asus-nb-wmi.wapf=4 is specified on
> the kerne commandline, add a quirk for this.
> 
> Cc: stable@vger.kernel.org
> BugLink: https://bugs.launchpad.net/bugs/1173681
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Queued, thank you Hans.

-- 
Darren Hart
Intel Open Source Technology Center
