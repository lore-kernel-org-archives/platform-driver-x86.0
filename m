From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [RFC, PATCH v1] platform/x86: intel-vbtn: Convert to pure ACPI driver
Date: Wed, 07 Feb 2018 23:33:55 +0100
Message-ID: <6516358.IX2q0Oe07P@aspire.rjw.lan>
References: <20180131182614.19524-1-andriy.shevchenko@linux.intel.com> <4289605.mKSTaFlacu@aspire.rjw.lan> <20180207095522.qhs2wns4goif76u3@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cloudserver094114.home.pl ([79.96.170.134]:64540 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbeBGWfi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Feb 2018 17:35:38 -0500
In-Reply-To: <20180207095522.qhs2wns4goif76u3@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "Mario.Limonciello@dell.com" <Mario.Limonciello@dell.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "acelan.kao@canonical.com" <acelan.kao@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday, February 7, 2018 10:55:22 AM CET Pali Rohár wrote:
> On Wednesday 07 February 2018 10:47:57 Rafael J. Wysocki wrote:
> > BTW, please CC patches with ACPI material to linux-acpi.  They are less likely
> > to be overlooked by me then and the others on that list may have opinions on
> > them too.
> 
> Maybe we can update MAINTAINERS file for acpi based platform-x86 drivers
> to include linux-acpi list? Darren, Andy, any idea?

You could, but generally, if you have ACPI material in your patch,
CCing linux-acpi won't hurt.
