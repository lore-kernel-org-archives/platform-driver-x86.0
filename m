From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 0/2] input/serio: Add a firmware_id sysfs attribute
Date: Fri, 28 Mar 2014 08:20:04 +0000
Message-ID: <20140328082004.GA6801@srcf.ucam.org>
References: <1395310330-3232-1-git-send-email-hdegoede@redhat.com>
 <20140320172159.GA27400@srcf.ucam.org>
 <20140328075655.GE22093@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33322 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750964AbaC1IUP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Mar 2014 04:20:15 -0400
Content-Disposition: inline
In-Reply-To: <20140328075655.GE22093@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Benjamin Tissoires <btissoir@redhat.com>, Peter Hutterer <peter.hutterer@redhat.com>, platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org

On Fri, Mar 28, 2014 at 12:56:55AM -0700, Dmitry Torokhov wrote:

> I am still unsure if we shoudl be adding these new IDs to serio core...
> Can't the X driver take a peek at ACPI devices on it's own?

In the (admittedly unlikely) event of multiple PS/2 trackpads, how do 
you know which one corresponds to which ACPI device?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
