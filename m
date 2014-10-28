From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/2] samsung-laptop: Add broken-acpi-video quirk for
 NC210/NC110
Date: Mon, 27 Oct 2014 21:26:12 -0700
Message-ID: <20141028042612.GA60814@vmdeb7>
References: <1413986798-27689-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48092 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752351AbaJ1E0Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Oct 2014 00:26:16 -0400
Content-Disposition: inline
In-Reply-To: <1413986798-27689-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <darren@dvhart.com>, Corentin Chary <corentin.chary@gmail.com>, Lee Chun-Yi <jlee@suse.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org

On Wed, Oct 22, 2014 at 04:06:37PM +0200, Hans de Goede wrote:
> The acpi-video backlight interface on the NC210 does not work, blacklist it
> and use the samsung-laptop interface instead.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=861573
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> --
> Changes in v2: Improve commit message

Queued, thanks Hans.

(In the future, please use my infradead email address for submissions as
 documented in MAINTAINERS. Kernel patches to dvhart.com will be lost)

-- 
Darren Hart
Intel Open Source Technology Center
