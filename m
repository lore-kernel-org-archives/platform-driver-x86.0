From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/3] platform/x86: panasonic-laptop: reuse
 module_acpi_driver
Date: Tue, 03 Sep 2013 15:27:21 +0300
Message-ID: <1378211241.22798.9.camel@smile>
References: <1377690523-3511-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1378210024.11730.5.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:29104 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752612Ab3ICM1y convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Sep 2013 08:27:54 -0400
In-Reply-To: <1378210024.11730.5.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Harald Welte <laforge@gnumonks.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, 2013-09-03 at 12:07 +0000, Matthew Garrett wrote: 
> On Wed, 2013-08-28 at 14:48 +0300, Andy Shevchenko wrote:
> 
> > +module_acpi_driver(&acpi_pcc_driver);
> 
> module_acpi_driver(acpi_pcc_driver), right? I've fixed that and applied.
> 

Oops, you are right. Please fix in all 3 cases.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
