From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH 1/6] toshiba_acpi: Convert to use acpi_driver
Date: Wed, 21 Sep 2011 07:52:52 -0500
Message-ID: <20110921125252.GA23254@thinkpad-t410>
References: <1316555754-25949-1-git-send-email-seth.forshee@canonical.com>
 <1316555754-25949-2-git-send-email-seth.forshee@canonical.com>
 <1316557078.1903.11.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:49666 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753510Ab1IUMw6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Sep 2011 08:52:58 -0400
Content-Disposition: inline
In-Reply-To: <1316557078.1903.11.camel@Joe-Laptop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Matthew Garrett <mjg@redhat.com>, Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 20, 2011 at 03:17:57PM -0700, Joe Perches wrote:
> On Tue, 2011-09-20 at 16:55 -0500, Seth Forshee wrote:
> > Changes toshiba_acpi to register an acpi driver and eliminates the
> > platform device it was using.
> 
> Just trivial comments...

Thanks for the suggestions. Since all those are existing code rather
than new code, I'll incorporate them if I have to respin the patches
(aside from the static problems that Corentin pointed out), otherwise
they can be done in a follow-on patch.
